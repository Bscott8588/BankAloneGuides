--[[
    Bank Alone Guides - Alliance Draenei Starting Zone (1-10)
    Original leveling guide for Draenei in Azuremyst Isle
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Alliance.Draenei_1_10 = {
    title = "Draenei 1-10 (Azuremyst Isle)",
    description = "Efficient leveling path for Draenei characters on Azuremyst Isle",
    faction = "Alliance",
    levelRange = {min = 1, max = 10},
    zones = {"Azuremyst Isle"},
    race = "Draenei",
    
    steps = {
        BAG.Parser:Note("Welcome to Azuremyst Isle! Guide the survivors of the Exodar crash."),
        
        -- Crash Site
        BAG.Parser:Accept(9279, "Accept 'You Survived!'"),
        BAG.Parser:Kill("Volatile Mutation", 8, 9279),
        BAG.Parser:TurnIn(9279, "Turn in quest"),
        
        BAG.Parser:Accept(9280, "Accept 'Replenishing the Healing Crystals'"),
        BAG.Parser:Collect(22889, 1, 9280, {text = "Collect crystal samples"}),
        BAG.Parser:TurnIn(9280, "Return to crash site"),
        
        BAG.Parser:GoTo("Azuremyst Isle", 0.79, 0.47, "Travel to Ammen Vale settlement"),
        BAG.Parser:Accept(9312, "Accept 'The Emitter'"),
        BAG.Parser:GoTo("Azuremyst Isle", 0.72, 0.53, "Find the crashed pod"),
        BAG.Parser:Use(22962, "Use the emitter", 9312),
        BAG.Parser:TurnIn(9312, "Return and turn in"),
        
        -- Azure Watch Area
        BAG.Parser:GoTo("Azuremyst Isle", 0.48, 0.49, "Travel to Azure Watch"),
        BAG.Parser:GetFlightPath("Azure Watch"),
        BAG.Parser:Note("Azure Watch is your main town. Train professions and rest here."),
        
        BAG.Parser:Accept(9513, "Accept 'Medicinal Purpose'"),
        BAG.Parser:GoTo("Azuremyst Isle", 0.46, 0.64, "Hunt Roottrapper ravagers"),
        BAG.Parser:Kill("Roottrapper Ravager", 8, 9513),
        BAG.Parser:TurnIn(9513, "Return to Azure Watch"),
        
        BAG.Parser:Accept(9506, "Accept 'The Great Moongraze Hunt'"),
        BAG.Parser:Kill("Moongraze Stag", 6, 9506),
        BAG.Parser:TurnIn(9506, "Turn in quest"),
        
        BAG.Parser:GoTo("The Exodar", 0.55, 0.50, "Travel to The Exodar to train", {level = ">=10"}),
        BAG.Parser:Train("Class Skills", nil, {level = ">=10"}),
        
        BAG.Parser:Note("Guide complete! Next: Bloodmyst Isle (10-20)"),
    },
}
