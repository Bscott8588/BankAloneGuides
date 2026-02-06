--[[
    Bank Alone Guides - Horde 30-40
    SCS / Bank Alone Guides
    
    Stranglethorn Vale, Desolace, Arathi Highlands, Dustwallow Marsh. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Horde_3040", {
    title = "Horde 30-40: Stranglethorn & Desolace",
    faction = "Horde",
    levelRange = {30, 40},
    category = "Leveling",
    nextGuide = "Horde_4050",
    steps = {
        -- Stranglethorn Vale (30-35)
        { type = "note", text = "Take the zeppelin from Orgrimmar to Grom'gol Base Camp in Stranglethorn Vale.", conditions = {} },
        { type = "goto", text = "Arrive at Grom'gol Base Camp.", zone = "Stranglethorn Vale", x = 32.0, y = 29.3, conditions = {} },
        { type = "flightpath", text = "Get the Grom'gol flight path.", zone = "Stranglethorn Vale", conditions = {} },
        { type = "note", text = "Set your hearthstone at the Grom'gol inn.", conditions = {} },
        { type = "note", text = "Pick up all quests at Grom'gol: troll ruins, raptor nest raiding, and panther hunting.", conditions = {} },
        { type = "note", text = "Visit Nesingwary's Expedition to the north for the famous hunting chains.", zone = "Stranglethorn Vale", x = 35.7, y = 10.5, conditions = {} },
        { type = "note", text = "Complete the Nesingwary chain: tigers, panthers, and raptors across the jungle.", conditions = {} },
        { type = "note", text = "Work the troll temple ruins east of Grom'gol for Horde-specific quests.", zone = "Stranglethorn Vale", x = 47.0, y = 21.0, conditions = {} },
        { type = "note", text = "Collect Green Hills of Stranglethorn pages as you find them from humanoid mobs.", conditions = {} },
        { type = "level", targetLevel = 33, text = "Work northern STV to level 33.", conditions = {} },

        -- Desolace (33-36)
        { type = "note", text = "Head to Desolace for a change of scenery. Fly to Sun Rock Retreat in Stonetalon and travel south.", conditions = {} },
        { type = "goto", text = "Travel to Shadowprey Village in Desolace.", zone = "Desolace", x = 26.1, y = 68.2, conditions = {} },
        { type = "flightpath", text = "Get the Shadowprey Village flight path.", zone = "Desolace", conditions = {} },
        { type = "note", text = "Pick up quests: centaur faction tasks, demon camp clearing, kodo graveyard, and naga coastal quests.", conditions = {} },
        { type = "note", text = "Choose a centaur faction to ally with (Gelkis or Magram) for a quest chain.", conditions = {} },
        { type = "note", text = "Work the demon-infested areas in the northwest for Burning Blade quests.", zone = "Desolace", x = 51.0, y = 30.0, conditions = {} },
        { type = "note", text = "Complete the Kolkar centaur and kodo graveyard quest chains.", conditions = {} },
        { type = "level", targetLevel = 36, text = "Work Desolace to level 36.", conditions = {} },

        -- Arathi Highlands (34-37)
        { type = "note", text = "Head to Arathi Highlands. Fly to Hammerfall.", conditions = {} },
        { type = "goto", text = "Travel to Hammerfall in Arathi Highlands.", zone = "Arathi Highlands", x = 73.8, y = 32.6, conditions = {} },
        { type = "flightpath", text = "Get the Hammerfall flight path.", zone = "Arathi Highlands", conditions = {} },
        { type = "note", text = "Pick up quests: raptor hunting, syndicate disruption, ogre clearing, and elementals.", conditions = {} },
        { type = "note", text = "Clear the witherbark troll camps in the southeast.", conditions = {} },
        { type = "note", text = "Work the Stromgarde Keep area for additional quest objectives.", conditions = {} },
        { type = "level", targetLevel = 37, text = "Complete Arathi quests to 37.", conditions = {} },

        -- Return to STV (37-40)
        { type = "note", text = "Return to Stranglethorn Vale for the southern content.", conditions = {} },
        { type = "fly", text = "Fly back to Grom'gol.", zone = "Stranglethorn Vale", conditions = {} },
        { type = "goto", text = "Head south to Booty Bay for new quests.", zone = "Stranglethorn Vale", x = 27.0, y = 77.0, conditions = {} },
        { type = "flightpath", text = "Get the Booty Bay flight path.", zone = "Stranglethorn Vale", conditions = {} },
        { type = "note", text = "Pick up Booty Bay quests: pirate clearing, bloodsail tasks, and treasure hunting.", conditions = {} },
        { type = "note", text = "Complete the remaining Nesingwary elite hunts with a group.", conditions = {} },
        { type = "note", text = "Finish the Venture Co. and pirate camp quest chains.", conditions = {} },
        { type = "level", targetLevel = 40, text = "Finish STV to reach level 40.", conditions = {} },
        { type = "note", text = "Congratulations on 40! Train your mount. Head to Tanaris or Feralas next.", conditions = {} },
    },
})
