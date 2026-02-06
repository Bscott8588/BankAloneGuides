--[[
    Bank Alone Guides - Horde 10-20
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Horde.Horde_10_20 = {
    title = "Horde 10-20 (The Barrens)",
    description = "Leveling through The Barrens",
    faction = "Horde",
    levelRange = {min = 10, max = 20},
    zones = {"The Barrens", "Silverpine Forest", "Ghostlands"},
    
    steps = {
        BAG.Parser:Note("The Barrens is the iconic Horde leveling zone!"),
        BAG.Parser:GoTo("The Barrens", 0.51, 0.29, "Travel to The Crossroads"),
        BAG.Parser:GetFlightPath("The Crossroads"),
        BAG.Parser:Note("Pick up all quests at The Crossroads"),
        BAG.Parser:Note("Barrens chat is legendary - enjoy the community!"),
        BAG.Parser:Note("Complete quests throughout the zone for efficient leveling"),
    },
}
