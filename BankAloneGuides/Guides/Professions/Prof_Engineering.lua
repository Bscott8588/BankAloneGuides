-------------------------------------------------------------------------------
-- Bank Alone Guides — Profession: Engineering (1-375)
-- Original routing
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Prof_Engineering", {
    title      = "Engineering (1-375)",
    faction    = "Both",
    levelRange = { 1, 70 },
    category   = "profession",
    steps = {
        { type = "train",  skill = "Engineering",   text = "Learn Apprentice Engineering" },
        { type = "note",   text = "[1-40] Craft Rough Blasting Powder (Rough Stone x2). Need ~60 Rough Stone." },
        { type = "note",   text = "[40-50] Craft Handful of Copper Bolts (Copper Bar x1). Need ~10 Copper Bars." },
        { type = "note",   text = "[50-75] Craft Arclight Spanner (Copper Bar x6). Only need 1, then craft Copper Tubes." },
        { type = "train",  skill = "Engineering",   text = "Train Journeyman Engineering at 50+" },
        { type = "note",   text = "[75-100] Craft Coarse Blasting Powder (Coarse Stone x2). Need ~50 Coarse Stone." },
        { type = "note",   text = "[100-125] Craft Bronze Tubes (Bronze Bar x2). Need ~50 Bronze Bars." },
        { type = "train",  skill = "Engineering",   text = "Train Expert Engineering at 125+" },
        { type = "note",   text = "[125-150] Craft Heavy Blasting Powder and Iron Struts." },
        { type = "note",   text = "[150-200] Craft Gyromatic Micro-Adjustors, Mithril Casings, Unstable Triggers." },
        { type = "train",  skill = "Engineering",   text = "Train Artisan Engineering at 200+" },
        { type = "note",   text = "[200-250] Craft Mithril items: Hi-Explosive Bombs, Mithril Gyro-Shot." },
        { type = "note",   text = "[250-300] Craft Thorium items: Thorium Widgets, Thorium Shells." },
        { type = "note",   text = "Choose Goblin or Gnomish specialization at 200." },
        { type = "train",  skill = "Engineering",   text = "Train Master Engineering (300) in Hellfire Peninsula" },
        { type = "note",   text = "[300-325] Craft Fel Iron Casings, Handful of Fel Iron Bolts." },
        { type = "note",   text = "[325-350] Craft Adamantite Shells, White Smoke Flares." },
        { type = "note",   text = "[350-375] Craft Flying Machine (or Turbo-Charged), Khorium Scope, epic goggles." },
        { type = "note",   text = "At 375, Engineering is maxed! Epic goggles are some of the best pre-raid items." },
    },
})
