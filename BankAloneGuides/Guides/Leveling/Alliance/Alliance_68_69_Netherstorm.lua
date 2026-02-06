-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 68-69: Netherstorm
-- Original routing through the shattered arcane wasteland
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_68_69_Netherstorm", {
    title      = "Netherstorm (68-69)",
    faction    = "Alliance",
    levelRange = { 68, 69 },
    zone       = "Netherstorm",
    steps = {
        { type = "fly",     destination = "Area 52", zone = "Netherstorm", text = "Fly to Area 52 in Netherstorm" },
        { type = "fp",      zone = "Netherstorm", text = "Grab the Area 52 flight path" },
        { type = "note",    text = "Set your Hearthstone at Area 52." },
        { type = "note",    text = "Pick up goblin quests and Kirin Tor investigations." },
        { type = "accept",  questID = 10173, questName = "Mana Forge Investigation", zone = "Netherstorm", x = 32.5, y = 63.8, text = "Begin investigating the mana forges" },
        { type = "goto",    zone = "Netherstorm", x = 23.0, y = 68.0, text = "Head southwest to Manaforge B'naar" },
        { type = "kill",    target = "Sunfury Blood Elves",                        zone = "Netherstorm", x = 22.0, y = 67.0, text = "Defeat Sunfury forces at the mana forge" },
        { type = "turnin",  questID = 10173, questName = "Mana Forge Investigation", zone = "Netherstorm", x = 32.5, y = 63.8, text = "Report the mana forge status" },
        { type = "accept",  questID = 10211, questName = "Eco-Dome Rescue",        zone = "Netherstorm", x = 42.0, y = 32.0, text = "Help the researchers trapped in the eco-dome" },
        { type = "goto",    zone = "Netherstorm", x = 42.0, y = 32.0, text = "Travel to the eco-dome biosphere" },
        { type = "note",    text = "Complete the eco-dome quests: lashers, mutant beasts, and data retrieval." },
        { type = "turnin",  questID = 10211, questName = "Eco-Dome Rescue",        zone = "Netherstorm", x = 42.0, y = 32.0, text = "Report the researchers rescued" },
        { type = "note",    text = "Work Stormspire quests and ethereal trader tasks." },
        { type = "goto",    zone = "Netherstorm", x = 45.0, y = 35.0, text = "Visit The Stormspire" },
        { type = "fp",      zone = "Netherstorm", text = "Get The Stormspire flight path" },
        { type = "kill",    target = "Void Creatures",                             zone = "Netherstorm", x = 55.0, y = 40.0, text = "Eliminate void beings threatening the arcane structures" },
        { type = "hs",      text = "Hearthstone to Area 52" },
        { type = "note",    text = "Continue Netherstorm quests. At 69, head to Shadowmoon Valley for the final zone." },
    },
})
