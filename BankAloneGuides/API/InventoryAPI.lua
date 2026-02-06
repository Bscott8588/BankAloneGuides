-------------------------------------------------------------------------------
-- Bank Alone Guides — API / InventoryAPI
-- Inventory and bag item helpers
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.InventoryAPI = BAG.InventoryAPI or {}

--- Count the total number of a specific item across all bags.
-- @param itemID  The numeric item ID.
-- @return number
function BAG.InventoryAPI:CountItem(itemID)
    if not itemID then return 0 end
    local total = 0
    -- Bags 0-4 (backpack + 4 bags)
    for bag = 0, 4 do
        local slots = GetContainerNumSlots and GetContainerNumSlots(bag) or 0
        for slot = 1, slots do
            local info = GetContainerItemInfo and GetContainerItemInfo(bag, slot)
            if info then
                local link = GetContainerItemLink(bag, slot)
                if link then
                    local id = tonumber(link:match("item:(%d+)"))
                    if id == itemID then
                        local _, count = GetContainerItemInfo(bag, slot)
                        total = total + (count or 1)
                    end
                end
            end
        end
    end
    return total
end

--- Check if the player has at least one of an item.
-- @param itemID  The numeric item ID.
-- @return boolean
function BAG.InventoryAPI:HasItem(itemID)
    return self:CountItem(itemID) > 0
end

--- Get the number of free bag slots.
-- @return number
function BAG.InventoryAPI:GetFreeBagSlots()
    local free = 0
    for bag = 0, 4 do
        local numFree, bagType = GetContainerNumFreeSlots and GetContainerNumFreeSlots(bag) or 0
        if bagType == 0 or not bagType then
            free = free + (numFree or 0)
        end
    end
    return free
end

--- Check if a specific item is equipped.
-- @param itemID  The numeric item ID.
-- @return boolean
function BAG.InventoryAPI:IsEquipped(itemID)
    if not itemID then return false end
    -- Check all equipment slots (1-19)
    for slot = 1, 19 do
        local link = GetInventoryItemLink("player", slot)
        if link then
            local id = tonumber(link:match("item:(%d+)"))
            if id == itemID then return true end
        end
    end
    return false
end
