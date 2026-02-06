--[[
    Bank Alone Guides - Map API Wrapper
    SCS / Bank Alone Guides
    
    Wraps map/position-related WoW functions for TBC Classic.
]]

local BAG = BankAlone

BAG.API = BAG.API or {}
BAG.API.Map = BAG.API.Map or {}
local MapAPI = BAG.API.Map

-- Get player's current map position (zone, x, y)
function MapAPI:GetPlayerPosition()
    -- TBC Classic Anniversary approach
    local mapID = C_Map and C_Map.GetBestMapForUnit and C_Map.GetBestMapForUnit("player")
    if mapID then
        local pos = C_Map.GetPlayerMapPosition(mapID, "player")
        if pos then
            local x, y = pos:GetXY()
            return {
                mapID = mapID,
                x = x,
                y = y,
                zone = GetZoneText() or "Unknown",
                subzone = GetSubZoneText() or "",
            }
        end
    end

    -- Fallback for older API
    return {
        mapID = nil,
        x = 0,
        y = 0,
        zone = GetZoneText() or "Unknown",
        subzone = GetSubZoneText() or "",
    }
end

-- Get distance between player and a target coordinate (approximate)
function MapAPI:GetDistanceTo(targetX, targetY)
    local pos = self:GetPlayerPosition()
    if not pos or pos.x == 0 then return 99999 end

    return BAG.Utils:Distance(pos.x, pos.y, targetX, targetY)
end

-- Get formatted distance string
function MapAPI:GetDistanceString(targetX, targetY)
    local dist = self:GetDistanceTo(targetX, targetY)
    if dist > 1000 then return "Far away" end

    -- Convert to approximate yards (very rough for display)
    local yards = dist * 1000
    if yards < 10 then
        return "Here"
    elseif yards < 50 then
        return "Very close"
    elseif yards < 200 then
        return "Nearby"
    else
        return string.format("~%.0f yards", yards)
    end
end

-- Get current zone name
function MapAPI:GetZoneName()
    return GetZoneText() or "Unknown"
end

-- Get current subzone name
function MapAPI:GetSubZoneName()
    return GetSubZoneText() or ""
end

-- Get current minimap zone
function MapAPI:GetMinimapZone()
    return GetMinimapZoneText() or ""
end

-- Get map ID for a zone name (lookup from our data)
function MapAPI:GetMapIDForZone(zoneName)
    if BAG.Data and BAG.Data.Zones then
        for _, zoneData in pairs(BAG.Data.Zones) do
            if zoneData.name == zoneName then
                return zoneData.mapID
            end
        end
    end
    return nil
end

-- Check if two positions are close enough (threshold in map units, default ~0.02 = ~2% of zone)
function MapAPI:IsNear(x1, y1, x2, y2, threshold)
    threshold = threshold or 0.02
    local dist = BAG.Utils:Distance(x1, y1, x2, y2)
    return dist <= threshold
end

-- Format coordinates for display
function MapAPI:FormatCoords(x, y)
    if not x or not y then return "??, ??" end
    return string.format("%.1f, %.1f", x * 100, y * 100)
end
