-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 1-10: Tirisfal Glades
-- Original routing for Undead starting experience
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_01_10_Tirisfal", {
    title      = "Tirisfal Glades (1-10)",
    faction    = "Horde",
    levelRange = { 1, 10 },
    zone       = "Tirisfal Glades",
    steps = {
        { type = "accept",  questID = 363,  questName = "Rude Awakening",         zone = "Tirisfal Glades", x = 30.2, y = 71.3, text = "Speak with Undertaker Mordo at Deathknell" },
        { type = "turnin",  questID = 363,  questName = "Rude Awakening",         zone = "Tirisfal Glades", x = 31.6, y = 65.6, text = "Report to Shadow Priest Sarvis in the chapel" },
        { type = "accept",  questID = 364,  questName = "Mindless Ones",          zone = "Tirisfal Glades", x = 31.6, y = 65.6, text = "Put down the mindless undead near the graveyard" },
        { type = "kill",    target = "Mindless Zombies",                           zone = "Tirisfal Glades", x = 28.0, y = 68.0, text = "Defeat the wandering mindless zombies near the crypt area" },
        { type = "turnin",  questID = 364,  questName = "Mindless Ones",          zone = "Tirisfal Glades", x = 31.6, y = 65.6, text = "Report back to Sarvis" },
        { type = "note",    text = "Continue Deathknell quests: scarlet crusade scouts and night web spiders." },
        { type = "kill",    target = "Night Web Spiders",                          zone = "Tirisfal Glades", x = 26.0, y = 61.0, text = "Clear the spider cave northwest of Deathknell" },
        { type = "kill",    target = "Scarlet Crusade Warriors",                   zone = "Tirisfal Glades", x = 35.0, y = 67.0, text = "Defeat the Scarlet Crusade intruders east of town" },
        { type = "note",    text = "At level 5-6, follow the road north to Brill." },
        { type = "goto",    zone = "Tirisfal Glades", x = 60.8, y = 52.3, text = "Travel along the road north to Brill" },
        { type = "fp",      zone = "Tirisfal Glades", text = "Grab the Brill flight path" },
        { type = "note",    text = "Set your Hearthstone at the Brill inn." },
        { type = "accept",  questID = 376,  questName = "Fields of Grief",        zone = "Tirisfal Glades", x = 60.8, y = 52.3, text = "Gather pumpkins from the nearby fields" },
        { type = "goto",    zone = "Tirisfal Glades", x = 59.0, y = 55.0, text = "Head to the pumpkin fields south of Brill" },
        { type = "turnin",  questID = 376,  questName = "Fields of Grief",        zone = "Tirisfal Glades", x = 60.8, y = 52.3, text = "Return the pumpkins to Brill" },
        { type = "accept",  questID = 382,  questName = "The Mills Overrun",      zone = "Tirisfal Glades", x = 60.8, y = 52.3, text = "Clear the gnoll infestation at the mills" },
        { type = "goto",    zone = "Tirisfal Glades", x = 56.0, y = 37.0, text = "Head north to the Agamand Mills" },
        { type = "kill",    target = "Agamand Undead",                             zone = "Tirisfal Glades", x = 55.0, y = 36.0, text = "Clear the haunted mills of restless dead" },
        { type = "turnin",  questID = 382,  questName = "The Mills Overrun",      zone = "Tirisfal Glades", x = 60.8, y = 52.3, text = "Report the mills situation to Brill" },
        { type = "hs",      text = "Hearthstone to Brill" },
        { type = "note",    text = "Grind to 10. Visit Undercity for class training." },
        { type = "goto",    zone = "Undercity", x = 63.0, y = 48.0, text = "Enter Undercity through the ruins of Lordaeron" },
        { type = "fp",      zone = "Undercity", text = "Get the Undercity flight path" },
        { type = "note",    text = "Train all skills. Ready for Silverpine Forest (10-20)!" },
    },
})
