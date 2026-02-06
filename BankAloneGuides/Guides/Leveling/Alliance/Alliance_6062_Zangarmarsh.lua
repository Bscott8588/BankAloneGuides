--[[
    Bank Alone Guides - Alliance 60-64: Zangarmarsh
    SCS / Bank Alone Guides
    
    Outland zone 2. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Alliance_6062_Zangarmarsh", {
    title = "Alliance 60-64: Zangarmarsh",
    faction = "Alliance",
    levelRange = {60, 64},
    category = "Leveling",
    nextGuide = "Alliance_6264_Terokkar",
    steps = {
        { type = "goto", text = "Enter Zangarmarsh from Hellfire Peninsula heading west. Follow the main road.", zone = "Zangarmarsh", x = 68.0, y = 49.0, conditions = {} },
        { type = "goto", text = "Head to Telredor, the Alliance base on top of a giant mushroom.", zone = "Zangarmarsh", x = 67.8, y = 48.0, conditions = {} },
        { type = "flightpath", text = "Get the Telredor flight path.", zone = "Zangarmarsh", conditions = {} },
        { type = "note", text = "Set your hearthstone at the inn on Telredor.", conditions = {} },
        { type = "note", text = "Pick up all quests: spore bat ecology, naga investigations, bog beast studies, and lost one reconnaissance.", conditions = {} },
        { type = "accept", questID = 9714, text = "Accept the quest to investigate the hostile Umbrafen tribe in the south.", zone = "Zangarmarsh", conditions = {} },
        { type = "note", text = "Work the quests north of Telredor first: spore bat hunting and marshlight collection.", zone = "Zangarmarsh", x = 62.0, y = 40.0, conditions = {} },
        { type = "complete", questID = 9714, text = "Head south to the Umbrafen village and investigate the lost ones there.", zone = "Zangarmarsh", x = 70.0, y = 80.0, conditions = {} },
        { type = "turnin", questID = 9714, text = "Return to the quest giver with your findings.", zone = "Zangarmarsh", conditions = {} },
        { type = "accept", questID = 9753, text = "Take the quest to catalog the unique plants of Zangarmarsh.", zone = "Zangarmarsh", conditions = {} },
        { type = "complete", questID = 9753, text = "Collect plant samples from the various mushroom groves across the marsh.", zone = "Zangarmarsh", conditions = {} },
        { type = "turnin", questID = 9753, text = "Deliver the botanical samples.", zone = "Zangarmarsh", conditions = {} },
        { type = "note", text = "Visit the Cenarion Refuge in the center of the zone for additional quests.", zone = "Zangarmarsh", x = 78.5, y = 63.0, conditions = {} },
        { type = "flightpath", text = "Get the Cenarion Refuge flight path.", zone = "Zangarmarsh", conditions = {} },
        { type = "accept", questID = 9747, text = "Take the warden's quest about Zangarmarsh operations.", zone = "Zangarmarsh", conditions = {} },
        { type = "complete", questID = 9747, text = "Complete the warden's tasks around the marsh.", zone = "Zangarmarsh", conditions = {} },
        { type = "note", text = "Work the naga camps along the western side - the Coilfang area near the Serpent Lake.", zone = "Zangarmarsh", x = 50.0, y = 41.0, conditions = {} },
        { type = "note", text = "Complete the drain-related quests: destroy the pump mechanisms and report back.", conditions = {} },
        { type = "note", text = "Run Slave Pens and Underbog dungeons with a group for extra XP and reputation.", conditions = {} },
        { type = "note", text = "Don't forget the Sporeggar faction quests in the northwest for interesting rewards.", zone = "Zangarmarsh", x = 19.0, y = 51.0, conditions = {} },
        { type = "level", targetLevel = 64, text = "Complete Zangarmarsh to reach level 64.", conditions = {} },
        { type = "note", text = "Head south to Terokkar Forest for the next zone.", conditions = {} },
    },
})
