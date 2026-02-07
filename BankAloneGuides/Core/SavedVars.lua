local BAG = BankAlone
local SavedVars = BAG.SavedVars
local Utils = BAG.Utils

SavedVars.defaults = {
  ui = {
    point = "CENTER",
    relativePoint = "CENTER",
    x = 0,
    y = 0,
    width = 300,
    height = 340,
    scale = 1.0,
    locked = false,
    showArrow = true,
  },
  nav = {
    point = "CENTER",
    relativePoint = "CENTER",
    x = 280,
    y = 0,
    size = 96,
    scale = 1.0,
    locked = false,
    show = true,
  },
  theme = {
    neon = true,
    accentGlow = true,
  },
}

function SavedVars:Initialize()
  BAG_SavedVars = BAG_SavedVars or {}
  BAG_SavedVars.profile = Utils:MergeTables(Utils:CopyTable(self.defaults), BAG_SavedVars.profile or {})
  BAG_SavedVars.chars = BAG_SavedVars.chars or {}

  local key = Utils:GetCharKey()
  BAG_SavedVars.chars[key] = BAG_SavedVars.chars[key] or {
    currentGuideId = nil,
    stepIndex = 1,
    lastZone = nil,
  }

  self.profile = BAG_SavedVars.profile
  self.char = BAG_SavedVars.chars[key]

  -- Migrate legacy arrow toggle into nav settings
  if self.profile.ui and self.profile.ui.showArrow ~= nil then
    if self.profile.nav and self.profile.nav.show == nil then
      self.profile.nav.show = self.profile.ui.showArrow
    end
  end
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

function SavedVars:GetNavSettings()
  return self.profile.nav
end

function SavedVars:SaveNavSettings(settings)
  if not settings then
    return
  end
  self.profile.nav = settings
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
