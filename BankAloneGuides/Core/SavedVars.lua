-------------------------------------------------------------------------------
-- Bank Alone Guides — Core / SavedVars
-- Persistent storage via WoW SavedVariables
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.SavedVars = BAG.SavedVars or {}

-- Defaults for global saved variables
local DEFAULTS = {
    version       = "1.0",
    debugMode     = false,
    characters    = {},
    globalPrefs   = {
        uiScale       = 1.0,
        showOnLogin    = true,
        autoAdvance    = true,
        soundEnabled   = true,
        stepPreview    = 4,
        minimapButton  = true,
    },
}

-- Defaults for per-character data
local CHAR_DEFAULTS = {
    currentGuide   = nil,
    currentStep    = 1,
    completedSteps = {},
    framePos       = nil,   -- { point, relPoint, x, y }
    frameSize      = nil,   -- { width, height }
    minimized      = false,
    guideHistory   = {},
}

--- Deep-merge defaults into existing table (does not overwrite existing keys).
local function ApplyDefaults(target, defaults)
    for k, v in pairs(defaults) do
        if type(v) == "table" then
            if type(target[k]) ~= "table" then
                target[k] = {}
            end
            ApplyDefaults(target[k], v)
        elseif target[k] == nil then
            target[k] = v
        end
    end
end

--- Get a unique character key (Name-Realm).
local function GetCharKey()
    local name  = UnitName("player") or "Unknown"
    local realm = GetRealmName() or "UnknownRealm"
    return name .. "-" .. realm
end

--- Initialize saved variables on login.
function BAG.SavedVars:Initialize()
    -- Create global SV if it doesn't exist
    if not BAG_SavedVars then
        BAG_SavedVars = {}
    end

    ApplyDefaults(BAG_SavedVars, DEFAULTS)

    -- Per-character data
    local charKey = GetCharKey()
    if not BAG_SavedVars.characters[charKey] then
        BAG_SavedVars.characters[charKey] = {}
    end
    ApplyDefaults(BAG_SavedVars.characters[charKey], CHAR_DEFAULTS)

    self.charKey = charKey
    BAG.DebugMode = BAG_SavedVars.debugMode
    BAG:Debug("SavedVars initialized for " .. charKey)
end

--- Get a per-character value.
function BAG.SavedVars:Get(key)
    if not BAG_SavedVars or not self.charKey then return nil end
    local charData = BAG_SavedVars.characters[self.charKey]
    if charData then
        return charData[key]
    end
    return nil
end

--- Set a per-character value.
function BAG.SavedVars:Set(key, value)
    if not BAG_SavedVars or not self.charKey then return end
    BAG_SavedVars.characters[self.charKey][key] = value
end

--- Get a global preference.
function BAG.SavedVars:GetPref(key)
    if not BAG_SavedVars or not BAG_SavedVars.globalPrefs then return nil end
    return BAG_SavedVars.globalPrefs[key]
end

--- Set a global preference.
function BAG.SavedVars:SetPref(key, value)
    if not BAG_SavedVars then return end
    BAG_SavedVars.globalPrefs[key] = value
end

--- Mark a step as complete for the current character.
function BAG.SavedVars:MarkStepComplete(guideKey, stepIndex)
    local charData = BAG_SavedVars.characters[self.charKey]
    if not charData then return end
    if not charData.completedSteps then
        charData.completedSteps = {}
    end
    if not charData.completedSteps[guideKey] then
        charData.completedSteps[guideKey] = {}
    end
    charData.completedSteps[guideKey][stepIndex] = true
end

--- Check if a step is already complete for this character.
function BAG.SavedVars:IsStepComplete(guideKey, stepIndex)
    local charData = BAG_SavedVars and BAG_SavedVars.characters and
                     BAG_SavedVars.characters[self.charKey]
    if not charData or not charData.completedSteps then return false end
    local guide = charData.completedSteps[guideKey]
    return guide and guide[stepIndex] == true
end

--- Save the current frame position.
function BAG.SavedVars:SaveFramePosition(point, relativeTo, relativePoint, x, y)
    self:Set("framePos", { point = point, relPoint = relativePoint, x = x, y = y })
end

--- Save the current frame size.
function BAG.SavedVars:SaveFrameSize(width, height)
    self:Set("frameSize", { width = width, height = height })
end
