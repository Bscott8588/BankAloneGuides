--[[
    Bank Alone Guides - Saved Variables
    Handles persistence of user data and preferences
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.SavedVars = {}

-- Default settings
local defaults = {
    version = "1.0.0",
    
    -- UI Settings
    ui = {
        shown = true,
        position = {
            point = "CENTER",
            x = 0,
            y = 0,
        },
        size = {
            width = 420,
            height = 600,
        },
        locked = false,
        scale = 1.0,
        alpha = 0.95,
    },
    
    -- Guide Settings
    guide = {
        currentGuide = nil,
        currentStep = 1,
        autoAdvance = true,
        showCoordinates = true,
        showQuestLevels = true,
        skipCompleted = true,
    },
    
    -- Per-character data (stored in BAG_CharVars)
    character = {
        completedGuides = {},
        completedSteps = {},
        customNotes = {},
        lastLoginLevel = 1,
        lastLoginZone = "",
    },
}

-- Initialize saved variables
function BAG.SavedVars:Initialize()
    -- Global settings
    if not BAG_SavedVars then
        BAG_SavedVars = BAG.Utils:TableCopy(defaults)
    else
        -- Merge with defaults to add any new settings
        BAG_SavedVars = BAG.Utils:TableMerge(BAG.Utils:TableCopy(defaults), BAG_SavedVars)
    end
    
    -- Per-character settings
    if not BAG_CharVars then
        BAG_CharVars = BAG.Utils:TableCopy(defaults.character)
    else
        BAG_CharVars = BAG.Utils:TableMerge(BAG.Utils:TableCopy(defaults.character), BAG_CharVars)
    end
    
    -- Update character data
    BAG_CharVars.lastLoginLevel = UnitLevel("player")
    BAG_CharVars.lastLoginZone = GetZoneText()
    
    BAG:DebugPrint("SavedVars initialized")
end

-- Get a setting value
function BAG.SavedVars:Get(path)
    local keys = BAG.Utils:Split(path, ".")
    return BAG.Utils:GetNestedValue(BAG_SavedVars, unpack(keys))
end

-- Set a setting value
function BAG.SavedVars:Set(path, value)
    local keys = BAG.Utils:Split(path, ".")
    local current = BAG_SavedVars
    
    for i = 1, #keys - 1 do
        if not current[keys[i]] then
            current[keys[i]] = {}
        end
        current = current[keys[i]]
    end
    
    current[keys[#keys]] = value
end

-- Get character-specific setting
function BAG.SavedVars:GetChar(key)
    return BAG_CharVars[key]
end

-- Set character-specific setting
function BAG.SavedVars:SetChar(key, value)
    BAG_CharVars[key] = value
end

-- Mark a step as completed
function BAG.SavedVars:MarkStepCompleted(guideName, stepIndex)
    if not BAG_CharVars.completedSteps[guideName] then
        BAG_CharVars.completedSteps[guideName] = {}
    end
    BAG_CharVars.completedSteps[guideName][stepIndex] = true
end

-- Check if a step is completed
function BAG.SavedVars:IsStepCompleted(guideName, stepIndex)
    if not BAG_CharVars.completedSteps[guideName] then
        return false
    end
    return BAG_CharVars.completedSteps[guideName][stepIndex] == true
end

-- Mark a guide as completed
function BAG.SavedVars:MarkGuideCompleted(guideName)
    BAG_CharVars.completedGuides[guideName] = true
end

-- Check if a guide is completed
function BAG.SavedVars:IsGuideCompleted(guideName)
    return BAG_CharVars.completedGuides[guideName] == true
end

-- Save current guide and step
function BAG.SavedVars:SaveProgress(guideName, stepIndex)
    self:Set("guide.currentGuide", guideName)
    self:Set("guide.currentStep", stepIndex)
end

-- Load current guide and step
function BAG.SavedVars:LoadProgress()
    local guideName = self:Get("guide.currentGuide")
    local stepIndex = self:Get("guide.currentStep") or 1
    return guideName, stepIndex
end

-- Save UI position and size
function BAG.SavedVars:SaveUIPosition(point, x, y, width, height)
    self:Set("ui.position.point", point)
    self:Set("ui.position.x", x)
    self:Set("ui.position.y", y)
    
    if width then
        self:Set("ui.size.width", width)
    end
    if height then
        self:Set("ui.size.height", height)
    end
end

-- Load UI position and size
function BAG.SavedVars:LoadUIPosition()
    return {
        point = self:Get("ui.position.point"),
        x = self:Get("ui.position.x"),
        y = self:Get("ui.position.y"),
        width = self:Get("ui.size.width"),
        height = self:Get("ui.size.height"),
    }
end

-- Reset all settings
function BAG.SavedVars:Reset()
    BAG_SavedVars = BAG.Utils:TableCopy(defaults)
    BAG:Print("Settings reset to defaults.")
end

-- Reset character data
function BAG.SavedVars:ResetCharacter()
    BAG_CharVars = BAG.Utils:TableCopy(defaults.character)
    BAG:Print("Character data reset.")
end

-- Export settings (for backup/sharing)
function BAG.SavedVars:Export()
    return BAG.Utils:TableCopy(BAG_SavedVars)
end

-- Import settings
function BAG.SavedVars:Import(data)
    if type(data) == "table" then
        BAG_SavedVars = BAG.Utils:TableMerge(BAG.Utils:TableCopy(defaults), data)
        BAG:Print("Settings imported.")
        return true
    end
    return false
end
