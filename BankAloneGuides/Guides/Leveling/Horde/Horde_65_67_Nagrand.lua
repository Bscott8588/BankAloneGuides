-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 65-67: Nagrand
-- Original routing through the floating island plains
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_65_67_Nagrand", {
    title      = "Nagrand (65-67)",
    faction    = "Horde",
    levelRange = { 65, 67 },
    zone       = "Nagrand",
    steps = {
        { type = "fly",     destination = "Garadar", zone = "Nagrand", text = "Fly to Garadar, the Horde settlement in Nagrand" },
        { type = "fp",      zone = "Nagrand", text = "Grab the Garadar flight path" },
        { type = "note",    text = "Set your Hearthstone at the Garadar inn." },
        { type = "note",    text = "Pick up all Garadar quests: wildlife management, Murkblood raids, and elemental studies." },
        { type = "accept",  questID = 9862, questName = "Murkblood Raiders",      zone = "Nagrand", x = 55.3, y = 37.6, text = "Take the Murkblood elimination quest from Garadar" },
        { type = "kill",    target = "Murkblood Broken",                           zone = "Nagrand", x = 39.0, y = 45.0, text = "Eliminate Murkblood raiders threatening the settlement" },
        { type = "turnin",  questID = 9862, questName = "Murkblood Raiders",      zone = "Nagrand", x = 55.3, y = 37.6, text = "Report the raiders dealt with" },
        { type = "accept",  questID = 9861, questName = "The Throne of Elements", zone = "Nagrand", x = 61.0, y = 24.0, text = "Investigate the elemental shrine" },
        { type = "goto",    zone = "Nagrand", x = 61.0, y = 24.0, text = "Travel to the Throne of Elements" },
        { type = "note",    text = "Complete the elemental chain quests: fire, water, earth, air tasks." },
        { type = "turnin",  questID = 9861, questName = "The Throne of Elements", zone = "Nagrand", x = 61.0, y = 24.0, text = "Complete the elemental investigation" },
        { type = "accept",  questID = 9863, questName = "The Nesingwary Safari",  zone = "Nagrand", x = 71.0, y = 40.0, text = "Take on the great hunter's challenge at his camp" },
        { type = "kill",    target = "Clefthoofs",                                zone = "Nagrand", x = 55.0, y = 50.0, text = "Hunt clefthoofs roaming the plains" },
        { type = "kill",    target = "Talbuks",                                   zone = "Nagrand", x = 50.0, y = 45.0, text = "Track and hunt talbuks" },
        { type = "kill",    target = "Windrocs",                                  zone = "Nagrand", x = 57.0, y = 34.0, text = "Bring down windrocs near the ridges" },
        { type = "note",    text = "Complete all Nesingwary chapters and the Ring of Blood arena questline (bring a group)." },
        { type = "kill",    target = "Kil'sorrow Agents",                         zone = "Nagrand", x = 29.0, y = 57.0, text = "Destroy the Kil'sorrow cultists in the southwest" },
        { type = "hs",      text = "Hearthstone to Garadar" },
        { type = "note",    text = "At 67, proceed to Blade's Edge Mountains." },
    },
})
