-------------------------------------------------------------------------------
-- Bank Alone Guides — Profession: Enchanting (1-375)
-- Original routing
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Prof_Enchanting", {
    title      = "Enchanting (1-375)",
    faction    = "Both",
    levelRange = { 1, 70 },
    category   = "profession",
    steps = {
        { type = "train",  skill = "Enchanting",    text = "Learn Apprentice Enchanting" },
        { type = "note",   text = "Enchanting is expensive! Pair with Tailoring to craft and disenchant items." },
        { type = "note",   text = "[1-50] Enchant Bracer - Minor Health. Disenchant white/green items for materials." },
        { type = "note",   text = "[50-90] Enchant Bracer - Minor Stamina. Need Strange Dust." },
        { type = "train",  skill = "Enchanting",    text = "Train Journeyman Enchanting at 50+" },
        { type = "note",   text = "[90-130] Enchant Bracer - Minor Agility. Need Strange Dust + Greater Magic Essence." },
        { type = "train",  skill = "Enchanting",    text = "Train Expert Enchanting at 125+" },
        { type = "note",   text = "[130-170] Enchant Bracer - Lesser Stamina. Need Soul Dust." },
        { type = "note",   text = "[170-200] Enchant Bracer - Spirit. Need Vision Dust." },
        { type = "train",  skill = "Enchanting",    text = "Train Artisan Enchanting at 200+" },
        { type = "note",   text = "[200-235] Enchant Cloak - Greater Defense. Need Dream Dust." },
        { type = "note",   text = "[235-270] Enchant Gloves - Strength or Agility. Need Dream Dust, Illusion Dust." },
        { type = "note",   text = "[270-300] Enchant Cloak - Superior Defense. Need Illusion Dust + Greater Eternal Essence." },
        { type = "train",  skill = "Enchanting",    text = "Train Master Enchanting (300) in Hellfire Peninsula" },
        { type = "note",   text = "[300-325] Enchant Bracer - Assault. Need Arcane Dust (disenchant Outland greens)." },
        { type = "note",   text = "[325-350] Enchant Gloves - Assault or Enchant Shield - Tough Shield." },
        { type = "note",   text = "[350-375] Enchant Ring (unique to enchanters) or craft Runed Fel Iron Rod." },
        { type = "note",   text = "At 375, Enchanting is maxed! Ring enchants and Mongoose are very profitable." },
    },
})
