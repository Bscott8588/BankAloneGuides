--[[
    Bank Alone Guides - Horde 40-50
    SCS / Bank Alone Guides
    
    Tanaris, Feralas, Hinterlands, Searing Gorge. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Horde_4050", {
    title = "Horde 40-50: Tanaris & Feralas",
    faction = "Horde",
    levelRange = {40, 50},
    category = "Leveling",
    nextGuide = "Horde_5058",
    steps = {
        -- Tanaris (40-45)
        { type = "goto", text = "Travel to Gadgetzan in Tanaris. Fly from Camp Taurajo or Freewind Post.", zone = "Tanaris", x = 51.6, y = 28.7, conditions = {} },
        { type = "flightpath", text = "Get the Gadgetzan flight path.", zone = "Tanaris", conditions = {} },
        { type = "note", text = "Set your hearthstone in Gadgetzan.", conditions = {} },
        { type = "note", text = "Pick up all Gadgetzan quests: wastewander bandits, water pouch collection, pirate camps, and sea creature tasks.", conditions = {} },
        { type = "note", text = "Head southeast to clear wastewander camps for multiple quest objectives.", zone = "Tanaris", x = 63.0, y = 37.0, conditions = {} },
        { type = "note", text = "Visit Steamwheedle Port for pirate quest chains.", zone = "Tanaris", x = 67.0, y = 23.0, conditions = {} },
        { type = "note", text = "Complete the Thistleshrub Valley quests in the southwest corner.", zone = "Tanaris", x = 31.0, y = 57.0, conditions = {} },
        { type = "note", text = "Run Zul'Farrak dungeon with a group - excellent XP and multiple dungeon quests.", conditions = {} },
        { type = "note", text = "Work the insect hive in the south for silithid-related quests.", zone = "Tanaris", x = 48.0, y = 64.0, conditions = {} },
        { type = "level", targetLevel = 44, text = "Complete Tanaris quests to level 44.", conditions = {} },

        -- Feralas (44-47)
        { type = "note", text = "Head to Feralas. Travel west from Thousand Needles or fly to Camp Mojache.", conditions = {} },
        { type = "goto", text = "Arrive at Camp Mojache in Feralas.", zone = "Feralas", x = 76.0, y = 44.0, conditions = {} },
        { type = "flightpath", text = "Get the Camp Mojache flight path.", zone = "Feralas", conditions = {} },
        { type = "note", text = "Set your hearthstone at Camp Mojache.", conditions = {} },
        { type = "note", text = "Pick up quests: yeti clearing, ogre compound, gordunni outpost, and wilderness patrol.", conditions = {} },
        { type = "note", text = "Work the Gordunni ogre camps north of camp.", zone = "Feralas", x = 74.0, y = 32.0, conditions = {} },
        { type = "note", text = "Clear the yeti cave southeast of camp.", zone = "Feralas", x = 56.0, y = 52.0, conditions = {} },
        { type = "note", text = "Complete the woodpaw gnoll quests and the grimtotem investigation.", conditions = {} },
        { type = "note", text = "Head to the Ruins of Isildien in the southeast for additional quests.", zone = "Feralas", x = 62.0, y = 64.0, conditions = {} },
        { type = "level", targetLevel = 47, text = "Complete Feralas quests to level 47.", conditions = {} },

        -- The Hinterlands (47-50)
        { type = "note", text = "Head to The Hinterlands. Fly to Revantusk Village.", conditions = {} },
        { type = "goto", text = "Travel to Revantusk Village on the eastern coast of The Hinterlands.", zone = "The Hinterlands", x = 77.5, y = 81.5, conditions = {} },
        { type = "flightpath", text = "Get the Revantusk Village flight path.", zone = "The Hinterlands", conditions = {} },
        { type = "note", text = "Pick up quests from the Revantusk trolls: vilebranch clearing, owl killing, and alliance disruption.", conditions = {} },
        { type = "note", text = "Work the vilebranch troll areas in the western mountains.", zone = "The Hinterlands", x = 50.0, y = 60.0, conditions = {} },
        { type = "note", text = "Complete Jintha'Alor elite area with a group if possible.", zone = "The Hinterlands", x = 63.0, y = 75.0, conditions = {} },
        { type = "note", text = "Clear the Agol'watha ogre cave for quest items.", conditions = {} },
        { type = "level", targetLevel = 50, text = "Finish Hinterlands to reach level 50.", conditions = {} },

        -- Searing Gorge supplement
        { type = "note", text = "If you need additional quests, Searing Gorge offers solid 45-50 content.", conditions = {} },
        { type = "note", text = "At level 50, proceed to Burning Steppes or Western Plaguelands.", conditions = {} },
    },
})
