-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 30-40: STV & Arathi
-- Original routing for contested zone leveling
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_30_40_STV_Arathi", {
    title      = "STV & Arathi (30-40)",
    faction    = "Horde",
    levelRange = { 30, 40 },
    zone       = "Stranglethorn Vale",
    steps = {
        { type = "fly",     destination = "Grom'gol Base Camp", zone = "Stranglethorn Vale", text = "Take the zeppelin or fly to Grom'gol Base Camp" },
        { type = "fp",      zone = "Stranglethorn Vale", text = "Grab the Grom'gol flight path" },
        { type = "note",    text = "Set Hearthstone at Grom'gol. Pick up all quests." },
        { type = "note",    text = "Also head north to the Nesingwary camp for the hunting quest chains." },
        { type = "kill",    target = "Young Stranglethorn Tigers",                 zone = "Stranglethorn Vale", x = 32.0, y = 16.0, text = "Hunt tigers for the Nesingwary safari series" },
        { type = "kill",    target = "Stranglethorn Raptors",                      zone = "Stranglethorn Vale", x = 29.0, y = 19.0, text = "Track and hunt raptors for the next chapter" },
        { type = "kill",    target = "Panthers",                                   zone = "Stranglethorn Vale", x = 35.0, y = 25.0, text = "Hunt black panthers in the mid-STV jungle" },
        { type = "goto",    zone = "Stranglethorn Vale", x = 47.0, y = 42.0, text = "Head east for the Skullsplitter troll quests" },
        { type = "kill",    target = "Skullsplitter Trolls",                       zone = "Stranglethorn Vale", x = 48.0, y = 43.0, text = "Assault the Skullsplitter tribal camps" },
        { type = "goto",    zone = "Stranglethorn Vale", x = 27.0, y = 77.0, text = "Head south to Booty Bay" },
        { type = "fp",      zone = "Stranglethorn Vale", text = "Get the Booty Bay flight path" },
        { type = "note",    text = "Pick up Booty Bay quests and pirate bounties." },
        { type = "kill",    target = "Bloodsail Buccaneers",                       zone = "Stranglethorn Vale", x = 30.0, y = 82.0, text = "Clear pirate camps along the southern coast" },
        { type = "hs",      text = "Hearthstone to Grom'gol" },

        -- Side trip to Arathi Highlands
        { type = "note",    text = "At 35-36, take a trip to Arathi Highlands for extra quests." },
        { type = "fly",     destination = "Hammerfall", zone = "Arathi Highlands", text = "Fly to Hammerfall in Arathi Highlands" },
        { type = "fp",      zone = "Arathi Highlands", text = "Get the Hammerfall flight path" },
        { type = "note",    text = "Pick up troll and ogre bounty quests." },
        { type = "kill",    target = "Witherbark Trolls",                          zone = "Arathi Highlands", x = 63.0, y = 68.0, text = "Clear the Witherbark troll village" },
        { type = "kill",    target = "Boulderfist Ogres",                          zone = "Arathi Highlands", x = 55.0, y = 60.0, text = "Defeat Boulderfist ogres in the southeastern caves" },
        { type = "note",    text = "Return to STV and continue until 40. Get your mount from your capital city!" },
    },
})
