--[[
    Bank Alone Guides - Zone Detection
    Detects player's current zone and context
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.ZoneDetection = {
    currentZone = nil,
    currentSubzone = nil,
    currentContinent = nil,
    lastUpdate = 0,
    updateInterval = 1, -- Update every 1 second
}

-- Update zone information
function BAG.ZoneDetection:Update()
    local now = GetTime()
    if now - self.lastUpdate < self.updateInterval then
        return -- Don't update too frequently
    end
    
    self.currentZone = GetZoneText() or "Unknown"
    self.currentSubzone = GetSubZoneText() or ""
    self.currentContinent = self:DetectContinent()
    self.lastUpdate = now
    
    BAG:DebugPrint("Zone updated:", self.currentZone, "Continent:", self.currentContinent)
end

-- Get current zone
function BAG.ZoneDetection:GetCurrentZone()
    self:Update()
    return self.currentZone
end

-- Get current subzone
function BAG.ZoneDetection:GetCurrentSubzone()
    self:Update()
    return self.currentSubzone
end

-- Get current continent
function BAG.ZoneDetection:GetCurrentContinent()
    self:Update()
    return self.currentContinent
end

-- Detect continent based on zone
function BAG.ZoneDetection:DetectContinent()
    local zone = self.currentZone
    
    -- Check if zone is in our database
    local zoneInfo = BAG.Data.Zones[zone]
    if zoneInfo and zoneInfo.continent then
        return zoneInfo.continent
    end
    
    -- Fallback: try to detect from map
    SetMapToCurrentZone()
    local continent = GetCurrentMapContinent()
    
    local continentNames = {
        [0] = "Kalimdor",
        [1] = "Eastern Kingdoms",
        [2] = "Outland",
    }
    
    return continentNames[continent] or "Unknown"
end

-- Check if player is in Outland
function BAG.ZoneDetection:IsInOutland()
    return self:GetCurrentContinent() == "Outland"
end

-- Check if player is in a specific zone
function BAG.ZoneDetection:IsInZone(zoneName)
    local currentZone = self:GetCurrentZone()
    return currentZone:lower() == zoneName:lower()
end

-- Check if player is in a specific subzone
function BAG.ZoneDetection:IsInSubzone(subzoneName)
    local currentSubzone = self:GetCurrentSubzone()
    return currentSubzone:lower() == subzoneName:lower()
end

-- Check if player is in a city
function BAG.ZoneDetection:IsInCity()
    local zone = self:GetCurrentZone()
    local cities = {
        "Stormwind City",
        "Ironforge",
        "Darnassus",
        "The Exodar",
        "Orgrimmar",
        "Thunder Bluff",
        "Undercity",
        "Silvermoon City",
        "Shattrath City",
    }
    
    for _, city in ipairs(cities) do
        if zone:lower() == city:lower() then
            return true
        end
    end
    
    return false
end

-- Check if player is in a capital city
function BAG.ZoneDetection:IsInCapital()
    return self:IsInCity() and self:GetCurrentZone() ~= "Shattrath City"
end

-- Check if player is in an instance/dungeon
function BAG.ZoneDetection:IsInInstance()
    local inInstance, instanceType = IsInInstance()
    return inInstance
end

-- Get instance type
function BAG.ZoneDetection:GetInstanceType()
    local inInstance, instanceType = IsInInstance()
    if not inInstance then
        return nil
    end
    return instanceType -- "party", "raid", "pvp", "arena"
end

-- Get zone level range
function BAG.ZoneDetection:GetZoneLevelRange()
    local zone = self:GetCurrentZone()
    local zoneInfo = BAG.Data.Zones[zone]
    
    if zoneInfo and zoneInfo.levelRange then
        return zoneInfo.levelRange.min, zoneInfo.levelRange.max
    end
    
    return nil, nil
end

-- Check if player's level is appropriate for current zone
function BAG.ZoneDetection:IsLevelAppropriate()
    local playerLevel = BAG.PlayerAPI:GetLevel()
    local minLevel, maxLevel = self:GetZoneLevelRange()
    
    if not minLevel or not maxLevel then
        return true -- Unknown zone, assume appropriate
    end
    
    return playerLevel >= minLevel and playerLevel <= maxLevel + 5
end

-- Get suggested zones for player's level
function BAG.ZoneDetection:GetSuggestedZones()
    local playerLevel = BAG.PlayerAPI:GetLevel()
    local faction = BAG.PlayerAPI:GetFaction()
    
    return BAG.Data.Zones:GetZonesByLevel(playerLevel, faction)
end

-- Get zone faction
function BAG.ZoneDetection:GetZoneFaction()
    local zone = self:GetCurrentZone()
    local zoneInfo = BAG.Data.Zones[zone]
    
    if zoneInfo then
        return zoneInfo.faction
    end
    
    return "Both"
end

-- Check if zone is safe for player's faction
function BAG.ZoneDetection:IsZoneSafe()
    local playerFaction = BAG.PlayerAPI:GetFaction()
    local zoneFaction = self:GetZoneFaction()
    
    return zoneFaction == playerFaction or zoneFaction == "Both"
end

-- Get nearest city for player's faction
function BAG.ZoneDetection:GetNearestCity()
    local playerFaction = BAG.PlayerAPI:GetFaction()
    local currentContinent = self:GetCurrentContinent()
    
    if currentContinent == "Outland" then
        return "Shattrath City"
    end
    
    if playerFaction == "Alliance" then
        if currentContinent == "Eastern Kingdoms" then
            return "Stormwind City"
        else
            return "Darnassus"
        end
    else -- Horde
        if currentContinent == "Eastern Kingdoms" then
            return "Undercity"
        else
            return "Orgrimmar"
        end
    end
end

-- Get distance to nearest major hub
function BAG.ZoneDetection:GetDistanceToNearestHub()
    -- This is a simplified version
    -- In a full implementation, would calculate actual distances
    local currentZone = self:GetCurrentZone()
    local nearestCity = self:GetNearestCity()
    
    if currentZone == nearestCity then
        return 0
    end
    
    -- Return estimated travel time in minutes (very rough)
    if self:IsInCity() then
        return 5 -- Different city, but still in a city
    elseif self:IsInOutland() then
        return 10 -- In Outland, farther from cities
    else
        return 15 -- In Azeroth, distance varies
    end
end

-- Check if zone has a flight path
function BAG.ZoneDetection:HasFlightPath()
    local zone = self:GetCurrentZone()
    
    -- This would need a database of flight path locations
    -- For now, return true for known zones
    return BAG.Data.Zones[zone] ~= nil
end

-- Get zone type
function BAG.ZoneDetection:GetZoneType()
    local zone = self:GetCurrentZone()
    local zoneInfo = BAG.Data.Zones[zone]
    
    if zoneInfo then
        return zoneInfo.type
    end
    
    if self:IsInCity() then
        return "city"
    elseif self:IsInInstance() then
        return "instance"
    end
    
    return "zone"
end
