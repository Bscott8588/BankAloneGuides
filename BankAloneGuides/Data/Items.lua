--[[
    Bank Alone Guides - Item Database
    Essential items referenced in guides
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
BAG.Data.Items = {}

-- Item data structure:
-- {
--   name = item name
--   purpose = why this item is referenced in guides
--   questRelated = quest ID if applicable
-- }

-- Quest Items (examples - expand as needed)
BAG.Data.Items[6948] = {name = "Hearthstone", purpose = "Return to inn"}
BAG.Data.Items[5175] = {name = "Earth Totem", purpose = "Shaman class quest"}
BAG.Data.Items[4306] = {name = "Silk Cloth", purpose = "Cloth turn-ins"}
BAG.Data.Items[14047] = {name = "Runecloth", purpose = "Cloth turn-ins"}
BAG.Data.Items[23572] = {name = "Primal Nether", purpose = "TBC crafting"}

-- Bags
BAG.Data.Items[4500] = {name = "Traveler's Backpack", purpose = "14-slot bag"}
BAG.Data.Items[21841] = {name = "Netherweave Bag", purpose = "16-slot bag (TBC)"}
BAG.Data.Items[21843] = {name = "Imbued Netherweave Bag", purpose = "18-slot bag (TBC)"}

-- Food and Water
BAG.Data.Items[117] = {name = "Tough Jerky", purpose = "Basic food"}
BAG.Data.Items[159] = {name = "Refreshing Spring Water", purpose = "Basic water"}
BAG.Data.Items[27859] = {name = "Zangar Caps", purpose = "TBC food"}

-- Potions
BAG.Data.Items[858] = {name = "Lesser Healing Potion", purpose = "Low level healing"}
BAG.Data.Items[929] = {name = "Healing Potion", purpose = "Mid level healing"}
BAG.Data.Items[1710] = {name = "Greater Healing Potion", purpose = "High level healing"}
BAG.Data.Items[22829] = {name = "Super Healing Potion", purpose = "TBC healing"}

-- Profession Materials
BAG.Data.Items[2589] = {name = "Linen Cloth", purpose = "Tailoring 1-75"}
BAG.Data.Items[2592] = {name = "Wool Cloth", purpose = "Tailoring 75-150"}
BAG.Data.Items[2596] = {name = "Copper Ore", purpose = "Mining/Blacksmithing 1-65"}
BAG.Data.Items[2771] = {name = "Tin Ore", purpose = "Mining/Blacksmithing 65-125"}
BAG.Data.Items[2775] = {name = "Silver Ore", purpose = "Mining/Jewelcrafting"}
BAG.Data.Items[2776] = {name = "Gold Ore", purpose = "Mining/Jewelcrafting"}
BAG.Data.Items[3575] = {name = "Iron Ore", purpose = "Mining/Blacksmithing 125-175"}
BAG.Data.Items[7911] = {name = "Truesilver Ore", purpose = "Mining/Blacksmithing 230+"}
BAG.Data.Items[10620] = {name = "Thorium Ore", purpose = "Mining/Blacksmithing 230-300"}
BAG.Data.Items[23424] = {name = "Fel Iron Ore", purpose = "TBC Mining/Blacksmithing 300-350"}
BAG.Data.Items[23425] = {name = "Adamantite Ore", purpose = "TBC Mining/Blacksmithing 325-375"}

-- Herbs
BAG.Data.Items[765] = {name = "Silverleaf", purpose = "Herbalism 1-50"}
BAG.Data.Items[2447] = {name = "Peacebloom", purpose = "Herbalism 1-50"}
BAG.Data.Items[2449] = {name = "Earthroot", purpose = "Herbalism 15-100"}
BAG.Data.Items[3820] = {name = "Stranglekelp", purpose = "Herbalism 85-175"}
BAG.Data.Items[13464] = {name = "Golden Sansam", purpose = "Herbalism 260+"}
BAG.Data.Items[22785] = {name = "Felweed", purpose = "TBC Herbalism 300-350"}
BAG.Data.Items[22786] = {name = "Dreaming Glory", purpose = "TBC Herbalism 315-365"}

-- Leather
BAG.Data.Items[2934] = {name = "Ruined Leather Scraps", purpose = "Leatherworking 1-25"}
BAG.Data.Items[2318] = {name = "Light Leather", purpose = "Leatherworking 1-100"}
BAG.Data.Items[2319] = {name = "Medium Leather", purpose = "Leatherworking 100-150"}
BAG.Data.Items[4234] = {name = "Heavy Leather", purpose = "Leatherworking 150-200"}
BAG.Data.Items[8170] = {name = "Rugged Leather", purpose = "Leatherworking 250-300"}
BAG.Data.Items[25649] = {name = "Knothide Leather", purpose = "TBC Leatherworking 300-350"}

-- Key quest items (examples)
BAG.Data.Items[12324] = {name = "Draenethyst Crystals", purpose = "Quest: The Missing Diplomat"}
BAG.Data.Items[23580] = {name = "Mark of Honor Hold", purpose = "TBC reputation token"}
BAG.Data.Items[24401] = {name = "Firewing Signet", purpose = "TBC quest: Firewing Signets"}

-- Helper function to get item info
function BAG.Data:GetItemInfo(itemID)
    return self.Items[itemID]
end

-- Helper function to find item by name
function BAG.Data:FindItemByName(itemName)
    for itemID, itemData in pairs(self.Items) do
        if string.lower(itemData.name) == string.lower(itemName) then
            return itemID, itemData
        end
    end
    return nil
end

print("|cff00B3FF[Bank Alone Guides]|r Item database loaded (" .. BAG.Utils:TableSize(BAG.Data.Items) .. " items)")
