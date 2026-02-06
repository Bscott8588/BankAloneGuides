-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 40-50: Tanaris & Hinterlands
-- Original routing for the 40s bracket
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_40_50_Tanaris_Hinterlands", {
    title      = "Tanaris & Hinterlands (40-50)",
    faction    = "Horde",
    levelRange = { 40, 50 },
    zone       = "Tanaris",
    steps = {
        { type = "fly",     destination = "Gadgetzan", zone = "Tanaris", text = "Fly to Gadgetzan in Tanaris" },
        { type = "fp",      zone = "Tanaris", text = "Grab the Gadgetzan flight path" },
        { type = "note",    text = "Set Hearthstone at Gadgetzan." },
        { type = "note",    text = "Pick up goblin quests: wastewander bounties, insect studies, and pirate raids." },
        { type = "kill",    target = "Wastewander Bandits",                        zone = "Tanaris", x = 60.0, y = 37.0, text = "Clear bandit encampments east of Gadgetzan" },
        { type = "kill",    target = "Dunemaul Ogres",                             zone = "Tanaris", x = 41.0, y = 57.0, text = "Defeat ogres at the Dunemaul Compound" },
        { type = "goto",    zone = "Tanaris", x = 67.0, y = 55.0, text = "Head east to the pirate cove" },
        { type = "kill",    target = "Southsea Pirates",                           zone = "Tanaris", x = 68.0, y = 56.0, text = "Clear Southsea pirates for bounty quests" },
        { type = "note",    text = "Run Zul'Farrak dungeon at 44-48 for excellent drops and XP." },
        { type = "hs",      text = "Hearthstone to Gadgetzan" },

        -- Hinterlands
        { type = "note",    text = "At 45, head to The Hinterlands for the Revantusk Village quests." },
        { type = "fly",     destination = "Revantusk Village", zone = "The Hinterlands", text = "Fly to Revantusk Village (Horde hub) in The Hinterlands" },
        { type = "fp",      zone = "The Hinterlands", text = "Grab the Revantusk Village flight path" },
        { type = "note",    text = "Set Hearthstone to Revantusk Village." },
        { type = "note",    text = "Pick up troll bounties and the Vilebranch assault quests." },
        { type = "kill",    target = "Vilebranch Trolls",                          zone = "The Hinterlands", x = 63.0, y = 69.0, text = "Storm the Vilebranch troll holdings" },
        { type = "kill",    target = "Owlbeasts",                                  zone = "The Hinterlands", x = 52.0, y = 64.0, text = "Hunt owlbeasts for the feather collection" },
        { type = "goto",    zone = "The Hinterlands", x = 70.0, y = 44.0, text = "Push to Jintha'Alor for elite troll quests" },
        { type = "hs",      text = "Hearth to Revantusk Village" },
        { type = "note",    text = "At 48-50, proceed to Searing Gorge, Burning Steppes, or Un'Goro Crater." },
    },
})
