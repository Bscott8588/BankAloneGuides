--[[
    Bank Alone Guides - Horde 20-30
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Horde.Horde_20_30 = {
    title = "Horde 20-30 (Stonetalon/Hillsbrad)",
    faction = "Horde",
    levelRange = {min = 20, max = 30},
    zones = {"Stonetalon Mountains", "Hillsbrad Foothills", "Ashenvale"},
    steps = {
        BAG.Parser:Note("Multiple zones available for this level range"),
        BAG.Parser:Note("Stonetalon Mountains and Hillsbrad Foothills are excellent choices"),
    },
}
