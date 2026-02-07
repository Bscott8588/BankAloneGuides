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
  frame:SetSize(240, 190)
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
    local settings = BAG.SavedVars:GetUISettings()
    settings.showArrow = selfCheck:GetChecked() and true or false
    BAG.SavedVars:SaveUISettings(settings)
    if BAG.UI.Navigation then
      BAG.UI.Navigation:UpdateVisibility()
    end
  end)

  CreateLabel(frame, "UI Scale", "TOPLEFT", 12, -90)

  local slider = CreateFrame("Slider", "BAG_UIScaleSlider", frame, "OptionsSliderTemplate")
  slider:SetPoint("TOPLEFT", frame, "TOPLEFT", 12, -112)
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

  local resetSize = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
  resetSize:SetText("Reset Size")
  resetSize:SetSize(90, 18)
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
  resetPos:SetSize(90, 18)
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

  frame:SetScript("OnShow", function()
    local settings = BAG.SavedVars:GetUISettings()
    lockCheck:SetChecked(settings.locked and true or false)
    arrowCheck:SetChecked(settings.showArrow ~= false)
    slider:SetValue(settings.scale or 1.0)
    sliderValue:SetText(string.format("%.2f", settings.scale or 1.0))
  end)

  self.frame = frame
  self.lockCheck = lockCheck
  self.arrowCheck = arrowCheck
  self.scaleSlider = slider
  self.scaleValue = sliderValue
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
