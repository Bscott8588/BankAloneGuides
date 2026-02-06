--[[
    Bank Alone Guides - Alliance Starting Zones
    Race-specific starting guides 1-10
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Human (Elwynn Forest 1-10)
local humanStart = BAG.Parser:CreateGuide({
    id = "Alliance_Human_01_10",
    title = "Human 1-10 (Elwynn Forest)",
    faction = "Alliance",
    levelRange = {min = 1, max = 10},
    steps = {
        {type = "accept", questID = 783, text = "Accept A Threat Within", zone = "Elwynn Forest", x = 0.48, y = 0.42},
        {type = "kill", questID = 783, text = "Kill wolves nearby", zone = "Elwynn Forest", x = 0.50, y = 0.40},
        {type = "turnin", questID = 783, text = "Turn in A Threat Within", zone = "Elwynn Forest", x = 0.48, y = 0.42},
        {type = "accept", questID = 7, text = "Accept Kobold Camp Cleanup", zone = "Elwynn Forest", x = 0.42, y = 0.66},
        {type = "goto", text = "Go to kobold camps", zone = "Elwynn Forest", x = 0.40, y = 0.80},
        {type = "kill", questID = 7, text = "Clear kobold camps", zone = "Elwynn Forest", x = 0.40, y = 0.80},
        {type = "turnin", questID = 7, text = "Turn in quest at Goldshire", zone = "Elwynn Forest", x = 0.42, y = 0.66},
        {type = "note", text = "Continue questing in Elwynn Forest until level 10", zone = "Elwynn Forest"}
    }
})

BAG.Engine:RegisterGuide(humanStart)

-- Dwarf/Gnome (Dun Morogh 1-10)
local dwarfStart = BAG.Parser:CreateGuide({
    id = "Alliance_Dwarf_01_10",
    title = "Dwarf/Gnome 1-10 (Dun Morogh)",
    faction = "Alliance",
    levelRange = {min = 1, max = 10},
    steps = {
        {type = "accept", questID = 179, text = "Accept initial quest", zone = "Dun Morogh", x = 0.29, y = 0.72},
        {type = "kill", questID = 179, text = "Hunt trolls in the area", zone = "Dun Morogh", x = 0.30, y = 0.80},
        {type = "turnin", questID = 179, text = "Return to quest giver", zone = "Dun Morogh", x = 0.29, y = 0.72},
        {type = "goto", text = "Head to Kharanos", zone = "Dun Morogh", x = 0.46, y = 0.52},
        {type = "note", text = "Pick up all available quests in Kharanos"},
        {type = "goto", text = "Quest in surrounding areas", zone = "Dun Morogh", x = 0.50, y = 0.50},
        {type = "note", text = "Continue until level 10"}
    }
})

BAG.Engine:RegisterGuide(dwarfStart)

-- Night Elf (Teldrassil 1-10)
local nightElfStart = BAG.Parser:CreateGuide({
    id = "Alliance_NightElf_01_10",
    title = "Night Elf 1-10 (Teldrassil)",
    faction = "Alliance",
    levelRange = {min = 1, max = 10},
    steps = {
        {type = "accept", text = "Accept starting quest", zone = "Teldrassil", x = 0.45, y = 0.62},
        {type = "goto", text = "Complete objectives nearby", zone = "Teldrassil", x = 0.44, y = 0.59},
        {type = "turnin", text = "Turn in and get follow-up", zone = "Teldrassil", x = 0.45, y = 0.62},
        {type = "goto", text = "Head to Dolanaar", zone = "Teldrassil", x = 0.56, y = 0.60},
        {type = "note", text = "Pick up all quests in Dolanaar"},
        {type = "goto", text = "Quest around Dolanaar area", zone = "Teldrassil", x = 0.60, y = 0.56},
        {type = "note", text = "Continue questing until level 10"}
    }
})

BAG.Engine:RegisterGuide(nightElfStart)

-- Draenei (Azuremyst Isle 1-10)
local draeneiStart = BAG.Parser:CreateGuide({
    id = "Alliance_Draenei_01_10",
    title = "Draenei 1-10 (Azuremyst Isle)",
    faction = "Alliance",
    levelRange = {min = 1, max = 10},
    steps = {
        {type = "accept", text = "Accept crash site quest", zone = "Azuremyst Isle", x = 0.79, y = 0.47},
        {type = "goto", text = "Help survivors near crash site", zone = "Azuremyst Isle", x = 0.78, y = 0.49},
        {type = "turnin", text = "Return to quest giver", zone = "Azuremyst Isle", x = 0.79, y = 0.47},
        {type = "goto", text = "Travel to Azure Watch", zone = "Azuremyst Isle", x = 0.49, y = 0.49},
        {type = "note", text = "Pick up all available quests at Azure Watch"},
        {type = "goto", text = "Complete objectives around Azure Watch", zone = "Azuremyst Isle", x = 0.45, y = 0.55},
        {type = "note", text = "Continue questing until level 10"}
    }
})

BAG.Engine:RegisterGuide(draeneiStart)

print("|cff00B3FF[Bank Alone Guides]|r Alliance starting zones loaded")
