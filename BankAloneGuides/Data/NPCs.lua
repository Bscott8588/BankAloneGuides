--[[
    Bank Alone Guides - NPC Database
    Important NPCs for TBC Classic Anniversary guides
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Data.NPCs = {
    -- This is a sample database. In a full implementation, this would contain
    -- hundreds of NPCs. For now, we include key examples.
    
    -- Alliance Starting Zone NPCs
    [823] = {
        name = "Marshal Dughan",
        zone = "Elwynn Forest",
        coords = {0.42, 0.66},
        type = "questgiver",
        faction = "Alliance",
        description = "Major quest hub in Goldshire",
    },
    [1416] = {
        name = "Grimand Elmore",
        zone = "Stormwind City",
        coords = {0.51, 0.76},
        type = "trainer",
        faction = "Alliance",
        profession = "Blacksmithing",
        description = "Expert Blacksmithing trainer",
    },
    [1347] = {
        name = "Alexandra Bolero",
        zone = "Stormwind City",
        coords = {0.53, 0.75},
        type = "vendor",
        faction = "Alliance",
        description = "Cloth and leather armor vendor",
    },
    
    -- Horde Starting Zone NPCs
    [3143] = {
        name = "Gornek",
        zone = "Durotar",
        coords = {0.43, 0.68},
        type = "questgiver",
        faction = "Horde",
        description = "First quest NPC for Orcs and Trolls",
    },
    [3304] = {
        name = "Master Vornal",
        zone = "Orgrimmar",
        coords = {0.76, 0.34},
        type = "trainer",
        faction = "Horde",
        profession = "Mining",
        description = "Expert Mining trainer",
    },
    
    -- Outland NPCs (Hellfire Peninsula)
    [16829] = {
        name = "Amish Wildhammer",
        zone = "Hellfire Peninsula",
        coords = {0.56, 0.66},
        type = "questgiver",
        faction = "Alliance",
        description = "Quest hub at Honor Hold",
    },
    [16585] = {
        name = "Rohok",
        zone = "Hellfire Peninsula",
        coords = {0.55, 0.37},
        type = "questgiver",
        faction = "Horde",
        description = "Quest hub at Thrallmar",
    },
    [16588] = {
        name = "Apothecary Antonivich",
        zone = "Hellfire Peninsula",
        coords = {0.52, 0.36},
        type = "questgiver",
        faction = "Horde",
        description = "Thrallmar quest giver",
    },
    
    -- Flight Masters (examples)
    [352] = {
        name = "Dungar Longdrink",
        zone = "Stormwind City",
        coords = {0.66, 0.62},
        type = "flightmaster",
        faction = "Alliance",
        description = "Stormwind flight master",
    },
    [1387] = {
        name = "Thysta",
        zone = "Orgrimmar",
        coords = {0.45, 0.64},
        type = "flightmaster",
        faction = "Horde",
        description = "Orgrimmar flight master",
    },
    [18809] = {
        name = "Flightmaster Dungar",
        zone = "Hellfire Peninsula",
        coords = {0.54, 0.62},
        type = "flightmaster",
        faction = "Alliance",
        description = "Honor Hold flight master",
    },
    [18785] = {
        name = "Runetog",
        zone = "Hellfire Peninsula",
        coords = {0.56, 0.37},
        type = "flightmaster",
        faction = "Horde",
        description = "Thrallmar flight master",
    },
    
    -- Shattrath NPCs
    [19383] = {
        name = "Innkeeper Haelthol",
        zone = "Shattrath City",
        coords = {0.28, 0.49},
        type = "innkeeper",
        faction = "Both",
        description = "Aldor innkeeper",
    },
    [19232] = {
        name = "Innkeeper Biribi",
        zone = "Shattrath City",
        coords = {0.52, 0.54},
        type = "innkeeper",
        faction = "Both",
        description = "Scryer innkeeper",
    },
    
    -- Profession Trainers (more examples)
    [3001] = {
        name = "Brom Killian",
        zone = "Stormwind City",
        coords = {0.49, 0.77},
        type = "trainer",
        faction = "Alliance",
        profession = "Leatherworking",
        description = "Expert Leatherworking trainer",
    },
    [3007] = {
        name = "Una",
        zone = "Stormwind City",
        coords = {0.43, 0.80},
        type = "trainer",
        faction = "Alliance",
        profession = "Herbalism",
        description = "Expert Herbalism trainer",
    },
    [5511] = {
        name = "Therum Deepforge",
        zone = "Ironforge",
        coords = {0.50, 0.42},
        type = "trainer",
        faction = "Alliance",
        profession = "Mining",
        description = "Expert Mining trainer",
    },
    
    -- Vendors (more examples)
    [1286] = {
        name = "Edna Mullby",
        zone = "Stormwind City",
        coords = {0.64, 0.71},
        type = "vendor",
        faction = "Alliance",
        sells = "Food and Drink",
        description = "Food and drink vendor",
    },
    [3134] = {
        name = "Krang Stonehoof",
        zone = "Orgrimmar",
        coords = {0.46, 0.46},
        type = "vendor",
        faction = "Horde",
        sells = "General Goods",
        description = "General goods vendor",
    },
}

-- Helper function to get NPC info
function BAG.Data.NPCs:GetNPCInfo(npcID)
    return self[npcID]
end

-- Helper function to get NPCs by zone
function BAG.Data.NPCs:GetNPCsByZone(zoneName)
    local npcs = {}
    
    for npcID, npcInfo in pairs(self) do
        if type(npcInfo) == "table" and npcInfo.zone == zoneName then
            npcs[npcID] = npcInfo
        end
    end
    
    return npcs
end

-- Helper function to get NPCs by type
function BAG.Data.NPCs:GetNPCsByType(npcType)
    local npcs = {}
    
    for npcID, npcInfo in pairs(self) do
        if type(npcInfo) == "table" and npcInfo.type == npcType then
            npcs[npcID] = npcInfo
        end
    end
    
    return npcs
end

-- Helper function to get NPCs by faction
function BAG.Data.NPCs:GetNPCsByFaction(faction)
    local npcs = {}
    
    for npcID, npcInfo in pairs(self) do
        if type(npcInfo) == "table" then
            if npcInfo.faction == faction or npcInfo.faction == "Both" then
                npcs[npcID] = npcInfo
            end
        end
    end
    
    return npcs
end
