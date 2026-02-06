--[[
    Bank Alone Guides - Condition System
    Evaluates step conditions (level, class, race, quests, etc.)
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Conditions = {}

-- Check if a step's conditions are met
function BAG.Conditions:Check(step)
    if not step then return false end
    
    -- If no conditions, always true
    if not step.conditions or BAG.Utils:TableSize(step.conditions) == 0 then
        return true
    end
    
    -- Check each condition type
    for condType, condValue in pairs(step.conditions) do
        if not self:CheckCondition(condType, condValue) then
            BAG:DebugPrint("Condition failed:", condType, condValue)
            return false
        end
    end
    
    return true
end

-- Check a specific condition
function BAG.Conditions:CheckCondition(condType, condValue)
    local handler = self.Handlers[condType]
    if not handler then
        BAG:DebugPrint("Unknown condition type:", condType)
        return true -- Unknown conditions pass by default
    end
    
    return handler(condValue)
end

-- Condition handlers
BAG.Conditions.Handlers = {
    -- Level conditions
    level = function(value)
        local playerLevel = BAG.PlayerAPI:GetLevel()
        
        if type(value) == "number" then
            return playerLevel >= value
        elseif type(value) == "string" then
            -- Support ranges like "10-20" or comparisons like ">=15"
            if value:match("^(%d+)-(%d+)$") then
                local min, max = value:match("^(%d+)-(%d+)$")
                return playerLevel >= tonumber(min) and playerLevel <= tonumber(max)
            elseif value:match("^>=(%d+)$") then
                local min = value:match("^>=(%d+)$")
                return playerLevel >= tonumber(min)
            elseif value:match("^<=(%d+)$") then
                local max = value:match("^<=(%d+)$")
                return playerLevel <= tonumber(max)
            elseif value:match("^>(%d+)$") then
                local min = value:match("^>(%d+)$")
                return playerLevel > tonumber(min)
            elseif value:match("^<(%d+)$") then
                local max = value:match("^<(%d+)$")
                return playerLevel < tonumber(max)
            end
        end
        
        return true
    end,
    
    -- Class condition
    class = function(value)
        local playerClass = BAG.PlayerAPI:GetClass()
        
        if type(value) == "string" then
            return playerClass:upper() == value:upper()
        elseif type(value) == "table" then
            for _, class in ipairs(value) do
                if playerClass:upper() == class:upper() then
                    return true
                end
            end
            return false
        end
        
        return true
    end,
    
    -- Race condition
    race = function(value)
        local playerRace = BAG.PlayerAPI:GetRace()
        
        if type(value) == "string" then
            return playerRace:upper() == value:upper()
        elseif type(value) == "table" then
            for _, race in ipairs(value) do
                if playerRace:upper() == race:upper() then
                    return true
                end
            end
            return false
        end
        
        return true
    end,
    
    -- Faction condition
    faction = function(value)
        local playerFaction = BAG.PlayerAPI:GetFaction()
        return playerFaction:upper() == value:upper()
    end,
    
    -- Quest active condition
    questactive = function(questID)
        return BAG.QuestAPI:IsQuestActive(questID)
    end,
    
    -- Quest complete condition
    questcomplete = function(questID)
        return BAG.QuestAPI:IsQuestComplete(questID)
    end,
    
    -- Quest turned in (finished) condition
    questdone = function(questID)
        return BAG.QuestAPI:IsQuestFinished(questID)
    end,
    
    -- Item count condition
    itemcount = function(value)
        local itemID, count
        
        if type(value) == "table" then
            itemID = value[1] or value.itemID
            count = value[2] or value.count or 1
        elseif type(value) == "string" then
            itemID, count = value:match("(%d+),(%d+)")
            itemID = tonumber(itemID)
            count = tonumber(count) or 1
        else
            itemID = value
            count = 1
        end
        
        local playerCount = BAG.InventoryAPI:CountItem(itemID)
        return playerCount >= count
    end,
    
    -- Has item condition
    hasitem = function(itemID)
        return BAG.InventoryAPI:HasItem(itemID)
    end,
    
    -- Zone condition
    zone = function(value)
        local currentZone = BAG.ZoneDetection:GetCurrentZone()
        
        if type(value) == "string" then
            return currentZone:upper() == value:upper()
        elseif type(value) == "table" then
            for _, zone in ipairs(value) do
                if currentZone:upper() == zone:upper() then
                    return true
                end
            end
            return false
        end
        
        return true
    end,
    
    -- Subzone condition
    subzone = function(value)
        local currentSubzone = GetSubZoneText()
        return currentSubzone:upper() == value:upper()
    end,
    
    -- Profession condition
    profession = function(value)
        local profName, minSkill
        
        if type(value) == "table" then
            profName = value[1] or value.name
            minSkill = value[2] or value.skill or 0
        elseif type(value) == "string" then
            profName, minSkill = value:match("([%w%s]+),(%d+)")
            if not profName then
                profName = value
                minSkill = 0
            else
                minSkill = tonumber(minSkill) or 0
            end
        else
            return false
        end
        
        local skill = BAG.PlayerAPI:GetProfessionSkill(profName)
        return skill >= minSkill
    end,
    
    -- Has profession condition
    hasprofession = function(profName)
        local skill = BAG.PlayerAPI:GetProfessionSkill(profName)
        return skill > 0
    end,
    
    -- Spell known condition
    hasspell = function(spellID)
        return BAG.SpellAPI:HasSpell(spellID)
    end,
    
    -- Money condition (in copper)
    money = function(copper)
        local playerMoney = GetMoney()
        return playerMoney >= copper
    end,
    
    -- Group condition
    ingroup = function(value)
        local inGroup = GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0
        return value == inGroup
    end,
    
    -- Combat condition
    incombat = function(value)
        return value == InCombatLockdown()
    end,
}

-- Get unmet conditions for a step (for display purposes)
function BAG.Conditions:GetUnmetConditions(step)
    if not step or not step.conditions then
        return {}
    end
    
    local unmet = {}
    for condType, condValue in pairs(step.conditions) do
        if not self:CheckCondition(condType, condValue) then
            table.insert(unmet, {type = condType, value = condValue})
        end
    end
    
    return unmet
end

-- Format condition for display
function BAG.Conditions:FormatCondition(condType, condValue)
    if condType == "level" then
        return "Level " .. tostring(condValue)
    elseif condType == "class" then
        return "Class: " .. tostring(condValue)
    elseif condType == "race" then
        return "Race: " .. tostring(condValue)
    elseif condType == "faction" then
        return "Faction: " .. tostring(condValue)
    elseif condType == "questactive" then
        return "Quest Active: " .. tostring(condValue)
    elseif condType == "questcomplete" then
        return "Quest Complete: " .. tostring(condValue)
    elseif condType == "zone" then
        return "Zone: " .. tostring(condValue)
    elseif condType == "profession" then
        return "Profession: " .. tostring(condValue)
    else
        return condType .. ": " .. tostring(condValue)
    end
end
