-------------------------------------------------------------------------------
-- Bank Alone Guides — Navigation / Travel
-- Travel-related step handling (goto, fly, hearth, boat, etc.)
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Travel = BAG.Travel or {}

-- ── Travel step types and their display info ──────────────────────────────
BAG.Travel.StepTypes = {
    ["goto"]  = { label = "Go to",          icon = "travel",   verb = "Travel to" },
    fly       = { label = "Fly to",         icon = "fly",      verb = "Take a flight to" },
    fp        = { label = "Get Flight Path", icon = "fp",      verb = "Discover the flight path at" },
    hs        = { label = "Hearthstone",    icon = "hearth",   verb = "Use your Hearthstone to return to" },
    hearth    = { label = "Hearthstone",    icon = "hearth",   verb = "Use your Hearthstone" },
    boat      = { label = "Take Boat",      icon = "boat",     verb = "Take the boat from" },
    zeppelin  = { label = "Take Zeppelin",  icon = "zeppelin", verb = "Take the zeppelin from" },
    run       = { label = "Run to",         icon = "run",      verb = "Run to" },
    mount     = { label = "Mount Up",       icon = "mount",    verb = "Mount up and ride to" },
}

--- Generate a human-readable instruction for a travel step.
-- @param step  A step table.
-- @return string  The instruction text.
function BAG.Travel:GetInstruction(step)
    if not step then return "Travel to the next destination." end

    local stepType = step.type or "goto"
    local info = self.StepTypes[stepType]
    if not info then
        return step.text or "Continue to the next step."
    end

    local text = info.verb or "Go to"

    if stepType == "goto" or stepType == "run" or stepType == "mount" then
        if step.zone and step.x and step.y then
            text = text .. " " .. step.zone ..
                   " (" .. string.format("%.1f", step.x) .. ", " ..
                   string.format("%.1f", step.y) .. ")"
        elseif step.zone then
            text = text .. " " .. step.zone
        end
        if step.text then
            text = text .. " — " .. step.text
        end

    elseif stepType == "fly" then
        local dest = step.destination or step.zone or "your destination"
        text = text .. " " .. dest
        if step.text then text = text .. " — " .. step.text end

    elseif stepType == "fp" then
        local loc = step.zone or "this location"
        text = text .. " " .. loc
        if step.npcName then text = text .. " (speak to " .. step.npcName .. ")" end

    elseif stepType == "hs" or stepType == "hearth" then
        local loc = BAG.SpellAPI:GetHearthLocation()
        text = text .. " " .. loc
        if BAG.SpellAPI:IsHearthOnCooldown() then
            text = text .. " |cffff4444(on cooldown)|r"
        end

    elseif stepType == "boat" then
        local from = step.from or "the dock"
        local to   = step.to or "your destination"
        text = text .. " " .. from .. " to " .. to

    elseif stepType == "zeppelin" then
        local from = step.from or "the tower"
        local to   = step.to or "your destination"
        text = text .. " " .. from .. " to " .. to
    end

    return text
end

--- Check if a travel step is "complete" (player is near destination).
-- @param step  A step table with zone/x/y.
-- @return boolean
function BAG.Travel:IsAtDestination(step)
    if not step then return false end

    -- Zone check
    if step.zone then
        local currentZone = BAG.ZoneDetect:GetCurrentZone()
        if not BAG.Utils:StrEq(currentZone, step.zone) then
            return false
        end
    end

    -- Coordinate proximity check
    if step.x and step.y then
        return BAG.MapAPI:IsNearPoint(step.x / 100, step.y / 100, 5)
    end

    -- If only zone is specified, being in the zone is enough
    return true
end
