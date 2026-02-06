--[[
    Bank Alone Guides - Player API
    Wraps player-related WoW functions
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Get comprehensive player info
function BAG.PlayerAPI:GetPlayerInfo()
    local name = UnitName("player")
    local level = UnitLevel("player")
    local className, classFile = UnitClass("player")
    local raceName, raceFile = UnitRace("player")
    local faction = UnitFactionGroup("player")
    local gender = UnitSex("player")  -- 1 = unknown, 2 = male, 3 = female
    
    return {
        name = name,
        level = level,
        class = className,
        classFile = classFile,
        race = raceName,
        raceFile = raceFile,
        faction = faction,
        gender = gender,
        guid = UnitGUID("player")
    }
end

-- Get player level
function BAG.PlayerAPI:GetLevel()
    return UnitLevel("player")
end

-- Get player class
function BAG.PlayerAPI:GetClass()
    local className, classFile = UnitClass("player")
    return className, classFile
end

-- Get player race
function BAG.PlayerAPI:GetRace()
    local raceName, raceFile = UnitRace("player")
    return raceName, raceFile
end

-- Get player faction
function BAG.PlayerAPI:GetFaction()
    return UnitFactionGroup("player")
end

-- Get player money (copper)
function BAG.PlayerAPI:GetMoney()
    return GetMoney()
end

-- Format money
function BAG.PlayerAPI:FormatMoney(copper)
    local gold = math.floor(copper / 10000)
    local silver = math.floor((copper % 10000) / 100)
    local copperRemainder = copper % 100
    
    if gold > 0 then
        return string.format("%dg %ds %dc", gold, silver, copperRemainder)
    elseif silver > 0 then
        return string.format("%ds %dc", silver, copperRemainder)
    else
        return string.format("%dc", copperRemainder)
    end
end

-- Get player health
function BAG.PlayerAPI:GetHealth()
    return UnitHealth("player"), UnitHealthMax("player")
end

-- Get player mana/energy/rage
function BAG.PlayerAPI:GetPower()
    return UnitMana("player"), UnitManaMax("player")
end

-- Check if player is dead
function BAG.PlayerAPI:IsDead()
    return UnitIsDead("player")
end

-- Check if player is ghost
function BAG.PlayerAPI:IsGhost()
    return UnitIsGhost("player")
end

-- Check if player is in combat
function BAG.PlayerAPI:IsInCombat()
    return UnitAffectingCombat("player")
end

-- Check if player is resting
function BAG.PlayerAPI:IsResting()
    return IsResting()
end

-- Get rested XP
function BAG.PlayerAPI:GetRestedXP()
    return GetXPExhaustion() or 0
end

-- Get current XP and max XP for level
function BAG.PlayerAPI:GetXP()
    return UnitXP("player"), UnitXPMax("player")
end

-- Get XP percentage for current level
function BAG.PlayerAPI:GetXPPercent()
    local current, max = self:GetXP()
    if max == 0 then
        return 100
    end
    return math.floor((current / max) * 100)
end

-- Profession functions

-- Get profession info
function BAG.PlayerAPI:GetProfessions()
    local professions = {}
    
    -- Primary professions (slots 1 and 2)
    for i = 1, 2 do
        local name, texture, rank, maxRank = GetProfessionInfo(i)
        if name then
            table.insert(professions, {
                name = name,
                texture = texture,
                rank = rank,
                maxRank = maxRank,
                slot = i,
                isPrimary = true
            })
        end
    end
    
    -- Secondary professions (Cooking, First Aid, Fishing)
    local secondarySkills = {
        "Cooking",
        "First Aid",
        "Fishing"
    }
    
    for _, skillName in ipairs(secondarySkills) do
        local rank, maxRank = self:GetSkillLevel(skillName)
        if rank then
            table.insert(professions, {
                name = skillName,
                rank = rank,
                maxRank = maxRank,
                isPrimary = false
            })
        end
    end
    
    return professions
end

-- Check if player has a profession
function BAG.PlayerAPI:HasProfession(professionName)
    local professions = self:GetProfessions()
    for _, prof in ipairs(professions) do
        if prof.name == professionName then
            return true
        end
    end
    return false
end

-- Get profession skill level
function BAG.PlayerAPI:GetProfessionSkill(professionName)
    local professions = self:GetProfessions()
    for _, prof in ipairs(professions) do
        if prof.name == professionName then
            return true, prof.rank, prof.maxRank
        end
    end
    return false, 0, 0
end

-- Get skill level by name
function BAG.PlayerAPI:GetSkillLevel(skillName)
    local numSkills = GetNumSkillLines()
    
    for i = 1, numSkills do
        local name, _, _, rank, _, _, maxRank = GetSkillLineInfo(i)
        if name == skillName then
            return rank, maxRank
        end
    end
    
    return nil, nil
end

-- Reputation functions

-- Get reputation with faction
function BAG.PlayerAPI:GetReputation(factionName)
    local numFactions = GetNumFactions()
    
    for i = 1, numFactions do
        local name, _, standing, _, _, value, _, _, _, _, _, _, _, _ = GetFactionInfo(i)
        if name == factionName then
            return standing, value
        end
    end
    
    return nil, nil
end

-- Get reputation standing text
function BAG.PlayerAPI:GetReputationText(standing)
    local standings = {
        [1] = "Hated",
        [2] = "Hostile",
        [3] = "Unfriendly",
        [4] = "Neutral",
        [5] = "Friendly",
        [6] = "Honored",
        [7] = "Revered",
        [8] = "Exalted"
    }
    
    return standings[standing] or "Unknown"
end

-- Riding skill functions

-- Check if player has mount
function BAG.PlayerAPI:HasMount()
    -- In TBC, check for riding skill
    local _, hasApprenticeRiding = self:GetSkillLevel("Riding")
    return hasApprenticeRiding ~= nil
end

-- Check riding skill level
function BAG.PlayerAPI:GetRidingSkill()
    local rank, maxRank = self:GetSkillLevel("Riding")
    return rank or 0, maxRank or 0
end

-- Check if player can fly
function BAG.PlayerAPI:CanFly()
    local rank = self:GetRidingSkill()
    return rank >= 225  -- Expert Riding for flying mounts in TBC
end

-- Equipment functions

-- Get equipped item in slot
function BAG.PlayerAPI:GetEquippedItem(slotID)
    local itemLink = GetInventoryItemLink("player", slotID)
    if itemLink then
        local itemID = tonumber(string.match(itemLink, "item:(%d+)"))
        return itemID, itemLink
    end
    return nil, nil
end

-- Check if item is equipped
function BAG.PlayerAPI:IsItemEquipped(itemID)
    for slotID = 1, 19 do
        local equippedID = self:GetEquippedItem(slotID)
        if equippedID == itemID then
            return true, slotID
        end
    end
    return false, nil
end

-- Talent functions

-- Get number of talent points spent in tree
function BAG.PlayerAPI:GetTalentTreePoints(treeIndex)
    local points = 0
    local numTalents = GetNumTalents(treeIndex)
    
    for i = 1, numTalents do
        local _, _, _, _, rank = GetTalentInfo(treeIndex, i)
        points = points + rank
    end
    
    return points
end

-- Get primary talent tree (one with most points)
function BAG.PlayerAPI:GetPrimaryTalentTree()
    local maxPoints = 0
    local primaryTree = 1
    
    for tree = 1, 3 do
        local points = self:GetTalentTreePoints(tree)
        if points > maxPoints then
            maxPoints = points
            primaryTree = tree
        end
    end
    
    return primaryTree, maxPoints
end

print("|cff00B3FF[Bank Alone Guides]|r Player API loaded")
