--[[
    Bank Alone Guides - Alliance 20-30
    SCS / Bank Alone Guides
    
    Duskwood, Wetlands, Ashenvale. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Alliance_2030", {
    title = "Alliance 20-30: Duskwood & Wetlands",
    faction = "Alliance",
    levelRange = {20, 30},
    category = "Leveling",
    nextGuide = "Alliance_3040",
    steps = {
        -- Duskwood (20-25)
        { type = "goto", text = "Travel to Darkshire in Duskwood. Head south from Redridge or east from Sentinel Hill.", zone = "Duskwood", x = 75.8, y = 44.3, conditions = {} },
        { type = "flightpath", text = "Grab the Darkshire flight path.", zone = "Duskwood", x = 77.5, y = 44.3, conditions = {} },
        { type = "note", text = "Set your hearthstone at the Darkshire inn.", conditions = {} },
        { type = "note", text = "Pick up all quests in Darkshire. This is a quest-dense hub with multiple chains.", conditions = {} },
        { type = "note", text = "Start with the worgen investigation quests and the ogre clearing tasks southwest of town.", conditions = {} },
        { type = "note", text = "Head southwest to deal with the spider problem near the Roland Mansion.", zone = "Duskwood", x = 65.0, y = 61.0, conditions = {} },
        { type = "note", text = "Work the undead camps around Raven Hill cemetery in the western part of the zone.", zone = "Duskwood", x = 19.0, y = 56.0, conditions = {} },
        { type = "note", text = "Complete the Stalvan Mistmantle quest chain - it sends you through Darkshire's dark history.", conditions = {} },
        { type = "note", text = "Visit the Hermit near the Hushed Bank on the southern edge for a quest chain.", zone = "Duskwood", x = 28.0, y = 31.0, conditions = {} },
        { type = "note", text = "Complete the nightwatch quest chain from Commander Althea Ebonlocke.", conditions = {} },
        { type = "level", targetLevel = 25, text = "Continue Duskwood quests until level 25.", conditions = {} },

        -- Wetlands (24-28)
        { type = "note", text = "Head to the Wetlands. Fly to Menethil Harbor or walk from Loch Modan.", conditions = {} },
        { type = "goto", text = "Travel to Menethil Harbor in the Wetlands.", zone = "Wetlands", x = 9.5, y = 59.7, conditions = {} },
        { type = "flightpath", text = "Get the Menethil Harbor flight path.", zone = "Wetlands", conditions = {} },
        { type = "note", text = "Pick up quests at Menethil Harbor: murloc clearing, orc encampments, dark iron dwarf investigations.", conditions = {} },
        { type = "note", text = "Work east toward the orc camps in the Angerfang Encampment area.", zone = "Wetlands", x = 52.0, y = 40.0, conditions = {} },
        { type = "note", text = "Continue northeast to find quests at the dwarven excavation site.", zone = "Wetlands", x = 60.0, y = 25.0, conditions = {} },
        { type = "note", text = "Complete the raptor hunting quests and the gnoll clearing around the southern marshes.", conditions = {} },
        { type = "level", targetLevel = 28, text = "Finish Wetlands quests until level 28.", conditions = {} },

        -- Ashenvale (for Kalimdor players, 25-30)
        { type = "note", text = "Kalimdor-based characters: Ashenvale is a great alternative for 20-30. Travel from Darkshore.", conditions = {} },
        { type = "note", text = "Head to Astranaar in Ashenvale and pick up all quests there.", zone = "Ashenvale", x = 36.5, y = 49.5, conditions = {} },
        { type = "note", text = "Work the satyr camps to the east and the orc conflicts to the south.", conditions = {} },

        { type = "level", targetLevel = 30, text = "Continue clearing available quests across both zones to hit level 30.", conditions = {} },
        { type = "note", text = "At level 30, you're ready for Stranglethorn Vale and the 30-40 bracket.", conditions = {} },
    },
})
