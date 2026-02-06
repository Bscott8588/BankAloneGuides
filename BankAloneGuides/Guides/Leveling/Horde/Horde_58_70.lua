--[[
    Bank Alone Guides - Horde 58-70 Outland
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Horde.Horde_58_70 = {
    title = "Horde 58-70 (Outland)",
    description = "Complete Outland leveling from Dark Portal to 70",
    faction = "Horde",
    levelRange = {min = 58, max = 70},
    zones = {"Hellfire Peninsula", "Zangarmarsh", "Terokkar Forest", "Nagrand", "Blade's Edge Mountains", "Netherstorm", "Shadowmoon Valley"},
    
    steps = {
        BAG.Parser:Note("Welcome to Outland! For the Horde!"),
        
        BAG.Parser:GoTo("Blasted Lands", 0.58, 0.55, "Go to the Dark Portal"),
        BAG.Parser:Accept(9407, "Accept 'Through the Dark Portal'"),
        BAG.Parser:GoTo("Hellfire Peninsula", 0.87, 0.50, "Step through!"),
        
        BAG.Parser:TurnIn(9407, "Turn in at Stair of Destiny"),
        BAG.Parser:Accept(10120, "Accept 'Arrival in Outland'"),
        
        BAG.Parser:GoTo("Hellfire Peninsula", 0.56, 0.37, "Travel to Thrallmar"),
        BAG.Parser:GetFlightPath("Thrallmar"),
        BAG.Parser:TurnIn(10120, "Report to commander"),
        
        BAG.Parser:Note("Complete all Thrallmar quests"),
        BAG.Parser:Note("Follow similar path to Alliance: Zangarmarsh (60-64), Terokkar (62-65), Nagrand (64-67), Blade's Edge (65-68), Netherstorm/Shadowmoon (67-70)"),
        
        BAG.Parser:Note("Congratulations on reaching level 70! Begin heroics and raids!", {level = ">=70"}),
    },
}
