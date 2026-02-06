-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 1-10: Mulgore
-- Original routing for Tauren starting experience
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_01_10_Mulgore", {
    title      = "Mulgore (1-10)",
    faction    = "Horde",
    levelRange = { 1, 10 },
    zone       = "Mulgore",
    steps = {
        { type = "accept",  questID = 747,  questName = "The Hunt Begins",        zone = "Mulgore", x = 44.9, y = 76.0, text = "Speak with Chief Hawkwind at Camp Narache" },
        { type = "kill",    target = "Plainstriders",                              zone = "Mulgore", x = 45.0, y = 73.0, text = "Hunt plainstriders on the hills around camp" },
        { type = "turnin",  questID = 747,  questName = "The Hunt Begins",        zone = "Mulgore", x = 44.9, y = 76.0, text = "Return to Chief Hawkwind with your trophies" },
        { type = "accept",  questID = 757,  questName = "Rite of Strength",       zone = "Mulgore", x = 44.5, y = 76.3, text = "Prove your strength against bristleback intruders" },
        { type = "kill",    target = "Bristleback Quilboar",                       zone = "Mulgore", x = 43.0, y = 79.0, text = "Defeat quilboar in the camps south of Camp Narache" },
        { type = "turnin",  questID = 757,  questName = "Rite of Strength",       zone = "Mulgore", x = 44.5, y = 76.3, text = "Report your victory" },
        { type = "accept",  questID = 761,  questName = "Rite of Vision",         zone = "Mulgore", x = 44.5, y = 76.3, text = "Begin the spirit walk preparation" },
        { type = "note",    text = "Complete the Rite of Vision quest chain — involves gathering herbs and a spirit walk." },
        { type = "note",    text = "At level 6, head northeast to Bloodhoof Village." },
        { type = "goto",    zone = "Mulgore", x = 47.5, y = 58.8, text = "Follow the road to Bloodhoof Village" },
        { type = "fp",      zone = "Mulgore", text = "Grab the Bloodhoof Village flight path" },
        { type = "note",    text = "Set your Hearthstone at Bloodhoof Village." },
        { type = "note",    text = "Pick up all village quests: harpy clearance, well water collection, and wolf hunting." },
        { type = "kill",    target = "Palemane Gnolls",                            zone = "Mulgore", x = 34.0, y = 59.0, text = "Clear gnoll camps west of the village" },
        { type = "kill",    target = "Windfury Harpies",                           zone = "Mulgore", x = 32.0, y = 47.0, text = "Defeat harpies in the rocky bluffs northwest" },
        { type = "note",    text = "Work the Venture Co. mine quests on the eastern edge of Mulgore." },
        { type = "goto",    zone = "Mulgore", x = 60.0, y = 48.0, text = "Head to the Venture Co. mine" },
        { type = "kill",    target = "Venture Co. Workers",                        zone = "Mulgore", x = 61.0, y = 47.0, text = "Clear the goblin miners from the mine" },
        { type = "hs",      text = "Hearthstone to Bloodhoof Village" },
        { type = "note",    text = "At 10, visit Thunder Bluff for training." },
        { type = "goto",    zone = "Thunder Bluff", x = 46.8, y = 49.8, text = "Climb to Thunder Bluff" },
        { type = "fp",      zone = "Thunder Bluff", text = "Get the Thunder Bluff flight path" },
        { type = "note",    text = "Train skills. Head to The Barrens next!" },
    },
})
