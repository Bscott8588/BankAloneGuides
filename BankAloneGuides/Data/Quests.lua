--[[
    Bank Alone Guides - Quest Database
    Quest information for TBC Classic Anniversary guides
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
BAG.Data.Quests = {}

-- Quest data structure (all text is original, not Blizzard's):
-- {
--   name = quest name
--   description = original brief summary
--   level = quest level
--   minLevel = minimum character level
--   faction = "Alliance", "Horde", or "Both"
--   zone = primary zone
--   questgiver = NPC ID
--   turnin = NPC ID
--   prerequisites = {quest IDs required}
--   followups = {quest IDs that follow}
-- }

-- ALLIANCE STARTING ZONES

-- Elwynn Forest (1-10)
BAG.Data.Quests[783] = {
    name = "A Threat Within",
    description = "Eliminate hostile creatures near Northshire",
    level = 1, minLevel = 1,
    faction = "Alliance",
    zone = "Elwynn Forest"
}

BAG.Data.Quests[7] = {
    name = "Kobold Camp Cleanup",
    description = "Clear out kobold camps threatening the valley",
    level = 5, minLevel = 3,
    faction = "Alliance",
    zone = "Elwynn Forest"
}

-- Dun Morogh (1-10)
BAG.Data.Quests[179] = {
    name = "Trolls Begone!",
    description = "Deal with troll threats in the snowy peaks",
    level = 4, minLevel = 2,
    faction = "Alliance",
    zone = "Dun Morogh"
}

-- Westfall (10-20)
BAG.Data.Quests[9] = {
    name = "The Fargodeep Mine",
    description = "Investigate activities in abandoned mine shafts",
    level = 12, minLevel = 9,
    faction = "Alliance",
    zone = "Westfall"
}

BAG.Data.Quests[102] = {
    name = "Patrolling Westfall",
    description = "Patrol key locations and report back",
    level = 14, minLevel = 10,
    faction = "Alliance",
    zone = "Westfall"
}

-- HORDE STARTING ZONES

-- Durotar (1-10)
BAG.Data.Quests[792] = {
    name = "Cutting Teeth",
    description = "Prove yourself in combat against local threats",
    level = 2, minLevel = 1,
    faction = "Horde",
    zone = "Durotar"
}

BAG.Data.Quests[804] = {
    name = "Sarkoth",
    description = "Hunt down a dangerous scorpion",
    level = 3, minLevel = 2,
    faction = "Horde",
    zone = "Durotar"
}

-- Mulgore (1-10)
BAG.Data.Quests[747] = {
    name = "The Hunt Begins",
    description = "Begin your training as a hunter",
    level = 1, minLevel = 1,
    faction = "Horde",
    zone = "Mulgore"
}

-- The Barrens (10-25)
BAG.Data.Quests[871] = {
    name = "Disrupt the Attacks",
    description = "Stop enemy forces from attacking settlements",
    level = 13, minLevel = 10,
    faction = "Horde",
    zone = "The Barrens"
}

BAG.Data.Quests[844] = {
    name = "Plainstrider Menace",
    description = "Thin out aggressive wildlife populations",
    level = 11, minLevel = 9,
    faction = "Horde",
    zone = "The Barrens"
}

-- TBC OUTLAND QUESTS

-- Hellfire Peninsula
BAG.Data.Quests[10129] = {
    name = "Expedition Point",
    description = "Report to the forward expedition base",
    level = 60, minLevel = 58,
    faction = "Alliance",
    zone = "Hellfire Peninsula"
}

BAG.Data.Quests[10120] = {
    name = "Eradicate the Burning Legion",
    description = "Combat demonic forces in the region",
    level = 61, minLevel = 58,
    faction = "Both",
    zone = "Hellfire Peninsula"
}

BAG.Data.Quests[10254] = {
    name = "Arelion's Secret",
    description = "Uncover hidden information",
    level = 62, minLevel = 60,
    faction = "Both",
    zone = "Hellfire Peninsula"
}

-- Zangarmarsh
BAG.Data.Quests[9792] = {
    name = "Safeguard the Expedition",
    description = "Protect allies from hostile creatures",
    level = 62, minLevel = 60,
    faction = "Both",
    zone = "Zangarmarsh"
}

BAG.Data.Quests[9730] = {
    name = "Umbrafen Eel Filets",
    description = "Gather special ingredients for cooking",
    level = 62, minLevel = 60,
    faction = "Both",
    zone = "Zangarmarsh"
}

-- Terokkar Forest
BAG.Data.Quests[10026] = {
    name = "Investigate Tuurem",
    description = "Scout the ruins for intelligence",
    level = 64, minLevel = 62,
    faction = "Both",
    zone = "Terokkar Forest"
}

BAG.Data.Quests[10869] = {
    name = "Secrets of the Arakkoa",
    description = "Learn about the bird-like inhabitants",
    level = 64, minLevel = 62,
    faction = "Both",
    zone = "Terokkar Forest"
}

-- Nagrand
BAG.Data.Quests[9868] = {
    name = "The Nesingwary Safari",
    description = "Join famous hunters on their expedition",
    level = 65, minLevel = 64,
    faction = "Both",
    zone = "Nagrand"
}

BAG.Data.Quests[9891] = {
    name = "Clefthoof Mastery",
    description = "Demonstrate hunting prowess",
    level = 66, minLevel = 64,
    faction = "Both",
    zone = "Nagrand"
}

-- Blade's Edge Mountains
BAG.Data.Quests[10503] = {
    name = "Meeting at the Citadel",
    description = "Rendezvous with important contacts",
    level = 67, minLevel = 65,
    faction = "Both",
    zone = "Blade's Edge Mountains"
}

-- Netherstorm
BAG.Data.Quests[10339] = {
    name = "Needs More Cowbell",
    description = "Gather unique technological components",
    level = 68, minLevel = 67,
    faction = "Both",
    zone = "Netherstorm"
}

BAG.Data.Quests[10265] = {
    name = "Securing the Shaleskin Shale",
    description = "Collect valuable minerals",
    level = 68, minLevel = 67,
    faction = "Both",
    zone = "Netherstorm"
}

-- Shadowmoon Valley
BAG.Data.Quests[10562] = {
    name = "Besieged!",
    description = "Defend against overwhelming forces",
    level = 70, minLevel = 67,
    faction = "Both",
    zone = "Shadowmoon Valley"
}

BAG.Data.Quests[10642] = {
    name = "A Ghost in the Machine",
    description = "Investigate mysterious occurrences",
    level = 70, minLevel = 68,
    faction = "Both",
    zone = "Shadowmoon Valley"
}

-- Helper function to get quest info
function BAG.Data:GetQuestInfo(questID)
    return self.Quests[questID]
end

-- Helper function to get quests by zone
function BAG.Data:GetQuestsByZone(zoneName, faction)
    local quests = {}
    
    for questID, questData in pairs(self.Quests) do
        if questData.zone == zoneName then
            if not faction or questData.faction == "Both" or questData.faction == faction then
                table.insert(quests, {id = questID, data = questData})
            end
        end
    end
    
    -- Sort by level
    table.sort(quests, function(a, b)
        return a.data.level < b.data.level
    end)
    
    return quests
end

-- Helper function to get quests by level range
function BAG.Data:GetQuestsByLevel(minLevel, maxLevel, faction)
    local quests = {}
    
    for questID, questData in pairs(self.Quests) do
        if questData.level >= minLevel and questData.level <= maxLevel then
            if not faction or questData.faction == "Both" or questData.faction == faction then
                table.insert(quests, {id = questID, data = questData})
            end
        end
    end
    
    return quests
end

print("|cff00B3FF[Bank Alone Guides]|r Quest database loaded (" .. BAG.Utils:TableSize(BAG.Data.Quests) .. " quests)")
