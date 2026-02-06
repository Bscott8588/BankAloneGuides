--[[
    Bank Alone Guides - Guide Parser
    SCS / Bank Alone Guides
    
    Parses human-readable guide script format into Lua tables.
    
    Supported directives:
      # Title
      step
      .goto zone,x,y
      .accept questID
      .turnin questID
      .complete questID
      .kill mobName or mobID
      .collect itemID,count
      .train skillName
      .vendor
      .buy itemID,count
      .use itemID
      .equip itemID
      .hs
      .fly zone
      .fp
      .boat destination
      .zeppelin destination
      .run destination
      .mount
      .note text
      .class className
      .race raceName
      .profession profName,level
      .level targetLevel
]]

local BAG = BankAlone

BAG.Parser = BAG.Parser or {}
local Parser = BAG.Parser

-- Parse a guide script string into a guide table
function Parser:Parse(scriptText, metadata)
    local guide = {
        title = metadata and metadata.title or "Untitled Guide",
        faction = metadata and metadata.faction or "Both",
        levelRange = metadata and metadata.levelRange or {1, 70},
        category = metadata and metadata.category or "Leveling",
        nextGuide = metadata and metadata.nextGuide or nil,
        steps = {},
    }

    local currentStep = nil
    local lines = { strsplit("\n", scriptText) }

    for _, line in ipairs(lines) do
        line = BAG.Utils:Trim(line)

        if line == "" or line:sub(1, 2) == "--" then
            -- Skip empty lines and comments

        elseif line:sub(1, 1) == "#" then
            -- Title line
            guide.title = BAG.Utils:Trim(line:sub(2))

        elseif line:lower() == "step" then
            -- New step marker - finalize previous step if any
            if currentStep then
                guide.steps[#guide.steps + 1] = currentStep
            end
            currentStep = {
                type = "note",
                text = "",
                conditions = {},
            }

        elseif line:sub(1, 1) == "." then
            -- Directive
            if not currentStep then
                currentStep = { type = "note", text = "", conditions = {} }
            end
            self:ParseDirective(currentStep, line)
        else
            -- Plain text (step description)
            if currentStep then
                if currentStep.text and currentStep.text ~= "" then
                    currentStep.text = currentStep.text .. " " .. line
                else
                    currentStep.text = line
                end
            end
        end
    end

    -- Don't forget the last step
    if currentStep then
        guide.steps[#guide.steps + 1] = currentStep
    end

    return guide
end

-- Parse a single directive line and apply it to the current step
function Parser:ParseDirective(step, line)
    -- Remove the leading dot
    local directive = line:sub(2)
    local cmd, args = directive:match("^(%S+)%s*(.*)")
    cmd = cmd and cmd:lower() or ""
    args = args or ""

    if cmd == "goto" then
        step.type = "goto"
        local parts = BAG.Utils:Split(args, ",")
        if #parts >= 3 then
            step.zone = parts[1]
            step.x = tonumber(parts[2])
            step.y = tonumber(parts[3])
        elseif #parts == 1 then
            step.zone = parts[1]
        end
        if not step.text or step.text == "" then
            step.text = "Travel to " .. (step.zone or "destination")
            if step.x and step.y then
                step.text = step.text .. string.format(" (%.1f, %.1f)", step.x, step.y)
            end
        end

    elseif cmd == "accept" then
        step.type = "accept"
        step.questID = tonumber(args)
        if not step.text or step.text == "" then
            local qName = BAG.Data.Quests[step.questID] and BAG.Data.Quests[step.questID].name or ("Quest #" .. args)
            step.text = "Accept: " .. qName
        end

    elseif cmd == "turnin" then
        step.type = "turnin"
        step.questID = tonumber(args)
        if not step.text or step.text == "" then
            local qName = BAG.Data.Quests[step.questID] and BAG.Data.Quests[step.questID].name or ("Quest #" .. args)
            step.text = "Turn in: " .. qName
        end

    elseif cmd == "complete" then
        step.type = "complete"
        step.questID = tonumber(args)
        if not step.text or step.text == "" then
            local qName = BAG.Data.Quests[step.questID] and BAG.Data.Quests[step.questID].name or ("Quest #" .. args)
            step.text = "Complete: " .. qName
        end

    elseif cmd == "kill" then
        step.type = "kill"
        step.target = args
        -- Check if args is a number (mob ID) or name
        local mobID = tonumber(args)
        if mobID then
            step.mobID = mobID
            if BAG.Data.NPCs[mobID] then
                step.target = BAG.Data.NPCs[mobID].name
            end
        end
        if not step.text or step.text == "" then
            step.text = "Kill: " .. (step.target or "enemies")
        end

    elseif cmd == "collect" then
        step.type = "collect"
        local parts = BAG.Utils:Split(args, ",")
        step.itemID = tonumber(parts[1])
        step.count = tonumber(parts[2]) or 1
        if not step.text or step.text == "" then
            local iName = BAG.Data.Items[step.itemID] and BAG.Data.Items[step.itemID].name or ("Item #" .. (parts[1] or "?"))
            step.text = "Collect " .. step.count .. "x " .. iName
        end

    elseif cmd == "train" then
        step.type = "train"
        step.skill = args
        if not step.text or step.text == "" then
            step.text = "Train: " .. args
        end

    elseif cmd == "vendor" then
        step.type = "vendor"
        if not step.text or step.text == "" then
            step.text = "Visit vendor"
        end

    elseif cmd == "buy" then
        step.type = "buy"
        local parts = BAG.Utils:Split(args, ",")
        step.itemID = tonumber(parts[1])
        step.count = tonumber(parts[2]) or 1
        if not step.text or step.text == "" then
            local iName = BAG.Data.Items[step.itemID] and BAG.Data.Items[step.itemID].name or ("Item #" .. (parts[1] or "?"))
            step.text = "Buy " .. step.count .. "x " .. iName
        end

    elseif cmd == "use" then
        step.type = "use"
        step.itemID = tonumber(args)
        if not step.text or step.text == "" then
            local iName = BAG.Data.Items[step.itemID] and BAG.Data.Items[step.itemID].name or ("Item #" .. args)
            step.text = "Use: " .. iName
        end

    elseif cmd == "equip" then
        step.type = "equip"
        step.itemID = tonumber(args)
        if not step.text or step.text == "" then
            local iName = BAG.Data.Items[step.itemID] and BAG.Data.Items[step.itemID].name or ("Item #" .. args)
            step.text = "Equip: " .. iName
        end

    elseif cmd == "hs" then
        step.type = "hearth"
        if not step.text or step.text == "" then
            step.text = "Use your Hearthstone"
        end

    elseif cmd == "fly" then
        step.type = "fly"
        step.zone = args
        if not step.text or step.text == "" then
            step.text = "Fly to " .. args
        end

    elseif cmd == "fp" then
        step.type = "flightpath"
        if not step.text or step.text == "" then
            step.text = "Discover the flight path here"
        end

    elseif cmd == "boat" then
        step.type = "boat"
        step.destination = args
        if not step.text or step.text == "" then
            step.text = "Take the boat to " .. args
        end

    elseif cmd == "zeppelin" then
        step.type = "zeppelin"
        step.destination = args
        if not step.text or step.text == "" then
            step.text = "Take the zeppelin to " .. args
        end

    elseif cmd == "run" then
        step.type = "goto"
        if not step.text or step.text == "" then
            step.text = "Run to " .. args
        end

    elseif cmd == "mount" then
        step.type = "goto"
        if not step.text or step.text == "" then
            step.text = "Mount up and ride to " .. args
        end

    elseif cmd == "note" then
        step.type = "note"
        if not step.text or step.text == "" then
            step.text = args
        else
            step.text = step.text .. " " .. args
        end

    elseif cmd == "level" then
        step.type = "level"
        step.targetLevel = tonumber(args)
        if not step.text or step.text == "" then
            step.text = "Reach level " .. args
        end

    elseif cmd == "class" then
        step.conditions = step.conditions or {}
        step.conditions[#step.conditions + 1] = { type = "class", class = args }

    elseif cmd == "race" then
        step.conditions = step.conditions or {}
        step.conditions[#step.conditions + 1] = { type = "race", race = args }

    elseif cmd == "profession" then
        step.conditions = step.conditions or {}
        local parts = BAG.Utils:Split(args, ",")
        step.conditions[#step.conditions + 1] = {
            type = "profession",
            profession = parts[1],
            skillLevel = tonumber(parts[2]),
        }
    end
end

-- Register a guide from script format
function Parser:RegisterGuide(key, scriptText, metadata)
    local guide = self:Parse(scriptText, metadata)
    BAG.Guides[key] = guide
    BAG:Debug("Registered guide:", key, "Steps:", #guide.steps)
    return guide
end

-- Register a guide from a pre-built Lua table
function Parser:RegisterGuideTable(key, guideTable)
    BAG.Guides[key] = guideTable
    BAG:Debug("Registered guide table:", key, "Steps:", guideTable.steps and #guideTable.steps or 0)
end
