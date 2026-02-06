--[[
    Bank Alone Guides - Alliance 20-30
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

local guide = BAG.Parser:CreateGuide({
    id = "Alliance_20_30",
    title = "Alliance 20-30 (Redridge/Duskwood)",
    faction = "Alliance",
    levelRange = {min = 20, max = 30},
    steps = {
        {type = "goto", text = "Travel to Redridge Mountains", zone = "Redridge Mountains", x = 0.30, y = 0.44},
        {type = "note", text = "Complete Redridge quests"},
        {type = "goto", text = "Move to Duskwood", zone = "Duskwood", x = 0.74, y = 0.45},
        {type = "note", text = "Quest in Duskwood until level 30"}
    }
})

BAG.Engine:RegisterGuide(guide)
print("|cff00B3FF[Bank Alone Guides]|r Alliance 20-30 guide loaded")
