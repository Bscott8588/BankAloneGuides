--[[
    Bank Alone Guides - Zone Database
    Comprehensive zone information for TBC Classic Anniversary
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
BAG.Data.Zones = {}

-- Zone data structure:
-- {
--   minLevel = minimum recommended level
--   maxLevel = maximum recommended level
--   continent = 0=Kalimdor, 1=EK, 2=Outland
--   faction = "Alliance", "Horde", or "Contested"
--   type = "zone", "city", "instance", "raid"
--   nearestCity = closest major hub
-- }

-- Azeroth (Classic) Zones

-- EASTERN KINGDOMS
BAG.Data.Zones["Elwynn Forest"] = {minLevel=1, maxLevel=10, continent=1, faction="Alliance", nearestCity="Stormwind City"}
BAG.Data.Zones["Dun Morogh"] = {minLevel=1, maxLevel=10, continent=1, faction="Alliance", nearestCity="Ironforge"}
BAG.Data.Zones["Tirisfal Glades"] = {minLevel=1, maxLevel=10, continent=1, faction="Horde", nearestCity="Undercity"}
BAG.Data.Zones["Eversong Woods"] = {minLevel=1, maxLevel=10, continent=1, faction="Horde", nearestCity="Silvermoon City"}
BAG.Data.Zones["Ghostlands"] = {minLevel=10, maxLevel=20, continent=1, faction="Horde", nearestCity="Silvermoon City"}
BAG.Data.Zones["Westfall"] = {minLevel=10, maxLevel=20, continent=1, faction="Alliance", nearestCity="Stormwind City"}
BAG.Data.Zones["Loch Modan"] = {minLevel=10, maxLevel=20, continent=1, faction="Alliance", nearestCity="Ironforge"}
BAG.Data.Zones["Silverpine Forest"] = {minLevel=10, maxLevel=20, continent=1, faction="Horde", nearestCity="Undercity"}
BAG.Data.Zones["Redridge Mountains"] = {minLevel=15, maxLevel=25, continent=1, faction="Contested", nearestCity="Stormwind City"}
BAG.Data.Zones["Duskwood"] = {minLevel=18, maxLevel=30, continent=1, faction="Contested", nearestCity="Stormwind City"}
BAG.Data.Zones["Hillsbrad Foothills"] = {minLevel=20, maxLevel=30, continent=1, faction="Contested", nearestCity="Undercity"}
BAG.Data.Zones["Wetlands"] = {minLevel=20, maxLevel=30, continent=1, faction="Contested", nearestCity="Ironforge"}
BAG.Data.Zones["Arathi Highlands"] = {minLevel=30, maxLevel=40, continent=1, faction="Contested", nearestCity="Ironforge"}
BAG.Data.Zones["Stranglethorn Vale"] = {minLevel=30, maxLevel=45, continent=1, faction="Contested", nearestCity="Booty Bay"}
BAG.Data.Zones["Badlands"] = {minLevel=35, maxLevel=45, continent=1, faction="Contested", nearestCity="Ironforge"}
BAG.Data.Zones["Swamp of Sorrows"] = {minLevel=35, maxLevel=45, continent=1, faction="Contested", nearestCity="Stonard"}
BAG.Data.Zones["Hinterlands"] = {minLevel=40, maxLevel=50, continent=1, faction="Contested", nearestCity="Aerie Peak"}
BAG.Data.Zones["Searing Gorge"] = {minLevel=43, maxLevel=50, continent=1, faction="Contested", nearestCity="Thorium Point"}
BAG.Data.Zones["Blasted Lands"] = {minLevel=45, maxLevel=55, continent=1, faction="Contested", nearestCity="Nethergarde Keep"}
BAG.Data.Zones["Burning Steppes"] = {minLevel=50, maxLevel=58, continent=1, faction="Contested", nearestCity="Morgan's Vigil"}
BAG.Data.Zones["Western Plaguelands"] = {minLevel=51, maxLevel=58, continent=1, faction="Contested", nearestCity="Chillwind Camp"}
BAG.Data.Zones["Eastern Plaguelands"] = {minLevel=53, maxLevel=60, continent=1, faction="Contested", nearestCity="Light's Hope Chapel"}

-- KALIMDOR
BAG.Data.Zones["Durotar"] = {minLevel=1, maxLevel=10, continent=0, faction="Horde", nearestCity="Orgrimmar"}
BAG.Data.Zones["Mulgore"] = {minLevel=1, maxLevel=10, continent=0, faction="Horde", nearestCity="Thunder Bluff"}
BAG.Data.Zones["Teldrassil"] = {minLevel=1, maxLevel=10, continent=0, faction="Alliance", nearestCity="Darnassus"}
BAG.Data.Zones["Azuremyst Isle"] = {minLevel=1, maxLevel=10, continent=0, faction="Alliance", nearestCity="The Exodar"}
BAG.Data.Zones["Bloodmyst Isle"] = {minLevel=10, maxLevel=20, continent=0, faction="Alliance", nearestCity="The Exodar"}
BAG.Data.Zones["Darkshore"] = {minLevel=10, maxLevel=20, continent=0, faction="Alliance", nearestCity="Auberdine"}
BAG.Data.Zones["The Barrens"] = {minLevel=10, maxLevel=25, continent=0, faction="Horde", nearestCity="Crossroads"}
BAG.Data.Zones["Stonetalon Mountains"] = {minLevel=15, maxLevel=27, continent=0, faction="Contested", nearestCity="Sun Rock Retreat"}
BAG.Data.Zones["Ashenvale"] = {minLevel=18, maxLevel=30, continent=0, faction="Contested", nearestCity="Astranaar"}
BAG.Data.Zones["Thousand Needles"] = {minLevel=25, maxLevel=35, continent=0, faction="Contested", nearestCity="Freewind Post"}
BAG.Data.Zones["Desolace"] = {minLevel=30, maxLevel=40, continent=0, faction="Contested", nearestCity="Nijel's Point"}
BAG.Data.Zones["Dustwallow Marsh"] = {minLevel=35, maxLevel=45, continent=0, faction="Contested", nearestCity="Theramore"}
BAG.Data.Zones["Tanaris"] = {minLevel=40, maxLevel=50, continent=0, faction="Contested", nearestCity="Gadgetzan"}
BAG.Data.Zones["Feralas"] = {minLevel=42, maxLevel=50, continent=0, faction="Contested", nearestCity="Feathermoon Stronghold"}
BAG.Data.Zones["Azshara"] = {minLevel=45, maxLevel=55, continent=0, faction="Contested", nearestCity="Orgrimmar"}
BAG.Data.Zones["Felwood"] = {minLevel=48, maxLevel=55, continent=0, faction="Contested", nearestCity="Talonbranch Glade"}
BAG.Data.Zones["Un'Goro Crater"] = {minLevel=48, maxLevel=55, continent=0, faction="Contested", nearestCity="Marshal's Refuge"}
BAG.Data.Zones["Winterspring"] = {minLevel=55, maxLevel=60, continent=0, faction="Contested", nearestCity="Everlook"}
BAG.Data.Zones["Silithus"] = {minLevel=55, maxLevel=60, continent=0, faction="Contested", nearestCity="Cenarion Hold"}

-- OUTLAND (TBC) Zones
BAG.Data.Zones["Hellfire Peninsula"] = {minLevel=58, maxLevel=63, continent=2, faction="Contested", nearestCity="Honor Hold"}
BAG.Data.Zones["Zangarmarsh"] = {minLevel=60, maxLevel=64, continent=2, faction="Contested", nearestCity="Telredor"}
BAG.Data.Zones["Terokkar Forest"] = {minLevel=62, maxLevel=65, continent=2, faction="Contested", nearestCity="Shattrath City"}
BAG.Data.Zones["Nagrand"] = {minLevel=64, maxLevel=67, continent=2, faction="Contested", nearestCity="Telaar"}
BAG.Data.Zones["Blade's Edge Mountains"] = {minLevel=65, maxLevel=68, continent=2, faction="Contested", nearestCity="Sylvanaar"}
BAG.Data.Zones["Netherstorm"] = {minLevel=67, maxLevel=70, continent=2, faction="Contested", nearestCity="Area 52"}
BAG.Data.Zones["Shadowmoon Valley"] = {minLevel=67, maxLevel=70, continent=2, faction="Contested", nearestCity="Wildhammer Stronghold"}

-- Cities
BAG.Data.Zones["Stormwind City"] = {minLevel=1, maxLevel=70, continent=1, faction="Alliance", type="city"}
BAG.Data.Zones["Ironforge"] = {minLevel=1, maxLevel=70, continent=1, faction="Alliance", type="city"}
BAG.Data.Zones["Darnassus"] = {minLevel=1, maxLevel=70, continent=0, faction="Alliance", type="city"}
BAG.Data.Zones["The Exodar"] = {minLevel=1, maxLevel=70, continent=0, faction="Alliance", type="city"}
BAG.Data.Zones["Orgrimmar"] = {minLevel=1, maxLevel=70, continent=0, faction="Horde", type="city"}
BAG.Data.Zones["Thunder Bluff"] = {minLevel=1, maxLevel=70, continent=0, faction="Horde", type="city"}
BAG.Data.Zones["Undercity"] = {minLevel=1, maxLevel=70, continent=1, faction="Horde", type="city"}
BAG.Data.Zones["Silvermoon City"] = {minLevel=1, maxLevel=70, continent=1, faction="Horde", type="city"}
BAG.Data.Zones["Shattrath City"] = {minLevel=58, maxLevel=70, continent=2, faction="Sanctuary", type="city"}

-- Helper function to get zone info
function BAG.Data:GetZoneInfo(zoneName)
    return self.Zones[zoneName]
end

-- Helper function to get zones by level range
function BAG.Data:GetZonesByLevel(level, faction)
    local zones = {}
    
    for zoneName, zoneData in pairs(self.Zones) do
        if zoneData.minLevel <= level and zoneData.maxLevel >= level then
            if not faction or not zoneData.faction or zoneData.faction == faction or zoneData.faction == "Contested" or zoneData.faction == "Sanctuary" then
                table.insert(zones, {name = zoneName, data = zoneData})
            end
        end
    end
    
    table.sort(zones, function(a, b)
        return a.data.minLevel < b.data.minLevel
    end)
    
    return zones
end

-- Helper function to get zones by continent
function BAG.Data:GetZonesByContinent(continent)
    local zones = {}
    
    for zoneName, zoneData in pairs(self.Zones) do
        if zoneData.continent == continent then
            table.insert(zones, {name = zoneName, data = zoneData})
        end
    end
    
    return zones
end

print("|cff00B3FF[Bank Alone Guides]|r Zone database loaded (" .. BAG.Utils:TableSize(BAG.Data.Zones) .. " zones)")
