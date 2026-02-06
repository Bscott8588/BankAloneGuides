--[[
    Bank Alone Guides - Horde 10-20
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

local guide = BAG.Parser:CreateGuide({
    id = "Horde_10_20",
    title = "Horde 10-20 (The Barrens)",
    faction = "Horde",
    levelRange = {min = 10, max = 20},
    steps = {
        {type = "goto", text = "Travel to The Barrens", zone = "The Barrens", x = 0.52, y = 0.30},
        {type = "note", text = "Quest in The Barrens until level 20"}
    }
})

BAG.Engine:RegisterGuide(guide)
print("|cff00B3FF[Bank Alone Guides]|r Horde 10-20 guide loaded")
