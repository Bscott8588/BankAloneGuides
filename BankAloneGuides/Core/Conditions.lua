local BAG = BankAlone
BAG.Conditions = BAG.Conditions or {}

local Conditions = BAG.Conditions

local function evaluateCondition(cond)
    if not cond then
        return true
    end

    if cond.type == "level" then
        local level = BAG.API.PlayerAPI:GetLevel()
        if cond.op == ">=" then
            return level >= cond.value
        elseif cond.op == "<=" then
            return level <= cond.value
        elseif cond.op == ">" then
            return level > cond.value
        elseif cond.op == "<" then
            return level < cond.value
        elseif cond.op == "==" then
            return level == cond.value
        end
        return false
    elseif cond.type == "questactive" then
        return BAG.API.QuestAPI:IsActive(cond.id)
    elseif cond.type == "questcomplete" then
        return BAG.API.QuestAPI:IsCompleted(cond.id)
    elseif cond.type == "class" then
        local className = string.lower(BAG.API.PlayerAPI:GetClass())
        for _, value in ipairs(cond.values or {}) do
            if className == string.lower(value) then
                return true
            end
        end
        return false
    elseif cond.type == "race" then
        local raceName = string.lower(BAG.API.PlayerAPI:GetRace())
        for _, value in ipairs(cond.values or {}) do
            if raceName == string.lower(value) then
                return true
            end
        end
        return false
    elseif cond.type == "profession" then
        local skill = BAG.API.PlayerAPI:GetProfessionSkill(cond.name)
        if not skill then
            return false
        end
        if cond.skill then
            return skill >= cond.skill
        end
        return true
    elseif cond.type == "itemcount" then
        local count = BAG.API.InventoryAPI:CountItem(cond.id)
        return count >= (cond.count or 1)
    elseif cond.type == "zone" then
        local zone = BAG.ZoneDetection:GetZoneName()
        return zone == cond.value
    end

    return true
end

function Conditions:Check(step)
    if not step or not step.conditions then
        return true
    end
    for _, cond in ipairs(step.conditions) do
        if not evaluateCondition(cond) then
            return false
        end
    end
    return true
end

function Conditions:CheckComplete(step)
    if not step or not step.completions or #step.completions == 0 then
        return false
    end
    for _, cond in ipairs(step.completions) do
        if not evaluateCondition(cond) then
            return false
        end
    end
    return true
end

