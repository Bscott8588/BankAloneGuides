--[[
    Bank Alone Guides - Cooking Profession Guide (1-375)
    SCS / Bank Alone Guides
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Profession_Cooking", {
    title = "Cooking 1-375",
    faction = "Both",
    levelRange = {1, 70},
    category = "Profession",
    steps = {
        { type = "note", text = "Cooking Guide: Learn Cooking from any capital city trainer.", conditions = {} },
        { type = "note", text = "[1-40] Cook Spice Bread (Simple Flour + Mild Spices) from vendor ingredients.", conditions = {} },
        { type = "note", text = "[40-85] Cook Smoked Bear Meat or Boiled Clams from common drops in starting zones.", conditions = {} },
        { type = "note", text = "[85-130] Cook Coyote Steak (Barrens) or Seasoned Wolf Kabob (various zones).", conditions = {} },
        { type = "note", text = "[130-175] Cook Curiously Tasty Omelet (Raptor Eggs from Wetlands/Arathi) or Hot Lion Chops.", conditions = {} },
        { type = "note", text = "[175-225] Cook Monster Omelet or Jungle Stew. Purchase Expert Cookbook from Shadowprey/Booty Bay.", conditions = {} },
        { type = "note", text = "[225-275] Cook Tender Wolf Steak (Felwood wolves) or Charred Bear Kabobs. Buy Artisan cookbook.", conditions = {} },
        { type = "note", text = "[275-300] Cook Smoked Desert Dumplings (Silithus) or Runn Tum Tuber Surprise.", conditions = {} },
        { type = "note", text = "[300-325] Cook Ravager Dogs (Hellfire Peninsula ravagers). Train Master Cooking in Outland.", conditions = {} },
        { type = "note", text = "[325-350] Cook Talbuk Steak (Nagrand clefthooves/talbuks) or Warp Burger.", conditions = {} },
        { type = "note", text = "[350-375] Cook Spicy Crawdad or Golden Fish Sticks from Terokkar fishing.", conditions = {} },
        { type = "note", text = "Cooking 375! The best buff foods at max level are Spicy Crawdad and Fisherman's Feast.", conditions = {} },
    },
})
