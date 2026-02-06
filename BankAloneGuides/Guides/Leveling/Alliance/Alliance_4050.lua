--[[
    Bank Alone Guides - Alliance 40-50
    SCS / Bank Alone Guides
    
    Tanaris, Feralas, The Hinterlands, Searing Gorge. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Alliance_4050", {
    title = "Alliance 40-50: Tanaris & Feralas",
    faction = "Alliance",
    levelRange = {40, 50},
    category = "Leveling",
    nextGuide = "Alliance_5058",
    steps = {
        -- Tanaris (40-45)
        { type = "note", text = "Head to Tanaris. Fly to Theramore in Dustwallow Marsh and travel south, or directly if you have the flight path.", conditions = {} },
        { type = "goto", text = "Travel to Gadgetzan, the neutral goblin town in Tanaris.", zone = "Tanaris", x = 51.6, y = 28.7, conditions = {} },
        { type = "flightpath", text = "Grab the Gadgetzan flight path.", zone = "Tanaris", conditions = {} },
        { type = "note", text = "Set your hearthstone in Gadgetzan.", conditions = {} },
        { type = "note", text = "Pick up all quests in Gadgetzan: wastewander bandit clearing, water pouch collection, pirate tasks along the coast.", conditions = {} },
        { type = "note", text = "Head southeast to clear wastewander camps and collect water pouches.", zone = "Tanaris", x = 63.0, y = 37.0, conditions = {} },
        { type = "note", text = "Visit the Steamwheedle Port in the northeast for pirate-related quests.", zone = "Tanaris", x = 67.0, y = 23.0, conditions = {} },
        { type = "note", text = "Complete the Thistleshrub Valley quests in the southwest.", zone = "Tanaris", x = 31.0, y = 57.0, conditions = {} },
        { type = "note", text = "Run Zul'Farrak dungeon with a group if available - excellent XP and loot for this level.", zone = "Tanaris", conditions = {} },
        { type = "level", targetLevel = 44, text = "Work Tanaris quests until level 44.", conditions = {} },

        -- Feralas (44-47)
        { type = "note", text = "Head to Feralas. Fly from Gadgetzan or travel overland through Thousand Needles.", conditions = {} },
        { type = "goto", text = "Travel to the Feathermoon Stronghold in Feralas.", zone = "Feralas", x = 30.5, y = 43.2, conditions = {} },
        { type = "flightpath", text = "Grab the Feathermoon Stronghold flight path.", zone = "Feralas", conditions = {} },
        { type = "note", text = "Set your hearthstone at Feathermoon Stronghold.", conditions = {} },
        { type = "note", text = "Pick up quests: yeti cave clearing, sprite investigations, ogre compound tasks, and naga on the coast.", conditions = {} },
        { type = "note", text = "Clear the yeti cave north of camp for materials and quest completions.", zone = "Feralas", x = 56.0, y = 52.0, conditions = {} },
        { type = "note", text = "Work the ogre camps on the eastern side of the zone.", zone = "Feralas", x = 60.0, y = 47.0, conditions = {} },
        { type = "note", text = "Complete Ruins of Isildien quests in the southeast corner.", zone = "Feralas", x = 62.0, y = 64.0, conditions = {} },
        { type = "level", targetLevel = 47, text = "Finish Feralas quests to reach level 47.", conditions = {} },

        -- The Hinterlands (47-50)
        { type = "note", text = "Head east to The Hinterlands. Fly to Aerie Peak.", conditions = {} },
        { type = "goto", text = "Travel to Aerie Peak in The Hinterlands.", zone = "The Hinterlands", x = 14.3, y = 44.3, conditions = {} },
        { type = "flightpath", text = "Get the Aerie Peak flight path.", zone = "The Hinterlands", conditions = {} },
        { type = "note", text = "Set your hearthstone at Aerie Peak.", conditions = {} },
        { type = "note", text = "Pick up quests: troll temple clearing, owl tasks, and Wildhammer clan missions.", conditions = {} },
        { type = "note", text = "Work the witherbark troll area to the south.", zone = "The Hinterlands", x = 35.0, y = 72.0, conditions = {} },
        { type = "note", text = "Clear the Vilebranch troll city of Jintha'Alor in the southeast - bring a group for the elites.", zone = "The Hinterlands", x = 63.0, y = 75.0, conditions = {} },
        { type = "note", text = "Complete the quel'danil lodge quests and altar investigation tasks.", conditions = {} },
        { type = "level", targetLevel = 50, text = "Finish Hinterlands quests and any remaining tasks to reach level 50.", conditions = {} },

        -- Searing Gorge Alternative
        { type = "note", text = "If you run out of quests, Searing Gorge has solid quest density for 45-50.", conditions = {} },
        { type = "note", text = "At level 50, you're ready for the endgame Azeroth zones. Head to Burning Steppes or Western Plaguelands.", conditions = {} },
    },
})
