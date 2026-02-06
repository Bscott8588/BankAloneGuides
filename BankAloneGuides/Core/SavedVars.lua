--[[
    Bank Alone Guides - SavedVariables Management
    SCS / Bank Alone Guides
    
    Handles persistent data storage per-account and per-character.
    SavedVariable name: BAG_SavedVars
]]

local BAG = BankAlone

BAG.SavedVars = BAG.SavedVars or {}
local SV = BAG.SavedVars

-- Defaults for account-wide settings
local ACCOUNT_DEFAULTS = {
    version = "1.0",
    debugMode = false,
    ui = {
        x = nil,
        y = nil,
        width = 340,
        height = 480,
        locked = false,
        minimized = false,
        alpha = 1.0,
        scale = 1.0,
        showOnLogin = true,
    },
    theme = {
        primaryColor = { 0, 0.8, 1, 1 },       -- Neon blue
        secondaryColor = { 0.1, 0.15, 0.2, 0.9 }, -- Dark blue-gray
        accentColor = { 0.3, 0.9, 1, 0.8 },     -- Lighter blue glow
        textColor = { 1, 1, 1, 1 },
        headerColor = { 0, 0.8, 1, 1 },
    },
}

-- Defaults for per-character settings
local CHARACTER_DEFAULTS = {
    currentGuide = nil,
    currentStep = 1,
    completedSteps = {},
    skippedSteps = {},
    guideHistory = {},
    professionGuides = {},
}

-- Initialize saved variables
function SV:Initialize()
    -- Account-wide
    if not BAG_SavedVars then
        BAG_SavedVars = {}
    end

    if not BAG_SavedVars.account then
        BAG_SavedVars.account = BAG.Utils:DeepCopy(ACCOUNT_DEFAULTS)
    else
        -- Merge defaults for any new keys
        for k, v in pairs(ACCOUNT_DEFAULTS) do
            if BAG_SavedVars.account[k] == nil then
                BAG_SavedVars.account[k] = BAG.Utils:DeepCopy(v)
            end
        end
        -- Merge sub-tables
        if type(ACCOUNT_DEFAULTS.ui) == "table" then
            for k, v in pairs(ACCOUNT_DEFAULTS.ui) do
                if BAG_SavedVars.account.ui[k] == nil then
                    BAG_SavedVars.account.ui[k] = v
                end
            end
        end
        if type(ACCOUNT_DEFAULTS.theme) == "table" then
            for k, v in pairs(ACCOUNT_DEFAULTS.theme) do
                if BAG_SavedVars.account.theme[k] == nil then
                    BAG_SavedVars.account.theme[k] = BAG.Utils:DeepCopy(v)
                end
            end
        end
    end

    -- Per-character
    local charKey = self:GetCharacterKey()
    if not BAG_SavedVars.characters then
        BAG_SavedVars.characters = {}
    end
    if not BAG_SavedVars.characters[charKey] then
        BAG_SavedVars.characters[charKey] = BAG.Utils:DeepCopy(CHARACTER_DEFAULTS)
    else
        for k, v in pairs(CHARACTER_DEFAULTS) do
            if BAG_SavedVars.characters[charKey][k] == nil then
                BAG_SavedVars.characters[charKey][k] = BAG.Utils:DeepCopy(v)
            end
        end
    end

    BAG:Debug("SavedVars initialized for", charKey)
end

-- Get a unique key for the current character
function SV:GetCharacterKey()
    local name = UnitName("player") or "Unknown"
    local realm = GetRealmName() or "Unknown"
    return name .. "-" .. realm
end

-- Get account-wide variable
function SV:GetVar(key)
    if BAG_SavedVars and BAG_SavedVars.account then
        return BAG_SavedVars.account[key]
    end
    return nil
end

-- Set account-wide variable
function SV:SetVar(key, value)
    if BAG_SavedVars and BAG_SavedVars.account then
        BAG_SavedVars.account[key] = value
    end
end

-- Get per-character variable
function SV:GetCharVar(key)
    local charKey = self:GetCharacterKey()
    if BAG_SavedVars and BAG_SavedVars.characters and BAG_SavedVars.characters[charKey] then
        return BAG_SavedVars.characters[charKey][key]
    end
    return nil
end

-- Set per-character variable
function SV:SetCharVar(key, value)
    local charKey = self:GetCharacterKey()
    if BAG_SavedVars and BAG_SavedVars.characters then
        if not BAG_SavedVars.characters[charKey] then
            BAG_SavedVars.characters[charKey] = BAG.Utils:DeepCopy(CHARACTER_DEFAULTS)
        end
        BAG_SavedVars.characters[charKey][key] = value
    end
end

-- Get UI setting
function SV:GetUI(key)
    local ui = self:GetVar("ui")
    if ui then return ui[key] end
    return nil
end

-- Set UI setting
function SV:SetUI(key, value)
    if BAG_SavedVars and BAG_SavedVars.account and BAG_SavedVars.account.ui then
        BAG_SavedVars.account.ui[key] = value
    end
end

-- Get theme setting
function SV:GetTheme(key)
    local theme = self:GetVar("theme")
    if theme then return theme[key] end
    return nil
end

-- Set theme setting
function SV:SetTheme(key, value)
    if BAG_SavedVars and BAG_SavedVars.account and BAG_SavedVars.account.theme then
        BAG_SavedVars.account.theme[key] = value
    end
end

-- Mark a step as completed for current character
function SV:MarkStepComplete(guideKey, stepIndex)
    local completed = self:GetCharVar("completedSteps") or {}
    if not completed[guideKey] then
        completed[guideKey] = {}
    end
    completed[guideKey][stepIndex] = true
    self:SetCharVar("completedSteps", completed)
end

-- Check if a step is completed
function SV:IsStepComplete(guideKey, stepIndex)
    local completed = self:GetCharVar("completedSteps") or {}
    return completed[guideKey] and completed[guideKey][stepIndex] or false
end

-- Save current guide progress
function SV:SaveProgress(guideName, stepIndex)
    self:SetCharVar("currentGuide", guideName)
    self:SetCharVar("currentStep", stepIndex)
end

-- Reset character progress
function SV:ResetCharacter()
    local charKey = self:GetCharacterKey()
    if BAG_SavedVars and BAG_SavedVars.characters then
        BAG_SavedVars.characters[charKey] = BAG.Utils:DeepCopy(CHARACTER_DEFAULTS)
    end
end
