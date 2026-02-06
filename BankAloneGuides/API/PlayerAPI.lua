--[[
    Bank Alone Guides - Player API
    Wraps WoW player-related functions
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.PlayerAPI = {}

-- Get player level
function BAG.PlayerAPI:GetLevel()
    return UnitLevel("player") or 1
end

-- Get player class (localized)
function BAG.PlayerAPI:GetClass()
    local class, classEN = UnitClass("player")
    return classEN or "UNKNOWN"
end

-- Get player class (localized name)
function BAG.PlayerAPI:GetClassName()
    local class = UnitClass("player")
    return class or "Unknown"
end

-- Get player race (English)
function BAG.PlayerAPI:GetRace()
    local race, raceEN = UnitRace("player")
    return raceEN or "UNKNOWN"
end

-- Get player race (localized name)
function BAG.PlayerAPI:GetRaceName()
    local race = UnitRace("player")
    return race or "Unknown"
end

-- Get player faction
function BAG.PlayerAPI:GetFaction()
    local faction = UnitFactionGroup("player")
    return faction or "Neutral"
end

-- Get player name
function BAG.PlayerAPI:GetName()
    return UnitName("player") or "Unknown"
end

-- Get player realm
function BAG.PlayerAPI:GetRealm()
    return GetRealmName() or "Unknown"
end

-- Get player GUID
function BAG.PlayerAPI:GetGUID()
    return UnitGUID("player")
end

-- Get player money (in copper)
function BAG.PlayerAPI:GetMoney()
    return GetMoney() or 0
end

-- Get player health
function BAG.PlayerAPI:GetHealth()
    return UnitHealth("player"), UnitHealthMax("player")
end

-- Get player mana/energy/rage
function BAG.PlayerAPI:GetPower()
    return UnitPower("player"), UnitPowerMax("player")
end

-- Check if player is dead
function BAG.PlayerAPI:IsDead()
    return UnitIsDead("player") or UnitIsGhost("player")
end

-- Check if player is in combat
function BAG.PlayerAPI:IsInCombat()
    return InCombatLockdown()
end

-- Check if player is resting
function BAG.PlayerAPI:IsResting()
    return IsResting()
end

-- Check if player is mounted
function BAG.PlayerAPI:IsMounted()
    return IsMounted()
end

-- Get player professions
function BAG.PlayerAPI:GetProfessions()
    local professions = {}
    
    for i = 1, 2 do
        local name, icon, skillLevel, maxSkillLevel = GetProfessionInfo(i)
        if name then
            table.insert(professions, {
                name = name,
                skill = skillLevel,
                maxSkill = maxSkillLevel,
                icon = icon,
            })
        end
    end
    
    return professions
end

-- Get skill level for a specific profession
function BAG.PlayerAPI:GetProfessionSkill(professionName)
    if not professionName then return 0 end
    
    for i = 1, GetNumSkillLines() do
        local name, isHeader, _, skillRank = GetSkillLineInfo(i)
        if not isHeader and name and name:upper() == professionName:upper() then
            return skillRank or 0
        end
    end
    
    return 0
end

-- Check if player has a profession
function BAG.PlayerAPI:HasProfession(professionName)
    return self:GetProfessionSkill(professionName) > 0
end

-- Get all skills
function BAG.PlayerAPI:GetSkills()
    local skills = {}
    
    for i = 1, GetNumSkillLines() do
        local name, isHeader, _, skillRank, _, _, skillMaxRank = GetSkillLineInfo(i)
        if not isHeader and name then
            table.insert(skills, {
                name = name,
                rank = skillRank,
                maxRank = skillMaxRank,
            })
        end
    end
    
    return skills
end

-- Get player position (zone, x, y)
function BAG.PlayerAPI:GetPosition()
    local zone = GetZoneText()
    local x, y = BAG.MapAPI:GetPlayerPosition()
    return zone, x, y
end

-- Get XP info
function BAG.PlayerAPI:GetXP()
    local currentXP = UnitXP("player")
    local maxXP = UnitXPMax("player")
    local restedXP = GetXPExhaustion() or 0
    
    return {
        current = currentXP,
        max = maxXP,
        percent = (currentXP / maxXP) * 100,
        rested = restedXP,
    }
end

-- Get player reputation with a faction
function BAG.PlayerAPI:GetReputation(factionName)
    for i = 1, GetNumFactions() do
        local name, _, standingID, bottomValue, topValue, earnedValue = GetFactionInfo(i)
        if name == factionName then
            return {
                name = name,
                standing = standingID,
                current = earnedValue - bottomValue,
                max = topValue - bottomValue,
                total = earnedValue,
            }
        end
    end
    return nil
end

-- Get player's hearthstone location
function BAG.PlayerAPI:GetHearthLocation()
    -- TBC doesn't have a direct API for this, but we can check the hearthstone tooltip
    -- This is a simplified version
    return "Unknown"
end

-- Check if player can fly in current zone
function BAG.PlayerAPI:CanFlyHere()
    -- In TBC, flying is only available in Outland
    return BAG.Utils:IsInOutland()
end

-- Check if player has flying mount
function BAG.PlayerAPI:HasFlyingMount()
    -- Check if player has any flying skill
    local hasExpertRiding = BAG.SpellAPI:HasSpell(34090) -- Expert Riding (TBC flying)
    local hasArtisanRiding = BAG.SpellAPI:HasSpell(34091) -- Artisan Riding (Epic flying)
    
    return hasExpertRiding or hasArtisanRiding
end

-- Check if player has regular mount
function BAG.PlayerAPI:HasMount()
    -- Check for various riding skills
    local hasRiding = BAG.SpellAPI:HasSpell(33388) -- Apprentice Riding (60%)
        or BAG.SpellAPI:HasSpell(33391) -- Journeyman Riding (100%)
    
    return hasRiding
end

-- Get player's current speed (approximate)
function BAG.PlayerAPI:GetSpeed()
    local speed = GetUnitSpeed("player")
    return speed
end

-- Check if player is indoors
function BAG.PlayerAPI:IsIndoors()
    return IsIndoors()
end

-- Check if player is outdoors
function BAG.PlayerAPI:IsOutdoors()
    return IsOutdoors()
end

-- Get talent info (basic support for TBC)
function BAG.PlayerAPI:GetTalentPoints()
    local numTabs = GetNumTalentTabs()
    local totalSpent = 0
    local totalUnspent = 0
    
    for i = 1, numTabs do
        local numTalents = GetNumTalents(i)
        for j = 1, numTalents do
            local _, _, _, _, spent = GetTalentInfo(i, j)
            totalSpent = totalSpent + spent
        end
    end
    
    local level = self:GetLevel()
    totalUnspent = math.max(0, level - 9 - totalSpent)
    
    return {
        spent = totalSpent,
        unspent = totalUnspent,
        total = level > 9 and (level - 9) or 0,
    }
end

-- Get bag space
function BAG.PlayerAPI:GetBagSpace()
    local free, total = 0, 0
    
    for bag = 0, 4 do
        local numSlots = GetContainerNumSlots(bag) or 0
        total = total + numSlots
        
        for slot = 1, numSlots do
            if not GetContainerItemInfo(bag, slot) then
                free = free + 1
            end
        end
    end
    
    return free, total
end

-- Check if bags are full
function BAG.PlayerAPI:AreBagsFull()
    local free = self:GetBagSpace()
    return free == 0
end
