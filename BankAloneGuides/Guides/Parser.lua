--[[
    Bank Alone Guides - Guide Parser
    Parses human-readable guide scripts into Lua tables
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Parse a guide script into a guide table
function BAG.Parser:Parse(guideScript)
    if not guideScript then
        BAG.Logo:PrintError("No guide script provided")
        return nil
    end
    
    local guide = {
        id = nil,
        title = "Untitled Guide",
        faction = "Both",
        levelRange = {min = 1, max = 70},
        steps = {}
    }
    
    local lines = self:SplitIntoLines(guideScript)
    local currentStep = nil
    
    for lineNum, line in ipairs(lines) do
        line = BAG.Utils:Trim(line)
        
        -- Skip empty lines and comments
        if line ~= "" and not string.match(line, "^//") then
            -- Parse guide metadata
            if string.match(line, "^##%s*id:") then
                guide.id = BAG.Utils:Trim(string.match(line, "^##%s*id:%s*(.+)"))
            elseif string.match(line, "^##%s*title:") then
                guide.title = BAG.Utils:Trim(string.match(line, "^##%s*title:%s*(.+)"))
            elseif string.match(line, "^##%s*faction:") then
                guide.faction = BAG.Utils:Trim(string.match(line, "^##%s*faction:%s*(.+)"))
            elseif string.match(line, "^##%s*level:") then
                local levelRange = BAG.Utils:Trim(string.match(line, "^##%s*level:%s*(.+)"))
                local min, max = string.match(levelRange, "(%d+)-(%d+)")
                if min and max then
                    guide.levelRange = {min = tonumber(min), max = tonumber(max)}
                end
            -- Parse step
            elseif string.match(line, "^step") then
                -- Save previous step
                if currentStep then
                    table.insert(guide.steps, currentStep)
                end
                
                -- Create new step
                currentStep = {
                    type = "goto",
                    text = "",
                    conditions = {}
                }
            -- Parse step directives
            elseif currentStep and string.match(line, "^%.") then
                self:ParseDirective(line, currentStep)
            -- Regular text (step description)
            elseif currentStep then
                if currentStep.text == "" then
                    currentStep.text = line
                else
                    currentStep.text = currentStep.text .. " " .. line
                end
            end
        end
    end
    
    -- Save last step
    if currentStep then
        table.insert(guide.steps, currentStep)
    end
    
    -- Validate guide
    if not guide.id then
        BAG.Logo:PrintError("Guide missing ID")
        return nil
    end
    
    if #guide.steps == 0 then
        BAG.Logo:PrintError("Guide has no steps")
        return nil
    end
    
    return guide
end

-- Parse a directive line
function BAG.Parser:ParseDirective(line, step)
    local directive, args = string.match(line, "^%.(%w+)%s*(.*)")
    
    if not directive then
        return
    end
    
    directive = string.lower(directive)
    
    -- Travel directives
    if directive == "goto" then
        step.type = "goto"
        local zone, coords = string.match(args, "([^,]+),?%s*(.*)") 
        if zone then
            step.zone = BAG.Utils:Trim(zone)
        end
        if coords and coords ~= "" then
            local x, y = BAG.MapAPI:ParseCoords(coords)
            if x and y then
                step.x = x
                step.y = y
            end
        end
    elseif directive == "fly" then
        step.type = "fly"
        step.destination = BAG.Utils:Trim(args)
    elseif directive == "fp" then
        step.type = "fp"
        step.location = BAG.Utils:Trim(args)
    elseif directive == "hs" then
        step.type = "hs"
    elseif directive == "boat" then
        step.type = "boat"
        local from, to = string.match(args, "([^,]+),%s*(.+)")
        if from then step.from = BAG.Utils:Trim(from) end
        if to then step.to = BAG.Utils:Trim(to) end
    elseif directive == "zeppelin" then
        step.type = "zeppelin"
        local from, to = string.match(args, "([^,]+),%s*(.+)")
        if from then step.from = BAG.Utils:Trim(from) end
        if to then step.to = BAG.Utils:Trim(to) end
    elseif directive == "run" then
        step.type = "run"
        step.destination = BAG.Utils:Trim(args)
    elseif directive == "mount" then
        step.type = "mount"
    
    -- Quest directives
    elseif directive == "accept" then
        step.type = "accept"
        step.questID = tonumber(args)
    elseif directive == "turnin" then
        step.type = "turnin"
        step.questID = tonumber(args)
    elseif directive == "kill" then
        step.type = "kill"
        local questID, mobName = string.match(args, "(%d+)%s*(.*)") 
        step.questID = tonumber(questID)
        if mobName and mobName ~= "" then
            step.mobName = BAG.Utils:Trim(mobName)
        end
    elseif directive == "collect" then
        step.type = "collect"
        local itemID, count = string.match(args, "(%d+),?%s*(%d*)")
        step.itemID = tonumber(itemID)
        step.count = tonumber(count) or 1
    
    -- Training directives
    elseif directive == "train" then
        step.type = "train"
        step.skillName = BAG.Utils:Trim(args)
    
    -- Vendor directives
    elseif directive == "vendor" then
        step.type = "vendor"
    elseif directive == "buy" then
        step.type = "buy"
        local itemID, count = string.match(args, "(%d+),?%s*(%d*)")
        step.itemID = tonumber(itemID)
        step.count = tonumber(count) or 1
    elseif directive == "use" then
        step.type = "use"
        step.itemID = tonumber(args)
    elseif directive == "equip" then
        step.type = "equip"
        step.itemID = tonumber(args)
    
    -- Note directive
    elseif directive == "note" then
        step.note = BAG.Utils:Trim(args)
    
    -- Condition directives
    elseif directive == "class" then
        step.conditions.class = self:ParseList(args)
    elseif directive == "race" then
        step.conditions.race = self:ParseList(args)
    elseif directive == "faction" then
        step.conditions.faction = BAG.Utils:Trim(args)
    elseif directive == "level" then
        local min, max = string.match(args, "(%d+)-(%d+)")
        if min and max then
            step.conditions.level = {min = tonumber(min), max = tonumber(max)}
        else
            step.conditions.level = tonumber(args)
        end
    elseif directive == "profession" then
        local profName, skillLevel = string.match(args, "([^,]+),?%s*(%d*)")
        if profName then
            step.conditions.profession = {
                name = BAG.Utils:Trim(profName),
                skill = tonumber(skillLevel) or 0
            }
        end
    end
end

-- Parse a comma-separated list
function BAG.Parser:ParseList(str)
    if not str or str == "" then
        return {}
    end
    
    local list = {}
    for item in string.gmatch(str, "[^,]+") do
        table.insert(list, BAG.Utils:Trim(item))
    end
    
    if #list == 1 then
        return list[1]
    end
    
    return list
end

-- Split string into lines
function BAG.Parser:SplitIntoLines(str)
    local lines = {}
    for line in string.gmatch(str, "[^\r\n]+") do
        table.insert(lines, line)
    end
    return lines
end

-- Create a guide from a table (for programmatic guide creation)
function BAG.Parser:CreateGuide(guideData)
    local guide = {
        id = guideData.id or "custom_guide",
        title = guideData.title or "Custom Guide",
        faction = guideData.faction or "Both",
        levelRange = guideData.levelRange or {min = 1, max = 70},
        steps = guideData.steps or {}
    }
    
    return guide
end

-- Register a parsed guide with the engine
function BAG.Parser:RegisterGuide(guide)
    if not guide or not guide.id then
        BAG.Logo:PrintError("Invalid guide")
        return false
    end
    
    return BAG.Engine:RegisterGuide(guide)
end

-- Parse and register a guide script
function BAG.Parser:ParseAndRegister(guideScript)
    local guide = self:Parse(guideScript)
    
    if guide then
        return self:RegisterGuide(guide)
    end
    
    return false
end

-- Validate a guide
function BAG.Parser:Validate(guide)
    local errors = {}
    
    if not guide.id then
        table.insert(errors, "Missing guide ID")
    end
    
    if not guide.title then
        table.insert(errors, "Missing guide title")
    end
    
    if not guide.steps or #guide.steps == 0 then
        table.insert(errors, "No steps defined")
    end
    
    -- Validate steps
    for i, step in ipairs(guide.steps) do
        if not step.type then
            table.insert(errors, "Step " .. i .. ": Missing step type")
        end
        
        if step.type == "goto" and not step.zone then
            table.insert(errors, "Step " .. i .. ": goto requires zone")
        end
        
        if (step.type == "accept" or step.type == "turnin") and not step.questID then
            table.insert(errors, "Step " .. i .. ": " .. step.type .. " requires questID")
        end
        
        if step.type == "collect" and not step.itemID then
            table.insert(errors, "Step " .. i .. ": collect requires itemID")
        end
    end
    
    return #errors == 0, errors
end

print("|cff00B3FF[Bank Alone Guides]|r Guide Parser loaded")
