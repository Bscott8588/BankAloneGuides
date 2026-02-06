-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 69-70: Shadowmoon Valley
-- Original routing for the final push to 70
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_69_70_Shadowmoon", {
    title      = "Shadowmoon Valley (69-70)",
    faction    = "Horde",
    levelRange = { 69, 70 },
    zone       = "Shadowmoon Valley",
    steps = {
        { type = "fly",     destination = "Shadowmoon Village", zone = "Shadowmoon Valley", text = "Fly to Shadowmoon Village (Horde hub)" },
        { type = "fp",      zone = "Shadowmoon Valley", text = "Grab the Shadowmoon Village flight path" },
        { type = "note",    text = "Set your Hearthstone at Shadowmoon Village." },
        { type = "note",    text = "Pick up all quests: demon hunting, hand of Gul'dan investigation, and cipher fragments." },
        { type = "accept",  questID = 10568, questName = "Assault on Dark Portal Remnants", zone = "Shadowmoon Valley", x = 30.0, y = 32.0, text = "Begin the Legion assault chain" },
        { type = "kill",    target = "Legion Forces",                              zone = "Shadowmoon Valley", x = 25.0, y = 40.0, text = "Assault the Legion Forward camp" },
        { type = "turnin",  questID = 10568, questName = "Assault on Dark Portal Remnants", zone = "Shadowmoon Valley", x = 30.0, y = 32.0, text = "Report the assault complete" },
        { type = "note",    text = "Work the Netherwing ledge quest introduction for future daily mount grinding." },
        { type = "goto",    zone = "Shadowmoon Valley", x = 65.0, y = 86.0, text = "Check out the Netherwing Ledge at the southeast edge" },
        { type = "note",    text = "Begin the Oronok Torn-heart quest chain — the Cipher of Damnation." },
        { type = "accept",  questID = 10570, questName = "The Cipher of Damnation", zone = "Shadowmoon Valley", x = 53.8, y = 23.4, text = "Start the multi-part cipher chain" },
        { type = "kill",    target = "Eclipsion Blood Elves",                      zone = "Shadowmoon Valley", x = 47.0, y = 36.0, text = "Defeat Eclipse Point forces for cipher pieces" },
        { type = "kill",    target = "Dragonmaw Orcs",                             zone = "Shadowmoon Valley", x = 66.0, y = 34.0, text = "Clear Dragonmaw clan enemies" },
        { type = "note",    text = "Complete the Cipher chain across multiple Shadowmoon locations." },
        { type = "hs",      text = "Hearthstone to Shadowmoon Village" },
        { type = "note",    text = "Continue quests until 70. Congratulations on hitting max level!" },
        { type = "note",    text = "Next: Karazhan attunement, heroic dungeon keys, reputation grinds, arena preparation!" },
    },
})
