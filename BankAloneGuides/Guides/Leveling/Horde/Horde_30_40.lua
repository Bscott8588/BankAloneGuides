local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
local guide = BAG.Parser:CreateGuide({
    id = "Horde_30_40", title = "Horde 30-40", faction = "Horde", levelRange = {min = 30, max = 40},
    steps = {{type = "note", text = "Quest in Stranglethorn Vale and Desolace"}}
})
BAG.Engine:RegisterGuide(guide)
print("|cff00B3FF[Bank Alone Guides]|r Horde 30-40 guide loaded")
