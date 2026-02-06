-------------------------------------------------------------------------------
-- Bank Alone Guides — Navigation / Zone Detection
-- Zone identification and classification helpers
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.ZoneDetect = BAG.ZoneDetect or {}

-- ── Outland zones ──────────────────────────────────────────────────────────
local OUTLAND_ZONES = {
    ["Hellfire Peninsula"]  = true,
    ["Zangarmarsh"]         = true,
    ["Terokkar Forest"]     = true,
    ["Nagrand"]             = true,
    ["Blade's Edge Mountains"] = true,
    ["Netherstorm"]         = true,
    ["Shadowmoon Valley"]   = true,
    ["Shattrath City"]      = true,
}

-- ── Major cities ──────────────────────────────────────────────────────────
local CITIES = {
    -- Alliance
    ["Stormwind City"]    = "Alliance",
    ["Ironforge"]         = "Alliance",
    ["Darnassus"]         = "Alliance",
    ["The Exodar"]        = "Alliance",
    -- Horde
    ["Orgrimmar"]         = "Horde",
    ["Thunder Bluff"]     = "Horde",
    ["Undercity"]         = "Horde",
    ["Silvermoon City"]   = "Horde",
    -- Neutral
    ["Shattrath City"]    = "Neutral",
    ["Booty Bay"]         = "Neutral",
    ["Gadgetzan"]         = "Neutral",
}

-- ── Continent mapping ──────────────────────────────────────────────────────
local EASTERN_KINGDOMS = {
    "Elwynn Forest", "Westfall", "Redridge Mountains", "Duskwood",
    "Stranglethorn Vale", "Dun Morogh", "Loch Modan", "Wetlands",
    "Arathi Highlands", "Hillsbrad Foothills", "Alterac Mountains",
    "The Hinterlands", "Western Plaguelands", "Eastern Plaguelands",
    "Tirisfal Glades", "Silverpine Forest", "Burning Steppes",
    "Searing Gorge", "Badlands", "Swamp of Sorrows", "Blasted Lands",
    "Deadwind Pass", "Eversong Woods", "Ghostlands",
    "Stormwind City", "Ironforge", "Undercity", "Silvermoon City",
}

local KALIMDOR = {
    "Durotar", "Mulgore", "The Barrens", "Teldrassil", "Darkshore",
    "Ashenvale", "Stonetalon Mountains", "Desolace", "Dustwallow Marsh",
    "Feralas", "Thousand Needles", "Tanaris", "Un'Goro Crater",
    "Silithus", "Felwood", "Winterspring", "Moonglade", "Azshara",
    "Azuremyst Isle", "Bloodmyst Isle",
    "Orgrimmar", "Thunder Bluff", "Darnassus", "The Exodar",
}

--- Get the current zone name.
-- @return string
function BAG.ZoneDetect:GetCurrentZone()
    return GetRealZoneText() or "Unknown"
end

--- Get the current subzone.
-- @return string
function BAG.ZoneDetect:GetSubZone()
    return GetSubZoneText() or ""
end

--- Check if a zone is in Outland.
-- @param zone  Zone name (default: current zone).
-- @return boolean
function BAG.ZoneDetect:IsOutland(zone)
    zone = zone or self:GetCurrentZone()
    return OUTLAND_ZONES[zone] == true
end

--- Check if a zone is a major city.
-- @param zone  Zone name (default: current zone).
-- @return boolean
function BAG.ZoneDetect:IsCity(zone)
    zone = zone or self:GetCurrentZone()
    return CITIES[zone] ~= nil
end

--- Get the faction affiliation of a city.
-- @param zone  Zone name.
-- @return string  "Alliance", "Horde", "Neutral", or nil
function BAG.ZoneDetect:GetCityFaction(zone)
    return CITIES[zone]
end

--- Check if a zone is in Eastern Kingdoms.
-- @param zone  Zone name.
-- @return boolean
function BAG.ZoneDetect:IsEasternKingdoms(zone)
    zone = zone or self:GetCurrentZone()
    for _, z in ipairs(EASTERN_KINGDOMS) do
        if z == zone then return true end
    end
    return false
end

--- Check if a zone is in Kalimdor.
-- @param zone  Zone name.
-- @return boolean
function BAG.ZoneDetect:IsKalimdor(zone)
    zone = zone or self:GetCurrentZone()
    for _, z in ipairs(KALIMDOR) do
        if z == zone then return true end
    end
    return false
end

--- Get the continent for a zone.
-- @param zone  Zone name.
-- @return string  "Eastern Kingdoms", "Kalimdor", "Outland", or "Unknown"
function BAG.ZoneDetect:GetContinent(zone)
    zone = zone or self:GetCurrentZone()
    if self:IsOutland(zone) then return "Outland" end
    if self:IsEasternKingdoms(zone) then return "Eastern Kingdoms" end
    if self:IsKalimdor(zone) then return "Kalimdor" end
    return "Unknown"
end
