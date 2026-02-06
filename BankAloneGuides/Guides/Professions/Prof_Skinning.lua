-------------------------------------------------------------------------------
-- Bank Alone Guides — Profession: Skinning (1-375)
-- Original routing
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Prof_Skinning", {
    title      = "Skinning (1-375)",
    faction    = "Both",
    levelRange = { 1, 70 },
    category   = "profession",
    steps = {
        { type = "train",  skill = "Skinning",      text = "Learn Apprentice Skinning from any capital city trainer" },
        { type = "note",   text = "Buy a Skinning Knife from a trade goods vendor." },
        { type = "note",   text = "[1-75] Skin any beasts you kill while leveling in starting zones. Light Leather." },
        { type = "note",   text = "Tip: Skinning levels naturally while questing. No special routing needed." },
        { type = "train",  skill = "Skinning",      text = "Train Journeyman Skinning at 50+ skill" },
        { type = "note",   text = "[75-150] Skin beasts in 15-30 zones for Medium and Heavy Leather." },
        { type = "train",  skill = "Skinning",      text = "Train Expert Skinning at 125+ skill" },
        { type = "note",   text = "[150-225] Skin in STV, Tanaris, Hinterlands for Thick Leather." },
        { type = "train",  skill = "Skinning",      text = "Train Artisan Skinning at 200+ skill" },
        { type = "note",   text = "[225-300] Skin in Un'Goro, Winterspring, EPL for Rugged Leather." },
        { type = "note",   text = "Un'Goro Crater is the best skinning zone for the 45-55 range." },
        { type = "train",  skill = "Skinning",      text = "Train Master Skinning (300) in Hellfire Peninsula" },
        { type = "note",   text = "[300-330] Skin Outland beasts for Knothide Leather Scraps and Knothide Leather." },
        { type = "goto",   zone = "Nagrand", x = 50.0, y = 50.0, text = "Nagrand is the best Outland skinning zone — clefthoofs and talbuks everywhere" },
        { type = "note",   text = "[330-375] Continue skinning in Nagrand, Blade's Edge, Netherstorm. Clefthoofs give the most leather." },
        { type = "note",   text = "At 375, Skinning is maxed! Sell Knothide Leather on the AH for steady gold." },
    },
})
