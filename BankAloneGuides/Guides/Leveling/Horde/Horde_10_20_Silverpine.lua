-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 10-20: Silverpine Forest
-- Original routing for Undead progression
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_10_20_Silverpine", {
    title      = "Silverpine Forest (10-20)",
    faction    = "Horde",
    levelRange = { 10, 20 },
    zone       = "Silverpine Forest",
    steps = {
        { type = "goto",    zone = "Silverpine Forest", x = 45.0, y = 40.0, text = "Travel south from Tirisfal Glades into Silverpine Forest" },
        { type = "fp",      zone = "Silverpine Forest", text = "Grab the Sepulcher flight path" },
        { type = "note",    text = "Set your Hearthstone at The Sepulcher." },
        { type = "note",    text = "Pick up all Sepulcher quests: worgen investigation, Dalaran relations, and mine operations." },
        { type = "kill",    target = "Worgen",                                     zone = "Silverpine Forest", x = 44.0, y = 46.0, text = "Defeat worgen roaming the forests near the road" },
        { type = "kill",    target = "Dalaran Mages",                              zone = "Silverpine Forest", x = 50.0, y = 42.0, text = "Take on the hostile mages from the Dalaran Crater dome" },
        { type = "note",    text = "Work southward through the forest toward Pyrewood Village." },
        { type = "goto",    zone = "Silverpine Forest", x = 46.0, y = 72.0, text = "Travel south to the Pyrewood Village area" },
        { type = "note",    text = "Be careful — Pyrewood Village turns hostile at night (worgen curse)." },
        { type = "kill",    target = "Rot Hide Gnolls",                            zone = "Silverpine Forest", x = 48.0, y = 56.0, text = "Clear the rot hide gnolls from their camps" },
        { type = "note",    text = "Complete the mine quests and the Deep Elem Mine chain." },
        { type = "goto",    zone = "Silverpine Forest", x = 56.0, y = 47.0, text = "Head east to the Deep Elem Mine" },
        { type = "kill",    target = "Mine Spiders and Undead",                    zone = "Silverpine Forest", x = 57.0, y = 48.0, text = "Clear the mine of hostile creatures" },
        { type = "hs",      text = "Hearthstone to The Sepulcher" },
        { type = "note",    text = "At level 20, head to Hillsbrad Foothills or The Barrens." },
    },
})
