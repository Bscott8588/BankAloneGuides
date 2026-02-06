-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 1-10: Eversong Woods
-- Original routing for Blood Elf starting experience
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_01_10_Eversong", {
    title      = "Eversong Woods (1-10)",
    faction    = "Horde",
    levelRange = { 1, 10 },
    zone       = "Eversong Woods",
    steps = {
        { type = "accept",  questID = 8325, questName = "Reclaiming Sunstrider Isle", zone = "Eversong Woods", x = 38.2, y = 20.8, text = "Speak with Magistrix Erona on Sunstrider Isle" },
        { type = "accept",  questID = 8326, questName = "Unfortunate Measures",       zone = "Eversong Woods", x = 38.2, y = 20.8, text = "Take the mana wyrm control task" },
        { type = "kill",    target = "Mana Wyrms",                                    zone = "Eversong Woods", x = 37.0, y = 22.0, text = "Defeat mana wyrms feeding on the isle's ley lines" },
        { type = "kill",    target = "Arcane Wraiths",                                zone = "Eversong Woods", x = 36.0, y = 23.0, text = "Eliminate the malfunctioning arcane constructs" },
        { type = "turnin",  questID = 8325, questName = "Reclaiming Sunstrider Isle", zone = "Eversong Woods", x = 38.2, y = 20.8, text = "Report to Magistrix Erona" },
        { type = "turnin",  questID = 8326, questName = "Unfortunate Measures",       zone = "Eversong Woods", x = 38.2, y = 20.8, text = "Turn in the mana wyrm task" },
        { type = "accept",  questID = 8327, questName = "Completing the Delivery",    zone = "Eversong Woods", x = 38.2, y = 20.8, text = "Deliver a package to Falconwing Square" },
        { type = "goto",    zone = "Eversong Woods", x = 48.2, y = 47.6, text = "Follow the road south to Falconwing Square" },
        { type = "turnin",  questID = 8327, questName = "Completing the Delivery",    zone = "Eversong Woods", x = 48.2, y = 47.6, text = "Deliver the package at Falconwing Square" },
        { type = "note",    text = "Set your Hearthstone at Falconwing Square." },
        { type = "note",    text = "Pick up all quests: Wretched clearing, lynx hunting, and arcane sanctum tasks." },
        { type = "kill",    target = "Wretched",                                      zone = "Eversong Woods", x = 44.0, y = 51.0, text = "Defeat the Wretched addicts near the arcane sanctums" },
        { type = "kill",    target = "Springpaw Lynxes",                              zone = "Eversong Woods", x = 50.0, y = 55.0, text = "Hunt lynxes for pelt gathering quests" },
        { type = "note",    text = "Work through the Thuron's Livery and Dead Scar quest chains." },
        { type = "goto",    zone = "Eversong Woods", x = 55.0, y = 54.0, text = "Head to the Dead Scar for undead-fighting quests" },
        { type = "kill",    target = "Plaguebone Scourge",                            zone = "Eversong Woods", x = 55.0, y = 53.0, text = "Clear Scourge from the Dead Scar" },
        { type = "hs",      text = "Hearthstone to Falconwing Square" },
        { type = "note",    text = "At level 10, visit Silvermoon City for class training." },
        { type = "goto",    zone = "Silvermoon City", x = 53.0, y = 20.0, text = "Enter Silvermoon City" },
        { type = "fp",      zone = "Silvermoon City", text = "Get the Silvermoon City flight path" },
        { type = "note",    text = "Train skills. Head to Ghostlands (10-20) next!" },
    },
})
