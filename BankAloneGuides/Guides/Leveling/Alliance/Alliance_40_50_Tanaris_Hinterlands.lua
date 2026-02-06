-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 40-50: Tanaris & The Hinterlands
-- Original routing through the 40s bracket
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_40_50_Tanaris_Hinterlands", {
    title      = "Tanaris & Hinterlands (40-50)",
    faction    = "Alliance",
    levelRange = { 40, 50 },
    zone       = "Tanaris",
    steps = {
        { type = "fly",     destination = "Gadgetzan", zone = "Tanaris", text = "Fly to Gadgetzan in Tanaris" },
        { type = "fp",      zone = "Tanaris", text = "Get the Gadgetzan flight path" },
        { type = "note",    text = "Set your Hearthstone at the Gadgetzan inn." },
        { type = "note",    text = "Pick up all Gadgetzan quests: wastewander bandits, pirates, and bug investigations." },
        { type = "kill",    target = "Wastewander Bandits",                       zone = "Tanaris", x = 60.0, y = 38.0, text = "Clear bandit camps east of Gadgetzan" },
        { type = "kill",    target = "Southsea Pirates",                          zone = "Tanaris", x = 67.0, y = 55.0, text = "Defeat pirates at the Lost Rigger Cove" },
        { type = "goto",    zone = "Tanaris", x = 38.0, y = 79.0, text = "Travel south to the Thistleshrub Valley" },
        { type = "kill",    target = "Thistleshrub Dew Collectors",               zone = "Tanaris", x = 37.0, y = 78.0, text = "Clear the plant elementals in the valley" },
        { type = "hs",      text = "Hearthstone to Gadgetzan" },
        { type = "note",    text = "Turn in quests. If 43+, head to The Hinterlands." },

        -- Transition to Hinterlands
        { type = "fly",     destination = "Aerie Peak", zone = "The Hinterlands", text = "Fly to Aerie Peak in The Hinterlands" },
        { type = "fp",      zone = "The Hinterlands", text = "Grab the Aerie Peak flight path" },
        { type = "note",    text = "Set your Hearthstone to Aerie Peak." },
        { type = "note",    text = "Pick up Wildhammer dwarf quests and troll bounties." },
        { type = "kill",    target = "Vilebranch Trolls",                         zone = "The Hinterlands", x = 62.0, y = 69.0, text = "Assault the Vilebranch trolls in the eastern cliffs" },
        { type = "kill",    target = "Owlbeasts",                                 zone = "The Hinterlands", x = 51.0, y = 63.0, text = "Hunt owlbeasts for feather and pelt collection" },
        { type = "note",    text = "Complete the altar quest chain in the northeastern troll ruins." },
        { type = "goto",    zone = "The Hinterlands", x = 69.0, y = 43.0, text = "Explore the Jintha'Alor troll city for elite quests" },
        { type = "hs",      text = "Hearth to Aerie Peak" },
        { type = "note",    text = "Continue until 48-50. Head to Searing Gorge or Un'Goro Crater next." },
    },
})
