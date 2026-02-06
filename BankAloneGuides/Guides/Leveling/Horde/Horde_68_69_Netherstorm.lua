-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 68-69: Netherstorm
-- Original routing through the arcane wasteland
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_68_69_Netherstorm", {
    title      = "Netherstorm (68-69)",
    faction    = "Horde",
    levelRange = { 68, 69 },
    zone       = "Netherstorm",
    steps = {
        { type = "fly",     destination = "Area 52", zone = "Netherstorm", text = "Fly to Area 52 in Netherstorm" },
        { type = "fp",      zone = "Netherstorm", text = "Get the Area 52 flight path" },
        { type = "note",    text = "Set Hearthstone at Area 52." },
        { type = "note",    text = "Pick up all goblin and ethereal quests." },
        { type = "accept",  questID = 10173, questName = "Mana Forge Investigation", zone = "Netherstorm", x = 32.5, y = 63.8, text = "Investigate the blood elf mana forges" },
        { type = "goto",    zone = "Netherstorm", x = 23.0, y = 68.0, text = "Head to Manaforge B'naar" },
        { type = "kill",    target = "Sunfury Blood Elves",                        zone = "Netherstorm", x = 24.0, y = 68.0, text = "Defeat Sunfury forces siphoning mana" },
        { type = "turnin",  questID = 10173, questName = "Mana Forge Investigation", zone = "Netherstorm", x = 32.5, y = 63.8, text = "Report the mana forge status" },
        { type = "accept",  questID = 10211, questName = "Eco-Dome Rescue",        zone = "Netherstorm", x = 42.0, y = 32.0, text = "Rescue trapped researchers" },
        { type = "goto",    zone = "Netherstorm", x = 42.0, y = 32.0, text = "Head to the eco-dome" },
        { type = "note",    text = "Complete eco-dome quests: lasher clearing and data recovery." },
        { type = "turnin",  questID = 10211, questName = "Eco-Dome Rescue",        zone = "Netherstorm", x = 42.0, y = 32.0, text = "Report the rescue complete" },
        { type = "goto",    zone = "Netherstorm", x = 45.0, y = 35.0, text = "Visit The Stormspire for ethereal quests" },
        { type = "fp",      zone = "Netherstorm", text = "Get The Stormspire flight path" },
        { type = "kill",    target = "Void Creatures",                             zone = "Netherstorm", x = 53.0, y = 42.0, text = "Eliminate void beings threatening the region" },
        { type = "note",    text = "Complete the Manaforge Coruu and Duro quest chains." },
        { type = "hs",      text = "Hearthstone to Area 52" },
        { type = "note",    text = "At 69, head to Shadowmoon Valley for the final zone." },
    },
})
