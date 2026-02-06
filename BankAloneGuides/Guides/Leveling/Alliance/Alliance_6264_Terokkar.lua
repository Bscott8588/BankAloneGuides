--[[
    Bank Alone Guides - Alliance 62-66: Terokkar Forest
    SCS / Bank Alone Guides
    
    Includes Nagrand content for the level bracket. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Alliance_6264_Terokkar", {
    title = "Alliance 62-66: Terokkar & Nagrand",
    faction = "Alliance",
    levelRange = {62, 66},
    category = "Leveling",
    nextGuide = "Alliance_6466_BladesEdge",
    steps = {
        -- Terokkar Forest (62-65)
        { type = "goto", text = "Enter Terokkar Forest from Zangarmarsh heading south.", zone = "Terokkar Forest", x = 44.0, y = 26.0, conditions = {} },
        { type = "note", text = "Visit Shattrath City first to set your hearthstone there - it's the central hub of Outland.", zone = "Shattrath City", conditions = {} },
        { type = "goto", text = "Enter Shattrath City in the northwest corner of Terokkar.", zone = "Shattrath City", x = 52.0, y = 53.0, conditions = {} },
        { type = "note", text = "Choose between Aldor and Scryer factions (speak with the tour guide for info).", conditions = {} },
        { type = "note", text = "Set your hearthstone in Shattrath City - you'll use it heavily going forward.", conditions = {} },
        { type = "goto", text = "Head to Allerian Stronghold, the Alliance outpost in Terokkar.", zone = "Terokkar Forest", x = 57.5, y = 53.3, conditions = {} },
        { type = "flightpath", text = "Get the Allerian Stronghold flight path.", zone = "Terokkar Forest", conditions = {} },
        { type = "note", text = "Pick up all quests: arakkoa investigation, bone waste exploration, infested protectors, and firewing point assault.", conditions = {} },
        { type = "accept", questID = 9998, text = "Accept the quest to heal the infested protectors in the forest.", zone = "Terokkar Forest", conditions = {} },
        { type = "complete", questID = 9998, text = "Find and heal the infested ancient protectors wandering the forest.", zone = "Terokkar Forest", x = 44.0, y = 46.0, conditions = {} },
        { type = "turnin", questID = 9998, text = "Report the ancient protectors saved.", zone = "Terokkar Forest", conditions = {} },
        { type = "note", text = "Work the Bone Wastes in the southern part of the zone for extensive quest chains.", zone = "Terokkar Forest", x = 39.0, y = 72.0, conditions = {} },
        { type = "accept", questID = 10039, text = "Take the quest to deal with the arakkoa threat Torgos.", zone = "Terokkar Forest", conditions = {} },
        { type = "kill", questID = 10039, text = "Use the provided item to summon and defeat Torgos at the arakkoa areas.", zone = "Terokkar Forest", x = 31.0, y = 76.0, target = "Torgos", conditions = {} },
        { type = "turnin", questID = 10039, text = "Collect your reward for defeating the arakkoa leader.", zone = "Terokkar Forest", conditions = {} },
        { type = "note", text = "Complete the Firewing Point quest chain northeast of the stronghold.", zone = "Terokkar Forest", x = 73.0, y = 36.0, conditions = {} },
        { type = "note", text = "Run Mana-Tombs and Auchenai Crypts for dungeon quests and reputation.", conditions = {} },
        { type = "level", targetLevel = 64, text = "Complete Terokkar Forest quests to reach level 64.", conditions = {} },

        -- Nagrand (64-66)
        { type = "note", text = "Head west from Terokkar to enter Nagrand.", conditions = {} },
        { type = "goto", text = "Travel to Telaar, the Alliance base in Nagrand.", zone = "Nagrand", x = 54.2, y = 75.5, conditions = {} },
        { type = "flightpath", text = "Get the Telaar flight path.", zone = "Nagrand", conditions = {} },
        { type = "note", text = "Set your hearthstone at Telaar or keep it in Shattrath.", conditions = {} },
        { type = "note", text = "Pick up all Nagrand quests: clefthoof hunting, ogre clearing, elemental problems, and the Nesingwary redux.", conditions = {} },
        { type = "note", text = "Visit Nesingwary Safari near the center for the hunting quest chains.", zone = "Nagrand", x = 71.5, y = 40.5, conditions = {} },
        { type = "note", text = "Work the Nesingwary hunting chains: talbuks, clefthoofs, and windrocs.", conditions = {} },
        { type = "accept", questID = 9861, text = "Investigate the Burning Blade presence in Nagrand.", zone = "Nagrand", conditions = {} },
        { type = "complete", questID = 9861, text = "Scout the Burning Blade camps in the north.", zone = "Nagrand", x = 30.0, y = 22.0, conditions = {} },
        { type = "turnin", questID = 9861, text = "Report the Burning Blade activity.", zone = "Nagrand", conditions = {} },
        { type = "accept", questID = 9918, text = "Pick up the Ring of Blood quest chain at Laughing Skull Ruins.", zone = "Nagrand", x = 43.5, y = 20.6, conditions = {} },
        { type = "note", text = "Complete the Ring of Blood 6-fight chain with a group. Excellent XP and a great weapon reward!", zone = "Nagrand", x = 43.5, y = 20.6, conditions = {} },
        { type = "note", text = "Complete the elemental throne quests in the central highlands.", zone = "Nagrand", x = 60.0, y = 54.0, conditions = {} },
        { type = "note", text = "Finish the Consortium quests east of Nagrand for reputation.", conditions = {} },
        { type = "level", targetLevel = 66, text = "Complete Nagrand to reach level 66.", conditions = {} },
        { type = "note", text = "Head north to Blade's Edge Mountains for the next zone.", conditions = {} },
    },
})
