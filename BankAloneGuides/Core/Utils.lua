local BAG = BankAlone
local Utils = BAG.Utils

function Utils:Clamp(value, minValue, maxValue)
  if value < minValue then
    return minValue
  elseif value > maxValue then
    return maxValue
  end
  return value
end

function Utils:Round(value, places)
  local mult = 10 ^ (places or 0)
  return math.floor(value * mult + 0.5) / mult
end

function Utils:CopyTable(src)
  if type(src) ~= "table" then
    return src
  end
  local out = {}
  for k, v in pairs(src) do
    out[k] = self:CopyTable(v)
  end
  return out
end

function Utils:MergeTables(base, overlay)
  if type(base) ~= "table" then
    base = {}
  end
  if type(overlay) ~= "table" then
    return base
  end
  for k, v in pairs(overlay) do
    if type(v) == "table" and type(base[k]) == "table" then
      base[k] = self:MergeTables(base[k], v)
    else
      base[k] = v
    end
  end
  return base
end

function Utils:ColorText(text, color)
  if not color then
    return text
  end
  return string.format("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text)
end

function Utils:BuildStepText(step)
  if step.text and step.text ~= "" then
    return step.text
  end

  local typeLabel = step.type or "note"
  local parts = {}
  if typeLabel then
    table.insert(parts, string.upper(typeLabel))
  end
  if step.questId then
    table.insert(parts, "Quest " .. tostring(step.questId))
  end
  if step.itemId then
    table.insert(parts, "Item " .. tostring(step.itemId))
  end
  if step.zone then
    table.insert(parts, step.zone)
  end
  if step.x and step.y then
    table.insert(parts, string.format("(%.1f, %.1f)", step.x, step.y))
  end
  if #parts == 0 then
    return "Follow the guide step."
  end
  return table.concat(parts, " - ")
end

function Utils:GetCharKey()
  local name = UnitName("player")
  local realm = GetRealmName()
  if not name or not realm then
    return "Unknown-Realm"
  end
  return realm .. "-" .. name
end
