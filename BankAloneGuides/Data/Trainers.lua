-------------------------------------------------------------------------------
-- Bank Alone Guides — Data / Trainers
-- Profession and class trainer locations
-- All descriptions are original content
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Data.Trainers = BAG.Data.Trainers or {}

-- Trainer entry format:
-- [npcID] = { name, skill, zone, x, y, faction, level, note }
-- skill: profession or class name
-- level: "apprentice", "journeyman", "expert", "artisan", "master"
BAG.Data.Trainers.List = {

    -- ══════════════════════════════════════════════════════════════════
    -- MINING TRAINERS
    -- ══════════════════════════════════════════════════════════════════
    [5392]  = { name = "Geofram Bouldertoe",  skill = "Mining",         zone = "Ironforge",          x = 50.0, y = 26.5, faction = "Alliance", level = "expert",      note = "Expert mining trainer in the Ironforge forge area" },
    [3137]  = { name = "Brock Stoneseeker",   skill = "Mining",         zone = "Loch Modan",         x = 37.2, y = 47.0, faction = "Alliance", level = "journeyman",  note = "Journeyman miner near Thelsamar" },
    [3357]  = { name = "Makaru",              skill = "Mining",         zone = "Orgrimmar",          x = 72.5, y = 34.5, faction = "Horde",    level = "expert",      note = "Orc mining trainer in the Orgrimmar forge district" },
    [18747] = { name = "Hurnak Grimmord",     skill = "Mining",         zone = "Hellfire Peninsula", x = 56.7, y = 63.8, faction = "Alliance", level = "master",      note = "Master miner training Outland techniques at Honor Hold" },
    [18779] = { name = "Krugosh",             skill = "Mining",         zone = "Hellfire Peninsula", x = 55.4, y = 37.6, faction = "Horde",    level = "master",      note = "Master mining trainer at Thrallmar" },

    -- ══════════════════════════════════════════════════════════════════
    -- HERBALISM TRAINERS
    -- ══════════════════════════════════════════════════════════════════
    [2114]  = { name = "Herbalist Pomeroy",   skill = "Herbalism",      zone = "Elwynn Forest",      x = 39.8, y = 48.3, faction = "Alliance", level = "apprentice",  note = "Teaches the basics of herb gathering near Goldshire" },
    [3404]  = { name = "Jandi",               skill = "Herbalism",      zone = "Orgrimmar",          x = 55.8, y = 39.5, faction = "Horde",    level = "expert",      note = "Herbalism instructor in the Drag, Orgrimmar" },
    [18776] = { name = "Rorelien",            skill = "Herbalism",      zone = "Hellfire Peninsula", x = 53.6, y = 65.8, faction = "Alliance", level = "master",      note = "Master herbalist at Honor Hold" },
    [18773] = { name = "Ruak Stronghorn",     skill = "Herbalism",      zone = "Hellfire Peninsula", x = 52.2, y = 36.1, faction = "Horde",    level = "master",      note = "Master herb trainer at Thrallmar" },

    -- ══════════════════════════════════════════════════════════════════
    -- SKINNING TRAINERS
    -- ══════════════════════════════════════════════════════════════════
    [5564]  = { name = "Helene Peltskinner",  skill = "Skinning",       zone = "Elwynn Forest",      x = 46.3, y = 62.1, faction = "Alliance", level = "apprentice",  note = "Introductory skinning instructor near Goldshire" },
    [7088]  = { name = "Mooranta",            skill = "Skinning",       zone = "Thunder Bluff",      x = 44.5, y = 43.2, faction = "Horde",    level = "expert",      note = "Expert skinner at Thunder Bluff's crafting area" },
    [18775] = { name = "Jelena Nightsky",     skill = "Skinning",       zone = "Hellfire Peninsula", x = 55.8, y = 65.2, faction = "Alliance", level = "master",      note = "Master skinning trainer at Honor Hold" },

    -- ══════════════════════════════════════════════════════════════════
    -- BLACKSMITHING TRAINERS
    -- ══════════════════════════════════════════════════════════════════
    [5164]  = { name = "Grumnus Steelshaper", skill = "Blacksmithing",  zone = "Ironforge",          x = 51.5, y = 42.8, faction = "Alliance", level = "artisan",     note = "Artisan-level blacksmith in the Ironforge Great Forge" },
    [3355]  = { name = "Saru Steelfury",      skill = "Blacksmithing",  zone = "Orgrimmar",          x = 76.5, y = 34.5, faction = "Horde",    level = "artisan",     note = "Master smith in Orgrimmar's Valley of Honor" },
    [16823] = { name = "Humphry",             skill = "Blacksmithing",  zone = "Hellfire Peninsula", x = 56.8, y = 63.5, faction = "Alliance", level = "master",      note = "Master blacksmithing trainer at Honor Hold" },

    -- ══════════════════════════════════════════════════════════════════
    -- ALCHEMY TRAINERS
    -- ══════════════════════════════════════════════════════════════════
    [1215]  = { name = "Alchemist Mallory",   skill = "Alchemy",        zone = "Elwynn Forest",      x = 39.8, y = 48.6, faction = "Alliance", level = "apprentice",  note = "Beginning alchemy trainer near Goldshire" },
    [3347]  = { name = "Yelmak",              skill = "Alchemy",        zone = "Orgrimmar",          x = 56.6, y = 39.6, faction = "Horde",    level = "expert",      note = "Alchemy trainer in the Drag, Orgrimmar" },
    [18802] = { name = "Alchemist Gribble",   skill = "Alchemy",        zone = "Hellfire Peninsula", x = 53.8, y = 65.8, faction = "Alliance", level = "master",      note = "Master alchemist at Honor Hold" },

    -- ══════════════════════════════════════════════════════════════════
    -- TAILORING TRAINERS
    -- ══════════════════════════════════════════════════════════════════
    [1346]  = { name = "Georgio Bolero",      skill = "Tailoring",      zone = "Stormwind City",     x = 53.0, y = 81.5, faction = "Alliance", level = "artisan",     note = "Artisan tailor in the Stormwind Mage Quarter" },
    [3363]  = { name = "Magar",               skill = "Tailoring",      zone = "Orgrimmar",          x = 63.0, y = 51.0, faction = "Horde",    level = "artisan",     note = "Tailoring trainer in Orgrimmar's trade area" },
    [18772] = { name = "Dalinna",             skill = "Tailoring",      zone = "Hellfire Peninsula", x = 56.6, y = 66.2, faction = "Alliance", level = "master",      note = "Master tailor at Honor Hold" },

    -- ══════════════════════════════════════════════════════════════════
    -- ENCHANTING TRAINERS
    -- ══════════════════════════════════════════════════════════════════
    [1317]  = { name = "Lucan Cordell",       skill = "Enchanting",     zone = "Stormwind City",     x = 53.0, y = 74.4, faction = "Alliance", level = "artisan",     note = "Enchanting trainer in the Stormwind Mage Quarter" },
    [3345]  = { name = "Godan",               skill = "Enchanting",     zone = "Orgrimmar",          x = 53.5, y = 38.5, faction = "Horde",    level = "artisan",     note = "Enchanting trainer in the Drag" },
    [18753] = { name = "Felannia",            skill = "Enchanting",     zone = "Hellfire Peninsula", x = 53.5, y = 66.0, faction = "Alliance", level = "master",      note = "Master enchanter at Honor Hold" },

    -- ══════════════════════════════════════════════════════════════════
    -- ENGINEERING TRAINERS
    -- ══════════════════════════════════════════════════════════════════
    [5174]  = { name = "Springspindle Fizzlegear", skill = "Engineering", zone = "Ironforge",        x = 68.4, y = 44.2, faction = "Alliance", level = "artisan",     note = "Expert engineer in Ironforge's Tinker Town" },
    [3412]  = { name = "Roxxik",              skill = "Engineering",    zone = "Orgrimmar",          x = 75.0, y = 25.2, faction = "Horde",    level = "artisan",     note = "Engineering trainer in Orgrimmar's crafting district" },

    -- ══════════════════════════════════════════════════════════════════
    -- LEATHERWORKING TRAINERS
    -- ══════════════════════════════════════════════════════════════════
    [7868]  = { name = "Sarah Tanner",        skill = "Leatherworking", zone = "Stormwind City",     x = 71.8, y = 62.8, faction = "Alliance", level = "expert",      note = "Expert leatherworking trainer in Stormwind's trade area" },
    [7869]  = { name = "Karolek",             skill = "Leatherworking", zone = "Orgrimmar",          x = 62.8, y = 44.5, faction = "Horde",    level = "expert",      note = "Expert leatherworker in the Drag" },

    -- ══════════════════════════════════════════════════════════════════
    -- COOKING TRAINERS
    -- ══════════════════════════════════════════════════════════════════
    [1355]  = { name = "Cook Ghilm",          skill = "Cooking",        zone = "Dun Morogh",         x = 47.2, y = 52.6, faction = "Alliance", level = "apprentice",  note = "Beginning cooking instructor in Coldridge Valley" },
    [3399]  = { name = "Zamja",               skill = "Cooking",        zone = "Orgrimmar",          x = 57.5, y = 53.5, faction = "Horde",    level = "expert",      note = "Expert cooking trainer in the Drag" },

    -- ══════════════════════════════════════════════════════════════════
    -- FISHING TRAINERS
    -- ══════════════════════════════════════════════════════════════════
    [5493]  = { name = "Arnold Leland",       skill = "Fishing",        zone = "Stormwind City",     x = 55.0, y = 69.8, faction = "Alliance", level = "expert",      note = "Fishing trainer in Stormwind's canal district" },
    [3332]  = { name = "Lumak",               skill = "Fishing",        zone = "Orgrimmar",          x = 69.8, y = 29.5, faction = "Horde",    level = "expert",      note = "Fishing trainer near the Orgrimmar pond" },

    -- ══════════════════════════════════════════════════════════════════
    -- FIRST AID TRAINERS
    -- ══════════════════════════════════════════════════════════════════
    [5150]  = { name = "Nissa Firestone",     skill = "First Aid",      zone = "Ironforge",          x = 54.8, y = 58.6, faction = "Alliance", level = "expert",      note = "First aid trainer in Ironforge" },
    [3373]  = { name = "Arnok",               skill = "First Aid",      zone = "Orgrimmar",          x = 34.2, y = 84.6, faction = "Horde",    level = "expert",      note = "First aid trainer in Orgrimmar's Spirit Lodge" },
}

--- Get trainer data by NPC ID.
function BAG.Data.Trainers:Get(npcID)
    return self.List[npcID]
end

--- Find trainers for a specific skill.
function BAG.Data.Trainers:GetBySkill(skillName, faction)
    local results = {}
    for id, trainer in pairs(self.List) do
        if trainer.skill:lower() == skillName:lower() then
            if not faction or trainer.faction == faction or trainer.faction == "Neutral" then
                results[#results + 1] = { id = id, data = trainer }
            end
        end
    end
    return results
end
