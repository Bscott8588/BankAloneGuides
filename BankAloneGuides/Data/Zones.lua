--[[
    Bank Alone Guides - Zone Database
    Zone information for TBC Classic Anniversary
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Data.Zones = {
    -- Alliance Starting Zones
    ["Elwynn Forest"] = {
        faction = "Alliance",
        continent = "Eastern Kingdoms",
        levelRange = {min = 1, max = 10},
        races = {"Human"},
        type = "starting",
    },
    ["Dun Morogh"] = {
        faction = "Alliance",
        continent = "Eastern Kingdoms",
        levelRange = {min = 1, max = 10},
        races = {"Dwarf", "Gnome"},
        type = "starting",
    },
    ["Teldrassil"] = {
        faction = "Alliance",
        continent = "Kalimdor",
        levelRange = {min = 1, max = 10},
        races = {"NightElf"},
        type = "starting",
    },
    ["Azuremyst Isle"] = {
        faction = "Alliance",
        continent = "Outland",
        levelRange = {min = 1, max = 10},
        races = {"Draenei"},
        type = "starting",
    },
    ["Bloodmyst Isle"] = {
        faction = "Alliance",
        continent = "Outland",
        levelRange = {min = 10, max = 20},
        races = {"Draenei"},
        type = "leveling",
    },
    
    -- Horde Starting Zones
    ["Durotar"] = {
        faction = "Horde",
        continent = "Kalimdor",
        levelRange = {min = 1, max = 10},
        races = {"Orc", "Troll"},
        type = "starting",
    },
    ["Mulgore"] = {
        faction = "Horde",
        continent = "Kalimdor",
        levelRange = {min = 1, max = 10},
        races = {"Tauren"},
        type = "starting",
    },
    ["Tirisfal Glades"] = {
        faction = "Horde",
        continent = "Eastern Kingdoms",
        levelRange = {min = 1, max = 10},
        races = {"Undead"},
        type = "starting",
    },
    ["Eversong Woods"] = {
        faction = "Horde",
        continent = "Outland",
        levelRange = {min = 1, max = 10},
        races = {"BloodElf"},
        type = "starting",
    },
    ["Ghostlands"] = {
        faction = "Horde",
        continent = "Outland",
        levelRange = {min = 10, max = 20},
        races = {"BloodElf"},
        type = "leveling",
    },
    
    -- Shared/Contested Leveling Zones (10-30)
    ["Westfall"] = {
        faction = "Alliance",
        continent = "Eastern Kingdoms",
        levelRange = {min = 10, max = 20},
        type = "leveling",
    },
    ["Loch Modan"] = {
        faction = "Alliance",
        continent = "Eastern Kingdoms",
        levelRange = {min = 10, max = 20},
        type = "leveling",
    },
    ["Darkshore"] = {
        faction = "Alliance",
        continent = "Kalimdor",
        levelRange = {min = 10, max = 20},
        type = "leveling",
    },
    ["The Barrens"] = {
        faction = "Horde",
        continent = "Kalimdor",
        levelRange = {min = 10, max = 25},
        type = "leveling",
    },
    ["Silverpine Forest"] = {
        faction = "Horde",
        continent = "Eastern Kingdoms",
        levelRange = {min = 10, max = 20},
        type = "leveling",
    },
    ["Redridge Mountains"] = {
        faction = "Alliance",
        continent = "Eastern Kingdoms",
        levelRange = {min = 15, max = 25},
        type = "leveling",
    },
    ["Duskwood"] = {
        faction = "Alliance",
        continent = "Eastern Kingdoms",
        levelRange = {min = 18, max = 30},
        type = "leveling",
    },
    ["Ashenvale"] = {
        faction = "Both",
        continent = "Kalimdor",
        levelRange = {min = 18, max = 30},
        type = "leveling",
    },
    ["Wetlands"] = {
        faction = "Alliance",
        continent = "Eastern Kingdoms",
        levelRange = {min = 20, max = 30},
        type = "leveling",
    },
    ["Stonetalon Mountains"] = {
        faction = "Both",
        continent = "Kalimdor",
        levelRange = {min = 20, max = 30},
        type = "leveling",
    },
    ["Hillsbrad Foothills"] = {
        faction = "Both",
        continent = "Eastern Kingdoms",
        levelRange = {min = 20, max = 30},
        type = "leveling",
    },
    
    -- Mid-Level Zones (30-50)
    ["Thousand Needles"] = {
        faction = "Both",
        continent = "Kalimdor",
        levelRange = {min = 25, max = 35},
        type = "leveling",
    },
    ["Alterac Mountains"] = {
        faction = "Both",
        continent = "Eastern Kingdoms",
        levelRange = {min = 30, max = 40},
        type = "leveling",
    },
    ["Arathi Highlands"] = {
        faction = "Both",
        continent = "Eastern Kingdoms",
        levelRange = {min = 30, max = 40},
        type = "leveling",
    },
    ["Desolace"] = {
        faction = "Both",
        continent = "Kalimdor",
        levelRange = {min = 30, max = 40},
        type = "leveling",
    },
    ["Stranglethorn Vale"] = {
        faction = "Both",
        continent = "Eastern Kingdoms",
        levelRange = {min = 30, max = 45},
        type = "leveling",
    },
    ["Dustwallow Marsh"] = {
        faction = "Both",
        continent = "Kalimdor",
        levelRange = {min = 35, max = 45},
        type = "leveling",
    },
    ["Badlands"] = {
        faction = "Both",
        continent = "Eastern Kingdoms",
        levelRange = {min = 35, max = 45},
        type = "leveling",
    },
    ["Swamp of Sorrows"] = {
        faction = "Both",
        continent = "Eastern Kingdoms",
        levelRange = {min = 35, max = 45},
        type = "leveling",
    },
    ["Feralas"] = {
        faction = "Both",
        continent = "Kalimdor",
        levelRange = {min = 40, max = 50},
        type = "leveling",
    },
    ["Tanaris"] = {
        faction = "Both",
        continent = "Kalimdor",
        levelRange = {min = 40, max = 50},
        type = "leveling",
    },
    ["The Hinterlands"] = {
        faction = "Both",
        continent = "Eastern Kingdoms",
        levelRange = {min = 40, max = 50},
        type = "leveling",
    },
    ["Searing Gorge"] = {
        faction = "Both",
        continent = "Eastern Kingdoms",
        levelRange = {min = 43, max = 50},
        type = "leveling",
    },
    
    -- High-Level Azeroth Zones (50-60)
    ["Azshara"] = {
        faction = "Both",
        continent = "Kalimdor",
        levelRange = {min = 45, max = 55},
        type = "leveling",
    },
    ["Blasted Lands"] = {
        faction = "Both",
        continent = "Eastern Kingdoms",
        levelRange = {min = 45, max = 55},
        type = "leveling",
    },
    ["Un'Goro Crater"] = {
        faction = "Both",
        continent = "Kalimdor",
        levelRange = {min = 48, max = 55},
        type = "leveling",
    },
    ["Burning Steppes"] = {
        faction = "Both",
        continent = "Eastern Kingdoms",
        levelRange = {min = 50, max = 58},
        type = "leveling",
    },
    ["Western Plaguelands"] = {
        faction = "Both",
        continent = "Eastern Kingdoms",
        levelRange = {min = 51, max = 58},
        type = "leveling",
    },
    ["Eastern Plaguelands"] = {
        faction = "Both",
        continent = "Eastern Kingdoms",
        levelRange = {min = 53, max = 60},
        type = "leveling",
    },
    ["Winterspring"] = {
        faction = "Both",
        continent = "Kalimdor",
        levelRange = {min = 55, max = 60},
        type = "leveling",
    },
    ["Silithus"] = {
        faction = "Both",
        continent = "Kalimdor",
        levelRange = {min = 55, max = 60},
        type = "leveling",
    },
    ["Felwood"] = {
        faction = "Both",
        continent = "Kalimdor",
        levelRange = {min = 48, max = 55},
        type = "leveling",
    },
    
    -- Outland Zones (58-70)
    ["Hellfire Peninsula"] = {
        faction = "Both",
        continent = "Outland",
        levelRange = {min = 58, max = 63},
        type = "outland",
    },
    ["Zangarmarsh"] = {
        faction = "Both",
        continent = "Outland",
        levelRange = {min = 60, max = 64},
        type = "outland",
    },
    ["Terokkar Forest"] = {
        faction = "Both",
        continent = "Outland",
        levelRange = {min = 62, max = 65},
        type = "outland",
    },
    ["Nagrand"] = {
        faction = "Both",
        continent = "Outland",
        levelRange = {min = 64, max = 67},
        type = "outland",
    },
    ["Blade's Edge Mountains"] = {
        faction = "Both",
        continent = "Outland",
        levelRange = {min = 65, max = 68},
        type = "outland",
    },
    ["Netherstorm"] = {
        faction = "Both",
        continent = "Outland",
        levelRange = {min = 67, max = 70},
        type = "outland",
    },
    ["Shadowmoon Valley"] = {
        faction = "Both",
        continent = "Outland",
        levelRange = {min = 67, max = 70},
        type = "outland",
    },
    
    -- Cities
    ["Stormwind City"] = {
        faction = "Alliance",
        continent = "Eastern Kingdoms",
        type = "city",
    },
    ["Ironforge"] = {
        faction = "Alliance",
        continent = "Eastern Kingdoms",
        type = "city",
    },
    ["Darnassus"] = {
        faction = "Alliance",
        continent = "Kalimdor",
        type = "city",
    },
    ["The Exodar"] = {
        faction = "Alliance",
        continent = "Outland",
        type = "city",
    },
    ["Orgrimmar"] = {
        faction = "Horde",
        continent = "Kalimdor",
        type = "city",
    },
    ["Thunder Bluff"] = {
        faction = "Horde",
        continent = "Kalimdor",
        type = "city",
    },
    ["Undercity"] = {
        faction = "Horde",
        continent = "Eastern Kingdoms",
        type = "city",
    },
    ["Silvermoon City"] = {
        faction = "Horde",
        continent = "Outland",
        type = "city",
    },
    ["Shattrath City"] = {
        faction = "Both",
        continent = "Outland",
        type = "city",
    },
}

-- Helper function to get zone info
function BAG.Data.Zones:GetZoneInfo(zoneName)
    return self[zoneName]
end

-- Helper function to get zones by level range
function BAG.Data.Zones:GetZonesByLevel(level, faction)
    local zones = {}
    
    for zoneName, zoneInfo in pairs(self) do
        if type(zoneInfo) == "table" and zoneInfo.levelRange then
            if level >= zoneInfo.levelRange.min and level <= zoneInfo.levelRange.max then
                if not faction or zoneInfo.faction == "Both" or zoneInfo.faction == faction then
                    table.insert(zones, {name = zoneName, info = zoneInfo})
                end
            end
        end
    end
    
    return zones
end

-- Helper function to check if zone is in Outland
function BAG.Data.Zones:IsOutlandZone(zoneName)
    local zoneInfo = self[zoneName]
    return zoneInfo and zoneInfo.continent == "Outland"
end
