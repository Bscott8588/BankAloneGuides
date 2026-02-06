--[[
    Bank Alone Guides - Vendor Database
    Important vendors for TBC Classic guides
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Data.Vendors = {
    -- Alliance Vendors
    
    -- General Goods
    ["Alliance_General_SW"] = {
        name = "Edna Mullby",
        zone = "Stormwind City",
        coords = {0.64, 0.71},
        faction = "Alliance",
        type = "Food and Drink",
        description = "Sells food and drinks for all levels",
    },
    ["Alliance_General_IF"] = {
        name = "Innkeeper Firebrew",
        zone = "Ironforge",
        coords = {0.18, 0.51},
        faction = "Alliance",
        type = "Food and Drink",
        description = "Innkeeper selling food and drinks",
    },
    
    -- Trade Supplies
    ["Alliance_TradeSupplies_SW"] = {
        name = "Adele Fielder",
        zone = "Stormwind City",
        coords = {0.64, 0.71},
        faction = "Alliance",
        type = "Trade Supplies",
        description = "Sells threads, dyes, and crafting reagents",
    },
    
    -- Reagent Vendors
    ["Alliance_Reagent_SW"] = {
        name = "Eldrin",
        zone = "Stormwind City",
        coords = {0.43, 0.80},
        faction = "Alliance",
        type = "Reagents",
        description = "Sells magic reagents",
    },
    
    -- Mining Supplies
    ["Alliance_Mining_SW"] = {
        name = "Wulmort Jinglepocket",
        zone = "Stormwind City",
        coords = {0.59, 0.70},
        faction = "Alliance",
        type = "Mining Supplies",
        description = "Sells mining picks and flux",
    },
    
    -- Outland Vendors (Alliance)
    ["Alliance_General_HonorHold"] = {
        name = "Quartermaster Brevin",
        zone = "Hellfire Peninsula",
        coords = {0.56, 0.62},
        faction = "Alliance",
        type = "Quartermaster",
        description = "Honor Hold reputation rewards",
    },
    ["Alliance_Food_HonorHold"] = {
        name = "Haalrun",
        zone = "Hellfire Peninsula",
        coords = {0.54, 0.63},
        faction = "Alliance",
        type = "Food and Drink",
        description = "Outland food and drink vendor",
    },
    
    -- Horde Vendors
    
    -- General Goods
    ["Horde_General_Org"] = {
        name = "Kaja",
        zone = "Orgrimmar",
        coords = {0.57, 0.53},
        faction = "Horde",
        type = "Food and Drink",
        description = "Sells food and drinks",
    },
    ["Horde_General_UC"] = {
        name = "Innkeeper Norman",
        zone = "Undercity",
        coords = {0.67, 0.38},
        faction = "Horde",
        type = "Food and Drink",
        description = "Innkeeper selling food and drinks",
    },
    
    -- Trade Supplies
    ["Horde_TradeSupplies_Org"] = {
        name = "Kithas",
        zone = "Orgrimmar",
        coords = {0.60, 0.50},
        faction = "Horde",
        type = "Trade Supplies",
        description = "Sells threads, dyes, and crafting reagents",
    },
    
    -- Reagent Vendors
    ["Horde_Reagent_Org"] = {
        name = "Hagrus",
        zone = "Orgrimmar",
        coords = {0.46, 0.46},
        faction = "Horde",
        type = "Reagents",
        description = "Sells magic reagents",
    },
    
    -- Mining Supplies
    ["Horde_Mining_Org"] = {
        name = "Wulan",
        zone = "Orgrimmar",
        coords = {0.72, 0.35},
        faction = "Horde",
        type = "Mining Supplies",
        description = "Sells mining picks and flux",
    },
    
    -- Outland Vendors (Horde)
    ["Horde_General_Thrallmar"] = {
        name = "Quartermaster Urgronn",
        zone = "Hellfire Peninsula",
        coords = {0.54, 0.37},
        faction = "Horde",
        type = "Quartermaster",
        description = "Thrallmar reputation rewards",
    },
    ["Horde_Food_Thrallmar"] = {
        name = "Mathar G'ochar",
        zone = "Hellfire Peninsula",
        coords = {0.55, 0.38},
        faction = "Horde",
        type = "Food and Drink",
        description = "Outland food and drink vendor",
    },
    
    -- Neutral Vendors (Shattrath)
    
    ["Neutral_General_Shatt"] = {
        name = "Trader Endernor",
        zone = "Shattrath City",
        coords = {0.74, 0.31},
        faction = "Both",
        type = "General Goods",
        description = "Sells various supplies",
    },
    ["Neutral_Food_Shatt"] = {
        name = "Innkeeper Haelthol",
        zone = "Shattrath City",
        coords = {0.28, 0.49},
        faction = "Both",
        type = "Food and Drink",
        description = "Aldor inn food and drink",
    },
    ["Neutral_Reagent_Shatt"] = {
        name = "Paldesse",
        zone = "Shattrath City",
        coords = {0.45, 0.20},
        faction = "Both",
        type = "Reagents",
        description = "Sells magic reagents in Shattrath",
    },
    
    -- Reputation Vendors
    
    ["Neutral_Cenarion_Expedition"] = {
        name = "Fedryen Swiftspear",
        zone = "Zangarmarsh",
        coords = {0.78, 0.63},
        faction = "Both",
        type = "Quartermaster",
        description = "Cenarion Expedition reputation rewards",
    },
    ["Neutral_Consortium"] = {
        name = "Consortium Quartermaster",
        zone = "Nagrand",
        coords = {0.51, 0.56},
        faction = "Both",
        type = "Quartermaster",
        description = "Consortium reputation rewards",
    },
    
    -- Profession Recipe Vendors
    
    ["Neutral_Alchemy_Recipes"] = {
        name = "Skreah",
        zone = "Shattrath City",
        coords = {0.66, 0.68},
        faction = "Both",
        type = "Recipe Vendor",
        profession = "Alchemy",
        description = "Sells Alchemy recipes",
    },
    ["Neutral_Cooking_Recipes"] = {
        name = "Gaston",
        zone = "Shattrath City",
        coords = {0.62, 0.68},
        faction = "Both",
        type = "Recipe Vendor",
        profession = "Cooking",
        description = "Sells Cooking recipes",
    },
    ["Neutral_Enchanting_Recipes"] = {
        name = "Madame Ruby",
        zone = "Shattrath City",
        coords = {0.43, 0.92},
        faction = "Both",
        type = "Recipe Vendor",
        profession = "Enchanting",
        description = "Sells Enchanting formulas",
    },
}

-- Helper function to get vendor info
function BAG.Data.Vendors:GetVendor(vendorKey)
    return self[vendorKey]
end

-- Helper function to find vendors by type and faction
function BAG.Data.Vendors:FindVendor(vendorType, faction, zone)
    for key, vendor in pairs(self) do
        if type(vendor) == "table" then
            if vendor.type == vendorType then
                if faction == "Both" or vendor.faction == faction or vendor.faction == "Both" then
                    if not zone or vendor.zone == zone then
                        return vendor
                    end
                end
            end
        end
    end
    return nil
end

-- Helper function to get vendors by zone
function BAG.Data.Vendors:GetVendorsByZone(zoneName)
    local vendors = {}
    
    for key, vendor in pairs(self) do
        if type(vendor) == "table" and vendor.zone == zoneName then
            table.insert(vendors, vendor)
        end
    end
    
    return vendors
end

-- Helper function to get vendors by profession
function BAG.Data.Vendors:GetVendorsByProfession(profession, faction)
    local vendors = {}
    
    for key, vendor in pairs(self) do
        if type(vendor) == "table" and vendor.profession == profession then
            if faction == "Both" or vendor.faction == faction or vendor.faction == "Both" then
                table.insert(vendors, vendor)
            end
        end
    end
    
    return vendors
end
