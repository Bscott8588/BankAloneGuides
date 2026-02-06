local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
local guide = BAG.Parser:CreateGuide({
    id = "Profession_Mining",
    title = "Mining 1-375 (TBC)",
    faction = "Both",
    levelRange = {min = 1, max = 70},
    steps = {
        {type = "note", text = "Train Mining from a trainer in any major city"},
        {type = "note", text = "1-65: Copper Ore in starting zones"},
        {type = "note", text = "65-125: Tin Ore in 10-25 zones"},
        {type = "note", text = "125-175: Iron Ore in 30-45 zones"},
        {type = "note", text = "175-230: Mithril Ore in 40-50 zones"},
        {type = "note", text = "230-300: Thorium Ore in 50-60 zones"},
        {type = "note", text = "300-350: Fel Iron Ore in Hellfire/Zangarmarsh"},
        {type = "note", text = "350-375: Adamantite Ore in Nagrand/Netherstorm"}
    }
})
BAG.Engine:RegisterGuide(guide)
print("|cff00B3FF[Bank Alone Guides]|r Mining guide loaded")
