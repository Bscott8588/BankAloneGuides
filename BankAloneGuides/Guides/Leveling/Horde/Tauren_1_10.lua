--[[
    Bank Alone Guides - Horde Tauren Starting Zone (1-10)
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Horde.Tauren_1_10 = {
    title = "Tauren 1-10 (Mulgore)",
    description = "Efficient leveling for Tauren in Red Cloud Mesa and Mulgore",
    faction = "Horde",
    levelRange = {min = 1, max = 10},
    zones = {"Mulgore"},
    race = "Tauren",
    
    steps = {
        BAG.Parser:Note("Welcome to the peaceful plains of Mulgore!"),
        BAG.Parser:Accept(747, "Accept 'The Hunt Begins'"),
        BAG.Parser:Kill("Plainstrider", 8, 747),
        BAG.Parser:TurnIn(747, "Turn in quest"),
        
        BAG.Parser:GoTo("Mulgore", 0.47, 0.58, "Travel to Bloodhoof Village"),
        BAG.Parser:GetFlightPath("Bloodhoof Village"),
        BAG.Parser:Note("Bloodhoof Village is your main hub"),
        
        BAG.Parser:Accept(754, "Accept 'Sharing the Land'"),
        BAG.Parser:Kill("Bristleback", 10, 754),
        BAG.Parser:TurnIn(754, "Return to Bloodhoof Village"),
        
        BAG.Parser:GoTo("Thunder Bluff", 0.47, 0.50, "Travel to Thunder Bluff to train", {level = ">=10"}),
        BAG.Parser:Train("Class Skills", nil, {level = ">=10"}),
        
        BAG.Parser:Note("Guide complete! Next: The Barrens (10-20)"),
    },
}
