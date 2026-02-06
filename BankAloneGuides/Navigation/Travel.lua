--[[
    Bank Alone Guides - Travel System
    Handles travel-related steps and routing
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Travel step handlers
BAG.Travel.stepHandlers = {}

-- Register a travel step handler
function BAG.Travel:RegisterHandler(stepType, handler)
    self.stepHandlers[stepType] = handler
end

-- Execute travel step
function BAG.Travel:ExecuteStep(step)
    if not step or not step.type then
        return false
    end
    
    local handler = self.stepHandlers[step.type]
    if handler then
        return handler(step)
    end
    
    return false
end

-- Get instructions for travel step
function BAG.Travel:GetInstructions(step)
    if not step or not step.type then
        return "Unknown travel step"
    end
    
    local stepType = step.type
    
    if stepType == "goto" then
        return self:GetGotoInstructions(step)
    elseif stepType == "fly" then
        return self:GetFlyInstructions(step)
    elseif stepType == "fp" then
        return self:GetFlightPathInstructions(step)
    elseif stepType == "hs" then
        return self:GetHearthstoneInstructions(step)
    elseif stepType == "boat" then
        return self:GetBoatInstructions(step)
    elseif stepType == "zeppelin" then
        return self:GetZeppelinInstructions(step)
    elseif stepType == "run" then
        return self:GetRunInstructions(step)
    elseif stepType == "mount" then
        return self:GetMountInstructions(step)
    end
    
    return "Travel to destination"
end

-- Goto instructions
function BAG.Travel:GetGotoInstructions(step)
    if not step.zone then
        return "Travel to destination"
    end
    
    local instructions = "Go to " .. step.zone
    
    if step.x and step.y then
        instructions = instructions .. " (" .. BAG.MapAPI:FormatCoords(step.x, step.y) .. ")"
    end
    
    -- Add direction if in same zone
    if BAG.ZoneDetection:IsInZone(step.zone) and step.x and step.y then
        local direction = BAG.MapAPI:GetCardinalDirection(step.x, step.y)
        if direction then
            instructions = instructions .. " - " .. direction
        end
        
        local distance = BAG.MapAPI:GetDistanceYards(
            BAG.MapAPI:GetPlayerPosition(),
            step.x, step.y
        )
        if distance then
            instructions = instructions .. string.format(" (%.0f yards)", distance)
        end
    end
    
    return instructions
end

-- Fly instructions
function BAG.Travel:GetFlyInstructions(step)
    local destination = step.destination or step.zone or "destination"
    return "Fly to " .. destination
end

-- Flight path instructions
function BAG.Travel:GetFlightPathInstructions(step)
    local location = step.location or step.zone or "this flight path"
    return "Get flight path at " .. location
end

-- Hearthstone instructions
function BAG.Travel:GetHearthstoneInstructions(step)
    local hearthLocation = GetBindLocation()
    return "Use Hearthstone" .. (hearthLocation and (" (to " .. hearthLocation .. ")") or "")
end

-- Boat instructions
function BAG.Travel:GetBoatInstructions(step)
    local from = step.from or "here"
    local to = step.to or "destination"
    return "Take boat from " .. from .. " to " .. to
end

-- Zeppelin instructions
function BAG.Travel:GetZeppelinInstructions(step)
    local from = step.from or "here"
    local to = step.to or "destination"
    return "Take zeppelin from " .. from .. " to " .. to
end

-- Run instructions
function BAG.Travel:GetRunInstructions(step)
    local destination = step.destination or step.zone or "destination"
    return "Run to " .. destination
end

-- Mount instructions
function BAG.Travel:GetMountInstructions(step)
    return "Mount up and ride"
end

-- Check if can complete travel step
function BAG.Travel:CanCompleteTravelStep(step)
    if not step then
        return false
    end
    
    local stepType = step.type
    
    if stepType == "goto" then
        return self:CanCompleteGoto(step)
    elseif stepType == "hs" then
        return self:CanUseHearthstone()
    elseif stepType == "mount" then
        return self:CanMount()
    end
    
    return false
end

-- Check if can complete goto
function BAG.Travel:CanCompleteGoto(step)
    if not step.zone or not step.x or not step.y then
        return false
    end
    
    -- Check if in correct zone
    if not BAG.ZoneDetection:IsInZone(step.zone) then
        return false
    end
    
    -- Check if near coordinates
    return BAG.MapAPI:IsNearPosition(step.x, step.y, 0.02)
end

-- Check if can use hearthstone
function BAG.Travel:CanUseHearthstone()
    local itemID = 6948  -- Hearthstone item ID
    
    if not BAG.InventoryAPI:HasItem(itemID) then
        return false
    end
    
    return not BAG.InventoryAPI:IsItemOnCooldown(itemID)
end

-- Check if can mount
function BAG.Travel:CanMount()
    -- Check if player has mount
    if not BAG.PlayerAPI:HasMount() then
        return false
    end
    
    -- Check if not in instance
    if BAG.ZoneDetection:IsInInstance() then
        return false
    end
    
    -- Check if not in combat
    if UnitAffectingCombat("player") then
        return false
    end
    
    -- Check if not indoors
    if IsIndoors() then
        return false
    end
    
    return true
end

-- Get hearthstone cooldown
function BAG.Travel:GetHearthstoneCooldown()
    local itemID = 6948
    local start, duration = BAG.InventoryAPI:GetItemCooldown(itemID)
    
    if duration and duration > 0 then
        local remaining = (start + duration) - GetTime()
        return math.max(0, remaining)
    end
    
    return 0
end

-- Use hearthstone
function BAG.Travel:UseHearthstone()
    if not self:CanUseHearthstone() then
        BAG.Logo:PrintError("Cannot use Hearthstone right now")
        return false
    end
    
    local itemID = 6948
    return BAG.InventoryAPI:UseItem(itemID)
end

-- Calculate travel time estimate
function BAG.Travel:EstimateTravelTime(step)
    if not step then
        return nil
    end
    
    local stepType = step.type
    
    if stepType == "goto" and step.x and step.y and step.zone then
        if BAG.ZoneDetection:IsInZone(step.zone) then
            local distance = BAG.MapAPI:GetDistanceYards(
                BAG.MapAPI:GetPlayerPosition(),
                step.x, step.y
            )
            
            if distance then
                -- Assume average running speed (including mount)
                local speedYardsPerSecond = 10  -- Approximate
                return math.ceil(distance / speedYardsPerSecond)
            end
        end
    elseif stepType == "fly" then
        return 120  -- Estimate 2 minutes for flight
    elseif stepType == "hs" then
        return 10  -- Hearthstone cast time + loading
    elseif stepType == "boat" or stepType == "zeppelin" then
        return 180  -- Estimate 3 minutes for boat/zep
    end
    
    return nil
end

-- Get suggested travel method
function BAG.Travel:SuggestTravelMethod(fromZone, toZone)
    -- This would require a travel route database
    -- For now, return basic suggestion
    
    if not fromZone or not toZone then
        return nil
    end
    
    -- If same zone, just run/mount
    if fromZone == toZone then
        if self:CanMount() then
            return "mount"
        else
            return "run"
        end
    end
    
    -- Check if hearthstone is to destination
    local hearthLocation = GetBindLocation()
    if hearthLocation and string.find(toZone, hearthLocation) then
        if self:CanUseHearthstone() then
            return "hearthstone"
        end
    end
    
    -- Default: suggest flight path
    return "fly"
end

-- Get travel route
function BAG.Travel:GetRoute(fromZone, toZone)
    -- This would require a travel route database
    -- For now, return simple route
    
    if not fromZone or not toZone then
        return nil
    end
    
    return {
        from = fromZone,
        to = toZone,
        method = self:SuggestTravelMethod(fromZone, toZone),
        steps = {
            {type = "fly", destination = toZone}
        }
    }
end

-- Check if flight path is known
function BAG.Travel:IsFlightPathKnown(flightMasterName)
    -- In TBC, we don't have a direct API to check this
    -- Would need to track manually or check taxi nodes
    -- For now, return nil (unknown)
    return nil
end

-- Get nearby flight masters
function BAG.Travel:GetNearbyFlightMasters()
    -- This would require NPC location data
    -- For now, return empty table
    -- TODO: Implement with NPC database
    return {}
end

print("|cff00B3FF[Bank Alone Guides]|r Travel system loaded")
