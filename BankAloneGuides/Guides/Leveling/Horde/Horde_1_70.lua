local BAG = BankAlone
local Guides = BAG.Guides

Guides:RegisterGuide({
  id = "H_1_10_ORC_TROLL",
  title = "Durotar March (1-10)",
  faction = "Horde",
  races = { "Orc", "Troll" },
  levelRange = { 1, 10 },
  zoneHints = { "Durotar", "Valley of Trials" },
  steps = {
    { type = "travel", zone = "Durotar", x = 42.1, y = 68.2, text = "Check in at the Valley of Trials.", complete = { type = "near", zone = "Durotar", x = 42.1, y = 68.2, radius = 20 } },
    { type = "accept", questId = 4641, zone = "Durotar", x = 42.1, y = 68.2, text = "Accept quest 4641 from the trainer." },
    { type = "kill", questId = 4641, zone = "Durotar", x = 40.6, y = 67.4, text = "Clear the valley threats for quest 4641." },
    { type = "turnin", questId = 4641, zone = "Durotar", x = 42.1, y = 68.2, text = "Return and turn in quest 4641." },
    { type = "accept", questId = 788, zone = "Durotar", x = 42.1, y = 68.2, text = "Accept quest 788 to gather supplies." },
    { type = "collect", itemId = 2266, count = 6, zone = "Durotar", x = 44.9, y = 70.0, text = "Collect 6 supply pouches for quest 788." },
    { type = "turnin", questId = 788, zone = "Durotar", x = 42.1, y = 68.2, text = "Turn in quest 788 at the camp." },
    { type = "note", zone = "Durotar", x = 44.5, y = 68.6, text = "Train class skills and stock up before leaving." },
    { type = "travel", zone = "Durotar", x = 52.0, y = 43.5, text = "Head toward Razor Hill for the next hub.", complete = { type = "near", zone = "Durotar", x = 52.0, y = 43.5, radius = 25 } },
  },
})

Guides:RegisterGuide({
  id = "H_1_10_TAUREN",
  title = "Mulgore Path (1-10)",
  faction = "Horde",
  races = { "Tauren" },
  levelRange = { 1, 10 },
  zoneHints = { "Mulgore", "Camp Narache" },
  steps = {
    { type = "travel", zone = "Mulgore", x = 44.9, y = 77.1, text = "Meet the camp advisor at Camp Narache.", complete = { type = "near", zone = "Mulgore", x = 44.9, y = 77.1, radius = 20 } },
    { type = "accept", questId = 747, zone = "Mulgore", x = 44.9, y = 77.1, text = "Accept quest 747 to secure the area." },
    { type = "kill", questId = 747, zone = "Mulgore", x = 42.0, y = 75.5, text = "Clear local predators for quest 747." },
    { type = "turnin", questId = 747, zone = "Mulgore", x = 44.9, y = 77.1, text = "Turn in quest 747 at Camp Narache." },
    { type = "accept", questId = 750, zone = "Mulgore", x = 44.9, y = 77.1, text = "Accept quest 750 for gather supplies." },
    { type = "collect", itemId = 4755, count = 6, zone = "Mulgore", x = 45.8, y = 73.0, text = "Collect 6 supply bundles for quest 750." },
    { type = "turnin", questId = 750, zone = "Mulgore", x = 44.9, y = 77.1, text = "Return and turn in quest 750." },
    { type = "travel", zone = "Mulgore", x = 47.5, y = 58.6, text = "Ride toward Bloodhoof Village.", complete = { type = "near", zone = "Mulgore", x = 47.5, y = 58.6, radius = 25 } },
  },
})

Guides:RegisterGuide({
  id = "H_1_10_UNDEAD",
  title = "Tirisfal Awakening (1-10)",
  faction = "Horde",
  races = { "Scourge" },
  levelRange = { 1, 10 },
  zoneHints = { "Tirisfal Glades", "Deathknell" },
  steps = {
    { type = "travel", zone = "Tirisfal Glades", x = 32.2, y = 65.6, text = "Awaken at Deathknell and meet the overseer.", complete = { type = "near", zone = "Tirisfal Glades", x = 32.2, y = 65.6, radius = 20 } },
    { type = "accept", questId = 363, zone = "Tirisfal Glades", x = 32.2, y = 65.6, text = "Accept quest 363 for fresh orders." },
    { type = "kill", questId = 363, zone = "Tirisfal Glades", x = 30.3, y = 63.4, text = "Eliminate nearby threats for quest 363." },
    { type = "turnin", questId = 363, zone = "Tirisfal Glades", x = 32.2, y = 65.6, text = "Return and turn in quest 363." },
    { type = "accept", questId = 365, zone = "Tirisfal Glades", x = 32.2, y = 65.6, text = "Accept quest 365 to survey the graveyard." },
    { type = "collect", itemId = 2872, count = 6, zone = "Tirisfal Glades", x = 36.8, y = 69.6, text = "Collect 6 samples for quest 365." },
    { type = "turnin", questId = 365, zone = "Tirisfal Glades", x = 32.2, y = 65.6, text = "Turn in quest 365 at Deathknell." },
    { type = "travel", zone = "Tirisfal Glades", x = 61.8, y = 52.0, text = "Head toward Brill for the next hub.", complete = { type = "near", zone = "Tirisfal Glades", x = 61.8, y = 52.0, radius = 25 } },
  },
})

Guides:RegisterGuide({
  id = "H_1_10_BLOODELF",
  title = "Eversong Advance (1-10)",
  faction = "Horde",
  races = { "BloodElf" },
  levelRange = { 1, 10 },
  zoneHints = { "Eversong Woods", "Sunstrider Isle" },
  steps = {
    { type = "travel", zone = "Eversong Woods", x = 38.2, y = 20.8, text = "Check in at the Sunstrider training grounds.", complete = { type = "near", zone = "Eversong Woods", x = 38.2, y = 20.8, radius = 20 } },
    { type = "accept", questId = 8325, zone = "Eversong Woods", x = 38.2, y = 20.8, text = "Accept quest 8325 to secure the isle." },
    { type = "kill", questId = 8325, zone = "Eversong Woods", x = 35.7, y = 23.4, text = "Clear the nearby threat and finish quest 8325." },
    { type = "turnin", questId = 8325, zone = "Eversong Woods", x = 38.2, y = 20.8, text = "Turn in quest 8325 at the grounds." },
    { type = "accept", questId = 8345, zone = "Eversong Woods", x = 38.2, y = 20.8, text = "Accept quest 8345 for supply collection." },
    { type = "collect", itemId = 20483, count = 6, zone = "Eversong Woods", x = 36.0, y = 25.0, text = "Collect 6 supply crates for quest 8345." },
    { type = "turnin", questId = 8345, zone = "Eversong Woods", x = 38.2, y = 20.8, text = "Return and turn in quest 8345." },
    { type = "travel", zone = "Eversong Woods", x = 48.0, y = 46.0, text = "Move toward Falconwing Square.", complete = { type = "near", zone = "Eversong Woods", x = 48.0, y = 46.0, radius = 25 } },
  },
})

Guides:RegisterGuide({
  id = "H_10_20_HORDE",
  title = "The Barrens Loop (10-20)",
  faction = "Horde",
  levelRange = { 10, 20 },
  zoneHints = { "The Barrens", "Orgrimmar" },
  steps = {
    { type = "travel", zone = "The Barrens", x = 52.2, y = 31.9, text = "Ride to The Crossroads and secure the hub.", complete = { type = "near", zone = "The Barrens", x = 52.2, y = 31.9, radius = 25 } },
    { type = "accept", questId = 871, zone = "The Barrens", x = 52.2, y = 31.9, text = "Accept quest 871 for road defense." },
    { type = "kill", questId = 871, zone = "The Barrens", x = 49.5, y = 23.1, text = "Clear raiders along the northern road." },
    { type = "turnin", questId = 871, zone = "The Barrens", x = 52.2, y = 31.9, text = "Turn in quest 871 at The Crossroads." },
    { type = "fp", zone = "The Barrens", x = 51.5, y = 30.3, text = "Pick up the Crossroads flight path." },
    { type = "note", zone = "The Barrens", x = 50.9, y = 32.1, text = "Stack quests that share the same direction." },
    { type = "travel", zone = "The Barrens", x = 63.1, y = 37.2, text = "Check in at Ratchet for the coastal quests.", complete = { type = "near", zone = "The Barrens", x = 63.1, y = 37.2, radius = 25 } },
  },
})

Guides:RegisterGuide({
  id = "H_20_30_HORDE",
  title = "Stonetalon Shift (20-30)",
  faction = "Horde",
  levelRange = { 20, 30 },
  zoneHints = { "Stonetalon Mountains", "Thousand Needles" },
  steps = {
    { type = "travel", zone = "Stonetalon Mountains", x = 45.1, y = 59.8, text = "Meet the Horde outpost in Stonetalon.", complete = { type = "near", zone = "Stonetalon Mountains", x = 45.1, y = 59.8, radius = 25 } },
    { type = "accept", questId = 6284, zone = "Stonetalon Mountains", x = 45.1, y = 59.8, text = "Accept quest 6284 to secure the pass." },
    { type = "kill", questId = 6284, zone = "Stonetalon Mountains", x = 40.2, y = 52.2, text = "Clear the pass and finish quest 6284." },
    { type = "turnin", questId = 6284, zone = "Stonetalon Mountains", x = 45.1, y = 59.8, text = "Turn in quest 6284 at the outpost." },
    { type = "travel", zone = "Thousand Needles", x = 46.1, y = 50.4, text = "Ride down into Thousand Needles.", complete = { type = "near", zone = "Thousand Needles", x = 46.1, y = 50.4, radius = 25 } },
    { type = "note", zone = "Thousand Needles", x = 44.9, y = 49.1, text = "Use the canyon wall for fast quest loops." },
  },
})

Guides:RegisterGuide({
  id = "H_30_40_HORDE",
  title = "Southern Push (30-40)",
  faction = "Horde",
  levelRange = { 30, 40 },
  zoneHints = { "Stranglethorn Vale", "Desolace" },
  steps = {
    { type = "travel", zone = "Desolace", x = 25.4, y = 72.8, text = "Set up in Shadowprey Village.", complete = { type = "near", zone = "Desolace", x = 25.4, y = 72.8, radius = 25 } },
    { type = "accept", questId = 614, zone = "Desolace", x = 25.4, y = 72.8, text = "Accept a coastal defense quest." },
    { type = "kill", questId = 614, zone = "Desolace", x = 29.8, y = 76.6, text = "Clear threats along the coast." },
    { type = "turnin", questId = 614, zone = "Desolace", x = 25.4, y = 72.8, text = "Turn in the coastal quest." },
    { type = "travel", zone = "Stranglethorn Vale", x = 32.6, y = 29.2, text = "Push into northern Stranglethorn for quests.", complete = { type = "near", zone = "Stranglethorn Vale", x = 32.6, y = 29.2, radius = 25 } },
    { type = "note", zone = "Stranglethorn Vale", x = 33.1, y = 30.0, text = "Finish grouped objectives to avoid backtracking." },
  },
})

Guides:RegisterGuide({
  id = "H_40_50_HORDE",
  title = "Tanaris Route (40-50)",
  faction = "Horde",
  levelRange = { 40, 50 },
  zoneHints = { "Tanaris", "Feralas" },
  steps = {
    { type = "travel", zone = "Tanaris", x = 52.5, y = 27.2, text = "Secure Gadgetzan as your hub.", complete = { type = "near", zone = "Tanaris", x = 52.5, y = 27.2, radius = 25 } },
    { type = "fp", zone = "Tanaris", x = 51.0, y = 29.3, text = "Grab the Gadgetzan flight path." },
    { type = "accept", questId = 1691, zone = "Tanaris", x = 52.5, y = 27.2, text = "Accept a desert patrol quest." },
    { type = "kill", questId = 1691, zone = "Tanaris", x = 40.4, y = 29.0, text = "Clear dune threats for quest 1691." },
    { type = "turnin", questId = 1691, zone = "Tanaris", x = 52.5, y = 27.2, text = "Turn in quest 1691 at Gadgetzan." },
    { type = "travel", zone = "Feralas", x = 74.8, y = 45.1, text = "Move to Camp Mojache for the next loop.", complete = { type = "near", zone = "Feralas", x = 74.8, y = 45.1, radius = 25 } },
  },
})

Guides:RegisterGuide({
  id = "H_50_58_HORDE",
  title = "Northern Sweep (50-58)",
  faction = "Horde",
  levelRange = { 50, 58 },
  zoneHints = { "Felwood", "Winterspring", "Eastern Plaguelands" },
  steps = {
    { type = "travel", zone = "Felwood", x = 34.8, y = 52.8, text = "Enter Felwood and check in at the outpost.", complete = { type = "near", zone = "Felwood", x = 34.8, y = 52.8, radius = 25 } },
    { type = "accept", questId = 4505, zone = "Felwood", x = 34.8, y = 52.8, text = "Accept a corruption cleanup quest." },
    { type = "kill", questId = 4505, zone = "Felwood", x = 39.2, y = 48.5, text = "Clear corrupted beasts for quest 4505." },
    { type = "turnin", questId = 4505, zone = "Felwood", x = 34.8, y = 52.8, text = "Return to the outpost and turn in." },
    { type = "travel", zone = "Winterspring", x = 61.2, y = 38.6, text = "Ride into Everlook for supplies.", complete = { type = "near", zone = "Winterspring", x = 61.2, y = 38.6, radius = 25 } },
    { type = "note", zone = "Winterspring", x = 60.7, y = 38.7, text = "Focus on repeatable routes to push to 58." },
  },
})

Guides:RegisterGuide({
  id = "H_58_60_HORDE",
  title = "Dark Portal Staging (58-60)",
  faction = "Horde",
  levelRange = { 58, 60 },
  zoneHints = { "Blasted Lands", "Hellfire Peninsula" },
  steps = {
    { type = "travel", zone = "Blasted Lands", x = 57.8, y = 41.2, text = "Rally at Dreadmaul Hold before the portal.", complete = { type = "near", zone = "Blasted Lands", x = 57.8, y = 41.2, radius = 25 } },
    { type = "accept", questId = 10120, zone = "Blasted Lands", x = 57.8, y = 41.2, text = "Accept quest 10120 to prepare the assault." },
    { type = "travel", zone = "Hellfire Peninsula", x = 87.3, y = 48.2, text = "Enter the Dark Portal and reach the Horde base.", complete = { type = "near", zone = "Hellfire Peninsula", x = 87.3, y = 48.2, radius = 30 } },
    { type = "turnin", questId = 10120, zone = "Hellfire Peninsula", x = 87.3, y = 48.2, text = "Turn in quest 10120 at the portal camp." },
    { type = "fp", zone = "Hellfire Peninsula", x = 27.8, y = 60.0, text = "Secure the Thrallmar flight path." },
  },
})

Guides:RegisterGuide({
  id = "H_60_70_HORDE",
  title = "Outland Warpath (60-70)",
  faction = "Horde",
  levelRange = { 60, 70 },
  zoneHints = { "Hellfire Peninsula", "Zangarmarsh", "Terokkar Forest", "Nagrand", "Blade's Edge Mountains", "Netherstorm", "Shadowmoon Valley" },
  steps = {
    { type = "accept", questId = 10121, zone = "Hellfire Peninsula", x = 56.8, y = 38.7, text = "Pick up quest 10121 from Thrallmar." },
    { type = "kill", questId = 10121, zone = "Hellfire Peninsula", x = 60.0, y = 36.5, text = "Clear the perimeter for quest 10121." },
    { type = "turnin", questId = 10121, zone = "Hellfire Peninsula", x = 56.8, y = 38.7, text = "Turn in quest 10121 at Thrallmar." },
    { type = "travel", zone = "Zangarmarsh", x = 85.2, y = 54.7, text = "Move to Zabra'jin for the marsh circuit.", complete = { type = "near", zone = "Zangarmarsh", x = 85.2, y = 54.7, radius = 25 } },
    { type = "accept", questId = 9785, zone = "Zangarmarsh", x = 85.2, y = 54.7, text = "Accept quest 9785 to scan the waterways." },
    { type = "turnin", questId = 9785, zone = "Zangarmarsh", x = 85.2, y = 54.7, text = "Turn in quest 9785 before moving east." },
    { type = "travel", zone = "Terokkar Forest", x = 48.8, y = 45.3, text = "Ride to Stonebreaker Hold and set your hearth.", complete = { type = "near", zone = "Terokkar Forest", x = 48.8, y = 45.3, radius = 25 } },
    { type = "travel", zone = "Nagrand", x = 56.8, y = 34.8, text = "Set up at Garadar for the hunting quests.", complete = { type = "near", zone = "Nagrand", x = 56.8, y = 34.8, radius = 25 } },
    { type = "travel", zone = "Blade's Edge Mountains", x = 52.2, y = 54.0, text = "Move into Blade's Edge for high XP loops.", complete = { type = "near", zone = "Blade's Edge Mountains", x = 52.2, y = 54.0, radius = 25 } },
    { type = "travel", zone = "Netherstorm", x = 45.0, y = 34.9, text = "Advance to Area 52 to begin the final stretch.", complete = { type = "near", zone = "Netherstorm", x = 45.0, y = 34.9, radius = 25 } },
    { type = "note", zone = "Shadowmoon Valley", x = 30.3, y = 27.8, text = "Finish with Shadowmoon quests and elite groups." },
  },
})
