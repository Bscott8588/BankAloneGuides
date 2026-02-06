-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 10-20: Westfall
-- Original routing — efficient Defias-focused leveling
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_10_20_Westfall", {
    title      = "Westfall (10-20)",
    faction    = "Alliance",
    levelRange = { 10, 20 },
    zone       = "Westfall",
    steps = {
        { type = "goto",    zone = "Westfall", x = 56.3, y = 47.5, text = "Travel west from Goldshire/Stormwind into Westfall" },
        { type = "fp",      zone = "Westfall", x = 56.6, y = 52.6, text = "Grab the Sentinel Hill flight path" },
        { type = "note",    text = "Set your Hearthstone at the Sentinel Hill inn." },
        { type = "accept",  questID = 36,   questName = "The People's Militia",   zone = "Westfall", x = 56.3, y = 47.5, text = "Join the People's Militia effort at Sentinel Hill" },
        { type = "accept",  questID = 153,  questName = "Red Linen Goods",        zone = "Westfall", x = 56.3, y = 47.5, text = "Collect linen for the settlers" },
        { type = "goto",    zone = "Westfall", x = 44.0, y = 36.0, text = "Head northwest to the Defias camps around Moonbrook" },
        { type = "kill",    target = "Defias Trappers & Smugglers",                zone = "Westfall", x = 44.5, y = 35.0, text = "Clear Defias enemies throughout western Westfall" },
        { type = "turnin",  questID = 153,  questName = "Red Linen Goods",        zone = "Westfall", x = 56.3, y = 47.5, text = "Return linen cloth to Sentinel Hill" },
        { type = "turnin",  questID = 36,   questName = "The People's Militia",   zone = "Westfall", x = 56.3, y = 47.5, text = "Report your militia results" },
        { type = "accept",  questID = 64,   questName = "The Defias Brotherhood", zone = "Westfall", x = 56.3, y = 47.5, text = "Begin the Defias Brotherhood investigation chain" },
        { type = "note",    text = "Work the chain: Moonbrook, Deadmines entrance area, collecting clues." },
        { type = "goto",    zone = "Westfall", x = 42.6, y = 72.0, text = "Travel south to the Dagger Hills area for additional quests" },
        { type = "kill",    target = "Gnolls and Defias",                          zone = "Westfall", x = 40.0, y = 68.0, text = "Clear threats around the southern farms" },
        { type = "note",    text = "Pick up the lighthouse and coastal quests along the western shore." },
        { type = "goto",    zone = "Westfall", x = 30.0, y = 85.0, text = "Check the shoreline for murloc and coast-related tasks" },
        { type = "kill",    target = "Coastal Murlocs",                            zone = "Westfall", x = 29.0, y = 83.0, text = "Clear murlocs along the southwestern coast" },
        { type = "hs",      text = "Hearthstone back to Sentinel Hill to turn in quests" },
        { type = "note",    text = "Continue picking up and completing Sentinel Hill quests until level 18." },
        { type = "note",    text = "Run Deadmines dungeon if you have a group — excellent gear and XP at 17-20." },
        { type = "note",    text = "At level 18-20, you're ready to move on to Redridge Mountains and Duskwood." },
    },
})
