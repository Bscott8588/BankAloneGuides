--[[
    Bank Alone Guides - Zone Detection
    Detects current zone and provides zone information
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Zone cache
BAG.ZoneDetection.currentZone = nil
BAG.ZoneDetection.currentSubZone = nil
BAG.ZoneDetection.currentContinent = nil
BAG.ZoneDetection.lastUpdate = 0

-- Update zone information
function BAG.ZoneDetection:Update()
    local now = GetTime()
    
    -- Throttle updates to once per second
    if now - self.lastUpdate < 1.0 then
        return
    end
    
    self.currentZone = GetZoneText()
    self.currentSubZone = GetSubZoneText()
    self.currentContinent = self:GetContinentName()
    self.lastUpdate = now
end

-- Get current zone
function BAG.ZoneDetection:GetZone()
    self:Update()
    return self.currentZone
end

-- Get current subzone
function BAG.ZoneDetection:GetSubZone()
    self:Update()
    return self.currentSubZone
end

-- Get continent name
function BAG.ZoneDetection:GetContinentName()
    local continent = GetCurrentMapContinent()
    local continents = {
        [0] = "Kalimdor",
        [1] = "Eastern Kingdoms",
        [2] = "Outland",
        [3] = "Northrend"
    }
    
    return continents[continent] or "Unknown"
end

-- Check if in Outland
function BAG.ZoneDetection:IsInOutland()
    return GetCurrentMapContinent() == 2
end

-- Check if in Azeroth (Kalimdor or EK)
function BAG.ZoneDetection:IsInAzeroth()
    local continent = GetCurrentMapContinent()
    return continent == 0 or continent == 1
end

-- Check if in specific zone
function BAG.ZoneDetection:IsInZone(zoneName)
    local currentZone = self:GetZone()
    return string.upper(currentZone) == string.upper(zoneName)
end

-- Get zone level range
function BAG.ZoneDetection:GetZoneLevelRange(zoneName)
    zoneName = zoneName or self:GetZone()
    
    if BAG.Data and BAG.Data.Zones and BAG.Data.Zones[zoneName] then
        return BAG.Data.Zones[zoneName].minLevel, BAG.Data.Zones[zoneName].maxLevel
    end
    
    return nil, nil
end

-- Check if zone is appropriate for player
function BAG.ZoneDetection:IsZoneAppropriate(zoneName)
    zoneName = zoneName or self:GetZone()
    local playerLevel = UnitLevel("player")
    
    local minLevel, maxLevel = self:GetZoneLevelRange(zoneName)
    if not minLevel or not maxLevel then
        return true  -- Unknown zone, assume appropriate
    end
    
    -- Zone is appropriate if player is within range or slightly above/below
    return playerLevel >= (minLevel - 5) and playerLevel <= (maxLevel + 5)
end

-- Get zone faction (Alliance, Horde, Contested, Sanctuary)
function BAG.ZoneDetection:GetZoneFaction()
    local pvpType, isSubZonePvP, factionName = GetZonePVPInfo()
    
    if pvpType == "sanctuary" then
        return "Sanctuary"
    elseif pvpType == "friendly" then
        return factionName or "Friendly"
    elseif pvpType == "hostile" then
        return "Hostile"
    elseif pvpType == "contested" then
        return "Contested"
    else
        return "Unknown"
    end
end

-- Check if in hostile territory
function BAG.ZoneDetection:IsInHostileTerritory()
    local pvpType = GetZonePVPInfo()
    return pvpType == "hostile"
end

-- Check if in sanctuary
function BAG.ZoneDetection:IsInSanctuary()
    local pvpType = GetZonePVPInfo()
    return pvpType == "sanctuary"
end

-- Check if in contested territory
function BAG.ZoneDetection:IsInContestedTerritory()
    local pvpType = GetZonePVPInfo()
    return pvpType == "contested"
end

-- Get zone type (instance, battleground, arena, world)
function BAG.ZoneDetection:GetZoneType()
    local _, instanceType = IsInInstance()
    
    if instanceType == "party" then
        return "Dungeon"
    elseif instanceType == "raid" then
        return "Raid"
    elseif instanceType == "pvp" then
        return "Battleground"
    elseif instanceType == "arena" then
        return "Arena"
    else
        return "World"
    end
end

-- Check if in instance
function BAG.ZoneDetection:IsInInstance()
    local inInstance = IsInInstance()
    return inInstance
end

-- Check if in dungeon
function BAG.ZoneDetection:IsInDungeon()
    local _, instanceType = IsInInstance()
    return instanceType == "party"
end

-- Check if in raid
function BAG.ZoneDetection:IsInRaid()
    local _, instanceType = IsInInstance()
    return instanceType == "raid"
end

-- Check if in battleground
function BAG.ZoneDetection:IsInBattleground()
    local _, instanceType = IsInInstance()
    return instanceType == "pvp"
end

-- Check if in capital city
function BAG.ZoneDetection:IsInCapitalCity()
    local zone = self:GetZone()
    local capitalCities = {
        ["Orgrimmar"] = true,
        ["Stormwind City"] = true,
        ["Ironforge"] = true,
        ["Darnassus"] = true,
        ["Thunder Bluff"] = true,
        ["Undercity"] = true,
        ["Shattrath City"] = true,
        ["The Exodar"] = true,
        ["Silvermoon City"] = true
    }
    
    return capitalCities[zone] == true
end

-- Get nearest city/hub
function BAG.ZoneDetection:GetNearestCity()
    local zone = self:GetZone()
    local faction = UnitFactionGroup("player")
    
    -- Check current zone for major hubs
    if self:IsInCapitalCity() then
        return zone
    end
    
    -- Zone-specific nearest cities (simplified)
    if BAG.Data and BAG.Data.Zones and BAG.Data.Zones[zone] then
        return BAG.Data.Zones[zone].nearestCity
    end
    
    return nil
end

-- Get starting zone for race
function BAG.ZoneDetection:GetStartingZone(race)
    race = race or select(2, UnitRace("player"))
    
    local startingZones = {
        ["Human"] = "Elwynn Forest",
        ["Dwarf"] = "Dun Morogh",
        ["Gnome"] = "Dun Morogh",
        ["NightElf"] = "Teldrassil",
        ["Draenei"] = "Azuremyst Isle",
        ["Orc"] = "Durotar",
        ["Troll"] = "Durotar",
        ["Tauren"] = "Mulgore",
        ["Undead"] = "Tirisfal Glades",
        ["BloodElf"] = "Eversong Woods"
    }
    
    return startingZones[race]
end

-- Get recommended zones for level range
function BAG.ZoneDetection:GetRecommendedZones(minLevel, maxLevel, faction)
    minLevel = minLevel or UnitLevel("player")
    maxLevel = maxLevel or minLevel
    faction = faction or UnitFactionGroup("player")
    
    local zones = {}
    
    if BAG.Data and BAG.Data.Zones then
        for zoneName, zoneData in pairs(BAG.Data.Zones) do
            -- Check if zone level range overlaps with player level range
            if zoneData.minLevel <= maxLevel and zoneData.maxLevel >= minLevel then
                -- Check faction appropriateness
                if not zoneData.faction or zoneData.faction == faction or zoneData.faction == "Contested" then
                    table.insert(zones, {
                        name = zoneName,
                        minLevel = zoneData.minLevel,
                        maxLevel = zoneData.maxLevel,
                        continent = zoneData.continent
                    })
                end
            end
        end
    end
    
    -- Sort by level
    table.sort(zones, function(a, b)
        return a.minLevel < b.minLevel
    end)
    
    return zones
end

-- Check if player can fly in current zone
function BAG.ZoneDetection:CanFlyInZone()
    -- In TBC, can only fly in Outland with appropriate skill
    if not self:IsInOutland() then
        return false
    end
    
    -- Check if player has flying mount skill
    local ridingSkill = BAG.PlayerAPI:GetRidingSkill()
    return ridingSkill >= 225  -- Expert Riding
end

-- Get zone information summary
function BAG.ZoneDetection:GetZoneInfo()
    self:Update()
    
    return {
        zone = self.currentZone,
        subZone = self.currentSubZone,
        continent = self.currentContinent,
        faction = self:GetZoneFaction(),
        type = self:GetZoneType(),
        isOutland = self:IsInOutland(),
        isHostile = self:IsInHostileTerritory(),
        isSanctuary = self:IsInSanctuary(),
        isCapitalCity = self:IsInCapitalCity(),
        isAppropriate = self:IsZoneAppropriate(),
        canFly = self:CanFlyInZone()
    }
end

print("|cff00B3FF[Bank Alone Guides]|r Zone Detection loaded")
