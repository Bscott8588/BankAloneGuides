--[[
    Bank Alone Guides - Tailoring Profession Guide (1-375)
    SCS / Bank Alone Guides
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Profession_Tailoring", {
    title = "Tailoring 1-375",
    faction = "Both",
    levelRange = {1, 70},
    category = "Profession",
    steps = {
        { type = "note", text = "Tailoring Guide: Uses cloth from humanoid mobs. No gathering profession required! Learn from trainer.", conditions = {} },
        { type = "note", text = "[1-50] Craft Linen items: Bolt of Linen, Brown Linen Vest, Brown Linen Pants.", conditions = {} },
        { type = "note", text = "[50-75] Craft Reinforced Linen Cape and Red Linen Shirt.", conditions = {} },
        { type = "note", text = "[75-115] Craft Wool items: Bolt of Woolen Cloth, Woolen Bag (6-slot bags!).", conditions = {} },
        { type = "note", text = "[115-150] Craft Silk items: Bolt of Silk Cloth, Azure Silk Hood, Silk Headband. Train Expert at 125.", conditions = {} },
        { type = "note", text = "[150-175] Craft Crimson Silk items and Bolt of Mageweave.", conditions = {} },
        { type = "note", text = "[175-215] Craft Mageweave items: Mageweave Bag (12-slot), Black Mageweave sets. Train Artisan at 200.", conditions = {} },
        { type = "note", text = "[215-260] Craft Runecloth items: Bolt of Runecloth, Runecloth Belt, Runecloth Bag (14-slot).", conditions = {} },
        { type = "note", text = "[260-300] Craft Runecloth Headband, Runecloth Gloves, or Mooncloth (4-day cooldown).", conditions = {} },
        { type = "note", text = "[300-325] Craft Netherweave items: Bolt of Netherweave, Netherweave Bag (16-slot). Train Master.", conditions = {} },
        { type = "note", text = "Netherweave Bags sell extremely well on the AH - craft these for gold!", conditions = {} },
        { type = "note", text = "[325-350] Craft Netherweave Tunic and Netherweave Robe.", conditions = {} },
        { type = "note", text = "[350-375] Craft Bolt of Imbued Netherweave and specialty patterns (Spellcloth, Shadowcloth, Primal Mooncloth).", conditions = {} },
        { type = "note", text = "Choose Shadoweave, Spellfire, or Mooncloth specialization for your class needs.", conditions = {} },
        { type = "note", text = "Tailoring 375! Craft specialty cloth on cooldown for BiS crafted sets.", conditions = {} },
    },
})
