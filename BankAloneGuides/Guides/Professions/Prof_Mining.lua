-------------------------------------------------------------------------------
-- Bank Alone Guides — Profession: Mining (1-375)
-- Original routing and material guidance
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Prof_Mining", {
    title      = "Mining (1-375)",
    faction    = "Both",
    levelRange = { 1, 70 },
    category   = "profession",
    zone       = nil,
    steps = {
        { type = "train",  skill = "Mining",        text = "Learn Apprentice Mining from any capital city trainer", zone = "Stormwind City" },
        { type = "note",   text = "Buy a Mining Pick from a trade goods vendor if you don't have one." },
        -- 1-65: Copper
        { type = "note",   text = "[1-65] Mine Copper Ore. Best routes: Elwynn Forest, Dun Morogh, Durotar, Mulgore." },
        { type = "goto",   zone = "Elwynn Forest", x = 40.0, y = 55.0, text = "Loop around the hills south of Goldshire for copper veins" },
        { type = "note",   text = "Smelt Copper Bars at any forge. This also grants skill points." },
        -- 65-125: Tin
        { type = "train",  skill = "Mining",        text = "Train Journeyman Mining at 50+ skill" },
        { type = "note",   text = "[65-125] Mine Tin Ore. Found in: Westfall, Loch Modan, The Barrens, Hillsbrad." },
        { type = "note",   text = "You can also smelt Bronze Bars (Copper + Tin) for extra points." },
        -- 125-175: Iron
        { type = "train",  skill = "Mining",        text = "Train Expert Mining at 125+ skill (requires specific trainer)" },
        { type = "note",   text = "[125-175] Mine Iron Ore. Best zones: Arathi Highlands, Stranglethorn Vale, Badlands." },
        { type = "goto",   zone = "Arathi Highlands", x = 55.0, y = 50.0, text = "Circuit the Arathi Highlands highlands for iron deposits" },
        -- 175-250: Mithril
        { type = "train",  skill = "Mining",        text = "Train Artisan Mining at 200+ skill" },
        { type = "note",   text = "[175-250] Mine Mithril Ore. Found in: Tanaris, Hinterlands, Badlands, Burning Steppes." },
        { type = "goto",   zone = "Tanaris", x = 50.0, y = 50.0, text = "Circuit through Tanaris desert for mithril nodes" },
        { type = "note",   text = "Smelt Mithril Bars for easy points when nodes are scarce." },
        -- 250-300: Thorium
        { type = "note",   text = "[250-300] Mine Thorium Ore. Best zones: Un'Goro Crater, Winterspring, EPL, Burning Steppes." },
        { type = "goto",   zone = "Un'Goro Crater", x = 50.0, y = 50.0, text = "Circle Un'Goro Crater walls — richest thorium zone" },
        { type = "note",   text = "Rich Thorium Veins appear at 275+ skill. These give more ore per node." },
        -- 300-375: Outland
        { type = "train",  skill = "Mining",        text = "Train Master Mining (300) in Hellfire Peninsula at Honor Hold or Thrallmar" },
        { type = "note",   text = "[300-325] Mine Fel Iron Ore in Hellfire Peninsula. Plentiful along the roads and hills." },
        { type = "goto",   zone = "Hellfire Peninsula", x = 55.0, y = 55.0, text = "Loop Hellfire Peninsula for Fel Iron deposits" },
        { type = "note",   text = "[325-350] Mine Adamantite Ore in Nagrand, Terokkar, Blade's Edge Mountains." },
        { type = "goto",   zone = "Nagrand", x = 55.0, y = 45.0, text = "Circuit Nagrand for adamantite nodes" },
        { type = "note",   text = "[350-375] Mine Khorium Ore (rare) and Rich Adamantite in Netherstorm, Shadowmoon Valley." },
        { type = "note",   text = "At 375, congratulations — Mining is maxed for TBC!" },
    },
})
