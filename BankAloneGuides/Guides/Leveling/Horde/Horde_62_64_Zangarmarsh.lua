-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 62-64: Zangarmarsh
-- Original routing through the mushroom marshlands
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_62_64_Zangarmarsh", {
    title      = "Zangarmarsh (62-64)",
    faction    = "Horde",
    levelRange = { 62, 64 },
    zone       = "Zangarmarsh",
    steps = {
        { type = "goto",    zone = "Zangarmarsh", x = 78.5, y = 63.0, text = "Enter Zangarmarsh from western Hellfire" },
        { type = "fp",      zone = "Zangarmarsh", text = "Grab the Cenarion Refuge flight path" },
        { type = "note",    text = "Pick up Cenarion Expedition quests (neutral)." },
        { type = "goto",    zone = "Zangarmarsh", x = 32.0, y = 50.0, text = "Head west to Swamprat Post (Horde hub)" },
        { type = "fp",      zone = "Zangarmarsh", text = "Get the Swamprat Post flight path" },
        { type = "note",    text = "Set your Hearthstone at Swamprat Post." },
        { type = "note",    text = "Pick up Horde-specific quests: naga scouts, spore gathering, and bog lord tasks." },
        { type = "accept",  questID = 9747, questName = "The Cenarion Expedition", zone = "Zangarmarsh", x = 78.5, y = 63.0, text = "Start the expedition quest chain" },
        { type = "collect", itemID = 24401, count = 10, itemName = "Unidentified Plant Parts", zone = "Zangarmarsh", x = 45.0, y = 55.0, text = "Gather plant parts from marshland creatures for reputation" },
        { type = "accept",  questID = 9752, questName = "Naga Infestation",        zone = "Zangarmarsh", x = 78.5, y = 63.0, text = "Investigate the naga water-draining operations" },
        { type = "kill",    target = "Naga at Coilfang Drain",                     zone = "Zangarmarsh", x = 52.0, y = 37.0, text = "Assault the naga at the main water pump locations" },
        { type = "turnin",  questID = 9752, questName = "Naga Infestation",        zone = "Zangarmarsh", x = 78.5, y = 63.0, text = "Report naga activities" },
        { type = "kill",    target = "Umbrafen Tribe",                             zone = "Zangarmarsh", x = 84.0, y = 80.0, text = "Clear the Umbrafen broken draenei camps in the southeast" },
        { type = "accept",  questID = 9770, questName = "Spore Samples",           zone = "Zangarmarsh", x = 78.5, y = 63.0, text = "Collect mushroom spore samples" },
        { type = "collect", itemID = 25433, count = 6, itemName = "Mature Spore Sac", zone = "Zangarmarsh", x = 55.0, y = 62.0, text = "Harvest spore sacs from fungal giants" },
        { type = "turnin",  questID = 9770, questName = "Spore Samples",           zone = "Zangarmarsh", x = 78.5, y = 63.0, text = "Return the spore samples" },
        { type = "hs",      text = "Hearthstone to Swamprat Post" },
        { type = "note",    text = "At 64, head to Terokkar Forest." },
    },
})
