-------------------------------------------------------------------------------
-- Bank Alone Guides — Profession: Alchemy (1-375)
-- Original routing
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Prof_Alchemy", {
    title      = "Alchemy (1-375)",
    faction    = "Both",
    levelRange = { 1, 70 },
    category   = "profession",
    steps = {
        { type = "train",  skill = "Alchemy",       text = "Learn Apprentice Alchemy" },
        { type = "vendor", text = "Buy Empty Vials from an alchemy supply vendor." },
        { type = "note",   text = "[1-60] Craft Minor Healing Potion (Peacebloom x1, Silverleaf x1, Empty Vial x1)." },
        { type = "note",   text = "[60-110] Craft Lesser Healing Potion (Minor Healing Potion x1, Briarthorn x1)." },
        { type = "train",  skill = "Alchemy",       text = "Train Journeyman Alchemy at 50+" },
        { type = "note",   text = "[110-140] Craft Healing Potion (Bruiseweed x1, Briarthorn x1, Leaded Vial x1)." },
        { type = "train",  skill = "Alchemy",       text = "Train Expert Alchemy at 125+" },
        { type = "note",   text = "[140-185] Craft Greater Healing Potion (Liferoot x1, Kingsblood x1)." },
        { type = "note",   text = "[185-210] Craft Elixir of Agility (Stranglekelp x1, Goldthorn x1)." },
        { type = "train",  skill = "Alchemy",       text = "Train Artisan Alchemy at 200+" },
        { type = "note",   text = "[210-250] Craft Elixir of Greater Defense (Wild Steelbloom x1, Goldthorn x1, Sungrass x1)." },
        { type = "note",   text = "[250-290] Craft Superior Healing Potion or Elixir of the Mongoose." },
        { type = "note",   text = "[290-300] Craft Major Healing Potion or Purification Potion." },
        { type = "train",  skill = "Alchemy",       text = "Train Master Alchemy (300) in Hellfire Peninsula" },
        { type = "note",   text = "[300-325] Craft Volatile Healing Potion (Felweed x1, Golden Sansam x1)." },
        { type = "note",   text = "[325-350] Craft Super Healing Potion or Elixir of Major Agility." },
        { type = "note",   text = "[350-375] Transmute and craft Flask recipes from rep vendors." },
        { type = "note",   text = "Choose Transmutation, Potion, or Elixir specialization for procs." },
        { type = "note",   text = "At 375, Alchemy is maxed! Transmute Primal Might daily for gold." },
    },
})
