--[[
    Bank Alone Guides - Utility Functions
    Common utility functions used throughout the addon
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

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

function BAG.Utils:Contains(str, substr)
    return string.find(str, substr, 1, true) ~= nil
end

-- Table utilities
function BAG.Utils:TableSize(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

function BAG.Utils:TableCopy(tbl)
    if type(tbl) ~= "table" then
        return tbl
    end
    
    local copy = {}
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            copy[k] = self:TableCopy(v)
        else
            copy[k] = v
        end
    end
    return copy
end

function BAG.Utils:TableMerge(t1, t2)
    local result = self:TableCopy(t1)
    for k, v in pairs(t2) do
        if type(v) == "table" and type(result[k]) == "table" then
            result[k] = self:TableMerge(result[k], v)
        else
            result[k] = v
        end
    end
    return result
end

function BAG.Utils:TableContains(tbl, value)
    for _, v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

function BAG.Utils:TableFind(tbl, predicate)
    for k, v in pairs(tbl) do
        if predicate(v, k) then
            return v, k
        end
    end
    return nil
end

function BAG.Utils:TableFilter(tbl, predicate)
    local result = {}
    for k, v in pairs(tbl) do
        if predicate(v, k) then
            table.insert(result, v)
        end
    end
    return result
end

function BAG.Utils:TableMap(tbl, func)
    local result = {}
    for k, v in pairs(tbl) do
        result[k] = func(v, k)
    end
    return result
end

-- Math utilities
function BAG.Utils:Round(num, decimals)
    decimals = decimals or 0
    local mult = 10 ^ decimals
    return math.floor(num * mult + 0.5) / mult
end

function BAG.Utils:Clamp(value, min, max)
    if value < min then
        return min
    elseif value > max then
        return max
    else
        return value
    end
end

function BAG.Utils:Distance(x1, y1, x2, y2)
    local dx = x2 - x1
    local dy = y2 - y1
    return math.sqrt(dx * dx + dy * dy)
end

-- Coordinate utilities
function BAG.Utils:FormatCoords(x, y)
    if not x or not y then
        return "??"
    end
    return string.format("%.1f, %.1f", x * 100, y * 100)
end

function BAG.Utils:ParseCoords(coordString)
    -- Parse "x,y" or "x, y" format
    local parts = self:Split(coordString, ",")
    if #parts == 2 then
        local x = tonumber(self:Trim(parts[1]))
        local y = tonumber(self:Trim(parts[2]))
        if x and y then
            -- Convert from 0-100 range to 0-1 range if needed
            if x > 1 then
                x = x / 100
            end
            if y > 1 then
                y = y / 100
            end
            return x, y
        end
    end
    return nil, nil
end

-- Time utilities
function BAG.Utils:FormatTime(seconds)
    if seconds < 60 then
        return string.format("%ds", seconds)
    elseif seconds < 3600 then
        return string.format("%dm %ds", math.floor(seconds / 60), seconds % 60)
    else
        return string.format("%dh %dm", math.floor(seconds / 3600), math.floor((seconds % 3600) / 60))
    end
end

function BAG.Utils:GetTimestamp()
    return time()
end

-- Color utilities
function BAG.Utils:ColorGradient(perc, color1, color2)
    local r = color1.r + (color2.r - color1.r) * perc
    local g = color1.g + (color2.g - color1.g) * perc
    local b = color1.b + (color2.b - color1.b) * perc
    return {r = r, g = g, b = b, a = 1.0}
end

function BAG.Utils:RGBToHex(r, g, b)
    return string.format("%02x%02x%02x", 
        math.floor(r * 255),
        math.floor(g * 255),
        math.floor(b * 255))
end

-- Quest utilities
function BAG.Utils:GetQuestLogIndex(questID)
    for i = 1, GetNumQuestLogEntries() do
        local _, _, _, _, _, _, _, id = GetQuestLogTitle(i)
        if id == questID then
            return i
        end
    end
    return nil
end

function BAG.Utils:IsQuestComplete(questID)
    local index = self:GetQuestLogIndex(questID)
    if index then
        local _, _, _, _, _, isComplete = GetQuestLogTitle(index)
        return isComplete == 1 or isComplete == true
    end
    return false
end

-- Item utilities
function BAG.Utils:GetItemCount(itemID)
    local count = 0
    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
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
    return count
end

-- Unit utilities
function BAG.Utils:GetUnitLevel(unit)
    unit = unit or "player"
    return UnitLevel(unit)
end

function BAG.Utils:GetUnitClass(unit)
    unit = unit or "player"
    local className, classFile = UnitClass(unit)
    return className, classFile
end

function BAG.Utils:GetUnitRace(unit)
    unit = unit or "player"
    local raceName, raceFile = UnitRace(unit)
    return raceName, raceFile
end

function BAG.Utils:GetUnitFaction(unit)
    unit = unit or "player"
    local faction = UnitFactionGroup(unit)
    return faction
end

-- Frame utilities
function BAG.Utils:GetFrameCenter(frame)
    local x, y = frame:GetCenter()
    return x or 0, y or 0
end

function BAG.Utils:IsFrameOnScreen(frame)
    local x, y = self:GetFrameCenter(frame)
    local screenWidth = GetScreenWidth()
    local screenHeight = GetScreenHeight()
    return x > 0 and x < screenWidth and y > 0 and y < screenHeight
end

-- Validation utilities
function BAG.Utils:IsValidQuestID(questID)
    return type(questID) == "number" and questID > 0
end

function BAG.Utils:IsValidItemID(itemID)
    return type(itemID) == "number" and itemID > 0
end

function BAG.Utils:IsValidNPCID(npcID)
    return type(npcID) == "number" and npcID > 0
end

function BAG.Utils:IsValidCoords(x, y)
    return type(x) == "number" and type(y) == "number" and
           x >= 0 and x <= 1 and y >= 0 and y <= 1
end

-- Debug utilities
function BAG.Utils:DumpTable(tbl, indent)
    indent = indent or 0
    local indentStr = string.rep("  ", indent)
    
    if type(tbl) ~= "table" then
        print(indentStr .. tostring(tbl))
        return
    end
    
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            print(indentStr .. tostring(k) .. " = {")
            self:DumpTable(v, indent + 1)
            print(indentStr .. "}")
        else
            print(indentStr .. tostring(k) .. " = " .. tostring(v))
        end
    end
end

-- Error handling
function BAG.Utils:SafeCall(func, ...)
    local success, result = pcall(func, ...)
    if not success then
        BAG.Logo:PrintError("Error: " .. tostring(result))
        return nil
    end
    return result
end

print("|cff00B3FF[Bank Alone Guides]|r Utility functions loaded")
