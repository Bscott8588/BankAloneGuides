--[[
    Bank Alone Guides - Horde 30-40
]]--

local addonName, BAG = ...

BAG.Guides.Leveling.Horde.Horde_30_40 = {
    title = "Horde 30-40 (Stranglethorn Vale)",
    faction = "Horde",
    levelRange = {min = 30, max = 40},
    zones = {"Stranglethorn Vale", "Desolace", "Arathi Highlands"},
    steps = {
        BAG.Parser:Note("Stranglethorn Vale offers excellent quest density"),
        BAG.Parser:GoTo("Stranglethorn Vale", 0.27, 0.77, "Travel to Booty Bay"),
        BAG.Parser:Note("At level 40, train your mount in Orgrimmar!"),
    },
}
