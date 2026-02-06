--[[
    Bank Alone Guides - Horde 40-50
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Horde.Horde_40_50 = {
    title = "Horde 40-50 (Tanaris/Feralas)",
    faction = "Horde",
    levelRange = {min = 40, max = 50},
    zones = {"Tanaris", "Feralas", "The Hinterlands"},
    steps = {
        BAG.Parser:Note("Tanaris and Feralas provide great questing"),
        BAG.Parser:GoTo("Tanaris", 0.51, 0.28, "Travel to Gadgetzan"),
    },
}
