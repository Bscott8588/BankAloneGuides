--[[
    Bank Alone Guides - Alliance 50-58
    SCS / Bank Alone Guides
    
    Burning Steppes, Western/Eastern Plaguelands, Un'Goro, Winterspring. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Alliance_5058", {
    title = "Alliance 50-58: Plaguelands & Beyond",
    faction = "Alliance",
    levelRange = {50, 58},
    category = "Leveling",
    nextGuide = "Alliance_5860_Hellfire",
    steps = {
        -- Un'Goro Crater (50-53)
        { type = "note", text = "Start at Un'Goro Crater. Fly to Gadgetzan and head west into the crater.", conditions = {} },
        { type = "goto", text = "Enter Un'Goro Crater from Tanaris and head to Marshal's Refuge.", zone = "Un'Goro Crater", x = 43.6, y = 7.5, conditions = {} },
        { type = "flightpath", text = "Get the Marshal's Refuge flight path.", zone = "Un'Goro Crater", conditions = {} },
        { type = "note", text = "Set your hearthstone at Marshal's Refuge.", conditions = {} },
        { type = "note", text = "Pick up all quests: dinosaur hunting, crystal collecting, soil sampling, and the Linken chain.", conditions = {} },
        { type = "note", text = "Work a circle around the crater: start north, go east for devilsaurs and pterrordaxes, south for oozes, west for the fire elementals.", conditions = {} },
        { type = "note", text = "Collect power crystals of all colors as you go - they're used for buffs at pylons.", conditions = {} },
        { type = "note", text = "Visit all three pylons (north, east, west) to unlock crystal combinations.", conditions = {} },
        { type = "note", text = "Complete the soil sampling quests across the zone's varied terrain.", conditions = {} },
        { type = "level", targetLevel = 53, text = "Finish Un'Goro quests to reach level 53.", conditions = {} },

        -- Burning Steppes (52-55)
        { type = "note", text = "Head to Burning Steppes. Fly to Lakeshire in Redridge and travel north.", conditions = {} },
        { type = "goto", text = "Enter Burning Steppes and find Morgan's Vigil in the southeast.", zone = "Burning Steppes", x = 84.3, y = 68.5, conditions = {} },
        { type = "flightpath", text = "Get the Morgan's Vigil flight path.", zone = "Burning Steppes", conditions = {} },
        { type = "note", text = "Pick up quests from Morgan's Vigil: orc encampment clearing, black drake hunting, and dark iron spy missions.", conditions = {} },
        { type = "note", text = "Clear the orc fortifications in the central and northern parts of the zone.", conditions = {} },
        { type = "note", text = "Work the dragonkin area in the northwest for valuable quest completions.", conditions = {} },
        { type = "note", text = "Complete the Onyxia attunement line if you haven't already.", conditions = {} },
        { type = "level", targetLevel = 55, text = "Work Burning Steppes to level 55.", conditions = {} },

        -- Western Plaguelands (53-57)
        { type = "note", text = "Head to Western Plaguelands. Fly to Southshore and travel north, or fly to Chillwind Camp if available.", conditions = {} },
        { type = "goto", text = "Travel to Chillwind Camp at the entrance to Western Plaguelands.", zone = "Western Plaguelands", x = 42.9, y = 85.1, conditions = {} },
        { type = "flightpath", text = "Get the Chillwind Camp flight path.", zone = "Western Plaguelands", conditions = {} },
        { type = "note", text = "Set your hearthstone at Chillwind Camp.", conditions = {} },
        { type = "note", text = "Pick up quests: undead clearing, cauldron missions, and Scholomance preparation.", conditions = {} },
        { type = "note", text = "Work the farm cauldrons spread across the zone - each has a quest chain to neutralize it.", conditions = {} },
        { type = "note", text = "Clear the undead camps at Andorhal in the center of the zone.", zone = "Western Plaguelands", x = 45.0, y = 55.0, conditions = {} },
        { type = "note", text = "Complete quests at Hearthglen observation and the Writhing Haunt.", conditions = {} },
        { type = "level", targetLevel = 57, text = "Work Western Plaguelands to level 57.", conditions = {} },

        -- Eastern Plaguelands (55-58)
        { type = "note", text = "Push into Eastern Plaguelands for the final stretch to 58.", conditions = {} },
        { type = "goto", text = "Enter Eastern Plaguelands and head to Light's Hope Chapel.", zone = "Eastern Plaguelands", x = 81.6, y = 59.3, conditions = {} },
        { type = "flightpath", text = "Get the Light's Hope Chapel flight path.", zone = "Eastern Plaguelands", conditions = {} },
        { type = "note", text = "Pick up quests: Argent Dawn tasks, undead elimination, and plagued wildlife clearing.", conditions = {} },
        { type = "note", text = "Work the western side near Darrowshire and the Undercroft.", conditions = {} },
        { type = "note", text = "Complete Terrordale and Tyr's Hand quests as you're able.", conditions = {} },
        { type = "level", targetLevel = 58, text = "Reach level 58. You can now enter Outland!", conditions = {} },

        -- Winterspring/Silithus Alternative
        { type = "note", text = "If you need more XP, Winterspring and Silithus offer additional 53-60 content.", conditions = {} },

        { type = "note", text = "At level 58, travel to the Blasted Lands and enter the Dark Portal to begin your Outland adventure!", conditions = {} },
    },
})
