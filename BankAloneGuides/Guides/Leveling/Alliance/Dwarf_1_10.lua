--[[
    Bank Alone Guides - Alliance Dwarf/Gnome Starting Zone (1-10)
    Original leveling guide for Dwarves and Gnomes in Dun Morogh
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Alliance.Dwarf_1_10 = {
    title = "Dwarf/Gnome 1-10 (Dun Morogh)",
    description = "Efficient leveling path for Dwarf and Gnome characters in Coldridge Valley and Dun Morogh",
    faction = "Alliance",
    levelRange = {min = 1, max = 10},
    zones = {"Dun Morogh"},
    race = {"Dwarf", "Gnome"},
    
    steps = {
        BAG.Parser:Note("Welcome! This guide covers Dun Morogh leveling for Dwarves and Gnomes."),
        
        -- Coldridge Valley
        BAG.Parser:Accept(179, "Accept starting quest from Sten Stoutarm"),
        BAG.Parser:Kill("Ragged Young Wolf", 8, 179),
        BAG.Parser:TurnIn(179, "Turn in quest"),
        
        BAG.Parser:Accept(233, "Accept 'The Troll Cave'"),
        BAG.Parser:GoTo("Dun Morogh", 0.27, 0.79, "Enter Frostmane Hold cave"),
        BAG.Parser:Kill("Frostmane Troll Whelp", 6, 233),
        BAG.Parser:TurnIn(233, "Return and turn in"),
        
        -- Kharanos Area
        BAG.Parser:GoTo("Dun Morogh", 0.46, 0.52, "Travel to Kharanos"),
        BAG.Parser:GetFlightPath("Kharanos"),
        BAG.Parser:Note("Kharanos is your main hub. Rest and resupply here."),
        
        BAG.Parser:Accept(313, "Accept 'Bundling Bearkin'"),
        BAG.Parser:Accept(314, "Accept 'The Grizzled Den'"),
        BAG.Parser:GoTo("Dun Morogh", 0.48, 0.68, "Hunt bears south of Kharanos"),
        BAG.Parser:Kill("Grizzled Black Bear", 8, 313),
        BAG.Parser:TurnIn(313, "Return to Kharanos"),
        
        BAG.Parser:Accept(287, "Accept 'The Trogg Threat'"),
        BAG.Parser:GoTo("Dun Morogh", 0.34, 0.47, "Clear troggs at Gol'Bolar Quarry"),
        BAG.Parser:Kill("Rockjaw Trogg", 10, 287),
        BAG.Parser:TurnIn(287, "Return to Kharanos"),
        
        BAG.Parser:GoTo("Ironforge", 0.48, 0.48, "Travel to Ironforge to train", {level = ">=10"}),
        BAG.Parser:Train("Class Skills", nil, {level = ">=10"}),
        
        BAG.Parser:Note("Guide complete! Next: Loch Modan (10-20)"),
    },
}

BAG.Guides.Leveling.Alliance.Gnome_1_10 = BAG.Guides.Leveling.Alliance.Dwarf_1_10
