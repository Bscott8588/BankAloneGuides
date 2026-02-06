--[[
    Bank Alone Guides - Horde Starting Zones
    Race-specific starting guides 1-10
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Orc/Troll (Durotar 1-10)
local orcStart = BAG.Parser:CreateGuide({
    id = "Horde_Orc_01_10",
    title = "Orc/Troll 1-10 (Durotar)",
    faction = "Horde",
    levelRange = {min = 1, max = 10},
    steps = {
        {type = "accept", questID = 792, text = "Accept Cutting Teeth", zone = "Durotar", x = 0.43, y = 0.68},
        {type = "kill", questID = 792, text = "Hunt nearby creatures", zone = "Durotar", x = 0.44, y = 0.66},
        {type = "turnin", questID = 792, text = "Turn in quest", zone = "Durotar", x = 0.43, y = 0.68},
        {type = "accept", questID = 804, text = "Accept Sarkoth", zone = "Durotar", x = 0.43, y = 0.68},
        {type = "goto", text = "Hunt Sarkoth", zone = "Durotar", x = 0.40, y = 0.62},
        {type = "turnin", questID = 804, text = "Return to quest giver", zone = "Durotar", x = 0.43, y = 0.68},
        {type = "goto", text = "Travel to Razor Hill", zone = "Durotar", x = 0.51, y = 0.43},
        {type = "note", text = "Continue questing until level 10"}
    }
})

BAG.Engine:RegisterGuide(orcStart)

-- Tauren (Mulgore 1-10)
local taurenStart = BAG.Parser:CreateGuide({
    id = "Horde_Tauren_01_10",
    title = "Tauren 1-10 (Mulgore)",
    faction = "Horde",
    levelRange = {min = 1, max = 10},
    steps = {
        {type = "accept", questID = 747, text = "Accept starting quest", zone = "Mulgore", x = 0.50, y = 0.81},
        {type = "goto", text = "Complete objectives", zone = "Mulgore", x = 0.48, y = 0.79},
        {type = "turnin", text = "Turn in quest", zone = "Mulgore", x = 0.50, y = 0.81},
        {type = "goto", text = "Travel to Bloodhoof Village", zone = "Mulgore", x = 0.47, y = 0.60},
        {type = "note", text = "Quest around Bloodhoof Village"},
        {type = "note", text = "Continue until level 10"}
    }
})

BAG.Engine:RegisterGuide(taurenStart)

-- Undead (Tirisfal Glades 1-10)
local undeadStart = BAG.Parser:CreateGuide({
    id = "Horde_Undead_01_10",
    title = "Undead 1-10 (Tirisfal Glades)",
    faction = "Horde",
    levelRange = {min = 1, max = 10},
    steps = {
        {type = "accept", text = "Accept starting quest", zone = "Tirisfal Glades", x = 0.30, y = 0.56},
        {type = "goto", text = "Complete nearby objectives", zone = "Tirisfal Glades", x = 0.32, y = 0.54},
        {type = "turnin", text = "Turn in quest", zone = "Tirisfal Glades", x = 0.30, y = 0.56},
        {type = "goto", text = "Travel to Brill", zone = "Tirisfal Glades", x = 0.60, y = 0.52},
        {type = "note", text = "Quest around Brill"},
        {type = "note", text = "Continue until level 10"}
    }
})

BAG.Engine:RegisterGuide(undeadStart)

-- Blood Elf (Eversong Woods 1-10)
local bloodElfStart = BAG.Parser:CreateGuide({
    id = "Horde_BloodElf_01_10",
    title = "Blood Elf 1-10 (Eversong Woods)",
    faction = "Horde",
    levelRange = {min = 1, max = 10},
    steps = {
        {type = "accept", text = "Accept starting quest", zone = "Eversong Woods", x = 0.38, y = 0.20},
        {type = "goto", text = "Complete objectives", zone = "Eversong Woods", x = 0.36, y = 0.24},
        {type = "turnin", text = "Turn in quest", zone = "Eversong Woods", x = 0.38, y = 0.20},
        {type = "goto", text = "Travel to Falconwing Square", zone = "Eversong Woods", x = 0.46, y = 0.47},
        {type = "note", text = "Quest in Eversong Woods"},
        {type = "note", text = "Continue until level 10"}
    }
})

BAG.Engine:RegisterGuide(bloodElfStart)

print("|cff00B3FF[Bank Alone Guides]|r Horde starting zones loaded")
