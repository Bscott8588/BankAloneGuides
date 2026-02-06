--[[
    Bank Alone Guides - NPC Data
    SCS / Bank Alone Guides
    
    Important NPCs: quest givers, vendors, trainers, flight masters.
    All descriptions are original.
]]

local BAG = BankAlone

BAG.Data = BAG.Data or {}
BAG.Data.NPCs = BAG.Data.NPCs or {}

local N = BAG.Data.NPCs

-- Format: N[npcID] = { name, zone, x, y, type, faction, description }
-- Coordinates are zone-relative percentages (0-100)

-- ============================================================
-- ALLIANCE STARTING AREA NPCs
-- ============================================================

-- Elwynn Forest
N[197]   = { name = "Marshal McBride", zone = "Elwynn Forest", x = 48.2, y = 42.8, type = "questgiver", faction = "Alliance", description = "The commanding officer at Northshire Abbey who assigns initial tasks." }
N[6774]  = { name = "Deputy Willem", zone = "Elwynn Forest", x = 48.9, y = 41.6, type = "questgiver", faction = "Alliance", description = "A deputy helping coordinate defense efforts in Northshire." }
N[240]   = { name = "Marshal Dughan", zone = "Elwynn Forest", x = 42.1, y = 65.9, type = "questgiver", faction = "Alliance", description = "The head marshal stationed at Goldshire, overseeing regional defense." }
N[252]   = { name = "Innkeeper Farley", zone = "Elwynn Forest", x = 43.3, y = 65.7, type = "innkeeper", faction = "Alliance", description = "Runs the Lion's Pride Inn in Goldshire, a popular rest stop." }

-- Dun Morogh
N[658]   = { name = "Sten Stoutarm", zone = "Dun Morogh", x = 29.9, y = 71.2, type = "questgiver", faction = "Alliance", description = "A veteran soldier stationed at the Coldridge Valley outpost." }
N[786]   = { name = "Grelin Whitebeard", zone = "Dun Morogh", x = 28.4, y = 74.2, type = "questgiver", faction = "Alliance", description = "An experienced dwarf who keeps watch on troll activities." }
N[1104]  = { name = "Innkeeper Belm", zone = "Dun Morogh", x = 46.7, y = 52.5, type = "innkeeper", faction = "Alliance", description = "Manages the Thunderbrew Distillery inn in Kharanos." }

-- Teldrassil
N[2079]  = { name = "Conservator Ilthalaine", zone = "Teldrassil", x = 58.6, y = 44.3, type = "questgiver", faction = "Alliance", description = "A night elf nature keeper tasked with maintaining forest balance." }
N[2080]  = { name = "Gilshalan Windwalker", zone = "Teldrassil", x = 57.4, y = 41.5, type = "questgiver", faction = "Alliance", description = "A druid studying the effects of corruption on local wildlife." }

-- Azuremyst Isle
N[17248] = { name = "Megelon", zone = "Azuremyst Isle", x = 52.4, y = 42.8, type = "questgiver", faction = "Alliance", description = "A draenei survivor coordinating recovery efforts near the crash site." }

-- ============================================================
-- HORDE STARTING AREA NPCs
-- ============================================================

-- Durotar
N[4488]  = { name = "Kaltunk", zone = "Durotar", x = 42.8, y = 68.4, type = "questgiver", faction = "Horde", description = "A seasoned warrior who trains new recruits in the Valley of Trials." }
N[3143]  = { name = "Razor Hill Barracks", zone = "Durotar", x = 51.9, y = 41.5, type = "questgiver", faction = "Horde", description = "The Razor Hill garrison command post." }
N[6928]  = { name = "Innkeeper Grosk", zone = "Durotar", x = 51.6, y = 41.7, type = "innkeeper", faction = "Horde", description = "Operates the inn at Razor Hill, the main Durotar settlement." }

-- Mulgore
N[2980]  = { name = "Chief Hawkwind", zone = "Mulgore", x = 44.5, y = 76.2, type = "questgiver", faction = "Horde", description = "Leader of the Camp Narache tauren community atop Red Cloud Mesa." }
N[2981]  = { name = "Grull Hawkwind", zone = "Mulgore", x = 44.9, y = 77.1, type = "questgiver", faction = "Horde", description = "A hunter tasked with protecting Camp Narache from predators." }

-- Tirisfal Glades
N[1568]  = { name = "Undertaker Mordo", zone = "Tirisfal Glades", x = 30.2, y = 71.4, type = "questgiver", faction = "Horde", description = "Oversees the process of awakening new Forsaken from the crypt." }
N[1569]  = { name = "Shadow Priest Sarvis", zone = "Tirisfal Glades", x = 30.8, y = 66.0, type = "questgiver", faction = "Horde", description = "A priest who directs newly risen undead to serve the Dark Lady." }

-- Eversong Woods
N[15278] = { name = "Magistrix Erona", zone = "Eversong Woods", x = 38.3, y = 20.8, type = "questgiver", faction = "Horde", description = "Instructs blood elf recruits on Sunstrider Isle." }
N[15281] = { name = "Lanthan Perilon", zone = "Eversong Woods", x = 37.5, y = 25.3, type = "questgiver", faction = "Horde", description = "A ranger scouting the perimeter of the blood elf starting area." }

-- ============================================================
-- KEY FLIGHT MASTERS
-- ============================================================

-- Alliance
N[352]   = { name = "Dungar Longdrink", zone = "Stormwind City", x = 66.3, y = 62.4, type = "flightmaster", faction = "Alliance", description = "Flight master at the Stormwind gryphon roost." }
N[1573]  = { name = "Gryth Thurden", zone = "Ironforge", x = 55.5, y = 47.8, type = "flightmaster", faction = "Alliance", description = "Manages flights from the Great Forge district in Ironforge." }
N[3838]  = { name = "Thyssiana", zone = "Darnassus", x = 36.6, y = 47.8, type = "flightmaster", faction = "Alliance", description = "Night elf flight handler at the Darnassus hippogryph station." }
N[16822] = { name = "Stephanos", zone = "The Exodar", x = 68.5, y = 63.7, type = "flightmaster", faction = "Alliance", description = "Draenei flight master operating out of the Exodar." }

-- Horde
N[3310]  = { name = "Doras", zone = "Orgrimmar", x = 45.1, y = 63.9, type = "flightmaster", faction = "Horde", description = "Chief wyvern handler in the Orgrimmar flight tower." }
N[2995]  = { name = "Tal", zone = "Thunder Bluff", x = 47.0, y = 49.8, type = "flightmaster", faction = "Horde", description = "Flight master on the central bluff of Thunder Bluff." }
N[4551]  = { name = "Michael Garrett", zone = "Undercity", x = 63.3, y = 48.5, type = "flightmaster", faction = "Horde", description = "Manages bat rider flights from the Undercity ruins." }
N[16192] = { name = "Skymistress Gloaming", zone = "Silvermoon City", x = 54.2, y = 50.8, type = "flightmaster", faction = "Horde", description = "Blood elf flight handler at Silvermoon's departure platform." }

-- Outland Flight Masters
N[18785] = { name = "Amish Willenholly", zone = "Hellfire Peninsula", x = 54.7, y = 62.4, type = "flightmaster", faction = "Alliance", description = "Gryphon master stationed at Honor Hold." }
N[18807] = { name = "Kreenig Snarlhide", zone = "Hellfire Peninsula", x = 56.2, y = 36.2, type = "flightmaster", faction = "Horde", description = "Wyvern master at Thrallmar in Hellfire." }
N[18809] = { name = "Nutral", zone = "Shattrath City", x = 64.1, y = 41.2, type = "flightmaster", faction = "Both", description = "Neutral flight master serving all factions in Shattrath." }

-- ============================================================
-- KEY VENDORS
-- ============================================================

N[1286]  = { name = "Tharynn Bouden", zone = "Elwynn Forest", x = 41.9, y = 67.1, type = "vendor", faction = "Alliance", description = "General goods vendor near the Goldshire inn." }
N[3489]  = { name = "Zargh", zone = "Durotar", x = 51.3, y = 42.0, type = "vendor", faction = "Horde", description = "Provisions vendor at Razor Hill." }

-- ============================================================
-- KEY TRAINERS
-- ============================================================

N[375]   = { name = "Lyria Du Lac", zone = "Stormwind City", x = 57.6, y = 47.4, type = "trainer", faction = "Alliance", description = "Warrior trainer located in the Old Town district of Stormwind." }
N[3354]  = { name = "Ormak Grimshot", zone = "Orgrimmar", x = 73.8, y = 32.8, type = "trainer", faction = "Horde", description = "Hunter trainer in the Valley of Honor." }
