--[[
    Bank Alone Guides - Inventory API
    Wraps WoW inventory and item functions
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.InventoryAPI = {}

-- Count items in bags by item ID
function BAG.InventoryAPI:CountItem(itemID)
    if not itemID then return 0 end
    
    local count = 0
    
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) or 0 do
            local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(bag, slot)
            if itemLink then
                local linkItemID = tonumber(itemLink:match("item:(%d+)"))
                if linkItemID == itemID then
                    count = count + (itemCount or 1)
                end
            end
        end
    end
    
    return count
end

-- Check if player has an item
function BAG.InventoryAPI:HasItem(itemID)
    return self:CountItem(itemID) > 0
end

-- Find item location in bags
function BAG.InventoryAPI:FindItem(itemID)
    if not itemID then return nil, nil end
    
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) or 0 do
            local _, _, _, _, _, _, itemLink = GetContainerItemInfo(bag, slot)
            if itemLink then
                local linkItemID = tonumber(itemLink:match("item:(%d+)"))
                if linkItemID == itemID then
                    return bag, slot
                end
            end
        end
    end
    
    return nil, nil
end

-- Get item info by ID
function BAG.InventoryAPI:GetItemInfo(itemID)
    if not itemID then return nil end
    
    local name, link, quality, iLevel, reqLevel, class, subclass, maxStack, equipSlot, texture = GetItemInfo(itemID)
    
    if not name then return nil end
    
    return {
        name = name,
        link = link,
        quality = quality,
        itemLevel = iLevel,
        requiredLevel = reqLevel,
        class = class,
        subclass = subclass,
        maxStack = maxStack,
        equipSlot = equipSlot,
        texture = texture,
    }
end

-- Use an item
function BAG.InventoryAPI:UseItem(itemID)
    local bag, slot = self:FindItem(itemID)
    if bag and slot then
        UseContainerItem(bag, slot)
        return true
    end
    return false
end

-- Delete an item
function BAG.InventoryAPI:DeleteItem(itemID, count)
    count = count or 1
    local deleted = 0
    
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) or 0 do
            local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(bag, slot)
            if itemLink then
                local linkItemID = tonumber(itemLink:match("item:(%d+)"))
                if linkItemID == itemID then
                    PickupContainerItem(bag, slot)
                    DeleteCursorItem()
                    deleted = deleted + (itemCount or 1)
                    
                    if deleted >= count then
                        return true
                    end
                end
            end
        end
    end
    
    return deleted > 0
end

-- Get item count by name (slower than by ID)
function BAG.InventoryAPI:CountItemByName(itemName)
    if not itemName then return 0 end
    
    local count = 0
    
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) or 0 do
            local _, itemCount, _, _, _, _, itemLink = GetContainerItemInfo(bag, slot)
            if itemLink then
                local name = GetItemInfo(itemLink)
                if name and name:lower() == itemName:lower() then
                    count = count + (itemCount or 1)
                end
            end
        end
    end
    
    return count
end

-- Get all items in bags
function BAG.InventoryAPI:GetAllItems()
    local items = {}
    
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) or 0 do
            local texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(bag, slot)
            if itemLink then
                local itemID = tonumber(itemLink:match("item:(%d+)"))
                local name = GetItemInfo(itemLink)
                
                table.insert(items, {
                    bag = bag,
                    slot = slot,
                    itemID = itemID,
                    name = name,
                    count = itemCount,
                    quality = quality,
                    texture = texture,
                    link = itemLink,
                })
            end
        end
    end
    
    return items
end

-- Get equipped items
function BAG.InventoryAPI:GetEquippedItems()
    local items = {}
    
    local slots = {
        "HeadSlot", "NeckSlot", "ShoulderSlot", "BackSlot", "ChestSlot",
        "ShirtSlot", "TabardSlot", "WristSlot", "HandsSlot", "WaistSlot",
        "LegsSlot", "FeetSlot", "Finger0Slot", "Finger1Slot", "Trinket0Slot",
        "Trinket1Slot", "MainHandSlot", "SecondaryHandSlot", "RangedSlot",
    }
    
    for _, slotName in ipairs(slots) do
        local slotID = GetInventorySlotInfo(slotName)
        local itemLink = GetInventoryItemLink("player", slotID)
        
        if itemLink then
            local itemID = tonumber(itemLink:match("item:(%d+)"))
            local name = GetItemInfo(itemLink)
            local texture = GetInventoryItemTexture("player", slotID)
            local durability, maxDurability = GetInventoryItemDurability(slotID)
            
            table.insert(items, {
                slot = slotName,
                slotID = slotID,
                itemID = itemID,
                name = name,
                link = itemLink,
                texture = texture,
                durability = durability,
                maxDurability = maxDurability,
            })
        end
    end
    
    return items
end

-- Check if an item is equipped
function BAG.InventoryAPI:IsItemEquipped(itemID)
    local equipped = self:GetEquippedItems()
    
    for _, item in ipairs(equipped) do
        if item.itemID == itemID then
            return true
        end
    end
    
    return false
end

-- Get item cooldown
function BAG.InventoryAPI:GetItemCooldown(itemID)
    local start, duration, enabled = GetItemCooldown(itemID)
    
    if start == 0 then
        return 0
    end
    
    local remaining = duration - (GetTime() - start)
    return math.max(0, remaining)
end

-- Check if an item is on cooldown
function BAG.InventoryAPI:IsItemOnCooldown(itemID)
    return self:GetItemCooldown(itemID) > 0
end

-- Get free bag space
function BAG.InventoryAPI:GetFreeBagSpace()
    local free = 0
    
    for bag = 0, 4 do
        local numSlots = GetContainerNumSlots(bag) or 0
        for slot = 1, numSlots do
            if not GetContainerItemInfo(bag, slot) then
                free = free + 1
            end
        end
    end
    
    return free
end

-- Get total bag space
function BAG.InventoryAPI:GetTotalBagSpace()
    local total = 0
    
    for bag = 0, 4 do
        total = total + (GetContainerNumSlots(bag) or 0)
    end
    
    return total
end

-- Get bag space info
function BAG.InventoryAPI:GetBagSpaceInfo()
    local free = self:GetFreeBagSpace()
    local total = self:GetTotalBagSpace()
    local used = total - free
    local percent = total > 0 and (used / total * 100) or 0
    
    return {
        free = free,
        used = used,
        total = total,
        percent = percent,
    }
end

-- Check if bags are full
function BAG.InventoryAPI:AreBagsFull()
    return self:GetFreeBagSpace() == 0
end

-- Get item quality color
function BAG.InventoryAPI:GetQualityColor(quality)
    local colors = {
        [0] = {0.62, 0.62, 0.62}, -- Poor (gray)
        [1] = {1.00, 1.00, 1.00}, -- Common (white)
        [2] = {0.12, 1.00, 0.00}, -- Uncommon (green)
        [3] = {0.00, 0.44, 0.87}, -- Rare (blue)
        [4] = {0.64, 0.21, 0.93}, -- Epic (purple)
        [5] = {1.00, 0.50, 0.00}, -- Legendary (orange)
    }
    
    return colors[quality] or colors[1]
end

-- Get vendor price for an item
function BAG.InventoryAPI:GetItemVendorPrice(itemID)
    local itemInfo = self:GetItemInfo(itemID)
    if not itemInfo or not itemInfo.link then return 0 end
    
    -- This requires scanning the tooltip, which is complex in TBC
    -- Return 0 for now, can be enhanced later
    return 0
end

-- Check if item is soulbound
function BAG.InventoryAPI:IsItemSoulbound(bag, slot)
    -- Scan tooltip to check for soulbound text
    -- This is a simplified version
    local _, _, _, _, _, _, itemLink = GetContainerItemInfo(bag, slot)
    if not itemLink then return false end
    
    -- In TBC, we'd need to scan the tooltip, which is complex
    -- Return false for now
    return false
end

-- Sort bags
function BAG.InventoryAPI:SortBags()
    for bag = 0, 4 do
        if GetContainerNumSlots(bag) and GetContainerNumSlots(bag) > 0 then
            -- TBC doesn't have a built-in sort function
            -- Would need custom implementation
        end
    end
end
