-------------------------------------------------------------------------------
-- Bank Alone Guides — Gold: Farming Routes
-- Original gold-making strategies for TBC Classic
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Gold_Farming", {
    title      = "Gold Farming Routes",
    faction    = "Both",
    levelRange = { 60, 70 },
    category   = "gold",
    steps = {
        { type = "note",   text = "=== OPEN WORLD FARMING ROUTES ===" },
        { type = "note",   text = "All routes assume level 70 with a flying mount for best results." },

        { type = "note",   text = "--- Primal Fire Farming ---" },
        { type = "goto",   zone = "Shadowmoon Valley", x = 52.0, y = 30.0, text = "Farm fire elementals at the Hand of Gul'dan" },
        { type = "note",   text = "Kill Enraged Fire Spirits for Mote of Fire. 10 Motes = 1 Primal Fire." },
        { type = "note",   text = "Expected: 3-5 Primal Fire per hour depending on competition." },

        { type = "note",   text = "--- Primal Water Farming ---" },
        { type = "goto",   zone = "Nagrand", x = 36.0, y = 59.0, text = "Farm water elementals along the Nagrand rivers" },
        { type = "note",   text = "Kill Water Elementals for Mote of Water. Very consistent spawn rates." },

        { type = "note",   text = "--- Primal Air Farming ---" },
        { type = "goto",   zone = "Nagrand", x = 57.0, y = 24.0, text = "Farm air elementals at the Throne of Elements" },
        { type = "note",   text = "Enraged Air Spirits drop Mote of Air. High demand for crafting." },

        { type = "note",   text = "--- Primal Mana Farming ---" },
        { type = "goto",   zone = "Netherstorm", x = 60.0, y = 45.0, text = "Farm mana wyrms and arcane entities in Netherstorm" },
        { type = "note",   text = "Motes of Mana drop from arcane creatures throughout the zone." },

        { type = "note",   text = "--- Knothide Leather Farming ---" },
        { type = "goto",   zone = "Nagrand", x = 55.0, y = 50.0, text = "Kill and skin clefthoofs in Nagrand" },
        { type = "note",   text = "Clefthoofs give the most leather per kill. Need Skinning 310+." },

        { type = "note",   text = "--- Netherweave Cloth Farming ---" },
        { type = "goto",   zone = "Netherstorm", x = 26.0, y = 68.0, text = "Farm blood elf mobs at Manaforge B'naar" },
        { type = "note",   text = "Humanoid mobs drop Netherweave Cloth. Sell raw or craft into bags." },

        { type = "note",   text = "--- Aldor/Scryer Rep Items ---" },
        { type = "note",   text = "Farm Marks of Sargeras (Aldor) from Legion camps in Shadowmoon." },
        { type = "note",   text = "Farm Sunfury Signets (Scryer) from blood elf camps in Netherstorm." },
        { type = "note",   text = "These items sell very well on the AH as players grind faction rep." },
    },
})
