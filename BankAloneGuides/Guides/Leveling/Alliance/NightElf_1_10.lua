--[[
    Bank Alone Guides - Alliance Night Elf Starting Zone (1-10)
    Original leveling guide for Night Elves in Teldrassil
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Alliance.NightElf_1_10 = {
    title = "Night Elf 1-10 (Teldrassil)",
    description = "Efficient leveling path for Night Elf characters in Shadowglen and Teldrassil",
    faction = "Alliance",
    levelRange = {min = 1, max = 10},
    zones = {"Teldrassil"},
    race = "NightElf",
    
    steps = {
        BAG.Parser:Note("Welcome to Teldrassil! Follow this guide for efficient leveling."),
        
        -- Shadowglen
        BAG.Parser:Accept(456, "Accept 'The Balance of Nature' from Conservator Ilthalaine"),
        BAG.Parser:Kill("Young Nightsaber", 7, 456),
        BAG.Parser:TurnIn(456, "Turn in quest"),
        
        BAG.Parser:Accept(457, "Accept 'The Balance of Nature (Part 2)'"),
        BAG.Parser:Kill("Young Thistle Boar", 7, 457),
        BAG.Parser:TurnIn(457, "Return and turn in"),
        
        BAG.Parser:Accept(916, "Accept 'Webwood Venom'"),
        BAG.Parser:GoTo("Teldrassil", 0.57, 0.92, "Enter Webwood cave"),
        BAG.Parser:Kill("Webwood Spider", 8, 916, {text = "Collect venom sacs"}),
        BAG.Parser:TurnIn(916, "Return to Shadowglen"),
        
        -- Dolanaar Area
        BAG.Parser:GoTo("Teldrassil", 0.60, 0.56, "Travel north to Dolanaar"),
        BAG.Parser:GetFlightPath("Dolanaar"),
        BAG.Parser:Note("Dolanaar is your quest hub. Rest at the inn and pick up all quests."),
        
        BAG.Parser:Accept(475, "Accept 'A Troubling Breeze'"),
        BAG.Parser:Accept(929, "Accept 'The Glowing Fruit'"),
        BAG.Parser:GoTo("Teldrassil", 0.56, 0.59, "Collect fruit near the moonwell"),
        BAG.Parser:Collect(5566, 1, 929, {text = "Pick up the Glowing Fruit"}),
        BAG.Parser:TurnIn(929, "Return to Dolanaar"),
        
        BAG.Parser:GoTo("Teldrassil", 0.55, 0.52, "Hunt Gnarlpine furbolgs"),
        BAG.Parser:Kill("Gnarlpine Furbolg", 10, 475),
        BAG.Parser:TurnIn(475, "Return to Dolanaar"),
        
        BAG.Parser:GoTo("Darnassus", 0.39, 0.81, "Travel to Darnassus to train", {level = ">=10"}),
        BAG.Parser:Train("Class Skills", nil, {level = ">=10"}),
        
        BAG.Parser:Note("Guide complete! Next: Darkshore (10-20)"),
    },
}
