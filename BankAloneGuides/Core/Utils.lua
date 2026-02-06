--[[
    Bank Alone Guides - Utility Functions
    SCS / Bank Alone Guides
]]

local BAG = BankAlone

BAG.Utils = BAG.Utils or {}
local Utils = BAG.Utils

-- String trim (fallback if not available)
function Utils:Trim(s)
    if not s then return "" end
    return s:match("^%s*(.-)%s*$") or s
end

-- String split
function Utils:Split(str, sep)
    local result = {}
    sep = sep or ","
    for part in str:gmatch("([^" .. sep .. "]+)") do
        result[#result + 1] = self:Trim(part)
    end
    return result
end

-- Table shallow copy
function Utils:ShallowCopy(t)
    local copy = {}
    for k, v in pairs(t) do
        copy[k] = v
    end
    return copy
end

-- Table deep copy
function Utils:DeepCopy(t)
    if type(t) ~= "table" then return t end
    local copy = {}
    for k, v in pairs(t) do
        copy[self:DeepCopy(k)] = self:DeepCopy(v)
    end
    return setmetatable(copy, getmetatable(t))
end

-- Merge two tables (second overwrites first)
function Utils:Merge(t1, t2)
    local result = self:ShallowCopy(t1)
    for k, v in pairs(t2) do
        result[k] = v
    end
    return result
end

-- Check if table contains value
function Utils:Contains(tbl, value)
    for _, v in pairs(tbl) do
        if v == value then return true end
    end
    return false
end

-- Get table size (for non-sequential tables)
function Utils:TableSize(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

-- Format coordinates
function Utils:FormatCoords(x, y)
    if not x or not y then return "??, ??" end
    return string.format("%.1f, %.1f", x * 100, y * 100)
end

-- Calculate distance between two points (approximate, 2D)
function Utils:Distance(x1, y1, x2, y2)
    if not (x1 and y1 and x2 and y2) then return 99999 end
    local dx = (x2 - x1)
    local dy = (y2 - y1)
    return math.sqrt(dx * dx + dy * dy)
end

-- Color a string with hex color
function Utils:Colorize(text, hexColor)
    return "|cFF" .. hexColor .. text .. "|r"
end

-- SCS brand color shortcuts
function Utils:NeonBlue(text)
    return self:Colorize(text, "00CCFF")
end

function Utils:Gold(text)
    return self:Colorize(text, "FFD700")
end

function Utils:Green(text)
    return self:Colorize(text, "00FF00")
end

function Utils:Red(text)
    return self:Colorize(text, "FF3333")
end

function Utils:Gray(text)
    return self:Colorize(text, "888888")
end

function Utils:White(text)
    return self:Colorize(text, "FFFFFF")
end

-- Format time (seconds to readable)
function Utils:FormatTime(seconds)
    if not seconds or seconds < 0 then return "0s" end
    local h = math.floor(seconds / 3600)
    local m = math.floor((seconds % 3600) / 60)
    local s = math.floor(seconds % 60)
    if h > 0 then
        return string.format("%dh %dm %ds", h, m, s)
    elseif m > 0 then
        return string.format("%dm %ds", m, s)
    else
        return string.format("%ds", s)
    end
end

-- Format money (copper to gold/silver/copper)
function Utils:FormatMoney(copper)
    if not copper then return "0c" end
    local gold = math.floor(copper / 10000)
    local silver = math.floor((copper % 10000) / 100)
    local cop = copper % 100
    local result = ""
    if gold > 0 then result = result .. gold .. "g " end
    if silver > 0 then result = result .. silver .. "s " end
    result = result .. cop .. "c"
    return result
end

-- Safe tonumber
function Utils:ToNumber(val, default)
    local n = tonumber(val)
    return n or (default or 0)
end

-- Clamp a value
function Utils:Clamp(val, min, max)
    if val < min then return min end
    if val > max then return max end
    return val
end

-- Create a throttle function
function Utils:CreateThrottle(interval)
    local lastTime = 0
    return function()
        local now = GetTime()
        if now - lastTime >= interval then
            lastTime = now
            return true
        end
        return false
    end
end
