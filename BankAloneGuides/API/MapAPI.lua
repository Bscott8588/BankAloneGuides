--[[
    Bank Alone Guides - Map API
    Wraps WoW map and coordinate functions
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.MapAPI = {}

-- Get player's current position (x, y in 0-1 range)
function BAG.MapAPI:GetPlayerPosition()
    SetMapToCurrentZone()
    local x, y = GetPlayerMapPosition("player")
    
    -- In TBC, sometimes returns 0,0 in instances
    if x == 0 and y == 0 then
        return nil, nil
    end
    
    return x, y
end

-- Get player's current zone
function BAG.MapAPI:GetCurrentZone()
    return GetZoneText() or "Unknown"
end

-- Get player's current subzone
function BAG.MapAPI:GetCurrentSubzone()
    return GetSubZoneText() or ""
end

-- Get player's current continent
function BAG.MapAPI:GetCurrentContinent()
    SetMapToCurrentZone()
    local continent = GetCurrentMapContinent()
    
    local continentNames = {
        [0] = "Kalimdor",
        [1] = "Eastern Kingdoms",
        [2] = "Outland",
    }
    
    return continentNames[continent] or "Unknown"
end

-- Calculate distance between two points (in 0-1 coordinate system)
function BAG.MapAPI:CalculateDistance(x1, y1, x2, y2)
    if not x1 or not y1 or not x2 or not y2 then
        return nil
    end
    
    local dx = x2 - x1
    local dy = y2 - y1
    
    return math.sqrt(dx * dx + dy * dy)
end

-- Calculate distance from player to a point
function BAG.MapAPI:GetDistanceToPoint(x, y, zone)
    zone = zone or self:GetCurrentZone()
    local currentZone = self:GetCurrentZone()
    
    -- Can't calculate distance across different zones
    if zone ~= currentZone then
        return nil
    end
    
    local px, py = self:GetPlayerPosition()
    if not px or not py then
        return nil
    end
    
    return self:CalculateDistance(px, py, x, y)
end

-- Format coordinates for display (converts 0-1 to 0-100)
function BAG.MapAPI:FormatCoordinates(x, y)
    if not x or not y then
        return "Unknown"
    end
    
    return string.format("%.1f, %.1f", x * 100, y * 100)
end

-- Parse coordinates from string (e.g., "45.3, 67.8")
function BAG.MapAPI:ParseCoordinates(coordStr)
    if not coordStr then return nil, nil end
    
    local x, y = coordStr:match("([%d%.]+),%s*([%d%.]+)")
    if x and y then
        x = tonumber(x)
        y = tonumber(y)
        
        -- Convert from 0-100 to 0-1 if necessary
        if x > 1 or y > 1 then
            x = x / 100
            y = y / 100
        end
        
        return x, y
    end
    
    return nil, nil
end

-- Check if player is in a specific zone
function BAG.MapAPI:IsInZone(zoneName)
    local currentZone = self:GetCurrentZone()
    return currentZone:lower() == zoneName:lower()
end

-- Check if player is in a specific subzone
function BAG.MapAPI:IsInSubzone(subzoneName)
    local currentSubzone = self:GetCurrentSubzone()
    return currentSubzone:lower() == subzoneName:lower()
end

-- Get zone level range
function BAG.MapAPI:GetZoneLevelRange(zoneName)
    -- This would need a database of zones
    -- For now, return nil
    return nil, nil
end

-- Check if a zone is in Outland
function BAG.MapAPI:IsOutlandZone(zoneName)
    local outlandZones = {
        "Hellfire Peninsula",
        "Zangarmarsh",
        "Terokkar Forest",
        "Nagrand",
        "Blade's Edge Mountains",
        "Netherstorm",
        "Shadowmoon Valley",
        "The Exodar",
        "Azuremyst Isle",
        "Bloodmyst Isle",
        "Silvermoon City",
        "Eversong Woods",
        "Ghostlands",
    }
    
    for _, zone in ipairs(outlandZones) do
        if zone:lower() == zoneName:lower() then
            return true
        end
    end
    
    return false
end

-- Check if a zone is in Azeroth (Classic zones)
function BAG.MapAPI:IsAzerothZone(zoneName)
    return not self:IsOutlandZone(zoneName)
end

-- Get map info
function BAG.MapAPI:GetMapInfo()
    SetMapToCurrentZone()
    
    return {
        zone = GetZoneText(),
        subzone = GetSubZoneText(),
        continent = self:GetCurrentContinent(),
        x = self:GetPlayerPosition(),
    }
end

-- Set map to a specific zone
function BAG.MapAPI:SetMap(continent, zone)
    SetMapZoom(continent, zone)
end

-- Reset map to current zone
function BAG.MapAPI:ResetMap()
    SetMapToCurrentZone()
end

-- Get POI (Point of Interest) information
function BAG.MapAPI:GetPOIs()
    SetMapToCurrentZone()
    local pois = {}
    
    local numPOIs = GetNumMapLandmarks()
    for i = 1, numPOIs do
        local name, _, textureIndex, x, y = GetMapLandmarkInfo(i)
        if name then
            table.insert(pois, {
                name = name,
                x = x,
                y = y,
                textureIndex = textureIndex,
                index = i,
            })
        end
    end
    
    return pois
end

-- Get nearest POI to player
function BAG.MapAPI:GetNearestPOI()
    local pois = self:GetPOIs()
    local px, py = self:GetPlayerPosition()
    
    if not px or not py or #pois == 0 then
        return nil
    end
    
    local nearestPOI = nil
    local minDistance = math.huge
    
    for _, poi in ipairs(pois) do
        local distance = self:CalculateDistance(px, py, poi.x, poi.y)
        if distance and distance < minDistance then
            minDistance = distance
            nearestPOI = poi
        end
    end
    
    return nearestPOI, minDistance
end

-- Check if coordinates are valid
function BAG.MapAPI:AreCoordinatesValid(x, y)
    return x ~= nil and y ~= nil and x >= 0 and x <= 1 and y >= 0 and y <= 1
end

-- Get direction to a point (returns angle in degrees, 0 = North, 90 = East)
function BAG.MapAPI:GetDirectionToPoint(x, y, zone)
    zone = zone or self:GetCurrentZone()
    local currentZone = self:GetCurrentZone()
    
    if zone ~= currentZone then
        return nil
    end
    
    local px, py = self:GetPlayerPosition()
    if not px or not py or not x or not y then
        return nil
    end
    
    local dx = x - px
    local dy = y - py
    
    local angle = math.deg(math.atan2(dy, dx))
    angle = (90 - angle) % 360
    
    return angle
end

-- Get cardinal direction to a point (N, NE, E, SE, S, SW, W, NW)
function BAG.MapAPI:GetCardinalDirection(x, y, zone)
    local angle = self:GetDirectionToPoint(x, y, zone)
    if not angle then return nil end
    
    local directions = {"N", "NE", "E", "SE", "S", "SW", "W", "NW"}
    local index = math.floor((angle + 22.5) / 45) % 8 + 1
    
    return directions[index]
end

-- Format direction for display
function BAG.MapAPI:FormatDirection(x, y, zone)
    local distance = self:GetDistanceToPoint(x, y, zone)
    local direction = self:GetCardinalDirection(x, y, zone)
    
    if not distance or not direction then
        return "Unknown location"
    end
    
    -- Convert distance to approximate yards (rough estimation)
    local yards = distance * 1000
    
    return string.format("%s (%.0f yards)", direction, yards)
end
