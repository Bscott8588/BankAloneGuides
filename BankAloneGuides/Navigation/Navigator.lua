--[[
    Bank Alone Guides - Navigator
    SCS / Bank Alone Guides
    
    Handles navigation logic, smart start, and step advancement.
]]

local BAG = BankAlone

BAG.Navigator = BAG.Navigator or {}
local Nav = BAG.Navigator

function Nav:Initialize()
    BAG:Debug("Navigator initialized")
end

-- Find the best step index within the current guide based on player level and zone
function Nav:FindBestStep(level, zone)
    local guide = BAG.Engine:GetCurrentGuide()
    if not guide or not guide.steps then return 1 end

    local bestStep = 1
    local bestScore = -1

    for i, step in ipairs(guide.steps) do
        local score = self:ScoreStep(step, level, zone)
        if score > bestScore then
            bestScore = score
            bestStep = i
        end
    end

    -- If the best score is very low, just start from the beginning
    if bestScore < 1 then
        return 1
    end

    return bestStep
end

-- Score a step based on how well it matches the player's current state
function Nav:ScoreStep(step, level, zone)
    local score = 0

    if not step then return 0 end

    -- Check if quest is already complete or turned in
    if step.questID then
        if BAG.API.Quest:IsQuestFlaggedComplete(step.questID) then
            return -1 -- Already done, skip
        end
        if step.type == "accept" and BAG.API.Quest:IsActive(step.questID) then
            return -1 -- Already accepted
        end
        if step.type == "turnin" and BAG.API.Quest:IsComplete(step.questID) then
            score = score + 10 -- Ready to turn in, good starting point
        end
        if step.type == "accept" and not BAG.API.Quest:IsActive(step.questID) then
            score = score + 5 -- Need to accept this
        end
    end

    -- Zone match
    if step.zone and step.zone == zone then
        score = score + 3
    end

    -- Level appropriateness
    if step.requiredLevel and level >= step.requiredLevel then
        score = score + 1
    end

    return score
end

-- Find the next uncompleted step from a given index
function Nav:FindNextIncomplete(fromIndex)
    local guide = BAG.Engine:GetCurrentGuide()
    if not guide or not guide.steps then return fromIndex end

    for i = fromIndex, #guide.steps do
        local step = guide.steps[i]
        if not BAG.SavedVars:IsStepComplete(BAG.Engine:GetCurrentGuideName(), i) then
            -- Check if the step's conditions allow showing it
            if BAG.Conditions:Check(step) then
                return i
            end
        end
    end

    return #guide.steps
end

-- Get the step type icon string
function Nav:GetStepIcon(stepType)
    local icons = {
        accept    = "|TInterface\\GossipFrame\\AvailableQuestIcon:16:16|t",
        turnin    = "|TInterface\\GossipFrame\\ActiveQuestIcon:16:16|t",
        complete  = "|TInterface\\GossipFrame\\ActiveQuestIcon:16:16|t",
        kill      = "|TInterface\\Icons\\Ability_DualWield:16:16|t",
        collect   = "|TInterface\\Icons\\INV_Misc_Bag_08:16:16|t",
        goto      = "|TInterface\\Icons\\INV_Misc_Map_01:16:16|t",
        travel    = "|TInterface\\Icons\\INV_Misc_Map_01:16:16|t",
        train     = "|TInterface\\GossipFrame\\TrainerGossipIcon:16:16|t",
        vendor    = "|TInterface\\GossipFrame\\VendorGossipIcon:16:16|t",
        buy       = "|TInterface\\GossipFrame\\VendorGossipIcon:16:16|t",
        use       = "|TInterface\\Icons\\INV_Misc_EngGizmos_20:16:16|t",
        equip     = "|TInterface\\PaperDollInfoFrame\\UI-EquipmentManager-Toggle:16:16|t",
        hearth    = "|TInterface\\Icons\\INV_Misc_Rune_01:16:16|t",
        fly       = "|TInterface\\GossipFrame\\TaxiGossipIcon:16:16|t",
        flightpath= "|TInterface\\GossipFrame\\TaxiGossipIcon:16:16|t",
        boat      = "|TInterface\\Icons\\INV_Misc_Map_01:16:16|t",
        zeppelin  = "|TInterface\\Icons\\INV_Misc_Map_01:16:16|t",
        note      = "|TInterface\\Icons\\INV_Misc_Note_01:16:16|t",
        level     = "|TInterface\\Icons\\Spell_Holy_DivineSpirit:16:16|t",
    }
    return icons[stepType] or "|TInterface\\Icons\\INV_Misc_QuestionMark:16:16|t"
end

-- Get a formatted step description for display
function Nav:FormatStep(step)
    if not step then return "No step data" end

    local icon = self:GetStepIcon(step.type)
    local text = icon .. " "

    if step.type == "accept" then
        text = text .. "Accept: " .. (step.text or BAG.API.Quest:GetQuestTitle(step.questID))
    elseif step.type == "turnin" then
        text = text .. "Turn in: " .. (step.text or BAG.API.Quest:GetQuestTitle(step.questID))
    elseif step.type == "complete" then
        text = text .. "Complete: " .. (step.text or BAG.API.Quest:GetQuestTitle(step.questID))
    elseif step.type == "kill" then
        text = text .. "Kill: " .. (step.text or step.target or "enemies")
    elseif step.type == "collect" then
        text = text .. "Collect: " .. (step.text or "items")
    elseif step.type == "goto" then
        text = text .. "Go to: " .. (step.text or step.zone or "destination")
    elseif step.type == "train" then
        text = text .. "Train: " .. (step.text or "skills")
    elseif step.type == "hearth" then
        text = text .. "Use Hearthstone"
    elseif step.type == "fly" then
        text = text .. "Fly to: " .. (step.text or step.zone or "destination")
    elseif step.type == "flightpath" then
        text = text .. "Get flight path"
    elseif step.type == "note" then
        text = text .. (step.text or "Note")
    else
        text = text .. (step.text or step.type or "Unknown step")
    end

    return text
end

-- Get coordinate text for a step
function Nav:GetStepCoords(step)
    if step and step.x and step.y then
        return string.format("%.1f, %.1f", step.x, step.y)
    end
    return nil
end
