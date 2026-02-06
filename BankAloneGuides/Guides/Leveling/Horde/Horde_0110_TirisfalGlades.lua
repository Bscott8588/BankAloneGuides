--[[
    Bank Alone Guides - Horde 1-10: Tirisfal Glades
    SCS / Bank Alone Guides
    
    Starting zone for Undead. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Horde_0110_TirisfalGlades", {
    title = "Horde 1-10: Tirisfal Glades",
    faction = "Horde",
    levelRange = {1, 10},
    category = "Leveling",
    nextGuide = "Horde_1020",
    steps = {
        { type = "accept", questID = 363, text = "Rise from the crypt and speak with Undertaker Mordo at the entrance.", zone = "Tirisfal Glades", x = 30.2, y = 71.4, conditions = {} },
        { type = "turnin", questID = 363, text = "Report to Shadow Priest Sarvis at the church in Deathknell.", zone = "Tirisfal Glades", x = 30.8, y = 66.0, conditions = {} },
        { type = "accept", questID = 364, text = "Accept the task to destroy mindless undead near the graveyard.", zone = "Tirisfal Glades", x = 30.8, y = 66.0, conditions = {} },
        { type = "kill", questID = 364, text = "Head outside and destroy mindless zombies and skeletons in the graveyard area.", zone = "Tirisfal Glades", x = 32.0, y = 68.0, target = "Mindless Zombie", conditions = {} },
        { type = "turnin", questID = 364, text = "Return to Shadow Priest Sarvis.", zone = "Tirisfal Glades", x = 30.8, y = 66.0, conditions = {} },
        { type = "accept", questID = 376, text = "Accept the quest to retrieve a keepsake from a farmstead overrun by undead.", zone = "Tirisfal Glades", x = 30.8, y = 66.0, conditions = {} },
        { type = "complete", questID = 376, text = "Search the nearby ruined farms for the personal memento.", zone = "Tirisfal Glades", x = 33.0, y = 63.0, conditions = {} },
        { type = "turnin", questID = 376, text = "Return with the keepsake.", zone = "Tirisfal Glades", x = 30.8, y = 66.0, conditions = {} },
        { type = "note", text = "Complete additional Deathknell quests: scarlet crusade infiltration, nightweb spider cave, and the rotting harvest.", conditions = {} },
        { type = "note", text = "You should be level 5-6. Head north to Brill along the road.", zone = "Tirisfal Glades", conditions = {} },
        { type = "goto", text = "Follow the main road northwest to Brill.", zone = "Tirisfal Glades", x = 60.5, y = 52.2, conditions = {} },
        { type = "note", text = "Set your hearthstone at the Brill inn.", conditions = {} },
        { type = "note", text = "Pick up all quests in Brill: plague investigation, crusade camp clearing, and undead studies.", conditions = {} },
        { type = "accept", questID = 380, text = "Accept the mills overrun quest to clear the farms north of Brill.", zone = "Tirisfal Glades", conditions = {} },
        { type = "kill", questID = 380, text = "Head north to the abandoned mills and clear the threats.", zone = "Tirisfal Glades", x = 58.0, y = 42.0, target = "Tirisfal Farmhand", conditions = {} },
        { type = "turnin", questID = 380, text = "Return to Brill with news of the mills cleared.", zone = "Tirisfal Glades", conditions = {} },
        { type = "note", text = "Work the Scarlet Crusade camps to the northeast for quest completions.", zone = "Tirisfal Glades", x = 68.0, y = 42.0, conditions = {} },
        { type = "note", text = "Complete the murloc quests along the coast to the north.", conditions = {} },
        { type = "level", targetLevel = 10, text = "Finish Tirisfal quests to reach level 10.", conditions = {} },
        { type = "note", text = "At level 10, visit Undercity for class training, then head to Silverpine Forest or take the zeppelin to Orgrimmar for The Barrens.", conditions = {} },
    },
})
