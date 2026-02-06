--[[
    Bank Alone Guides - Alliance 20-30 Leveling
    Original guide for Redridge/Duskwood/Ashenvale
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Alliance.Alliance_20_30 = {
    title = "Alliance 20-30 (Redridge/Duskwood)",
    description = "Leveling through Redridge Mountains and Duskwood",
    faction = "Alliance",
    levelRange = {min = 20, max = 30},
    zones = {"Redridge Mountains", "Duskwood", "Ashenvale"},
    
    steps = {
        BAG.Parser:Note("Welcome to the 20-30 bracket! This guide covers Redridge and Duskwood."),
        
        BAG.Parser:GoTo("Redridge Mountains", 0.30, 0.44, "Travel to Lakeshire"),
        BAG.Parser:GetFlightPath("Lakeshire"),
        BAG.Parser:Note("Stock up on supplies and train your level 20 skills"),
        
        BAG.Parser:Accept(244, "Accept 'Howling in the Hills'"),
        BAG.Parser:Kill("Redridge Gnoll", 10, 244),
        BAG.Parser:TurnIn(244, "Return to Lakeshire"),
        
        BAG.Parser:Accept(128, "Accept 'Blackrock Menace'"),
        BAG.Parser:GoTo("Redridge Mountains", 0.60, 0.52, "Clear orcs at Alther's Mill"),
        BAG.Parser:Kill("Blackrock Orc", 12, 128),
        BAG.Parser:TurnIn(128, "Return to Lakeshire"),
        
        -- Transition to Duskwood (25+)
        BAG.Parser:GoTo("Duskwood", 0.73, 0.44, "Travel to Darkshire", {level = ">=25"}),
        BAG.Parser:GetFlightPath("Darkshire", {level = ">=25"}),
        BAG.Parser:Note("Duskwood is a spooky zone perfect for level 25-30", {level = ">=25"}),
        
        BAG.Parser:Accept(58, "Accept 'The Night Watch'", {level = ">=25"}),
        BAG.Parser:Kill("Skeletal Warrior", 10, 58, {level = ">=25"}),
        BAG.Parser:TurnIn(58, "Return to Darkshire", {level = ">=25"}),
        
        BAG.Parser:Accept(226, "Accept 'Wolves at Our Heels'", {level = ">=25"}),
        BAG.Parser:Kill("Dire Wolf", 12, 226, {level = ">=25"}),
        BAG.Parser:TurnIn(226, "Return to Darkshire", {level = ">=25"}),
        
        BAG.Parser:Note("You're ready for level 30-40 content! Next: Stranglethorn Vale or Desolace"),
    },
}
