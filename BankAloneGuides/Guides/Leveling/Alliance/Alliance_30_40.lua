--[[
    Bank Alone Guides - Alliance 30-40
    Stranglethorn Vale and Desolace
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Alliance.Alliance_30_40 = {
    title = "Alliance 30-40 (Stranglethorn Vale)",
    description = "Quest through Stranglethorn Vale",
    faction = "Alliance",
    levelRange = {min = 30, max = 40},
    zones = {"Stranglethorn Vale", "Desolace"},
    
    steps = {
        BAG.Parser:Note("Stranglethorn Vale offers tons of quests. Watch for Horde players!"),
        BAG.Parser:GoTo("Stranglethorn Vale", 0.27, 0.77, "Travel to Booty Bay"),
        BAG.Parser:GetFlightPath("Booty Bay"),
        BAG.Parser:Note("Pick up all available quests in Booty Bay"),
        BAG.Parser:Note("Hunt in the jungle and complete quests for efficient XP"),
        BAG.Parser:Note("At level 40, congratulations on your mount! Train riding in a capital city"),
    },
}
