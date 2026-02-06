--[[
    Bank Alone Guides - Horde 58-70 Outland
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

local guide = BAG.Parser:CreateGuide({
    id = "Horde_58_70_Outland",
    title = "Horde 58-70 (Outland - TBC)",
    faction = "Horde",
    levelRange = {min = 58, max = 70},
    steps = {
        {type = "goto", text = "Enter Dark Portal from Blasted Lands", zone = "Blasted Lands", x = 0.58, y = 0.58},
        {type = "goto", text = "Arrive in Hellfire Peninsula", zone = "Hellfire Peninsula", x = 0.87, y = 0.50},
        {type = "goto", text = "Travel to Thrallmar", zone = "Hellfire Peninsula", x = 0.55, y = 0.36},
        {type = "fp", text = "Get flight path", zone = "Hellfire Peninsula", x = 0.56, y = 0.36},
        {type = "note", text = "Quest in Hellfire until 62-63"},
        {type = "goto", text = "Travel to Zangarmarsh", zone = "Zangarmarsh", x = 0.32, y = 0.50},
        {type = "goto", text = "Find Zabra'jin (Horde base)", zone = "Zangarmarsh", x = 0.32, y = 0.50},
        {type = "fp", text = "Get flight path", zone = "Zangarmarsh", x = 0.33, y = 0.51},
        {type = "note", text = "Quest in Zangarmarsh until 64"},
        {type = "goto", text = "Travel to Terokkar Forest", zone = "Terokkar Forest", x = 0.48, y = 0.45},
        {type = "goto", text = "Visit Shattrath City", zone = "Shattrath City", x = 0.64, y = 0.42},
        {type = "fp", text = "Get flight path", zone = "Shattrath City", x = 0.64, y = 0.42},
        {type = "goto", text = "Find Stonebreaker Hold", zone = "Terokkar Forest", x = 0.48, y = 0.45},
        {type = "note", text = "Quest in Terokkar until 65"},
        {type = "goto", text = "Travel to Nagrand", zone = "Nagrand", x = 0.57, y = 0.35},
        {type = "goto", text = "Find Garadar", zone = "Nagrand", x = 0.57, y = 0.35},
        {type = "fp", text = "Get flight path", zone = "Nagrand", x = 0.57, y = 0.35},
        {type = "note", text = "Quest in Nagrand until 67"},
        {type = "goto", text = "Travel to Blade's Edge Mountains", zone = "Blade's Edge Mountains", x = 0.51, y = 0.58},
        {type = "goto", text = "Find Thunderlord Stronghold", zone = "Blade's Edge Mountains", x = 0.51, y = 0.58},
        {type = "note", text = "Quest in Blade's Edge until 68"},
        {type = "goto", text = "Travel to Netherstorm", zone = "Netherstorm", x = 0.33, y = 0.64},
        {type = "goto", text = "Visit Area 52", zone = "Netherstorm", x = 0.33, y = 0.64},
        {type = "fp", text = "Get flight path", zone = "Netherstorm", x = 0.33, y = 0.68},
        {type = "note", text = "Quest in Netherstorm until 70"},
        {type = "goto", text = "Visit Shadowmoon Valley for endgame", zone = "Shadowmoon Valley", x = 0.30, y = 0.29},
        {type = "note", text = "Congratulations! Level 70!"}
    }
})

BAG.Engine:RegisterGuide(guide)
print("|cff00B3FF[Bank Alone Guides]|r Horde Outland 58-70 guide loaded")
