-------------------------------------------------------------------------------
-- Bank Alone Guides — Data / Zones
-- Zone definitions with level ranges for TBC Classic Anniversary
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Data.Zones = BAG.Data.Zones or {}

-- Zone data: name → { levelRange, continent, faction, mapID }
-- faction: "Alliance", "Horde", "Contested", "Neutral"
BAG.Data.Zones.List = {
    -- ══════════════════════════════════════════════════════════════════
    -- EASTERN KINGDOMS — Starting Zones
    -- ══════════════════════════════════════════════════════════════════
    ["Elwynn Forest"]       = { levelRange = {1, 10},   continent = "Eastern Kingdoms", faction = "Alliance" },
    ["Dun Morogh"]          = { levelRange = {1, 10},   continent = "Eastern Kingdoms", faction = "Alliance" },
    ["Tirisfal Glades"]     = { levelRange = {1, 10},   continent = "Eastern Kingdoms", faction = "Horde" },
    ["Eversong Woods"]      = { levelRange = {1, 10},   continent = "Eastern Kingdoms", faction = "Horde" },

    -- ══════════════════════════════════════════════════════════════════
    -- KALIMDOR — Starting Zones
    -- ══════════════════════════════════════════════════════════════════
    ["Teldrassil"]          = { levelRange = {1, 10},   continent = "Kalimdor", faction = "Alliance" },
    ["Azuremyst Isle"]      = { levelRange = {1, 10},   continent = "Kalimdor", faction = "Alliance" },
    ["Durotar"]             = { levelRange = {1, 10},   continent = "Kalimdor", faction = "Horde" },
    ["Mulgore"]             = { levelRange = {1, 10},   continent = "Kalimdor", faction = "Horde" },

    -- ══════════════════════════════════════════════════════════════════
    -- EASTERN KINGDOMS — Leveling Zones
    -- ══════════════════════════════════════════════════════════════════
    ["Westfall"]            = { levelRange = {10, 20},  continent = "Eastern Kingdoms", faction = "Alliance" },
    ["Loch Modan"]          = { levelRange = {10, 20},  continent = "Eastern Kingdoms", faction = "Alliance" },
    ["Silverpine Forest"]   = { levelRange = {10, 20},  continent = "Eastern Kingdoms", faction = "Horde" },
    ["Ghostlands"]          = { levelRange = {10, 20},  continent = "Eastern Kingdoms", faction = "Horde" },
    ["Redridge Mountains"]  = { levelRange = {15, 25},  continent = "Eastern Kingdoms", faction = "Alliance" },
    ["Duskwood"]            = { levelRange = {18, 30},  continent = "Eastern Kingdoms", faction = "Alliance" },
    ["Wetlands"]            = { levelRange = {20, 30},  continent = "Eastern Kingdoms", faction = "Alliance" },
    ["Hillsbrad Foothills"] = { levelRange = {20, 30},  continent = "Eastern Kingdoms", faction = "Horde" },
    ["Arathi Highlands"]    = { levelRange = {30, 40},  continent = "Eastern Kingdoms", faction = "Contested" },
    ["Stranglethorn Vale"]  = { levelRange = {30, 45},  continent = "Eastern Kingdoms", faction = "Contested" },
    ["Badlands"]            = { levelRange = {35, 45},  continent = "Eastern Kingdoms", faction = "Contested" },
    ["Swamp of Sorrows"]    = { levelRange = {35, 45},  continent = "Eastern Kingdoms", faction = "Contested" },
    ["The Hinterlands"]     = { levelRange = {40, 50},  continent = "Eastern Kingdoms", faction = "Contested" },
    ["Searing Gorge"]       = { levelRange = {43, 50},  continent = "Eastern Kingdoms", faction = "Contested" },
    ["Blasted Lands"]       = { levelRange = {45, 55},  continent = "Eastern Kingdoms", faction = "Contested" },
    ["Burning Steppes"]     = { levelRange = {50, 58},  continent = "Eastern Kingdoms", faction = "Contested" },
    ["Western Plaguelands"] = { levelRange = {51, 58},  continent = "Eastern Kingdoms", faction = "Contested" },
    ["Eastern Plaguelands"] = { levelRange = {53, 60},  continent = "Eastern Kingdoms", faction = "Contested" },
    ["Deadwind Pass"]       = { levelRange = {55, 60},  continent = "Eastern Kingdoms", faction = "Contested" },

    -- ══════════════════════════════════════════════════════════════════
    -- KALIMDOR — Leveling Zones
    -- ══════════════════════════════════════════════════════════════════
    ["Darkshore"]           = { levelRange = {10, 20},  continent = "Kalimdor", faction = "Alliance" },
    ["Bloodmyst Isle"]      = { levelRange = {10, 20},  continent = "Kalimdor", faction = "Alliance" },
    ["The Barrens"]         = { levelRange = {10, 25},  continent = "Kalimdor", faction = "Horde" },
    ["Stonetalon Mountains"]= { levelRange = {15, 27},  continent = "Kalimdor", faction = "Contested" },
    ["Ashenvale"]           = { levelRange = {18, 30},  continent = "Kalimdor", faction = "Contested" },
    ["Thousand Needles"]    = { levelRange = {25, 35},  continent = "Kalimdor", faction = "Contested" },
    ["Desolace"]            = { levelRange = {30, 40},  continent = "Kalimdor", faction = "Contested" },
    ["Dustwallow Marsh"]    = { levelRange = {35, 45},  continent = "Kalimdor", faction = "Contested" },
    ["Feralas"]             = { levelRange = {40, 50},  continent = "Kalimdor", faction = "Contested" },
    ["Tanaris"]             = { levelRange = {40, 50},  continent = "Kalimdor", faction = "Contested" },
    ["Un'Goro Crater"]      = { levelRange = {48, 55},  continent = "Kalimdor", faction = "Contested" },
    ["Felwood"]             = { levelRange = {48, 55},  continent = "Kalimdor", faction = "Contested" },
    ["Azshara"]             = { levelRange = {45, 55},  continent = "Kalimdor", faction = "Contested" },
    ["Winterspring"]        = { levelRange = {53, 60},  continent = "Kalimdor", faction = "Contested" },
    ["Silithus"]            = { levelRange = {55, 60},  continent = "Kalimdor", faction = "Contested" },

    -- ══════════════════════════════════════════════════════════════════
    -- OUTLAND — TBC Zones
    -- ══════════════════════════════════════════════════════════════════
    ["Hellfire Peninsula"]     = { levelRange = {58, 63},  continent = "Outland", faction = "Contested" },
    ["Zangarmarsh"]            = { levelRange = {60, 64},  continent = "Outland", faction = "Contested" },
    ["Terokkar Forest"]        = { levelRange = {62, 65},  continent = "Outland", faction = "Contested" },
    ["Nagrand"]                = { levelRange = {64, 67},  continent = "Outland", faction = "Contested" },
    ["Blade's Edge Mountains"] = { levelRange = {65, 68},  continent = "Outland", faction = "Contested" },
    ["Netherstorm"]            = { levelRange = {67, 70},  continent = "Outland", faction = "Contested" },
    ["Shadowmoon Valley"]      = { levelRange = {67, 70},  continent = "Outland", faction = "Contested" },

    -- ══════════════════════════════════════════════════════════════════
    -- CITIES
    -- ══════════════════════════════════════════════════════════════════
    ["Stormwind City"]   = { levelRange = {1, 70}, continent = "Eastern Kingdoms", faction = "Alliance" },
    ["Ironforge"]        = { levelRange = {1, 70}, continent = "Eastern Kingdoms", faction = "Alliance" },
    ["Darnassus"]        = { levelRange = {1, 70}, continent = "Kalimdor",         faction = "Alliance" },
    ["The Exodar"]       = { levelRange = {1, 70}, continent = "Kalimdor",         faction = "Alliance" },
    ["Orgrimmar"]        = { levelRange = {1, 70}, continent = "Kalimdor",         faction = "Horde" },
    ["Thunder Bluff"]    = { levelRange = {1, 70}, continent = "Kalimdor",         faction = "Horde" },
    ["Undercity"]        = { levelRange = {1, 70}, continent = "Eastern Kingdoms", faction = "Horde" },
    ["Silvermoon City"]  = { levelRange = {1, 70}, continent = "Eastern Kingdoms", faction = "Horde" },
    ["Shattrath City"]   = { levelRange = {1, 70}, continent = "Outland",          faction = "Neutral" },
}

--- Get zone data by name.
-- @param zoneName  The zone name.
-- @return table or nil
function BAG.Data.Zones:Get(zoneName)
    return self.List[zoneName]
end

--- Get the level range for a zone.
-- @param zoneName  The zone name.
-- @return minLevel, maxLevel (or 0, 0 if unknown)
function BAG.Data.Zones:GetLevelRange(zoneName)
    local z = self.List[zoneName]
    if z and z.levelRange then
        return z.levelRange[1], z.levelRange[2]
    end
    return 0, 0
end

--- Get all zones suitable for a level.
-- @param level    Player level.
-- @param faction  "Alliance" or "Horde" (optional).
-- @return table   List of zone names.
function BAG.Data.Zones:GetZonesForLevel(level, faction)
    local results = {}
    for name, data in pairs(self.List) do
        if data.levelRange then
            local minL, maxL = data.levelRange[1], data.levelRange[2]
            if level >= minL and level <= maxL then
                if not faction or data.faction == faction or
                   data.faction == "Contested" or data.faction == "Neutral" then
                    results[#results + 1] = name
                end
            end
        end
    end
    return results
end
