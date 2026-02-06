--[[
    Bank Alone Guides - Alliance 1-10: Elwynn Forest
    SCS / Bank Alone Guides
    
    Starting zone for Humans. Original routing and descriptions.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Alliance_0110_Elwynn", {
    title = "Alliance 1-10: Elwynn Forest",
    faction = "Alliance",
    levelRange = {1, 10},
    category = "Leveling",
    nextGuide = "Alliance_1020",
    steps = {
        { type = "accept", questID = 783, text = "Speak with Marshal McBride inside Northshire Abbey to begin your first assignment.", zone = "Elwynn Forest", x = 48.2, y = 42.8, conditions = {} },
        { type = "turnin", questID = 783, text = "Report to Deputy Willem just outside the Abbey for further orders.", zone = "Elwynn Forest", x = 48.9, y = 41.6, conditions = {} },
        { type = "accept", questID = 7, text = "Pick up the task to clear kobold vermin from the vineyard area.", zone = "Elwynn Forest", x = 48.9, y = 41.6, conditions = {} },
        { type = "accept", questID = 5261, text = "Also accept the task to deal with the Defias bandits lurking nearby.", zone = "Elwynn Forest", x = 48.9, y = 41.6, conditions = {} },
        { type = "kill", questID = 7, text = "Head east to the vineyard and eliminate kobold workers. Collect 10 kills.", zone = "Elwynn Forest", x = 50.5, y = 42.0, target = "Kobold Vermin", conditions = {} },
        { type = "kill", questID = 5261, text = "Move southeast to deal with Defias thugs near the vineyards.", zone = "Elwynn Forest", x = 51.2, y = 44.3, target = "Defias Thug", conditions = {} },
        { type = "turnin", questID = 7, text = "Return to Deputy Willem and report on the kobold situation.", zone = "Elwynn Forest", x = 48.9, y = 41.6, conditions = {} },
        { type = "turnin", questID = 5261, text = "Also hand in the Defias report.", zone = "Elwynn Forest", x = 48.9, y = 41.6, conditions = {} },
        { type = "accept", questID = 15, text = "Take the follow-up to investigate deeper inside Echo Ridge Mine.", zone = "Elwynn Forest", x = 48.9, y = 41.6, conditions = {} },
        { type = "kill", questID = 15, text = "Enter Echo Ridge Mine to the northeast and thin out the kobold laborers inside.", zone = "Elwynn Forest", x = 53.8, y = 40.5, target = "Kobold Worker", conditions = {} },
        { type = "turnin", questID = 15, text = "Return to Deputy Willem with your findings.", zone = "Elwynn Forest", x = 48.9, y = 41.6, conditions = {} },
        { type = "accept", questID = 21, text = "Accept the final mine cleanup task.", zone = "Elwynn Forest", x = 48.9, y = 41.6, conditions = {} },
        { type = "kill", questID = 21, text = "Re-enter Echo Ridge Mine and defeat the kobold tunnelers deeper within.", zone = "Elwynn Forest", x = 54.0, y = 39.0, target = "Kobold Tunneler", conditions = {} },
        { type = "turnin", questID = 21, text = "Report back to Willem. Well done clearing the mine!", zone = "Elwynn Forest", x = 48.9, y = 41.6, conditions = {} },
        { type = "note", text = "You should be around level 4-5 now. Head south along the road toward Goldshire.", zone = "Elwynn Forest", conditions = {} },
        { type = "goto", text = "Follow the road south from Northshire Abbey to Goldshire.", zone = "Elwynn Forest", x = 42.1, y = 65.9, conditions = {} },
        { type = "note", text = "Set your hearthstone at the Lion's Pride Inn in Goldshire.", zone = "Elwynn Forest", x = 43.3, y = 65.7, conditions = {} },
        { type = "accept", questID = 54, text = "Pick up the dispatch delivery task at Goldshire.", zone = "Elwynn Forest", x = 42.1, y = 65.9, conditions = {} },
        { type = "accept", questID = 40, text = "Get the quest about murloc activity near Crystal Lake.", zone = "Elwynn Forest", x = 42.1, y = 65.9, conditions = {} },
        { type = "accept", questID = 46, text = "Accept the task to retrieve a stolen necklace from the kobold Goldtooth.", zone = "Elwynn Forest", x = 42.1, y = 65.9, conditions = {} },
        { type = "accept", questID = 62, text = "Take the Fargodeep Mine investigation quest.", zone = "Elwynn Forest", x = 42.1, y = 65.9, conditions = {} },
        { type = "goto", text = "Head southwest to the Fargodeep Mine entrance.", zone = "Elwynn Forest", x = 39.5, y = 81.5, conditions = {} },
        { type = "complete", questID = 62, text = "Explore the Fargodeep Mine and find evidence of the problem within.", zone = "Elwynn Forest", x = 39.5, y = 81.5, conditions = {} },
        { type = "kill", questID = 46, text = "Find and defeat Goldtooth inside the mine to recover the necklace.", zone = "Elwynn Forest", x = 40.0, y = 82.0, target = "Goldtooth", conditions = {} },
        { type = "goto", text = "Head to Crystal Lake to investigate the murloc situation.", zone = "Elwynn Forest", x = 52.0, y = 66.0, conditions = {} },
        { type = "turnin", questID = 40, text = "Report the murloc threat to the relevant authority.", zone = "Elwynn Forest", x = 42.1, y = 65.9, conditions = {} },
        { type = "turnin", questID = 62, text = "Turn in the mine investigation report.", zone = "Elwynn Forest", x = 42.1, y = 65.9, conditions = {} },
        { type = "turnin", questID = 46, text = "Return the necklace for your reward.", zone = "Elwynn Forest", x = 42.1, y = 65.9, conditions = {} },
        { type = "accept", questID = 76, text = "Help gather feed ingredients for Old Blanchy the horse.", zone = "Elwynn Forest", x = 43.3, y = 65.7, conditions = {} },
        { type = "complete", questID = 76, text = "Gather oats and apples from the farms east and south of Goldshire.", zone = "Elwynn Forest", x = 55.0, y = 68.0, conditions = {} },
        { type = "turnin", questID = 76, text = "Deliver the feed and collect your reward.", zone = "Elwynn Forest", x = 43.3, y = 65.7, conditions = {} },
        { type = "note", text = "You should be level 8-9 now. Pick up any remaining quests in Goldshire.", conditions = {} },
        { type = "accept", questID = 176, text = "Take the bounty for the notorious gnoll Hogger if available.", zone = "Elwynn Forest", x = 42.1, y = 65.9, conditions = {} },
        { type = "kill", questID = 176, text = "Head southwest to find Hogger near the river. Group up if possible - he hits hard!", zone = "Elwynn Forest", x = 26.4, y = 77.3, target = "Hogger", conditions = {} },
        { type = "turnin", questID = 176, text = "Collect the bounty for Hogger's defeat.", zone = "Elwynn Forest", x = 42.1, y = 65.9, conditions = {} },
        { type = "level", targetLevel = 10, text = "Grind any remaining mobs or complete side quests until you reach level 10.", conditions = {} },
        { type = "note", text = "At level 10, head west to Westfall or take the road north to Stormwind for class training. Your Elwynn adventure is complete!", conditions = {} },
    },
})
