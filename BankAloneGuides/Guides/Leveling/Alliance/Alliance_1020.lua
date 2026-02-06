--[[
    Bank Alone Guides - Alliance 10-20
    SCS / Bank Alone Guides
    
    Westfall, Loch Modan, Darkshore, Redridge Mountains. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Alliance_1020", {
    title = "Alliance 10-20: Westfall & Loch Modan",
    faction = "Alliance",
    levelRange = {10, 20},
    category = "Leveling",
    nextGuide = "Alliance_2030",
    steps = {
        -- Westfall Section (10-15)
        { type = "note", text = "Head to Sentinel Hill in Westfall. Human characters can walk west from Goldshire; others should fly or run from Stormwind.", zone = "Westfall", conditions = {} },
        { type = "goto", text = "Travel to Sentinel Hill, the Alliance outpost in Westfall.", zone = "Westfall", x = 56.3, y = 47.5, conditions = {} },
        { type = "flightpath", text = "Grab the Sentinel Hill flight path if you don't have it already.", zone = "Westfall", x = 56.6, y = 52.6, conditions = {} },
        { type = "note", text = "Set your hearthstone at the Sentinel Hill inn.", zone = "Westfall", conditions = {} },
        { type = "accept", questID = 26, text = "Accept the People's Militia quest chain from Gryan Stoutmantle.", zone = "Westfall", x = 56.3, y = 47.5, conditions = {} },
        { type = "note", text = "Pick up all available quests at Sentinel Hill. There are several NPCs with tasks.", conditions = {} },
        { type = "kill", questID = 26, text = "Head south along the coast and fields to engage Defias pillagers and looters.", zone = "Westfall", x = 50.0, y = 60.0, target = "Defias Pillager", conditions = {} },
        { type = "turnin", questID = 26, text = "Return to Gryan with proof of your militia service.", zone = "Westfall", x = 56.3, y = 47.5, conditions = {} },
        { type = "accept", questID = 65, text = "Pick up the Westfall Stew recipe quest from the cook.", zone = "Westfall", x = 56.3, y = 47.5, conditions = {} },
        { type = "complete", questID = 65, text = "Gather ingredients: stringy vulture meat, goretusk liver, and murloc eyes from around Westfall.", zone = "Westfall", conditions = {} },
        { type = "turnin", questID = 65, text = "Turn in the stew ingredients for a nice reward.", zone = "Westfall", x = 56.3, y = 47.5, conditions = {} },
        { type = "accept", questID = 153, text = "Begin the Defias Brotherhood investigation chain.", zone = "Westfall", x = 56.3, y = 47.5, conditions = {} },
        { type = "note", text = "Follow the Defias Brotherhood chain through multiple steps: speak to informants, investigate Moonbrook, and uncover the conspiracy.", zone = "Westfall", conditions = {} },
        { type = "goto", text = "Visit Moonbrook in the southwest corner of Westfall for quest objectives.", zone = "Westfall", x = 42.8, y = 72.6, conditions = {} },
        { type = "note", text = "Complete quests around the Moonbrook area. Watch for elite patrols.", zone = "Westfall", conditions = {} },
        { type = "level", targetLevel = 14, text = "Continue Westfall quests until you reach level 14.", conditions = {} },

        -- Loch Modan Section (14-18)
        { type = "note", text = "Travel to Loch Modan for more quests. Fly to Ironforge, then walk east through the tunnels.", zone = "Loch Modan", conditions = {} },
        { type = "fly", text = "Fly to Ironforge if possible, then head east to Loch Modan.", zone = "Ironforge", conditions = {} },
        { type = "goto", text = "Enter Loch Modan and head to Thelsamar, the main quest hub.", zone = "Loch Modan", x = 35.0, y = 46.5, conditions = {} },
        { type = "flightpath", text = "Grab the Thelsamar flight path.", zone = "Loch Modan", x = 33.9, y = 50.9, conditions = {} },
        { type = "note", text = "Set your hearthstone in Thelsamar.", conditions = {} },
        { type = "note", text = "Pick up all quests in Thelsamar: trogg clearing, excavation defense, bear and boar hunting.", conditions = {} },
        { type = "note", text = "Work the quest circuits around the lake: east side for troggs, south for the excavation site, north for wildlife quests.", conditions = {} },
        { type = "note", text = "Don't forget to visit the dam in the northeast for additional quests.", zone = "Loch Modan", x = 46.5, y = 14.4, conditions = {} },

        -- Redridge Mountains (15-18)
        { type = "note", text = "When you reach level 16-17, head to Redridge Mountains. Fly to Stormwind, then travel east.", conditions = {} },
        { type = "goto", text = "Travel to Lakeshire in Redridge Mountains.", zone = "Redridge Mountains", x = 30.6, y = 59.4, conditions = {} },
        { type = "flightpath", text = "Grab the Lakeshire flight path.", zone = "Redridge Mountains", conditions = {} },
        { type = "note", text = "Pick up quests in Lakeshire: orc elimination, gnoll patrols, lost items from the lake.", conditions = {} },
        { type = "note", text = "Work the gnoll camps to the east and the orc encampments to the north.", conditions = {} },
        { type = "level", targetLevel = 18, text = "Keep questing in Redridge until level 18.", conditions = {} },

        -- Darkshore Alternative
        { type = "note", text = "Night Elf and Draenei players: Darkshore is your primary 10-20 zone. Take the boat from Darnassus/Exodar.", conditions = {
            { type = "race", race = "Night Elf" },
        }},

        -- Deadmines
        { type = "accept", questID = 166, text = "If you have a group, pick up the Deadmines quest chain.", zone = "Westfall", x = 56.3, y = 47.5, conditions = {} },
        { type = "note", text = "Run the Deadmines dungeon in Moonbrook with a group. Great loot for this level range.", zone = "Westfall", conditions = {} },

        { type = "level", targetLevel = 20, text = "Finish up remaining quests to reach level 20. Visit Stormwind for class training.", conditions = {} },
        { type = "note", text = "At level 20, head to Duskwood for the 20-30 bracket.", conditions = {} },
    },
})
