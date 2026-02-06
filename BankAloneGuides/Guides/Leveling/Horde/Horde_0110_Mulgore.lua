--[[
    Bank Alone Guides - Horde 1-10: Mulgore
    SCS / Bank Alone Guides
    
    Starting zone for Tauren. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Horde_0110_Mulgore", {
    title = "Horde 1-10: Mulgore",
    faction = "Horde",
    levelRange = {1, 10},
    category = "Leveling",
    nextGuide = "Horde_1020",
    steps = {
        { type = "accept", questID = 747, text = "Speak with Grull Hawkwind at Camp Narache and accept the hunting task.", zone = "Mulgore", x = 44.9, y = 77.1, conditions = {} },
        { type = "accept", questID = 745, text = "Also accept the message delivery from Chief Hawkwind.", zone = "Mulgore", x = 44.5, y = 76.2, conditions = {} },
        { type = "kill", questID = 747, text = "Hunt plainstriders on the mesa to gather their feathers.", zone = "Mulgore", x = 45.0, y = 74.0, target = "Plainstrider", conditions = {} },
        { type = "turnin", questID = 747, text = "Return the feathers to Grull.", zone = "Mulgore", x = 44.9, y = 77.1, conditions = {} },
        { type = "turnin", questID = 745, text = "Deliver the message to the elder at the bottom of the mesa.", zone = "Mulgore", x = 44.5, y = 76.2, conditions = {} },
        { type = "accept", questID = 746, text = "Continue the message chain to Bloodhoof Village.", zone = "Mulgore", x = 44.5, y = 76.2, conditions = {} },
        { type = "note", text = "Complete additional quests on Red Cloud Mesa: mountain cougar hunting and bristleback quilboar clearing.", conditions = {} },
        { type = "note", text = "Head down the mesa via the path on the northern side.", zone = "Mulgore", conditions = {} },
        { type = "accept", questID = 752, text = "Accept the quest to track down the elusive tallstrider Mazzranache.", zone = "Mulgore", conditions = {} },
        { type = "kill", questID = 752, text = "Search the plains for Mazzranache and collect the required items from the wildlife.", zone = "Mulgore", x = 47.0, y = 56.0, target = "Mazzranache", conditions = {} },
        { type = "goto", text = "Follow the road north to Bloodhoof Village.", zone = "Mulgore", x = 47.5, y = 59.8, conditions = {} },
        { type = "turnin", questID = 746, text = "Deliver the message at Bloodhoof Village.", zone = "Mulgore", x = 47.5, y = 59.8, conditions = {} },
        { type = "note", text = "Set your hearthstone at the Bloodhoof Village inn.", conditions = {} },
        { type = "note", text = "Pick up all quests in Bloodhoof: venture co. mines, swoop hunting, prairie menace clearing, and well stone collection.", conditions = {} },
        { type = "note", text = "Work south and east of Bloodhoof to complete the various hunting quests.", conditions = {} },
        { type = "note", text = "Clear the Venture Co. mine in the southeast corner of Mulgore.", zone = "Mulgore", x = 60.0, y = 47.0, conditions = {} },
        { type = "note", text = "Complete the palemane gnoll cave and bristleback areas in the southeast.", conditions = {} },
        { type = "level", targetLevel = 10, text = "Finish Mulgore quests to reach level 10.", conditions = {} },
        { type = "note", text = "At level 10, visit Thunder Bluff for class training, then head north to The Barrens.", conditions = {} },
        { type = "goto", text = "Travel to Thunder Bluff for training before heading to The Barrens.", zone = "Thunder Bluff", conditions = {} },
    },
})
