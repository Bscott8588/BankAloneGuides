--[[
    Bank Alone Guides - Alliance 1-10: Teldrassil
    SCS / Bank Alone Guides
    
    Starting zone for Night Elves. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Alliance_0110_Teldrassil", {
    title = "Alliance 1-10: Teldrassil",
    faction = "Alliance",
    levelRange = {1, 10},
    category = "Leveling",
    nextGuide = "Alliance_1020",
    steps = {
        { type = "accept", questID = 457, text = "Speak with Conservator Ilthalaine at Aldrassil and accept the balance of nature task.", zone = "Teldrassil", x = 58.6, y = 44.3, conditions = {} },
        { type = "kill", questID = 457, text = "Hunt young nightsabers and thistle boars in the surrounding forest.", zone = "Teldrassil", x = 59.0, y = 42.0, target = "Young Nightsaber", conditions = {} },
        { type = "turnin", questID = 457, text = "Return to Ilthalaine with evidence of the thinning.", zone = "Teldrassil", x = 58.6, y = 44.3, conditions = {} },
        { type = "accept", questID = 458, text = "Accept the follow-up to deal with fiercer creatures.", zone = "Teldrassil", x = 58.6, y = 44.3, conditions = {} },
        { type = "kill", questID = 458, text = "Defeat mangy nightsabers and thistle boars further from Aldrassil.", zone = "Teldrassil", x = 57.0, y = 45.0, target = "Mangy Nightsaber", conditions = {} },
        { type = "turnin", questID = 458, text = "Report back to the conservator.", zone = "Teldrassil", x = 58.6, y = 44.3, conditions = {} },
        { type = "accept", questID = 459, text = "Accept the woodland protector quest from the treant nearby.", zone = "Teldrassil", x = 57.8, y = 45.2, conditions = {} },
        { type = "complete", questID = 459, text = "Gather spider ichor from the spiders near Shadowthread Cave to aid the treant.", zone = "Teldrassil", x = 56.0, y = 47.0, conditions = {} },
        { type = "turnin", questID = 459, text = "Return to the woodland protector with the gathered samples.", zone = "Teldrassil", x = 57.8, y = 45.2, conditions = {} },
        { type = "accept", questID = 916, text = "Accept the Crown of the Earth moonwell quest.", zone = "Teldrassil", x = 59.2, y = 42.6, conditions = {} },
        { type = "goto", text = "Travel to the moonwell near Starbreeze Village to fill the phial.", zone = "Teldrassil", x = 63.0, y = 58.0, conditions = {} },
        { type = "complete", questID = 916, text = "Fill the phial at the moonwell to study the corruption.", zone = "Teldrassil", x = 63.0, y = 58.0, conditions = {} },
        { type = "note", text = "You should be level 4-5. Head south toward Dolanaar.", zone = "Teldrassil", conditions = {} },
        { type = "goto", text = "Follow the road south to Dolanaar, the main quest hub of Teldrassil.", zone = "Teldrassil", x = 55.9, y = 56.9, conditions = {} },
        { type = "note", text = "Set your hearthstone at the inn in Dolanaar.", zone = "Teldrassil", conditions = {} },
        { type = "note", text = "Pick up all available quests in Dolanaar. There are several quest givers here.", zone = "Teldrassil", conditions = {} },
        { type = "turnin", questID = 916, text = "Turn in the moonwell data and pick up the follow-ups.", zone = "Teldrassil", x = 55.9, y = 56.9, conditions = {} },
        { type = "note", text = "Complete the quest chains around Dolanaar: corrupted wildlife, furbolg threats, and timberling investigations.", zone = "Teldrassil", conditions = {} },
        { type = "note", text = "Travel to the Ban'ethil Barrow Den west of Dolanaar for the druid-related quests.", zone = "Teldrassil", x = 44.0, y = 58.0, conditions = {} },
        { type = "note", text = "Visit the Oracle Glade area to the northwest for additional quests.", zone = "Teldrassil", x = 38.0, y = 34.0, conditions = {} },
        { type = "level", targetLevel = 10, text = "Continue completing Teldrassil quests until you reach level 10.", conditions = {} },
        { type = "note", text = "At level 10, head to Darnassus for class training, then take the boat to Darkshore.", conditions = {} },
        { type = "goto", text = "Travel to Darnassus through the western portal of Teldrassil.", zone = "Darnassus", conditions = {} },
    },
})
