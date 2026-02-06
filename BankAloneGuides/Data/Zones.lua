--[[
    Bank Alone Guides - Zone Data
    SCS / Bank Alone Guides
    
    Defines zones and level ranges for Azeroth (1-60) and Outland (58-70).
    All descriptions are original content.
]]

local BAG = BankAlone

BAG.Data = BAG.Data or {}
BAG.Data.Zones = BAG.Data.Zones or {}

-- Zone data format: { name, levelRange, continent, faction, mapID (approximate) }
local Z = BAG.Data.Zones

-- ============================================================
-- EASTERN KINGDOMS
-- ============================================================

-- Starting zones
Z["ElwynnForest"] = { name = "Elwynn Forest", levelRange = {1, 10}, continent = "Eastern Kingdoms", faction = "Alliance", mapID = 37 }
Z["DunMorogh"] = { name = "Dun Morogh", levelRange = {1, 10}, continent = "Eastern Kingdoms", faction = "Alliance", mapID = 27 }
Z["TirisfalGlades"] = { name = "Tirisfal Glades", levelRange = {1, 10}, continent = "Eastern Kingdoms", faction = "Horde", mapID = 18 }
Z["EversongWoods"] = { name = "Eversong Woods", levelRange = {1, 10}, continent = "Eastern Kingdoms", faction = "Horde", mapID = 94 }

-- 10-20 zones
Z["Westfall"] = { name = "Westfall", levelRange = {10, 20}, continent = "Eastern Kingdoms", faction = "Alliance", mapID = 39 }
Z["LochModan"] = { name = "Loch Modan", levelRange = {10, 20}, continent = "Eastern Kingdoms", faction = "Alliance", mapID = 35 }
Z["SilverpineForest"] = { name = "Silverpine Forest", levelRange = {10, 20}, continent = "Eastern Kingdoms", faction = "Horde", mapID = 21 }
Z["Ghostlands"] = { name = "Ghostlands", levelRange = {10, 20}, continent = "Eastern Kingdoms", faction = "Horde", mapID = 95 }

-- 20-30 zones
Z["Wetlands"] = { name = "Wetlands", levelRange = {20, 30}, continent = "Eastern Kingdoms", faction = "Both", mapID = 40 }
Z["RedridgeMountains"] = { name = "Redridge Mountains", levelRange = {15, 25}, continent = "Eastern Kingdoms", faction = "Alliance", mapID = 36 }
Z["Duskwood"] = { name = "Duskwood", levelRange = {18, 30}, continent = "Eastern Kingdoms", faction = "Alliance", mapID = 34 }
Z["HillsbradFoothills"] = { name = "Hillsbrad Foothills", levelRange = {20, 30}, continent = "Eastern Kingdoms", faction = "Horde", mapID = 25 }

-- 30-40 zones
Z["StranglethornVale"] = { name = "Stranglethorn Vale", levelRange = {30, 45}, continent = "Eastern Kingdoms", faction = "Both", mapID = 37 }
Z["ArathiHighlands"] = { name = "Arathi Highlands", levelRange = {30, 40}, continent = "Eastern Kingdoms", faction = "Both", mapID = 16 }
Z["Badlands"] = { name = "Badlands", levelRange = {35, 45}, continent = "Eastern Kingdoms", faction = "Both", mapID = 15 }

-- 40-50 zones
Z["TheHinterlands"] = { name = "The Hinterlands", levelRange = {40, 50}, continent = "Eastern Kingdoms", faction = "Both", mapID = 26 }
Z["SearingGorge"] = { name = "Searing Gorge", levelRange = {43, 50}, continent = "Eastern Kingdoms", faction = "Both", mapID = 32 }
Z["SwampOfSorrows"] = { name = "Swamp of Sorrows", levelRange = {35, 45}, continent = "Eastern Kingdoms", faction = "Both", mapID = 38 }

-- 50-60 zones
Z["BurningSteppes"] = { name = "Burning Steppes", levelRange = {50, 58}, continent = "Eastern Kingdoms", faction = "Both", mapID = 29 }
Z["WesternPlaguelands"] = { name = "Western Plaguelands", levelRange = {50, 58}, continent = "Eastern Kingdoms", faction = "Both", mapID = 22 }
Z["EasternPlaguelands"] = { name = "Eastern Plaguelands", levelRange = {53, 60}, continent = "Eastern Kingdoms", faction = "Both", mapID = 23 }
Z["BlastedLands"] = { name = "Blasted Lands", levelRange = {45, 55}, continent = "Eastern Kingdoms", faction = "Both", mapID = 17 }

-- ============================================================
-- KALIMDOR
-- ============================================================

-- Starting zones
Z["Teldrassil"] = { name = "Teldrassil", levelRange = {1, 10}, continent = "Kalimdor", faction = "Alliance", mapID = 41 }
Z["AzuremystIsle"] = { name = "Azuremyst Isle", levelRange = {1, 10}, continent = "Kalimdor", faction = "Alliance", mapID = 97 }
Z["Durotar"] = { name = "Durotar", levelRange = {1, 10}, continent = "Kalimdor", faction = "Horde", mapID = 4 }
Z["Mulgore"] = { name = "Mulgore", levelRange = {1, 10}, continent = "Kalimdor", faction = "Horde", mapID = 7 }

-- 10-20 zones
Z["Darkshore"] = { name = "Darkshore", levelRange = {10, 20}, continent = "Kalimdor", faction = "Alliance", mapID = 42 }
Z["BloodmystIsle"] = { name = "Bloodmyst Isle", levelRange = {10, 20}, continent = "Kalimdor", faction = "Alliance", mapID = 106 }
Z["TheBarrens"] = { name = "The Barrens", levelRange = {10, 25}, continent = "Kalimdor", faction = "Horde", mapID = 11 }

-- 20-30 zones
Z["Ashenvale"] = { name = "Ashenvale", levelRange = {18, 30}, continent = "Kalimdor", faction = "Both", mapID = 43 }
Z["StonetalonMountains"] = { name = "Stonetalon Mountains", levelRange = {15, 27}, continent = "Kalimdor", faction = "Both", mapID = 81 }
Z["ThousandNeedles"] = { name = "Thousand Needles", levelRange = {25, 35}, continent = "Kalimdor", faction = "Both", mapID = 61 }

-- 30-40 zones
Z["Desolace"] = { name = "Desolace", levelRange = {30, 40}, continent = "Kalimdor", faction = "Both", mapID = 66 }
Z["DustwallowMarsh"] = { name = "Dustwallow Marsh", levelRange = {35, 45}, continent = "Kalimdor", faction = "Both", mapID = 70 }

-- 40-50 zones
Z["Feralas"] = { name = "Feralas", levelRange = {40, 50}, continent = "Kalimdor", faction = "Both", mapID = 69 }
Z["Tanaris"] = { name = "Tanaris", levelRange = {40, 50}, continent = "Kalimdor", faction = "Both", mapID = 71 }
Z["Felwood"] = { name = "Felwood", levelRange = {48, 55}, continent = "Kalimdor", faction = "Both", mapID = 77 }
Z["Azshara"] = { name = "Azshara", levelRange = {45, 55}, continent = "Kalimdor", faction = "Both", mapID = 76 }

-- 50-60 zones
Z["UnGoroCrater"] = { name = "Un'Goro Crater", levelRange = {48, 55}, continent = "Kalimdor", faction = "Both", mapID = 78 }
Z["Silithus"] = { name = "Silithus", levelRange = {55, 60}, continent = "Kalimdor", faction = "Both", mapID = 81 }
Z["Winterspring"] = { name = "Winterspring", levelRange = {53, 60}, continent = "Kalimdor", faction = "Both", mapID = 83 }

-- ============================================================
-- OUTLAND
-- ============================================================

Z["HellfirePeninsula"] = { name = "Hellfire Peninsula", levelRange = {58, 63}, continent = "Outland", faction = "Both", mapID = 100 }
Z["Zangarmarsh"] = { name = "Zangarmarsh", levelRange = {60, 64}, continent = "Outland", faction = "Both", mapID = 102 }
Z["TerokkarForest"] = { name = "Terokkar Forest", levelRange = {62, 65}, continent = "Outland", faction = "Both", mapID = 108 }
Z["Nagrand"] = { name = "Nagrand", levelRange = {64, 67}, continent = "Outland", faction = "Both", mapID = 107 }
Z["BladesEdgeMountains"] = { name = "Blade's Edge Mountains", levelRange = {65, 68}, continent = "Outland", faction = "Both", mapID = 105 }
Z["Netherstorm"] = { name = "Netherstorm", levelRange = {67, 70}, continent = "Outland", faction = "Both", mapID = 109 }
Z["ShadowmoonValley"] = { name = "Shadowmoon Valley", levelRange = {67, 70}, continent = "Outland", faction = "Both", mapID = 104 }

-- ============================================================
-- CITIES
-- ============================================================

Z["StormwindCity"] = { name = "Stormwind City", levelRange = {1, 70}, continent = "Eastern Kingdoms", faction = "Alliance", mapID = 301 }
Z["Ironforge"] = { name = "Ironforge", levelRange = {1, 70}, continent = "Eastern Kingdoms", faction = "Alliance", mapID = 341 }
Z["Darnassus"] = { name = "Darnassus", levelRange = {1, 70}, continent = "Kalimdor", faction = "Alliance", mapID = 381 }
Z["TheExodar"] = { name = "The Exodar", levelRange = {1, 70}, continent = "Kalimdor", faction = "Alliance", mapID = 471 }
Z["Orgrimmar"] = { name = "Orgrimmar", levelRange = {1, 70}, continent = "Kalimdor", faction = "Horde", mapID = 321 }
Z["ThunderBluff"] = { name = "Thunder Bluff", levelRange = {1, 70}, continent = "Kalimdor", faction = "Horde", mapID = 362 }
Z["Undercity"] = { name = "Undercity", levelRange = {1, 70}, continent = "Eastern Kingdoms", faction = "Horde", mapID = 382 }
Z["SilvermoonCity"] = { name = "Silvermoon City", levelRange = {1, 70}, continent = "Eastern Kingdoms", faction = "Horde", mapID = 480 }
Z["ShattrathCity"] = { name = "Shattrath City", levelRange = {55, 70}, continent = "Outland", faction = "Both", mapID = 481 }
