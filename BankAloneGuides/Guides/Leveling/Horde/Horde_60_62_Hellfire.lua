-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 60-62: Hellfire Peninsula (Full)
-- Original routing for completing Hellfire content
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_60_62_Hellfire", {
    title      = "Hellfire Peninsula (60-62)",
    faction    = "Horde",
    levelRange = { 60, 62 },
    zone       = "Hellfire Peninsula",
    steps = {
        { type = "note",    text = "Continue from Thrallmar. Pick up remaining quests." },
        { type = "accept",  questID = 10160, questName = "Bonechewer Cleanup",     zone = "Hellfire Peninsula", x = 55.0, y = 36.0, text = "Take the advanced Bonechewer bounty" },
        { type = "goto",    zone = "Hellfire Peninsula", x = 64.0, y = 43.0, text = "Head east to the Bonechewer strongholds" },
        { type = "kill",    target = "Bonechewer Devastators",                     zone = "Hellfire Peninsula", x = 65.0, y = 44.0, text = "Eliminate the elite Bonechewer warriors" },
        { type = "turnin",  questID = 10160, questName = "Bonechewer Cleanup",     zone = "Hellfire Peninsula", x = 55.0, y = 36.0, text = "Report the area secured" },
        { type = "note",    text = "Work the Falcon Watch quests south of Thrallmar." },
        { type = "goto",    zone = "Hellfire Peninsula", x = 27.0, y = 59.0, text = "Travel to Falcon Watch" },
        { type = "fp",      zone = "Hellfire Peninsula", text = "Get the Falcon Watch flight path" },
        { type = "note",    text = "Pick up Falcon Watch quests: spinebreaker orc tasks and demon patrol." },
        { type = "kill",    target = "Spinebreaker Orcs",                          zone = "Hellfire Peninsula", x = 33.0, y = 56.0, text = "Clear the Spinebreaker orc outposts" },
        { type = "goto",    zone = "Hellfire Peninsula", x = 40.0, y = 40.0, text = "Head to the Pools of Aggonar" },
        { type = "kill",    target = "Terrorfiends",                               zone = "Hellfire Peninsula", x = 39.0, y = 39.0, text = "Defeat demons at the corrupted pools" },
        { type = "note",    text = "Complete the Mag'har quest chain if available." },
        { type = "goto",    zone = "Hellfire Peninsula", x = 32.0, y = 28.0, text = "Head to the Mag'har Post for the orc heritage quests" },
        { type = "kill",    target = "Fel Reavers (avoid!) and Ravagers",          zone = "Hellfire Peninsula", x = 44.0, y = 44.0, text = "Hunt ravagers in the central plains — dodge the Fel Reaver!" },
        { type = "hs",      text = "Hearthstone to Thrallmar" },
        { type = "note",    text = "At 62, proceed to Zangarmarsh." },
    },
})
