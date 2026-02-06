-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 67-68: Blade's Edge Mountains
-- Original routing through the ogre-infested peaks
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_67_68_BladeEdge", {
    title      = "Blade's Edge Mountains (67-68)",
    faction    = "Alliance",
    levelRange = { 67, 68 },
    zone       = "Blade's Edge Mountains",
    steps = {
        { type = "fly",     destination = "Sylvanaar", zone = "Blade's Edge Mountains", text = "Fly to Sylvanaar in Blade's Edge Mountains" },
        { type = "fp",      zone = "Blade's Edge Mountains", text = "Grab the Sylvanaar flight path" },
        { type = "note",    text = "Set your Hearthstone at Sylvanaar." },
        { type = "note",    text = "Pick up all Sylvanaar quests: ogre bounties, crystal investigations, and wildlife tasks." },
        { type = "accept",  questID = 10519, questName = "Ogre Wrangling",         zone = "Blade's Edge Mountains", x = 51.6, y = 58.1, text = "Take the ogre control mission" },
        { type = "kill",    target = "Bloodmaul Ogres",                            zone = "Blade's Edge Mountains", x = 53.0, y = 55.0, text = "Clear ogres from the camps near Sylvanaar" },
        { type = "turnin",  questID = 10519, questName = "Ogre Wrangling",         zone = "Blade's Edge Mountains", x = 51.6, y = 58.1, text = "Report the ogre situation" },
        { type = "accept",  questID = 10521, questName = "Crystal Corruption",     zone = "Blade's Edge Mountains", x = 51.6, y = 58.1, text = "Investigate the corrupting crystals" },
        { type = "goto",    zone = "Blade's Edge Mountains", x = 62.0, y = 65.0, text = "Head east to the crystal spine formations" },
        { type = "kill",    target = "Crystal-infused Beasts",                     zone = "Blade's Edge Mountains", x = 63.0, y = 66.0, text = "Eliminate creatures corrupted by the crystal growths" },
        { type = "turnin",  questID = 10521, questName = "Crystal Corruption",     zone = "Blade's Edge Mountains", x = 51.6, y = 58.1, text = "Report findings about the crystals" },
        { type = "note",    text = "Move north to Toshley's Station for gnome engineering quests." },
        { type = "goto",    zone = "Blade's Edge Mountains", x = 61.0, y = 38.0, text = "Travel to Toshley's Station" },
        { type = "fp",      zone = "Blade's Edge Mountains", text = "Get the Toshley's Station flight path" },
        { type = "note",    text = "Complete the Simon Says game quests and the raven-related tasks." },
        { type = "hs",      text = "Hearthstone to Sylvanaar" },
        { type = "note",    text = "At 68, proceed to Netherstorm for the final push." },
    },
})
