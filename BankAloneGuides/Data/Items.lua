--[[
    Bank Alone Guides - Item Data
    SCS / Bank Alone Guides
    
    Key items referenced in guides. All descriptions are original.
]]

local BAG = BankAlone

BAG.Data = BAG.Data or {}
BAG.Data.Items = BAG.Data.Items or {}

local I = BAG.Data.Items

-- Format: I[itemID] = { name, purpose }

-- ============================================================
-- GENERAL / UTILITY ITEMS
-- ============================================================
I[6948]  = { name = "Hearthstone", purpose = "Teleports you to your bound inn location." }
I[4604]  = { name = "Forest Mushroom Cap", purpose = "Basic food item for health regeneration." }
I[159]   = { name = "Refreshing Spring Water", purpose = "Basic drink for mana regeneration." }
I[2070]  = { name = "Darnassian Bleu", purpose = "Inexpensive cheese used for sustenance." }
I[117]   = { name = "Tough Jerky", purpose = "Basic food for early-level health recovery." }

-- ============================================================
-- QUEST ITEMS (Elwynn Forest)
-- ============================================================
I[774]   = { name = "Malachite", purpose = "A green gem occasionally found while mining copper." }
I[785]   = { name = "Mageroyal", purpose = "An herb used in various alchemy recipes." }
I[5571]  = { name = "Small Black Pouch", purpose = "A basic container dropping from early humanoids." }

-- ============================================================
-- QUEST ITEMS (Durotar)
-- ============================================================
I[4870]  = { name = "Cactus Apple", purpose = "A refreshing fruit gathered from desert cacti." }
I[4864]  = { name = "Scorpid Tail", purpose = "Collected from scorpions for antivenom production." }

-- ============================================================
-- TRADE GOODS & PROFESSION MATERIALS
-- ============================================================
I[2770]  = { name = "Copper Ore", purpose = "Basic mining material, smelted into copper bars." }
I[2771]  = { name = "Tin Ore", purpose = "Low-level mining ore, combined with copper for bronze." }
I[2772]  = { name = "Iron Ore", purpose = "Mid-level ore found in contested territory mines." }
I[3858]  = { name = "Mithril Ore", purpose = "Higher-level ore from deep mountain veins." }
I[10620] = { name = "Thorium Ore", purpose = "High-level Azeroth ore for endgame crafting." }
I[23424] = { name = "Fel Iron Ore", purpose = "The primary Outland ore, found throughout Hellfire and beyond." }
I[23425] = { name = "Adamantite Ore", purpose = "Premium Outland ore from higher-level zones." }

I[2447]  = { name = "Peacebloom", purpose = "The most common herb, found in all starting zones." }
I[765]   = { name = "Silverleaf", purpose = "A basic herb growing near trees in low-level areas." }
I[2449]  = { name = "Earthroot", purpose = "An herb found near cliff faces and hillsides." }
I[22785] = { name = "Felweed", purpose = "The basic herb of Outland, abundant in Hellfire Peninsula." }
I[22786] = { name = "Dreaming Glory", purpose = "A luminescent Outland herb found in multiple zones." }
I[22789] = { name = "Terocone", purpose = "An herb native to Terokkar Forest's shaded groves." }

I[2318]  = { name = "Light Leather", purpose = "Basic leather skinned from low-level creatures." }
I[2319]  = { name = "Medium Leather", purpose = "Leather from mid-level beasts, used in many patterns." }
I[4234]  = { name = "Heavy Leather", purpose = "Sturdy leather from tougher creatures." }
I[8170]  = { name = "Rugged Leather", purpose = "High-quality Azeroth leather for endgame crafting." }
I[21887] = { name = "Knothide Leather", purpose = "The standard Outland leather from level 58+ creatures." }

-- ============================================================
-- BAGS
-- ============================================================
I[4496]  = { name = "Small Brown Pouch", purpose = "A basic 6-slot bag, good for starters." }
I[4498]  = { name = "Brown Leather Satchel", purpose = "An 8-slot bag, a modest upgrade." }
I[4500]  = { name = "Traveler's Backpack", purpose = "A spacious 16-slot backpack for serious adventurers." }
I[14046] = { name = "Runecloth Bag", purpose = "A 14-slot bag crafted by tailors." }
I[21841] = { name = "Netherweave Bag", purpose = "A 16-slot Outland bag, commonly available from tailors." }

-- ============================================================
-- OUTLAND KEY ITEMS
-- ============================================================
I[28513] = { name = "Illidari Tabard", purpose = "A tabard associated with demon hunter forces in Outland." }
I[30810] = { name = "Ethereum Prison Key", purpose = "Opens ethereum prisons in Netherstorm for rewards." }
I[32569] = { name = "Apexis Shard", purpose = "Currency used at Ogri'la and Skyguard vendors." }
