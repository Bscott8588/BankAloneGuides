local BAG = BankAlone
BAG.API.InventoryAPI = BAG.API.InventoryAPI or {}

local InventoryAPI = BAG.API.InventoryAPI

function InventoryAPI:CountItem(itemId)
    if not itemId then
        return 0
    end
    return GetItemCount(itemId) or 0
end

function InventoryAPI:HasItem(itemId, count)
    local required = count or 1
    return self:CountItem(itemId) >= required
end

