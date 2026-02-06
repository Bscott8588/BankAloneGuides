--[[
    Bank Alone Guides - Horde 20-30
    SCS / Bank Alone Guides
    
    Hillsbrad Foothills, Ashenvale, Thousand Needles. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Horde_2030", {
    title = "Horde 20-30: Hillsbrad & Ashenvale",
    faction = "Horde",
    levelRange = {20, 30},
    category = "Leveling",
    nextGuide = "Horde_3040",
    steps = {
        -- Ashenvale (20-25)
        { type = "note", text = "Head to Ashenvale from the Barrens by going north through the road.", conditions = {} },
        { type = "goto", text = "Travel to the Zoram'gar Outpost or Splintertree Post in Ashenvale.", zone = "Ashenvale", x = 73.7, y = 61.5, conditions = {} },
        { type = "flightpath", text = "Get the Splintertree Post flight path.", zone = "Ashenvale", conditions = {} },
        { type = "note", text = "Set your hearthstone at Splintertree Post.", conditions = {} },
        { type = "note", text = "Pick up quests: satyr clearing, warsong lumber camp defense, and demon investigation.", conditions = {} },
        { type = "note", text = "Work the satyr camps to the southeast for multiple quest chains.", zone = "Ashenvale", x = 80.0, y = 66.0, conditions = {} },
        { type = "note", text = "Complete the Warsong Lumber Camp quests involving supply gathering and defending the operation.", conditions = {} },
        { type = "note", text = "Visit the Zoram Strand on the west coast for naga quests.", zone = "Ashenvale", x = 11.5, y = 33.5, conditions = {} },
        { type = "note", text = "Run Blackfathom Deeps if you have a group.", conditions = {} },
        { type = "level", targetLevel = 24, text = "Complete Ashenvale quests to level 24.", conditions = {} },

        -- Hillsbrad Foothills (24-28)
        { type = "note", text = "Head to Hillsbrad Foothills. Take the zeppelin from Orgrimmar to Undercity, then travel south.", conditions = {} },
        { type = "goto", text = "Travel to Tarren Mill in Hillsbrad Foothills.", zone = "Hillsbrad Foothills", x = 61.5, y = 20.9, conditions = {} },
        { type = "flightpath", text = "Get the Tarren Mill flight path.", zone = "Hillsbrad Foothills", conditions = {} },
        { type = "note", text = "Set your hearthstone at Tarren Mill.", conditions = {} },
        { type = "note", text = "Pick up all quests: Southshore espionage, yeti cave, bear/spider hunting, and farmer disruption.", conditions = {} },
        { type = "note", text = "Work the farm fields south of Tarren Mill for quest objectives.", zone = "Hillsbrad Foothills", x = 54.0, y = 40.0, conditions = {} },
        { type = "note", text = "Clear the yeti cave in the northeast for fur collection quests.", zone = "Hillsbrad Foothills", x = 60.0, y = 12.0, conditions = {} },
        { type = "note", text = "Complete the Alterac Mountains quests involving the syndicate.", conditions = {} },
        { type = "level", targetLevel = 28, text = "Continue Hillsbrad quests to level 28.", conditions = {} },

        -- Thousand Needles (25-30 Kalimdor alternative)
        { type = "note", text = "If you prefer Kalimdor, Thousand Needles is available from southern Barrens at level 25.", conditions = {} },
        { type = "note", text = "Thousand Needles offers the Shimmering Flats racing quests and centaur conflict chains.", conditions = {} },

        -- Stonetalon Mountains supplement
        { type = "note", text = "Stonetalon Mountains can supplement your leveling around 20-25 as well.", conditions = {} },

        { type = "level", targetLevel = 30, text = "Finish remaining quests to reach level 30.", conditions = {} },
        { type = "note", text = "At level 30, head to Stranglethorn Vale for the 30-40 bracket.", conditions = {} },
    },
})
