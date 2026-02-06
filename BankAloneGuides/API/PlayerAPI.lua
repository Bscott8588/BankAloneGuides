local BAG = BankAlone
BAG.API.PlayerAPI = BAG.API.PlayerAPI or {}

local PlayerAPI = BAG.API.PlayerAPI

function PlayerAPI:GetLevel()
    return UnitLevel("player") or 1
end

function PlayerAPI:GetClass()
    local localized, classTag = UnitClass("player")
    return classTag or localized or "Unknown"
end

function PlayerAPI:GetRace()
    local localized, raceTag = UnitRace("player")
    return raceTag or localized or "Unknown"
end

function PlayerAPI:GetFaction()
    return UnitFactionGroup("player") or "Neutral"
end

function PlayerAPI:GetMoney()
    return GetMoney() or 0
end

local function normalize(name)
    return string.lower(name or "")
end

function PlayerAPI:GetProfessionSkill(professionName)
    if not professionName then
        return nil
    end
    local target = normalize(professionName)
    local professions = { GetProfessions() }
    for _, profIndex in ipairs(professions) do
        if profIndex then
            local name, _, skillLevel = GetProfessionInfo(profIndex)
            if normalize(name) == target then
                return skillLevel or 0
            end
        end
    end
    return nil
end

