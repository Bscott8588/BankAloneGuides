--[[
    Bank Alone Guides - Herbalism Profession Guide (1-375)
    SCS / Bank Alone Guides
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Profession_Herbalism", {
    title = "Herbalism 1-375",
    faction = "Both",
    levelRange = {1, 70},
    category = "Profession",
    steps = {
        { type = "note", text = "Herbalism Guide: Learn Herbalism from any capital city trainer.", conditions = {} },
        { type = "train", text = "Alliance: Shylamiir in Darnassus. Horde: Jandi in Orgrimmar.", conditions = {} },

        { type = "note", text = "[1-70] Gather Peacebloom and Silverleaf in any starting zone.", conditions = {} },
        { type = "note", text = "Both herbs are extremely common near trees and in open fields.", conditions = {} },

        { type = "note", text = "[70-115] Gather Mageroyal and Briarthorn. Zones: Barrens, Silverpine, Westfall, Darkshore, Loch Modan.", conditions = {} },
        { type = "note", text = "Briarthorn is found near the base of trees and hills. Train Journeyman Herbalism at skill 50.", conditions = {} },

        { type = "note", text = "[115-150] Gather Bruiseweed and Stranglekelp. Zones: Wetlands, Hillsbrad, Stonetalon, Ashenvale.", conditions = {} },
        { type = "note", text = "Stranglekelp grows underwater along coasts. Excellent to gather while traveling between continents.", conditions = {} },
        { type = "note", text = "Train Expert Herbalism at skill 125.", conditions = {} },

        { type = "note", text = "[150-205] Gather Kingsblood and Liferoot. Zones: Stranglethorn, Arathi, Desolace, Wetlands.", conditions = {} },
        { type = "note", text = "Liferoot is near water. Kingsblood is everywhere in level 30-40 zones.", conditions = {} },

        { type = "note", text = "[205-235] Gather Fadeleaf and Khadgar's Whisker. Zones: Swamp of Sorrows, Hinterlands, Feralas.", conditions = {} },
        { type = "note", text = "Train Artisan Herbalism at skill 200.", conditions = {} },

        { type = "note", text = "[235-270] Gather Sungrass, Gromsblood, and Golden Sansam. Zones: Felwood, Burning Steppes, Azshara.", conditions = {} },
        { type = "note", text = "Felwood is the best zone for Gromsblood.", conditions = {} },

        { type = "note", text = "[270-300] Gather Mountain Silversage, Dreamfoil, and Plaguebloom. Zones: Plaguelands, Winterspring, Un'Goro.", conditions = {} },
        { type = "note", text = "Eastern Plaguelands has dense herb spawns. Farm along the roads.", conditions = {} },

        { type = "note", text = "[300-325] Travel to Outland! Gather Felweed in Hellfire Peninsula.", conditions = {} },
        { type = "note", text = "Train Master Herbalism from Rorelien (Honor Hold) or Ruak Stronghorn (Thrallmar).", conditions = {} },
        { type = "note", text = "Felweed is everywhere in Hellfire. Very easy to skill up here.", conditions = {} },

        { type = "note", text = "[325-350] Gather Dreaming Glory and Ragveil. Zones: Zangarmarsh, Terokkar, Nagrand.", conditions = {} },
        { type = "note", text = "Zangarmarsh is the best for Ragveil (mushroom-based herb). Dreaming Glory is in all Outland zones.", conditions = {} },

        { type = "note", text = "[350-375] Gather Terocone, Nightmare Vine, Mana Thistle, and Netherbloom. Zones: Netherstorm, Shadowmoon.", conditions = {} },
        { type = "note", text = "Netherstorm has Netherbloom; Shadowmoon has Nightmare Vine. Mana Thistle spawns at high-elevation points.", conditions = {} },
        { type = "note", text = "Herbalism 375 reached! Farm Terocone and Nightmare Vine for excellent gold.", conditions = {} },
    },
})
