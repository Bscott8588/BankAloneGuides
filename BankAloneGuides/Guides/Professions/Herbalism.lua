--[[
    Bank Alone Guides - Herbalism Guide
]]--

local addonName, BAG = ...

BAG.Guides.Professions.Herbalism = {
    title = "Herbalism 1-375",
    faction = "Both",
    profession = "Herbalism",
    steps = {
        BAG.Parser:Note("Herbalism pairs well with Alchemy!"),
        BAG.Parser:Train("Herbalism Apprentice"),
        BAG.Parser:Note("Pick Peacebloom and Silverleaf in starting zones"),
        BAG.Parser:Note("Progress through herb tiers as you level"),
        BAG.Parser:Note("Train Master Herbalism in Outland at 300 skill"),
    },
}
