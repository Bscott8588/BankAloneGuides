-------------------------------------------------------------------------------
-- Bank Alone Guides — Gold: Profession-Based Strategies
-- Original gold-making advice for TBC Classic professions
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Gold_Professions", {
    title      = "Gold via Professions",
    faction    = "Both",
    levelRange = { 60, 70 },
    category   = "gold",
    steps = {
        { type = "note",   text = "=== PROFESSION-BASED GOLD STRATEGIES ===" },

        { type = "note",   text = "--- Alchemy ---" },
        { type = "note",   text = "Transmute Primal Might daily (1 each of Primal Fire/Water/Earth/Air/Mana = 1 Primal Might)." },
        { type = "note",   text = "Transmutation spec gives a chance for extra procs — highly profitable." },
        { type = "note",   text = "Craft Super Mana Potions and Flasks for raiders. Sell before reset days." },

        { type = "note",   text = "--- Tailoring ---" },
        { type = "note",   text = "Craft Netherweave Bags (20-slot) — steady sellers on every server." },
        { type = "note",   text = "Use Shadowcloth/Spellcloth/Primal Mooncloth cooldowns. These sell for 20-50g+ each." },
        { type = "note",   text = "Craft Spellstrike/Frozen Shadoweave sets for caster customers." },

        { type = "note",   text = "--- Enchanting ---" },
        { type = "note",   text = "Sell popular enchants in trade chat: Mongoose, Spellpower, Savagery." },
        { type = "note",   text = "Disenchant cheap AH greens into Arcane Dust and Greater Planar Essence." },
        { type = "note",   text = "Tip: Offer free enchants with customer materials to build reputation, then charge for rare formulas." },

        { type = "note",   text = "--- Mining + Jewelcrafting ---" },
        { type = "note",   text = "Mine Adamantite Ore and prospect for gems. Cut popular gems and sell." },
        { type = "note",   text = "Top sellers: Bold Living Ruby, Runed Living Ruby, Solid Star of Elune." },

        { type = "note",   text = "--- Herbalism ---" },
        { type = "note",   text = "Gather herbs while questing or doing dailies. Terocone and Nightmare Vine sell highest." },
        { type = "note",   text = "Farm Mana Thistle in Netherstorm/Blade's Edge for premium pricing." },

        { type = "note",   text = "--- Engineering ---" },
        { type = "note",   text = "Craft Khorium Scopes (crit scope) for hunters and sell on AH." },
        { type = "note",   text = "Engineering-only head enchants (goggles) make the profession worth its cost." },

        { type = "note",   text = "--- Skinning + Leatherworking ---" },
        { type = "note",   text = "Sell Knothide Leather and Heavy Knothide Leather on AH." },
        { type = "note",   text = "Craft Drums of Battle for raiding guilds — very high demand." },
    },
})
