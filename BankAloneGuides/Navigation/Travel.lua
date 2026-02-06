--[[
    Bank Alone Guides - Travel System
    SCS / Bank Alone Guides
    
    Handles travel-related step types and provides travel instructions.
]]

local BAG = BankAlone

BAG.Travel = BAG.Travel or {}
local Travel = BAG.Travel

-- Step type descriptions for travel actions
Travel.TRAVEL_TYPES = {
    goto      = "Travel to",
    hearth    = "Use Hearthstone",
    fly       = "Take a flight to",
    flightpath= "Discover flight path at",
    boat      = "Take the boat to",
    zeppelin  = "Take the zeppelin to",
    run       = "Run to",
    mount     = "Mount up and ride to",
}

-- Get travel instruction text for a step
function Travel:GetInstruction(step)
    if not step then return "Unknown travel step" end

    local stepType = step.type
    local prefix = self.TRAVEL_TYPES[stepType] or "Go to"
    local dest = step.text or step.zone or "your destination"

    local instruction = prefix .. " " .. dest

    -- Add coordinates if available
    if step.x and step.y then
        instruction = instruction .. string.format(" (%.1f, %.1f)", step.x, step.y)
    end

    -- Add zone if specified and different from destination text
    if step.zone and step.zone ~= dest then
        instruction = instruction .. " in " .. step.zone
    end

    return instruction
end

-- Get hearthstone instruction
function Travel:GetHearthInstruction()
    local location = BAG.API.Spell:GetHearthstoneLocation()
    local ready = BAG.API.Spell:IsHearthstoneReady()

    if ready then
        return "Use your Hearthstone to return to " .. location
    else
        local cd = BAG.API.Spell:GetSpellCooldown("Hearthstone")
        local remaining = cd and cd.remaining or 0
        return string.format("Hearthstone to %s (cooldown: %s)", location, BAG.Utils:FormatTime(remaining))
    end
end

-- Get flight instruction
function Travel:GetFlightInstruction(step)
    local dest = step.text or step.zone or "your destination"
    return "Speak to the flight master and fly to " .. dest
end

-- Get boat/zeppelin instruction
function Travel:GetTransportInstruction(step)
    local transportType = step.type == "boat" and "boat" or "zeppelin"
    local dest = step.text or step.zone or "your destination"

    -- Known transport routes
    local routes = {
        -- Alliance boats
        { from = "Menethil Harbor", to = "Theramore Isle", type = "boat", faction = "Alliance" },
        { from = "Menethil Harbor", to = "Auberdine", type = "boat", faction = "Alliance" },
        { from = "Auberdine", to = "Darnassus", type = "boat", faction = "Alliance" },
        { from = "Stormwind Harbor", to = "Auberdine", type = "boat", faction = "Alliance" },
        -- Horde zeppelins
        { from = "Orgrimmar", to = "Undercity", type = "zeppelin", faction = "Horde" },
        { from = "Orgrimmar", to = "Grom'gol Base Camp", type = "zeppelin", faction = "Horde" },
        { from = "Undercity", to = "Grom'gol Base Camp", type = "zeppelin", faction = "Horde" },
    }

    return string.format("Take the %s to %s", transportType, dest)
end

-- Check if player is near a transport location
function Travel:IsNearTransport(step)
    if not step or not step.x or not step.y then return false end
    local pos = BAG.API.Map:GetPlayerPosition()
    if not pos then return false end
    return BAG.API.Map:IsNear(pos.x, pos.y, step.x / 100, step.y / 100, 0.03)
end

-- Get a direction arrow character based on relative position
function Travel:GetDirectionHint(targetX, targetY)
    local pos = BAG.API.Map:GetPlayerPosition()
    if not pos or pos.x == 0 then return "" end

    local dx = (targetX / 100) - pos.x
    local dy = (targetY / 100) - pos.y

    -- Simple cardinal direction hint
    local directions = {}
    if dy < -0.005 then directions[#directions + 1] = "North" end
    if dy > 0.005 then directions[#directions + 1] = "South" end
    if dx > 0.005 then directions[#directions + 1] = "East" end
    if dx < -0.005 then directions[#directions + 1] = "West" end

    if #directions == 0 then return "You are here" end
    return "Head " .. table.concat(directions, "-")
end
