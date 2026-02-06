-------------------------------------------------------------------------------
-- Bank Alone Guides — API / PlayerAPI
-- Player information wrappers
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.PlayerAPI = BAG.PlayerAPI or {}

--- Get the player's current level.
-- @return number
function BAG.PlayerAPI:GetLevel()
    return UnitLevel("player") or 1
end

--- Get the player's localized class name.
-- @return string  e.g. "Warrior", "Mage"
function BAG.PlayerAPI:GetClass()
    local _, englishClass = UnitClass("player")
    -- Return capitalized English class name
    if englishClass then
        return englishClass:sub(1, 1):upper() .. englishClass:sub(2):lower()
    end
    return "Unknown"
end

--- Get the raw English class token (uppercase).
-- @return string  e.g. "WARRIOR", "MAGE"
function BAG.PlayerAPI:GetClassToken()
    local _, token = UnitClass("player")
    return token or "UNKNOWN"
end

--- Get the player's race.
-- @return string  e.g. "Human", "Orc", "NightElf", "BloodElf"
function BAG.PlayerAPI:GetRace()
    local _, englishRace = UnitRace("player")
    return englishRace or "Unknown"
end

--- Get the player's faction.
-- @return string  "Alliance" or "Horde"
function BAG.PlayerAPI:GetFaction()
    local faction = UnitFactionGroup("player")
    return faction or "Unknown"
end

--- Get the player's current gold in copper.
-- @return number  Total money in copper
function BAG.PlayerAPI:GetMoney()
    return GetMoney and GetMoney() or 0
end

--- Get the player's gold as formatted string.
-- @return string  e.g. "12g 34s 56c"
function BAG.PlayerAPI:GetMoneyString()
    local copper = self:GetMoney()
    local gold   = math.floor(copper / 10000)
    local silver = math.floor((copper % 10000) / 100)
    local cop    = copper % 100
    return string.format("%dg %ds %dc", gold, silver, cop)
end

--- Get a profession's current skill level.
-- Scans the player's skill list for a matching profession name.
-- @param profName  The profession name, e.g. "Mining", "Herbalism"
-- @return number   Current skill level (0 if not learned)
function BAG.PlayerAPI:GetProfessionSkill(profName)
    if not profName then return 0 end

    -- TBC Classic uses GetNumSkillLines / GetSkillLineInfo
    if GetNumSkillLines then
        for i = 1, GetNumSkillLines() do
            local name, isHeader, isExpanded, skillRank = GetSkillLineInfo(i)
            if name and name:lower() == profName:lower() then
                return skillRank or 0
            end
        end
    end
    return 0
end

--- Get the player's name.
-- @return string
function BAG.PlayerAPI:GetName()
    return UnitName("player") or "Unknown"
end

--- Get the player's name and realm.
-- @return string, string
function BAG.PlayerAPI:GetNameRealm()
    local name  = UnitName("player") or "Unknown"
    local realm = GetRealmName() or "Unknown"
    return name, realm
end

--- Get the player's current XP and max XP.
-- @return number, number  (currentXP, maxXP)
function BAG.PlayerAPI:GetXP()
    local current = UnitXP("player") or 0
    local max     = UnitXPMax("player") or 1
    return current, max
end

--- Get the player's rested XP bonus.
-- @return number
function BAG.PlayerAPI:GetRestedXP()
    return GetXPExhaustion() or 0
end
