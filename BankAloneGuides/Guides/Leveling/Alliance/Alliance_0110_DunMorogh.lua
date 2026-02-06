--[[
    Bank Alone Guides - Alliance 1-10: Dun Morogh
    SCS / Bank Alone Guides
    
    Starting zone for Dwarves and Gnomes. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Alliance_0110_DunMorogh", {
    title = "Alliance 1-10: Dun Morogh",
    faction = "Alliance",
    levelRange = {1, 10},
    category = "Leveling",
    nextGuide = "Alliance_1020",
    steps = {
        { type = "accept", questID = 170, text = "Speak with Sten Stoutarm at the Coldridge Valley camp and accept the supply quest.", zone = "Dun Morogh", x = 29.9, y = 71.2, conditions = {} },
        { type = "accept", questID = 179, text = "Also pick up the wolf hunting assignment nearby.", zone = "Dun Morogh", x = 29.9, y = 71.2, conditions = {} },
        { type = "kill", questID = 179, text = "Head out into Coldridge Valley and defeat young wolves roaming the snow.", zone = "Dun Morogh", x = 31.0, y = 69.0, target = "Young Wolf", conditions = {} },
        { type = "collect", questID = 170, text = "Gather tough wolf meat and small pelts from the wolves you defeat.", zone = "Dun Morogh", x = 31.0, y = 69.0, conditions = {} },
        { type = "turnin", questID = 170, text = "Return to Sten with the gathered supplies.", zone = "Dun Morogh", x = 29.9, y = 71.2, conditions = {} },
        { type = "turnin", questID = 179, text = "Report the wolf population thinned.", zone = "Dun Morogh", x = 29.9, y = 71.2, conditions = {} },
        { type = "accept", questID = 182, text = "Grab a hot mornbrew delivery for a guard on a cold watch shift.", zone = "Dun Morogh", x = 29.2, y = 71.5, conditions = {} },
        { type = "turnin", questID = 182, text = "Find the freezing guard and deliver his warm drink.", zone = "Dun Morogh", x = 30.5, y = 67.8, conditions = {} },
        { type = "accept", questID = 218, text = "Take the assignment to deal with trolls in a cave east of the outpost.", zone = "Dun Morogh", x = 28.4, y = 74.2, conditions = {} },
        { type = "kill", questID = 218, text = "Enter the troll cave and clear out the Frostmane novices inside.", zone = "Dun Morogh", x = 35.0, y = 74.0, target = "Frostmane Troll Whelp", conditions = {} },
        { type = "turnin", questID = 218, text = "Report your success against the trolls.", zone = "Dun Morogh", x = 28.4, y = 74.2, conditions = {} },
        { type = "accept", questID = 313, text = "Accept the deeper troll incursion mission into Frostmane Hold.", zone = "Dun Morogh", x = 28.4, y = 74.2, conditions = {} },
        { type = "kill", questID = 313, text = "Push into the deeper cave system and defeat troll headhunters.", zone = "Dun Morogh", x = 35.5, y = 72.0, target = "Frostmane Headhunter", conditions = {} },
        { type = "turnin", questID = 313, text = "Return with proof of the troll threat neutralized.", zone = "Dun Morogh", x = 28.4, y = 74.2, conditions = {} },
        { type = "note", text = "You should be around level 5 now. Head south through the tunnel toward Kharanos.", zone = "Dun Morogh", conditions = {} },
        { type = "goto", text = "Travel through the mountain tunnel to reach Kharanos.", zone = "Dun Morogh", x = 46.7, y = 52.5, conditions = {} },
        { type = "note", text = "Set your hearthstone at the inn in Kharanos (Thunderbrew Distillery).", zone = "Dun Morogh", x = 46.7, y = 52.5, conditions = {} },
        { type = "accept", questID = 282, text = "Pick up the trogg clearing quest at Kharanos.", zone = "Dun Morogh", x = 46.7, y = 52.5, conditions = {} },
        { type = "kill", questID = 282, text = "Head south to clear troggs from the tunnels near Kharanos.", zone = "Dun Morogh", x = 48.0, y = 57.0, target = "Rockjaw Trogg", conditions = {} },
        { type = "turnin", questID = 282, text = "Return to Kharanos and report the trogg situation handled.", zone = "Dun Morogh", x = 46.7, y = 52.5, conditions = {} },
        { type = "note", text = "Continue doing quests around Kharanos, focusing on the areas south and east.", conditions = {} },
        { type = "note", text = "Visit the yeti cave to the southeast if you need extra experience.", zone = "Dun Morogh", x = 55.0, y = 52.0, conditions = {} },
        { type = "level", targetLevel = 10, text = "Reach level 10 by completing remaining Dun Morogh quests.", conditions = {} },
        { type = "note", text = "At level 10, travel south to Ironforge for class training and then continue to Loch Modan or head for the shared 10-20 zones.", conditions = {} },
        { type = "fly", text = "Take the flight path to Ironforge if you have it, or walk south.", zone = "Ironforge", conditions = {} },
    },
})
