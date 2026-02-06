--[[
    Bank Alone Guides - Horde Blood Elf Starting Zone (1-10)
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Horde.BloodElf_1_10 = {
    title = "Blood Elf 1-10 (Eversong Woods)",
    description = "Efficient leveling for Blood Elves in Sunstrider Isle and Eversong Woods",
    faction = "Horde",
    levelRange = {min = 1, max = 10},
    zones = {"Eversong Woods"},
    race = "BloodElf",
    
    steps = {
        BAG.Parser:Note("Welcome to the lands of Quel'Thalas! Glory to the Sin'dorei!"),
        BAG.Parser:Accept(8325, "Accept 'Reclaiming Sunstrider Isle'"),
        BAG.Parser:Kill("Mana Wyrm", 8, 8325),
        BAG.Parser:TurnIn(8325, "Turn in quest"),
        
        BAG.Parser:GoTo("Eversong Woods", 0.46, 0.46, "Travel to Falconwing Square"),
        BAG.Parser:GetFlightPath("Falconwing Square"),
        BAG.Parser:Note("Falconwing Square is your main hub"),
        
        BAG.Parser:Accept(8480, "Accept 'The Wayward Apprentice'"),
        BAG.Parser:GoTo("Eversong Woods", 0.45, 0.56, "Find the wayward apprentice"),
        BAG.Parser:TurnIn(8480, "Complete the quest"),
        
        BAG.Parser:GoTo("Silvermoon City", 0.55, 0.50, "Travel to Silvermoon City to train", {level = ">=10"}),
        BAG.Parser:Train("Class Skills", nil, {level = ">=10"}),
        
        BAG.Parser:Note("Guide complete! Next: Ghostlands (10-20)"),
    },
}
