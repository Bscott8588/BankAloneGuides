local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
local guide = BAG.Parser:CreateGuide({
    id = "Horde_50_60", title = "Horde 50-60", faction = "Horde", levelRange = {min = 50, max = 60},
    steps = {{type = "note", text = "Quest in Plaguelands and Winterspring until 58-60"}}
})
BAG.Engine:RegisterGuide(guide)
print("|cff00B3FF[Bank Alone Guides]|r Horde 50-60 guide loaded")
