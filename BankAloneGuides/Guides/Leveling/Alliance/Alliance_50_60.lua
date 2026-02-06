--[[
    Bank Alone Guides - Alliance 50-60
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

local guide = BAG.Parser:CreateGuide({
    id = "Alliance_50_60",
    title = "Alliance 50-60 (Plaguelands/Winterspring)",
    faction = "Alliance",
    levelRange = {min = 50, max = 60},
    steps = {
        {type = "goto", text = "Travel to Western Plaguelands", zone = "Western Plaguelands", x = 0.43, y = 0.85},
        {type = "note", text = "Quest in Western Plaguelands"},
        {type = "goto", text = "Move to Eastern Plaguelands", zone = "Eastern Plaguelands", x = 0.81, y = 0.58},
        {type = "note", text = "Complete Eastern Plaguelands quests"},
        {type = "goto", text = "Also quest in Winterspring", zone = "Winterspring", x = 0.61, y = 0.38},
        {type = "note", text = "Reach level 58-60 to enter Outland"}
    }
})

BAG.Engine:RegisterGuide(guide)
print("|cff00B3FF[Bank Alone Guides]|r Alliance 50-60 guide loaded")
