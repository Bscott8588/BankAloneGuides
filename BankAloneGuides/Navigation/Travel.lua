--[[
    Bank Alone Guides - Travel System
    Handles travel-related step types and instructions
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Travel = {}

-- Travel step types and their handlers
BAG.Travel.Types = {
    goto = "Go to location",
    hs = "Use Hearthstone",
    fly = "Take flight path",
    fp = "Get flight path",
    boat = "Take boat",
    zeppelin = "Take zeppelin",
    run = "Run to location",
    mount = "Mount up",
}

-- Get travel instruction for a step
function BAG.Travel:GetInstruction(step)
    if not step or not step.type then
        return "No instruction"
    end
    
    local handler = self.InstructionHandlers[step.type]
    if handler then
        return handler(step)
    end
    
    return "Travel to destination"
end

-- Instruction handlers for each travel type
BAG.Travel.InstructionHandlers = {
    goto = function(step)
        local zone = step.zone or BAG.ZoneDetection:GetCurrentZone()
        local coords = ""
        
        if step.x and step.y then
            coords = BAG.MapAPI:FormatCoordinates(step.x, step.y)
        end
        
        if step.description then
            return string.format("Go to %s in %s", step.description, zone)
        elseif coords ~= "" then
            return string.format("Go to %s in %s", coords, zone)
        else
            return string.format("Go to %s", zone)
        end
    end,
    
    hs = function(step)
        local cd = BAG.Utils:GetHearthstoneCooldown()
        if cd > 0 then
            return string.format("Use Hearthstone (ready in %s)", BAG.Utils:FormatTime(cd))
        else
            return "Use Hearthstone to return to your inn"
        end
    end,
    
    fly = function(step)
        local destination = step.destination or step.zone or "destination"
        return string.format("Fly to %s", destination)
    end,
    
    fp = function(step)
        local location = step.location or step.zone or "this location"
        return string.format("Get the flight path at %s", location)
    end,
    
    boat = function(step)
        local from = step.from or "dock"
        local to = step.to or "destination"
        return string.format("Take the boat from %s to %s", from, to)
    end,
    
    zeppelin = function(step)
        local from = step.from or "tower"
        local to = step.to or "destination"
        return string.format("Take the zeppelin from %s to %s", from, to)
    end,
    
    run = function(step)
        local destination = step.destination or step.zone or "destination"
        return string.format("Run to %s", destination)
    end,
    
    mount = function(step)
        if BAG.PlayerAPI:IsMounted() then
            return "Already mounted"
        elseif BAG.PlayerAPI:HasFlyingMount() and BAG.PlayerAPI:CanFlyHere() then
            return "Mount up (flying mount available)"
        elseif BAG.PlayerAPI:HasMount() then
            return "Mount up"
        else
            return "Mount not available - continue on foot"
        end
    end,
}

-- Check if a travel step can be completed
function BAG.Travel:CanComplete(step)
    if not step or not step.type then
        return false
    end
    
    local checker = self.CompletionCheckers[step.type]
    if checker then
        return checker(step)
    end
    
    return false
end

-- Completion checkers for each travel type
BAG.Travel.CompletionCheckers = {
    goto = function(step)
        if not step.zone or not step.x or not step.y then
            return false
        end
        
        local currentZone = BAG.ZoneDetection:GetCurrentZone()
        if currentZone ~= step.zone then
            return false
        end
        
        local px, py = BAG.MapAPI:GetPlayerPosition()
        if not px or not py then
            return false
        end
        
        local distance = BAG.MapAPI:CalculateDistance(px, py, step.x, step.y)
        return distance and distance < 0.03 -- Within ~30 yards
    end,
    
    hs = function(step)
        -- Can't auto-detect hearthstone usage
        return false
    end,
    
    fly = function(step)
        -- Can't auto-detect flight path usage
        return false
    end,
    
    fp = function(step)
        -- Would need to check known flight paths
        -- For now, can't auto-detect
        return false
    end,
    
    boat = function(step)
        -- Check if player arrived at destination zone
        if step.to then
            return BAG.ZoneDetection:IsInZone(step.to)
        end
        return false
    end,
    
    zeppelin = function(step)
        -- Check if player arrived at destination zone
        if step.to then
            return BAG.ZoneDetection:IsInZone(step.to)
        end
        return false
    end,
    
    run = function(step)
        -- Check if player reached destination
        if step.destination then
            return BAG.ZoneDetection:IsInZone(step.destination)
        end
        return false
    end,
    
    mount = function(step)
        return BAG.PlayerAPI:IsMounted()
    end,
}

-- Get distance to travel destination
function BAG.Travel:GetDistanceToDestination(step)
    if not step or step.type ~= "goto" then
        return nil
    end
    
    if not step.x or not step.y or not step.zone then
        return nil
    end
    
    return BAG.MapAPI:GetDistanceToPoint(step.x, step.y, step.zone)
end

-- Get direction to travel destination
function BAG.Travel:GetDirectionToDestination(step)
    if not step or step.type ~= "goto" then
        return nil
    end
    
    if not step.x or not step.y or not step.zone then
        return nil
    end
    
    return BAG.MapAPI:GetCardinalDirection(step.x, step.y, step.zone)
end

-- Get travel time estimate (in minutes)
function BAG.Travel:GetEstimatedTravelTime(step)
    if not step then return nil end
    
    local stepType = step.type
    
    if stepType == "goto" or stepType == "run" then
        local distance = self:GetDistanceToDestination(step)
        if distance then
            -- Rough estimate: ~0.01 distance units per second on mount
            local seconds = distance * 100
            if BAG.PlayerAPI:IsMounted() then
                seconds = seconds * 0.5 -- Faster on mount
            end
            return math.ceil(seconds / 60)
        end
        return 2 -- Default estimate
    elseif stepType == "fly" then
        return 5 -- Flight paths vary, but ~5 min average
    elseif stepType == "hs" then
        return 1 -- Hearthstone is quick
    elseif stepType == "boat" or stepType == "zeppelin" then
        return 3 -- Boats/zeppelins take a few minutes
    elseif stepType == "mount" then
        return 0 -- Instant
    else
        return nil
    end
end

-- Check if player can use flying mount
function BAG.Travel:CanUseFlyingMount()
    return BAG.PlayerAPI:HasFlyingMount() and BAG.PlayerAPI:CanFlyHere()
end

-- Check if player should use mount
function BAG.Travel:ShouldMount()
    if BAG.PlayerAPI:IsMounted() then
        return false -- Already mounted
    end
    
    if InCombatLockdown() then
        return false -- Can't mount in combat
    end
    
    if BAG.PlayerAPI:IsIndoors() then
        return false -- Can't mount indoors
    end
    
    return BAG.PlayerAPI:HasMount()
end

-- Get boat/zeppelin schedule info
function BAG.Travel:GetTransportSchedule(transportType, from, to)
    -- TBC boats and zeppelins have specific schedules
    -- This is a simplified version
    
    local schedules = {
        boat = {
            ["Menethil Harbor-Theramore"] = {interval = 5, duration = 2},
            ["Menethil Harbor-Auberdine"] = {interval = 5, duration = 2},
            ["Ratchet-Booty Bay"] = {interval = 5, duration = 3},
        },
        zeppelin = {
            ["Orgrimmar-Undercity"] = {interval = 5, duration = 2},
            ["Orgrimmar-Grom'gol"] = {interval = 5, duration = 3},
            ["Undercity-Grom'gol"] = {interval = 5, duration = 3},
        },
    }
    
    local key = from .. "-" .. to
    local schedule = schedules[transportType] and schedules[transportType][key]
    
    if schedule then
        return schedule.interval, schedule.duration
    end
    
    return 5, 3 -- Default: departs every 5 min, takes 3 min
end

-- Get helpful travel tips
function BAG.Travel:GetTravelTip(step)
    if not step then return nil end
    
    if step.type == "hs" then
        local cd = BAG.Utils:GetHearthstoneCooldown()
        if cd > 0 then
            return "Hearthstone is on cooldown. Consider using a flight path instead."
        end
    elseif step.type == "fly" then
        if not BAG.ZoneDetection:HasFlightPath() then
            return "You may need to discover the flight path first."
        end
    elseif step.type == "goto" then
        if self:ShouldMount() then
            return "Consider mounting up to travel faster."
        end
        if self:CanUseFlyingMount() then
            return "You can use your flying mount in this area."
        end
    elseif step.type == "boat" or step.type == "zeppelin" then
        local interval, duration = self:GetTransportSchedule(step.type, step.from, step.to)
        return string.format("Departs every %d minutes, travel time ~%d minutes", interval, duration)
    end
    
    return nil
end

-- Create waypoint for travel step
function BAG.Travel:CreateWaypoint(step)
    if not step or step.type ~= "goto" then
        return false
    end
    
    if not step.x or not step.y then
        return false
    end
    
    -- Set map to the target zone
    if step.zone then
        -- In TBC, we'd need to find the continent and zone ID
        -- This is simplified
        SetMapToCurrentZone()
    end
    
    -- In TBC, there's no built-in waypoint system
    -- But we could add a manual marker if needed
    -- For now, just return true to indicate we have coordinates
    return true
end
