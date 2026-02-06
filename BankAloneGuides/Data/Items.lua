-------------------------------------------------------------------------------
-- Bank Alone Guides — Data / Items
-- Key items referenced in guides
-- All descriptions are original content
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Data.Items = BAG.Data.Items or {}

-- Item entry format:
-- [itemID] = { name, purpose }
BAG.Data.Items.List = {

    -- ══════════════════════════════════════════════════════════════════
    -- GENERAL / CONSUMABLES
    -- ══════════════════════════════════════════════════════════════════
    [6948]  = { name = "Hearthstone",              purpose = "Teleports you to your bound inn location" },
    [4604]  = { name = "Forest Mushroom Cap",      purpose = "Basic food for health regeneration" },
    [159]   = { name = "Refreshing Spring Water",  purpose = "Basic water for mana regeneration" },
    [2070]  = { name = "Darnassian Bleu",          purpose = "Cheese food item for regen" },
    [117]   = { name = "Tough Jerky",              purpose = "Simple food restoring health over time" },
    [4540]  = { name = "Tough Hunk of Bread",      purpose = "Bread restoring health while eating" },
    [2287]  = { name = "Haunch of Meat",           purpose = "Moderate food for mid-level health regen" },
    [3927]  = { name = "Fine Aged Cheddar",        purpose = "Quality food for health restoration" },

    -- ══════════════════════════════════════════════════════════════════
    -- QUEST ITEMS (commonly encountered)
    -- ══════════════════════════════════════════════════════════════════
    [5051]  = { name = "Lean Wolf Flank",          purpose = "Gathered from wolves for a trapping assignment" },
    [11584] = { name = "Cactus Apple",             purpose = "Desert fruit gathered for a survival task" },
    [23705] = { name = "Felblood Sample",          purpose = "Demonic residue collected from slain demons in Outland" },
    [23709] = { name = "Bonechewer Blood",         purpose = "Blood gathered from Bonechewer clan orcs" },
    [24401] = { name = "Unidentified Plant Parts", purpose = "Unknown flora collected for Cenarion research" },
    [25433] = { name = "Mature Spore Sac",         purpose = "Mushroom spore sac from Zangarmarsh creatures" },
    [25459] = { name = "Naga Claws",               purpose = "Proof of naga elimination in Zangarmarsh" },
    [29740] = { name = "Depleted Crystal Focus",   purpose = "A drained crystal found in Netherstorm" },

    -- ══════════════════════════════════════════════════════════════════
    -- PROFESSION MATERIALS
    -- ══════════════════════════════════════════════════════════════════
    [2770]  = { name = "Copper Ore",               purpose = "Basic mining material for early smelting" },
    [2771]  = { name = "Tin Ore",                  purpose = "Mining material used in bronze and tin bars" },
    [2772]  = { name = "Iron Ore",                 purpose = "Mid-level mining ore for iron and steel" },
    [3858]  = { name = "Mithril Ore",              purpose = "Quality ore for mid-high level smithing" },
    [10620] = { name = "Thorium Ore",              purpose = "High-level Azeroth mining ore" },
    [23424] = { name = "Fel Iron Ore",             purpose = "Basic Outland mining ore found in Hellfire" },
    [23425] = { name = "Adamantite Ore",           purpose = "Premium Outland mining ore" },
    [2447]  = { name = "Peacebloom",               purpose = "Common herb for basic alchemy" },
    [2449]  = { name = "Earthroot",                purpose = "Early herb found near terrain features" },
    [2450]  = { name = "Briarthorn",               purpose = "Thorny herb for low-level potions" },
    [3820]  = { name = "Stranglekelp",             purpose = "Aquatic herb found along coastlines" },
    [22785] = { name = "Felweed",                  purpose = "Common Outland herb found throughout Hellfire" },
    [22786] = { name = "Dreaming Glory",           purpose = "Luminous Outland herb found in most zones" },
    [22789] = { name = "Terocone",                 purpose = "Terokkar-specific herb with alchemical value" },
    [2318]  = { name = "Light Leather",            purpose = "Basic skinning material from low-level beasts" },
    [2319]  = { name = "Medium Leather",           purpose = "Mid-grade leather from moderate beasts" },
    [4234]  = { name = "Heavy Leather",            purpose = "Sturdy leather from tougher creatures" },
    [4304]  = { name = "Thick Leather",            purpose = "High-quality leather from level 40+ beasts" },
    [8170]  = { name = "Rugged Leather",           purpose = "Top-tier Azeroth leather" },
    [21887] = { name = "Knothide Leather",         purpose = "Standard Outland leather from TBC creatures" },

    -- ══════════════════════════════════════════════════════════════════
    -- VENDOR / REAGENT ITEMS
    -- ══════════════════════════════════════════════════════════════════
    [3371]  = { name = "Empty Vial",               purpose = "Alchemy container bought from vendors" },
    [3372]  = { name = "Leaded Vial",              purpose = "Mid-level alchemy container" },
    [8925]  = { name = "Crystal Vial",             purpose = "High-level alchemy container" },
    [2880]  = { name = "Weak Flux",                purpose = "Blacksmithing reagent from trade vendors" },
    [3466]  = { name = "Strong Flux",              purpose = "Higher-level blacksmithing reagent" },
    [2605]  = { name = "Green Dye",                purpose = "Dye used in tailoring and leatherworking" },
    [4289]  = { name = "Salt",                     purpose = "Preservative used in leatherworking recipes" },
    [14341] = { name = "Rune Thread",              purpose = "Thread for high-level tailoring patterns" },
}

--- Get item data by ID.
function BAG.Data.Items:Get(itemID)
    return self.List[itemID]
end

--- Get item name by ID.
function BAG.Data.Items:GetName(itemID)
    local item = self.List[itemID]
    return item and item.name or ("Item #" .. tostring(itemID))
end
