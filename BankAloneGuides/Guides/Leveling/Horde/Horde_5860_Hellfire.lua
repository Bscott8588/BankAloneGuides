--[[
    Bank Alone Guides - Horde 58-62: Hellfire Peninsula
    SCS / Bank Alone Guides
    
    Outland entry. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Horde_5860_Hellfire", {
    title = "Horde 58-62: Hellfire Peninsula",
    faction = "Horde",
    levelRange = {58, 62},
    category = "Leveling",
    nextGuide = "Horde_6062_Zangarmarsh",
    steps = {
        { type = "note", text = "Travel to the Blasted Lands and step through the Dark Portal.", conditions = {} },
        { type = "goto", text = "Enter the Dark Portal from the Blasted Lands.", zone = "Blasted Lands", x = 58.0, y = 58.0, conditions = {} },
        { type = "accept", questID = 10120, text = "Accept the quest from the Horde commander at the portal exit.", zone = "Hellfire Peninsula", x = 87.3, y = 48.2, conditions = {} },
        { type = "turnin", questID = 10120, text = "Report to the Horde forward camp.", zone = "Hellfire Peninsula", x = 87.3, y = 48.2, conditions = {} },
        { type = "note", text = "Follow the chain to reach Thrallmar, the Horde base in Hellfire.", conditions = {} },
        { type = "goto", text = "Head west to Thrallmar.", zone = "Hellfire Peninsula", x = 56.2, y = 36.2, conditions = {} },
        { type = "flightpath", text = "Get the Thrallmar flight path.", zone = "Hellfire Peninsula", conditions = {} },
        { type = "note", text = "Set your hearthstone at the Thrallmar inn.", conditions = {} },
        { type = "note", text = "Pick up all available quests at Thrallmar. Multiple NPCs offer tasks.", conditions = {} },
        { type = "accept", questID = 9607, text = "Accept the helboar meat collection quest for the troops.", zone = "Hellfire Peninsula", conditions = {} },
        { type = "kill", questID = 9607, text = "Hunt helboars around the Thrallmar area for their meat.", zone = "Hellfire Peninsula", x = 55.0, y = 40.0, target = "Helboar", conditions = {} },
        { type = "turnin", questID = 9607, text = "Return the meat supplies.", zone = "Hellfire Peninsula", conditions = {} },
        { type = "accept", questID = 10289, text = "Take the Bonechewer blood sample quest.", zone = "Hellfire Peninsula", conditions = {} },
        { type = "kill", questID = 10289, text = "Defeat Bonechewer orcs in the southeastern camps to collect blood.", zone = "Hellfire Peninsula", x = 66.0, y = 70.0, target = "Bonechewer Orc", conditions = {} },
        { type = "turnin", questID = 10289, text = "Return the samples.", zone = "Hellfire Peninsula", conditions = {} },
        { type = "note", text = "Work the Falcon Watch quest hub in the southwest for additional chains.", zone = "Hellfire Peninsula", x = 27.8, y = 60.0, conditions = {} },
        { type = "flightpath", text = "Get the Falcon Watch flight path.", zone = "Hellfire Peninsula", conditions = {} },
        { type = "note", text = "Complete the Mag'har quest chains at the outpost northeast of Thrallmar.", conditions = {} },
        { type = "accept", questID = 10078, text = "Take the Path of Anguish quest.", zone = "Hellfire Peninsula", conditions = {} },
        { type = "complete", questID = 10078, text = "Push through the fel orc territory.", zone = "Hellfire Peninsula", x = 71.0, y = 63.0, conditions = {} },
        { type = "turnin", questID = 10078, text = "Report your findings.", zone = "Hellfire Peninsula", conditions = {} },
        { type = "note", text = "Complete the Void Ridge quests west of Falcon Watch.", zone = "Hellfire Peninsula", x = 16.0, y = 56.0, conditions = {} },
        { type = "note", text = "Run Hellfire Ramparts and Blood Furnace dungeons for great XP and loot.", conditions = {} },
        { type = "level", targetLevel = 62, text = "Finish Hellfire quests to level 62.", conditions = {} },
        { type = "note", text = "Head west to Zangarmarsh.", conditions = {} },
    },
})
