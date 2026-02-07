local BAG = BankAlone
local SavedVars = BAG.SavedVars
local Utils = BAG.Utils

SavedVars.defaults = {
  ui = {
    point = "CENTER",
    relativePoint = "CENTER",
    x = 0,
    y = 0,
    width = 360,
    height = 420,
    locked = false,
  },
  theme = {
    neon = true,
    accentGlow = true,
  },
}

function SavedVars:Initialize()
  BAG_SavedVars = BAG_SavedVars or {}
  BAG_SavedVars.profile = BAG_SavedVars.profile or Utils:CopyTable(self.defaults)
  BAG_SavedVars.chars = BAG_SavedVars.chars or {}

  local key = Utils:GetCharKey()
  BAG_SavedVars.chars[key] = BAG_SavedVars.chars[key] or {
    currentGuideId = nil,
    stepIndex = 1,
    lastZone = nil,
  }

  self.profile = BAG_SavedVars.profile
  self.char = BAG_SavedVars.chars[key]
end

function SavedVars:GetUISettings()
  return self.profile.ui
end

function SavedVars:SaveUISettings(settings)
  if not settings then
    return
  end
  self.profile.ui = settings
end

function SavedVars:SaveGuideState(guideId, stepIndex)
  if not self.char then
    return
  end
  self.char.currentGuideId = guideId
  self.char.stepIndex = stepIndex
end

function SavedVars:GetGuideState()
  if not self.char then
    return nil
  end
  return self.char.currentGuideId, self.char.stepIndex
end
