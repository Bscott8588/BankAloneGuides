--[[
    Bank Alone Guides - Navigator
    Smart guide selection and navigation logic
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Navigator = {
    currentPath = nil,
}

-- Determine the best starting guide for a character
function BAG.Navigator:DetermineStartingGuide(level, faction, race, zone)
    level = level or BAG.PlayerAPI:GetLevel()
    faction = faction or BAG.PlayerAPI:GetFaction()
    race = race or BAG.PlayerAPI:GetRace()
    zone = zone or BAG.ZoneDetection:GetCurrentZone()
    
    BAG:DebugPrint("Determining guide for:", faction, race, "Level", level, "Zone:", zone)
    
    -- Check if in Outland
    if BAG.ZoneDetection:IsInOutland() or level >= 58 then
        return self:FindOutlandGuide(level, faction)
    end
    
    -- Level 1-10: Race-specific starting zones
    if level <= 10 then
        return self:FindStartingZoneGuide(race, faction)
    end
    
    -- Level 10-60: Progressive leveling guides
    return self:FindLevelingGuide(level, faction, zone)
end

-- Find starting zone guide (1-10)
function BAG.Navigator:FindStartingZoneGuide(race, faction)
    local guideTable = BAG.Guides.Leveling[faction]
    if not guideTable then
        return nil
    end
    
    -- Race-specific guides
    local raceGuides = {
        Human = "Human_1_10",
        Dwarf = "Dwarf_1_10",
        Gnome = "Gnome_1_10",
        NightElf = "NightElf_1_10",
        Draenei = "Draenei_1_10",
        Orc = "Orc_1_10",
        Troll = "Troll_1_10",
        Tauren = "Tauren_1_10",
        Undead = "Undead_1_10",
        BloodElf = "BloodElf_1_10",
    }
    
    local guideName = raceGuides[race]
    if guideName and guideTable[guideName] then
        return guideName
    end
    
    -- Fallback to generic 10-20 if starting guide not found
    return faction .. "_10_20"
end

-- Find appropriate leveling guide (10-60)
function BAG.Navigator:FindLevelingGuide(level, faction, zone)
    local guideTable = BAG.Guides.Leveling[faction]
    if not guideTable then
        return nil
    end
    
    -- Determine level bracket
    local bracket
    if level >= 10 and level < 20 then
        bracket = "10_20"
    elseif level >= 20 and level < 30 then
        bracket = "20_30"
    elseif level >= 30 and level < 40 then
        bracket = "30_40"
    elseif level >= 40 and level < 50 then
        bracket = "40_50"
    elseif level >= 50 and level < 58 then
        bracket = "50_58"
    else
        bracket = "58_70" -- Transition to Outland
    end
    
    local guideName = faction .. "_" .. bracket
    
    if guideTable[guideName] then
        return guideName
    end
    
    return nil
end

-- Find Outland guide (58-70)
function BAG.Navigator:FindOutlandGuide(level, faction)
    local guideTable = BAG.Guides.Leveling[faction]
    if not guideTable then
        return nil
    end
    
    local guideName = faction .. "_58_70"
    
    if guideTable[guideName] then
        return guideName
    end
    
    return nil
end

-- Find next logical guide after completing current one
function BAG.Navigator:FindNextGuide(currentGuideName)
    if not currentGuideName then
        return nil
    end
    
    -- Parse current guide name
    local faction, minLevel, maxLevel = currentGuideName:match("(%a+)_(%d+)_(%d+)")
    
    if not faction or not maxLevel then
        return nil
    end
    
    maxLevel = tonumber(maxLevel)
    local playerLevel = BAG.PlayerAPI:GetLevel()
    
    -- Determine next bracket
    local nextBracket
    if maxLevel == 10 then
        nextBracket = "10_20"
    elseif maxLevel == 20 then
        nextBracket = "20_30"
    elseif maxLevel == 30 then
        nextBracket = "30_40"
    elseif maxLevel == 40 then
        nextBracket = "40_50"
    elseif maxLevel == 50 then
        nextBracket = "50_58"
    elseif maxLevel == 58 then
        nextBracket = "58_70"
    else
        return nil -- No more guides
    end
    
    local nextGuideName = faction .. "_" .. nextBracket
    
    -- Check if guide exists
    local guideTable = BAG.Guides.Leveling[faction]
    if guideTable and guideTable[nextGuideName] then
        return nextGuideName
    end
    
    return nil
end

-- Calculate optimal path through zones
function BAG.Navigator:CalculateOptimalPath(startZone, endZone)
    -- This is a simplified pathfinding
    -- A full implementation would use a proper graph algorithm
    
    if startZone == endZone then
        return {startZone}
    end
    
    -- For now, just return direct path
    return {startZone, endZone}
end

-- Get recommended travel route between zones
function BAG.Navigator:GetTravelRoute(fromZone, toZone)
    -- This would contain knowledge of connections between zones
    -- For now, return generic instructions
    
    local fromContinent = BAG.Data.Zones[fromZone] and BAG.Data.Zones[fromZone].continent
    local toContinent = BAG.Data.Zones[toZone] and BAG.Data.Zones[toZone].continent
    
    if not fromContinent or not toContinent then
        return {"Travel to " .. toZone}
    end
    
    if fromContinent == toContinent then
        return {"Travel to " .. toZone .. " in " .. toContinent}
    else
        -- Cross-continent travel
        return {
            "Travel to a capital city",
            "Use portal/boat/zeppelin to reach " .. toContinent,
            "Travel to " .. toZone,
        }
    end
end

-- Check if player should switch guides
function BAG.Navigator:ShouldSwitchGuides()
    if not BAG.Engine.currentGuide then
        return false
    end
    
    local guide = BAG.Engine.currentGuide
    local playerLevel = BAG.PlayerAPI:GetLevel()
    
    if not guide.levelRange then
        return false
    end
    
    local minLevel = guide.levelRange.min
    local maxLevel = guide.levelRange.max
    
    -- Switch if player is more than 3 levels above the guide's max
    if playerLevel > maxLevel + 3 then
        return true
    end
    
    -- Switch if player is in wrong zone for too long
    local currentZone = BAG.ZoneDetection:GetCurrentZone()
    if guide.zone and currentZone ~= guide.zone then
        local zoneLevelMin, zoneLevelMax = BAG.ZoneDetection:GetZoneLevelRange()
        if zoneLevelMin and playerLevel < zoneLevelMin - 2 then
            -- Player is in a zone too high level
            return true
        end
    end
    
    return false
end

-- Get guide recommendations
function BAG.Navigator:GetGuideRecommendations()
    local level = BAG.PlayerAPI:GetLevel()
    local faction = BAG.PlayerAPI:GetFaction()
    local zone = BAG.ZoneDetection:GetCurrentZone()
    
    local recommendations = {}
    
    -- Primary recommendation
    local primary = self:DetermineStartingGuide(level, faction, nil, zone)
    if primary then
        table.insert(recommendations, {
            guideName = primary,
            reason = "Best match for your level and location",
            priority = "high",
        })
    end
    
    -- Alternative recommendations based on zone
    local zoneGuides = self:FindGuidesForZone(zone, faction)
    for _, guideName in ipairs(zoneGuides) do
        if guideName ~= primary then
            table.insert(recommendations, {
                guideName = guideName,
                reason = "Available in your current zone",
                priority = "medium",
            })
        end
    end
    
    return recommendations
end

-- Find guides that cover a specific zone
function BAG.Navigator:FindGuidesForZone(zoneName, faction)
    local guides = {}
    local guideTable = BAG.Guides.Leveling[faction]
    
    if not guideTable then
        return guides
    end
    
    for guideName, guide in pairs(guideTable) do
        if guide.zones then
            for _, zone in ipairs(guide.zones) do
                if zone == zoneName then
                    table.insert(guides, guideName)
                    break
                end
            end
        end
    end
    
    return guides
end

-- Get progress through current guide
function BAG.Navigator:GetGuideProgress()
    if not BAG.Engine.currentGuide or not BAG.Engine.steps then
        return 0
    end
    
    local currentStep = BAG.Engine.currentStepIndex or 1
    local totalSteps = #BAG.Engine.steps
    
    if totalSteps == 0 then
        return 0
    end
    
    return (currentStep / totalSteps) * 100
end

-- Estimate time to complete guide
function BAG.Navigator:EstimateGuideCompletion()
    if not BAG.Engine.currentGuide then
        return nil
    end
    
    local guide = BAG.Engine.currentGuide
    local remainingSteps = #BAG.Engine.steps - (BAG.Engine.currentStepIndex or 1)
    
    -- Rough estimate: 2 minutes per step on average
    local estimatedMinutes = remainingSteps * 2
    
    return estimatedMinutes
end

-- Check if player is following the optimal path
function BAG.Navigator:IsOnOptimalPath()
    if not BAG.Engine.currentStep then
        return true
    end
    
    local step = BAG.Engine.currentStep
    
    -- Check if player is in the right zone
    if step.zone then
        local currentZone = BAG.ZoneDetection:GetCurrentZone()
        if currentZone ~= step.zone then
            return false
        end
    end
    
    -- Check if player's level is appropriate
    local playerLevel = BAG.PlayerAPI:GetLevel()
    if step.minLevel and playerLevel < step.minLevel then
        return false
    end
    
    return true
end

-- Get suggestions for getting back on track
function BAG.Navigator:GetBackOnTrackSuggestions()
    if self:IsOnOptimalPath() then
        return nil
    end
    
    local suggestions = {}
    local currentStep = BAG.Engine.currentStep
    
    if currentStep and currentStep.zone then
        local currentZone = BAG.ZoneDetection:GetCurrentZone()
        if currentZone ~= currentStep.zone then
            local route = self:GetTravelRoute(currentZone, currentStep.zone)
            for _, instruction in ipairs(route) do
                table.insert(suggestions, instruction)
            end
        end
    end
    
    return suggestions
end
