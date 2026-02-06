--[[
    Bank Alone Guides - Alliance 40-50
    Tanaris, Feralas, Hinterlands
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Alliance.Alliance_40_50 = {
    title = "Alliance 40-50 (Tanaris/Feralas)",
    description = "Mid-level zones for efficient leveling",
    faction = "Alliance",
    levelRange = {min = 40, max = 50},
    zones = {"Tanaris", "Feralas", "The Hinterlands"},
    
    steps = {
        BAG.Parser:Note("Welcome to the 40-50 bracket! Multiple zones are available."),
        BAG.Parser:GoTo("Tanaris", 0.51, 0.28, "Travel to Gadgetzan"),
        BAG.Parser:GetFlightPath("Gadgetzan"),
        BAG.Parser:Note("Tanaris has many quests and is excellent for gold farming"),
        BAG.Parser:Note("Complete Zul'Farrak dungeon for great XP at level 45+"),
    },
}
