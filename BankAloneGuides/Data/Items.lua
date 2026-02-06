--[[
    Bank Alone Guides - Item Database
    Important items referenced in guides
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Data.Items = {
    -- Hearthstone
    [6948] = {
        name = "Hearthstone",
        purpose = "Teleport to your inn location",
        category = "utility",
    },
    
    -- Quest Items (examples - these are common TBC quest items)
    [23424] = {
        name = "Fel Iron Ore",
        purpose = "Mining material from Outland",
        category = "material",
    },
    [21877] = {
        name = "Netherweave Cloth",
        purpose = "Tailoring material from Outland",
        category = "material",
    },
    [22575] = {
        name = "Mote of Air",
        purpose = "Crafting material",
        category = "material",
    },
    [22576] = {
        name = "Mote of Earth",
        purpose = "Crafting material",
        category = "material",
    },
    [22577] = {
        name = "Mote of Fire",
        purpose = "Crafting material",
        category = "material",
    },
    [22578] = {
        name = "Mote of Mana",
        purpose = "Crafting material",
        category = "material",
    },
    [22573] = {
        name = "Mote of Life",
        purpose = "Crafting material",
        category = "material",
    },
    [22574] = {
        name = "Mote of Shadow",
        purpose = "Crafting material",
        category = "material",
    },
    [21886] = {
        name = "Primal Earth",
        purpose = "Combined from 10 Motes of Earth",
        category = "primal",
    },
    [21884] = {
        name = "Primal Fire",
        purpose = "Combined from 10 Motes of Fire",
        category = "primal",
    },
    [21885] = {
        name = "Primal Water",
        purpose = "Combined from 10 Motes of Water",
        category = "primal",
    },
    [22451] = {
        name = "Primal Air",
        purpose = "Combined from 10 Motes of Air",
        category = "primal",
    },
    [21883] = {
        name = "Primal Shadow",
        purpose = "Combined from 10 Motes of Shadow",
        category = "primal",
    },
    [21886] = {
        name = "Primal Life",
        purpose = "Combined from 10 Motes of Life",
        category = "primal",
    },
    
    -- Bags
    [4496] = {
        name = "Small Brown Pouch",
        purpose = "6-slot bag",
        category = "bag",
    },
    [14046] = {
        name = "Runecloth Bag",
        purpose = "14-slot bag",
        category = "bag",
    },
    [21841] = {
        name = "Netherweave Bag",
        purpose = "16-slot bag (TBC crafted)",
        category = "bag",
    },
    
    -- Food and Drink (common vendor items)
    [117] = {
        name = "Tough Jerky",
        purpose = "Level 1 food",
        category = "consumable",
    },
    [159] = {
        name = "Refreshing Spring Water",
        purpose = "Level 1 drink",
        category = "consumable",
    },
    [4599] = {
        name = "Cured Ham Steak",
        purpose = "Level 45 food",
        category = "consumable",
    },
    [8766] = {
        name = "Morning Glory Dew",
        purpose = "Level 45 drink",
        category = "consumable",
    },
    [27854] = {
        name = "Smoked Talbuk Venison",
        purpose = "Level 55 food (TBC)",
        category = "consumable",
    },
    [27860] = {
        name = "Purified Draenic Water",
        purpose = "Level 65 drink (TBC)",
        category = "consumable",
    },
    
    -- Potions
    [118] = {
        name = "Minor Healing Potion",
        purpose = "Restores health",
        category = "potion",
    },
    [858] = {
        name = "Lesser Healing Potion",
        purpose = "Restores health",
        category = "potion",
    },
    [929] = {
        name = "Healing Potion",
        purpose = "Restores health",
        category = "potion",
    },
    [22829] = {
        name = "Super Healing Potion",
        purpose = "Restores health (TBC)",
        category = "potion",
    },
    
    -- Bandages
    [1251] = {
        name = "Linen Bandage",
        purpose = "First Aid healing",
        category = "bandage",
    },
    [2581] = {
        name = "Heavy Linen Bandage",
        purpose = "First Aid healing",
        category = "bandage",
    },
    [21990] = {
        name = "Netherweave Bandage",
        purpose = "First Aid healing (TBC)",
        category = "bandage",
    },
    
    -- Profession Tools
    [2901] = {
        name = "Mining Pick",
        purpose = "Required for Mining",
        category = "tool",
    },
    [7005] = {
        name = "Skinning Knife",
        purpose = "Required for Skinning",
        category = "tool",
    },
    [5956] = {
        name = "Blacksmith Hammer",
        purpose = "Required for Blacksmithing",
        category = "tool",
    },
    
    -- Mount Items (examples)
    [18776] = {
        name = "Swift Riding",
        purpose = "Epic mount skill",
        category = "skill",
    },
    [25470] = {
        name = "Riding Skill Book",
        purpose = "Learn riding",
        category = "skill",
    },
}

-- Helper function to get item info
function BAG.Data.Items:GetItemInfo(itemID)
    return self[itemID]
end

-- Helper function to get items by category
function BAG.Data.Items:GetItemsByCategory(category)
    local items = {}
    
    for itemID, itemInfo in pairs(self) do
        if type(itemInfo) == "table" and itemInfo.category == category then
            items[itemID] = itemInfo
        end
    end
    
    return items
end
