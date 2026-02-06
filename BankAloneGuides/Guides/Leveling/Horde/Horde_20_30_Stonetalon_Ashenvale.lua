-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 20-30: Stonetalon & Ashenvale
-- Original routing for Kalimdor mid-levels
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_20_30_Stonetalon_Ashenvale", {
    title      = "Stonetalon & Ashenvale (20-30)",
    faction    = "Horde",
    levelRange = { 20, 30 },
    zone       = "Stonetalon Mountains",
    steps = {
        -- Stonetalon Mountains
        { type = "goto",    zone = "Stonetalon Mountains", x = 45.0, y = 60.0, text = "Enter Stonetalon from The Barrens via the western pass" },
        { type = "fp",      zone = "Stonetalon Mountains", text = "Grab the Sun Rock Retreat flight path" },
        { type = "note",    text = "Set Hearthstone at Sun Rock Retreat." },
        { type = "note",    text = "Pick up all quests: Venture Co. sabotage, deforestation tasks, and charred vale missions." },
        { type = "kill",    target = "Venture Co. Loggers",                        zone = "Stonetalon Mountains", x = 55.0, y = 50.0, text = "Disrupt the Venture Co. deforestation operation" },
        { type = "kill",    target = "Charred Vale Fire Elementals",               zone = "Stonetalon Mountains", x = 30.0, y = 65.0, text = "Clear fire elementals from the Charred Vale" },
        { type = "goto",    zone = "Stonetalon Mountains", x = 60.0, y = 55.0, text = "Head to Windshear Crag for more Venture Co. quests" },
        { type = "kill",    target = "Venture Co. Engineers",                      zone = "Stonetalon Mountains", x = 62.0, y = 56.0, text = "Defeat Venture Co. engineering teams" },
        { type = "hs",      text = "Hearthstone to Sun Rock Retreat" },

        -- Ashenvale (20-30)
        { type = "note",    text = "At 22-24, head north to Ashenvale." },
        { type = "goto",    zone = "Ashenvale", x = 73.0, y = 61.0, text = "Enter Ashenvale and head to Splintertree Post" },
        { type = "fp",      zone = "Ashenvale", text = "Get the Splintertree Post flight path" },
        { type = "note",    text = "Set Hearthstone to Splintertree Post." },
        { type = "note",    text = "Pick up Splintertree quests: satyr clearing, Warsong Lumber tasks, and night elf skirmishes." },
        { type = "kill",    target = "Satyrs in Night Run",                        zone = "Ashenvale", x = 67.0, y = 55.0, text = "Clear the satyr camps at Night Run" },
        { type = "kill",    target = "Laughing Sisters (Dryads)",                  zone = "Ashenvale", x = 56.0, y = 68.0, text = "Defeat forest defenders in the southern woods" },
        { type = "goto",    zone = "Ashenvale", x = 38.0, y = 43.0, text = "Travel west for the Demon Fall Canyon quests" },
        { type = "kill",    target = "Demon Fall Canyon Demons",                   zone = "Ashenvale", x = 36.0, y = 42.0, text = "Assault the demon camps in the canyon" },
        { type = "hs",      text = "Hearthstone to Splintertree Post" },
        { type = "note",    text = "Run Blackfathom Deeps at 24-27 for good gear and XP." },
        { type = "note",    text = "At 30, head to Stranglethorn Vale or Arathi Highlands." },
    },
})
