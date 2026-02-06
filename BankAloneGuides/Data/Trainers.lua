--[[
    Bank Alone Guides - Trainer Database
    Profession and class trainers for TBC Classic Anniversary
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
BAG.Data.Trainers = {}

-- Trainer data structure:
-- {
--   name = trainer name
--   profession = profession or class name
--   zone = location zone
--   x = coordinate (0-1)
--   y = coordinate (0-1)
--   faction = "Alliance", "Horde", or "Neutral"
--   maxSkill = maximum skill level taught (for professions)
-- }

-- MINING TRAINERS
BAG.Data.Trainers["Mining_SW"] = {
    name = "Gelman Stonehand",
    profession = "Mining",
    zone = "Stormwind City",
    x = 0.59, y = 0.37,
    faction = "Alliance",
    maxSkill = 300
}

BAG.Data.Trainers["Mining_IF"] = {
    name = "Geofram Bouldertoe",
    profession = "Mining",
    zone = "Ironforge",
    x = 0.50, y = 0.26,
    faction = "Alliance",
    maxSkill = 300
}

BAG.Data.Trainers["Mining_Org"] = {
    name = "Makaru",
    profession = "Mining",
    zone = "Orgrimmar",
    x = 0.72, y = 0.35,
    faction = "Horde",
    maxSkill = 300
}

BAG.Data.Trainers["Mining_Hellfire"] = {
    name = "Krugosh",
    profession = "Mining",
    zone = "Hellfire Peninsula",
    x = 0.56, y = 0.38,
    faction = "Horde",
    maxSkill = 375
}

-- HERBALISM TRAINERS
BAG.Data.Trainers["Herbalism_SW"] = {
    name = "Tannysa",
    profession = "Herbalism",
    zone = "Stormwind City",
    x = 0.55, y = 0.85,
    faction = "Alliance",
    maxSkill = 300
}

BAG.Data.Trainers["Herbalism_TB"] = {
    name = "Komin Winterhoof",
    profession = "Herbalism",
    zone = "Thunder Bluff",
    x = 0.29, y = 0.29,
    faction = "Horde",
    maxSkill = 300
}

BAG.Data.Trainers["Herbalism_Zangar"] = {
    name = "Ruak Stronghorn",
    profession = "Herbalism",
    zone = "Zangarmarsh",
    x = 0.79, y = 0.63,
    faction = "Neutral",
    maxSkill = 375
}

-- SKINNING TRAINERS
BAG.Data.Trainers["Skinning_SW"] = {
    name = "Helene Peltskinner",
    profession = "Skinning",
    zone = "Stormwind City",
    x = 0.74, y = 0.51,
    faction = "Alliance",
    maxSkill = 300
}

BAG.Data.Trainers["Skinning_Org"] = {
    name = "Yelmak",
    profession = "Skinning",
    zone = "Orgrimmar",
    x = 0.63, y = 0.50,
    faction = "Horde",
    maxSkill = 300
}

-- BLACKSMITHING TRAINERS
BAG.Data.Trainers["Blacksmithing_SW"] = {
    name = "Bengus Deepforge",
    profession = "Blacksmithing",
    zone = "Stormwind City",
    x = 0.51, y = 0.16,
    faction = "Alliance",
    maxSkill = 300
}

BAG.Data.Trainers["Blacksmithing_IF"] = {
    name = "Brock Stoneseeker",
    profession = "Blacksmithing",
    zone = "Ironforge",
    x = 0.50, y = 0.42,
    faction = "Alliance",
    maxSkill = 300
}

BAG.Data.Trainers["Blacksmithing_Org"] = {
    name = "Saru Steelfury",
    profession = "Blacksmithing",
    zone = "Orgrimmar",
    x = 0.76, y = 0.34,
    faction = "Horde",
    maxSkill = 300
}

BAG.Data.Trainers["Blacksmithing_Hellfire"] = {
    name = "Humphry",
    profession = "Blacksmithing",
    zone = "Hellfire Peninsula",
    x = 0.56, y = 0.38,
    faction = "Alliance",
    maxSkill = 375
}

-- ENGINEERING TRAINERS
BAG.Data.Trainers["Engineering_SW"] = {
    name = "Springspindle Fizzlegear",
    profession = "Engineering",
    zone = "Stormwind City",
    x = 0.63, y = 0.36,
    faction = "Alliance",
    maxSkill = 300
}

BAG.Data.Trainers["Engineering_Org"] = {
    name = "Roxxik",
    profession = "Engineering",
    zone = "Orgrimmar",
    x = 0.76, y = 0.26,
    faction = "Horde",
    maxSkill = 300
}

-- LEATHERWORKING TRAINERS
BAG.Data.Trainers["Leatherworking_SW"] = {
    name = "Simon Tanner",
    profession = "Leatherworking",
    zone = "Stormwind City",
    x = 0.71, y = 0.56,
    faction = "Alliance",
    maxSkill = 300
}

BAG.Data.Trainers["Leatherworking_Org"] = {
    name = "Karolek",
    profession = "Leatherworking",
    zone = "Orgrimmar",
    x = 0.60, y = 0.54,
    faction = "Horde",
    maxSkill = 300
}

-- TAILORING TRAINERS
BAG.Data.Trainers["Tailoring_SW"] = {
    name = "Georgio Bolero",
    profession = "Tailoring",
    zone = "Stormwind City",
    x = 0.53, y = 0.81,
    faction = "Alliance",
    maxSkill = 300
}

BAG.Data.Trainers["Tailoring_Org"] = {
    name = "Magar",
    profession = "Tailoring",
    zone = "Orgrimmar",
    x = 0.63, y = 0.52,
    faction = "Horde",
    maxSkill = 300
}

-- ENCHANTING TRAINERS
BAG.Data.Trainers["Enchanting_SW"] = {
    name = "Lucan Cordell",
    profession = "Enchanting",
    zone = "Stormwind City",
    x = 0.53, y = 0.74,
    faction = "Alliance",
    maxSkill = 300
}

BAG.Data.Trainers["Enchanting_UC"] = {
    name = "Lavinia Crowe",
    profession = "Enchanting",
    zone = "Undercity",
    x = 0.62, y = 0.59,
    faction = "Horde",
    maxSkill = 300
}

-- ALCHEMY TRAINERS
BAG.Data.Trainers["Alchemy_SW"] = {
    name = "Lilyssia Nightbreeze",
    profession = "Alchemy",
    zone = "Stormwind City",
    x = 0.56, y = 0.86,
    faction = "Alliance",
    maxSkill = 300
}

BAG.Data.Trainers["Alchemy_Org"] = {
    name = "Yelmak",
    profession = "Alchemy",
    zone = "Orgrimmar",
    x = 0.56, y = 0.56,
    faction = "Horde",
    maxSkill = 300
}

-- COOKING TRAINERS
BAG.Data.Trainers["Cooking_SW"] = {
    name = "Stephen Ryback",
    profession = "Cooking",
    zone = "Stormwind City",
    x = 0.75, y = 0.37,
    faction = "Alliance",
    maxSkill = 300
}

BAG.Data.Trainers["Cooking_Org"] = {
    name = "Zamja",
    profession = "Cooking",
    zone = "Orgrimmar",
    x = 0.57, y = 0.53,
    faction = "Horde",
    maxSkill = 300
}

-- FISHING TRAINERS
BAG.Data.Trainers["Fishing_SW"] = {
    name = "Arnold Leland",
    profession = "Fishing",
    zone = "Stormwind City",
    x = 0.55, y = 0.70,
    faction = "Alliance",
    maxSkill = 300
}

BAG.Data.Trainers["Fishing_Org"] = {
    name = "Lumak",
    profession = "Fishing",
    zone = "Orgrimmar",
    x = 0.70, y = 0.35,
    faction = "Horde",
    maxSkill = 300
}

-- FIRST AID TRAINERS
BAG.Data.Trainers["FirstAid_SW"] = {
    name = "Shaina Fuller",
    profession = "First Aid",
    zone = "Stormwind City",
    x = 0.50, y = 0.46,
    faction = "Alliance",
    maxSkill = 300
}

BAG.Data.Trainers["FirstAid_Org"] = {
    name = "Arnok",
    profession = "First Aid",
    zone = "Orgrimmar",
    x = 0.34, y = 0.84,
    faction = "Horde",
    maxSkill = 300
}

-- Helper functions
function BAG.Data:GetTrainersByProfession(profession, faction)
    local trainers = {}
    
    for trainerID, trainerData in pairs(self.Trainers) do
        if trainerData.profession == profession then
            if not faction or trainerData.faction == "Neutral" or trainerData.faction == faction then
                table.insert(trainers, {id = trainerID, data = trainerData})
            end
        end
    end
    
    return trainers
end

function BAG.Data:GetTrainersInZone(zoneName)
    local trainers = {}
    
    for trainerID, trainerData in pairs(self.Trainers) do
        if trainerData.zone == zoneName then
            table.insert(trainers, {id = trainerID, data = trainerData})
        end
    end
    
    return trainers
end

print("|cff00B3FF[Bank Alone Guides]|r Trainer database loaded (" .. BAG.Utils:TableSize(BAG.Data.Trainers) .. " trainers)")
