-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 62-64: Zangarmarsh
-- Original routing through the mushroom marshlands
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_62_64_Zangarmarsh", {
    title      = "Zangarmarsh (62-64)",
    faction    = "Alliance",
    levelRange = { 62, 64 },
    zone       = "Zangarmarsh",
    steps = {
        { type = "goto",    zone = "Zangarmarsh", x = 78.5, y = 63.0, text = "Enter Zangarmarsh from western Hellfire Peninsula" },
        { type = "fp",      zone = "Zangarmarsh", text = "Grab the Cenarion Refuge flight path" },
        { type = "note",    text = "Set your Hearthstone at the Cenarion Refuge." },
        { type = "accept",  questID = 9747, questName = "The Cenarion Expedition", zone = "Zangarmarsh", x = 78.5, y = 63.0, text = "Begin the Cenarion Expedition quest chain" },
        { type = "accept",  questID = 9752, questName = "Naga Infestation",        zone = "Zangarmarsh", x = 78.5, y = 63.0, text = "Take the naga investigation quest" },
        { type = "collect", itemID = 24401, count = 10, itemName = "Unidentified Plant Parts", zone = "Zangarmarsh", x = 72.0, y = 60.0, text = "Gather plant parts from the bog creatures for rep turn-ins" },
        { type = "kill",    target = "Naga along the water channels",              zone = "Zangarmarsh", x = 65.0, y = 68.0, text = "Clear naga encampments draining the marsh water" },
        { type = "turnin",  questID = 9752, questName = "Naga Infestation",        zone = "Zangarmarsh", x = 78.5, y = 63.0, text = "Report naga activity to the refuge" },
        { type = "goto",    zone = "Zangarmarsh", x = 68.0, y = 50.0, text = "Move north to Telredor (Alliance quest hub)" },
        { type = "fp",      zone = "Zangarmarsh", text = "Grab the Telredor flight path" },
        { type = "note",    text = "Pick up Telredor quests: spore collection, fungal studies, and marsh walker tasks." },
        { type = "accept",  questID = 9770, questName = "Spore Samples",           zone = "Zangarmarsh", x = 68.0, y = 49.0, text = "Collect mushroom spore samples for research" },
        { type = "collect", itemID = 25433, count = 6, itemName = "Mature Spore Sac", zone = "Zangarmarsh", x = 60.0, y = 42.0, text = "Gather spore sacs from the giant mushroom creatures" },
        { type = "turnin",  questID = 9770, questName = "Spore Samples",           zone = "Zangarmarsh", x = 68.0, y = 49.0, text = "Return samples to Telredor" },
        { type = "note",    text = "Work the Umbrafen and Darkcrest naga areas for additional quests." },
        { type = "kill",    target = "Darkcrest Naga",                             zone = "Zangarmarsh", x = 65.0, y = 68.0, text = "Assault the Darkcrest naga base" },
        { type = "kill",    target = "Umbrafen Tribe",                             zone = "Zangarmarsh", x = 84.0, y = 80.0, text = "Clear the Umbrafen broken draenei camps" },
        { type = "hs",      text = "Hearthstone to Cenarion Refuge" },
        { type = "note",    text = "Complete remaining quests. At 64, proceed to Terokkar Forest." },
    },
})
