-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 1-10: Dun Morogh
-- Original routing for Dwarf/Gnome starting experience
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_01_10_DunMorogh", {
    title      = "Dun Morogh (1-10)",
    faction    = "Alliance",
    levelRange = { 1, 10 },
    zone       = "Dun Morogh",
    steps = {
        { type = "accept",  questID = 170,  questName = "A New Threat",          zone = "Dun Morogh", x = 46.6, y = 53.4, text = "Speak with Grelin Whitebeard at the Coldridge Valley cave" },
        { type = "accept",  questID = 179,  questName = "Dwarven Outfitters",    zone = "Dun Morogh", x = 46.6, y = 53.4, text = "Take the pelt-gathering task from the nearby outfitter" },
        { type = "kill",    target = "Troggs",                                   zone = "Dun Morogh", x = 44.0, y = 55.0, text = "Defeat the troggs emerging from the cave systems south of camp" },
        { type = "collect", itemID = 5051,  count = 6, itemName = "Tough Wolf Meat", zone = "Dun Morogh", x = 47.0, y = 50.0, text = "Gather supplies from the wolves and boars in the valley" },
        { type = "turnin",  questID = 170,  questName = "A New Threat",          zone = "Dun Morogh", x = 46.6, y = 53.4, text = "Report back to Grelin" },
        { type = "turnin",  questID = 179,  questName = "Dwarven Outfitters",    zone = "Dun Morogh", x = 46.6, y = 53.4, text = "Turn in the pelts" },
        { type = "accept",  questID = 218,  questName = "Ice and Fire",          zone = "Dun Morogh", x = 46.6, y = 53.4, text = "Take the next task involving the sealed cave" },
        { type = "goto",    zone = "Dun Morogh", x = 42.5, y = 54.8, text = "Head west to the cave entrance marked for sealing" },
        { type = "turnin",  questID = 218,  questName = "Ice and Fire",          zone = "Dun Morogh", x = 46.6, y = 53.4, text = "Return and report the cave sealed" },
        { type = "note",    text = "You should be around level 5. Follow the road north out of Coldridge Valley." },
        { type = "goto",    zone = "Dun Morogh", x = 53.4, y = 50.6, text = "Travel through the tunnel to Kharanos" },
        { type = "accept",  questID = 313,  questName = "Kharanos Hub",          zone = "Dun Morogh", x = 46.8, y = 52.4, text = "Pick up available quests at the Kharanos inn" },
        { type = "note",    text = "Set your Hearthstone to the Thunderbrew Distillery in Kharanos." },
        { type = "fp",      zone = "Dun Morogh", text = "Grab the Kharanos flight path" },
        { type = "note",    text = "Complete quests around Kharanos: trolls, wendigos, and cave exploration tasks." },
        { type = "kill",    target = "Frostmane Trolls",                         zone = "Dun Morogh", x = 42.0, y = 49.0, text = "Clear out the frostmane troll camps west of Kharanos" },
        { type = "kill",    target = "Wendigos",                                 zone = "Dun Morogh", x = 38.0, y = 44.0, text = "Deal with wendigos in the western caves" },
        { type = "note",    text = "Grind to 10. Visit Ironforge for class training and the flight path." },
        { type = "goto",    zone = "Ironforge", x = 55.5, y = 47.8, text = "Enter Ironforge and grab the flight path" },
        { type = "fp",      zone = "Ironforge", text = "Get the Ironforge flight path" },
        { type = "note",    text = "Train skills at your class trainer. Ready for the 10-20 zones: Loch Modan!" },
    },
})
