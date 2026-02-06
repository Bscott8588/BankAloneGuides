--[[
    Bank Alone Guides - Map API
    Wraps map, zone, and coordinate functions
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Get current zone
function BAG.MapAPI:GetCurrentZone()
    return GetZoneText()
end

-- Get current subzone
function BAG.MapAPI:GetCurrentSubZone()
    return GetSubZoneText()
end

-- Get minimap zone
function BAG.MapAPI:GetMinimapZone()
    return GetMinimapZoneText()
end

-- Get continent name
function BAG.MapAPI:GetContinent()
    local continent = GetCurrentMapContinent()
    local continents = {
        [0] = "Kalimdor",
        [1] = "Eastern Kingdoms",
        [2] = "Outland",
        [3] = "Northrend"  -- For future compatibility
    }
    
    return continents[continent] or "Unknown"
end

-- Check if player is in Outland
function BAG.MapAPI:IsInOutland()
    local continent = GetCurrentMapContinent()
    return continent == 2
end

-- Check if player is in specific zone
function BAG.MapAPI:IsInZone(zoneName)
    local currentZone = self:GetCurrentZone()
    return string.upper(currentZone) == string.upper(zoneName)
end

-- Get player position (x, y as 0-1 coordinates)
function BAG.MapAPI:GetPlayerPosition()
    -- Save current map state
    local lastContinent = GetCurrentMapContinent()
    local lastZone = GetCurrentMapZone()
    
    -- Set map to player location
    SetMapToCurrentZone()
    
    -- Get position
    local x, y = GetPlayerMapPosition("player")
    
    -- Restore map state
    if lastContinent and lastZone then
        SetMapZoom(lastContinent, lastZone)
    end
    
    -- Return nil if position is invalid
    if x == 0 and y == 0 then
        return nil, nil
    end
    
    return x, y
end

-- Calculate distance between two points
function BAG.MapAPI:GetDistance(x1, y1, x2, y2)
    if not x1 or not y1 or not x2 or not y2 then
        return nil
    end
    
    local dx = x2 - x1
    local dy = y2 - y1
    
    -- Return distance as a fraction of the map (0-1)
    return math.sqrt(dx * dx + dy * dy)
end

-- Calculate distance in yards (approximate)
function BAG.MapAPI:GetDistanceYards(x1, y1, x2, y2)
    local distance = self:GetDistance(x1, y1, x2, y2)
    if not distance then
        return nil
    end
    
    -- Approximate conversion (varies by zone)
    -- Average zone is roughly 4000 yards across
    return distance * 4000
end

-- Format coordinates for display
function BAG.MapAPI:FormatCoords(x, y)
    if not x or not y then
        return "??, ??"
    end
    
    return string.format("%.1f, %.1f", x * 100, y * 100)
end

-- Parse coordinate string (e.g., "52.3, 48.7")
function BAG.MapAPI:ParseCoords(coordString)
    if not coordString then
        return nil, nil
    end
    
    local x, y = string.match(coordString, "(%d+%.?%d*),?%s*(%d+%.?%d*)")
    
    if x and y then
        x = tonumber(x)
        y = tonumber(y)
        
        -- Convert from 0-100 to 0-1 if needed
        if x and x > 1 then
            x = x / 100
        end
        if y and y > 1 then
            y = y / 100
        end
        
        return x, y
    end
    
    return nil, nil
end

-- Check if coordinates are near player
function BAG.MapAPI:IsNearPosition(targetX, targetY, threshold)
    threshold = threshold or 0.02  -- ~20 yards
    
    local px, py = self:GetPlayerPosition()
    if not px or not py then
        return false
    end
    
    local distance = self:GetDistance(px, py, targetX, targetY)
    return distance and distance < threshold
end

-- Get direction to coordinates (as angle in degrees)
function BAG.MapAPI:GetDirection(targetX, targetY)
    local px, py = self:GetPlayerPosition()
    if not px or not py then
        return nil
    end
    
    local dx = targetX - px
    local dy = targetY - py
    
    -- Calculate angle in degrees (0 = north, 90 = east, etc.)
    local angle = math.deg(math.atan2(dx, -dy))
    if angle < 0 then
        angle = angle + 360
    end
    
    return angle
end

-- Get cardinal direction (N, NE, E, SE, S, SW, W, NW)
function BAG.MapAPI:GetCardinalDirection(targetX, targetY)
    local angle = self:GetDirection(targetX, targetY)
    if not angle then
        return nil
    end
    
    local directions = {
        "N", "NE", "E", "SE", "S", "SW", "W", "NW"
    }
    
    local index = math.floor((angle + 22.5) / 45) % 8 + 1
    return directions[index]
end

-- Get zone level range from data
function BAG.MapAPI:GetZoneLevelRange(zoneName)
    if BAG.Data and BAG.Data.Zones and BAG.Data.Zones[zoneName] then
        return BAG.Data.Zones[zoneName].minLevel, BAG.Data.Zones[zoneName].maxLevel
    end
    
    return nil, nil
end

-- Check if zone is appropriate for player level
function BAG.MapAPI:IsZoneAppropriate(zoneName, playerLevel)
    playerLevel = playerLevel or UnitLevel("player")
    
    local minLevel, maxLevel = self:GetZoneLevelRange(zoneName)
    if not minLevel or not maxLevel then
        return true  -- Unknown zone, assume appropriate
    end
    
    -- Zone is appropriate if player is within ±5 levels
    return playerLevel >= (minLevel - 5) and playerLevel <= (maxLevel + 5)
end

-- Get all zones for continent
function BAG.MapAPI:GetZonesForContinent(continentID)
    local zones = {}
    
    if BAG.Data and BAG.Data.Zones then
        for zoneName, zoneData in pairs(BAG.Data.Zones) do
            if zoneData.continent == continentID then
                table.insert(zones, {
                    name = zoneName,
                    minLevel = zoneData.minLevel,
                    maxLevel = zoneData.maxLevel
                })
            end
        end
    end
    
    return zones
end

-- Get zone type (Alliance, Horde, Contested, Sanctuary)
function BAG.MapAPI:GetZoneType()
    local pvpType, isSubZonePvP, factionName = GetZonePVPInfo()
    
    if pvpType == "sanctuary" then
        return "Sanctuary"
    elseif pvpType == "friendly" then
        return factionName or "Friendly"
    elseif pvpType == "hostile" then
        return "Hostile"
    elseif pvpType == "contested" then
        return "Contested"
    elseif pvpType == "combat" then
        return "Combat"
    else
        return "Unknown"
    end
end

-- Check if in hostile territory
function BAG.MapAPI:IsInHostileTerritory()
    local pvpType = GetZonePVPInfo()
    return pvpType == "hostile"
end

-- Check if in sanctuary
function BAG.MapAPI:IsInSanctuary()
    local pvpType = GetZonePVPInfo()
    return pvpType == "sanctuary"
end

-- Get instance info
function BAG.MapAPI:GetInstanceInfo()
    local name, instanceType, difficultyIndex, difficultyName, maxPlayers,
          dynamicDifficulty, isDynamic = GetInstanceInfo()
    
    return {
        name = name,
        type = instanceType,  -- "none", "party", "raid", "arena", "pvp"
        difficultyIndex = difficultyIndex,
        difficultyName = difficultyName,
        maxPlayers = maxPlayers,
        isDynamic = isDynamic,
        isInstance = instanceType ~= "none"
    }
end

-- Check if in dungeon
function BAG.MapAPI:IsInDungeon()
    local instanceInfo = self:GetInstanceInfo()
    return instanceInfo.type == "party"
end

-- Check if in raid
function BAG.MapAPI:IsInRaid()
    local instanceInfo = self:GetInstanceInfo()
    return instanceInfo.type == "raid"
end

-- Check if in battleground
function BAG.MapAPI:IsInBattleground()
    local instanceInfo = self:GetInstanceInfo()
    return instanceInfo.type == "pvp"
end

-- Check if in arena
function BAG.MapAPI:IsInArena()
    local instanceInfo = self:GetInstanceInfo()
    return instanceInfo.type == "arena"
end

print("|cff00B3FF[Bank Alone Guides]|r Map API loaded")
