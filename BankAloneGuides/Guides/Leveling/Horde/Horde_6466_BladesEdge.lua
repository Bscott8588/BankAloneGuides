--[[
    Bank Alone Guides - Horde 64-68: Blade's Edge Mountains
    SCS / Bank Alone Guides
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Horde_6466_BladesEdge", {
    title = "Horde 64-68: Blade's Edge Mountains",
    faction = "Horde",
    levelRange = {64, 68},
    category = "Leveling",
    nextGuide = "Horde_6670_Netherstorm",
    steps = {
        { type = "goto", text = "Enter Blade's Edge from Zangarmarsh heading north.", zone = "Blade's Edge Mountains", x = 37.0, y = 77.0, conditions = {} },
        { type = "goto", text = "Head to Thunderlord Stronghold, the Horde base.", zone = "Blade's Edge Mountains", x = 52.0, y = 58.8, conditions = {} },
        { type = "flightpath", text = "Get the Thunderlord Stronghold flight path.", zone = "Blade's Edge Mountains", conditions = {} },
        { type = "note", text = "Set your hearthstone at Thunderlord Stronghold.", conditions = {} },
        { type = "note", text = "Pick up quests: ravager clearing, ogre disruption, and wildlife hunting.", conditions = {} },
        { type = "accept", questID = 10488, text = "Accept the ravager clearing quest.", zone = "Blade's Edge Mountains", conditions = {} },
        { type = "kill", questID = 10488, text = "Clear ravagers from the mountain passes.", zone = "Blade's Edge Mountains", x = 52.0, y = 68.0, target = "Ravager", conditions = {} },
        { type = "turnin", questID = 10488, text = "Report the ravager threat handled.", zone = "Blade's Edge Mountains", conditions = {} },
        { type = "accept", questID = 10518, text = "Take the ogre infiltration quest.", zone = "Blade's Edge Mountains", conditions = {} },
        { type = "kill", questID = 10518, text = "Infiltrate the Bloodmaul ogre settlements.", zone = "Blade's Edge Mountains", x = 53.0, y = 53.0, target = "Bloodmaul Ogre", conditions = {} },
        { type = "turnin", questID = 10518, text = "Return with intelligence.", zone = "Blade's Edge Mountains", conditions = {} },
        { type = "note", text = "Work the Mok'Nathal Village quests (Rexxar's quest chain) in the southeast.", zone = "Blade's Edge Mountains", x = 76.0, y = 60.0, conditions = {} },
        { type = "note", text = "Complete the Ogri'la quest chain for daily quests and rewards.", conditions = {} },
        { type = "note", text = "Work Death's Door and the northern caves.", zone = "Blade's Edge Mountains", x = 64.0, y = 16.0, conditions = {} },
        { type = "note", text = "Complete the Evergrove quests in the northeast.", zone = "Blade's Edge Mountains", x = 62.0, y = 39.0, conditions = {} },
        { type = "level", targetLevel = 68, text = "Complete Blade's Edge to level 68.", conditions = {} },
        { type = "note", text = "Head to Netherstorm or Shadowmoon Valley for level 67-70.", conditions = {} },
    },
})
