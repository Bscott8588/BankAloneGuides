-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 58-60: Hellfire Peninsula (Entry)
-- Original routing for the Dark Portal crossing
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_58_60_Hellfire", {
    title      = "Hellfire Peninsula Entry (58-60)",
    faction    = "Horde",
    levelRange = { 58, 60 },
    zone       = "Hellfire Peninsula",
    steps = {
        { type = "goto",    zone = "Blasted Lands", x = 58.0, y = 58.0, text = "Travel to the Dark Portal in the Blasted Lands" },
        { type = "note",    text = "Cross through the Dark Portal into Outland." },
        { type = "accept",  questID = 10120, questName = "Through the Dark Portal",  zone = "Hellfire Peninsula", x = 87.3, y = 48.6, text = "Speak with the Horde commander at the portal staging area" },
        { type = "turnin",  questID = 10120, questName = "Through the Dark Portal",  zone = "Hellfire Peninsula", x = 87.3, y = 48.6, text = "Complete the arrival report" },
        { type = "accept",  questID = 10121, questName = "Legion Assault",            zone = "Hellfire Peninsula", x = 87.3, y = 48.6, text = "Defend the staging area from demons" },
        { type = "kill",    target = "Fel Soldiers",                                  zone = "Hellfire Peninsula", x = 85.0, y = 49.0, text = "Defeat demon attackers at the portal" },
        { type = "turnin",  questID = 10121, questName = "Legion Assault",            zone = "Hellfire Peninsula", x = 87.3, y = 48.6, text = "Report the assault repelled" },
        { type = "goto",    zone = "Hellfire Peninsula", x = 55.0, y = 36.0, text = "Travel northwest along the road to Thrallmar" },
        { type = "fp",      zone = "Hellfire Peninsula", text = "Grab the Thrallmar flight path" },
        { type = "note",    text = "Set your Hearthstone at the Thrallmar inn." },
        { type = "accept",  questID = 10289, questName = "Thrallmar Assignments",     zone = "Hellfire Peninsula", x = 55.0, y = 36.0, text = "Begin the initial Thrallmar tasks" },
        { type = "note",    text = "Pick up all available Thrallmar quests." },
        { type = "kill",    target = "Bonechewer Orcs",                               zone = "Hellfire Peninsula", x = 58.0, y = 42.0, text = "Clear Bonechewer camps east of Thrallmar" },
        { type = "turnin",  questID = 10289, questName = "Thrallmar Assignments",     zone = "Hellfire Peninsula", x = 55.0, y = 36.0, text = "Report tasks completed" },
        { type = "note",    text = "Continue Thrallmar quests until 60, then proceed to the full Hellfire guide." },
    },
})
