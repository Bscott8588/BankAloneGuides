--[[
    Bank Alone Guides - Mining Profession Guide
]]--

local addonName, BAG = ...

BAG.Guides.Professions.Mining = {
    title = "Mining 1-375",
    description = "Complete Mining guide for TBC Classic",
    faction = "Both",
    profession = "Mining",
    
    steps = {
        BAG.Parser:Note("Mining is a lucrative gathering profession!"),
        BAG.Parser:Train("Mining Apprentice (1-75)", nil, {text = "Train at any capital city"}),
        BAG.Parser:Buy(2901, 1, "Buy a Mining Pick"),
        BAG.Parser:Note("Mine Copper in starting zones (1-75)"),
        BAG.Parser:Train("Mining Journeyman (75-150)", nil, {text = "Train at level 75"}),
        BAG.Parser:Note("Mine Tin and Silver (75-150)"),
        BAG.Parser:Train("Mining Expert (150-225)", nil, {text = "Train at level 150"}),
        BAG.Parser:Note("Mine Iron and Mithril (150-225)"),
        BAG.Parser:Train("Mining Artisan (225-300)", nil, {text = "Train at level 225"}),
        BAG.Parser:Note("Mine Thorium in high-level zones (225-300)"),
        BAG.Parser:Train("Mining Master (300-375)", nil, {text = "Train in Hellfire Peninsula", level = ">=58"}),
        BAG.Parser:Note("Mine Fel Iron and Adamantite in Outland (300-375)", {level = ">=58"}),
        BAG.Parser:Note("Congratulations on mastering Mining!"),
    },
}
