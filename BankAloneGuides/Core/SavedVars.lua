local BAG = BankAlone
BAG.SavedVars = BAG.SavedVars or {}

local SavedVars = BAG.SavedVars

function SavedVars:Init()
    BAG_SavedVars = BAG_SavedVars or {}
    BAG_SavedVars.profile = BAG_SavedVars.profile or {}
    BAG_SavedVars.profile.ui = BAG_SavedVars.profile.ui or {
        point = "CENTER",
        relativePoint = "CENTER",
        x = 0,
        y = 0,
        width = 360,
        height = 420,
        minimized = false,
    }
    BAG_SavedVars.profile.theme = BAG_SavedVars.profile.theme or {
        variant = "neon-blue",
    }
    BAG_SavedVars.profile.smartStart = BAG_SavedVars.profile.smartStart ~= false
    BAG_SavedVars.characters = BAG_SavedVars.characters or {}

    local key = BAG.Utils:GetPlayerKey()
    BAG_SavedVars.characters[key] = BAG_SavedVars.characters[key] or {
        currentGuideId = nil,
        currentStep = 1,
        lastZone = nil,
    }

    BAG.db = BAG_SavedVars
end

function SavedVars:GetCharacter()
    local key = BAG.Utils:GetPlayerKey()
    return BAG.db.characters[key]
end

function SavedVars:SetCurrentGuide(guideId)
    local char = self:GetCharacter()
    char.currentGuideId = guideId
end

function SavedVars:SetCurrentStep(stepIndex)
    local char = self:GetCharacter()
    char.currentStep = stepIndex
end

function SavedVars:SetLastZone(zoneName)
    local char = self:GetCharacter()
    char.lastZone = zoneName
end

