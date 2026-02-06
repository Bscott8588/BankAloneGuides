--[[
    Bank Alone Guides - Horde 10-20
    SCS / Bank Alone Guides
    
    The Barrens, Silverpine Forest, Ghostlands. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Horde_1020", {
    title = "Horde 10-20: The Barrens",
    faction = "Horde",
    levelRange = {10, 20},
    category = "Leveling",
    nextGuide = "Horde_2030",
    steps = {
        -- The Barrens (10-20) - Main route
        { type = "note", text = "Head to The Barrens via the west gate of Orgrimmar or north from Mulgore.", conditions = {} },
        { type = "goto", text = "Travel to the Crossroads, the central Horde hub in The Barrens.", zone = "The Barrens", x = 51.5, y = 30.3, conditions = {} },
        { type = "flightpath", text = "Get the Crossroads flight path.", zone = "The Barrens", conditions = {} },
        { type = "note", text = "Set your hearthstone at the Crossroads inn.", conditions = {} },
        { type = "note", text = "Pick up ALL quests at the Crossroads - this is a massive quest hub.", conditions = {} },
        { type = "accept", questID = 844, text = "Accept the plainstrider menace quest.", zone = "The Barrens", conditions = {} },
        { type = "kill", questID = 844, text = "Hunt plainstriders around the roads near the Crossroads.", zone = "The Barrens", x = 52.0, y = 33.0, target = "Plainstrider", conditions = {} },
        { type = "turnin", questID = 844, text = "Return the collected beaks.", zone = "The Barrens", x = 51.5, y = 30.3, conditions = {} },
        { type = "accept", questID = 870, text = "Accept the raptor thieves quest.", zone = "The Barrens", conditions = {} },
        { type = "kill", questID = 870, text = "Defeat raptors south of the Crossroads to recover stolen supplies.", zone = "The Barrens", x = 52.0, y = 38.0, target = "Raptor", conditions = {} },
        { type = "turnin", questID = 870, text = "Return the recovered supplies.", zone = "The Barrens", x = 51.5, y = 30.3, conditions = {} },
        { type = "accept", questID = 871, text = "Take the Forgotten Pools investigation quest.", zone = "The Barrens", conditions = {} },
        { type = "complete", questID = 871, text = "Travel to the oasis northwest of the Crossroads and investigate.", zone = "The Barrens", x = 43.0, y = 23.0, conditions = {} },
        { type = "turnin", questID = 871, text = "Report your findings about the pools.", zone = "The Barrens", x = 51.5, y = 30.3, conditions = {} },
        { type = "note", text = "Work the quest circuits: east toward the raptors/zhevras, west toward the harpy caves, south toward Camp Taurajo.", conditions = {} },
        { type = "note", text = "Head southeast to the Stagnant Oasis for centaur quests.", zone = "The Barrens", x = 58.0, y = 42.0, conditions = {} },
        { type = "note", text = "Complete the Wailing Caverns dungeon quests if you have a group (requires level 15+).", conditions = {} },
        { type = "level", targetLevel = 15, text = "Work Crossroads area quests to level 15.", conditions = {} },

        -- Southern Barrens (15-20)
        { type = "note", text = "Move south toward Camp Taurajo for the 15-20 quest content.", conditions = {} },
        { type = "goto", text = "Travel south to Camp Taurajo.", zone = "The Barrens", x = 44.5, y = 59.2, conditions = {} },
        { type = "flightpath", text = "Get the Camp Taurajo flight path.", zone = "The Barrens", conditions = {} },
        { type = "note", text = "Pick up quests: bristleback clearing, silithid investigation, and kolkar centaur camps.", conditions = {} },
        { type = "note", text = "Work the bristleback camps east of Camp Taurajo.", conditions = {} },
        { type = "note", text = "Head further south to Ratchet on the east coast for additional quests and the neutral auction house.", zone = "The Barrens", x = 62.7, y = 37.1, conditions = {} },
        { type = "flightpath", text = "Get the Ratchet flight path.", zone = "The Barrens", conditions = {} },
        { type = "note", text = "Complete the pirate camp quests along the coast from Ratchet.", conditions = {} },

        -- Ghostlands Alternative (for Blood Elves)
        { type = "note", text = "Blood Elf characters: Ghostlands is your primary 10-20 zone. Travel south from Eversong Woods.", conditions = {
            { type = "race", race = "Blood Elf" },
        }},
        { type = "note", text = "Ghostlands has excellent quest density and leads to the Tranquillien hub.", conditions = {
            { type = "race", race = "Blood Elf" },
        }},

        -- Silverpine Alternative (for Undead)
        { type = "note", text = "Undead characters: Silverpine Forest is your natural 10-20 zone. Head south from Undercity.", conditions = {
            { type = "race", race = "Undead" },
        }},

        { type = "level", targetLevel = 20, text = "Finish remaining Barrens quests to reach level 20.", conditions = {} },
        { type = "note", text = "At level 20, you're ready for Stonetalon Mountains, Ashenvale, or Hillsbrad Foothills.", conditions = {} },
    },
})
