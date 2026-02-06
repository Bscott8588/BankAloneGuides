--[[
    Bank Alone Guides - Alliance 30-40
    SCS / Bank Alone Guides
    
    Stranglethorn Vale, Desolace, Arathi Highlands. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Alliance_3040", {
    title = "Alliance 30-40: Stranglethorn & Arathi",
    faction = "Alliance",
    levelRange = {30, 40},
    category = "Leveling",
    nextGuide = "Alliance_4050",
    steps = {
        -- Stranglethorn Vale (30-35)
        { type = "note", text = "Travel to Stranglethorn Vale. Fly to Darkshire and head south, or take the boat from Booty Bay.", conditions = {} },
        { type = "goto", text = "Head to the Rebel Camp in the northern part of Stranglethorn.", zone = "Stranglethorn Vale", x = 37.7, y = 3.5, conditions = {} },
        { type = "note", text = "Pick up quests at the Rebel Camp. This starts several multi-part chains.", conditions = {} },
        { type = "note", text = "Visit Nesingwary's Expedition further south for the famous hunting quests.", zone = "Stranglethorn Vale", x = 35.7, y = 10.5, conditions = {} },
        { type = "note", text = "Work the Nesingwary hunting chain: tigers, panthers, and raptors in the surrounding jungle.", conditions = {} },
        { type = "note", text = "Complete the Kurzen compound quests from the Rebel Camp - clear the cave northeast of camp.", zone = "Stranglethorn Vale", x = 44.0, y = 8.0, conditions = {} },
        { type = "note", text = "Work south through the troll ruins, collecting pages for the Green Hills of Stranglethorn if you find them.", conditions = {} },
        { type = "level", targetLevel = 33, text = "Continue Stranglethorn quests to level 33.", conditions = {} },

        -- Arathi Highlands (33-36)
        { type = "note", text = "Take a break from Stranglethorn and head to Arathi Highlands.", conditions = {} },
        { type = "fly", text = "Fly to Refuge Pointe in Arathi Highlands.", zone = "Arathi Highlands", conditions = {} },
        { type = "goto", text = "Head to Refuge Pointe, the Alliance base in Arathi.", zone = "Arathi Highlands", x = 45.9, y = 47.1, conditions = {} },
        { type = "flightpath", text = "Get the Refuge Pointe flight path.", zone = "Arathi Highlands", conditions = {} },
        { type = "note", text = "Pick up quests: raptor hunting, syndicate camps, ogre clearing, and witherbark troll tasks.", conditions = {} },
        { type = "note", text = "Clear the syndicate camps in the northwest and the ogre mounds in the east.", conditions = {} },
        { type = "note", text = "Visit the farm areas for go'shek quests and the elementals at the circle of stones.", conditions = {} },
        { type = "level", targetLevel = 36, text = "Complete Arathi quests to reach level 36.", conditions = {} },

        -- Desolace (34-38 for Kalimdor players)
        { type = "note", text = "Kalimdor-based players: Desolace is a good alternative. Head from Ashenvale through Stonetalon to Desolace.", conditions = {} },
        { type = "note", text = "The Nijel's Point quest hub has tasks involving centaur factions, demons, and kodo graveyard.", conditions = {} },

        -- Return to STV (36-40)
        { type = "note", text = "Return to Stranglethorn Vale for the second half of the zone's content.", conditions = {} },
        { type = "fly", text = "Fly back to the Rebel Camp or directly to Booty Bay.", zone = "Stranglethorn Vale", conditions = {} },
        { type = "goto", text = "Head south toward Booty Bay for quests in the southern half of the zone.", zone = "Stranglethorn Vale", x = 27.0, y = 77.0, conditions = {} },
        { type = "flightpath", text = "Get the Booty Bay flight path if you don't have it.", zone = "Stranglethorn Vale", conditions = {} },
        { type = "note", text = "Pick up quests in Booty Bay: pirate clearing, bloodsail tasks, and treasure hunting.", conditions = {} },
        { type = "note", text = "Complete the remaining Nesingwary quests (elite hunts) - group up for these if needed.", conditions = {} },
        { type = "note", text = "Work the Venture Co. goblin camps in the central part of the zone.", conditions = {} },
        { type = "note", text = "Complete the pirate quest chains at the coast east of Booty Bay.", conditions = {} },
        { type = "level", targetLevel = 40, text = "Finish remaining STV quests to reach level 40.", conditions = {} },
        { type = "note", text = "Congratulations on reaching 40! Don't forget to train your mount at your capital city. Head to Tanaris or Feralas next.", conditions = {} },
    },
})
