--[[
    Bank Alone Guides - Alliance 10-20
    Westfall and Loch Modan leveling guide
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

local guide = BAG.Parser:CreateGuide({
    id = "Alliance_10_20",
    title = "Alliance 10-20 (Westfall/Loch Modan)",
    faction = "Alliance",
    levelRange = {min = 10, max = 20},
    steps = {
        -- Westfall (Humans)
        {type = "goto", text = "Travel to Westfall", zone = "Westfall", x = 0.56, y = 0.47, conditions = {race = "Human"}},
        {type = "accept", questID = 9, text = "Accept The Fargodeep Mine", zone = "Westfall", x = 0.56, y = 0.47, conditions = {race = "Human"}},
        {type = "goto", text = "Enter Fargodeep Mine", zone = "Westfall", x = 0.38, y = 0.69, conditions = {race = "Human"}},
        {type = "turnin", questID = 9, text = "Turn in quest", zone = "Westfall", x = 0.56, y = 0.47, conditions = {race = "Human"}},
        
        -- Loch Modan (Dwarves/Gnomes)
        {type = "goto", text = "Travel to Loch Modan", zone = "Loch Modan", x = 0.35, y = 0.49, conditions = {race = {"Dwarf", "Gnome"}}},
        {type = "note", text = "Pick up all quests in Thelsamar", zone = "Loch Modan", x = 0.35, y = 0.49, conditions = {race = {"Dwarf", "Gnome"}}},
        {type = "goto", text = "Complete quests around the Loch", zone = "Loch Modan", x = 0.40, y = 0.60, conditions = {race = {"Dwarf", "Gnome"}}},
        
        -- Darkshore (Night Elves)
        {type = "goto", text = "Travel to Darkshore", zone = "Darkshore", x = 0.37, y = 0.44, conditions = {race = "Night Elf"}},
        {type = "note", text = "Pick up all quests at Auberdine", zone = "Darkshore", x = 0.37, y = 0.44, conditions = {race = "Night Elf"}},
        
        -- Bloodmyst Isle (Draenei)
        {type = "goto", text = "Travel to Bloodmyst Isle", zone = "Bloodmyst Isle", x = 0.55, y = 0.54, conditions = {race = "Draenei"}},
        {type = "note", text = "Complete all Bloodmyst Isle quests", zone = "Bloodmyst Isle", conditions = {race = "Draenei"}},
        
        {type = "note", text = "Continue questing until level 20"}
    }
})

BAG.Engine:RegisterGuide(guide)

print("|cff00B3FF[Bank Alone Guides]|r Alliance 10-20 guide loaded")
