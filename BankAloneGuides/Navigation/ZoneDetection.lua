--[[
    Bank Alone Guides - Zone Detection
    SCS / Bank Alone Guides
    
    Helpers to detect current zone and determine continent/region.
]]

local BAG = BankAlone

BAG.ZoneDetect = BAG.ZoneDetect or {}
local ZD = BAG.ZoneDetect

-- Outland zones
ZD.OUTLAND_ZONES = {
    ["Hellfire Peninsula"] = true,
    ["Zangarmarsh"] = true,
    ["Terokkar Forest"] = true,
    ["Nagrand"] = true,
    ["Blade's Edge Mountains"] = true,
    ["Netherstorm"] = true,
    ["Shadowmoon Valley"] = true,
    ["Shattrath City"] = true,
}

-- Eastern Kingdoms major zones
ZD.EASTERN_KINGDOMS = {
    ["Elwynn Forest"] = true,
    ["Westfall"] = true,
    ["Duskwood"] = true,
    ["Stranglethorn Vale"] = true,
    ["Redridge Mountains"] = true,
    ["Burning Steppes"] = true,
    ["Searing Gorge"] = true,
    ["Dun Morogh"] = true,
    ["Loch Modan"] = true,
    ["Wetlands"] = true,
    ["Arathi Highlands"] = true,
    ["Hillsbrad Foothills"] = true,
    ["The Hinterlands"] = true,
    ["Western Plaguelands"] = true,
    ["Eastern Plaguelands"] = true,
    ["Tirisfal Glades"] = true,
    ["Silverpine Forest"] = true,
    ["Alterac Mountains"] = true,
    ["Badlands"] = true,
    ["Swamp of Sorrows"] = true,
    ["Blasted Lands"] = true,
    ["Deadwind Pass"] = true,
    ["Stormwind City"] = true,
    ["Ironforge"] = true,
    ["Undercity"] = true,
    ["Silvermoon City"] = true,
    ["Eversong Woods"] = true,
    ["Ghostlands"] = true,
    ["Isle of Quel'Danas"] = true,
}

-- Kalimdor major zones
ZD.KALIMDOR = {
    ["Durotar"] = true,
    ["Mulgore"] = true,
    ["Teldrassil"] = true,
    ["Darkshore"] = true,
    ["The Barrens"] = true,
    ["Ashenvale"] = true,
    ["Stonetalon Mountains"] = true,
    ["Desolace"] = true,
    ["Thousand Needles"] = true,
    ["Dustwallow Marsh"] = true,
    ["Feralas"] = true,
    ["Tanaris"] = true,
    ["Un'Goro Crater"] = true,
    ["Silithus"] = true,
    ["Felwood"] = true,
    ["Winterspring"] = true,
    ["Moonglade"] = true,
    ["Azshara"] = true,
    ["Orgrimmar"] = true,
    ["Thunder Bluff"] = true,
    ["Darnassus"] = true,
    ["Azuremyst Isle"] = true,
    ["Bloodmyst Isle"] = true,
    ["The Exodar"] = true,
}

-- Get the current zone name
function ZD:GetCurrentZone()
    return GetZoneText() or "Unknown"
end

-- Get the current subzone
function ZD:GetCurrentSubZone()
    return GetSubZoneText() or ""
end

-- Check if player is in Outland
function ZD:IsInOutland()
    local zone = self:GetCurrentZone()
    return self.OUTLAND_ZONES[zone] or false
end

-- Check if player is in Eastern Kingdoms
function ZD:IsInEasternKingdoms()
    local zone = self:GetCurrentZone()
    return self.EASTERN_KINGDOMS[zone] or false
end

-- Check if player is in Kalimdor
function ZD:IsInKalimdor()
    local zone = self:GetCurrentZone()
    return self.KALIMDOR[zone] or false
end

-- Get the continent the player is on
function ZD:GetContinent()
    if self:IsInOutland() then return "Outland" end
    if self:IsInEasternKingdoms() then return "Eastern Kingdoms" end
    if self:IsInKalimdor() then return "Kalimdor" end
    return "Unknown"
end

-- Check if a zone name matches a known zone
function ZD:IsKnownZone(zoneName)
    return self.OUTLAND_ZONES[zoneName] or self.EASTERN_KINGDOMS[zoneName] or self.KALIMDOR[zoneName] or false
end

-- Get the level range for a zone (from our data)
function ZD:GetZoneLevelRange(zoneName)
    if BAG.Data and BAG.Data.Zones then
        for _, zoneData in pairs(BAG.Data.Zones) do
            if zoneData.name == zoneName then
                return zoneData.levelRange
            end
        end
    end
    return nil
end

-- Determine if a zone is appropriate for a given level
function ZD:IsZoneAppropriate(zoneName, level)
    local range = self:GetZoneLevelRange(zoneName)
    if not range then return false end
    return level >= range[1] and level <= range[2]
end
