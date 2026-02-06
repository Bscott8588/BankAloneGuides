--[[
    Bank Alone Guides - NPC Database
    Important NPCs for TBC Classic Anniversary guides
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
BAG.Data.NPCs = {}

-- NPC data structure:
-- {
--   name = NPC name
--   zone = zone location
--   x = coordinate (0-1)
--   y = coordinate (0-1)
--   type = "questgiver", "vendor", "trainer", "flightmaster", "innkeeper"
--   faction = "Alliance", "Horde", or "Neutral"
-- }

-- Flight Masters
BAG.Data.NPCs[352] = {name = "Dungar Longdrink", zone = "Stormwind City", x=0.66, y=0.62, type="flightmaster", faction="Alliance"}
BAG.Data.NPCs[1571] = {name = "Gryth Thurden", zone = "Ironforge", x=0.56, y=0.48, type="flightmaster", faction="Alliance"}
BAG.Data.NPCs[3838] = {name = "Vesprystus", zone = "Darnassus", x=0.36, y=0.45, type="flightmaster", faction="Alliance"}
BAG.Data.NPCs[16822] = {name = "Stephanos", zone = "The Exodar", x=0.55, y=0.37, type="flightmaster", faction="Alliance"}

BAG.Data.NPCs[523] = {name = "Thor", zone = "Orgrimmar", x=0.45, y=0.64, type="flightmaster", faction="Horde"}
BAG.Data.NPCs[2851] = {name = "Urda", zone = "Thunder Bluff", x=0.47, y=0.50, type="flightmaster", faction="Horde"}
BAG.Data.NPCs[4551] = {name = "Michael Garrett", zone = "Undercity", x=0.63, y=0.48, type="flightmaster", faction="Horde"}
BAG.Data.NPCs[16189] = {name = "Sathiel", zone = "Silvermoon City", x=0.54, y=0.50, type="flightmaster", faction="Horde"}

-- Outland Flight Masters
BAG.Data.NPCs[18785] = {name = "Amish Wildhammer", zone = "Hellfire Peninsula", x=0.25, y=0.58, type="flightmaster", faction="Alliance"}
BAG.Data.NPCs[18930] = {name = "Flightmaster Krill Bitterhue", zone = "Hellfire Peninsula", x=0.87, y=0.52, type="flightmaster", faction="Horde"}
BAG.Data.NPCs[18953] = {name = "Munci", zone = "Zangarmarsh", x=0.68, y=0.51, type="flightmaster", faction="Alliance"}
BAG.Data.NPCs[20762] = {name = "Nutral", zone = "Shattrath City", x=0.64, y=0.42, type="flightmaster", faction="Neutral"}

-- Quest Givers (examples)
BAG.Data.NPCs[197] = {name = "Marshal Dughan", zone = "Elwynn Forest", x=0.42, y=0.66, type="questgiver", faction="Alliance"}
BAG.Data.NPCs[823] = {name = "Gryan Stoutmantle", zone = "Westfall", x=0.56, y=0.47, type="questgiver", faction="Alliance"}
BAG.Data.NPCs[3144] = {name = "Eitrigg", zone = "Orgrimmar", x=0.49, y=0.71, type="questgiver", faction="Horde"}
BAG.Data.NPCs[3429] = {name = "Thork", zone = "Durotar", x=0.51, y=0.43, type="questgiver", faction="Horde"}

-- Outland Quest Givers
BAG.Data.NPCs[16585] = {name = "Warp-Scryer Kryv", zone = "Hellfire Peninsula", x=0.71, y=0.63, type="questgiver", faction="Neutral"}
BAG.Data.NPCs[18004] = {name = "Vindicator Idaar", zone = "Hellfire Peninsula", x=0.54, y=0.63, type="questgiver", faction="Alliance"}
BAG.Data.NPCs[19253] = {name = "Mag'har Emissary", zone = "Hellfire Peninsula", x=0.55, y=0.36, type="questgiver", faction="Horde"}

-- Trainers (examples)
BAG.Data.NPCs[5492] = {name = "Katherine the Pure", zone = "Stormwind City", x=0.49, y=0.45, type="trainer", faction="Alliance", class="Priest"}
BAG.Data.NPCs[5511] = {name = "Therum Deepforge", zone = "Ironforge", x=0.50, y=0.33, type="trainer", faction="Alliance", class="Warrior"}
BAG.Data.NPCs[3030] = {name = "Sixx", zone = "Orgrimmar", x=0.57, y=0.56, type="trainer", faction="Horde", class="Rogue"}
BAG.Data.NPCs[3403] = {name = "Sian'tsu", zone = "Orgrimmar", x=0.39, y=0.48, type="trainer", faction="Horde", class="Hunter"}

-- Profession Trainers
BAG.Data.NPCs[1241] = {name = "Tognus Flintfire", zone = "Stormwind City", x=0.56, y=0.16, type="trainer", faction="Alliance", profession="Mining"}
BAG.Data.NPCs[1317] = {name = "Lucan Cordell", zone = "Stormwind City", x=0.44, y=0.54, type="trainer", faction="Alliance", profession="Enchanting"}
BAG.Data.NPCs[3355] = {name = "Saru Steelfury", zone = "Orgrimmar", x=0.76, y=0.34, type="trainer", faction="Horde", profession="Blacksmithing"}
BAG.Data.NPCs[3404] = {name = "Jandi", zone = "Orgrimmar", x=0.63, y=0.50, type="trainer", faction="Horde", profession="Leatherworking"}

-- Vendors
BAG.Data.NPCs[1347] = {name = "Alexandra Bolero", zone = "Stormwind City", x=0.55, y=0.56, type="vendor", faction="Alliance"}
BAG.Data.NPCs[3005] = {name = "Melor Stonehoof", zone = "Thunder Bluff", x=0.54, y=0.42, type="vendor", faction="Horde"}

-- Innkeepers
BAG.Data.NPCs[295] = {name = "Innkeeper Farley", zone = "Stormwind City", x=0.53, y=0.66, type="innkeeper", faction="Alliance"}
BAG.Data.NPCs[6272] = {name = "Innkeeper Jayka", zone = "Orgrimmar", x=0.54, y=0.68, type="innkeeper", faction="Horde"}
BAG.Data.NPCs[18957] = {name = "Innkeeper Grilka", zone = "Thrallmar", x=0.54, y=0.38, type="innkeeper", faction="Horde"}

-- Helper function to get NPC info
function BAG.Data:GetNPCInfo(npcID)
    return self.NPCs[npcID]
end

-- Helper function to find NPCs by type
function BAG.Data:GetNPCsByType(npcType, zone)
    local npcs = {}
    
    for npcID, npcData in pairs(self.NPCs) do
        if npcData.type == npcType then
            if not zone or npcData.zone == zone then
                table.insert(npcs, {id = npcID, data = npcData})
            end
        end
    end
    
    return npcs
end

-- Helper function to find NPCs in zone
function BAG.Data:GetNPCsInZone(zoneName)
    local npcs = {}
    
    for npcID, npcData in pairs(self.NPCs) do
        if npcData.zone == zoneName then
            table.insert(npcs, {id = npcID, data = npcData})
        end
    end
    
    return npcs
end

print("|cff00B3FF[Bank Alone Guides]|r NPC database loaded (" .. BAG.Utils:TableSize(BAG.Data.NPCs) .. " NPCs)")
