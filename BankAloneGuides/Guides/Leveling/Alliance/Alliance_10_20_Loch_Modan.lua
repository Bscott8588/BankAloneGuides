-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 10-20: Loch Modan
-- Original routing for Dwarf/Gnome progression
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_10_20_LochModan", {
    title      = "Loch Modan (10-20)",
    faction    = "Alliance",
    levelRange = { 10, 20 },
    zone       = "Loch Modan",
    steps = {
        { type = "goto",    zone = "Loch Modan", x = 33.9, y = 50.9, text = "Enter Loch Modan from Dun Morogh through the south pass" },
        { type = "fp",      zone = "Loch Modan", x = 33.9, y = 50.9, text = "Grab the Thelsamar flight path" },
        { type = "note",    text = "Set your Hearthstone at the Stoutlager Inn in Thelsamar." },
        { type = "note",    text = "Pick up all quests in Thelsamar: trogg clearing, wildlife thinning, and dam patrol." },
        { type = "goto",    zone = "Loch Modan", x = 35.0, y = 43.0, text = "Head northeast to the trogg-infested areas" },
        { type = "kill",    target = "Stonesplinter Troggs",                      zone = "Loch Modan", x = 34.0, y = 42.0, text = "Clear troggs from their cave camps north of Thelsamar" },
        { type = "note",    text = "Swing east to the loch shores for fishing and wildlife quests." },
        { type = "goto",    zone = "Loch Modan", x = 47.0, y = 52.0, text = "Travel to the east shore of the loch for bear and boar tasks" },
        { type = "kill",    target = "Bears and Boars",                            zone = "Loch Modan", x = 48.0, y = 55.0, text = "Hunt bears and boars around the eastern lakeshore" },
        { type = "hs",      text = "Hearthstone to Thelsamar to turn in quests" },
        { type = "note",    text = "Pick up the follow-up quests. Head south toward the Algaz Station area." },
        { type = "goto",    zone = "Loch Modan", x = 25.0, y = 68.0, text = "Travel south to the dam/Algaz area" },
        { type = "kill",    target = "Dark Iron Dwarves",                          zone = "Loch Modan", x = 24.0, y = 72.0, text = "Deal with the Dark Iron saboteurs near the dam" },
        { type = "note",    text = "Complete remaining quests. Visit the excavation site on the northeast side of the zone." },
        { type = "goto",    zone = "Loch Modan", x = 64.0, y = 66.0, text = "Head to the Ironband's Excavation Site" },
        { type = "note",    text = "Work through the archaeological dig quests involving troggs and ancient relics." },
        { type = "hs",      text = "Hearth to Thelsamar" },
        { type = "note",    text = "At level 18-20, proceed to Wetlands or Redridge Mountains for next bracket." },
    },
})
