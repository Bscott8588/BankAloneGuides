--[[
    Bank Alone Guides - Vendor Data
    SCS / Bank Alone Guides
    
    Important vendors: reagents, profession supplies, recipe vendors.
    All descriptions are original.
]]

local BAG = BankAlone

BAG.Data = BAG.Data or {}
BAG.Data.Vendors = BAG.Data.Vendors or {}

local V = BAG.Data.Vendors

-- Format: V[npcID] = { name, zone, x, y, faction, vendorType, description }

-- ============================================================
-- GENERAL GOODS VENDORS
-- ============================================================
V[1286]  = { name = "Tharynn Bouden", zone = "Elwynn Forest", x = 41.9, y = 67.1, faction = "Alliance", vendorType = "general", description = "Sells basic supplies and gear near Goldshire." }
V[3489]  = { name = "Zargh", zone = "Durotar", x = 51.3, y = 42.0, faction = "Horde", vendorType = "general", description = "General goods vendor at Razor Hill." }
V[4877]  = { name = "Innkeeper Allison", zone = "Stormwind City", x = 60.5, y = 75.4, faction = "Alliance", vendorType = "innkeeper", description = "Innkeeper in the Trade District who also sells food and drinks." }
V[6929]  = { name = "Innkeeper Pala", zone = "Orgrimmar", x = 54.2, y = 68.4, faction = "Horde", vendorType = "innkeeper", description = "Innkeeper in the Valley of Strength." }

-- ============================================================
-- REAGENT VENDORS
-- ============================================================
V[5138]  = { name = "Brother Cassius", zone = "Stormwind City", x = 42.8, y = 33.6, faction = "Alliance", vendorType = "reagent", description = "Sells reagents used by various casting classes." }
V[3335]  = { name = "Horthus", zone = "Orgrimmar", x = 45.6, y = 56.2, faction = "Horde", vendorType = "reagent", description = "Reagent vendor in the Valley of Spirits." }

-- ============================================================
-- PROFESSION SUPPLY VENDORS
-- ============================================================
V[5512]  = { name = "Bombus Finespindle", zone = "Ironforge", x = 48.6, y = 43.1, faction = "Alliance", vendorType = "mining_supply", description = "Sells mining picks and related supplies." }
V[3356]  = { name = "Sumi", zone = "Orgrimmar", x = 74.8, y = 34.2, faction = "Horde", vendorType = "mining_supply", description = "Mining supply vendor in the Valley of Honor." }

V[3413]  = { name = "Sovik", zone = "Orgrimmar", x = 75.5, y = 25.5, faction = "Horde", vendorType = "engineering_supply", description = "Sells engineering parts and schematics." }
V[5519]  = { name = "Gearcutter Cogspinner", zone = "Ironforge", x = 68.2, y = 43.8, faction = "Alliance", vendorType = "engineering_supply", description = "Engineering supply vendor in Tinker Town." }

V[2225]  = { name = "Darnall", zone = "Darnassus", x = 49.8, y = 67.5, faction = "Alliance", vendorType = "herbalism_supply", description = "Herbalism supply vendor." }
V[3348]  = { name = "Kor'geld", zone = "Orgrimmar", x = 56.2, y = 39.5, faction = "Horde", vendorType = "alchemy_supply", description = "Sells vials and alchemy reagents." }

-- ============================================================
-- RECIPE VENDORS (Key ones)
-- ============================================================
V[2381]  = { name = "Kendor Kabonka", zone = "Stormwind City", x = 76.5, y = 53.0, faction = "Alliance", vendorType = "recipe", description = "Sells a wide variety of cooking recipes, many are limited supply." }
V[3482]  = { name = "Zarbo Porkpatty", zone = "The Barrens", x = 62.4, y = 38.5, faction = "Horde", vendorType = "recipe", description = "Sells cooking supplies at Ratchet." }

-- ============================================================
-- OUTLAND VENDORS
-- ============================================================
V[18005] = { name = "Quartermaster Urgronn", zone = "Hellfire Peninsula", x = 54.3, y = 62.8, faction = "Alliance", vendorType = "reputation", description = "Honor Hold reputation vendor with gear rewards." }
V[17657] = { name = "Quartermaster Jaffrey Noreliqe", zone = "Hellfire Peninsula", x = 56.4, y = 37.1, faction = "Horde", vendorType = "reputation", description = "Thrallmar reputation vendor with gear rewards." }
V[21643] = { name = "Viseloth", zone = "Shattrath City", x = 66.2, y = 68.4, faction = "Both", vendorType = "general", description = "General goods vendor in the Lower City of Shattrath." }
V[19234] = { name = "Gidge Spellweaver", zone = "Shattrath City", x = 44.5, y = 90.2, faction = "Both", vendorType = "reagent", description = "Reagent vendor in Shattrath's central market." }

-- ============================================================
-- REPAIR VENDORS (KEY LOCATIONS)
-- ============================================================
V[844]   = { name = "Antonio Perelli", zone = "Elwynn Forest", x = 74.2, y = 72.5, faction = "Alliance", vendorType = "repair", description = "Traveling vendor who repairs gear along Elwynn's roads." }
V[3319]  = { name = "Sana", zone = "Thunder Bluff", x = 45.3, y = 55.2, faction = "Horde", vendorType = "repair", description = "Armor and weapons vendor who also repairs equipment." }
