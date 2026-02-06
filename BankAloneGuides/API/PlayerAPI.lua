--[[
    Bank Alone Guides - Player API Wrapper
    SCS / Bank Alone Guides
    
    Wraps player-related WoW functions.
]]

local BAG = BankAlone

BAG.API = BAG.API or {}
BAG.API.Player = BAG.API.Player or {}
local PlayerAPI = BAG.API.Player

-- Get player level
function PlayerAPI:GetLevel()
    return UnitLevel("player") or 1
end

-- Get player class (localized)
function PlayerAPI:GetClass()
    local className, classFile = UnitClass("player")
    return className
end

-- Get player class file name (English, uppercase)
function PlayerAPI:GetClassFile()
    local _, classFile = UnitClass("player")
    return classFile
end

-- Get player race (localized)
function PlayerAPI:GetRace()
    local raceName, raceFile = UnitRace("player")
    return raceName
end

-- Get player race file name (English)
function PlayerAPI:GetRaceFile()
    local _, raceFile = UnitRace("player")
    return raceFile
end

-- Get player faction ("Alliance" or "Horde")
function PlayerAPI:GetFaction()
    local faction = UnitFactionGroup("player")
    return faction
end

-- Get player money (in copper)
function PlayerAPI:GetMoney()
    return GetMoney() or 0
end

-- Get player name
function PlayerAPI:GetName()
    return UnitName("player") or "Unknown"
end

-- Get player GUID
function PlayerAPI:GetGUID()
    return UnitGUID("player")
end

-- Get XP info
function PlayerAPI:GetXPInfo()
    local current = UnitXP("player") or 0
    local max = UnitXPMax("player") or 1
    local rested = GetXPExhaustion() or 0
    return {
        current = current,
        max = max,
        rested = rested,
        percent = (current / max) * 100,
    }
end

-- Get profession skill level by name
function PlayerAPI:GetProfessionSkill(profName)
    if not profName then return nil end
    profName = profName:lower()

    -- In TBC Classic, iterate through skill lines
    local numSkills = GetNumSkillLines() or 0
    for i = 1, numSkills do
        local name, isHeader, isExpanded, skillRank, numTempPoints, skillModifier, skillMaxRank = GetSkillLineInfo(i)
        if name and name:lower() == profName then
            return skillRank, skillMaxRank
        end
    end

    return nil
end

-- Check if player has a specific profession
function PlayerAPI:HasProfession(profName)
    local skill = self:GetProfessionSkill(profName)
    return skill ~= nil and skill > 0
end

-- Get all professions
function PlayerAPI:GetProfessions()
    local professions = {}
    local numSkills = GetNumSkillLines() or 0
    local currentHeader = nil

    for i = 1, numSkills do
        local name, isHeader, isExpanded, skillRank, numTempPoints, skillModifier, skillMaxRank = GetSkillLineInfo(i)
        if isHeader then
            currentHeader = name
        elseif currentHeader and skillRank then
            professions[#professions + 1] = {
                name = name,
                rank = skillRank,
                maxRank = skillMaxRank,
                category = currentHeader,
            }
        end
    end

    return professions
end

-- Get player health info
function PlayerAPI:GetHealthInfo()
    return {
        current = UnitHealth("player") or 0,
        max = UnitHealthMax("player") or 1,
    }
end

-- Get player mana/power info
function PlayerAPI:GetPowerInfo()
    return {
        current = UnitPower("player") or UnitMana("player") or 0,
        max = UnitPowerMax("player") or UnitManaMax("player") or 1,
        type = UnitPowerType("player") or 0,
    }
end

-- Check if player is in combat
function PlayerAPI:InCombat()
    return UnitAffectingCombat("player") or false
end

-- Check if player is dead
function PlayerAPI:IsDead()
    return UnitIsDeadOrGhost("player") or false
end

-- Check if player is resting (in inn/city)
function PlayerAPI:IsResting()
    return IsResting() or false
end

-- Check if player is mounted
function PlayerAPI:IsMounted()
    return IsMounted() or false
end
