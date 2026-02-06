-------------------------------------------------------------------------------
-- Bank Alone Guides — Data / Vendors
-- Important vendors for guides (reagents, recipes, profession supplies)
-- All descriptions are original content
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Data.Vendors = BAG.Data.Vendors or {}

-- Vendor entry format:
-- [npcID] = { name, zone, x, y, faction, sells, note }
BAG.Data.Vendors.List = {

    -- ══════════════════════════════════════════════════════════════════
    -- GENERAL / TRADE GOODS VENDORS
    -- ══════════════════════════════════════════════════════════════════
    [1257]  = { name = "Tharynn Bouden",      zone = "Elwynn Forest",      x = 41.7, y = 67.0, faction = "Alliance", sells = "General goods",        note = "Trade goods vendor near Goldshire with basic supplies" },
    [3085]  = { name = "Trak'gen",            zone = "Durotar",            x = 52.3, y = 41.8, faction = "Horde",    sells = "General goods",        note = "General vendor at Razor Hill stocking essentials" },
    [5128]  = { name = "Bombus Finespindle",  zone = "Ironforge",          x = 38.4, y = 71.2, faction = "Alliance", sells = "Trade goods",          note = "Trade supplies vendor in the Ironforge trade district" },
    [3413]  = { name = "Sovik",               zone = "Orgrimmar",          x = 75.6, y = 25.4, faction = "Horde",    sells = "Engineering supplies", note = "Engineering supply vendor in Orgrimmar" },

    -- ══════════════════════════════════════════════════════════════════
    -- ALCHEMY / HERB VENDORS
    -- ══════════════════════════════════════════════════════════════════
    [1685]  = { name = "Xandar Goodbeard",    zone = "Loch Modan",         x = 36.8, y = 46.2, faction = "Alliance", sells = "Alchemy supplies",     note = "Stocks empty vials and basic alchemy reagents" },
    [3348]  = { name = "Kor'geld",            zone = "Orgrimmar",          x = 56.2, y = 39.8, faction = "Horde",    sells = "Alchemy supplies",     note = "Alchemy reagent vendor in the Drag" },

    -- ══════════════════════════════════════════════════════════════════
    -- TAILORING / CLOTH VENDORS
    -- ══════════════════════════════════════════════════════════════════
    [2668]  = { name = "Rema Schneider",      zone = "Stormwind City",     x = 53.2, y = 81.8, faction = "Alliance", sells = "Tailoring supplies",   note = "Thread and dye vendor in the Mage Quarter" },
    [3364]  = { name = "Borya",               zone = "Orgrimmar",          x = 63.3, y = 51.3, faction = "Horde",    sells = "Tailoring supplies",   note = "Cloth and thread vendor near the tailoring trainer" },

    -- ══════════════════════════════════════════════════════════════════
    -- LEATHERWORKING VENDORS
    -- ══════════════════════════════════════════════════════════════════
    [5565]  = { name = "Adair Gilroy",        zone = "Stormwind City",     x = 71.6, y = 62.4, faction = "Alliance", sells = "Leatherworking supplies", note = "Leather goods and salt vendor in Stormwind" },
    [3366]  = { name = "Tamar",               zone = "Orgrimmar",          x = 62.6, y = 44.8, faction = "Horde",    sells = "Leatherworking supplies", note = "Sells salt, dye, and thread for leatherworking" },

    -- ══════════════════════════════════════════════════════════════════
    -- BLACKSMITHING VENDORS
    -- ══════════════════════════════════════════════════════════════════
    [5512]  = { name = "Kaita Deepforge",     zone = "Stormwind City",     x = 63.8, y = 37.6, faction = "Alliance", sells = "Blacksmithing supplies", note = "Flux and coal vendor in the Dwarven District" },
    [3356]  = { name = "Sumi",                zone = "Orgrimmar",          x = 76.8, y = 34.8, faction = "Horde",    sells = "Blacksmithing supplies", note = "Smithing reagent vendor in the Valley of Honor" },

    -- ══════════════════════════════════════════════════════════════════
    -- COOKING / FOOD VENDORS
    -- ══════════════════════════════════════════════════════════════════
    [3489]  = { name = "Zargh",               zone = "The Barrens",        x = 62.4, y = 38.6, faction = "Horde",    sells = "Cooking supplies",     note = "Sells cooking ingredients and recipes at the Crossroads" },
    [3550]  = { name = "Shandrina",           zone = "Darkshore",          x = 36.4, y = 44.2, faction = "Alliance", sells = "Cooking supplies",     note = "Cooking vendor at Auberdine" },

    -- ══════════════════════════════════════════════════════════════════
    -- RECIPE VENDORS (notable)
    -- ══════════════════════════════════════════════════════════════════
    [2397]  = { name = "Clyde Kellen",        zone = "Hillsbrad Foothills", x = 62.2, y = 19.2, faction = "Horde",   sells = "Alchemy recipes",      note = "Sells uncommon alchemy recipes in Tarren Mill" },
    [4897]  = { name = "Killian Sanatha",     zone = "Silverpine Forest",   x = 43.2, y = 40.6, faction = "Horde",   sells = "Cooking recipes",      note = "Sells recipes not commonly found elsewhere" },

    -- ══════════════════════════════════════════════════════════════════
    -- OUTLAND VENDORS
    -- ══════════════════════════════════════════════════════════════════
    [16826] = { name = "Logistics Officer Ulrike", zone = "Hellfire Peninsula", x = 56.6, y = 62.5, faction = "Alliance", sells = "Honor Hold supplies",  note = "Sells faction gear and consumables at Honor Hold" },
    [16580] = { name = "Quartermaster Urgronn",    zone = "Hellfire Peninsula", x = 55.2, y = 36.2, faction = "Horde",    sells = "Thrallmar supplies",   note = "Faction vendor at Thrallmar" },
    [18005] = { name = "Provisioner Nasela",       zone = "Zangarmarsh",        x = 78.2, y = 63.4, faction = "Neutral",  sells = "Cenarion supplies",    note = "Cenarion Expedition provisioner at the refuge" },
    [19663] = { name = "Trader Narasu",            zone = "Nagrand",            x = 54.2, y = 75.2, faction = "Alliance", sells = "Kurenai supplies",     note = "Kurenai faction vendor at Telaar" },
    [19694] = { name = "Provisioner Nasela",       zone = "Nagrand",            x = 56.8, y = 34.8, faction = "Horde",    sells = "Mag'har supplies",     note = "Mag'har faction vendor at Garadar" },
}

--- Get vendor data by NPC ID.
function BAG.Data.Vendors:Get(npcID)
    return self.List[npcID]
end

--- Find vendors by zone.
function BAG.Data.Vendors:GetByZone(zoneName, faction)
    local results = {}
    for id, vendor in pairs(self.List) do
        if vendor.zone == zoneName then
            if not faction or vendor.faction == faction or vendor.faction == "Neutral" then
                results[#results + 1] = { id = id, data = vendor }
            end
        end
    end
    return results
end

--- Find vendors selling a specific type of goods.
function BAG.Data.Vendors:GetBySellType(sellType, faction)
    local results = {}
    for id, vendor in pairs(self.List) do
        if vendor.sells and vendor.sells:lower():find(sellType:lower()) then
            if not faction or vendor.faction == faction or vendor.faction == "Neutral" then
                results[#results + 1] = { id = id, data = vendor }
            end
        end
    end
    return results
end
