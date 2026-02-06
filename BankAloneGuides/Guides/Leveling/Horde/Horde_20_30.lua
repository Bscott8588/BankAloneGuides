local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
local guide = BAG.Parser:CreateGuide({
    id = "Horde_20_30", title = "Horde 20-30", faction = "Horde", levelRange = {min = 20, max = 30},
    steps = {{type = "note", text = "Quest in Hillsbrad and Thousand Needles"}}
})
BAG.Engine:RegisterGuide(guide)
print("|cff00B3FF[Bank Alone Guides]|r Horde 20-30 guide loaded")
