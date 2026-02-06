-------------------------------------------------------------------------------
-- Bank Alone Guides — API / MapAPI
-- Map and position helpers
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.MapAPI = BAG.MapAPI or {}

--- Get the player's current position (zone, x, y).
-- Coordinates are 0-1 fractions of the zone map.
-- @return zone, x, y  (string, number, number)
function BAG.MapAPI:GetPlayerPosition()
    local zone = GetRealZoneText() or "Unknown"
    local x, y = 0, 0

    -- TBC Classic: use C_Map API if available
    if C_Map and C_Map.GetBestMapForUnit then
        local mapID = C_Map.GetBestMapForUnit("player")
        if mapID then
            local pos = C_Map.GetPlayerMapPosition(mapID, "player")
            if pos then
                x, y = pos:GetXY()
            end
        end
    end

    return zone, x, y
end

--- Get distance between the player and a target coordinate (approximate).
-- @param targetX  Target X (0-1 fraction).
-- @param targetY  Target Y (0-1 fraction).
-- @return number  Approximate distance in "zone units" (0-141 range).
function BAG.MapAPI:GetDistanceToPoint(targetX, targetY)
    local _, px, py = self:GetPlayerPosition()
    return BAG.Utils:Distance(px, py, targetX, targetY)
end

--- Get the current zone name.
-- @return string
function BAG.MapAPI:GetZoneName()
    return GetRealZoneText() or "Unknown"
end

--- Get the current subzone name.
-- @return string
function BAG.MapAPI:GetSubZoneName()
    return GetSubZoneText() or ""
end

--- Get the current minimap zone text.
-- @return string
function BAG.MapAPI:GetMinimapZone()
    return GetMinimapZoneText() or ""
end

--- Get the current map ID.
-- @return number or nil
function BAG.MapAPI:GetCurrentMapID()
    if C_Map and C_Map.GetBestMapForUnit then
        return C_Map.GetBestMapForUnit("player")
    end
    return nil
end

--- Check if the player is within range of coordinates (approximate).
-- @param x        Target X (0-1).
-- @param y        Target Y (0-1).
-- @param radius   Acceptable distance (default 3).
-- @return boolean
function BAG.MapAPI:IsNearPoint(x, y, radius)
    radius = radius or 3
    local dist = self:GetDistanceToPoint(x, y)
    return dist <= radius
end
