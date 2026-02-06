--[[
    Bank Alone Guides - Navigator
    Main navigation controller for guide progression
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Navigator state
BAG.Navigator.currentDestination = nil
BAG.Navigator.autoNavigate = true

-- Initialize navigator
function BAG.Navigator:Initialize()
    self.autoNavigate = BAG.SavedVars:Get("navigation.autoWaypoint") or true
    BAG.Logo:Print("Navigator initialized")
end

-- Update navigator based on current step
function BAG.Navigator:Update()
    if not BAG.Engine or not BAG.Engine.currentGuide then
        return
    end
    
    local currentStep = BAG.Engine:GetCurrentStep()
    if not currentStep then
        return
    end
    
    -- Update destination
    self:SetDestination(currentStep)
    
    -- Auto-track quests if enabled
    if BAG.SavedVars:Get("navigation.autoTrack") then
        BAG.QuestTracking:AutoTrackGuideQuests()
    end
end

-- Set destination from step
function BAG.Navigator:SetDestination(step)
    if not step then
        self.currentDestination = nil
        return
    end
    
    self.currentDestination = {
        zone = step.zone,
        x = step.x,
        y = step.y,
        type = step.type,
        description = step.text
    }
    
    -- Set waypoint if auto-navigate is enabled
    if self.autoNavigate and step.x and step.y and step.zone then
        self:SetWaypoint(step.zone, step.x, step.y)
    end
end

-- Set waypoint (for integration with waypoint addons)
function BAG.Navigator:SetWaypoint(zone, x, y, description)
    if not zone or not x or not y then
        return false
    end
    
    -- TODO: Integrate with popular waypoint addons
    -- For now, just store it
    self.currentWaypoint = {
        zone = zone,
        x = x,
        y = y,
        description = description
    }
    
    return true
end

-- Clear waypoint
function BAG.Navigator:ClearWaypoint()
    self.currentWaypoint = nil
    -- TODO: Clear from waypoint addons
end

-- Get current destination
function BAG.Navigator:GetDestination()
    return self.currentDestination
end

-- Check if at destination
function BAG.Navigator:IsAtDestination()
    if not self.currentDestination then
        return false
    end
    
    local dest = self.currentDestination
    
    -- Check zone
    if dest.zone and not BAG.ZoneDetection:IsInZone(dest.zone) then
        return false
    end
    
    -- Check coordinates
    if dest.x and dest.y then
        return BAG.MapAPI:IsNearPosition(dest.x, dest.y, 0.02)
    end
    
    return false
end

-- Get distance to destination
function BAG.Navigator:GetDistanceToDestination()
    if not self.currentDestination or not self.currentDestination.x or not self.currentDestination.y then
        return nil
    end
    
    local px, py = BAG.MapAPI:GetPlayerPosition()
    if not px or not py then
        return nil
    end
    
    -- Check if in same zone
    if self.currentDestination.zone and not BAG.ZoneDetection:IsInZone(self.currentDestination.zone) then
        return nil  -- Different zone, can't calculate distance
    end
    
    return BAG.MapAPI:GetDistanceYards(px, py, self.currentDestination.x, self.currentDestination.y)
end

-- Get direction to destination
function BAG.Navigator:GetDirectionToDestination()
    if not self.currentDestination or not self.currentDestination.x or not self.currentDestination.y then
        return nil
    end
    
    -- Check if in same zone
    if self.currentDestination.zone and not BAG.ZoneDetection:IsInZone(self.currentDestination.zone) then
        return nil
    end
    
    return BAG.MapAPI:GetCardinalDirection(self.currentDestination.x, self.currentDestination.y)
end

-- Get navigation instructions
function BAG.Navigator:GetInstructions()
    if not self.currentDestination then
        return "No active destination"
    end
    
    local dest = self.currentDestination
    local currentZone = BAG.ZoneDetection:GetZone()
    
    -- Build instruction text
    local instructions = ""
    
    -- Zone check
    if dest.zone and dest.zone ~= currentZone then
        instructions = "Travel to " .. dest.zone
        
        -- Suggest travel method
        local method = BAG.Travel:SuggestTravelMethod(currentZone, dest.zone)
        if method then
            instructions = instructions .. " (suggested: " .. method .. ")"
        end
    elseif dest.x and dest.y then
        -- In same zone, navigate to coordinates
        local direction = self:GetDirectionToDestination()
        local distance = self:GetDistanceToDestination()
        
        instructions = "Go"
        
        if direction then
            instructions = instructions .. " " .. direction
        end
        
        if dest.zone then
            instructions = instructions .. " in " .. dest.zone
        end
        
        if dest.x and dest.y then
            instructions = instructions .. " (" .. BAG.MapAPI:FormatCoords(dest.x, dest.y) .. ")"
        end
        
        if distance then
            instructions = instructions .. string.format(" - %.0f yards", distance)
        end
    else
        instructions = dest.description or "Complete current objective"
    end
    
    return instructions
end

-- Find path to zone
function BAG.Navigator:FindPathToZone(targetZone)
    local currentZone = BAG.ZoneDetection:GetZone()
    
    if currentZone == targetZone then
        return {{zone = currentZone}}
    end
    
    -- This would require a zone connection graph
    -- For now, return direct route
    return {
        {zone = currentZone},
        {zone = targetZone}
    }
end

-- Get travel estimate
function BAG.Navigator:GetTravelEstimate(targetZone)
    if not targetZone then
        return nil
    end
    
    local currentZone = BAG.ZoneDetection:GetZone()
    
    if currentZone == targetZone then
        if self.currentDestination and self.currentDestination.x and self.currentDestination.y then
            local distance = self:GetDistanceToDestination()
            if distance then
                -- Estimate based on running speed
                return math.ceil(distance / 10)  -- ~10 yards/sec average
            end
        end
        return 0
    end
    
    -- Estimate inter-zone travel
    local method = BAG.Travel:SuggestTravelMethod(currentZone, targetZone)
    
    if method == "fly" then
        return 120  -- 2 minutes
    elseif method == "hearthstone" then
        return 10
    elseif method == "boat" or method == "zeppelin" then
        return 180  -- 3 minutes
    end
    
    return nil
end

-- Smart route to step
function BAG.Navigator:RouteToStep(step)
    if not step then
        return nil
    end
    
    local route = {
        steps = {},
        totalTime = 0
    }
    
    -- Add travel steps if needed
    local currentZone = BAG.ZoneDetection:GetZone()
    
    if step.zone and step.zone ~= currentZone then
        -- Need to travel to different zone
        local travelMethod = BAG.Travel:SuggestTravelMethod(currentZone, step.zone)
        
        table.insert(route.steps, {
            type = travelMethod,
            from = currentZone,
            to = step.zone,
            description = "Travel to " .. step.zone
        })
        
        local travelTime = BAG.Travel:EstimateTravelTime({type = travelMethod})
        if travelTime then
            route.totalTime = route.totalTime + travelTime
        end
    end
    
    -- Add destination step
    if step.x and step.y then
        table.insert(route.steps, {
            type = "goto",
            zone = step.zone,
            x = step.x,
            y = step.y,
            description = "Go to " .. BAG.MapAPI:FormatCoords(step.x, step.y)
        })
        
        local gotoTime = BAG.Travel:EstimateTravelTime({
            type = "goto",
            zone = step.zone,
            x = step.x,
            y = step.y
        })
        if gotoTime then
            route.totalTime = route.totalTime + gotoTime
        end
    end
    
    return route
end

-- Get navigation summary
function BAG.Navigator:GetSummary()
    local dest = self.currentDestination
    
    if not dest then
        return {
            hasDestination = false,
            message = "No active destination"
        }
    end
    
    local summary = {
        hasDestination = true,
        zone = dest.zone,
        coordinates = dest.x and dest.y and BAG.MapAPI:FormatCoords(dest.x, dest.y) or nil,
        description = dest.description,
        isAtDestination = self:IsAtDestination(),
        instructions = self:GetInstructions()
    }
    
    -- Add distance info if in same zone
    local distance = self:GetDistanceToDestination()
    if distance then
        summary.distance = distance
        summary.direction = self:GetDirectionToDestination()
        summary.estimatedTime = math.ceil(distance / 10)
    end
    
    return summary
end

-- Toggle auto-navigation
function BAG.Navigator:ToggleAutoNavigate()
    self.autoNavigate = not self.autoNavigate
    BAG.SavedVars:Set("navigation.autoWaypoint", self.autoNavigate)
    
    if self.autoNavigate then
        BAG.Logo:Print("Auto-navigation enabled")
        self:Update()
    else
        BAG.Logo:Print("Auto-navigation disabled")
        self:ClearWaypoint()
    end
end

-- Manual waypoint setting
function BAG.Navigator:SetManualWaypoint(zone, x, y)
    if not zone or not x or not y then
        BAG.Logo:PrintError("Invalid waypoint coordinates")
        return false
    end
    
    self.currentDestination = {
        zone = zone,
        x = x,
        y = y,
        manual = true
    }
    
    return self:SetWaypoint(zone, x, y, "Manual waypoint")
end

-- Clear manual waypoint
function BAG.Navigator:ClearManualWaypoint()
    if self.currentDestination and self.currentDestination.manual then
        self.currentDestination = nil
        self:ClearWaypoint()
        BAG.Logo:Print("Manual waypoint cleared")
        return true
    end
    
    return false
end

-- Get suggested next location
function BAG.Navigator:GetSuggestedLocation()
    -- Based on current guide step
    local currentStep = BAG.Engine:GetCurrentStep()
    
    if currentStep and currentStep.zone then
        return {
            zone = currentStep.zone,
            x = currentStep.x,
            y = currentStep.y,
            reason = "Current guide step"
        }
    end
    
    -- Check for quests ready to turn in
    local readyQuests = BAG.QuestTracking:GetQuestsReadyToTurnIn()
    if #readyQuests > 0 then
        -- TODO: Get quest turn-in location
        return {
            reason = "Quest ready to turn in: " .. readyQuests[1].title
        }
    end
    
    return nil
end

print("|cff00B3FF[Bank Alone Guides]|r Navigator loaded")
