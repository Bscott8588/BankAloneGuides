--[[
    Bank Alone Guides - Horde 62-66: Terokkar Forest & Nagrand
    SCS / Bank Alone Guides
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Horde_6264_Terokkar", {
    title = "Horde 62-66: Terokkar & Nagrand",
    faction = "Horde",
    levelRange = {62, 66},
    category = "Leveling",
    nextGuide = "Horde_6466_BladesEdge",
    steps = {
        -- Terokkar Forest (62-65)
        { type = "note", text = "Enter Terokkar Forest from Zangarmarsh heading south.", conditions = {} },
        { type = "note", text = "Visit Shattrath City and set your hearthstone there if you haven't already.", zone = "Shattrath City", conditions = {} },
        { type = "note", text = "Choose Aldor or Scryer faction by speaking with the tour guide in Shattrath.", conditions = {} },
        { type = "goto", text = "Head to Stonebreaker Hold, the Horde outpost in Terokkar.", zone = "Terokkar Forest", x = 49.0, y = 45.2, conditions = {} },
        { type = "flightpath", text = "Get the Stonebreaker Hold flight path.", zone = "Terokkar Forest", conditions = {} },
        { type = "note", text = "Pick up all quests: arakkoa investigation, bone waste patrol, infested protectors, and firewing point.", conditions = {} },
        { type = "accept", questID = 9998, text = "Accept the quest to cure infested protectors.", zone = "Terokkar Forest", conditions = {} },
        { type = "complete", questID = 9998, text = "Find and cure the infested ancient protectors in the forest.", zone = "Terokkar Forest", x = 44.0, y = 46.0, conditions = {} },
        { type = "turnin", questID = 9998, text = "Report the protectors saved.", zone = "Terokkar Forest", conditions = {} },
        { type = "note", text = "Work the Bone Wastes area in the south for extensive quest chains.", zone = "Terokkar Forest", x = 39.0, y = 72.0, conditions = {} },
        { type = "accept", questID = 10039, text = "Take the quest to defeat Torgos the arakkoa menace.", zone = "Terokkar Forest", conditions = {} },
        { type = "kill", questID = 10039, text = "Deal with the Torgos threat at the arakkoa areas.", zone = "Terokkar Forest", x = 31.0, y = 76.0, target = "Torgos", conditions = {} },
        { type = "turnin", questID = 10039, text = "Collect the reward.", zone = "Terokkar Forest", conditions = {} },
        { type = "note", text = "Complete the Firewing Point assault quests northeast of camp.", zone = "Terokkar Forest", x = 73.0, y = 36.0, conditions = {} },
        { type = "note", text = "Run Mana-Tombs and Auchenai Crypts dungeons.", conditions = {} },
        { type = "level", targetLevel = 64, text = "Finish Terokkar quests to 64.", conditions = {} },

        -- Nagrand (64-66)
        { type = "note", text = "Head west to Nagrand.", conditions = {} },
        { type = "goto", text = "Travel to Garadar, the Horde base in Nagrand.", zone = "Nagrand", x = 55.5, y = 37.2, conditions = {} },
        { type = "flightpath", text = "Get the Garadar flight path.", zone = "Nagrand", conditions = {} },
        { type = "note", text = "Pick up all quests: clefthoof hunting, ogre clearing, Mag'har heritage, and elemental problems.", conditions = {} },
        { type = "note", text = "Visit Nesingwary Safari for the hunting chain.", zone = "Nagrand", x = 71.5, y = 40.5, conditions = {} },
        { type = "note", text = "Complete the talbuk, clefthoof, and windroc hunting chains.", conditions = {} },
        { type = "accept", questID = 9861, text = "Investigate the Burning Blade in Nagrand.", zone = "Nagrand", conditions = {} },
        { type = "complete", questID = 9861, text = "Scout the Burning Blade camp areas.", zone = "Nagrand", x = 30.0, y = 22.0, conditions = {} },
        { type = "turnin", questID = 9861, text = "Report the findings.", zone = "Nagrand", conditions = {} },
        { type = "note", text = "Complete the Ring of Blood with a group for an amazing weapon.", zone = "Nagrand", x = 43.5, y = 20.6, conditions = {} },
        { type = "note", text = "Work the Throne of the Elements quests.", zone = "Nagrand", x = 60.0, y = 22.0, conditions = {} },
        { type = "note", text = "Complete the Garadar-specific questlines about the Mag'har ancestors.", conditions = {} },
        { type = "level", targetLevel = 66, text = "Finish Nagrand to level 66.", conditions = {} },
        { type = "note", text = "Head north to Blade's Edge Mountains.", conditions = {} },
    },
})
