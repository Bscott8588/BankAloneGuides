--[[
    Bank Alone Guides - Horde 1-10: Eversong Woods
    SCS / Bank Alone Guides
    
    Starting zone for Blood Elves. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Horde_0110_EversongWoods", {
    title = "Horde 1-10: Eversong Woods",
    faction = "Horde",
    levelRange = {1, 10},
    category = "Leveling",
    nextGuide = "Horde_1020",
    steps = {
        { type = "accept", questID = 8325, text = "Speak with Magistrix Erona on Sunstrider Isle to begin reclaiming the area.", zone = "Eversong Woods", x = 38.3, y = 20.8, conditions = {} },
        { type = "kill", questID = 8325, text = "Defeat mana-warped creatures threatening the isle.", zone = "Eversong Woods", x = 39.0, y = 22.0, target = "Mana Wyrm", conditions = {} },
        { type = "turnin", questID = 8325, text = "Return to Magistrix Erona with the good news.", zone = "Eversong Woods", x = 38.3, y = 20.8, conditions = {} },
        { type = "accept", questID = 8326, text = "Accept the lynx collar gathering quest.", zone = "Eversong Woods", x = 38.3, y = 20.8, conditions = {} },
        { type = "kill", questID = 8326, text = "Hunt lynxes around Sunstrider Isle to collect their collars.", zone = "Eversong Woods", x = 37.0, y = 24.0, target = "Springpaw Lynx", conditions = {} },
        { type = "turnin", questID = 8326, text = "Turn in the collected lynx collars.", zone = "Eversong Woods", x = 38.3, y = 20.8, conditions = {} },
        { type = "accept", questID = 8327, text = "Accept the report delivery to Lanthan Perilon further in the woods.", zone = "Eversong Woods", x = 38.3, y = 20.8, conditions = {} },
        { type = "turnin", questID = 8327, text = "Deliver the report to Lanthan Perilon deeper in Eversong.", zone = "Eversong Woods", x = 37.5, y = 25.3, conditions = {} },
        { type = "accept", questID = 8330, text = "Accept the task to reduce the wretched elf threat in the area.", zone = "Eversong Woods", x = 37.5, y = 25.3, conditions = {} },
        { type = "kill", questID = 8330, text = "Fight the wretched elves in the ruins south of Sunstrider Isle.", zone = "Eversong Woods", x = 37.0, y = 30.0, target = "Wretched Urchin", conditions = {} },
        { type = "turnin", questID = 8330, text = "Report the wretched dealt with.", zone = "Eversong Woods", x = 37.5, y = 25.3, conditions = {} },
        { type = "note", text = "You should be level 4-5. Continue south toward Falconwing Square.", conditions = {} },
        { type = "goto", text = "Head south to Falconwing Square.", zone = "Eversong Woods", x = 48.1, y = 47.8, conditions = {} },
        { type = "note", text = "Set your hearthstone at the inn near Falconwing Square.", conditions = {} },
        { type = "note", text = "Pick up all quests: arcane patroller defeat, tender collection, and the dead scar clearing.", conditions = {} },
        { type = "note", text = "Work along the Dead Scar (the undead corridor running through the zone) for multiple quests.", conditions = {} },
        { type = "note", text = "Complete the quest chains at Fairbreeze Village to the south.", zone = "Eversong Woods", x = 44.0, y = 71.0, conditions = {} },
        { type = "note", text = "Clear the murloc camps along the western coast.", conditions = {} },
        { type = "level", targetLevel = 10, text = "Complete Eversong quests until level 10.", conditions = {} },
        { type = "note", text = "At level 10, visit Silvermoon City for class training, then continue into Ghostlands or travel to The Barrens.", conditions = {} },
    },
})
