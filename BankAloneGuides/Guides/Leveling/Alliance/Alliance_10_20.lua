--[[
    Bank Alone Guides - Alliance 10-20 Leveling
    Original leveling guide for Westfall/Loch Modan
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Alliance.Alliance_10_20 = {
    title = "Alliance 10-20 (Westfall/Loch Modan)",
    description = "Multi-zone leveling path through Westfall and Loch Modan",
    faction = "Alliance",
    levelRange = {min = 10, max = 20},
    zones = {"Westfall", "Loch Modan"},
    
    steps = {
        BAG.Parser:Note("This guide covers both Westfall and Loch Modan. Choose based on your location."),
        
        -- Westfall Path (levels 10-15)
        BAG.Parser:GoTo("Westfall", 0.56, 0.47, "Travel to Sentinel Hill"),
        BAG.Parser:GetFlightPath("Sentinel Hill", {text = "Get Westfall flight path if you don't have it"}),
        
        BAG.Parser:Accept(9, "Accept 'The Forgotten Heirloom' from Captain Grayson"),
        BAG.Parser:Accept(151, "Accept 'Poor Old Blanchy'"),
        BAG.Parser:GoTo("Westfall", 0.59, 0.19, "Go to the Furlbrow farm"),
        BAG.Parser:Collect(3713, 8, 151, {text = "Collect oats around the farm"}),
        BAG.Parser:TurnIn(151, "Feed the horse"),
        
        BAG.Parser:Accept(22, "Accept 'Goretusk Liver Pie'"),
        BAG.Parser:Kill("Goretusk", 8, 22, {text = "Hunt boars for livers"}),
        BAG.Parser:TurnIn(22, "Return to Sentinel Hill"),
        
        BAG.Parser:Accept(103, "Accept 'Keeper of the Flame'"),
        BAG.Parser:GoTo("Westfall", 0.47, 0.19, "Go to the lighthouse"),
        BAG.Parser:TurnIn(103, "Turn in at lighthouse"),
        
        -- Transition to Loch Modan (level 15+)
        BAG.Parser:Note("At level 15, head to Loch Modan for more efficient leveling", {level = ">=15"}),
        
        BAG.Parser:GoTo("Loch Modan", 0.33, 0.49, "Travel to Thelsamar", {level = ">=15"}),
        BAG.Parser:GetFlightPath("Thelsamar", {level = ">=15"}),
        
        BAG.Parser:Accept(257, "Accept 'Filthy Paws'", {level = ">=15"}),
        BAG.Parser:GoTo("Loch Modan", 0.38, 0.61, "Clear kobolds at the mine", {level = ">=15"}),
        BAG.Parser:Kill("Stonesplinter Kobold", 12, 257, {level = ">=15"}),
        BAG.Parser:TurnIn(257, "Return to Thelsamar", {level = ">=15"}),
        
        BAG.Parser:Accept(298, "Accept 'Crocolisk Hunting'", {level = ">=15"}),
        BAG.Parser:GoTo("Loch Modan", 0.52, 0.66, "Hunt crocolisks by the lake", {level = ">=15"}),
        BAG.Parser:Kill("Loch Crocolisk", 10, 298, {level = ">=15"}),
        BAG.Parser:TurnIn(298, "Return to Thelsamar", {level = ">=15"}),
        
        BAG.Parser:Note("Congratulations on reaching level 20! Next: Redridge Mountains or Duskwood"),
    },
}
