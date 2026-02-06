-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 1-10: Teldrassil
-- Original routing for Night Elf starting experience
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_01_10_Teldrassil", {
    title      = "Teldrassil (1-10)",
    faction    = "Alliance",
    levelRange = { 1, 10 },
    zone       = "Teldrassil",
    steps = {
        { type = "accept",  questID = 456,  questName = "The Balance of Nature",  zone = "Teldrassil", x = 58.6, y = 44.4, text = "Speak with Conservator Ilthalaine at Aldrassil" },
        { type = "kill",    target = "Young Nightsabers",                         zone = "Teldrassil", x = 57.0, y = 42.0, text = "Thin the nightsaber population around Shadowglen" },
        { type = "turnin",  questID = 456,  questName = "The Balance of Nature",  zone = "Teldrassil", x = 58.6, y = 44.4, text = "Return to Ilthalaine" },
        { type = "accept",  questID = 457,  questName = "Fel Moss Gathering",     zone = "Teldrassil", x = 58.6, y = 44.4, text = "Gather corrupted moss samples from around Shadowglen" },
        { type = "goto",    zone = "Teldrassil", x = 56.0, y = 46.0, text = "Search the area south of the tree for corrupted growths" },
        { type = "turnin",  questID = 457,  questName = "Fel Moss Gathering",     zone = "Teldrassil", x = 58.6, y = 44.4, text = "Bring the samples back to the conservator" },
        { type = "accept",  questID = 916,  questName = "Crown of the Earth",     zone = "Teldrassil", x = 58.6, y = 44.1, text = "Take the moonwell quest from Tenaron Stormgrip atop the tree" },
        { type = "goto",    zone = "Teldrassil", x = 59.9, y = 42.6, text = "Fill the vial at the moonwell near Aldrassil" },
        { type = "turnin",  questID = 916,  questName = "Crown of the Earth",     zone = "Teldrassil", x = 58.6, y = 44.1, text = "Return the filled vial to Tenaron" },
        { type = "note",    text = "You should be around level 4-5. Head south along the road to Dolanaar." },
        { type = "accept",  questID = 475,  questName = "Dolanaar Delivery",      zone = "Teldrassil", x = 55.6, y = 57.0, text = "Pick up quests at Dolanaar" },
        { type = "note",    text = "Set your Hearthstone at the Dolanaar inn." },
        { type = "fp",      zone = "Teldrassil", text = "Grab the Dolanaar flight path (if available)" },
        { type = "note",    text = "Work through Dolanaar's quests: timber wolf tasks, spider caves, and the corrupted furbolgs." },
        { type = "kill",    target = "Gnarlpine Furbolgs",                        zone = "Teldrassil", x = 46.0, y = 64.0, text = "Clear furbolg camps in the Ban'ethil area" },
        { type = "kill",    target = "Webwood Spiders",                           zone = "Teldrassil", x = 56.0, y = 52.0, text = "Deal with the spider infestation in the cave" },
        { type = "note",    text = "Grind to level 10. Take the boat from Rut'theran Village to Darkshore when ready." },
        { type = "goto",    zone = "Teldrassil", x = 55.8, y = 89.6, text = "Head south to Rut'theran Village" },
        { type = "note",    text = "Visit Darnassus for class training before leaving. You're ready for Darkshore (10-20)!" },
    },
})
