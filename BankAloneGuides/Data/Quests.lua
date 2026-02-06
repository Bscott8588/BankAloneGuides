--[[
    Bank Alone Guides - Quest Database
    Key quests for TBC Classic Anniversary guides
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Data.Quests = {
    -- This is a sample database with representative quests
    -- In a full implementation, this would contain all quests used in guides
    
    -- Alliance Starting Quests (Elwynn Forest - Human)
    [783] = {
        name = "A Threat Within",
        summary = "Help defend Northshire against Defias infiltrators",
        level = 1,
        faction = "Alliance",
        zone = "Elwynn Forest",
        prereq = {},
        followup = {5261},
    },
    [5261] = {
        name = "Eagan Peltskinner",
        summary = "Speak with Eagan Peltskinner to learn skinning",
        level = 1,
        faction = "Alliance",
        zone = "Elwynn Forest",
        prereq = {783},
        followup = {},
    },
    [18] = {
        name = "Brotherhood of Thieves",
        summary = "Eliminate Defias threat near Goldshire",
        level = 7,
        faction = "Alliance",
        zone = "Elwynn Forest",
        prereq = {},
        followup = {},
    },
    
    -- Horde Starting Quests (Durotar - Orc/Troll)
    [4641] = {
        name = "Your Place In The World",
        summary = "Begin your journey in the Valley of Trials",
        level = 1,
        faction = "Horde",
        zone = "Durotar",
        prereq = {},
        followup = {788},
    },
    [788] = {
        name = "Cutting Teeth",
        summary = "Prove yourself by hunting boars and scorpids",
        level = 1,
        faction = "Horde",
        zone = "Durotar",
        prereq = {4641},
        followup = {789},
    },
    [789] = {
        name = "Sarkoth",
        summary = "Defeat the scorpid Sarkoth and retrieve his stinger",
        level = 2,
        faction = "Horde",
        zone = "Durotar",
        prereq = {788},
        followup = {},
    },
    
    -- Outland Opening Quests (Alliance)
    [10119] = {
        name = "Through the Dark Portal",
        summary = "Travel through the Dark Portal to Hellfire Peninsula",
        level = 58,
        faction = "Alliance",
        zone = "Blasted Lands",
        prereq = {},
        followup = {10288},
    },
    [10288] = {
        name = "Arrival in Outland",
        summary = "Speak with the commander at Honor Hold",
        level = 58,
        faction = "Alliance",
        zone = "Hellfire Peninsula",
        prereq = {10119},
        followup = {10140},
    },
    [10140] = {
        name = "Eradicate the Burning Legion",
        summary = "Begin defending Honor Hold from demons",
        level = 58,
        faction = "Alliance",
        zone = "Hellfire Peninsula",
        prereq = {10288},
        followup = {},
    },
    
    -- Outland Opening Quests (Horde)
    [9407] = {
        name = "Through the Dark Portal",
        summary = "Travel through the Dark Portal to Hellfire Peninsula",
        level = 58,
        faction = "Horde",
        zone = "Blasted Lands",
        prereq = {},
        followup = {10120},
    },
    [10120] = {
        name = "Arrival in Outland",
        summary = "Report to Thrallmar",
        level = 58,
        faction = "Horde",
        zone = "Hellfire Peninsula",
        prereq = {9407},
        followup = {10121},
    },
    [10121] = {
        name = "Eradicate the Burning Legion",
        summary = "Begin defending Thrallmar from demons",
        level = 58,
        faction = "Horde",
        zone = "Hellfire Peninsula",
        prereq = {10120},
        followup = {},
    },
    
    -- Zangarmarsh Quests (Both factions)
    [9730] = {
        name = "Angling to Beat the Competition",
        summary = "Catch fish and help the outpost",
        level = 60,
        faction = "Both",
        zone = "Zangarmarsh",
        prereq = {},
        followup = {},
    },
    [9738] = {
        name = "Blessings of the Ancients",
        summary = "Seek blessings from ancient spirits",
        level = 62,
        faction = "Both",
        zone = "Zangarmarsh",
        prereq = {},
        followup = {},
    },
    
    -- Terokkar Forest Quests
    [10000] = {
        name = "An Unwelcome Presence",
        summary = "Investigate Firewing Point",
        level = 62,
        faction = "Alliance",
        zone = "Terokkar Forest",
        prereq = {},
        followup = {},
    },
    
    -- Nagrand Quests
    [9800] = {
        name = "The Throne of the Elements",
        summary = "Speak with the elemental spirits",
        level = 64,
        faction = "Both",
        zone = "Nagrand",
        prereq = {},
        followup = {9869},
    },
    [9869] = {
        name = "Agitated Spirits of Skysong",
        summary = "Calm the troubled spirits",
        level = 64,
        faction = "Both",
        zone = "Nagrand",
        prereq = {9800},
        followup = {},
    },
    
    -- Class Quests (examples)
    [1638] = {
        name = "A Warrior's Training",
        summary = "Begin warrior training",
        level = 1,
        faction = "Both",
        class = "Warrior",
        prereq = {},
        followup = {},
    },
    [1599] = {
        name = "Beginnings",
        summary = "Start your path as a priest",
        level = 5,
        faction = "Both",
        class = "Priest",
        prereq = {},
        followup = {},
    },
}

-- Helper function to get quest info
function BAG.Data.Quests:GetQuestInfo(questID)
    return self[questID]
end

-- Helper function to get quest name
function BAG.Data.Quests:GetQuestName(questID)
    local quest = self[questID]
    return quest and quest.name or "Unknown Quest"
end

-- Helper function to get quests by zone
function BAG.Data.Quests:GetQuestsByZone(zoneName)
    local quests = {}
    
    for questID, questInfo in pairs(self) do
        if type(questInfo) == "table" and questInfo.zone == zoneName then
            quests[questID] = questInfo
        end
    end
    
    return quests
end

-- Helper function to get quests by faction
function BAG.Data.Quests:GetQuestsByFaction(faction)
    local quests = {}
    
    for questID, questInfo in pairs(self) do
        if type(questInfo) == "table" then
            if questInfo.faction == faction or questInfo.faction == "Both" then
                quests[questID] = questInfo
            end
        end
    end
    
    return quests
end

-- Helper function to get quest prerequisites
function BAG.Data.Quests:GetQuestPrereqs(questID)
    local quest = self[questID]
    return quest and quest.prereq or {}
end

-- Helper function to get quest follow-ups
function BAG.Data.Quests:GetQuestFollowups(questID)
    local quest = self[questID]
    return quest and quest.followup or {}
end
