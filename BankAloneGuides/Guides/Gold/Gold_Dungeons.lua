-------------------------------------------------------------------------------
-- Bank Alone Guides — Gold: Dungeon Farms
-- Original dungeon gold-making strategies
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Gold_Dungeons", {
    title      = "Gold Dungeon Farms",
    faction    = "Both",
    levelRange = { 70, 70 },
    category   = "gold",
    steps = {
        { type = "note",   text = "=== DUNGEON GOLD FARMS ===" },
        { type = "note",   text = "Requires level 70. Some farms are class-dependent." },

        { type = "note",   text = "--- Slave Pens (Normal) ---" },
        { type = "note",   text = "Location: Coilfang Reservoir, Zangarmarsh." },
        { type = "note",   text = "Solo-able by well-geared Warlocks, Paladins, Hunters." },
        { type = "note",   text = "Drops: Netherweave Cloth, greens for disenchanting, raw gold from vendoring." },
        { type = "note",   text = "Clear time: 15-25 minutes. Expected: 40-80g per run." },

        { type = "note",   text = "--- Shadow Labyrinth ---" },
        { type = "note",   text = "Location: Auchindoun, Terokkar Forest." },
        { type = "note",   text = "Full group recommended. Lots of mobs = lots of cloth and green drops." },
        { type = "note",   text = "Also gives Lower City reputation if still needed." },

        { type = "note",   text = "--- Mechanar ---" },
        { type = "note",   text = "Location: Tempest Keep, Netherstorm." },
        { type = "note",   text = "Shorter dungeon with many mobs. Good for Arcane Dust farming." },
        { type = "note",   text = "Fire Mages can AoE farm trash for very fast clears." },

        { type = "note",   text = "--- Botanica ---" },
        { type = "note",   text = "Location: Tempest Keep, Netherstorm." },
        { type = "note",   text = "Excellent for herb farmers (Herbalism lets you gather herbs inside)." },
        { type = "note",   text = "Drops high-level greens and a chance for epic BOEs." },

        { type = "note",   text = "--- Stratholme (Classic) ---" },
        { type = "note",   text = "Location: Eastern Plaguelands, Azeroth." },
        { type = "note",   text = "Trivial at 70. Farm for Righteous Orbs and large amounts of Runecloth." },
        { type = "note",   text = "Also drops the rare Deathcharger mount!" },

        { type = "note",   text = "--- General Dungeon Farming Tips ---" },
        { type = "note",   text = "Loot everything. Vendor grays and whites, AH greens, disenchant blues." },
        { type = "note",   text = "You can enter 5 instances per hour (lockout limit). Plan runs accordingly." },
    },
})
