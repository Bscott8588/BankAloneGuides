--[[
    Bank Alone Guides - Alliance 50-58
    Final Azeroth leveling before Outland
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Alliance.Alliance_50_58 = {
    title = "Alliance 50-58 (Western Plaguelands/Winterspring)",
    description = "Final push to Outland",
    faction = "Alliance",
    levelRange = {min = 50, max = 58},
    zones = {"Western Plaguelands", "Eastern Plaguelands", "Winterspring", "Burning Steppes"},
    
    steps = {
        BAG.Parser:Note("Almost ready for Outland! These zones will prepare you."),
        BAG.Parser:GoTo("Western Plaguelands", 0.43, 0.84, "Travel to Chillwind Camp"),
        BAG.Parser:GetFlightPath("Chillwind Camp"),
        BAG.Parser:Note("Complete Argent Dawn quests for reputation and gear"),
        BAG.Parser:Note("At level 58, head to Blasted Lands to enter the Dark Portal!"),
    },
}
