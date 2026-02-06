--[[
    Bank Alone Guides - Horde 60-64: Zangarmarsh
    SCS / Bank Alone Guides
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Horde_6062_Zangarmarsh", {
    title = "Horde 60-64: Zangarmarsh",
    faction = "Horde",
    levelRange = {60, 64},
    category = "Leveling",
    nextGuide = "Horde_6264_Terokkar",
    steps = {
        { type = "goto", text = "Enter Zangarmarsh from Hellfire heading west.", zone = "Zangarmarsh", x = 68.0, y = 49.0, conditions = {} },
        { type = "goto", text = "Head to Swamprat Post, the Horde base in Zangarmarsh.", zone = "Zangarmarsh", x = 85.0, y = 54.8, conditions = {} },
        { type = "flightpath", text = "Get the Swamprat Post flight path.", zone = "Zangarmarsh", conditions = {} },
        { type = "note", text = "Set your hearthstone at Swamprat Post.", conditions = {} },
        { type = "note", text = "Pick up all quests: spore bat ecology, naga pump sabotage, bog beast clearing, and mushroom collection.", conditions = {} },
        { type = "note", text = "Work the mushroom fields near the base for early quest completions.", zone = "Zangarmarsh", x = 82.0, y = 52.0, conditions = {} },
        { type = "accept", questID = 9714, text = "Accept the Umbrafen tribe investigation.", zone = "Zangarmarsh", conditions = {} },
        { type = "complete", questID = 9714, text = "Head south to investigate the Umbrafen lost ones.", zone = "Zangarmarsh", x = 70.0, y = 80.0, conditions = {} },
        { type = "turnin", questID = 9714, text = "Report the Umbrafen situation.", zone = "Zangarmarsh", conditions = {} },
        { type = "note", text = "Visit the Cenarion Refuge in the center for neutral quests.", zone = "Zangarmarsh", x = 78.5, y = 63.0, conditions = {} },
        { type = "flightpath", text = "Get the Cenarion Refuge flight path.", zone = "Zangarmarsh", conditions = {} },
        { type = "accept", questID = 9747, text = "Take the warden's quest.", zone = "Zangarmarsh", conditions = {} },
        { type = "accept", questID = 9753, text = "Take the plant cataloging quest.", zone = "Zangarmarsh", conditions = {} },
        { type = "complete", questID = 9753, text = "Gather botanical samples from mushroom groves across the marsh.", zone = "Zangarmarsh", conditions = {} },
        { type = "turnin", questID = 9753, text = "Deliver the samples.", zone = "Zangarmarsh", conditions = {} },
        { type = "note", text = "Sabotage the naga pumps along Serpent Lake to the west.", zone = "Zangarmarsh", x = 50.0, y = 41.0, conditions = {} },
        { type = "note", text = "Complete Zabra'jin quests if Swamprat Post runs low on content.", zone = "Zangarmarsh", x = 30.5, y = 50.8, conditions = {} },
        { type = "note", text = "Visit Sporeggar in the northwest for faction quests and rewards.", zone = "Zangarmarsh", x = 19.0, y = 51.0, conditions = {} },
        { type = "note", text = "Run Slave Pens and Underbog dungeons for XP and reputation.", conditions = {} },
        { type = "level", targetLevel = 64, text = "Complete Zangarmarsh to level 64.", conditions = {} },
        { type = "note", text = "Head south to Terokkar Forest.", conditions = {} },
    },
})
