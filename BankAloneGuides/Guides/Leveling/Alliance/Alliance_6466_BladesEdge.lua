--[[
    Bank Alone Guides - Alliance 64-68: Blade's Edge Mountains
    SCS / Bank Alone Guides
    
    Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Alliance_6466_BladesEdge", {
    title = "Alliance 64-68: Blade's Edge Mountains",
    faction = "Alliance",
    levelRange = {64, 68},
    category = "Leveling",
    nextGuide = "Alliance_6670_Netherstorm",
    steps = {
        { type = "goto", text = "Enter Blade's Edge Mountains from Zangarmarsh heading north.", zone = "Blade's Edge Mountains", x = 37.0, y = 77.0, conditions = {} },
        { type = "goto", text = "Head to Sylvanaar, the Alliance base in the southern part of the zone.", zone = "Blade's Edge Mountains", x = 37.2, y = 63.8, conditions = {} },
        { type = "flightpath", text = "Get the Sylvanaar flight path.", zone = "Blade's Edge Mountains", conditions = {} },
        { type = "note", text = "Set your hearthstone at Sylvanaar.", conditions = {} },
        { type = "note", text = "Pick up all quests: ravager clearing, ogre disruption, and botanical studies.", conditions = {} },
        { type = "accept", questID = 10488, text = "Accept the ravager clearing quest.", zone = "Blade's Edge Mountains", conditions = {} },
        { type = "kill", questID = 10488, text = "Clear the ravagers from the mountain passes south of Sylvanaar.", zone = "Blade's Edge Mountains", x = 38.0, y = 72.0, target = "Ravager", conditions = {} },
        { type = "turnin", questID = 10488, text = "Report the ravager threat dealt with.", zone = "Blade's Edge Mountains", conditions = {} },
        { type = "note", text = "Work the Living Grove quest chain involving the tree protectors.", zone = "Blade's Edge Mountains", x = 36.0, y = 55.0, conditions = {} },
        { type = "note", text = "Head north to Toshley's Station, a gnome-run outpost.", zone = "Blade's Edge Mountains", x = 61.0, y = 39.0, conditions = {} },
        { type = "flightpath", text = "Get the Toshley's Station flight path.", zone = "Blade's Edge Mountains", conditions = {} },
        { type = "note", text = "Pick up quests at Toshley's Station: apexis device experiments and ridge surveying.", conditions = {} },
        { type = "accept", questID = 10518, text = "Accept the ogre infiltration quest.", zone = "Blade's Edge Mountains", conditions = {} },
        { type = "kill", questID = 10518, text = "Infiltrate the ogre settlements in the Bloodmaul Ravine area.", zone = "Blade's Edge Mountains", x = 53.0, y = 53.0, target = "Bloodmaul Ogre", conditions = {} },
        { type = "turnin", questID = 10518, text = "Return with intelligence on the ogres.", zone = "Blade's Edge Mountains", conditions = {} },
        { type = "note", text = "Complete the Ogri'la quest chain when you have a group - the Simon Says-style game and bombing runs.", conditions = {} },
        { type = "note", text = "Work the northern caves and Death's Door area for quest chains.", zone = "Blade's Edge Mountains", x = 64.0, y = 16.0, conditions = {} },
        { type = "note", text = "Don't miss the Evergrove quests in the northeast - they offer Cenarion Expedition reputation.", zone = "Blade's Edge Mountains", x = 62.0, y = 39.0, conditions = {} },
        { type = "level", targetLevel = 68, text = "Complete Blade's Edge quests to reach level 68.", conditions = {} },
        { type = "note", text = "Head east to Netherstorm or south to Shadowmoon Valley for level 67-70 content.", conditions = {} },
    },
})
