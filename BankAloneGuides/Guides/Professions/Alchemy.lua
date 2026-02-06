--[[
    Bank Alone Guides - Alchemy Profession Guide (1-375)
    SCS / Bank Alone Guides
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Profession_Alchemy", {
    title = "Alchemy 1-375",
    faction = "Both",
    levelRange = {1, 70},
    category = "Profession",
    steps = {
        { type = "note", text = "Alchemy Guide: Learn Alchemy from any capital city trainer. Requires Herbalism or AH herbs.", conditions = {} },
        { type = "train", text = "Alliance: Lilyssia Nightbreeze in Stormwind. Horde: Yelmak in Orgrimmar.", conditions = {} },
        { type = "note", text = "Buy empty vials from Alchemy supply vendors near trainers.", conditions = {} },

        { type = "note", text = "[1-60] Craft Minor Healing Potions (Peacebloom + Silverleaf + Empty Vial) x60.", conditions = {} },
        { type = "note", text = "[60-110] Craft Lesser Healing Potions (Minor Healing Potion + Briarthorn) x50.", conditions = {} },
        { type = "note", text = "[110-140] Craft Healing Potions (Bruiseweed + Briarthorn + Leaded Vial) x30.", conditions = {} },
        { type = "note", text = "[140-155] Craft Lesser Mana Potions (Mageroyal + Stranglekelp + Empty Vial) x15.", conditions = {} },
        { type = "note", text = "[155-185] Craft Greater Healing Potions (Liferoot + Kingsblood + Leaded Vial) x30.", conditions = {} },
        { type = "note", text = "[185-210] Craft Elixir of Agility (Stranglekelp + Goldthorn + Leaded Vial) x25.", conditions = {} },
        { type = "note", text = "[210-235] Craft Elixir of Greater Defense (Wild Steelbloom + Goldthorn + Leaded Vial) x25.", conditions = {} },
        { type = "note", text = "[235-250] Craft Superior Healing Potions (Sungrass + Khadgar's Whisker + Crystal Vial) x15.", conditions = {} },
        { type = "note", text = "[250-275] Craft Elixir of Detect Undead (Arthas' Tears + Crystal Vial) x25.", conditions = {} },
        { type = "note", text = "[275-300] Craft Major Healing Potions (Golden Sansam + Mountain Silversage + Crystal Vial) x25.", conditions = {} },
        { type = "note", text = "[300-315] Craft Volatile Healing Potions (Felweed + Golden Sansam + Imbued Vial) x15. Train Master.", conditions = {} },
        { type = "note", text = "[315-335] Craft Super Healing Potions (Netherbloom + Felweed + Imbued Vial) x20.", conditions = {} },
        { type = "note", text = "[335-350] Craft Super Mana Potions (Dreaming Glory + Felweed + Imbued Vial) x15.", conditions = {} },
        { type = "note", text = "[350-375] Craft Major Dreamless Sleep Potions or transmute Primal Mights for skill.", conditions = {} },
        { type = "note", text = "Alchemy 375 reached! Specialize in Transmutation, Elixirs, or Potions for recipe procs.", conditions = {} },
    },
})
