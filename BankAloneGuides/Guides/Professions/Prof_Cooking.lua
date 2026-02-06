-------------------------------------------------------------------------------
-- Bank Alone Guides — Profession: Cooking (1-375)
-- Original routing
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Prof_Cooking", {
    title      = "Cooking (1-375)",
    faction    = "Both",
    levelRange = { 1, 70 },
    category   = "profession",
    steps = {
        { type = "train",  skill = "Cooking",       text = "Learn Apprentice Cooking" },
        { type = "note",   text = "[1-40] Cook Spice Bread (Simple Flour x1, Mild Spices x1). Buy from vendors." },
        { type = "note",   text = "[40-80] Cook any meat-based recipes from starting zone drops." },
        { type = "train",  skill = "Cooking",       text = "Train Journeyman Cooking at 50+" },
        { type = "note",   text = "[80-130] Cook Curiously Tasty Omelet, Boiled Clams, or Dig Rat Stew (Horde)." },
        { type = "train",  skill = "Cooking",       text = "Train Expert Cooking at 125+ (buy the book from vendor)" },
        { type = "note",   text = "[130-175] Cook Monster Omelet, Spider Sausage, or Jungle Stew." },
        { type = "note",   text = "[175-225] Cook Sagefish Delight, Tender Wolf Steak, or Hot Wolf Ribs." },
        { type = "train",  skill = "Cooking",       text = "Train Artisan Cooking at 200+ (Gadgetzan or Dirge's book)" },
        { type = "note",   text = "[225-285] Cook Mightfish Steak, Baked Salmon, or Runn Tum Tuber Surprise." },
        { type = "note",   text = "[285-300] Cook Smoked Desert Dumplings (Sandworm Meat, Soothing Spices)." },
        { type = "train",  skill = "Cooking",       text = "Train Master Cooking (300) in Hellfire Peninsula" },
        { type = "note",   text = "[300-325] Cook Ravager Dogs or Buzzard Bites from Hellfire drops." },
        { type = "note",   text = "[325-350] Cook Talbuk Steak, Roasted Clefthoof from Nagrand." },
        { type = "note",   text = "[350-375] Cook Golden Fish Sticks, Spicy Crawdad (requires high fishing for ingredients)." },
        { type = "note",   text = "At 375, Cooking is maxed! Raid-quality food buffs are valuable." },
    },
})
