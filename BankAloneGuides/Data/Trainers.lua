--[[
    Bank Alone Guides - Trainer Database
    Profession and class trainers for TBC Classic
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Data.Trainers = {
    -- Alliance Profession Trainers
    
    -- Mining Trainers
    ["Alliance_Mining_Apprentice"] = {
        name = "Gelman Stonehand",
        zone = "Stormwind City",
        coords = {0.59, 0.69},
        faction = "Alliance",
        profession = "Mining",
        rank = "Apprentice",
        maxSkill = 75,
    },
    ["Alliance_Mining_Journeyman"] = {
        name = "Geofram Bouldertoe",
        zone = "Ironforge",
        coords = {0.50, 0.42},
        faction = "Alliance",
        profession = "Mining",
        rank = "Journeyman",
        maxSkill = 150,
    },
    ["Alliance_Mining_Expert"] = {
        name = "Brock Stoneseeker",
        zone = "Ironforge",
        coords = {0.50, 0.42},
        faction = "Alliance",
        profession = "Mining",
        rank = "Expert",
        maxSkill = 225,
    },
    ["Alliance_Mining_Artisan"] = {
        name = "Instructor Malicia",
        zone = "Western Plaguelands",
        coords = {0.42, 0.84},
        faction = "Alliance",
        profession = "Mining",
        rank = "Artisan",
        maxSkill = 300,
    },
    ["Alliance_Mining_Master"] = {
        name = "Hurnak Grimmord",
        zone = "Hellfire Peninsula",
        coords = {0.56, 0.63},
        faction = "Alliance",
        profession = "Mining",
        rank = "Master",
        maxSkill = 375,
    },
    
    -- Herbalism Trainers
    ["Alliance_Herbalism_Apprentice"] = {
        name = "Tannysa",
        zone = "Stormwind City",
        coords = {0.54, 0.85},
        faction = "Alliance",
        profession = "Herbalism",
        rank = "Apprentice",
        maxSkill = 75,
    },
    ["Alliance_Herbalism_Expert"] = {
        name = "Alma Jainrose",
        zone = "Darnassus",
        coords = {0.55, 0.71},
        faction = "Alliance",
        profession = "Herbalism",
        rank = "Expert",
        maxSkill = 225,
    },
    ["Alliance_Herbalism_Master"] = {
        name = "Rorelien",
        zone = "Hellfire Peninsula",
        coords = {0.53, 0.65},
        faction = "Alliance",
        profession = "Herbalism",
        rank = "Master",
        maxSkill = 375,
    },
    
    -- Skinning Trainers
    ["Alliance_Skinning_Apprentice"] = {
        name = "Helene Peltskinner",
        zone = "Elwynn Forest",
        coords = {0.79, 0.55},
        faction = "Alliance",
        profession = "Skinning",
        rank = "Apprentice",
        maxSkill = 75,
    },
    ["Alliance_Skinning_Master"] = {
        name = "Jelena Nightsky",
        zone = "Hellfire Peninsula",
        coords = {0.54, 0.63},
        faction = "Alliance",
        profession = "Skinning",
        rank = "Master",
        maxSkill = 375,
    },
    
    -- Horde Profession Trainers
    
    -- Mining Trainers
    ["Horde_Mining_Apprentice"] = {
        name = "Brom Killian",
        zone = "Orgrimmar",
        coords = {0.72, 0.34},
        faction = "Horde",
        profession = "Mining",
        rank = "Apprentice",
        maxSkill = 75,
    },
    ["Horde_Mining_Master"] = {
        name = "Krugosh",
        zone = "Hellfire Peninsula",
        coords = {0.55, 0.37},
        faction = "Horde",
        profession = "Mining",
        rank = "Master",
        maxSkill = 375,
    },
    
    -- Herbalism Trainers
    ["Horde_Herbalism_Apprentice"] = {
        name = "Martha Alliestar",
        zone = "Undercity",
        coords = {0.54, 0.75},
        faction = "Horde",
        profession = "Herbalism",
        rank = "Apprentice",
        maxSkill = 75,
    },
    ["Horde_Herbalism_Master"] = {
        name = "Ruak Stronghorn",
        zone = "Hellfire Peninsula",
        coords = {0.52, 0.36},
        faction = "Horde",
        profession = "Herbalism",
        rank = "Master",
        maxSkill = 375,
    },
    
    -- Skinning Trainers
    ["Horde_Skinning_Apprentice"] = {
        name = "Rand Rhobart",
        zone = "Orgrimmar",
        coords = {0.63, 0.45},
        faction = "Horde",
        profession = "Skinning",
        rank = "Apprentice",
        maxSkill = 75,
    },
    
    -- Blacksmithing Trainers
    ["Alliance_Blacksmithing_Master"] = {
        name = "Kradu Grimblade",
        zone = "Hellfire Peninsula",
        coords = {0.56, 0.66},
        faction = "Alliance",
        profession = "Blacksmithing",
        rank = "Master",
        maxSkill = 375,
    },
    ["Horde_Blacksmithing_Master"] = {
        name = "Rohok",
        zone = "Hellfire Peninsula",
        coords = {0.53, 0.38},
        faction = "Horde",
        profession = "Blacksmithing",
        rank = "Master",
        maxSkill = 375,
    },
    
    -- Engineering Trainers
    ["Alliance_Engineering_Master"] = {
        name = "Lebowski",
        zone = "Hellfire Peninsula",
        coords = {0.55, 0.65},
        faction = "Alliance",
        profession = "Engineering",
        rank = "Master",
        maxSkill = 375,
    },
    ["Horde_Engineering_Master"] = {
        name = "Zebig",
        zone = "Hellfire Peninsula",
        coords = {0.55, 0.38},
        faction = "Horde",
        profession = "Engineering",
        rank = "Master",
        maxSkill = 375,
    },
    
    -- Leatherworking Trainers
    ["Alliance_Leatherworking_Master"] = {
        name = "Brumman",
        zone = "Hellfire Peninsula",
        coords = {0.56, 0.66},
        faction = "Alliance",
        profession = "Leatherworking",
        rank = "Master",
        maxSkill = 375,
    },
    ["Horde_Leatherworking_Master"] = {
        name = "Barim Spilthoof",
        zone = "Hellfire Peninsula",
        coords = {0.56, 0.38},
        faction = "Horde",
        profession = "Leatherworking",
        rank = "Master",
        maxSkill = 375,
    },
    
    -- Tailoring Trainers
    ["Alliance_Tailoring_Master"] = {
        name = "Hama",
        zone = "Hellfire Peninsula",
        coords = {0.56, 0.62},
        faction = "Alliance",
        profession = "Tailoring",
        rank = "Master",
        maxSkill = 375,
    },
    ["Horde_Tailoring_Master"] = {
        name = "Dalinna",
        zone = "Hellfire Peninsula",
        coords = {0.56, 0.41},
        faction = "Horde",
        profession = "Tailoring",
        rank = "Master",
        maxSkill = 375,
    },
    
    -- Enchanting Trainers
    ["Alliance_Enchanting_Master"] = {
        name = "Felannia",
        zone = "Hellfire Peninsula",
        coords = {0.53, 0.66},
        faction = "Alliance",
        profession = "Enchanting",
        rank = "Master",
        maxSkill = 375,
    },
    ["Horde_Enchanting_Master"] = {
        name = "Felannia",
        zone = "Hellfire Peninsula",
        coords = {0.52, 0.36},
        faction = "Horde",
        profession = "Enchanting",
        rank = "Master",
        maxSkill = 375,
    },
    
    -- Alchemy Trainers
    ["Alliance_Alchemy_Master"] = {
        name = "Alchemist Gribble",
        zone = "Hellfire Peninsula",
        coords = {0.53, 0.65},
        faction = "Alliance",
        profession = "Alchemy",
        rank = "Master",
        maxSkill = 375,
    },
    ["Horde_Alchemy_Master"] = {
        name = "Apothecary Antonivich",
        zone = "Hellfire Peninsula",
        coords = {0.52, 0.36},
        faction = "Horde",
        profession = "Alchemy",
        rank = "Master",
        maxSkill = 375,
    },
    
    -- Cooking Trainers
    ["Neutral_Cooking_Master"] = {
        name = "Gaston",
        zone = "Shattrath City",
        coords = {0.62, 0.68},
        faction = "Both",
        profession = "Cooking",
        rank = "Master",
        maxSkill = 375,
    },
    
    -- Fishing Trainers
    ["Neutral_Fishing_Master"] = {
        name = "Juno Dufrain",
        zone = "Shattrath City",
        coords = {0.64, 0.70},
        faction = "Both",
        profession = "Fishing",
        rank = "Master",
        maxSkill = 375,
    },
    
    -- First Aid Trainers
    ["Neutral_FirstAid_Master"] = {
        name = "Aresella",
        zone = "Hellfire Peninsula",
        coords = {0.22, 0.39},
        faction = "Both",
        profession = "First Aid",
        rank = "Master",
        maxSkill = 375,
    },
}

-- Helper function to get trainer info
function BAG.Data.Trainers:GetTrainer(trainerKey)
    return self[trainerKey]
end

-- Helper function to find trainers by profession and faction
function BAG.Data.Trainers:FindTrainer(profession, faction, rank)
    for key, trainer in pairs(self) do
        if type(trainer) == "table" then
            if trainer.profession == profession then
                if faction == "Both" or trainer.faction == faction or trainer.faction == "Both" then
                    if not rank or trainer.rank == rank then
                        return trainer
                    end
                end
            end
        end
    end
    return nil
end

-- Helper function to get all trainers for a profession
function BAG.Data.Trainers:GetTrainersByProfession(profession, faction)
    local trainers = {}
    
    for key, trainer in pairs(self) do
        if type(trainer) == "table" and trainer.profession == profession then
            if faction == "Both" or trainer.faction == faction or trainer.faction == "Both" then
                table.insert(trainers, trainer)
            end
        end
    end
    
    return trainers
end
