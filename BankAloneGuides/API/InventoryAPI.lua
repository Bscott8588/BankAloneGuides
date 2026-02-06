--[[
    Bank Alone Guides - Inventory API Wrapper
    SCS / Bank Alone Guides
    
    Wraps inventory/bag-related WoW functions.
]]

local BAG = BankAlone

BAG.API = BAG.API or {}
BAG.API.Inventory = BAG.API.Inventory or {}
local InvAPI = BAG.API.Inventory

-- Count how many of an item the player has in bags
function InvAPI:CountItem(itemID)
    if not itemID then return 0 end
    local count = 0

    for bag = 0, 4 do
        local numSlots = GetContainerNumSlots(bag) or 0
        for slot = 1, numSlots do
            local itemLink = GetContainerItemLink(bag, slot)
            if itemLink then
                local id = self:GetItemIDFromLink(itemLink)
                if id == itemID then
                    local _, itemCount = GetContainerItemInfo(bag, slot)
                    count = count + (itemCount or 0)
                end
            end
        end
    end

    return count
end

-- Check if the player has at least one of an item
function InvAPI:HasItem(itemID)
    return self:CountItem(itemID) > 0
end

-- Get item ID from an item link
function InvAPI:GetItemIDFromLink(itemLink)
    if not itemLink then return nil end
    local id = itemLink:match("item:(%d+)")
    return id and tonumber(id) or nil
end

-- Get free bag space
function InvAPI:GetFreeBagSlots()
    local free = 0
    for bag = 0, 4 do
        local numFree, bagType = GetContainerNumFreeSlots(bag)
        if bagType == 0 then -- Regular bags only
            free = free + (numFree or 0)
        end
    end
    return free
end

-- Get total bag slots
function InvAPI:GetTotalBagSlots()
    local total = 0
    for bag = 0, 4 do
        total = total + (GetContainerNumSlots(bag) or 0)
    end
    return total
end

-- Check if bags are full
function InvAPI:AreBagsFull()
    return self:GetFreeBagSlots() == 0
end

-- Find an item in bags (returns bag, slot)
function InvAPI:FindItem(itemID)
    if not itemID then return nil, nil end

    for bag = 0, 4 do
        local numSlots = GetContainerNumSlots(bag) or 0
        for slot = 1, numSlots do
            local itemLink = GetContainerItemLink(bag, slot)
            if itemLink then
                local id = self:GetItemIDFromLink(itemLink)
                if id == itemID then
                    return bag, slot
                end
            end
        end
    end

    return nil, nil
end

-- Check if player has an item equipped
function InvAPI:IsEquipped(itemID)
    if not itemID then return false end

    for slot = 1, 19 do
        local link = GetInventoryItemLink("player", slot)
        if link then
            local id = self:GetItemIDFromLink(link)
            if id == itemID then
                return true
            end
        end
    end

    return false
end
