--[[
    Bank Alone Guides - Alliance 58-60: Hellfire Peninsula
    SCS / Bank Alone Guides
    
    Outland entry zone. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Alliance_5860_Hellfire", {
    title = "Alliance 58-62: Hellfire Peninsula",
    faction = "Alliance",
    levelRange = {58, 62},
    category = "Leveling",
    nextGuide = "Alliance_6062_Zangarmarsh",
    steps = {
        { type = "note", text = "Travel to the Blasted Lands and enter the Dark Portal. You'll emerge on the Stair of Destiny.", conditions = {} },
        { type = "goto", text = "Enter the Dark Portal in the Blasted Lands.", zone = "Blasted Lands", x = 58.0, y = 58.0, conditions = {} },
        { type = "accept", questID = 10119, text = "Accept the quest from the Alliance commander at the portal exit.", zone = "Hellfire Peninsula", x = 87.3, y = 50.7, conditions = {} },
        { type = "turnin", questID = 10119, text = "Report to the forward Alliance camp on the Hellfire side.", zone = "Hellfire Peninsula", x = 87.3, y = 50.7, conditions = {} },
        { type = "accept", questID = 10121, text = "Continue the chain toward Honor Hold.", zone = "Hellfire Peninsula", x = 87.3, y = 50.7, conditions = {} },
        { type = "goto", text = "Head west along the road to Honor Hold, the Alliance base.", zone = "Hellfire Peninsula", x = 54.7, y = 62.4, conditions = {} },
        { type = "flightpath", text = "Get the Honor Hold flight path.", zone = "Hellfire Peninsula", conditions = {} },
        { type = "note", text = "Set your hearthstone at the Honor Hold inn.", conditions = {} },
        { type = "turnin", questID = 10121, text = "Turn in the arrival quest at Honor Hold.", zone = "Hellfire Peninsula", x = 54.7, y = 62.4, conditions = {} },
        { type = "note", text = "Pick up all available quests at Honor Hold. There are many NPCs with tasks.", conditions = {} },
        { type = "accept", questID = 9752, text = "Accept the task to free enslaved workers from the fel orc mines.", zone = "Hellfire Peninsula", conditions = {} },
        { type = "note", text = "Work the fel orc camps northeast of Honor Hold for multiple quest objectives.", zone = "Hellfire Peninsula", x = 60.0, y = 52.0, conditions = {} },
        { type = "complete", questID = 9752, text = "Free the captives in the fel orc camps by defeating their taskmasters.", zone = "Hellfire Peninsula", x = 60.0, y = 52.0, conditions = {} },
        { type = "turnin", questID = 9752, text = "Return to Honor Hold with news of the freed workers.", zone = "Hellfire Peninsula", x = 54.7, y = 62.4, conditions = {} },
        { type = "accept", questID = 10289, text = "Take the quest to gather bonechewer blood from the orc encampments.", zone = "Hellfire Peninsula", conditions = {} },
        { type = "kill", questID = 10289, text = "Defeat Bonechewer orcs in the southeastern camps.", zone = "Hellfire Peninsula", x = 66.0, y = 70.0, target = "Bonechewer Orc", conditions = {} },
        { type = "turnin", questID = 10289, text = "Return the blood samples to the quest giver.", zone = "Hellfire Peninsula", conditions = {} },
        { type = "note", text = "Work the quests at the Temple of Telhamat to the northwest.", zone = "Hellfire Peninsula", x = 23.4, y = 36.5, conditions = {} },
        { type = "flightpath", text = "Get the Temple of Telhamat flight path.", zone = "Hellfire Peninsula", conditions = {} },
        { type = "note", text = "Complete the draenei quest chain at the temple: sedai's remains, mag'har scouts, and arzeth the merciless.", conditions = {} },
        { type = "note", text = "Don't forget to pick up the Pools of Aggonar and Mag'har Prisoners quests.", conditions = {} },
        { type = "accept", questID = 10078, text = "Take the Path of Anguish quest leading to the Expedition Armory.", zone = "Hellfire Peninsula", conditions = {} },
        { type = "complete", questID = 10078, text = "Fight through fel orc territory to reach the strategic overlook.", zone = "Hellfire Peninsula", x = 71.0, y = 63.0, conditions = {} },
        { type = "turnin", questID = 10078, text = "Report your findings at the overlook.", zone = "Hellfire Peninsula", conditions = {} },
        { type = "note", text = "Run Hellfire Ramparts and Blood Furnace dungeons if you have a group. Great XP and loot.", conditions = {} },
        { type = "note", text = "Complete the quest chains for the Hellfire Citadel dungeon quests.", conditions = {} },
        { type = "level", targetLevel = 62, text = "Finish Hellfire Peninsula quests to reach level 62.", conditions = {} },
        { type = "note", text = "Head west to Zangarmarsh when you're ready for level 60-64 content.", conditions = {} },
    },
})
