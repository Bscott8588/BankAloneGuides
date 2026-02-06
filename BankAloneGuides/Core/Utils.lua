-------------------------------------------------------------------------------
-- Bank Alone Guides — Core / Utils
-- General utility functions
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Utils = BAG.Utils or {}

--- Trim whitespace from both ends of a string.
function BAG.Utils:Trim(s)
    if not s then return "" end
    return s:match("^%s*(.-)%s*$") or ""
end

--- Split a string by a delimiter.
-- @param str  The string to split
-- @param sep  The delimiter (default ",")
-- @return table of substrings
function BAG.Utils:Split(str, sep)
    sep = sep or ","
    local parts = {}
    for part in str:gmatch("[^" .. sep .. "]+") do
        parts[#parts + 1] = self:Trim(part)
    end
    return parts
end

--- Check if a table contains a value.
function BAG.Utils:Contains(tbl, value)
    if not tbl then return false end
    for _, v in ipairs(tbl) do
        if v == value then return true end
    end
    return false
end

--- Shallow copy a table.
function BAG.Utils:Copy(tbl)
    if type(tbl) ~= "table" then return tbl end
    local copy = {}
    for k, v in pairs(tbl) do
        copy[k] = v
    end
    return copy
end

--- Deep copy a table.
function BAG.Utils:DeepCopy(tbl)
    if type(tbl) ~= "table" then return tbl end
    local copy = {}
    for k, v in pairs(tbl) do
        copy[k] = self:DeepCopy(v)
    end
    return setmetatable(copy, getmetatable(tbl))
end

--- Clamp a number between min and max.
function BAG.Utils:Clamp(value, minVal, maxVal)
    return math.max(minVal, math.min(maxVal, value))
end

--- Format coordinates as "xx.x, yy.y"
function BAG.Utils:FormatCoords(x, y)
    if not x or not y then return "??, ??" end
    return string.format("%.1f, %.1f", x * 100, y * 100)
end

--- Calculate rough distance between two coordinate pairs (same-zone estimate).
-- Coordinates are 0-1 fractions.
function BAG.Utils:Distance(x1, y1, x2, y2)
    if not (x1 and y1 and x2 and y2) then return 99999 end
    local dx = (x2 - x1) * 100
    local dy = (y2 - y1) * 100
    return math.sqrt(dx * dx + dy * dy)
end

--- Case-insensitive string comparison.
function BAG.Utils:StrEq(a, b)
    if not a or not b then return false end
    return a:lower() == b:lower()
end

--- Safe tonumber with default.
function BAG.Utils:ToNum(val, default)
    return tonumber(val) or (default or 0)
end

--- Get the length of a hash table (non-array).
function BAG.Utils:TableSize(tbl)
    if not tbl then return 0 end
    local count = 0
    for _ in pairs(tbl) do count = count + 1 end
    return count
end

--- Create a formatted time string from seconds.
function BAG.Utils:FormatTime(seconds)
    if not seconds or seconds <= 0 then return "0s" end
    local h = math.floor(seconds / 3600)
    local m = math.floor((seconds % 3600) / 60)
    local s = math.floor(seconds % 60)
    if h > 0 then
        return string.format("%dh %dm", h, m)
    elseif m > 0 then
        return string.format("%dm %ds", m, s)
    else
        return string.format("%ds", s)
    end
end

--- Capitalize the first letter of a string.
function BAG.Utils:Capitalize(str)
    if not str or str == "" then return str end
    return str:sub(1, 1):upper() .. str:sub(2)
end
