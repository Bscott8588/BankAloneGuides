-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 1-10: Azuremyst Isle
-- Original routing for Draenei starting experience
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_01_10_Azuremyst", {
    title      = "Azuremyst Isle (1-10)",
    faction    = "Alliance",
    levelRange = { 1, 10 },
    zone       = "Azuremyst Isle",
    steps = {
        { type = "accept",  questID = 9279, questName = "Replenishing the Healing Crystals", zone = "Azuremyst Isle", x = 52.4, y = 42.8, text = "Speak with Proenitus at the Crash Site" },
        { type = "kill",    target = "Vale Moths",                                          zone = "Azuremyst Isle", x = 53.0, y = 40.0, text = "Gather moth wings from the vale moths near the wreckage" },
        { type = "turnin",  questID = 9279, questName = "Replenishing the Healing Crystals", zone = "Azuremyst Isle", x = 52.4, y = 42.8, text = "Return to Proenitus" },
        { type = "accept",  questID = 9280, questName = "Volatile Mutations",               zone = "Azuremyst Isle", x = 52.2, y = 42.2, text = "Take the mutation cleanup task from Technician Zhanaa" },
        { type = "kill",    target = "Mutated Owlkin",                                      zone = "Azuremyst Isle", x = 49.0, y = 44.0, text = "Eliminate mutated wildlife southwest of the crash site" },
        { type = "turnin",  questID = 9280, questName = "Volatile Mutations",               zone = "Azuremyst Isle", x = 52.2, y = 42.2, text = "Report back to Zhanaa" },
        { type = "accept",  questID = 9283, questName = "Rescue the Survivors!",             zone = "Azuremyst Isle", x = 52.4, y = 42.8, text = "Find scattered survivors from the crash" },
        { type = "note",    text = "Search the area around the crash site for injured draenei. Use the quest item to heal them." },
        { type = "turnin",  questID = 9283, questName = "Rescue the Survivors!",             zone = "Azuremyst Isle", x = 52.4, y = 42.8, text = "Report the survivors rescued" },
        { type = "note",    text = "Continue south along the road to Azure Watch." },
        { type = "goto",    zone = "Azuremyst Isle", x = 48.5, y = 51.4, text = "Travel to Azure Watch" },
        { type = "note",    text = "Set your Hearthstone at the Azure Watch inn. Pick up all available quests." },
        { type = "note",    text = "Work the Azure Watch quest hub: furbolg tasks, naga scouts, and crystal recovery." },
        { type = "kill",    target = "Bristlelimb Furbolgs",                                zone = "Azuremyst Isle", x = 45.0, y = 60.0, text = "Clear furbolg intruders south of Azure Watch" },
        { type = "kill",    target = "Naga Scouts",                                         zone = "Azuremyst Isle", x = 30.0, y = 37.0, text = "Defeat naga along the western coastline" },
        { type = "note",    text = "Grind to 10. Visit The Exodar for training, then continue to Bloodmyst Isle or take the boat to Darkshore." },
        { type = "fp",      zone = "The Exodar", text = "Grab The Exodar flight path" },
        { type = "note",    text = "Train all skills. Ready for the 10-20 bracket!" },
    },
})
