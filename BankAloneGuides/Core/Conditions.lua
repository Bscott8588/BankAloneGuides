--[[
    Bank Alone Guides - Condition System
    SCS / Bank Alone Guides
    
    Evaluates step conditions: level, quest state, class, race, profession, items, zone, etc.
]]

local BAG = BankAlone

BAG.Conditions = BAG.Conditions or {}
local Cond = BAG.Conditions

-- Check all conditions on a step; returns true if all are met (or no conditions exist)
function Cond:Check(step)
    if not step then return false end
    if not step.conditions or #step.conditions == 0 then
        return true
    end

    for _, condition in ipairs(step.conditions) do
        if not self:Evaluate(condition) then
            return false
        end
    end
    return true
end

-- Check if a step's completion conditions are met
function Cond:IsComplete(step)
    if not step then return false end

    local stepType = step.type

    if stepType == "accept" then
        return BAG.API.Quest:IsActive(step.questID)
    elseif stepType == "turnin" then
        return BAG.API.Quest:IsComplete(step.questID) or (not BAG.API.Quest:IsActive(step.questID) and BAG.QuestTrack:WasTurnedIn(step.questID))
    elseif stepType == "complete" then
        return BAG.API.Quest:IsComplete(step.questID)
    elseif stepType == "collect" then
        local count = BAG.API.Inventory:CountItem(step.itemID)
        return count >= (step.count or 1)
    elseif stepType == "kill" then
        -- Kill steps auto-advance when quest objectives update
        if step.questID then
            return BAG.API.Quest:IsComplete(step.questID)
        end
        return false
    elseif stepType == "goto" or stepType == "travel" or stepType == "fly" or stepType == "hearth" or stepType == "boat" or stepType == "zeppelin" then
        -- Travel steps are typically manual advance, but check zone arrival
        if step.zone then
            local currentZone = BAG.ZoneDetect:GetCurrentZone()
            return currentZone == step.zone
        end
        return false
    elseif stepType == "train" or stepType == "vendor" or stepType == "buy" or stepType == "use" or stepType == "equip" then
        -- These are typically manually advanced
        return false
    elseif stepType == "flightpath" then
        -- Can't easily detect FP discovery in TBC Classic
        return false
    elseif stepType == "note" then
        -- Notes are informational, manually advanced
        return false
    elseif stepType == "level" then
        local playerLevel = BAG.API.Player:GetLevel()
        return playerLevel >= (step.targetLevel or 1)
    end

    return false
end

-- Evaluate a single condition
function Cond:Evaluate(condition)
    if not condition or not condition.type then return true end

    local ctype = condition.type

    if ctype == "level" then
        return self:CheckLevel(condition)
    elseif ctype == "questactive" then
        return self:CheckQuestActive(condition)
    elseif ctype == "questcomplete" then
        return self:CheckQuestComplete(condition)
    elseif ctype == "class" then
        return self:CheckClass(condition)
    elseif ctype == "race" then
        return self:CheckRace(condition)
    elseif ctype == "profession" then
        return self:CheckProfession(condition)
    elseif ctype == "itemcount" then
        return self:CheckItemCount(condition)
    elseif ctype == "zone" then
        return self:CheckZone(condition)
    elseif ctype == "faction" then
        return self:CheckFaction(condition)
    elseif ctype == "notclass" then
        return not self:CheckClass(condition)
    elseif ctype == "notrace" then
        return not self:CheckRace(condition)
    end

    -- Unknown condition type, default to true
    return true
end

-- Level condition: { type="level", op=">=", value=10 }
function Cond:CheckLevel(c)
    local playerLevel = BAG.API.Player:GetLevel()
    local op = c.op or ">="
    local val = c.value or 0

    if op == ">=" then return playerLevel >= val
    elseif op == "<=" then return playerLevel <= val
    elseif op == ">" then return playerLevel > val
    elseif op == "<" then return playerLevel < val
    elseif op == "==" then return playerLevel == val
    end
    return true
end

-- Quest active condition: { type="questactive", questID=1234 }
function Cond:CheckQuestActive(c)
    return BAG.API.Quest:IsActive(c.questID)
end

-- Quest complete condition: { type="questcomplete", questID=1234 }
function Cond:CheckQuestComplete(c)
    return BAG.API.Quest:IsComplete(c.questID)
end

-- Class condition: { type="class", class="Warrior" }
function Cond:CheckClass(c)
    local playerClass = BAG.API.Player:GetClass()
    return playerClass and playerClass:lower() == c.class:lower()
end

-- Race condition: { type="race", race="Orc" }
function Cond:CheckRace(c)
    local playerRace = BAG.API.Player:GetRace()
    return playerRace and playerRace:lower() == c.race:lower()
end

-- Profession condition: { type="profession", profession="Mining", skillLevel=150 }
function Cond:CheckProfession(c)
    local skill = BAG.API.Player:GetProfessionSkill(c.profession)
    if not skill then return false end
    if c.skillLevel then
        return skill >= c.skillLevel
    end
    return skill > 0
end

-- Item count condition: { type="itemcount", itemID=12345, count=5 }
function Cond:CheckItemCount(c)
    local count = BAG.API.Inventory:CountItem(c.itemID)
    return count >= (c.count or 1)
end

-- Zone condition: { type="zone", zone="Hellfire Peninsula" }
function Cond:CheckZone(c)
    local currentZone = BAG.ZoneDetect:GetCurrentZone()
    return currentZone == c.zone
end

-- Faction condition: { type="faction", faction="Alliance" }
function Cond:CheckFaction(c)
    local playerFaction = BAG.API.Player:GetFaction()
    return playerFaction == c.faction
end
