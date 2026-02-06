--[[
    Bank Alone Guides - Alliance 40-50
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

local guide = BAG.Parser:CreateGuide({
    id = "Alliance_40_50",
    title = "Alliance 40-50 (Tanaris/Hinterlands)",
    faction = "Alliance",
    levelRange = {min = 40, max = 50},
    steps = {
        {type = "goto", text = "Travel to Tanaris", zone = "Tanaris", x = 0.52, y = 0.29},
        {type = "note", text = "Quest in Tanaris and Feralas"},
        {type = "goto", text = "Also visit Hinterlands", zone = "Hinterlands", x = 0.14, y = 0.48},
        {type = "note", text = "Continue until level 50"}
    }
})

BAG.Engine:RegisterGuide(guide)
print("|cff00B3FF[Bank Alone Guides]|r Alliance 40-50 guide loaded")
