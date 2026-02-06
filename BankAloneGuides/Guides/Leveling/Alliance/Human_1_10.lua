--[[
    Bank Alone Guides - Alliance Human Starting Zone (1-10)
    Original leveling guide for Humans in Elwynn Forest
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

-- Register the guide
BAG.Guides.Leveling.Alliance.Human_1_10 = {
    title = "Human 1-10 (Elwynn Forest)",
    description = "Efficient leveling path for Human characters starting in Northshire Valley and Elwynn Forest",
    faction = "Alliance",
    levelRange = {min = 1, max = 10},
    zones = {"Elwynn Forest"},
    race = "Human",
    
    steps = {
        -- Northshire Valley (Levels 1-5)
        BAG.Parser:Note("Welcome to Bank Alone Guides! Follow these steps to level efficiently through Elwynn Forest."),
        
        BAG.Parser:Accept(783, "Accept 'A Threat Within' from Marshal McBride"),
        BAG.Parser:Kill("Defias Thug", 12, 783),
        BAG.Parser:TurnIn(783, "Turn in 'A Threat Within'"),
        
        BAG.Parser:Accept(5261, "Accept 'Eagan Peltskinner' - learn Skinning if interested"),
        BAG.Parser:GoTo("Elwynn Forest", 0.48, 0.42, "Go to Eagan Peltskinner"),
        BAG.Parser:TurnIn(5261, "Turn in quest"),
        
        BAG.Parser:Accept(18, "Accept 'Brotherhood of Thieves'"),
        BAG.Parser:GoTo("Elwynn Forest", 0.56, 0.49, "Head east to the Defias camp"),
        BAG.Parser:Kill("Defias Footpad", 12, 18),
        BAG.Parser:TurnIn(18, "Return and turn in quest"),
        
        -- Goldshire Area (Levels 5-8)
        BAG.Parser:GoTo("Elwynn Forest", 0.42, 0.66, "Travel to Goldshire"),
        BAG.Parser:GetFlightPath("Goldshire"),
        BAG.Parser:Note("Goldshire is your main quest hub for levels 5-10. Stock up on food and water here."),
        
        BAG.Parser:Accept(106, "Accept 'Young Lovers' from Marshal Dughan"),
        BAG.Parser:Accept(62, "Accept 'The Fargodeep Mine' from Marshal Dughan"),
        BAG.Parser:Accept(85, "Accept 'Lost Necklace' from Billy Maclure"),
        
        BAG.Parser:GoTo("Elwynn Forest", 0.43, 0.89, "Go to Maclure Vineyards"),
        BAG.Parser:TurnIn(106, "Turn in 'Young Lovers'"),
        BAG.Parser:Accept(111, "Accept follow-up 'Speak with Gramma'"),
        
        BAG.Parser:GoTo("Elwynn Forest", 0.34, 0.84, "Check the river for the necklace"),
        BAG.Parser:Collect(3616, 1, 85, {text = "Find 'Bernice's Necklace' (look on the ground)"}),
        BAG.Parser:TurnIn(85, "Return necklace to Billy"),
        
        BAG.Parser:GoTo("Elwynn Forest", 0.38, 0.82, "Head to Fargodeep Mine entrance"),
        BAG.Parser:Kill("Kobold Miner", 10, 62, {zone = "Fargodeep Mine"}),
        BAG.Parser:TurnIn(62, "Return to Marshal Dughan in Goldshire"),
        
        -- Eastern Elwynn (Levels 8-10)
        BAG.Parser:Accept(88, "Accept 'Princess Must Die!' from Guard Thomas"),
        BAG.Parser:GoTo("Elwynn Forest", 0.69, 0.79, "Go to Brackwell Pumpkin Patch"),
        BAG.Parser:Kill("Princess", 1, 88, {text = "Kill the unique pig 'Princess' in the barn"}),
        BAG.Parser:TurnIn(88, "Return to Guard Thomas"),
        
        BAG.Parser:Accept(52, "Accept 'Protect the Frontier' from Marshal Dughan"),
        BAG.Parser:GoTo("Elwynn Forest", 0.76, 0.84, "Clear gnolls east of Goldshire"),
        BAG.Parser:Kill("Riverpaw Gnoll", 8, 52),
        BAG.Parser:TurnIn(52, "Return to Marshal Dughan"),
        
        BAG.Parser:Note("Congratulations! You should be level 10. Head to Westfall or continue to level 12 before moving on."),
        
        BAG.Parser:GoTo("Stormwind City", 0.66, 0.62, "Travel to Stormwind to train and visit auction house", {level = ">=10"}),
        BAG.Parser:Train("Class Skills", nil, {level = ">=10", text = "Train your level 10 class abilities"}),
        
        BAG.Parser:Note("Guide complete! Next: Westfall (10-20) or Loch Modan (10-20)"),
    },
}
