--[[
    Bank Alone Guides - Skinning Profession Guide (1-375)
    SCS / Bank Alone Guides
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Profession_Skinning", {
    title = "Skinning 1-375",
    faction = "Both",
    levelRange = {1, 70},
    category = "Profession",
    steps = {
        { type = "note", text = "Skinning Guide: Learn Skinning from any capital city trainer. Purchase a Skinning Knife.", conditions = {} },
        { type = "note", text = "Skinning levels up fastest by killing and skinning beasts as you quest. Skin everything!", conditions = {} },

        { type = "note", text = "[1-75] Skin low-level beasts in starting zones: boars, wolves, bears, cats.", conditions = {} },
        { type = "note", text = "You can skin any beast you or others have killed and looted. Stay in level 1-20 zones.", conditions = {} },

        { type = "note", text = "[75-150] Skin beasts in level 15-30 zones. Wetlands, Hillsbrad, Barrens, Ashenvale are excellent.", conditions = {} },
        { type = "note", text = "Train Journeyman (50) and Expert (125) Skinning. The Barrens has massive beast density.", conditions = {} },

        { type = "note", text = "[150-225] Skin beasts in level 30-45 zones. Stranglethorn, Desolace, Feralas, Badlands.", conditions = {} },
        { type = "note", text = "Stranglethorn Vale tigers and panthers are outstanding for this range. Train Artisan at 200.", conditions = {} },

        { type = "note", text = "[225-300] Skin beasts in level 45-60 zones. Un'Goro, Winterspring, Burning Steppes.", conditions = {} },
        { type = "note", text = "Un'Goro Crater dinosaurs give the best leather in this range. Rugged Leather sells well.", conditions = {} },

        { type = "note", text = "[300-330] Travel to Outland! Skin Hellfire Peninsula beasts for Knothide Leather Scraps.", conditions = {} },
        { type = "note", text = "Helboars and ravagers are the primary targets in Hellfire.", conditions = {} },

        { type = "note", text = "[330-350] Skin beasts in Nagrand for full Knothide Leather. Clefthooves and talbuks are ideal.", conditions = {} },
        { type = "note", text = "Nagrand is the best skinning zone in Outland by far.", conditions = {} },

        { type = "note", text = "[350-375] Skin beasts in Blade's Edge, Netherstorm, and Shadowmoon for Heavy Knothide Leather.", conditions = {} },
        { type = "note", text = "Nether Dragonkin in Blade's Edge can drop Nether Dragonscales (valuable!).", conditions = {} },
        { type = "note", text = "Skinning 375 reached! Farm Knothide Leather in Nagrand for consistent gold income.", conditions = {} },
    },
})
