--[[
    Bank Alone Guides - First Aid Profession Guide (1-375)
    SCS / Bank Alone Guides
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Profession_FirstAid", {
    title = "First Aid 1-375",
    faction = "Both",
    levelRange = {1, 70},
    category = "Profession",
    steps = {
        { type = "note", text = "First Aid Guide: Learn First Aid from any capital city trainer.", conditions = {} },
        { type = "note", text = "First Aid is essential for non-healing classes. Bandages work in combat with channeling.", conditions = {} },

        { type = "note", text = "[1-40] Craft Linen Bandages from Linen Cloth (humanoid drops in levels 1-15).", conditions = {} },
        { type = "note", text = "[40-80] Craft Heavy Linen Bandages. Continue collecting Linen Cloth.", conditions = {} },
        { type = "note", text = "[80-115] Craft Wool Bandages from Wool Cloth (humanoid drops in levels 15-25).", conditions = {} },
        { type = "note", text = "[115-150] Craft Heavy Wool Bandages.", conditions = {} },
        { type = "note", text = "[150-210] Craft Silk Bandages and Heavy Silk Bandages (Silk Cloth from levels 25-40).", conditions = {} },
        { type = "note", text = "Train Expert First Aid at skill 125. Buy the book from vendors in Arathi/Dustwallow.", conditions = {} },
        { type = "note", text = "[210-240] Craft Mageweave Bandages (Mageweave Cloth from levels 40-50).", conditions = {} },
        { type = "note", text = "[240-260] Craft Heavy Mageweave Bandages.", conditions = {} },
        { type = "note", text = "[260-290] Craft Runecloth Bandages (Runecloth from levels 50-60).", conditions = {} },
        { type = "note", text = "[290-300] Craft Heavy Runecloth Bandages.", conditions = {} },
        { type = "note", text = "[300-330] Craft Netherweave Bandages (Netherweave Cloth from Outland humanoids). Train Master.", conditions = {} },
        { type = "note", text = "[330-375] Craft Heavy Netherweave Bandages. These are your endgame bandages.", conditions = {} },
        { type = "note", text = "First Aid 375! Heavy Netherweave Bandages heal for a significant amount over 8 seconds.", conditions = {} },
    },
})
