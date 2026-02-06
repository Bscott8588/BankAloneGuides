--[[
    Bank Alone Guides - Alliance 58-70 Outland
    Complete Outland leveling guide for TBC Classic Anniversary
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

local guide = BAG.Parser:CreateGuide({
    id = "Alliance_58_70_Outland",
    title = "Alliance 58-70 (Outland - TBC)",
    faction = "Alliance",
    levelRange = {min = 58, max = 70},
    steps = {
        -- Getting to Outland
        {type = "note", text = "You must be level 58+ to enter Outland"},
        {type = "goto", text = "Go to Blasted Lands", zone = "Blasted Lands", x = 0.58, y = 0.58},
        {type = "goto", text = "Enter the Dark Portal", zone = "Blasted Lands", x = 0.58, y = 0.58},
        
        -- Hellfire Peninsula (58-63)
        {type = "note", text = "Welcome to Outland!"},
        {type = "goto", text = "Arrive in Hellfire Peninsula", zone = "Hellfire Peninsula", x = 0.87, y = 0.50},
        {type = "accept", questID = 10129, text = "Report to Honor Hold", zone = "Hellfire Peninsula", x = 0.87, y = 0.50},
        {type = "goto", text = "Travel to Honor Hold", zone = "Hellfire Peninsula", x = 0.54, y = 0.62},
        {type = "turnin", questID = 10129, text = "Turn in at Honor Hold", zone = "Hellfire Peninsula", x = 0.54, y = 0.62},
        {type = "fp", text = "Get flight path at Honor Hold", zone = "Hellfire Peninsula", x = 0.54, y = 0.62},
        {type = "note", text = "Pick up all available quests"},
        {type = "goto", text = "Quest around Honor Hold area", zone = "Hellfire Peninsula", x = 0.55, y = 0.65},
        {type = "goto", text = "Complete Legion quests", zone = "Hellfire Peninsula", x = 0.58, y = 0.42},
        {type = "note", text = "Quest in Hellfire until level 60-61"},
        {type = "goto", text = "Visit Temple of Telhamat", zone = "Hellfire Peninsula", x = 0.23, y = 0.40},
        {type = "fp", text = "Get flight path", zone = "Hellfire Peninsula", x = 0.25, y = 0.37},
        {type = "note", text = "Complete all Hellfire quests until level 62-63"},
        
        -- Zangarmarsh (60-64)
        {type = "goto", text = "Travel to Zangarmarsh", zone = "Zangarmarsh", x = 0.68, y = 0.51},
        {type = "goto", text = "Find Telredor (Alliance base)", zone = "Zangarmarsh", x = 0.68, y = 0.51},
        {type = "fp", text = "Get flight path at Telredor", zone = "Zangarmarsh", x = 0.67, y = 0.51},
        {type = "note", text = "Pick up all quests at Telredor"},
        {type = "goto", text = "Quest in marshlands", zone = "Zangarmarsh", x = 0.70, y = 0.49},
        {type = "note", text = "Help Cenarion Expedition"},
        {type = "goto", text = "Visit Orebor Harborage", zone = "Zangarmarsh", x = 0.42, y = 0.28},
        {type = "fp", text = "Get flight path", zone = "Zangarmarsh", x = 0.41, y = 0.29},
        {type = "note", text = "Complete Zangarmarsh until level 64"},
        
        -- Terokkar Forest (62-65)
        {type = "goto", text = "Travel to Terokkar Forest", zone = "Terokkar Forest", x = 0.44, y = 0.26},
        {type = "goto", text = "Visit Shattrath City", zone = "Shattrath City", x = 0.64, y = 0.42},
        {type = "fp", text = "Get flight path in Shattrath", zone = "Shattrath City", x = 0.64, y = 0.42},
        {type = "note", text = "Choose Aldor or Scryers faction"},
        {type = "goto", text = "Find Allerian Stronghold", zone = "Terokkar Forest", x = 0.58, y = 0.54},
        {type = "fp", text = "Get flight path", zone = "Terokkar Forest", x = 0.59, y = 0.53},
        {type = "note", text = "Quest in Terokkar until level 65"},
        
        -- Nagrand (64-67)
        {type = "goto", text = "Travel to Nagrand", zone = "Nagrand", x = 0.55, y = 0.68},
        {type = "goto", text = "Find Telaar (Alliance base)", zone = "Nagrand", x = 0.55, y = 0.75},
        {type = "fp", text = "Get flight path at Telaar", zone = "Nagrand", x = 0.54, y = 0.75},
        {type = "note", text = "Pick up all quests"},
        {type = "accept", questID = 9868, text = "Join Nesingwary Safari", zone = "Nagrand", x = 0.71, y = 0.40},
        {type = "note", text = "Complete hunting quests"},
        {type = "note", text = "Quest in Nagrand until level 67"},
        
        -- Blade's Edge Mountains (65-68)
        {type = "goto", text = "Travel to Blade's Edge Mountains", zone = "Blade's Edge Mountains", x = 0.62, y = 0.39},
        {type = "goto", text = "Find Sylvanaar", zone = "Blade's Edge Mountains", x = 0.37, y = 0.64},
        {type = "fp", text = "Get flight path", zone = "Blade's Edge Mountains", x = 0.37, y = 0.61},
        {type = "note", text = "Quest in Blade's Edge until level 68"},
        
        -- Netherstorm (67-70)
        {type = "goto", text = "Travel to Netherstorm", zone = "Netherstorm", x = 0.33, y = 0.64},
        {type = "goto", text = "Visit Area 52", zone = "Netherstorm", x = 0.33, y = 0.64},
        {type = "fp", text = "Get flight path at Area 52", zone = "Netherstorm", x = 0.33, y = 0.68},
        {type = "note", text = "Pick up all quests"},
        {type = "goto", text = "Quest in Netherstorm", zone = "Netherstorm", x = 0.40, y = 0.70},
        {type = "note", text = "Continue until level 70"},
        
        -- Shadowmoon Valley (optional endgame zone)
        {type = "goto", text = "Visit Shadowmoon Valley for endgame", zone = "Shadowmoon Valley", x = 0.37, y = 0.55},
        {type = "goto", text = "Find Wildhammer Stronghold", zone = "Shadowmoon Valley", x = 0.37, y = 0.55},
        {type = "fp", text = "Get flight path", zone = "Shadowmoon Valley", x = 0.37, y = 0.55},
        {type = "note", text = "Shadowmoon has level 70 quests and attunements"},
        
        {type = "note", text = "Congratulations! You've reached level 70!"},
        {type = "note", text = "Continue with dungeon and raid preparation"}
    }
})

BAG.Engine:RegisterGuide(guide)

print("|cff00B3FF[Bank Alone Guides]|r Alliance Outland 58-70 guide loaded")
