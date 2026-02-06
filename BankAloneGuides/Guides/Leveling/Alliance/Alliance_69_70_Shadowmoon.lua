-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 69-70: Shadowmoon Valley
-- Original routing for the final push to 70
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_69_70_Shadowmoon", {
    title      = "Shadowmoon Valley (69-70)",
    faction    = "Alliance",
    levelRange = { 69, 70 },
    zone       = "Shadowmoon Valley",
    steps = {
        { type = "fly",     destination = "Wildhammer Stronghold", zone = "Shadowmoon Valley", text = "Fly to the Wildhammer Stronghold in Shadowmoon Valley" },
        { type = "fp",      zone = "Shadowmoon Valley", text = "Grab the Wildhammer Stronghold flight path" },
        { type = "note",    text = "Set your Hearthstone at the Wildhammer Stronghold." },
        { type = "note",    text = "Pick up all quests: demon hunting, Legion assault, and cipher fragments." },
        { type = "accept",  questID = 10568, questName = "Assault on Dark Portal Remnants", zone = "Shadowmoon Valley", x = 37.8, y = 55.5, text = "Lead attacks against Legion strongholds" },
        { type = "kill",    target = "Legion Forces",                              zone = "Shadowmoon Valley", x = 28.0, y = 50.0, text = "Assault the Legion Forward camp west of the stronghold" },
        { type = "turnin",  questID = 10568, questName = "Assault on Dark Portal Remnants", zone = "Shadowmoon Valley", x = 37.8, y = 55.5, text = "Report the assault results" },
        { type = "note",    text = "Work the Netherwing quest introduction if you're interested in the daily mount grind." },
        { type = "goto",    zone = "Shadowmoon Valley", x = 56.0, y = 57.0, text = "Head east to the Sanctum of the Stars (Scryer) or Altar of Sha'tar" },
        { type = "note",    text = "Complete the Oronok chain for the Cipher of Damnation — one of the best quest chains in TBC." },
        { type = "accept",  questID = 10570, questName = "The Cipher of Damnation", zone = "Shadowmoon Valley", x = 53.8, y = 23.4, text = "Begin the multi-part cipher quest chain" },
        { type = "note",    text = "This chain involves visiting multiple locations across Shadowmoon Valley." },
        { type = "kill",    target = "Eclipsion Blood Elves",                      zone = "Shadowmoon Valley", x = 45.0, y = 38.0, text = "Defeat Eclipse Point blood elves for cipher fragments" },
        { type = "kill",    target = "Dragonmaw Orcs",                             zone = "Shadowmoon Valley", x = 64.0, y = 31.0, text = "Clear Dragonmaw forces in the eastern reaches" },
        { type = "hs",      text = "Hearthstone to Wildhammer Stronghold" },
        { type = "note",    text = "Continue quest chains until 70. Congratulations on reaching max level!" },
        { type = "note",    text = "Next steps: Karazhan attunement, heroic dungeon keys, faction rep grinds, arena prep!" },
    },
})
