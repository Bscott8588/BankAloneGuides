-------------------------------------------------------------------------------
-- Bank Alone Guides — Profession: Tailoring (1-375)
-- Original routing
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Prof_Tailoring", {
    title      = "Tailoring (1-375)",
    faction    = "Both",
    levelRange = { 1, 70 },
    category   = "profession",
    steps = {
        { type = "train",  skill = "Tailoring",     text = "Learn Apprentice Tailoring" },
        { type = "vendor", text = "Buy thread and dye from a tailoring supply vendor." },
        { type = "note",   text = "[1-45] Craft Linen Bolts and Brown Linen Pants/Shirts. Need ~90 Linen Cloth." },
        { type = "note",   text = "[45-70] Craft Heavy Linen Gloves. Need ~50 Linen Cloth, ~50 Coarse Thread." },
        { type = "train",  skill = "Tailoring",     text = "Train Journeyman Tailoring at 50+" },
        { type = "note",   text = "[70-100] Craft Wool Bolts and Azure Silk items." },
        { type = "note",   text = "[100-150] Craft Silk Bolts, Azure Silk Hood. Need ~150 Silk Cloth." },
        { type = "train",  skill = "Tailoring",     text = "Train Expert Tailoring at 125+" },
        { type = "note",   text = "[150-200] Craft Mageweave Bolts, Crimson Silk items. Need ~200 Mageweave Cloth." },
        { type = "train",  skill = "Tailoring",     text = "Train Artisan Tailoring at 200+" },
        { type = "note",   text = "[200-250] Craft Runecloth Bolts, Runecloth Belts/Bags. Need ~400 Runecloth." },
        { type = "note",   text = "[250-300] Craft Runecloth items, Felcloth items, Mooncloth." },
        { type = "train",  skill = "Tailoring",     text = "Train Master Tailoring (300) in Hellfire Peninsula" },
        { type = "note",   text = "[300-325] Craft Netherweave Bolts, Netherweave Bags (20-slot bags sell well!)." },
        { type = "note",   text = "[325-350] Craft Netherweave Tunic, Bolt of Imbued Netherweave." },
        { type = "note",   text = "[350-375] Choose Shadoweave, Spellfire, or Mooncloth specialization." },
        { type = "note",   text = "Craft specialty cloth CDs: Shadowcloth, Spellcloth, Primal Mooncloth." },
        { type = "note",   text = "At 375, Tailoring is maxed! Craft Frozen Shadoweave or Spellfire sets for endgame." },
    },
})
