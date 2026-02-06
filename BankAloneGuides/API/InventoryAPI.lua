--[[
    Bank Alone Guides - Inventory API
    Wraps inventory and bag functions
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Get item count across all bags
function BAG.InventoryAPI:GetItemCount(itemID)
    if not itemID then
        return 0
    end
    
    local count = 0
    
    -- Search all bags (0-4)
    for bag = 0, 4 do
        local slots = GetContainerNumSlots(bag)
        if slots then
            for slot = 1, slots do
                local link = GetContainerItemLink(bag, slot)
                if link then
                    local id = tonumber(string.match(link, "item:(%d+)"))
                    if id == itemID then
                        local _, itemCount = GetContainerItemInfo(bag, slot)
                        count = count + (itemCount or 0)
                    end
                end
            end
        end
    end
    
    return count
end

-- Check if player has item
function BAG.InventoryAPI:HasItem(itemID)
    return self:GetItemCount(itemID) > 0
end

-- Find item in bags (returns bag, slot)
function BAG.InventoryAPI:FindItem(itemID)
    for bag = 0, 4 do
        local slots = GetContainerNumSlots(bag)
        if slots then
            for slot = 1, slots do
                local link = GetContainerItemLink(bag, slot)
                if link then
                    local id = tonumber(string.match(link, "item:(%d+)"))
                    if id == itemID then
                        return bag, slot
                    end
                end
            end
        end
    end
    
    return nil, nil
end

-- Find item by name in bags
function BAG.InventoryAPI:FindItemByName(itemName)
    for bag = 0, 4 do
        local slots = GetContainerNumSlots(bag)
        if slots then
            for slot = 1, slots do
                local link = GetContainerItemLink(bag, slot)
                if link then
                    local name = GetItemInfo(link)
                    if name and string.lower(name) == string.lower(itemName) then
                        return bag, slot
                    end
                end
            end
        end
    end
    
    return nil, nil
end

-- Use item
function BAG.InventoryAPI:UseItem(itemID)
    local bag, slot = self:FindItem(itemID)
    if bag and slot then
        UseContainerItem(bag, slot)
        return true
    end
    return false
end

-- Get number of free bag slots
function BAG.InventoryAPI:GetFreeBagSlots()
    local freeSlots = 0
    
    for bag = 0, 4 do
        local slots = GetContainerNumSlots(bag)
        if slots then
            for slot = 1, slots do
                local link = GetContainerItemLink(bag, slot)
                if not link then
                    freeSlots = freeSlots + 1
                end
            end
        end
    end
    
    return freeSlots
end

-- Get total bag slots
function BAG.InventoryAPI:GetTotalBagSlots()
    local totalSlots = 0
    
    for bag = 0, 4 do
        local slots = GetContainerNumSlots(bag)
        if slots then
            totalSlots = totalSlots + slots
        end
    end
    
    return totalSlots
end

-- Check if bags are full
function BAG.InventoryAPI:AreBagsFull()
    return self:GetFreeBagSlots() == 0
end

-- Get item info
function BAG.InventoryAPI:GetItemInfo(itemID)
    local name, link, quality, iLevel, reqLevel, class, subclass, maxStack, equipSlot, texture = GetItemInfo(itemID)
    
    if not name then
        return nil
    end
    
    return {
        name = name,
        link = link,
        quality = quality,
        itemLevel = iLevel,
        requiredLevel = reqLevel,
        itemClass = class,
        itemSubclass = subclass,
        maxStack = maxStack,
        equipSlot = equipSlot,
        texture = texture,
        id = itemID
    }
end

-- Get item quality color
function BAG.InventoryAPI:GetQualityColor(quality)
    local colors = {
        [0] = {r = 0.6, g = 0.6, b = 0.6},   -- Poor (gray)
        [1] = {r = 1.0, g = 1.0, b = 1.0},   -- Common (white)
        [2] = {r = 0.0, g = 1.0, b = 0.0},   -- Uncommon (green)
        [3] = {r = 0.0, g = 0.5, b = 1.0},   -- Rare (blue)
        [4] = {r = 0.64, g = 0.21, b = 0.93}, -- Epic (purple)
        [5] = {r = 1.0, g = 0.5, b = 0.0}    -- Legendary (orange)
    }
    
    return colors[quality] or colors[1]
end

-- Delete item (for junk)
function BAG.InventoryAPI:DeleteItem(itemID, count)
    count = count or 1
    
    local deleted = 0
    for bag = 0, 4 do
        local slots = GetContainerNumSlots(bag)
        if slots then
            for slot = 1, slots do
                if deleted >= count then
                    return deleted
                end
                
                local link = GetContainerItemLink(bag, slot)
                if link then
                    local id = tonumber(string.match(link, "item:(%d+)"))
                    if id == itemID then
                        PickupContainerItem(bag, slot)
                        DeleteCursorItem()
                        deleted = deleted + 1
                    end
                end
            end
        end
    end
    
    return deleted
end

-- Get all items in bags
function BAG.InventoryAPI:GetAllItems()
    local items = {}
    
    for bag = 0, 4 do
        local slots = GetContainerNumSlots(bag)
        if slots then
            for slot = 1, slots do
                local link = GetContainerItemLink(bag, slot)
                if link then
                    local id = tonumber(string.match(link, "item:(%d+)"))
                    local _, count = GetContainerItemInfo(bag, slot)
                    local itemInfo = self:GetItemInfo(id)
                    
                    if itemInfo then
                        table.insert(items, {
                            bag = bag,
                            slot = slot,
                            id = id,
                            count = count,
                            info = itemInfo
                        })
                    end
                end
            end
        end
    end
    
    return items
end

-- Check if player can equip item
function BAG.InventoryAPI:CanEquipItem(itemID)
    local itemInfo = self:GetItemInfo(itemID)
    if not itemInfo then
        return false
    end
    
    -- Check level requirement
    if itemInfo.requiredLevel and itemInfo.requiredLevel > UnitLevel("player") then
        return false
    end
    
    -- Check if it's equippable
    if itemInfo.equipSlot == "" or itemInfo.equipSlot == "INVTYPE_NON_EQUIP" then
        return false
    end
    
    return true
end

-- Equip item from bags
function BAG.InventoryAPI:EquipItem(itemID)
    if not self:CanEquipItem(itemID) then
        return false
    end
    
    local bag, slot = self:FindItem(itemID)
    if bag and slot then
        PickupContainerItem(bag, slot)
        AutoEquipCursorItem()
        return true
    end
    
    return false
end

-- Check if item is soulbound
function BAG.InventoryAPI:IsItemSoulbound(bag, slot)
    GameTooltip:SetOwner(UIParent, "ANCHOR_NONE")
    GameTooltip:SetBagItem(bag, slot)
    
    for i = 1, GameTooltip:NumLines() do
        local line = _G["GameTooltipTextLeft" .. i]
        if line then
            local text = line:GetText()
            if text and (text == ITEM_SOULBOUND or text == ITEM_BIND_ON_PICKUP) then
                GameTooltip:Hide()
                return true
            end
        end
    end
    
    GameTooltip:Hide()
    return false
end

-- Get item cooldown
function BAG.InventoryAPI:GetItemCooldown(itemID)
    local bag, slot = self:FindItem(itemID)
    if bag and slot then
        local start, duration, enable = GetContainerItemCooldown(bag, slot)
        return start, duration, enable
    end
    return 0, 0, 1
end

-- Check if item is on cooldown
function BAG.InventoryAPI:IsItemOnCooldown(itemID)
    local start, duration = self:GetItemCooldown(itemID)
    return duration > 0 and (start + duration) > GetTime()
end

print("|cff00B3FF[Bank Alone Guides]|r Inventory API loaded")
