local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
local guide = BAG.Parser:CreateGuide({
    id = "Horde_40_50", title = "Horde 40-50", faction = "Horde", levelRange = {min = 40, max = 50},
    steps = {{type = "note", text = "Quest in Tanaris and Feralas"}}
})
BAG.Engine:RegisterGuide(guide)
print("|cff00B3FF[Bank Alone Guides]|r Horde 40-50 guide loaded")
