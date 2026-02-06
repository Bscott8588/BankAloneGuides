--[[
    Bank Alone Guides - Alliance 58-70 Outland
    Complete Outland leveling guide
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Alliance.Alliance_58_70 = {
    title = "Alliance 58-70 (Outland)",
    description = "Complete Outland leveling path from Dark Portal to 70",
    faction = "Alliance",
    levelRange = {min = 58, max = 70},
    zones = {"Hellfire Peninsula", "Zangarmarsh", "Terokkar Forest", "Nagrand", "Blade's Edge Mountains", "Netherstorm", "Shadowmoon Valley"},
    
    steps = {
        BAG.Parser:Note("Welcome to Outland! The Burning Crusade awaits!"),
        
        -- Hellfire Peninsula (58-62)
        BAG.Parser:GoTo("Blasted Lands", 0.58, 0.55, "Go to the Dark Portal"),
        BAG.Parser:Accept(10119, "Accept 'Through the Dark Portal'"),
        BAG.Parser:GoTo("Hellfire Peninsula", 0.87, 0.50, "Step through the Dark Portal!"),
        
        BAG.Parser:TurnIn(10119, "Turn in at the Stair of Destiny"),
        BAG.Parser:Accept(10288, "Accept 'Arrival in Outland'"),
        
        BAG.Parser:GoTo("Hellfire Peninsula", 0.54, 0.62, "Travel to Honor Hold"),
        BAG.Parser:GetFlightPath("Honor Hold"),
        BAG.Parser:TurnIn(10288, "Turn in to the commander"),
        
        BAG.Parser:Accept(10140, "Accept 'Eradicate the Burning Legion'"),
        BAG.Parser:Kill("Flamewaker Imp", 10, 10140),
        BAG.Parser:TurnIn(10140, "Return to Honor Hold"),
        
        BAG.Parser:Note("Complete all Honor Hold quests until level 60-61"),
        BAG.Parser:Note("Hellfire Ramparts dungeon is excellent at level 59+"),
        
        -- Zangarmarsh (60-64)
        BAG.Parser:GoTo("Zangarmarsh", 0.67, 0.48, "Travel to Telredor", {level = ">=60"}),
        BAG.Parser:GetFlightPath("Telredor", {level = ">=60"}),
        BAG.Parser:Note("Zangarmarsh offers great quest density. Join Cenarion Expedition!", {level = ">=60"}),
        BAG.Parser:Note("Complete Coilfang Reservoir dungeons for gear", {level = ">=62"}),
        
        -- Terokkar Forest (62-65)
        BAG.Parser:GoTo("Terokkar Forest", 0.56, 0.53, "Travel to Allerian Stronghold", {level = ">=62"}),
        BAG.Parser:GetFlightPath("Allerian Stronghold", {level = ">=62"}),
        BAG.Parser:Note("Terokkar has many quest hubs. Complete them all!", {level = ">=62"}),
        BAG.Parser:Note("Visit Shattrath City and choose Aldor or Scryer", {level = ">=62"}),
        
        BAG.Parser:GoTo("Shattrath City", 0.64, 0.41, "Visit Shattrath", {level = ">=62"}),
        BAG.Parser:GetFlightPath("Shattrath City", {level = ">=62"}),
        BAG.Parser:Note("Set your hearthstone to Shattrath for convenience", {level = ">=62"}),
        
        -- Nagrand (64-67)
        BAG.Parser:GoTo("Nagrand", 0.54, 0.75, "Travel to Telaar", {level = ">=64"}),
        BAG.Parser:GetFlightPath("Telaar", {level = ">=64"}),
        BAG.Parser:Note("Nagrand is beautiful and has excellent quests!", {level = ">=64"}),
        BAG.Parser:Note("Hunt elite mobs in groups for fast XP", {level = ">=65"}),
        
        -- Blade's Edge Mountains (65-68)
        BAG.Parser:GoTo("Blade's Edge Mountains", 0.61, 0.68, "Travel to Sylvanaar", {level = ">=65"}),
        BAG.Parser:GetFlightPath("Sylvanaar", {level = ">=65"}),
        BAG.Parser:Note("Complete Ogri'la dailies for gold and rep at 70", {level = ">=65"}),
        
        -- Netherstorm (67-70)
        BAG.Parser:GoTo("Netherstorm", 0.32, 0.64, "Travel to Area 52", {level = ">=67"}),
        BAG.Parser:GetFlightPath("Area 52", {level = ">=67"}),
        BAG.Parser:Note("Netherstorm quests give excellent rewards!", {level = ">=67"}),
        BAG.Parser:Note("The Botanica, Mechanar, and Arcatraz dungeons are here", {level = ">=68"}),
        
        -- Shadowmoon Valley (67-70)
        BAG.Parser:GoTo("Shadowmoon Valley", 0.30, 0.28, "Travel to Wildhammer Stronghold", {level = ">=67"}),
        BAG.Parser:GetFlightPath("Wildhammer Stronghold", {level = ">=67"}),
        BAG.Parser:Note("Final zone! Complete Netherwing and Scryer/Aldor quests", {level = ">=67"}),
        
        BAG.Parser:Note("Congratulations on reaching level 70! Begin raid attunements and heroic dungeons!", {level = ">=70"}),
        BAG.Parser:Note("Check out our profession and gold farming guides for endgame content", {level = ">=70"}),
    },
}
