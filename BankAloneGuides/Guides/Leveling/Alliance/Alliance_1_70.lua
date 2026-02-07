local BAG = BankAlone
local Guides = BAG.Guides

Guides:RegisterGuide({
  id = "A_1_10_HUMAN",
  title = "Elwynn Forest Sprint (1-10)",
  faction = "Alliance",
  races = { "Human" },
  levelRange = { 1, 10 },
  zoneHints = { "Elwynn Forest", "Northshire Valley", "Goldshire" },
  steps = {
    { type = "travel", zone = "Elwynn Forest", x = 48.2, y = 42.9, text = "Report to the Northshire Abbey entrance.", complete = { type = "near", zone = "Elwynn Forest", x = 48.2, y = 42.9, radius = 20 } },
    { type = "accept", questId = 783, zone = "Elwynn Forest", x = 48.2, y = 42.9, text = "Accept quest 783 from the Abbey mentor." },
    { type = "kill", questId = 783, zone = "Elwynn Forest", x = 49.8, y = 38.5, text = "Clear nearby scouts and finish quest 783." },
    { type = "turnin", questId = 783, zone = "Elwynn Forest", x = 48.2, y = 42.9, text = "Return to the Abbey and turn in quest 783." },
    { type = "accept", questId = 7, zone = "Elwynn Forest", x = 48.9, y = 41.6, text = "Accept quest 7 for supplies from the valley." },
    { type = "collect", itemId = 2697, count = 6, zone = "Elwynn Forest", x = 50.5, y = 39.3, text = "Collect 6 supply candles for quest 7." },
    { type = "turnin", questId = 7, zone = "Elwynn Forest", x = 48.9, y = 41.6, text = "Turn in quest 7 at the deputy." },
    { type = "note", zone = "Elwynn Forest", x = 48.9, y = 41.6, text = "Train class skills and buy water if needed." },
    { type = "travel", zone = "Elwynn Forest", x = 42.1, y = 65.9, text = "Follow the road south to Goldshire.", complete = { type = "near", zone = "Elwynn Forest", x = 42.1, y = 65.9, radius = 25 } },
    { type = "hs", zone = "Elwynn Forest", x = 43.7, y = 65.9, text = "Set your hearthstone in Goldshire." },
  },
})

Guides:RegisterGuide({
  id = "A_1_10_DWARF_GNOME",
  title = "Dun Morogh Run (1-10)",
  faction = "Alliance",
  races = { "Dwarf", "Gnome" },
  levelRange = { 1, 10 },
  zoneHints = { "Dun Morogh", "Coldridge Valley" },
  steps = {
    { type = "travel", zone = "Dun Morogh", x = 29.9, y = 71.9, text = "Check in at the Coldridge gate.", complete = { type = "near", zone = "Dun Morogh", x = 29.9, y = 71.9, radius = 20 } },
    { type = "accept", questId = 179, zone = "Dun Morogh", x = 29.9, y = 71.9, text = "Accept quest 179 from the gate guard." },
    { type = "kill", questId = 179, zone = "Dun Morogh", x = 26.7, y = 74.8, text = "Clear nearby troggs for quest 179." },
    { type = "turnin", questId = 179, zone = "Dun Morogh", x = 29.9, y = 71.9, text = "Turn in quest 179 at the gate." },
    { type = "accept", questId = 233, zone = "Dun Morogh", x = 26.8, y = 74.9, text = "Accept quest 233 from the camp advisor." },
    { type = "collect", itemId = 2676, count = 6, zone = "Dun Morogh", x = 24.7, y = 75.4, text = "Collect 6 boar meat for the camp cook." },
    { type = "turnin", questId = 233, zone = "Dun Morogh", x = 26.8, y = 74.9, text = "Return supplies and turn in quest 233." },
    { type = "note", zone = "Dun Morogh", x = 28.4, y = 67.4, text = "Train class skills before heading to Kharanos." },
    { type = "travel", zone = "Dun Morogh", x = 47.3, y = 52.3, text = "Travel to Kharanos for the next hub.", complete = { type = "near", zone = "Dun Morogh", x = 47.3, y = 52.3, radius = 25 } },
  },
})

Guides:RegisterGuide({
  id = "A_1_10_NIGHTELF",
  title = "Teldrassil Trail (1-10)",
  faction = "Alliance",
  races = { "NightElf" },
  levelRange = { 1, 10 },
  zoneHints = { "Teldrassil", "Shadowglen" },
  steps = {
    { type = "travel", zone = "Teldrassil", x = 58.6, y = 44.9, text = "Meet the scout at Shadowglen.", complete = { type = "near", zone = "Teldrassil", x = 58.6, y = 44.9, radius = 20 } },
    { type = "accept", questId = 456, zone = "Teldrassil", x = 58.6, y = 44.9, text = "Accept quest 456 to clear the grove." },
    { type = "kill", questId = 456, zone = "Teldrassil", x = 56.9, y = 44.1, text = "Remove the nearby threats and finish quest 456." },
    { type = "turnin", questId = 456, zone = "Teldrassil", x = 58.6, y = 44.9, text = "Return to Ilthalaine and turn in quest 456." },
    { type = "accept", questId = 458, zone = "Teldrassil", x = 57.8, y = 41.7, text = "Accept quest 458 to study the area." },
    { type = "collect", itemId = 2694, count = 6, zone = "Teldrassil", x = 57.1, y = 42.5, text = "Collect 6 vine samples for quest 458." },
    { type = "turnin", questId = 458, zone = "Teldrassil", x = 57.8, y = 41.7, text = "Turn in quest 458 near the moonwell." },
    { type = "note", zone = "Teldrassil", x = 57.6, y = 45.2, text = "Train and restock before leaving Shadowglen." },
    { type = "travel", zone = "Teldrassil", x = 55.7, y = 52.0, text = "Move toward Dolanaar for the next hub.", complete = { type = "near", zone = "Teldrassil", x = 55.7, y = 52.0, radius = 25 } },
  },
})

Guides:RegisterGuide({
  id = "A_1_10_DRAENEI",
  title = "Azuremyst Rescue (1-10)",
  faction = "Alliance",
  races = { "Draenei" },
  levelRange = { 1, 10 },
  zoneHints = { "Azuremyst Isle", "Ammen Vale" },
  steps = {
    { type = "travel", zone = "Azuremyst Isle", x = 48.4, y = 50.3, text = "Meet the crash site coordinator.", complete = { type = "near", zone = "Azuremyst Isle", x = 48.4, y = 50.3, radius = 20 } },
    { type = "accept", questId = 9463, zone = "Azuremyst Isle", x = 48.4, y = 50.3, text = "Accept quest 9463 for recovery supplies." },
    { type = "collect", itemId = 2364, count = 6, zone = "Azuremyst Isle", x = 47.0, y = 50.5, text = "Gather 6 salvage kits for quest 9463." },
    { type = "turnin", questId = 9463, zone = "Azuremyst Isle", x = 48.4, y = 50.3, text = "Turn in quest 9463 at the crash site." },
    { type = "accept", questId = 9675, zone = "Azuremyst Isle", x = 48.4, y = 50.3, text = "Accept quest 9675 to collect plant samples." },
    { type = "collect", itemId = 24414, count = 6, zone = "Azuremyst Isle", x = 48.2, y = 46.6, text = "Collect 6 flora samples for quest 9675." },
    { type = "turnin", questId = 9675, zone = "Azuremyst Isle", x = 48.4, y = 50.3, text = "Return to the coordinator and turn in quest 9675." },
    { type = "note", zone = "Azuremyst Isle", x = 50.0, y = 47.3, text = "Train class skills before moving toward Azure Watch." },
    { type = "travel", zone = "Azuremyst Isle", x = 49.8, y = 51.9, text = "Head to Azure Watch for the next hub.", complete = { type = "near", zone = "Azuremyst Isle", x = 49.8, y = 51.9, radius = 25 } },
  },
})

Guides:RegisterGuide({
  id = "A_10_20_ALLIANCE",
  title = "Alliance Footholds (10-20)",
  faction = "Alliance",
  levelRange = { 10, 20 },
  zoneHints = { "Westfall", "Loch Modan", "Redridge Mountains" },
  steps = {
    { type = "travel", zone = "Westfall", x = 56.3, y = 47.5, text = "Ride to Sentinel Hill and secure the hub.", complete = { type = "near", zone = "Westfall", x = 56.3, y = 47.5, radius = 25 } },
    { type = "accept", questId = 36, zone = "Westfall", x = 56.3, y = 47.5, text = "Accept a patrol quest at Sentinel Hill." },
    { type = "kill", questId = 36, zone = "Westfall", x = 53.8, y = 33.4, text = "Clear raiders along the farms for quest 36." },
    { type = "turnin", questId = 36, zone = "Westfall", x = 56.3, y = 47.5, text = "Turn in the patrol quest at Sentinel Hill." },
    { type = "fp", zone = "Westfall", x = 56.6, y = 52.6, text = "Pick up the Sentinel Hill flight path." },
    { type = "travel", zone = "Loch Modan", x = 32.6, y = 50.3, text = "Travel to Thelsamar and stabilize the northern route.", complete = { type = "near", zone = "Loch Modan", x = 32.6, y = 50.3, radius = 25 } },
    { type = "accept", questId = 6387, zone = "Loch Modan", x = 33.9, y = 50.9, text = "Accept a lake patrol quest in Thelsamar." },
    { type = "note", zone = "Loch Modan", x = 34.1, y = 46.5, text = "Focus on multi-quest loops to minimize travel time." },
  },
})

Guides:RegisterGuide({
  id = "A_20_30_ALLIANCE",
  title = "Redridge and Duskwood (20-30)",
  faction = "Alliance",
  levelRange = { 20, 30 },
  zoneHints = { "Redridge Mountains", "Duskwood" },
  steps = {
    { type = "travel", zone = "Redridge Mountains", x = 30.7, y = 59.4, text = "Report to Lakeshire in Redridge.", complete = { type = "near", zone = "Redridge Mountains", x = 30.7, y = 59.4, radius = 25 } },
    { type = "accept", questId = 54, zone = "Redridge Mountains", x = 30.7, y = 59.4, text = "Accept quest 54 to join the local watch." },
    { type = "kill", questId = 54, zone = "Redridge Mountains", x = 34.9, y = 65.7, text = "Secure the road and finish quest 54." },
    { type = "turnin", questId = 54, zone = "Redridge Mountains", x = 30.7, y = 59.4, text = "Turn in quest 54 in Lakeshire." },
    { type = "travel", zone = "Duskwood", x = 73.5, y = 46.8, text = "Ride into Duskwood and check in at Darkshire.", complete = { type = "near", zone = "Duskwood", x = 73.5, y = 46.8, radius = 25 } },
    { type = "accept", questId = 58, zone = "Duskwood", x = 73.5, y = 46.8, text = "Accept a supply quest at Darkshire." },
    { type = "note", zone = "Duskwood", x = 72.8, y = 46.7, text = "Focus on clustered objectives to avoid nighttime patrols." },
    { type = "turnin", questId = 58, zone = "Duskwood", x = 73.5, y = 46.8, text = "Turn in the supply quest before moving on." },
  },
})

Guides:RegisterGuide({
  id = "A_30_40_ALLIANCE",
  title = "Stranglethorn Approach (30-40)",
  faction = "Alliance",
  levelRange = { 30, 40 },
  zoneHints = { "Stranglethorn Vale", "Arathi Highlands" },
  steps = {
    { type = "travel", zone = "Stranglethorn Vale", x = 26.8, y = 77.2, text = "Set up in Booty Bay for supplies and travel.", complete = { type = "near", zone = "Stranglethorn Vale", x = 26.8, y = 77.2, radius = 25 } },
    { type = "fp", zone = "Stranglethorn Vale", x = 27.5, y = 77.8, text = "Grab the Booty Bay flight path." },
    { type = "accept", questId = 583, zone = "Stranglethorn Vale", x = 28.1, y = 77.6, text = "Pick up a jungle scouting quest from the docks." },
    { type = "kill", questId = 583, zone = "Stranglethorn Vale", x = 34.0, y = 36.5, text = "Clear jungle threats and finish quest 583." },
    { type = "turnin", questId = 583, zone = "Stranglethorn Vale", x = 28.1, y = 77.6, text = "Turn in quest 583 back at Booty Bay." },
    { type = "travel", zone = "Arathi Highlands", x = 45.8, y = 47.6, text = "Detour to Refuge Pointe for quick combat quests.", complete = { type = "near", zone = "Arathi Highlands", x = 45.8, y = 47.6, radius = 25 } },
    { type = "note", zone = "Arathi Highlands", x = 46.6, y = 47.0, text = "Complete any nearby elite tasks with a group if available." },
  },
})

Guides:RegisterGuide({
  id = "A_40_50_ALLIANCE",
  title = "Desert Circuit (40-50)",
  faction = "Alliance",
  levelRange = { 40, 50 },
  zoneHints = { "Tanaris", "Feralas" },
  steps = {
    { type = "travel", zone = "Tanaris", x = 51.6, y = 27.9, text = "Enter Gadgetzan and secure the hub.", complete = { type = "near", zone = "Tanaris", x = 51.6, y = 27.9, radius = 25 } },
    { type = "fp", zone = "Tanaris", x = 51.0, y = 29.3, text = "Pick up the Gadgetzan flight path." },
    { type = "accept", questId = 1690, zone = "Tanaris", x = 52.4, y = 28.5, text = "Accept a desert scouting quest from the inn." },
    { type = "kill", questId = 1690, zone = "Tanaris", x = 43.5, y = 35.0, text = "Clear dune threats for quest 1690." },
    { type = "turnin", questId = 1690, zone = "Tanaris", x = 52.4, y = 28.5, text = "Turn in quest 1690 at Gadgetzan." },
    { type = "travel", zone = "Feralas", x = 45.0, y = 44.7, text = "Move to Feathermoon Stronghold for the next loop.", complete = { type = "near", zone = "Feralas", x = 45.0, y = 44.7, radius = 25 } },
    { type = "note", zone = "Feralas", x = 46.3, y = 45.2, text = "Prioritize quests with shared travel to reduce downtime." },
  },
})

Guides:RegisterGuide({
  id = "A_50_58_ALLIANCE",
  title = "Northern Push (50-58)",
  faction = "Alliance",
  levelRange = { 50, 58 },
  zoneHints = { "Felwood", "Winterspring", "Western Plaguelands" },
  steps = {
    { type = "travel", zone = "Felwood", x = 54.1, y = 86.8, text = "Enter Felwood and set up at the southern camp.", complete = { type = "near", zone = "Felwood", x = 54.1, y = 86.8, radius = 25 } },
    { type = "accept", questId = 5155, zone = "Felwood", x = 54.1, y = 86.8, text = "Accept a corruption-clearing quest at the camp." },
    { type = "kill", questId = 5155, zone = "Felwood", x = 48.0, y = 78.5, text = "Clear corrupted beasts for quest 5155." },
    { type = "turnin", questId = 5155, zone = "Felwood", x = 54.1, y = 86.8, text = "Return to camp and turn in quest 5155." },
    { type = "travel", zone = "Winterspring", x = 61.2, y = 38.6, text = "Ride into Winterspring and visit Everlook.", complete = { type = "near", zone = "Winterspring", x = 61.2, y = 38.6, radius = 25 } },
    { type = "note", zone = "Winterspring", x = 60.8, y = 38.7, text = "Complete clustered quests around Everlook for fast XP." },
    { type = "travel", zone = "Western Plaguelands", x = 42.9, y = 84.8, text = "Move to Chillwind Camp for the final Azeroth push.", complete = { type = "near", zone = "Western Plaguelands", x = 42.9, y = 84.8, radius = 25 } },
  },
})

Guides:RegisterGuide({
  id = "A_58_60_ALLIANCE",
  title = "Portal Preparation (58-60)",
  faction = "Alliance",
  levelRange = { 58, 60 },
  zoneHints = { "Blasted Lands", "Hellfire Peninsula" },
  steps = {
    { type = "travel", zone = "Blasted Lands", x = 60.3, y = 14.3, text = "Head to Nethergarde Keep and gather portal prep tasks.", complete = { type = "near", zone = "Blasted Lands", x = 60.3, y = 14.3, radius = 25 } },
    { type = "accept", questId = 10120, zone = "Blasted Lands", x = 60.3, y = 14.3, text = "Accept quest 10120 before entering the portal." },
    { type = "travel", zone = "Hellfire Peninsula", x = 87.3, y = 50.8, text = "Enter the Dark Portal and arrive in Hellfire Peninsula.", complete = { type = "near", zone = "Hellfire Peninsula", x = 87.3, y = 50.8, radius = 30 } },
    { type = "turnin", questId = 10120, zone = "Hellfire Peninsula", x = 87.3, y = 50.8, text = "Turn in quest 10120 at the portal base camp." },
    { type = "fp", zone = "Hellfire Peninsula", x = 54.6, y = 62.8, text = "Secure the Honor Hold flight path." },
    { type = "note", zone = "Hellfire Peninsula", x = 56.6, y = 63.8, text = "Stock up on supplies and prepare for Outland routes." },
  },
})

Guides:RegisterGuide({
  id = "A_60_70_ALLIANCE",
  title = "Outland Command Route (60-70)",
  faction = "Alliance",
  levelRange = { 60, 70 },
  zoneHints = { "Hellfire Peninsula", "Zangarmarsh", "Terokkar Forest", "Nagrand", "Blade's Edge Mountains", "Netherstorm", "Shadowmoon Valley" },
  steps = {
    { type = "accept", questId = 10121, zone = "Hellfire Peninsula", x = 56.6, y = 63.8, text = "Pick up the Hellfire perimeter quest 10121." },
    { type = "kill", questId = 10121, zone = "Hellfire Peninsula", x = 62.0, y = 60.0, text = "Clear the perimeter and finish quest 10121." },
    { type = "turnin", questId = 10121, zone = "Hellfire Peninsula", x = 56.6, y = 63.8, text = "Return to Honor Hold and turn in quest 10121." },
    { type = "travel", zone = "Zangarmarsh", x = 78.4, y = 63.0, text = "Move into Zangarmarsh and establish the hub.", complete = { type = "near", zone = "Zangarmarsh", x = 78.4, y = 63.0, radius = 25 } },
    { type = "accept", questId = 9785, zone = "Zangarmarsh", x = 78.4, y = 63.0, text = "Accept quest 9785 to scan the marsh channels." },
    { type = "turnin", questId = 9785, zone = "Zangarmarsh", x = 78.4, y = 63.0, text = "Turn in quest 9785 before heading north." },
    { type = "travel", zone = "Terokkar Forest", x = 57.4, y = 55.5, text = "Ride to Shattrath City and bind your hearth.", complete = { type = "near", zone = "Terokkar Forest", x = 57.4, y = 55.5, radius = 30 } },
    { type = "travel", zone = "Nagrand", x = 54.2, y = 75.0, text = "Head to Telaar and pick up hunting quests.", complete = { type = "near", zone = "Nagrand", x = 54.2, y = 75.0, radius = 25 } },
    { type = "travel", zone = "Blade's Edge Mountains", x = 37.0, y = 63.5, text = "Advance into Blade's Edge for high-yield XP.", complete = { type = "near", zone = "Blade's Edge Mountains", x = 37.0, y = 63.5, radius = 25 } },
    { type = "travel", zone = "Netherstorm", x = 32.1, y = 64.2, text = "Move to Area 52 for the final circuit.", complete = { type = "near", zone = "Netherstorm", x = 32.1, y = 64.2, radius = 25 } },
    { type = "note", zone = "Shadowmoon Valley", x = 39.6, y = 53.7, text = "Finish at Shadowmoon with elite group quests if available." },
  },
})
