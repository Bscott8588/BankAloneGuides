-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 58-60: Hellfire Peninsula (Entry)
-- Original routing for the Dark Portal crossing
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_58_60_Hellfire", {
    title      = "Hellfire Peninsula Entry (58-60)",
    faction    = "Alliance",
    levelRange = { 58, 60 },
    zone       = "Hellfire Peninsula",
    steps = {
        { type = "goto",    zone = "Blasted Lands", x = 58.0, y = 58.0, text = "Travel to the Blasted Lands and head to the Dark Portal" },
        { type = "note",    text = "Cross through the Dark Portal into Outland." },
        { type = "accept",  questID = 10119, questName = "Arrival in Outland",     zone = "Hellfire Peninsula", x = 87.3, y = 50.1, text = "Speak with the Alliance commander immediately after crossing" },
        { type = "turnin",  questID = 10119, questName = "Arrival in Outland",     zone = "Hellfire Peninsula", x = 87.3, y = 50.1, text = "Complete the initial arrival report" },
        { type = "accept",  questID = 10121, questName = "Legion Assault",          zone = "Hellfire Peninsula", x = 87.3, y = 50.1, text = "Help defend the staging area from demons" },
        { type = "kill",    target = "Fel Soldiers",                               zone = "Hellfire Peninsula", x = 85.0, y = 50.0, text = "Defeat demons attacking the Dark Portal staging area" },
        { type = "turnin",  questID = 10121, questName = "Legion Assault",          zone = "Hellfire Peninsula", x = 87.3, y = 50.1, text = "Report the demons repelled" },
        { type = "goto",    zone = "Hellfire Peninsula", x = 56.6, y = 66.6, text = "Travel west along the road to Honor Hold" },
        { type = "fp",      zone = "Hellfire Peninsula", text = "Grab the Honor Hold flight path" },
        { type = "note",    text = "Set your Hearthstone at the Honor Hold inn." },
        { type = "accept",  questID = 10165, questName = "Honor Hold Provisions",   zone = "Hellfire Peninsula", x = 56.6, y = 66.6, text = "Gather scattered supplies around the fortification" },
        { type = "note",    text = "Pick up all available Honor Hold quests." },
        { type = "kill",    target = "Bonechewer Orcs",                            zone = "Hellfire Peninsula", x = 58.0, y = 73.0, text = "Clear Bonechewer camp south of Honor Hold" },
        { type = "turnin",  questID = 10165, questName = "Honor Hold Provisions",   zone = "Hellfire Peninsula", x = 56.6, y = 66.6, text = "Return supplies to the quartermaster" },
        { type = "note",    text = "Continue Honor Hold quests until 60. You'll progress to the full Hellfire guide." },
    },
})
