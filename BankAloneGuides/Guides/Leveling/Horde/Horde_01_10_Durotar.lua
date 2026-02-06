-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 1-10: Durotar
-- Original routing for Orc/Troll starting experience
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_01_10_Durotar", {
    title      = "Durotar (1-10)",
    faction    = "Horde",
    levelRange = { 1, 10 },
    zone       = "Durotar",
    steps = {
        { type = "accept",  questID = 788,  questName = "Sarkoth",               zone = "Durotar", x = 42.0, y = 68.3, text = "Speak with your trainer at the Valley of Trials" },
        { type = "accept",  questID = 790,  questName = "Lazy Peons",            zone = "Durotar", x = 42.8, y = 69.2, text = "Get the peon motivation task from Gornek" },
        { type = "kill",    target = "Scorpids",                                  zone = "Durotar", x = 43.0, y = 72.0, text = "Defeat the large scorpid Sarkoth south of the den" },
        { type = "turnin",  questID = 788,  questName = "Sarkoth",               zone = "Durotar", x = 42.0, y = 68.3, text = "Return with proof of the scorpid's defeat" },
        { type = "note",    text = "Use the blackjack on sleeping peons around the lumber area." },
        { type = "turnin",  questID = 790,  questName = "Lazy Peons",            zone = "Durotar", x = 42.8, y = 69.2, text = "Report the peons awakened" },
        { type = "accept",  questID = 840,  questName = "Vile Familiars",        zone = "Durotar", x = 42.8, y = 69.2, text = "Clear the corrupted imps from a nearby cave" },
        { type = "goto",    zone = "Durotar", x = 43.5, y = 76.0, text = "Head south to the cave entrance" },
        { type = "kill",    target = "Vile Familiars",                            zone = "Durotar", x = 43.5, y = 78.0, text = "Defeat the imp familiars infesting the cave" },
        { type = "turnin",  questID = 840,  questName = "Vile Familiars",        zone = "Durotar", x = 42.8, y = 69.2, text = "Report the cave cleared" },
        { type = "note",    text = "You should be level 5-6. Follow the road north to Razor Hill." },
        { type = "accept",  questID = 806,  questName = "Report to Razor Hill",  zone = "Durotar", x = 42.8, y = 69.2, text = "Carry your report to Razor Hill" },
        { type = "goto",    zone = "Durotar", x = 52.0, y = 43.2, text = "Follow the road north to Razor Hill" },
        { type = "fp",      zone = "Durotar", text = "Grab the Razor Hill flight path" },
        { type = "turnin",  questID = 806,  questName = "Report to Razor Hill",  zone = "Durotar", x = 52.0, y = 43.2, text = "Deliver the report at Razor Hill" },
        { type = "note",    text = "Set your Hearthstone at the Razor Hill inn." },
        { type = "note",    text = "Pick up all Razor Hill quests: quilboar clearing, coast patrols, and Kolkar centaur tasks." },
        { type = "kill",    target = "Razormane Quilboar",                        zone = "Durotar", x = 48.0, y = 52.0, text = "Clear quilboar from the camps south of Razor Hill" },
        { type = "kill",    target = "Kolkar Centaurs",                           zone = "Durotar", x = 59.0, y = 59.0, text = "Defeat centaurs threatening the Durotar coastline" },
        { type = "note",    text = "Work through coastal murloc and shipwreck quests on the eastern shore." },
        { type = "kill",    target = "Makrura and Murlocs",                       zone = "Durotar", x = 62.0, y = 35.0, text = "Clear makrura along the coast for bounty quests" },
        { type = "hs",      text = "Hearthstone to Razor Hill" },
        { type = "note",    text = "At level 10, head north to Orgrimmar for training." },
        { type = "goto",    zone = "Orgrimmar", x = 45.1, y = 63.9, text = "Enter Orgrimmar and grab the flight path" },
        { type = "fp",      zone = "Orgrimmar", text = "Get the Orgrimmar flight path" },
        { type = "note",    text = "Train all skills. You're ready for The Barrens (10-20)!" },
    },
})
