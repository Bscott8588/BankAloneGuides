local BAG = BankAlone
BAG.Utils = BAG.Utils or {}

local Utils = BAG.Utils

function Utils:Trim(value)
    if not value then
        return ""
    end
    return (value:gsub("^%s+", ""):gsub("%s+$", ""))
end

function Utils:Split(value, sep)
    local results = {}
    if not value or value == "" then
        return results
    end
    sep = sep or ","
    for token in string.gmatch(value, "([^" .. sep .. "]+)") do
        table.insert(results, self:Trim(token))
    end
    return results
end

function Utils:ToList(value)
    return self:Split(value, ",")
end

function Utils:Round(value, decimals)
    if not value then
        return 0
    end
    local mult = 10 ^ (decimals or 0)
    return math.floor(value * mult + 0.5) / mult
end

function Utils:Clamp(value, minValue, maxValue)
    if value < minValue then
        return minValue
    end
    if value > maxValue then
        return maxValue
    end
    return value
end

function Utils:ColorToHex(r, g, b, a)
    local alpha = math.floor((a or 1) * 255)
    local red = math.floor((r or 1) * 255)
    local green = math.floor((g or 1) * 255)
    local blue = math.floor((b or 1) * 255)
    return string.format("%02x%02x%02x%02x", alpha, red, green, blue)
end

function Utils:FormatCoords(x, y)
    if not x or not y then
        return ""
    end
    return string.format("%.1f, %.1f", x, y)
end

function Utils:GetPlayerKey()
    local name = UnitName("player") or "Unknown"
    local realm = GetRealmName() or "UnknownRealm"
    return name .. "-" .. realm
end

function Utils:TableContains(list, value)
    if not list then
        return false
    end
    for _, entry in ipairs(list) do
        if entry == value then
            return true
        end
    end
    return false
end

