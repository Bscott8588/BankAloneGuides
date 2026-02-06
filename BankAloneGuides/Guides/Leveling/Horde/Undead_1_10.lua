--[[
    Bank Alone Guides - Horde Undead Starting Zone (1-10)
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Horde.Undead_1_10 = {
    title = "Undead 1-10 (Tirisfal Glades)",
    description = "Efficient leveling for Undead in Deathknell and Tirisfal Glades",
    faction = "Horde",
    levelRange = {min = 1, max = 10},
    zones = {"Tirisfal Glades"},
    race = "Undead",
    
    steps = {
        BAG.Parser:Note("Welcome, Forsaken! Serve the Dark Lady!"),
        BAG.Parser:Accept(363, "Accept 'Rude Awakening'"),
        BAG.Parser:Kill("Young Scavenger", 8, 363),
        BAG.Parser:TurnIn(363, "Turn in quest"),
        
        BAG.Parser:GoTo("Tirisfal Glades", 0.61, 0.51, "Travel to Brill"),
        BAG.Parser:GetFlightPath("Brill"),
        BAG.Parser:Note("Brill is your main quest hub"),
        
        BAG.Parser:Accept(404, "Accept 'A Putrid Task'"),
        BAG.Parser:Kill("Ravaged Corpse", 8, 404),
        BAG.Parser:TurnIn(404, "Return to Brill"),
        
        BAG.Parser:GoTo("Undercity", 0.67, 0.38, "Travel to Undercity to train", {level = ">=10"}),
        BAG.Parser:Train("Class Skills", nil, {level = ">=10"}),
        
        BAG.Parser:Note("Guide complete! Next: Silverpine Forest (10-20)"),
    },
}
