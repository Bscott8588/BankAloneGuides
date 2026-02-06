-------------------------------------------------------------------------------
-- Bank Alone Guides — Profession: Blacksmithing (1-375)
-- Original routing and material lists
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Prof_Blacksmithing", {
    title      = "Blacksmithing (1-375)",
    faction    = "Both",
    levelRange = { 1, 70 },
    category   = "profession",
    steps = {
        { type = "train",  skill = "Blacksmithing", text = "Learn Apprentice Blacksmithing from a trainer" },
        { type = "vendor", text = "Buy Weak Flux from a trade goods vendor (you'll need ~30)" },
        { type = "note",   text = "[1-25] Craft Rough Sharpening Stone (Rough Stone x1). Need ~30 Rough Stone." },
        { type = "note",   text = "[25-65] Craft Rough Grinding Stone (Rough Stone x2). Need ~40 Rough Stone." },
        { type = "note",   text = "[65-75] Craft Coarse Sharpening Stone (Coarse Stone x1). Need ~10." },
        { type = "train",  skill = "Blacksmithing", text = "Train Journeyman Blacksmithing at 50+" },
        { type = "note",   text = "[75-100] Craft Coarse Grinding Stone (Coarse Stone x2). Need ~50 Coarse Stone." },
        { type = "note",   text = "[100-125] Craft Silver Rod (Silver Bar x1, Rough Grinding Stone x2)." },
        { type = "train",  skill = "Blacksmithing", text = "Train Expert Blacksmithing at 125+" },
        { type = "note",   text = "[125-150] Craft Heavy Grinding Stone (Heavy Stone x3). Need ~75 Heavy Stone." },
        { type = "note",   text = "[150-200] Craft Golden Rod, Green Iron items, or Heavy Sharpening Stones." },
        { type = "train",  skill = "Blacksmithing", text = "Train Artisan Blacksmithing at 200+" },
        { type = "note",   text = "[200-250] Craft Mithril items: Mithril Spurs, Mithril Coif, Dense Sharpening Stones." },
        { type = "note",   text = "[250-300] Craft Thorium items: Imperial Plate set pieces, Thorium Bracers." },
        { type = "note",   text = "Imperial Plate set teaches recipes that are material-efficient for leveling." },
        { type = "train",  skill = "Blacksmithing", text = "Train Master Blacksmithing (300) in Hellfire Peninsula" },
        { type = "note",   text = "[300-325] Craft Fel Iron items: Fel Iron Plate Belt, Fel Iron Chain Tunic." },
        { type = "note",   text = "[325-350] Craft Adamantite items: Adamantite Cleaver, Lesser Ward of Shielding." },
        { type = "note",   text = "[350-375] Craft Felsteel items or specialty pieces. Choose Armorsmith or Weaponsmith specialization." },
        { type = "note",   text = "At 375, Blacksmithing is maxed! Craft epics for endgame use or sale." },
    },
})
