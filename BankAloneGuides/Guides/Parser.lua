--[[
    Bank Alone Guides - Guide Parser
    Parses guide scripts into Lua tables
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Parser = {
    currentGuide = nil,
    currentStep = nil,
}

-- Parse a guide from a table definition
function BAG.Parser:ParseGuide(guideDefinition)
    if not guideDefinition then
        BAG:Error("No guide definition provided")
        return nil
    end
    
    local guide = {
        title = guideDefinition.title or "Untitled Guide",
        description = guideDefinition.description or "",
        faction = guideDefinition.faction or "Both",
        levelRange = guideDefinition.levelRange or {min = 1, max = 70},
        zones = guideDefinition.zones or {},
        steps = {},
    }
    
    -- Parse steps
    if guideDefinition.steps then
        for i, stepDef in ipairs(guideDefinition.steps) do
            local step = self:ParseStep(stepDef, i)
            if step then
                table.insert(guide.steps, step)
            end
        end
    end
    
    BAG:DebugPrint("Parsed guide:", guide.title, "with", #guide.steps, "steps")
    
    return guide
end

-- Parse a single step
function BAG.Parser:ParseStep(stepDef, index)
    if not stepDef then
        return nil
    end
    
    local step = {
        index = index,
        type = stepDef.type or "note",
        text = stepDef.text or "",
        zone = stepDef.zone,
        x = stepDef.x,
        y = stepDef.y,
        questID = stepDef.questID,
        npcID = stepDef.npcID,
        itemID = stepDef.itemID,
        count = stepDef.count,
        spellID = stepDef.spellID,
        mobID = stepDef.mobID,
        description = stepDef.description,
        destination = stepDef.destination,
        from = stepDef.from,
        to = stepDef.to,
        location = stepDef.location,
        conditions = stepDef.conditions or {},
        objectiveIndex = stepDef.objectiveIndex,
        minLevel = stepDef.minLevel,
    }
    
    return step
end

-- Create a guide from a simple step list
function BAG.Parser:CreateGuide(config)
    local guide = {
        title = config.title or "Guide",
        description = config.description or "",
        faction = config.faction or "Both",
        levelRange = config.levelRange or {min = 1, max = 70},
        zones = config.zones or {},
        steps = {},
    }
    
    return guide
end

-- Add a step to a guide
function BAG.Parser:AddStep(guide, stepType, params)
    if not guide or not guide.steps then
        BAG:Error("Invalid guide")
        return
    end
    
    local step = {
        index = #guide.steps + 1,
        type = stepType,
    }
    
    -- Merge parameters
    if params then
        for k, v in pairs(params) do
            step[k] = v
        end
    end
    
    table.insert(guide.steps, step)
    
    return step
end

-- Helper functions for common step types

function BAG.Parser:Accept(questID, text, conditions)
    return {
        type = "accept",
        questID = questID,
        text = text or ("Accept quest " .. tostring(questID)),
        conditions = conditions or {},
    }
end

function BAG.Parser:TurnIn(questID, text, conditions)
    return {
        type = "turnin",
        questID = questID,
        text = text or ("Turn in quest " .. tostring(questID)),
        conditions = conditions or {},
    }
end

function BAG.Parser:GoTo(zone, x, y, description, conditions)
    return {
        type = "goto",
        zone = zone,
        x = x,
        y = y,
        description = description,
        conditions = conditions or {},
    }
end

function BAG.Parser:Kill(mobName, count, questID, conditions)
    return {
        type = "kill",
        description = mobName,
        count = count,
        questID = questID,
        conditions = conditions or {},
    }
end

function BAG.Parser:Collect(itemID, count, questID, conditions)
    return {
        type = "collect",
        itemID = itemID,
        count = count or 1,
        questID = questID,
        conditions = conditions or {},
    }
end

function BAG.Parser:Train(skillName, spellID, conditions)
    return {
        type = "train",
        description = skillName,
        spellID = spellID,
        conditions = conditions or {},
    }
end

function BAG.Parser:Vendor(description, conditions)
    return {
        type = "vendor",
        description = description,
        conditions = conditions or {},
    }
end

function BAG.Parser:Buy(itemID, count, description, conditions)
    return {
        type = "buy",
        itemID = itemID,
        count = count or 1,
        description = description,
        conditions = conditions or {},
    }
end

function BAG.Parser:Use(itemID, description, conditions)
    return {
        type = "use",
        itemID = itemID,
        description = description,
        conditions = conditions or {},
    }
end

function BAG.Parser:Equip(itemID, description, conditions)
    return {
        type = "equip",
        itemID = itemID,
        description = description,
        conditions = conditions or {},
    }
end

function BAG.Parser:Hearthstone(conditions)
    return {
        type = "hs",
        text = "Use Hearthstone",
        conditions = conditions or {},
    }
end

function BAG.Parser:Fly(destination, conditions)
    return {
        type = "fly",
        destination = destination,
        text = "Fly to " .. (destination or "destination"),
        conditions = conditions or {},
    }
end

function BAG.Parser:GetFlightPath(location, conditions)
    return {
        type = "fp",
        location = location,
        text = "Get flight path at " .. (location or "this location"),
        conditions = conditions or {},
    }
end

function BAG.Parser:Boat(from, to, conditions)
    return {
        type = "boat",
        from = from,
        to = to,
        text = string.format("Take boat from %s to %s", from or "dock", to or "destination"),
        conditions = conditions or {},
    }
end

function BAG.Parser:Zeppelin(from, to, conditions)
    return {
        type = "zeppelin",
        from = from,
        to = to,
        text = string.format("Take zeppelin from %s to %s", from or "tower", to or "destination"),
        conditions = conditions or {},
    }
end

function BAG.Parser:Run(destination, conditions)
    return {
        type = "run",
        destination = destination,
        text = "Run to " .. (destination or "destination"),
        conditions = conditions or {},
    }
end

function BAG.Parser:Mount(conditions)
    return {
        type = "mount",
        text = "Mount up",
        conditions = conditions or {},
    }
end

function BAG.Parser:Note(text, conditions)
    return {
        type = "note",
        text = text or "Note",
        conditions = conditions or {},
    }
end

-- Validate a guide
function BAG.Parser:ValidateGuide(guide)
    if not guide then
        return false, "No guide provided"
    end
    
    if not guide.title then
        return false, "Guide missing title"
    end
    
    if not guide.steps or #guide.steps == 0 then
        return false, "Guide has no steps"
    end
    
    -- Validate each step
    for i, step in ipairs(guide.steps) do
        if not step.type then
            return false, "Step " .. i .. " missing type"
        end
        
        -- Type-specific validation
        if step.type == "accept" or step.type == "turnin" then
            if not step.questID then
                return false, "Step " .. i .. " (" .. step.type .. ") missing questID"
            end
        elseif step.type == "goto" then
            if not step.zone then
                return false, "Step " .. i .. " (goto) missing zone"
            end
        end
    end
    
    return true, "Guide is valid"
end

-- Export guide to a shareable format
function BAG.Parser:ExportGuide(guide)
    if not guide then
        return nil
    end
    
    -- Create a simplified version for export
    local export = {
        title = guide.title,
        description = guide.description,
        faction = guide.faction,
        levelRange = guide.levelRange,
        zones = guide.zones,
        steps = {},
    }
    
    for _, step in ipairs(guide.steps) do
        table.insert(export.steps, {
            type = step.type,
            text = step.text,
            zone = step.zone,
            x = step.x,
            y = step.y,
            questID = step.questID,
            conditions = step.conditions,
        })
    end
    
    return export
end

-- Import guide from exported format
function BAG.Parser:ImportGuide(exportData)
    return self:ParseGuide(exportData)
end
