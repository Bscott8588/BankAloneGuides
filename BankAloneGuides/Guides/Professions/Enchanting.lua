--[[
    Bank Alone Guides - Enchanting Profession Guide (1-375)
    SCS / Bank Alone Guides
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Profession_Enchanting", {
    title = "Enchanting 1-375",
    faction = "Both",
    levelRange = {1, 70},
    category = "Profession",
    steps = {
        { type = "note", text = "Enchanting Guide: Disenchant green+ items for materials. No gathering profession needed, but expensive to level!", conditions = {} },
        { type = "train", text = "Alliance: Lucan Cordell in Stormwind. Horde: Godan in Orgrimmar.", conditions = {} },

        { type = "note", text = "[1-50] Enchant Bracer - Minor Health. Use Strange Dust from disenchanting level 5-15 greens.", conditions = {} },
        { type = "note", text = "[50-90] Enchant Bracer - Minor Stamina or Minor Deflection.", conditions = {} },
        { type = "note", text = "[90-110] Enchant Bracer - Minor Agility. Uses Lesser Magic Essence.", conditions = {} },
        { type = "note", text = "[110-135] Enchant Cloak - Minor Agility or Enchant Shield - Minor Stamina.", conditions = {} },
        { type = "note", text = "[135-155] Enchant Bracer - Lesser Stamina. Uses Soul Dust from level 20-30 greens. Train Expert.", conditions = {} },
        { type = "note", text = "[155-185] Enchant Bracer - Strength or Spirit.", conditions = {} },
        { type = "note", text = "[185-210] Enchant Cloak - Greater Defense. Uses Vision Dust from level 30-40 greens. Train Artisan.", conditions = {} },
        { type = "note", text = "[210-235] Enchant Gloves - Agility or Enchant Boots - Stamina.", conditions = {} },
        { type = "note", text = "[235-265] Enchant Cloak - Greater Resistance or Enchant Chest - Superior Mana.", conditions = {} },
        { type = "note", text = "[265-300] Enchant Bracer - Greater Intellect. Uses Illusion Dust from level 50-60 greens.", conditions = {} },
        { type = "note", text = "[300-315] Enchant Bracer - Assault or Enchant Cloak - Major Armor. Uses Arcane Dust. Train Master.", conditions = {} },
        { type = "note", text = "[315-340] Enchant Bracer - Brawn or Enchant Gloves - Assault.", conditions = {} },
        { type = "note", text = "[340-360] Enchant Shield - Resilience or Enchant Chest - Exceptional Stats.", conditions = {} },
        { type = "note", text = "[360-375] Enchant Weapon - Major Intellect or Mongoose (recipe from Karazhan). Use Void Crystals.", conditions = {} },
        { type = "note", text = "Enchanting 375! Sell enchants via trade chat and scrolls on the AH. Mongoose is a big money-maker.", conditions = {} },
    },
})
