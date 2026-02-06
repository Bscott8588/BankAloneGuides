--[[
    Bank Alone Guides - Fishing Profession Guide (1-375)
    SCS / Bank Alone Guides
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Profession_Fishing", {
    title = "Fishing 1-375",
    faction = "Both",
    levelRange = {1, 70},
    category = "Profession",
    steps = {
        { type = "note", text = "Fishing Guide: Learn Fishing and buy a Fishing Pole from any capital city trainer.", conditions = {} },
        { type = "note", text = "Fishing levels up simply by casting and catching fish. No specific recipes needed.", conditions = {} },

        { type = "note", text = "[1-75] Fish in any starting zone or capital city pond. Every catch gives a skill point.", conditions = {} },
        { type = "note", text = "[75-150] Fish in level 10-25 zones: Loch Modan, Darkshore, Barrens, Hillsbrad. Use lures for bonus skill.", conditions = {} },
        { type = "note", text = "Purchase a Strong Fishing Pole when available. Buy Shiny Baubles (lure) from vendors.", conditions = {} },
        { type = "note", text = "[150-225] Fish in Stranglethorn, Desolace, or Dustwallow Marsh. Use Nightcrawlers lure.", conditions = {} },
        { type = "note", text = "Complete the Stranglethorn Fishing Extravaganza on Sundays for rare rewards.", conditions = {} },
        { type = "note", text = "[225-300] Fish in Tanaris, Feralas, Azshara, or Winterspring. Use Aquadynamic Fish Attractors.", conditions = {} },
        { type = "note", text = "At skill 225, buy Expert Fishing from Old Man Heming in Booty Bay (book costs 1 gold).", conditions = {} },
        { type = "note", text = "[300-375] Fish in Outland zones. Zangarmarsh and Nagrand are excellent.", conditions = {} },
        { type = "note", text = "Highland Mixed Schools in Nagrand and Pure Water pools in the same zone are very profitable.", conditions = {} },
        { type = "note", text = "Terokkar Forest has the valuable Mr. Pinchy (Furious Crawdad) at high fishing skill.", conditions = {} },
        { type = "note", text = "Fishing 375! Farm Furious Crawdads in Terokkar for great gold from cooking mats.", conditions = {} },
    },
})
