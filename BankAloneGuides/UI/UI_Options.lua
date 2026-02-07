local BAG = BankAlone
local UI = BAG.UI
UI.Options = UI.Options or {}
local Options = UI.Options
local Styles = UI.Styles
local Layout = BAG.Branding.Layout
local Theme = BAG.Branding.Theme

local function CreateLabel(parent, text, anchor, x, y)
  local label = parent:CreateFontString(nil, "OVERLAY")
  label:SetFont(Styles.fonts.body, 11)
  label:SetTextColor(Styles.colors.text.r, Styles.colors.text.g, Styles.colors.text.b)
  label:SetPoint(anchor, parent, anchor, x, y)
  label:SetText(text)
  return label
end

local function CreateCheck(parent, labelText, anchor, x, y)
  local check = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
  check:SetPoint(anchor, parent, anchor, x, y)
  local label = parent:CreateFontString(nil, "OVERLAY")
  label:SetFont(Styles.fonts.body, 11)
  label:SetTextColor(Styles.colors.text.r, Styles.colors.text.g, Styles.colors.text.b)
  label:SetPoint("LEFT", check, "RIGHT", 4, 0)
  label:SetText(labelText)
  check.label = label
  return check
end

function Options:Initialize(parent)
  if self.frame then
    return
  end

  local frame = CreateFrame("Frame", "BAG_OptionsFrame", UIParent, "BackdropTemplate")
  frame:SetSize(280, 300)
  frame:SetPoint("TOPLEFT", parent, "TOPRIGHT", 10, 0)
  frame:SetClampedToScreen(true)
  Styles:ApplyBackdrop(frame)
  frame:Hide()

  local title = frame:CreateFontString(nil, "OVERLAY")
  title:SetFont(Theme.fonts.title, 12, "OUTLINE")
  title:SetTextColor(Theme.colors.primary.r, Theme.colors.primary.g, Theme.colors.primary.b)
  title:SetPoint("TOPLEFT", frame, "TOPLEFT", 12, -10)
  title:SetText("SCS Settings")

  local lockCheck = CreateCheck(frame, "Lock frame", "TOPLEFT", 12, -36)
  lockCheck:SetScript("OnClick", function(selfCheck)
    local settings = BAG.SavedVars:GetUISettings()
    settings.locked = selfCheck:GetChecked() and true or false
    BAG.SavedVars:SaveUISettings(settings)
  end)

  local arrowCheck = CreateCheck(frame, "Show navigation arrow", "TOPLEFT", 12, -60)
  arrowCheck:SetScript("OnClick", function(selfCheck)
    local navSettings = BAG.SavedVars:GetNavSettings()
    navSettings.show = selfCheck:GetChecked() and true or false
    BAG.SavedVars:SaveNavSettings(navSettings)
    if BAG.UI.Navigation then
      BAG.UI.Navigation:UpdateVisibility()
    end
  end)

  local navLock = CreateCheck(frame, "Lock navigation", "TOPLEFT", 12, -84)
  navLock:SetScript("OnClick", function(selfCheck)
    local navSettings = BAG.SavedVars:GetNavSettings()
    navSettings.locked = selfCheck:GetChecked() and true or false
    BAG.SavedVars:SaveNavSettings(navSettings)
  end)

  CreateLabel(frame, "Guide Scale", "TOPLEFT", 12, -112)

  local slider = CreateFrame("Slider", "BAG_UIScaleSlider", frame, "OptionsSliderTemplate")
  slider:SetPoint("TOPLEFT", frame, "TOPLEFT", 12, -134)
  slider:SetWidth(150)
  slider:SetMinMaxValues(0.7, 1.2)
  slider:SetValueStep(0.05)
  slider:SetObeyStepOnDrag(true)

  local sliderValue = frame:CreateFontString(nil, "OVERLAY")
  sliderValue:SetFont(Styles.fonts.body, 10)
  sliderValue:SetTextColor(Styles.colors.muted.r, Styles.colors.muted.g, Styles.colors.muted.b)
  sliderValue:SetPoint("LEFT", slider, "RIGHT", 8, 0)

  slider:SetScript("OnValueChanged", function(selfSlider, value)
    local settings = BAG.SavedVars:GetUISettings()
    settings.scale = value
    BAG.SavedVars:SaveUISettings(settings)
    if BAG.UI.mainFrame then
      BAG.UI.mainFrame:SetScale(value)
    end
    sliderValue:SetText(string.format("%.2f", value))
  end)

  CreateLabel(frame, "Navigation Size", "TOPLEFT", 12, -166)

  local navSize = CreateFrame("Slider", "BAG_NavSizeSlider", frame, "OptionsSliderTemplate")
  navSize:SetPoint("TOPLEFT", frame, "TOPLEFT", 12, -188)
  navSize:SetWidth(150)
  navSize:SetMinMaxValues(70, 160)
  navSize:SetValueStep(2)
  navSize:SetObeyStepOnDrag(true)

  local navSizeValue = frame:CreateFontString(nil, "OVERLAY")
  navSizeValue:SetFont(Styles.fonts.body, 10)
  navSizeValue:SetTextColor(Styles.colors.muted.r, Styles.colors.muted.g, Styles.colors.muted.b)
  navSizeValue:SetPoint("LEFT", navSize, "RIGHT", 8, 0)

  navSize:SetScript("OnValueChanged", function(selfSlider, value)
    local navSettings = BAG.SavedVars:GetNavSettings()
    navSettings.size = value
    BAG.SavedVars:SaveNavSettings(navSettings)
    if BAG.UI.Navigation then
      BAG.UI.Navigation:ApplySize(value)
    end
    navSizeValue:SetText(string.format("%.0f", value))
  end)

  CreateLabel(frame, "Navigation Scale", "TOPLEFT", 12, -220)

  local navScale = CreateFrame("Slider", "BAG_NavScaleSlider", frame, "OptionsSliderTemplate")
  navScale:SetPoint("TOPLEFT", frame, "TOPLEFT", 12, -242)
  navScale:SetWidth(150)
  navScale:SetMinMaxValues(0.7, 1.4)
  navScale:SetValueStep(0.05)
  navScale:SetObeyStepOnDrag(true)

  local navScaleValue = frame:CreateFontString(nil, "OVERLAY")
  navScaleValue:SetFont(Styles.fonts.body, 10)
  navScaleValue:SetTextColor(Styles.colors.muted.r, Styles.colors.muted.g, Styles.colors.muted.b)
  navScaleValue:SetPoint("LEFT", navScale, "RIGHT", 8, 0)

  navScale:SetScript("OnValueChanged", function(selfSlider, value)
    local navSettings = BAG.SavedVars:GetNavSettings()
    navSettings.scale = value
    BAG.SavedVars:SaveNavSettings(navSettings)
    if BAG.UI.Navigation and BAG.UI.Navigation.frame then
      BAG.UI.Navigation.frame:SetScale(value)
    end
    navScaleValue:SetText(string.format("%.2f", value))
  end)

  local resetSize = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
  resetSize:SetText("Reset Size")
  resetSize:SetSize(72, 18)
  resetSize:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 12, 12)
  resetSize:SetScript("OnClick", function()
    local settings = BAG.SavedVars:GetUISettings()
    settings.width = Layout.frame.width
    settings.height = Layout.frame.height
    if BAG.UI.mainFrame then
      BAG.UI.mainFrame:SetSize(settings.width, settings.height)
    end
    BAG.SavedVars:SaveUISettings(settings)
  end)

  local resetPos = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
  resetPos:SetText("Reset Pos")
  resetPos:SetSize(72, 18)
  resetPos:SetPoint("LEFT", resetSize, "RIGHT", 6, 0)
  resetPos:SetScript("OnClick", function()
    local settings = BAG.SavedVars:GetUISettings()
    settings.point = "CENTER"
    settings.relativePoint = "CENTER"
    settings.x = 0
    settings.y = 0
    if BAG.UI.mainFrame then
      BAG.UI.mainFrame:ClearAllPoints()
      BAG.UI.mainFrame:SetPoint(settings.point, UIParent, settings.relativePoint, settings.x, settings.y)
    end
    BAG.SavedVars:SaveUISettings(settings)
  end)

  local resetNav = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
  resetNav:SetText("Reset Nav")
  resetNav:SetSize(72, 18)
  resetNav:SetPoint("LEFT", resetPos, "RIGHT", 6, 0)
  resetNav:SetScript("OnClick", function()
    local navSettings = BAG.SavedVars:GetNavSettings()
    navSettings.point = "CENTER"
    navSettings.relativePoint = "CENTER"
    navSettings.x = 280
    navSettings.y = 0
    navSettings.size = 96
    navSettings.scale = 1.0
    if BAG.UI.Navigation and BAG.UI.Navigation.frame then
      BAG.UI.Navigation.frame:ClearAllPoints()
      BAG.UI.Navigation.frame:SetPoint(navSettings.point, UIParent, navSettings.relativePoint, navSettings.x, navSettings.y)
      BAG.UI.Navigation.frame:SetScale(navSettings.scale)
      BAG.UI.Navigation:ApplySize(navSettings.size)
    end
    BAG.SavedVars:SaveNavSettings(navSettings)
  end)

  frame:SetScript("OnShow", function()
    local settings = BAG.SavedVars:GetUISettings()
    local navSettings = BAG.SavedVars:GetNavSettings()
    lockCheck:SetChecked(settings.locked and true or false)
    arrowCheck:SetChecked(navSettings.show ~= false)
    navLock:SetChecked(navSettings.locked and true or false)
    slider:SetValue(settings.scale or 1.0)
    sliderValue:SetText(string.format("%.2f", settings.scale or 1.0))
    navSize:SetValue(navSettings.size or 96)
    navSizeValue:SetText(string.format("%.0f", navSettings.size or 96))
    navScale:SetValue(navSettings.scale or 1.0)
    navScaleValue:SetText(string.format("%.2f", navSettings.scale or 1.0))
  end)

  self.frame = frame
  self.lockCheck = lockCheck
  self.arrowCheck = arrowCheck
  self.scaleSlider = slider
  self.scaleValue = sliderValue
  self.navLock = navLock
  self.navSizeSlider = navSize
  self.navScaleSlider = navScale
end

function Options:Toggle()
  if not self.frame then
    return
  end
  if self.frame:IsShown() then
    self.frame:Hide()
  else
    self.frame:Show()
  end
end
