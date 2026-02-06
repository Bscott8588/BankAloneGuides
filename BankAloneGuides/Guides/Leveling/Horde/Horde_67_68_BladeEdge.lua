-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 67-68: Blade's Edge Mountains
-- Original routing through the ogre-infested peaks
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_67_68_BladeEdge", {
    title      = "Blade's Edge Mountains (67-68)",
    faction    = "Horde",
    levelRange = { 67, 68 },
    zone       = "Blade's Edge Mountains",
    steps = {
        { type = "fly",     destination = "Thunderlord Stronghold", zone = "Blade's Edge Mountains", text = "Fly to Thunderlord Stronghold" },
        { type = "fp",      zone = "Blade's Edge Mountains", text = "Get the Thunderlord Stronghold flight path" },
        { type = "note",    text = "Set Hearthstone at Thunderlord Stronghold." },
        { type = "note",    text = "Pick up all quests: ogre suppression, crystal studies, and gronn hunting." },
        { type = "accept",  questID = 10519, questName = "Ogre Wrangling",        zone = "Blade's Edge Mountains", x = 52.0, y = 58.0, text = "Begin the ogre control assignment" },
        { type = "kill",    target = "Bloodmaul Ogres",                            zone = "Blade's Edge Mountains", x = 50.0, y = 52.0, text = "Clear the Bloodmaul ogre camps" },
        { type = "turnin",  questID = 10519, questName = "Ogre Wrangling",        zone = "Blade's Edge Mountains", x = 52.0, y = 58.0, text = "Report the ogres contained" },
        { type = "accept",  questID = 10521, questName = "Crystal Corruption",    zone = "Blade's Edge Mountains", x = 52.0, y = 58.0, text = "Investigate crystal anomalies" },
        { type = "goto",    zone = "Blade's Edge Mountains", x = 62.0, y = 66.0, text = "Travel to the crystal formations" },
        { type = "kill",    target = "Crystal-corrupted Wildlife",                 zone = "Blade's Edge Mountains", x = 63.0, y = 67.0, text = "Defeat creatures warped by crystal energy" },
        { type = "turnin",  questID = 10521, questName = "Crystal Corruption",    zone = "Blade's Edge Mountains", x = 52.0, y = 58.0, text = "Report crystal findings" },
        { type = "note",    text = "Head north to Mok'Nathal Village for the Rexxar quest chain." },
        { type = "goto",    zone = "Blade's Edge Mountains", x = 76.0, y = 60.0, text = "Travel to Mok'Nathal Village" },
        { type = "fp",      zone = "Blade's Edge Mountains", text = "Get the Mok'Nathal Village flight path" },
        { type = "note",    text = "Complete the Mok'Nathal quests and Rexxar's hunting assignments." },
        { type = "hs",      text = "Hearthstone to Thunderlord Stronghold" },
        { type = "note",    text = "At 68, proceed to Netherstorm." },
    },
})
