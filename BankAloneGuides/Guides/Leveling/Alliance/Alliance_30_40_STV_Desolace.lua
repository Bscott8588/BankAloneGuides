-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 30-40: Stranglethorn & Desolace
-- Original routing through contested mid-level zones
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_30_40_STV_Desolace", {
    title      = "STV & Desolace (30-40)",
    faction    = "Alliance",
    levelRange = { 30, 40 },
    zone       = "Stranglethorn Vale",
    steps = {
        { type = "fly",     destination = "Rebel Camp", zone = "Stranglethorn Vale", text = "Fly to the Rebel Camp in northern Stranglethorn Vale" },
        { type = "fp",      zone = "Stranglethorn Vale", text = "Get the Rebel Camp flight path" },
        { type = "note",    text = "Pick up Nesingwary's hunting quests and Rebel Camp tasks." },
        { type = "kill",    target = "Young Panthers",                            zone = "Stranglethorn Vale", x = 39.0, y = 10.0, text = "Hunt panthers for Nesingwary's first chapter" },
        { type = "kill",    target = "Young Tigers",                              zone = "Stranglethorn Vale", x = 34.0, y = 12.0, text = "Hunt tigers for the safari challenge" },
        { type = "kill",    target = "Lashtail Raptors",                          zone = "Stranglethorn Vale", x = 28.0, y = 15.0, text = "Defeat raptors for the raptor hunting quest" },
        { type = "note",    text = "Work south along STV, combining Nesingwary chapters with local quests." },
        { type = "goto",    zone = "Stranglethorn Vale", x = 35.0, y = 35.0, text = "Move to mid-STV for troll-related objectives" },
        { type = "kill",    target = "Skullsplitter Trolls",                      zone = "Stranglethorn Vale", x = 46.0, y = 40.0, text = "Clear the troll camps east of the road" },
        { type = "goto",    zone = "Stranglethorn Vale", x = 27.0, y = 77.0, text = "Head to Booty Bay at the southern tip" },
        { type = "fp",      zone = "Stranglethorn Vale", text = "Grab the Booty Bay flight path" },
        { type = "note",    text = "Set Hearthstone to Booty Bay for the southern half of STV." },
        { type = "note",    text = "Pick up Booty Bay quests and pirate bounties." },
        { type = "kill",    target = "Bloodsail Pirates",                         zone = "Stranglethorn Vale", x = 30.0, y = 80.0, text = "Defeat Bloodsail pirates along the southern coast" },
        { type = "hs",      text = "Hearthstone to Booty Bay" },
        { type = "note",    text = "Continue STV quests until 37-38. Then consider a trip to Desolace for bonus XP." },
        { type = "fly",     destination = "Nijel's Point", zone = "Desolace", text = "Fly to Nijel's Point in Desolace (via Stormwind if needed)" },
        { type = "fp",      zone = "Desolace", text = "Grab the Nijel's Point flight path" },
        { type = "note",    text = "Work the centaur faction quests and demon hunting objectives in Desolace." },
        { type = "kill",    target = "Gelkis/Magram Centaurs",                    zone = "Desolace", x = 56.0, y = 60.0, text = "Work centaur quests in the southern plains" },
        { type = "kill",    target = "Burning Blade Demons",                      zone = "Desolace", x = 54.0, y = 27.0, text = "Clear demon camps in Mannoroc Coven" },
        { type = "note",    text = "At 40, return to Stormwind for mount training (if available) and new skills." },
    },
})
