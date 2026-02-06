--[[
    Bank Alone Guides - Alliance 1-10
    Main Alliance leveling guide for levels 1-10
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- This guide assumes the player has completed their race-specific starting area
local guide = BAG.Parser:CreateGuide({
    id = "Alliance_01_10",
    title = "Alliance 1-10 Leveling",
    faction = "Alliance",
    levelRange = {min = 1, max = 10},
    steps = {
        {type = "note", text = "This guide starts from your race's starting zone"},
        {type = "note", text = "Complete all available quests in your starting area"},
        {type = "note", text = "Reach level 10 before moving to the next guide"},
        {type = "note", text = "Humans: Stay in Elwynn Forest"},
        {type = "note", text = "Dwarves/Gnomes: Stay in Dun Morogh"},
        {type = "note", text = "Night Elves: Stay in Teldrassil"},
        {type = "note", text = "Draenei: Stay in Azuremyst Isle"}
    }
})

BAG.Engine:RegisterGuide(guide)

print("|cff00B3FF[Bank Alone Guides]|r Alliance 1-10 guide loaded")
