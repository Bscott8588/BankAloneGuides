-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 65-67: Nagrand
-- Original routing through the floating island plains
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_65_67_Nagrand", {
    title      = "Nagrand (65-67)",
    faction    = "Alliance",
    levelRange = { 65, 67 },
    zone       = "Nagrand",
    steps = {
        { type = "fly",     destination = "Telaar", zone = "Nagrand", text = "Fly to Telaar, the Alliance settlement in Nagrand" },
        { type = "fp",      zone = "Nagrand", text = "Grab the Telaar flight path" },
        { type = "note",    text = "Set your Hearthstone at the Telaar inn." },
        { type = "note",    text = "Pick up all Telaar quests: wildlife hunting, ogre bounties, and elemental investigations." },
        { type = "accept",  questID = 9861, questName = "The Throne of Elements", zone = "Nagrand", x = 61.0, y = 24.0, text = "Begin the Throne of Elements chain in northern Nagrand" },
        { type = "goto",    zone = "Nagrand", x = 61.0, y = 24.0, text = "Travel north to the Throne of Elements" },
        { type = "note",    text = "Complete elemental quests at the Throne: fire, water, earth, and air tasks." },
        { type = "turnin",  questID = 9861, questName = "The Throne of Elements", zone = "Nagrand", x = 61.0, y = 24.0, text = "Complete the elemental investigation" },
        { type = "accept",  questID = 9863, questName = "The Nesingwary Safari",  zone = "Nagrand", x = 71.0, y = 40.0, text = "Begin the Nesingwary hunting quests at his camp" },
        { type = "kill",    target = "Clefthoofs",                                zone = "Nagrand", x = 55.0, y = 50.0, text = "Hunt clefthoofs across the plains" },
        { type = "kill",    target = "Talbuks",                                   zone = "Nagrand", x = 50.0, y = 45.0, text = "Hunt talbuks in the open grasslands" },
        { type = "kill",    target = "Windrocs",                                  zone = "Nagrand", x = 58.0, y = 35.0, text = "Take down windrocs near the Throne area" },
        { type = "note",    text = "Progress through all three Nesingwary chapters, then the final elite hunt." },
        { type = "goto",    zone = "Nagrand", x = 32.0, y = 43.0, text = "Head west to the Halaa PvP area for quest objectives" },
        { type = "kill",    target = "Kil'sorrow Cultists",                       zone = "Nagrand", x = 27.0, y = 58.0, text = "Clear Shadow Council cultists in the southwest" },
        { type = "hs",      text = "Hearthstone to Telaar" },
        { type = "note",    text = "Continue working Nagrand quests. Head to Blade's Edge Mountains at 67." },
    },
})
