--[[
    Bank Alone Guides - Horde Orc/Troll Starting Zone (1-10)
    Original leveling guide for Orcs and Trolls in Durotar
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Horde.Orc_1_10 = {
    title = "Orc/Troll 1-10 (Durotar)",
    description = "Efficient leveling for Orcs and Trolls in Valley of Trials and Durotar",
    faction = "Horde",
    levelRange = {min = 1, max = 10},
    zones = {"Durotar"},
    race = {"Orc", "Troll"},
    
    steps = {
        BAG.Parser:Note("Lok'tar Ogar! Welcome to the Horde!"),
        BAG.Parser:Accept(4641, "Accept 'Your Place In The World'"),
        BAG.Parser:Kill("Mottled Boar", 8, 4641),
        BAG.Parser:TurnIn(4641, "Turn in quest"),
        
        BAG.Parser:Accept(788, "Accept 'Cutting Teeth'"),
        BAG.Parser:Kill("Scorpid Worker", 10, 788),
        BAG.Parser:TurnIn(788, "Return and turn in"),
        
        BAG.Parser:Accept(789, "Accept 'Sarkoth'"),
        BAG.Parser:GoTo("Durotar", 0.44, 0.87, "Find Sarkoth at the cave"),
        BAG.Parser:Kill("Sarkoth", 1, 789, {text = "Kill the unique scorpid"}),
        BAG.Parser:TurnIn(789, "Return to Valley of Trials"),
        
        BAG.Parser:GoTo("Durotar", 0.52, 0.42, "Travel to Razor Hill"),
        BAG.Parser:GetFlightPath("Razor Hill"),
        BAG.Parser:Note("Razor Hill is your main quest hub for levels 5-10"),
        
        BAG.Parser:Accept(817, "Accept 'Practical Prey'"),
        BAG.Parser:Kill("Armored Scorpid", 8, 817),
        BAG.Parser:TurnIn(817, "Return to Razor Hill"),
        
        BAG.Parser:GoTo("Orgrimmar", 0.45, 0.64, "Travel to Orgrimmar to train", {level = ">=10"}),
        BAG.Parser:Train("Class Skills", nil, {level = ">=10"}),
        
        BAG.Parser:Note("Guide complete! Next: The Barrens (10-20)"),
    },
}

BAG.Guides.Leveling.Horde.Troll_1_10 = BAG.Guides.Leveling.Horde.Orc_1_10
