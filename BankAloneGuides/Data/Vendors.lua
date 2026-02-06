--[[
    Bank Alone Guides - Vendor Database
    Important vendors for TBC Classic Anniversary
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
BAG.Data.Vendors = {}

-- Vendor data structure:
-- {
--   name = vendor name
--   type = "general", "reagent", "armor", "weapon", "profession", "recipe"
--   zone = location zone
--   x = coordinate (0-1)
--   y = coordinate (0-1)
--   faction = "Alliance", "Horde", or "Neutral"
--   specialties = {list of notable items or purposes}
-- }

-- GENERAL GOODS VENDORS
BAG.Data.Vendors["GeneralGoods_SW"] = {
    name = "Tharynn Bouden",
    type = "general",
    zone = "Stormwind City",
    x = 0.64, y = 0.71,
    faction = "Alliance",
    specialties = {"Basic supplies", "Bags", "Food"}
}

BAG.Data.Vendors["GeneralGoods_Org"] = {
    name = "Kithas",
    type = "general",
    zone = "Orgrimmar",
    x = 0.46, y = 0.46,
    faction = "Horde",
    specialties = {"Basic supplies", "Bags", "Food"}
}

-- REAGENT VENDORS
BAG.Data.Vendors["Reagent_SW"] = {
    name = "Maginor Dumas",
    type = "reagent",
    zone = "Stormwind City",
    x = 0.41, y = 0.85,
    faction = "Alliance",
    specialties = {"Arcane powder", "Runes", "Magical components"}
}

BAG.Data.Vendors["Reagent_Org"] = {
    name = "Kithas",
    type = "reagent",
    zone = "Orgrimmar",
    x = 0.53, y = 0.49,
    faction = "Horde",
    specialties = {"Arcane powder", "Runes", "Magical components"}
}

-- ARMOR VENDORS
BAG.Data.Vendors["Armor_SW"] = {
    name = "Thurman Mullby",
    type = "armor",
    zone = "Stormwind City",
    x = 0.75, y = 0.67,
    faction = "Alliance",
    specialties = {"Mail", "Plate", "Shields"}
}

BAG.Data.Vendors["Armor_Org"] = {
    name = "Kaja",
    type = "armor",
    zone = "Orgrimmar",
    x = 0.48, y = 0.59,
    faction = "Horde",
    specialties = {"Mail", "Plate", "Shields"}
}

-- WEAPON VENDORS
BAG.Data.Vendors["Weapon_SW"] = {
    name = "Woo Ping",
    type = "weapon",
    zone = "Stormwind City",
    x = 0.63, y = 0.38,
    faction = "Alliance",
    specialties = {"Swords", "Maces", "Axes"}
}

BAG.Data.Vendors["Weapon_Org"] = {
    name = "Zendo'jian",
    type = "weapon",
    zone = "Orgrimmar",
    x = 0.58, y = 0.56,
    faction = "Horde",
    specialties = {"Axes", "Daggers", "Bows"}
}

-- PROFESSION SUPPLY VENDORS

-- Mining Supplies
BAG.Data.Vendors["MiningSupplies_IF"] = {
    name = "Geofram Bouldertoe",
    type = "profession",
    zone = "Ironforge",
    x = 0.50, y = 0.26,
    faction = "Alliance",
    specialties = {"Mining picks", "Ore"}
}

-- Engineering Supplies
BAG.Data.Vendors["EngineeringSupplies_SW"] = {
    name = "Billibub Cogspinner",
    type = "profession",
    zone = "Stormwind City",
    x = 0.63, y = 0.37,
    faction = "Alliance",
    specialties = {"Engineer's tools", "Schematics"}
}

BAG.Data.Vendors["EngineeringSupplies_Org"] = {
    name = "Sovik",
    type = "profession",
    zone = "Orgrimmar",
    x = 0.75, y = 0.25,
    faction = "Horde",
    specialties = {"Engineer's tools", "Schematics"}
}

-- Alchemy Supplies
BAG.Data.Vendors["AlchemySupplies_SW"] = {
    name = "Maria Lumere",
    type = "profession",
    zone = "Stormwind City",
    x = 0.56, y = 0.85,
    faction = "Alliance",
    specialties = {"Vials", "Crystal vials"}
}

BAG.Data.Vendors["AlchemySupplies_UC"] = {
    name = "Algernon",
    type = "profession",
    zone = "Undercity",
    x = 0.51, y = 0.74,
    faction = "Horde",
    specialties = {"Vials", "Crystal vials"}
}

-- Cooking Supplies
BAG.Data.Vendors["CookingSupplies_SW"] = {
    name = "Kendor Kabonka",
    type = "profession",
    zone = "Stormwind City",
    x = 0.74, y = 0.37,
    faction = "Alliance",
    specialties = {"Recipes", "Spices"}
}

BAG.Data.Vendors["CookingSupplies_Org"] = {
    name = "Nerrist",
    type = "profession",
    zone = "Orgrimmar",
    x = 0.57, y = 0.54,
    faction = "Horde",
    specialties = {"Recipes", "Spices"}
}

-- OUTLAND VENDORS

-- General Goods Outland
BAG.Data.Vendors["GeneralGoods_Shattrath"] = {
    name = "Trader Narasu",
    type = "general",
    zone = "Shattrath City",
    x = 0.48, y = 0.48,
    faction = "Neutral",
    specialties = {"General supplies", "Exotic goods"}
}

-- Reagent Vendor Outland
BAG.Data.Vendors["Reagent_Shattrath"] = {
    name = "Quartermaster Endarin",
    type = "reagent",
    zone = "Shattrath City",
    x = 0.48, y = 0.26,
    faction = "Neutral",
    specialties = {"Reagents", "Runes"}
}

-- Profession Supplies Outland
BAG.Data.Vendors["ProfessionSupplies_Hellfire_A"] = {
    name = "Felannia",
    type = "profession",
    zone = "Hellfire Peninsula",
    x = 0.54, y = 0.38,
    faction = "Alliance",
    specialties = {"TBC profession supplies"}
}

BAG.Data.Vendors["ProfessionSupplies_Hellfire_H"] = {
    name = "Kalaen",
    type = "profession",
    zone = "Hellfire Peninsula",
    x = 0.55, y = 0.37,
    faction = "Horde",
    specialties = {"TBC profession supplies"}
}

-- RECIPE VENDORS
BAG.Data.Vendors["Recipes_Cooking_SW"] = {
    name = "Kendor Kabonka",
    type = "recipe",
    zone = "Stormwind City",
    x = 0.74, y = 0.37,
    faction = "Alliance",
    specialties = {"Cooking recipes"}
}

BAG.Data.Vendors["Recipes_FirstAid_SW"] = {
    name = "Shaina Fuller",
    type = "recipe",
    zone = "Stormwind City",
    x = 0.50, y = 0.46,
    faction = "Alliance",
    specialties = {"First Aid manuals"}
}

-- MOUNT VENDORS
BAG.Data.Vendors["Mount_Human"] = {
    name = "Katie Hunter",
    type = "mount",
    zone = "Elwynn Forest",
    x = 0.77, y = 0.65,
    faction = "Alliance",
    specialties = {"Horses"}
}

BAG.Data.Vendors["Mount_Dwarf"] = {
    name = "Veron Amberstill",
    type = "mount",
    zone = "Dun Morogh",
    x = 0.63, y = 0.50,
    faction = "Alliance",
    specialties = {"Rams"}
}

BAG.Data.Vendors["Mount_Orc"] = {
    name = "Ogunaro Wolfrunner",
    type = "mount",
    zone = "Durotar",
    x = 0.51, y = 0.40,
    faction = "Horde",
    specialties = {"Wolves"}
}

BAG.Data.Vendors["Mount_Tauren"] = {
    name = "Kar Stormsinger",
    type = "mount",
    zone = "Mulgore",
    x = 0.47, y = 0.58,
    faction = "Horde",
    specialties = {"Kodos"}
}

-- Flying Mount Vendors (TBC)
BAG.Data.Vendors["FlyingMount_Hellfire_A"] = {
    name = "Brunn Flamebeard",
    type = "mount",
    zone = "Hellfire Peninsula",
    x = 0.54, y = 0.62,
    faction = "Alliance",
    specialties = {"Gryphons", "Flying mounts"}
}

BAG.Data.Vendors["FlyingMount_Hellfire_H"] = {
    name = "Dama Wildmane",
    type = "mount",
    zone = "Hellfire Peninsula",
    x = 0.54, y = 0.41,
    faction = "Horde",
    specialties = {"Wind riders", "Flying mounts"}
}

-- Helper functions
function BAG.Data:GetVendorsByType(vendorType, faction)
    local vendors = {}
    
    for vendorID, vendorData in pairs(self.Vendors) do
        if vendorData.type == vendorType then
            if not faction or vendorData.faction == "Neutral" or vendorData.faction == faction then
                table.insert(vendors, {id = vendorID, data = vendorData})
            end
        end
    end
    
    return vendors
end

function BAG.Data:GetVendorsInZone(zoneName)
    local vendors = {}
    
    for vendorID, vendorData in pairs(self.Vendors) do
        if vendorData.zone == zoneName then
            table.insert(vendors, {id = vendorID, data = vendorData})
        end
    end
    
    return vendors
end

function BAG.Data:FindVendorNearby(vendorType, zone, x, y, maxDistance)
    maxDistance = maxDistance or 0.1
    
    local nearest = nil
    local nearestDistance = maxDistance
    
    for vendorID, vendorData in pairs(self.Vendors) do
        if vendorData.type == vendorType and vendorData.zone == zone then
            if vendorData.x and vendorData.y and x and y then
                local distance = BAG.Utils:Distance(x, y, vendorData.x, vendorData.y)
                if distance < nearestDistance then
                    nearest = {id = vendorID, data = vendorData}
                    nearestDistance = distance
                end
            end
        end
    end
    
    return nearest
end

print("|cff00B3FF[Bank Alone Guides]|r Vendor database loaded (" .. BAG.Utils:TableSize(BAG.Data.Vendors) .. " vendors)")
