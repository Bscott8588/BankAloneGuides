--[[
    Bank Alone Guides - Utility Functions
    Common helper functions used throughout the addon
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Utils = {}

-- String utilities
function BAG.Utils:Trim(s)
    return s:match("^%s*(.-)%s*$")
end

function BAG.Utils:Split(str, delimiter)
    local result = {}
    local pattern = string.format("([^%s]+)", delimiter)
    for match in string.gmatch(str, pattern) do
        table.insert(result, match)
    end
    return result
end

function BAG.Utils:StartsWith(str, prefix)
    return string.sub(str, 1, string.len(prefix)) == prefix
end

function BAG.Utils:EndsWith(str, suffix)
    return suffix == "" or string.sub(str, -string.len(suffix)) == suffix
end

-- Table utilities
function BAG.Utils:TableSize(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

function BAG.Utils:TableContains(tbl, value)
    for _, v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

function BAG.Utils:TableCopy(orig)
    local copy
    if type(orig) == 'table' then
        copy = {}
        for k, v in pairs(orig) do
            copy[k] = BAG.Utils:TableCopy(v)
        end
    else
        copy = orig
    end
    return copy
end

function BAG.Utils:TableMerge(t1, t2)
    for k, v in pairs(t2) do
        if type(v) == "table" and type(t1[k]) == "table" then
            BAG.Utils:TableMerge(t1[k], v)
        else
            t1[k] = v
        end
    end
    return t1
end

-- Math utilities
function BAG.Utils:Round(num, decimals)
    local mult = 10 ^ (decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

function BAG.Utils:Clamp(value, min, max)
    if value < min then return min end
    if value > max then return max end
    return value
end

-- Distance calculation (approximate 2D distance)
function BAG.Utils:Distance2D(x1, y1, x2, y2)
    local dx = x2 - x1
    local dy = y2 - y1
    return math.sqrt(dx * dx + dy * dy)
end

-- Color utilities
function BAG.Utils:ColorText(text, r, g, b)
    local hex = string.format("%02x%02x%02x", r * 255, g * 255, b * 255)
    return "|cff" .. hex .. text .. "|r"
end

function BAG.Utils:GetClassColor(class)
    local classColors = {
        WARRIOR = {0.78, 0.61, 0.43},
        PALADIN = {0.96, 0.55, 0.73},
        HUNTER = {0.67, 0.83, 0.45},
        ROGUE = {1.00, 0.96, 0.41},
        PRIEST = {1.00, 1.00, 1.00},
        SHAMAN = {0.00, 0.44, 0.87},
        MAGE = {0.41, 0.80, 0.94},
        WARLOCK = {0.58, 0.51, 0.79},
        DRUID = {1.00, 0.49, 0.04},
    }
    return classColors[class] or {1, 1, 1}
end

-- Format time (seconds to readable format)
function BAG.Utils:FormatTime(seconds)
    if seconds < 60 then
        return string.format("%ds", seconds)
    elseif seconds < 3600 then
        return string.format("%dm %ds", math.floor(seconds / 60), seconds % 60)
    else
        return string.format("%dh %dm", math.floor(seconds / 3600), math.floor((seconds % 3600) / 60))
    end
end

-- Format money (copper to gold/silver/copper)
function BAG.Utils:FormatMoney(copper)
    if copper >= 10000 then
        local gold = math.floor(copper / 10000)
        local silver = math.floor((copper % 10000) / 100)
        local c = copper % 100
        return string.format("%dg %ds %dc", gold, silver, c)
    elseif copper >= 100 then
        local silver = math.floor(copper / 100)
        local c = copper % 100
        return string.format("%ds %dc", silver, c)
    else
        return string.format("%dc", copper)
    end
end

-- Format coordinates
function BAG.Utils:FormatCoord(x, y)
    if not x or not y then return "Unknown" end
    return string.format("%.1f, %.1f", x * 100, y * 100)
end

-- Parse coordinates from string (e.g., "45.3, 67.8" or "45.3,67.8")
function BAG.Utils:ParseCoords(coordStr)
    if not coordStr then return nil, nil end
    
    local x, y = coordStr:match("([%d%.]+),%s*([%d%.]+)")
    if x and y then
        return tonumber(x) / 100, tonumber(y) / 100
    end
    return nil, nil
end

-- Safely get nested table value
function BAG.Utils:GetNestedValue(tbl, ...)
    local current = tbl
    for i = 1, select("#", ...) do
        local key = select(i, ...)
        if type(current) ~= "table" then
            return nil
        end
        current = current[key]
        if current == nil then
            return nil
        end
    end
    return current
end

-- Safe function call with error handling
function BAG.Utils:SafeCall(func, ...)
    if type(func) ~= "function" then
        return false, "Not a function"
    end
    
    local success, result = pcall(func, ...)
    if not success then
        BAG:Error("Function call failed:", result)
        return false, result
    end
    
    return true, result
end

-- Generate a unique ID
do
    local idCounter = 0
    function BAG.Utils:GenerateID(prefix)
        idCounter = idCounter + 1
        return (prefix or "BAG_") .. idCounter
    end
end

-- Check if player is in a specific expansion
function BAG.Utils:IsInOutland()
    local zone = BAG.ZoneDetection:GetCurrentZone()
    if not zone then return false end
    
    local outlandZones = {
        "Hellfire Peninsula",
        "Zangarmarsh",
        "Terokkar Forest",
        "Nagrand",
        "Blade's Edge Mountains",
        "Netherstorm",
        "Shadowmoon Valley",
    }
    
    return self:TableContains(outlandZones, zone)
end

-- Get player's hearthstone cooldown
function BAG.Utils:GetHearthstoneCooldown()
    local itemID = 6948 -- Hearthstone
    local start, duration = GetItemCooldown(itemID)
    if start == 0 then
        return 0
    end
    local remaining = duration - (GetTime() - start)
    return math.max(0, remaining)
end

-- Check if it's safe to use hearthstone
function BAG.Utils:CanUseHearthstone()
    local cd = self:GetHearthstoneCooldown()
    return cd == 0 and not InCombatLockdown()
end

-- Format step type for display
function BAG.Utils:FormatStepType(stepType)
    local typeNames = {
        accept = "Accept Quest",
        turnin = "Turn In Quest",
        kill = "Kill",
        collect = "Collect",
        goto = "Go To",
        train = "Train",
        vendor = "Vendor",
        buy = "Buy",
        use = "Use Item",
        equip = "Equip",
        hs = "Hearthstone",
        fly = "Fly",
        fp = "Get Flight Path",
        boat = "Take Boat",
        zeppelin = "Take Zeppelin",
        run = "Run",
        mount = "Mount Up",
        note = "Note",
    }
    return typeNames[stepType] or stepType
end
