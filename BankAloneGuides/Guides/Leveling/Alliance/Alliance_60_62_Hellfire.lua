-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 60-62: Hellfire Peninsula (Full)
-- Original routing for completing Hellfire content
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_60_62_Hellfire", {
    title      = "Hellfire Peninsula (60-62)",
    faction    = "Alliance",
    levelRange = { 60, 62 },
    zone       = "Hellfire Peninsula",
    steps = {
        { type = "note",    text = "Continue from Honor Hold. If arriving fresh, set HS here and get the flight path." },
        { type = "accept",  questID = 10160, questName = "Bonechewer Cleanup",     zone = "Hellfire Peninsula", x = 56.6, y = 66.6, text = "Take the advanced Bonechewer bounty quest" },
        { type = "goto",    zone = "Hellfire Peninsula", x = 65.0, y = 72.0, text = "Head southeast to the Bonechewer strongholds" },
        { type = "kill",    target = "Bonechewer Devastators",                     zone = "Hellfire Peninsula", x = 66.0, y = 71.0, text = "Eliminate the tougher Bonechewer warriors" },
        { type = "turnin",  questID = 10160, questName = "Bonechewer Cleanup",     zone = "Hellfire Peninsula", x = 56.6, y = 66.6, text = "Report the cleanup complete" },
        { type = "note",    text = "Work the Expedition Armory quests northwest of Honor Hold." },
        { type = "goto",    zone = "Hellfire Peninsula", x = 46.0, y = 58.0, text = "Head to the Expedition Armory area" },
        { type = "kill",    target = "Unyielding Knights",                         zone = "Hellfire Peninsula", x = 45.0, y = 57.0, text = "Defeat the restless spirits at the armory ruins" },
        { type = "note",    text = "Collect soul shards and relics from the fallen soldiers." },
        { type = "hs",      text = "Hearthstone to Honor Hold" },
        { type = "note",    text = "Pick up the Mag'har and Falcon Watch quest chains (neutral quests)." },
        { type = "goto",    zone = "Hellfire Peninsula", x = 27.0, y = 62.0, text = "Travel west to the Temple of Telhamat" },
        { type = "note",    text = "Get the Temple of Telhamat flight path and pick up draenei quests." },
        { type = "fp",      zone = "Hellfire Peninsula", text = "Get the Temple of Telhamat flight path" },
        { type = "kill",    target = "Fel Reavers (avoid!), Ravagers",             zone = "Hellfire Peninsula", x = 40.0, y = 50.0, text = "Hunt ravagers in the central valley — watch for the patrolling Fel Reaver!" },
        { type = "note",    text = "Complete the pools of Aggonar demon quests." },
        { type = "goto",    zone = "Hellfire Peninsula", x = 39.0, y = 40.0, text = "Head to the Pools of Aggonar" },
        { type = "kill",    target = "Terrorfiends & Felguards",                   zone = "Hellfire Peninsula", x = 40.0, y = 38.0, text = "Clear demons at the corrupted pools" },
        { type = "hs",      text = "Hearthstone to Honor Hold" },
        { type = "note",    text = "At 62, head to Zangarmarsh for the next zone." },
    },
})
