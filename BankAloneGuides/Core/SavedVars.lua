--[[
    Bank Alone Guides - SavedVariables Management
    Handles persistent storage of user data and preferences
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Default settings
local DEFAULTS = {
    -- UI Settings
    ui = {
        position = {
            point = "RIGHT",
            relativeTo = "UIParent",
            relativePoint = "RIGHT",
            x = -50,
            y = 0
        },
        size = {
            width = 380,
            height = 500
        },
        scale = 1.0,
        alpha = 0.95,
        locked = false,
        shown = true,
        minimapButton = {
            shown = true,
            angle = 200
        }
    },
    
    -- Guide Settings
    guide = {
        currentGuide = nil,
        currentStep = 1,
        autoAdvance = true,
        showCoordinates = true,
        showObjectives = true,
        playSound = true,
        skipCompleted = true
    },
    
    -- Display Settings
    display = {
        maxSteps = 5,
        fontSize = 12,
        showIcons = true,
        showProgress = true,
        compactMode = false,
        theme = "default"
    },
    
    -- Navigation Settings
    navigation = {
        autoWaypoint = true,
        autoTrack = true,
        distanceUnits = "yards"
    },
    
    -- Notification Settings
    notifications = {
        questAccepted = true,
        questCompleted = true,
        levelUp = true,
        guideCompleted = true
    },
    
    -- Version tracking
    version = BAG.Version
}

-- Character-specific defaults
local CHAR_DEFAULTS = {
    -- Current progress
    progress = {
        currentGuide = nil,
        currentStep = 1,
        completedGuides = {},
        completedSteps = {},
        lastLogin = 0,
        playTime = 0
    },
    
    -- Character info snapshot
    character = {
        name = nil,
        realm = nil,
        faction = nil,
        race = nil,
        class = nil,
        level = 1
    },
    
    -- Statistics
    stats = {
        questsCompleted = 0,
        levelsGained = 0,
        zonesVisited = {},
        professionsLeveled = {}
    }
}

-- Initialize SavedVariables
function BAG.SavedVars:Initialize()
    -- Initialize global settings
    if not BAG_SavedVars then
        BAG_SavedVars = BAG.Utils:TableCopy(DEFAULTS)
    else
        -- Merge with defaults to add any new settings
        BAG_SavedVars = BAG.Utils:TableMerge(DEFAULTS, BAG_SavedVars)
    end
    
    -- Initialize character-specific settings
    local charKey = self:GetCharacterKey()
    if not BAG_CharVars then
        BAG_CharVars = {}
    end
    
    if not BAG_CharVars[charKey] then
        BAG_CharVars[charKey] = BAG.Utils:TableCopy(CHAR_DEFAULTS)
        
        -- Set character info
        local playerInfo = BAG.PlayerAPI:GetPlayerInfo()
        BAG_CharVars[charKey].character = {
            name = playerInfo.name,
            realm = GetRealmName(),
            faction = playerInfo.faction,
            race = playerInfo.race,
            class = playerInfo.class,
            level = playerInfo.level
        }
    else
        -- Merge with defaults
        BAG_CharVars[charKey] = BAG.Utils:TableMerge(CHAR_DEFAULTS, BAG_CharVars[charKey])
        
        -- Update character level
        BAG_CharVars[charKey].character.level = UnitLevel("player")
    end
    
    -- Update last login time
    BAG_CharVars[charKey].progress.lastLogin = time()
    
    BAG.Logo:Print("Settings loaded")
end

-- Get character key (name-realm)
function BAG.SavedVars:GetCharacterKey()
    local name = UnitName("player")
    local realm = GetRealmName()
    return name .. "-" .. realm
end

-- Get current character data
function BAG.SavedVars:GetCharacterData()
    local charKey = self:GetCharacterKey()
    return BAG_CharVars[charKey]
end

-- Get setting value (supports nested keys with dot notation)
function BAG.SavedVars:Get(key, isCharSpecific)
    local parts = BAG.Utils:Split(key, ".")
    local data = isCharSpecific and self:GetCharacterData() or BAG_SavedVars
    
    for _, part in ipairs(parts) do
        if data then
            data = data[part]
        else
            return nil
        end
    end
    
    return data
end

-- Set setting value (supports nested keys with dot notation)
function BAG.SavedVars:Set(key, value, isCharSpecific)
    local parts = BAG.Utils:Split(key, ".")
    local data = isCharSpecific and self:GetCharacterData() or BAG_SavedVars
    
    -- Navigate to parent
    for i = 1, #parts - 1 do
        local part = parts[i]
        if not data[part] then
            data[part] = {}
        end
        data = data[part]
    end
    
    -- Set value
    data[parts[#parts]] = value
end

-- UI Position
function BAG.SavedVars:SaveUIPosition(point, relativeTo, relativePoint, x, y)
    self:Set("ui.position", {
        point = point,
        relativeTo = relativeTo,
        relativePoint = relativePoint,
        x = x,
        y = y
    })
end

function BAG.SavedVars:GetUIPosition()
    return self:Get("ui.position")
end

-- UI Size
function BAG.SavedVars:SaveUISize(width, height)
    self:Set("ui.size", {
        width = width,
        height = height
    })
end

function BAG.SavedVars:GetUISize()
    return self:Get("ui.size")
end

-- Current Guide
function BAG.SavedVars:SetCurrentGuide(guideID, step)
    step = step or 1
    self:Set("progress.currentGuide", guideID, true)
    self:Set("progress.currentStep", step, true)
end

function BAG.SavedVars:GetCurrentGuide()
    local guideID = self:Get("progress.currentGuide", true)
    local step = self:Get("progress.currentStep", true) or 1
    
    if guideID then
        return {
            id = guideID,
            step = step,
            title = guideID  -- TODO: Get actual title from guide data
        }
    end
    return nil
end

-- Step completion
function BAG.SavedVars:MarkStepComplete(guideID, stepIndex)
    local charData = self:GetCharacterData()
    if not charData.progress.completedSteps[guideID] then
        charData.progress.completedSteps[guideID] = {}
    end
    charData.progress.completedSteps[guideID][stepIndex] = true
end

function BAG.SavedVars:IsStepComplete(guideID, stepIndex)
    local charData = self:GetCharacterData()
    if charData.progress.completedSteps[guideID] then
        return charData.progress.completedSteps[guideID][stepIndex] == true
    end
    return false
end

-- Guide completion
function BAG.SavedVars:MarkGuideComplete(guideID)
    local charData = self:GetCharacterData()
    table.insert(charData.progress.completedGuides, guideID)
end

function BAG.SavedVars:IsGuideComplete(guideID)
    local charData = self:GetCharacterData()
    return BAG.Utils:TableContains(charData.progress.completedGuides, guideID)
end

-- Statistics
function BAG.SavedVars:IncrementStat(statName, value)
    value = value or 1
    local charData = self:GetCharacterData()
    if charData.stats[statName] then
        charData.stats[statName] = charData.stats[statName] + value
    end
end

function BAG.SavedVars:GetStat(statName)
    local charData = self:GetCharacterData()
    return charData.stats[statName] or 0
end

-- Zone tracking
function BAG.SavedVars:AddVisitedZone(zoneName)
    local charData = self:GetCharacterData()
    if not BAG.Utils:TableContains(charData.stats.zonesVisited, zoneName) then
        table.insert(charData.stats.zonesVisited, zoneName)
    end
end

-- Reset settings
function BAG.SavedVars:Reset()
    BAG_SavedVars = BAG.Utils:TableCopy(DEFAULTS)
    BAG.Logo:PrintSuccess("Settings reset to defaults")
end

-- Reset character progress
function BAG.SavedVars:ResetCharacter()
    local charKey = self:GetCharacterKey()
    BAG_CharVars[charKey] = BAG.Utils:TableCopy(CHAR_DEFAULTS)
    
    -- Re-set character info
    local playerInfo = BAG.PlayerAPI:GetPlayerInfo()
    BAG_CharVars[charKey].character = {
        name = playerInfo.name,
        realm = GetRealmName(),
        faction = playerInfo.faction,
        race = playerInfo.race,
        class = playerInfo.class,
        level = playerInfo.level
    }
    
    BAG.Logo:PrintSuccess("Character progress reset")
end

-- Export settings (for debugging)
function BAG.SavedVars:Export()
    return {
        global = BAG_SavedVars,
        character = self:GetCharacterData()
    }
end

print("|cff00B3FF[Bank Alone Guides]|r SavedVariables system loaded")
