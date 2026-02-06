-------------------------------------------------------------------------------
-- Bank Alone Guides — Guides / Parser
-- Parses guide script format into Lua step tables
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser = BAG.Parser or {}

--- Register a guide (already in Lua table format) into the global registry.
-- This is the primary way guides are added — they define Lua tables directly.
-- @param key    Unique guide key, e.g. "Alliance_01_10_Elwynn"
-- @param guide  Table with { title, faction, levelRange, zone, steps }
function BAG.Parser:RegisterGuide(key, guide)
    if not key or not guide then
        BAG:Debug("Parser: Invalid guide registration attempt")
        return
    end

    -- Validate minimal fields
    guide.title      = guide.title or key
    guide.faction    = guide.faction or "Both"
    guide.levelRange = guide.levelRange or { 1, 70 }
    guide.steps      = guide.steps or {}
    guide.zone       = guide.zone or nil

    BAG.Guides.Registry[key] = guide
    BAG:Debug("Parser: Registered guide '" .. key .. "' with " .. #guide.steps .. " steps")
end

--- Parse a text-format guide script into a table.
-- Format:
--   # Title Line
--   step
--   .goto zone,x,y |text
--   .accept questID |questName
--   .turnin questID |questName
--   .kill target |note
--   .collect itemID,count |itemName
--   .train skillName
--   .vendor |note
--   .buy itemID,count |itemName
--   .use itemID |note
--   .equip itemID |note
--   .hs |note
--   .fly zone |note
--   .fp |note
--   .note text
--   .class ClassName
--   .race RaceName
--   .profession ProfName,skillLevel
-- @param scriptText  The raw guide script as a string.
-- @param defaults    Optional defaults table { faction, levelRange, zone }.
-- @return guide table
function BAG.Parser:ParseScript(scriptText, defaults)
    defaults = defaults or {}

    local guide = {
        title      = defaults.title or "Untitled Guide",
        faction    = defaults.faction or "Both",
        levelRange = defaults.levelRange or { 1, 70 },
        zone       = defaults.zone or nil,
        steps      = {},
    }

    local currentStep = nil
    local pendingConditions = {}

    for line in scriptText:gmatch("[^\r\n]+") do
        line = BAG.Utils:Trim(line)

        -- Skip empty lines and comments
        if line == "" or line:sub(1, 2) == "--" then
            -- skip

        -- Title
        elseif line:sub(1, 1) == "#" then
            guide.title = BAG.Utils:Trim(line:sub(2))

        -- New step marker
        elseif line:lower() == "step" then
            -- Save previous step
            if currentStep then
                guide.steps[#guide.steps + 1] = currentStep
            end
            currentStep = { type = "note", text = "" }

            -- Apply pending conditions
            if #pendingConditions > 0 then
                currentStep.conditions = BAG.Utils:DeepCopy(pendingConditions)
                pendingConditions = {}
            end

        -- Directives (start with .)
        elseif line:sub(1, 1) == "." and currentStep then
            self:ParseDirective(line, currentStep, pendingConditions)

        -- Condition lines before a step
        elseif line:sub(1, 1) == "." then
            self:ParseConditionLine(line, pendingConditions)
        end
    end

    -- Don't forget the last step
    if currentStep then
        guide.steps[#guide.steps + 1] = currentStep
    end

    return guide
end

--- Parse a directive line and apply it to the current step.
function BAG.Parser:ParseDirective(line, step, conditions)
    -- Split off the comment/text after |
    local directive, extra = line:match("^(.-)|(.*)$")
    if not directive then
        directive = line
        extra = nil
    end
    directive = BAG.Utils:Trim(directive)
    extra = extra and BAG.Utils:Trim(extra) or nil

    -- Extract the command and arguments
    local cmd, args = directive:match("^%.(%w+)%s*(.*)")
    if not cmd then return end
    cmd = cmd:lower()
    args = BAG.Utils:Trim(args or "")

    -- ── .goto zone,x,y ───────────────────────────────────────────────
    if cmd == "goto" then
        step.type = "goto"
        local parts = BAG.Utils:Split(args)
        if #parts >= 3 then
            step.zone = parts[1]
            step.x = tonumber(parts[2]) or 0
            step.y = tonumber(parts[3]) or 0
        elseif #parts == 1 then
            step.zone = parts[1]
        end
        if extra then step.text = extra end

    -- ── .accept questID ──────────────────────────────────────────────
    elseif cmd == "accept" then
        step.type = "accept"
        step.questID = tonumber(args)
        step.questName = extra or (step.questID and BAG.Data.Quests:GetName(step.questID)) or ""
        if step.questName == "" then step.questName = "Quest #" .. tostring(step.questID) end

    -- ── .turnin questID ──────────────────────────────────────────────
    elseif cmd == "turnin" then
        step.type = "turnin"
        step.questID = tonumber(args)
        step.questName = extra or (step.questID and BAG.Data.Quests:GetName(step.questID)) or ""

    -- ── .kill target ─────────────────────────────────────────────────
    elseif cmd == "kill" then
        step.type = "kill"
        step.target = args
        if extra then step.text = extra end

    -- ── .collect itemID,count ────────────────────────────────────────
    elseif cmd == "collect" then
        step.type = "collect"
        local parts = BAG.Utils:Split(args)
        step.itemID = tonumber(parts[1])
        step.count = tonumber(parts[2]) or 1
        step.itemName = extra or (step.itemID and BAG.Data.Items:GetName(step.itemID)) or ""

    -- ── .train skillName ─────────────────────────────────────────────
    elseif cmd == "train" then
        step.type = "train"
        step.skill = args
        if extra then step.text = extra end

    -- ── .vendor ──────────────────────────────────────────────────────
    elseif cmd == "vendor" then
        step.type = "vendor"
        step.text = extra or args or ""

    -- ── .buy itemID,count ────────────────────────────────────────────
    elseif cmd == "buy" then
        step.type = "buy"
        local parts = BAG.Utils:Split(args)
        step.itemID = tonumber(parts[1])
        step.count = tonumber(parts[2]) or 1
        step.itemName = extra or ""

    -- ── .use itemID ──────────────────────────────────────────────────
    elseif cmd == "use" then
        step.type = "use"
        step.itemID = tonumber(args)
        step.text = extra or ""

    -- ── .equip itemID ────────────────────────────────────────────────
    elseif cmd == "equip" then
        step.type = "equip"
        step.itemID = tonumber(args)
        step.text = extra or ""

    -- ── .hs ──────────────────────────────────────────────────────────
    elseif cmd == "hs" then
        step.type = "hs"
        step.text = extra or "Use your Hearthstone"

    -- ── .fly zone ────────────────────────────────────────────────────
    elseif cmd == "fly" then
        step.type = "fly"
        step.destination = args
        step.text = extra or ""

    -- ── .fp ──────────────────────────────────────────────────────────
    elseif cmd == "fp" then
        step.type = "fp"
        step.text = extra or "Discover the flight path here"
        if args ~= "" then step.zone = args end

    -- ── .boat from to ────────────────────────────────────────────────
    elseif cmd == "boat" then
        step.type = "boat"
        local parts = BAG.Utils:Split(args)
        step.from = parts[1] or ""
        step.to = parts[2] or ""
        step.text = extra or ""

    -- ── .zeppelin from to ────────────────────────────────────────────
    elseif cmd == "zeppelin" then
        step.type = "zeppelin"
        local parts = BAG.Utils:Split(args)
        step.from = parts[1] or ""
        step.to = parts[2] or ""
        step.text = extra or ""

    -- ── .note text ───────────────────────────────────────────────────
    elseif cmd == "note" then
        step.type = "note"
        step.text = args
        if extra then step.text = step.text .. " " .. extra end

    -- ── Condition directives ─────────────────────────────────────────
    elseif cmd == "class" then
        if not step.conditions then step.conditions = {} end
        step.conditions[#step.conditions + 1] = { type = "class", value = args }

    elseif cmd == "race" then
        if not step.conditions then step.conditions = {} end
        step.conditions[#step.conditions + 1] = { type = "race", value = args }

    elseif cmd == "profession" then
        if not step.conditions then step.conditions = {} end
        local parts = BAG.Utils:Split(args)
        step.conditions[#step.conditions + 1] = {
            type = "profession",
            name = parts[1] or "",
            skill = tonumber(parts[2]) or 0,
        }

    -- ── .run, .mount ─────────────────────────────────────────────────
    elseif cmd == "run" or cmd == "mount" then
        step.type = cmd
        if args ~= "" then
            local parts = BAG.Utils:Split(args)
            if #parts >= 3 then
                step.zone = parts[1]
                step.x = tonumber(parts[2]) or 0
                step.y = tonumber(parts[3]) or 0
            end
        end
        if extra then step.text = extra end
    end
end

--- Parse a condition line that appears before a step.
function BAG.Parser:ParseConditionLine(line, conditions)
    local cmd, args = line:match("^%.(%w+)%s*(.*)")
    if not cmd then return end
    cmd = cmd:lower()
    args = BAG.Utils:Trim(args or "")

    if cmd == "class" then
        conditions[#conditions + 1] = { type = "class", value = args }
    elseif cmd == "race" then
        conditions[#conditions + 1] = { type = "race", value = args }
    elseif cmd == "profession" then
        local parts = BAG.Utils:Split(args)
        conditions[#conditions + 1] = {
            type = "profession",
            name = parts[1] or "",
            skill = tonumber(parts[2]) or 0,
        }
    end
end
