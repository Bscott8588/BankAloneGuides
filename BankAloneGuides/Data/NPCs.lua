-------------------------------------------------------------------------------
-- Bank Alone Guides — Data / NPCs
-- Key NPC data for TBC Classic Anniversary
-- All descriptions are original content
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Data.NPCs = BAG.Data.NPCs or {}

-- NPC entry format:
-- [npcID] = { name, zone, x, y, type, faction, note }
-- Types: "quest", "vendor", "trainer", "flightmaster", "innkeeper", "repair"
BAG.Data.NPCs.List = {

    -- ══════════════════════════════════════════════════════════════════
    -- ELWYNN FOREST (Alliance 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [197]  = { name = "Marshal McBride",     zone = "Elwynn Forest", x = 48.2, y = 42.1, type = "quest",         faction = "Alliance", note = "Initial quest hub leader at Northshire Abbey" },
    [823]  = { name = "Deputy Willem",       zone = "Elwynn Forest", x = 47.8, y = 41.5, type = "quest",         faction = "Alliance", note = "Provides early defense assignments in Northshire" },
    [233]  = { name = "Marshal Dughan",      zone = "Elwynn Forest", x = 42.1, y = 65.9, type = "quest",         faction = "Alliance", note = "Goldshire marshal who coordinates regional efforts" },
    [261]  = { name = "Guard Thomas",        zone = "Elwynn Forest", x = 73.9, y = 72.2, type = "quest",         faction = "Alliance", note = "Stationed at the eastern bridge, patrols the Eastvale area" },

    -- ══════════════════════════════════════════════════════════════════
    -- DUN MOROGH (Alliance 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [658]  = { name = "Grelin Whitebeard",   zone = "Dun Morogh",    x = 46.6, y = 53.4, type = "quest",         faction = "Alliance", note = "Dwarven elder who guides newcomers at Coldridge Valley" },
    [786]  = { name = "Mountaineer Barleybrew", zone = "Dun Morogh", x = 46.8, y = 56.4, type = "quest",         faction = "Alliance", note = "Provides early scouting tasks in the valley" },

    -- ══════════════════════════════════════════════════════════════════
    -- TELDRASSIL (Alliance 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [2079] = { name = "Conservator Ilthalaine", zone = "Teldrassil", x = 58.6, y = 44.4, type = "quest",         faction = "Alliance", note = "Night elf conservator at Aldrassil who assigns nature tasks" },
    [2077] = { name = "Tenaron Stormgrip",      zone = "Teldrassil", x = 58.6, y = 44.1, type = "quest",         faction = "Alliance", note = "Keeper atop the great tree who shares ancient wisdom" },

    -- ══════════════════════════════════════════════════════════════════
    -- AZUREMYST ISLE (Alliance 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [15721] = { name = "Proenitus",             zone = "Azuremyst Isle", x = 52.4, y = 42.8, type = "quest",      faction = "Alliance", note = "Draenei leader at the crash site who organizes survivors" },
    [15722] = { name = "Technician Zhanaa",     zone = "Azuremyst Isle", x = 52.2, y = 42.2, type = "quest",      faction = "Alliance", note = "Repairs salvaged technology from the wreckage" },

    -- ══════════════════════════════════════════════════════════════════
    -- DUROTAR (Horde 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [4537] = { name = "Kaltunk",                zone = "Durotar",    x = 42.0, y = 68.3, type = "quest",         faction = "Horde", note = "Orc overseer at the Valley of Trials" },
    [3143] = { name = "Gornek",                 zone = "Durotar",    x = 42.8, y = 69.2, type = "quest",         faction = "Horde", note = "Training master who assigns first combat trials" },
    [3188] = { name = "Razor Hill Barracks",    zone = "Durotar",    x = 52.0, y = 43.2, type = "quest",         faction = "Horde", note = "Central outpost where Durotar missions converge" },

    -- ══════════════════════════════════════════════════════════════════
    -- TIRISFAL GLADES (Horde 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [1568] = { name = "Undertaker Mordo",       zone = "Tirisfal Glades", x = 30.2, y = 71.3, type = "quest",    faction = "Horde", note = "Greets newly risen Forsaken at Deathknell" },
    [1569] = { name = "Shadow Priest Sarvis",   zone = "Tirisfal Glades", x = 31.6, y = 65.6, type = "quest",    faction = "Horde", note = "Provides spiritual guidance and first assignments" },

    -- ══════════════════════════════════════════════════════════════════
    -- MULGORE (Horde 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [2981] = { name = "Chief Hawkwind",         zone = "Mulgore",    x = 44.9, y = 76.0, type = "quest",         faction = "Horde", note = "Elder of Camp Narache who guides young Tauren" },
    [2980] = { name = "Grull Hawkwind",         zone = "Mulgore",    x = 44.5, y = 76.3, type = "quest",         faction = "Horde", note = "Assigns hunting tasks around Camp Narache" },

    -- ══════════════════════════════════════════════════════════════════
    -- EVERSONG WOODS (Horde 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [15278] = { name = "Magistrix Erona",       zone = "Eversong Woods", x = 38.2, y = 20.8, type = "quest",     faction = "Horde", note = "Blood Elf magistrix overseeing Sunstrider Isle reclamation" },
    [15279] = { name = "Lanthan Perilon",       zone = "Eversong Woods", x = 37.4, y = 21.2, type = "quest",     faction = "Horde", note = "Patrols the isle and assigns early defense tasks" },

    -- ══════════════════════════════════════════════════════════════════
    -- MAJOR FLIGHT MASTERS
    -- ══════════════════════════════════════════════════════════════════
    [352]   = { name = "Dungar Longdrink",      zone = "Stormwind City",  x = 66.2, y = 62.4, type = "flightmaster", faction = "Alliance", note = "Flight master at Stormwind's trade district" },
    [523]   = { name = "Gryth Thurden",         zone = "Ironforge",       x = 55.5, y = 47.8, type = "flightmaster", faction = "Alliance", note = "Flight master in the Ironforge great forge area" },
    [3838]  = { name = "Doras",                 zone = "Orgrimmar",       x = 45.1, y = 63.9, type = "flightmaster", faction = "Horde",    note = "Wind rider master at the Orgrimmar skyway" },
    [2995]  = { name = "Tal",                   zone = "Thunder Bluff",   x = 46.8, y = 49.8, type = "flightmaster", faction = "Horde",    note = "Wind rider master atop Thunder Bluff" },

    -- ══════════════════════════════════════════════════════════════════
    -- OUTLAND KEY NPCS
    -- ══════════════════════════════════════════════════════════════════
    [16819] = { name = "Force Commander Danath Trollbane", zone = "Hellfire Peninsula", x = 56.6, y = 66.6, type = "quest", faction = "Alliance", note = "Leads Honor Hold's forces in Hellfire" },
    [16575] = { name = "Nazgrel",                          zone = "Hellfire Peninsula", x = 55.0, y = 36.0, type = "quest", faction = "Horde",    note = "Commander of Thrallmar in Hellfire Peninsula" },
    [18230] = { name = "Cenarion Expedition Lead",         zone = "Zangarmarsh",        x = 78.5, y = 63.0, type = "quest", faction = "Neutral",  note = "Coordinates Cenarion efforts in the marshlands" },
    [18481] = { name = "Custodian of Terokkar",            zone = "Terokkar Forest",    x = 51.4, y = 45.3, type = "quest", faction = "Neutral",  note = "Guardian figure at the Cenarion outpost" },
    [18209] = { name = "Garrosh (young)",                  zone = "Nagrand",            x = 55.3, y = 37.6, type = "quest", faction = "Horde",    note = "A young orc at Garadar seeking purpose" },
    [17084] = { name = "Haggard Commander",                zone = "Blade's Edge Mountains", x = 51.6, y = 58.1, type = "quest", faction = "Alliance", note = "Outpost leader coordinating against ogre threats" },
    [20160] = { name = "Archmage Vargoth",                 zone = "Netherstorm",        x = 32.5, y = 63.8, type = "quest", faction = "Neutral",  note = "Imprisoned archmage seeking help in Netherstorm" },
    [21024] = { name = "Wildhammer Commander",             zone = "Shadowmoon Valley",  x = 37.8, y = 55.5, type = "quest", faction = "Alliance", note = "Leads the Wildhammer gryphon riders at the outpost" },
}

--- Get NPC data by ID.
-- @param npcID  Numeric NPC ID.
-- @return table or nil
function BAG.Data.NPCs:Get(npcID)
    return self.List[npcID]
end

--- Find NPCs by zone.
-- @param zoneName  The zone name.
-- @return table  List of NPC entries.
function BAG.Data.NPCs:GetByZone(zoneName)
    local results = {}
    for id, npc in pairs(self.List) do
        if npc.zone == zoneName then
            results[#results + 1] = { id = id, data = npc }
        end
    end
    return results
end

--- Find NPCs by type.
-- @param npcType  "quest", "vendor", "trainer", "flightmaster", etc.
-- @return table
function BAG.Data.NPCs:GetByType(npcType)
    local results = {}
    for id, npc in pairs(self.List) do
        if npc.type == npcType then
            results[#results + 1] = { id = id, data = npc }
        end
    end
    return results
end
