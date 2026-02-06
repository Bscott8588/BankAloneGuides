--[[
    Bank Alone Guides - Conditions System
    Evaluates step conditions (level, quest, class, race, profession, etc.)
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Condition evaluators
local conditionEvaluators = {}

-- Register a condition evaluator
function BAG.Conditions:RegisterEvaluator(name, func)
    conditionEvaluators[name] = func
end

-- Check if a step's conditions are met
function BAG.Conditions:Check(step)
    if not step then
        return false
    end
    
    -- If no conditions, step is always available
    if not step.conditions or BAG.Utils:TableSize(step.conditions) == 0 then
        return true
    end
    
    -- Evaluate all conditions
    for conditionType, conditionValue in pairs(step.conditions) do
        local evaluator = conditionEvaluators[conditionType]
        
        if evaluator then
            if not evaluator(conditionValue) then
                return false
            end
        else
            BAG:Debug("Unknown condition type: " .. tostring(conditionType))
        end
    end
    
    return true
end

-- Check multiple conditions at once
function BAG.Conditions:CheckMultiple(conditions)
    if not conditions then
        return true
    end
    
    for conditionType, conditionValue in pairs(conditions) do
        local evaluator = conditionEvaluators[conditionType]
        
        if evaluator then
            if not evaluator(conditionValue) then
                return false
            end
        end
    end
    
    return true
end

-- Get failed conditions for a step
function BAG.Conditions:GetFailedConditions(step)
    if not step or not step.conditions then
        return {}
    end
    
    local failed = {}
    
    for conditionType, conditionValue in pairs(step.conditions) do
        local evaluator = conditionEvaluators[conditionType]
        
        if evaluator then
            if not evaluator(conditionValue) then
                table.insert(failed, {
                    type = conditionType,
                    value = conditionValue
                })
            end
        end
    end
    
    return failed
end

-- Register built-in condition evaluators

-- Level conditions
BAG.Conditions:RegisterEvaluator("level", function(value)
    local playerLevel = UnitLevel("player")
    
    if type(value) == "number" then
        return playerLevel >= value
    elseif type(value) == "table" then
        local min = value.min or 1
        local max = value.max or 70
        return playerLevel >= min and playerLevel <= max
    end
    
    return false
end)

BAG.Conditions:RegisterEvaluator("minlevel", function(value)
    return UnitLevel("player") >= value
end)

BAG.Conditions:RegisterEvaluator("maxlevel", function(value)
    return UnitLevel("player") <= value
end)

-- Class conditions
BAG.Conditions:RegisterEvaluator("class", function(value)
    local _, classFile = UnitClass("player")
    
    if type(value) == "string" then
        return string.upper(classFile) == string.upper(value)
    elseif type(value) == "table" then
        for _, class in ipairs(value) do
            if string.upper(classFile) == string.upper(class) then
                return true
            end
        end
        return false
    end
    
    return false
end)

-- Race conditions
BAG.Conditions:RegisterEvaluator("race", function(value)
    local _, raceFile = UnitRace("player")
    
    if type(value) == "string" then
        return string.upper(raceFile) == string.upper(value)
    elseif type(value) == "table" then
        for _, race in ipairs(value) do
            if string.upper(raceFile) == string.upper(race) then
                return true
            end
        end
        return false
    end
    
    return false
end)

-- Faction conditions
BAG.Conditions:RegisterEvaluator("faction", function(value)
    local faction = UnitFactionGroup("player")
    return string.upper(faction) == string.upper(value)
end)

-- Quest conditions
BAG.Conditions:RegisterEvaluator("questactive", function(questID)
    return BAG.QuestAPI:IsQuestActive(questID)
end)

BAG.Conditions:RegisterEvaluator("questcomplete", function(questID)
    return BAG.QuestAPI:IsQuestComplete(questID)
end)

BAG.Conditions:RegisterEvaluator("questturnedin", function(questID)
    return BAG.QuestAPI:IsQuestTurnedIn(questID)
end)

BAG.Conditions:RegisterEvaluator("questobjective", function(value)
    if type(value) ~= "table" then
        return false
    end
    
    local questID = value.questID
    local objectiveIndex = value.index
    
    return BAG.QuestAPI:IsObjectiveComplete(questID, objectiveIndex)
end)

-- Item conditions
BAG.Conditions:RegisterEvaluator("hasitem", function(itemID)
    return BAG.InventoryAPI:HasItem(itemID)
end)

BAG.Conditions:RegisterEvaluator("itemcount", function(value)
    if type(value) ~= "table" then
        return false
    end
    
    local itemID = value.itemID or value.id
    local count = value.count or 1
    local operator = value.operator or ">="
    
    local actualCount = BAG.InventoryAPI:GetItemCount(itemID)
    
    if operator == ">=" then
        return actualCount >= count
    elseif operator == ">" then
        return actualCount > count
    elseif operator == "==" or operator == "=" then
        return actualCount == count
    elseif operator == "<" then
        return actualCount < count
    elseif operator == "<=" then
        return actualCount <= count
    end
    
    return false
end)

-- Profession conditions
BAG.Conditions:RegisterEvaluator("profession", function(value)
    if type(value) == "string" then
        return BAG.PlayerAPI:HasProfession(value)
    elseif type(value) == "table" then
        local profName = value.name
        local skillLevel = value.skill or 0
        
        local hasProfession, currentSkill = BAG.PlayerAPI:GetProfessionSkill(profName)
        if not hasProfession then
            return false
        end
        
        return currentSkill >= skillLevel
    end
    
    return false
end)

-- Zone conditions
BAG.Conditions:RegisterEvaluator("zone", function(value)
    local currentZone = BAG.MapAPI:GetCurrentZone()
    
    if type(value) == "string" then
        return string.upper(currentZone) == string.upper(value)
    elseif type(value) == "table" then
        for _, zone in ipairs(value) do
            if string.upper(currentZone) == string.upper(zone) then
                return true
            end
        end
        return false
    end
    
    return false
end)

BAG.Conditions:RegisterEvaluator("subzone", function(value)
    local subzone = GetSubZoneText()
    
    if type(value) == "string" then
        return string.upper(subzone) == string.upper(value)
    elseif type(value) == "table" then
        for _, sz in ipairs(value) do
            if string.upper(subzone) == string.upper(sz) then
                return true
            end
        end
        return false
    end
    
    return false
end)

-- Money conditions
BAG.Conditions:RegisterEvaluator("money", function(value)
    local money = GetMoney()
    
    if type(value) == "number" then
        return money >= value
    elseif type(value) == "table" then
        local amount = value.amount or 0
        local operator = value.operator or ">="
        
        if operator == ">=" then
            return money >= amount
        elseif operator == ">" then
            return money > amount
        elseif operator == "==" or operator == "=" then
            return money == amount
        elseif operator == "<" then
            return money < amount
        elseif operator == "<=" then
            return money <= amount
        end
    end
    
    return false
end)

-- Spell/ability conditions
BAG.Conditions:RegisterEvaluator("hasspell", function(value)
    if type(value) == "string" then
        return BAG.SpellAPI:HasSpell(value)
    elseif type(value) == "number" then
        return BAG.SpellAPI:HasSpell(value)
    end
    
    return false
end)

-- Skill conditions
BAG.Conditions:RegisterEvaluator("skill", function(value)
    if type(value) ~= "table" then
        return false
    end
    
    local skillName = value.name
    local skillLevel = value.level or 0
    
    local currentLevel = BAG.PlayerAPI:GetSkillLevel(skillName)
    return currentLevel >= skillLevel
end)

-- Time-based conditions
BAG.Conditions:RegisterEvaluator("time", function(value)
    if type(value) ~= "table" then
        return true
    end
    
    local hour = tonumber(date("%H"))
    local minHour = value.min or 0
    local maxHour = value.max or 23
    
    return hour >= minHour and hour <= maxHour
end)

-- Custom condition (evaluates Lua expression)
BAG.Conditions:RegisterEvaluator("custom", function(value)
    if type(value) == "function" then
        return value()
    elseif type(value) == "string" then
        local func, err = loadstring("return " .. value)
        if func then
            local success, result = pcall(func)
            return success and result
        end
    end
    
    return false
end)

-- Helper function to format condition text for display
function BAG.Conditions:FormatConditionText(conditionType, conditionValue)
    if conditionType == "level" then
        if type(conditionValue) == "number" then
            return "Level " .. conditionValue .. "+"
        elseif type(conditionValue) == "table" then
            return "Level " .. (conditionValue.min or 1) .. "-" .. (conditionValue.max or 70)
        end
    elseif conditionType == "class" then
        if type(conditionValue) == "string" then
            return conditionValue
        elseif type(conditionValue) == "table" then
            return table.concat(conditionValue, "/")
        end
    elseif conditionType == "race" then
        if type(conditionValue) == "string" then
            return conditionValue
        elseif type(conditionValue) == "table" then
            return table.concat(conditionValue, "/")
        end
    elseif conditionType == "profession" then
        if type(conditionValue) == "string" then
            return conditionValue
        elseif type(conditionValue) == "table" then
            return conditionValue.name .. " (" .. (conditionValue.skill or 0) .. ")"
        end
    end
    
    return tostring(conditionValue)
end

print("|cff00B3FF[Bank Alone Guides]|r Conditions system loaded")
