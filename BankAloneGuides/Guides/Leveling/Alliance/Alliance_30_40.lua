--[[
    Bank Alone Guides - Alliance 30-40
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

local guide = BAG.Parser:CreateGuide({
    id = "Alliance_30_40",
    title = "Alliance 30-40 (Stranglethorn/Desolace)",
    faction = "Alliance",
    levelRange = {min = 30, max = 40},
    steps = {
        {type = "goto", text = "Travel to Stranglethorn Vale", zone = "Stranglethorn Vale", x = 0.27, y = 0.77},
        {type = "note", text = "Quest in Stranglethorn Vale"},
        {type = "goto", text = "Also quest in Desolace", zone = "Desolace", x = 0.66, y = 0.17},
        {type = "note", text = "Continue until level 40"}
    }
})

BAG.Engine:RegisterGuide(guide)
print("|cff00B3FF[Bank Alone Guides]|r Alliance 30-40 guide loaded")
