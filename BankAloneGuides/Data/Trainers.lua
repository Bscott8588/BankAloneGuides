--[[
    Bank Alone Guides - Trainer Data
    SCS / Bank Alone Guides
    
    Profession and class trainers relevant to the guides.
    All descriptions are original.
]]

local BAG = BankAlone

BAG.Data = BAG.Data or {}
BAG.Data.Trainers = BAG.Data.Trainers or {}

local T = BAG.Data.Trainers

-- Format: T[npcID] = { name, profession, zone, x, y, faction, skillRange, description }

-- ============================================================
-- MINING TRAINERS
-- ============================================================
T[5392]  = { name = "Geofram Bouldertoe", profession = "Mining", zone = "Ironforge", x = 50.0, y = 26.5, faction = "Alliance", skillRange = {1, 300}, description = "Expert mining trainer in the Great Forge." }
T[3357]  = { name = "Makaru", profession = "Mining", zone = "Orgrimmar", x = 72.5, y = 34.8, faction = "Horde", skillRange = {1, 300}, description = "Mining trainer in the Valley of Honor." }
T[18779] = { name = "Hurnak Grimmord", profession = "Mining", zone = "Hellfire Peninsula", x = 56.7, y = 63.8, faction = "Alliance", skillRange = {275, 375}, description = "Master mining trainer at Honor Hold." }
T[18747] = { name = "Krugosh", profession = "Mining", zone = "Hellfire Peninsula", x = 55.4, y = 37.6, faction = "Horde", skillRange = {275, 375}, description = "Master mining trainer at Thrallmar." }

-- ============================================================
-- HERBALISM TRAINERS
-- ============================================================
T[2114]  = { name = "Shylamiir", profession = "Herbalism", zone = "Darnassus", x = 49.5, y = 68.4, faction = "Alliance", skillRange = {1, 300}, description = "Herbalism trainer in the Craftsmen's Terrace." }
T[3404]  = { name = "Jandi", profession = "Herbalism", zone = "Orgrimmar", x = 55.7, y = 39.6, faction = "Horde", skillRange = {1, 300}, description = "Herbalism trainer in the Drag." }
T[18776] = { name = "Rorelien", profession = "Herbalism", zone = "Hellfire Peninsula", x = 53.6, y = 65.8, faction = "Alliance", skillRange = {275, 375}, description = "Master herbalism trainer at Honor Hold." }
T[18748] = { name = "Ruak Stronghorn", profession = "Herbalism", zone = "Hellfire Peninsula", x = 52.2, y = 36.4, faction = "Horde", skillRange = {275, 375}, description = "Master herbalism trainer at Thrallmar." }

-- ============================================================
-- SKINNING TRAINERS
-- ============================================================
T[5564]  = { name = "Mak", profession = "Skinning", zone = "Ironforge", x = 39.8, y = 33.2, faction = "Alliance", skillRange = {1, 300}, description = "Skinning trainer near the Forlorn Cavern." }
T[3365]  = { name = "Thuwd", profession = "Skinning", zone = "Orgrimmar", x = 63.2, y = 45.5, faction = "Horde", skillRange = {1, 300}, description = "Skinning trainer in the Drag." }

-- ============================================================
-- BLACKSMITHING TRAINERS
-- ============================================================
T[5511]  = { name = "Bengus Deepforge", profession = "Blacksmithing", zone = "Ironforge", x = 51.4, y = 42.8, faction = "Alliance", skillRange = {1, 300}, description = "Expert blacksmith working at the Great Forge." }
T[3355]  = { name = "Saru Steelfury", profession = "Blacksmithing", zone = "Orgrimmar", x = 76.8, y = 34.5, faction = "Horde", skillRange = {1, 300}, description = "Blacksmithing trainer in the Valley of Honor." }
T[20124] = { name = "Humphry", profession = "Blacksmithing", zone = "Hellfire Peninsula", x = 56.8, y = 63.3, faction = "Alliance", skillRange = {275, 375}, description = "Master blacksmith at Honor Hold." }

-- ============================================================
-- ENGINEERING TRAINERS
-- ============================================================
T[5518]  = { name = "Springspindle Fizzlegear", profession = "Engineering", zone = "Ironforge", x = 68.4, y = 44.2, faction = "Alliance", skillRange = {1, 300}, description = "Chief engineering instructor in Tinker Town." }
T[3412]  = { name = "Roxxik", profession = "Engineering", zone = "Orgrimmar", x = 75.6, y = 25.2, faction = "Horde", skillRange = {1, 300}, description = "Engineering trainer in the Valley of Honor." }

-- ============================================================
-- LEATHERWORKING TRAINERS
-- ============================================================
T[5499]  = { name = "Aayndia Floralwind", profession = "Leatherworking", zone = "Darnassus", x = 60.5, y = 36.8, faction = "Alliance", skillRange = {1, 300}, description = "Leatherworking trainer in the Craftsmen's Terrace." }
T[3365]  = { name = "Karolek", profession = "Leatherworking", zone = "Orgrimmar", x = 62.8, y = 44.6, faction = "Horde", skillRange = {1, 300}, description = "Leatherworking trainer in the Drag." }

-- ============================================================
-- TAILORING TRAINERS
-- ============================================================
T[1346]  = { name = "Georgio Bolero", profession = "Tailoring", zone = "Stormwind City", x = 43.2, y = 73.5, faction = "Alliance", skillRange = {1, 300}, description = "Tailoring trainer in the Mage Quarter." }
T[3363]  = { name = "Magar", profession = "Tailoring", zone = "Orgrimmar", x = 63.5, y = 51.2, faction = "Horde", skillRange = {1, 300}, description = "Tailoring trainer in the Drag." }

-- ============================================================
-- ENCHANTING TRAINERS
-- ============================================================
T[1317]  = { name = "Lucan Cordell", profession = "Enchanting", zone = "Stormwind City", x = 53.1, y = 74.3, faction = "Alliance", skillRange = {1, 300}, description = "Enchanting trainer in the Mage Quarter." }
T[3345]  = { name = "Godan", profession = "Enchanting", zone = "Orgrimmar", x = 53.4, y = 38.5, faction = "Horde", skillRange = {1, 300}, description = "Enchanting trainer in the Drag." }

-- ============================================================
-- ALCHEMY TRAINERS
-- ============================================================
T[1386]  = { name = "Lilyssia Nightbreeze", profession = "Alchemy", zone = "Stormwind City", x = 46.8, y = 79.5, faction = "Alliance", skillRange = {1, 300}, description = "Alchemy trainer in the Mage Quarter." }
T[3347]  = { name = "Yelmak", profession = "Alchemy", zone = "Orgrimmar", x = 55.6, y = 39.8, faction = "Horde", skillRange = {1, 300}, description = "Alchemy trainer in the Drag." }

-- ============================================================
-- COOKING TRAINERS
-- ============================================================
T[1355]  = { name = "Stephen Ryback", profession = "Cooking", zone = "Stormwind City", x = 76.8, y = 53.2, faction = "Alliance", skillRange = {1, 300}, description = "Cooking trainer in Old Town." }
T[3399]  = { name = "Zamja", profession = "Cooking", zone = "Orgrimmar", x = 57.5, y = 53.6, faction = "Horde", skillRange = {1, 300}, description = "Cooking trainer near the Valley of Strength." }

-- ============================================================
-- FISHING TRAINERS
-- ============================================================
T[5493]  = { name = "Arnold Leland", profession = "Fishing", zone = "Stormwind City", x = 55.0, y = 69.7, faction = "Alliance", skillRange = {1, 300}, description = "Fishing trainer by the Stormwind canals." }
T[3332]  = { name = "Lumak", profession = "Fishing", zone = "Orgrimmar", x = 69.8, y = 29.5, faction = "Horde", skillRange = {1, 300}, description = "Fishing trainer near the Valley of Honor." }

-- ============================================================
-- FIRST AID TRAINERS
-- ============================================================
T[5150]  = { name = "Nissa Firestone", profession = "First Aid", zone = "Ironforge", x = 54.8, y = 58.6, faction = "Alliance", skillRange = {1, 300}, description = "First aid trainer in the Hall of Explorers." }
T[3373]  = { name = "Arnok", profession = "First Aid", zone = "Orgrimmar", x = 34.2, y = 84.5, faction = "Horde", skillRange = {1, 300}, description = "First aid trainer in the Valley of Spirits." }
