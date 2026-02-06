-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 1-10: Elwynn Forest
-- Original routing for Human starting experience
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_01_10_Elwynn", {
    title      = "Elwynn Forest (1-10)",
    faction    = "Alliance",
    levelRange = { 1, 10 },
    zone       = "Elwynn Forest",
    steps = {
        { type = "accept",  questID = 783,  questName = "Eagan Peltskinner",      zone = "Elwynn Forest", x = 48.9, y = 40.2, text = "Speak with Eagan near the abbey entrance" },
        { type = "accept",  questID = 7,    questName = "Kobold Camp Cleanup",     zone = "Elwynn Forest", x = 48.2, y = 42.1, text = "Get the kobold extermination task from Marshal McBride" },
        { type = "kill",    target = "Kobold Vermin",                              zone = "Elwynn Forest", x = 47.0, y = 37.0, text = "Defeat kobold vermin around the Northshire vineyard area" },
        { type = "collect", itemID = 5051,  count = 4, itemName = "Lean Wolf Flank", zone = "Elwynn Forest", x = 47.5, y = 38.5, text = "Gather wolf flanks from the prowling wolves nearby" },
        { type = "turnin",  questID = 783,  questName = "Eagan Peltskinner",      zone = "Elwynn Forest", x = 48.9, y = 40.2, text = "Return to Eagan with the pelts" },
        { type = "turnin",  questID = 7,    questName = "Kobold Camp Cleanup",     zone = "Elwynn Forest", x = 48.2, y = 42.1, text = "Report to Marshal McBride" },
        { type = "accept",  questID = 15,   questName = "Investigate Echo Ridge",  zone = "Elwynn Forest", x = 48.2, y = 42.1, text = "Take the Echo Ridge Mine investigation from McBride" },
        { type = "goto",    zone = "Elwynn Forest", x = 50.2, y = 32.4, text = "Head north to the Echo Ridge Mine entrance" },
        { type = "kill",    target = "Kobold Workers",                             zone = "Elwynn Forest", x = 50.5, y = 31.0, text = "Clear the kobold workers inside the mine" },
        { type = "turnin",  questID = 15,   questName = "Investigate Echo Ridge",  zone = "Elwynn Forest", x = 48.2, y = 42.1, text = "Report back to McBride at Northshire Abbey" },
        { type = "note",    text = "You should be level 4-5 now. Train new abilities at your class trainer inside the Abbey." },
        { type = "accept",  questID = 21,   questName = "Report to Goldshire",     zone = "Elwynn Forest", x = 48.2, y = 42.1, text = "Get the Goldshire report quest from McBride" },
        { type = "goto",    zone = "Elwynn Forest", x = 42.1, y = 65.9, text = "Follow the road south through the forest to Goldshire" },
        { type = "fp",      zone = "Elwynn Forest", x = 41.8, y = 64.6, text = "Grab the Goldshire flight path on your way through" },
        { type = "turnin",  questID = 21,   questName = "Report to Goldshire",     zone = "Elwynn Forest", x = 42.1, y = 65.9, text = "Speak with Marshal Dughan in Goldshire" },
        { type = "note",    text = "Set your Hearthstone to the Lion's Pride Inn in Goldshire." },
        { type = "accept",  questID = 54,   questName = "Protect the Frontier",    zone = "Elwynn Forest", x = 42.1, y = 65.9, text = "Take the wildlife management task from Dughan" },
        { type = "kill",    target = "Young Forest Bears & Prowlers", zone = "Elwynn Forest", x = 38.0, y = 62.0, text = "Thin the aggressive bears and nightsaber prowlers west of Goldshire" },
        { type = "turnin",  questID = 54,   questName = "Protect the Frontier",    zone = "Elwynn Forest", x = 42.1, y = 65.9, text = "Return to Marshal Dughan" },
        { type = "accept",  questID = 40,   questName = "A Fishy Peril",           zone = "Elwynn Forest", x = 42.1, y = 65.9, text = "Investigate the murloc reports from Dughan" },
        { type = "goto",    zone = "Elwynn Forest", x = 50.8, y = 60.4, text = "Head east toward Crystal Lake to scout the murloc camps" },
        { type = "kill",    target = "Murlocs",                                    zone = "Elwynn Forest", x = 51.5, y = 58.0, text = "Defeat murlocs along Crystal Lake's shore" },
        { type = "accept",  questID = 83,   questName = "Riverpaw Bandits",        zone = "Elwynn Forest", x = 42.1, y = 65.9, text = "Take the gnoll bounty task" },
        { type = "goto",    zone = "Elwynn Forest", x = 29.0, y = 71.0, text = "Travel west toward the forest border where gnolls camp" },
        { type = "kill",    target = "Riverpaw Gnolls",                            zone = "Elwynn Forest", x = 28.5, y = 73.0, text = "Defeat riverpaw gnolls at their western encampment" },
        { type = "turnin",  questID = 83,   questName = "Riverpaw Bandits",        zone = "Elwynn Forest", x = 42.1, y = 65.9, text = "Return to Goldshire with the bounty proof" },
        { type = "goto",    zone = "Elwynn Forest", x = 73.9, y = 72.2, text = "Run east along the road to the Eastvale Logging Camp" },
        { type = "note",    text = "Pick up any quests at the Eastvale Logging Camp and Brackwell Pumpkin Patch area." },
        { type = "note",    text = "Grind to level 10. Once 10, head to Stormwind City for class quests and then proceed to Westfall." },
        { type = "goto",    zone = "Stormwind City", x = 66.2, y = 62.4, text = "Enter Stormwind City through the main gates and grab the flight path" },
        { type = "fp",      zone = "Stormwind City", text = "Get the Stormwind flight path if you haven't already" },
        { type = "note",    text = "Train all available skills. You're ready for the 10-20 bracket!" },
    },
})
