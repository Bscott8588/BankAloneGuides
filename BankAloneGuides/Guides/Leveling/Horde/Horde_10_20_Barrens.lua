-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 10-20: The Barrens
-- Original routing for the classic Horde leveling hub
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_10_20_Barrens", {
    title      = "The Barrens (10-20)",
    faction    = "Horde",
    levelRange = { 10, 20 },
    zone       = "The Barrens",
    steps = {
        { type = "goto",    zone = "The Barrens", x = 51.5, y = 30.3, text = "Travel south from Orgrimmar into the Barrens" },
        { type = "fp",      zone = "The Barrens", text = "Grab the Crossroads flight path" },
        { type = "note",    text = "Set your Hearthstone at the Crossroads inn. This is your hub for the next 10 levels." },
        { type = "note",    text = "Pick up ALL quests at the Crossroads — there are many!" },
        { type = "kill",    target = "Zhevra",                                     zone = "The Barrens", x = 48.0, y = 35.0, text = "Hunt zhevra for their hooves on the northern plains" },
        { type = "kill",    target = "Raptors",                                    zone = "The Barrens", x = 55.0, y = 32.0, text = "Collect raptor heads from the eastern savanna" },
        { type = "kill",    target = "Plainstriders",                              zone = "The Barrens", x = 50.0, y = 28.0, text = "Gather plainstrider beaks near the Crossroads" },
        { type = "note",    text = "Run south to complete the centaur and quilboar quest chains." },
        { type = "goto",    zone = "The Barrens", x = 42.0, y = 46.0, text = "Head south to the Lushwater Oasis" },
        { type = "kill",    target = "Kolkar Centaurs",                            zone = "The Barrens", x = 43.0, y = 47.0, text = "Clear centaurs around the southern oasis" },
        { type = "goto",    zone = "The Barrens", x = 52.0, y = 52.0, text = "Head southeast to the Stagnant Oasis" },
        { type = "note",    text = "Dive into the oasis to find the item for the altered beings quest." },
        { type = "hs",      text = "Hearthstone to the Crossroads" },
        { type = "note",    text = "Turn in all completed quests and pick up follow-ups." },
        { type = "goto",    zone = "The Barrens", x = 62.0, y = 39.0, text = "Head east to the Wailing Caverns entrance area" },
        { type = "note",    text = "Run Wailing Caverns dungeon for excellent XP and gear at level 17-20." },
        { type = "goto",    zone = "The Barrens", x = 44.0, y = 59.0, text = "Travel south to Camp Taurajo" },
        { type = "fp",      zone = "The Barrens", text = "Get the Camp Taurajo flight path" },
        { type = "note",    text = "Complete the quilboar and bristleback quests around Camp Taurajo." },
        { type = "kill",    target = "Bristleback Quilboar",                       zone = "The Barrens", x = 40.0, y = 65.0, text = "Clear quilboar camps south of Taurajo" },
        { type = "hs",      text = "Hearthstone to the Crossroads" },
        { type = "note",    text = "At 20, you're ready for Stonetalon Mountains or Ashenvale." },
    },
})
