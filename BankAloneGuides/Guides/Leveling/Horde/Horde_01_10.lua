--[[
    Bank Alone Guides - Horde 1-10
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

local guide = BAG.Parser:CreateGuide({
    id = "Horde_01_10",
    title = "Horde 1-10 Leveling",
    faction = "Horde",
    levelRange = {min = 1, max = 10},
    steps = {
        {type = "note", text = "Complete your race's starting zone quests until level 10"}
    }
})

BAG.Engine:RegisterGuide(guide)
print("|cff00B3FF[Bank Alone Guides]|r Horde 1-10 guide loaded")
