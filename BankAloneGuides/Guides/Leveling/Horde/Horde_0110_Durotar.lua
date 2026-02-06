--[[
    Bank Alone Guides - Horde 1-10: Durotar
    SCS / Bank Alone Guides
    
    Starting zone for Orcs and Trolls. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Horde_0110_Durotar", {
    title = "Horde 1-10: Durotar",
    faction = "Horde",
    levelRange = {1, 10},
    category = "Leveling",
    nextGuide = "Horde_1020",
    steps = {
        { type = "accept", questID = 788, text = "Speak with Kaltunk in the Valley of Trials to begin your journey.", zone = "Durotar", x = 42.8, y = 68.4, conditions = {} },
        { type = "turnin", questID = 788, text = "Report to Gornek at the nearby training hut.", zone = "Durotar", x = 42.0, y = 68.8, conditions = {} },
        { type = "accept", questID = 790, text = "Accept the boar hunting task to prove your combat readiness.", zone = "Durotar", x = 42.0, y = 68.8, conditions = {} },
        { type = "kill", questID = 790, text = "Head out into the valley and hunt mottled boars nearby.", zone = "Durotar", x = 43.5, y = 68.0, target = "Mottled Boar", conditions = {} },
        { type = "turnin", questID = 790, text = "Return to Gornek with proof of your kills.", zone = "Durotar", x = 42.0, y = 68.8, conditions = {} },
        { type = "accept", questID = 804, text = "Take the quest to deal with the scorpion Sarkoth.", zone = "Durotar", x = 42.0, y = 68.8, conditions = {} },
        { type = "kill", questID = 804, text = "Find Sarkoth on the ridge northwest of camp and defeat it.", zone = "Durotar", x = 40.6, y = 66.3, target = "Sarkoth", conditions = {} },
        { type = "turnin", questID = 804, text = "Return the proof of Sarkoth's defeat.", zone = "Durotar", x = 42.0, y = 68.8, conditions = {} },
        { type = "accept", questID = 791, text = "Accept the scorpion tail gathering task.", zone = "Durotar", x = 42.0, y = 68.8, conditions = {} },
        { type = "accept", questID = 794, text = "Also grab the cactus apple gathering quest from the lazy peon.", zone = "Durotar", x = 42.6, y = 69.2, conditions = {} },
        { type = "collect", questID = 794, text = "Pick cactus apples from the cacti around the Valley of Trials.", zone = "Durotar", x = 44.0, y = 70.0, itemID = 4870, count = 10, conditions = {} },
        { type = "kill", questID = 791, text = "Defeat scorpions and collect their tails for antivenom production.", zone = "Durotar", x = 44.0, y = 72.0, target = "Scorpid Worker", conditions = {} },
        { type = "turnin", questID = 791, text = "Return the scorpion tails.", zone = "Durotar", x = 42.0, y = 68.8, conditions = {} },
        { type = "turnin", questID = 794, text = "Turn in the cactus apples.", zone = "Durotar", x = 42.6, y = 69.2, conditions = {} },
        { type = "accept", questID = 805, text = "Accept the vile familiars quest to clear imps from the nearby cave.", zone = "Durotar", x = 42.0, y = 68.8, conditions = {} },
        { type = "kill", questID = 805, text = "Enter the cave to the northwest and eliminate the vile familiars inside.", zone = "Durotar", x = 38.5, y = 67.0, target = "Vile Familiar", conditions = {} },
        { type = "turnin", questID = 805, text = "Report the demon cave cleared.", zone = "Durotar", x = 42.0, y = 68.8, conditions = {} },
        { type = "note", text = "You should be around level 5. Head north out of the Valley of Trials.", conditions = {} },
        { type = "accept", questID = 840, text = "Grab the delivery quest to carry supplies to Razor Hill.", zone = "Durotar", x = 42.0, y = 68.8, conditions = {} },
        { type = "goto", text = "Follow the road north to Razor Hill.", zone = "Durotar", x = 51.9, y = 41.5, conditions = {} },
        { type = "turnin", questID = 840, text = "Deliver the supplies to Razor Hill.", zone = "Durotar", x = 51.9, y = 41.5, conditions = {} },
        { type = "note", text = "Set your hearthstone at the Razor Hill inn.", zone = "Durotar", x = 51.6, y = 41.7, conditions = {} },
        { type = "accept", questID = 5441, text = "Accept the Lazy Peons quest from the foreman at Razor Hill.", zone = "Durotar", x = 51.9, y = 41.5, conditions = {} },
        { type = "complete", questID = 5441, text = "Find sleeping peons in the area and bonk them with the blackjack to wake them up.", zone = "Durotar", x = 52.0, y = 43.0, conditions = {} },
        { type = "turnin", questID = 5441, text = "Report all peons accounted for.", zone = "Durotar", x = 51.9, y = 41.5, conditions = {} },
        { type = "note", text = "Pick up all quests around Razor Hill. Head east for the kul tiras sailors and south for the quilboar camps.", conditions = {} },
        { type = "accept", questID = 842, text = "Accept the quest to report to Sen'jin Village on the coast.", zone = "Durotar", conditions = {} },
        { type = "goto", text = "Travel southeast to Sen'jin Village.", zone = "Durotar", x = 55.7, y = 73.7, conditions = {} },
        { type = "turnin", questID = 842, text = "Report to the troll settlement.", zone = "Durotar", x = 55.7, y = 73.7, conditions = {} },
        { type = "note", text = "Complete Sen'jin Village quests: zalazane's minions, island exploration, and hex removal.", conditions = {} },
        { type = "level", targetLevel = 10, text = "Finish Durotar quests to reach level 10.", conditions = {} },
        { type = "note", text = "At level 10, visit Orgrimmar for class training, then head to The Barrens via the west gate.", conditions = {} },
    },
})
