local BAG = BankAlone
BAG.API.Inventory = BAG.API.Inventory or {}
local Inventory = BAG.API.Inventory

function Inventory:CountItem(itemId)
  if not itemId then
    return 0
  end
  return GetItemCount(itemId) or 0
end

function Inventory:HasItem(itemId)
  return self:CountItem(itemId) > 0
end
