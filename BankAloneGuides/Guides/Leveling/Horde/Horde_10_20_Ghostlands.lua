-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 10-20: Ghostlands
-- Original routing for Blood Elf progression
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_10_20_Ghostlands", {
    title      = "Ghostlands (10-20)",
    faction    = "Horde",
    levelRange = { 10, 20 },
    zone       = "Ghostlands",
    steps = {
        { type = "goto",    zone = "Ghostlands", x = 44.8, y = 14.0, text = "Enter Ghostlands from southern Eversong Woods" },
        { type = "fp",      zone = "Ghostlands", text = "Grab the Tranquillien flight path" },
        { type = "note",    text = "Set your Hearthstone at the Tranquillien inn." },
        { type = "note",    text = "Accept all Tranquillien quests: troll attacks, undead scouts, and forest corruption." },
        { type = "kill",    target = "Amani Trolls",                               zone = "Ghostlands", x = 68.0, y = 26.0, text = "Assault the Amani troll camps east of Tranquillien" },
        { type = "kill",    target = "Risen Dead along the Dead Scar",             zone = "Ghostlands", x = 40.0, y = 30.0, text = "Clear undead along the Dead Scar path" },
        { type = "note",    text = "Work through the Sanctum quests — Sanctum of the Sun and Sanctum of the Moon." },
        { type = "goto",    zone = "Ghostlands", x = 55.0, y = 48.0, text = "Head to the southern Sanctum area" },
        { type = "kill",    target = "Deatholme Agents",                           zone = "Ghostlands", x = 35.0, y = 73.0, text = "Battle the Scourge forces at Deatholme in the south" },
        { type = "note",    text = "The final Ghostlands quest chain involves assaulting Deatholme — bring friends or be well-geared." },
        { type = "hs",      text = "Hearthstone to Tranquillien" },
        { type = "note",    text = "Complete remaining quests. The zone reward is an excellent blue item at quest chain completion." },
        { type = "note",    text = "At 20, head to The Barrens or Hillsbrad Foothills for the next bracket." },
    },
})
