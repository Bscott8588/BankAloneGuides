-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 20-30: Redridge Mountains & Duskwood
-- Original routing through Eastern Kingdoms mid-levels
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_20_30_Redridge_Duskwood", {
    title      = "Redridge & Duskwood (20-30)",
    faction    = "Alliance",
    levelRange = { 20, 30 },
    zone       = "Redridge Mountains",
    steps = {
        -- Redridge Mountains (18-25)
        { type = "fly",     destination = "Lakeshire", zone = "Redridge Mountains", text = "Fly or ride to Lakeshire in Redridge Mountains" },
        { type = "fp",      zone = "Redridge Mountains", text = "Grab the Lakeshire flight path" },
        { type = "note",    text = "Set your Hearthstone at the Lakeshire inn." },
        { type = "note",    text = "Pick up all Lakeshire quests: gnoll bounties, orc scouts, and lake investigations." },
        { type = "kill",    target = "Redridge Gnolls",                           zone = "Redridge Mountains", x = 30.0, y = 60.0, text = "Clear gnoll camps west of Lakeshire" },
        { type = "kill",    target = "Blackrock Scouts",                          zone = "Redridge Mountains", x = 62.0, y = 50.0, text = "Defeat Blackrock orc scouts in the eastern mountains" },
        { type = "goto",    zone = "Redridge Mountains", x = 73.0, y = 57.0, text = "Head east to Render's Camp for bounty objectives" },
        { type = "kill",    target = "Blackrock Elites",                          zone = "Redridge Mountains", x = 73.0, y = 55.0, text = "Take on the Blackrock encampment leaders" },
        { type = "hs",      text = "Hearthstone to Lakeshire" },
        { type = "note",    text = "Turn in quests. Work on any remaining Redridge tasks until level 23-24." },

        -- Transition to Duskwood (23-30)
        { type = "fly",     destination = "Darkshire", zone = "Duskwood", text = "Fly to Darkshire in Duskwood" },
        { type = "fp",      zone = "Duskwood", text = "Grab the Darkshire flight path" },
        { type = "note",    text = "Set your Hearthstone at the Darkshire inn." },
        { type = "note",    text = "Accept all quests from Darkshire's quest hub." },
        { type = "kill",    target = "Undead in Raven Hill",                      zone = "Duskwood", x = 23.0, y = 44.0, text = "Clear undead from the Raven Hill cemetery" },
        { type = "kill",    target = "Worgen",                                    zone = "Duskwood", x = 73.0, y = 74.0, text = "Defeat worgen in the eastern camps" },
        { type = "note",    text = "Work the Hermit and Abercrombie quest chains — they loop through the zone nicely." },
        { type = "goto",    zone = "Duskwood", x = 75.0, y = 48.0, text = "Travel to the eastern part of Duskwood for spider and ogre quests" },
        { type = "kill",    target = "Nightbane Worgen",                          zone = "Duskwood", x = 68.0, y = 42.0, text = "Clear the worgen dens in the northeast" },
        { type = "hs",      text = "Hearthstone to Darkshire" },
        { type = "note",    text = "Turn in all completed quests. Continue Duskwood chains until level 28-30." },
        { type = "note",    text = "At 28-30, prepare to head to Stranglethorn Vale or Desolace." },
    },
})
