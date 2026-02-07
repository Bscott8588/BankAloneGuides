local BAG = BankAlone
local UI = BAG.UI
UI.MainFrame = UI.MainFrame or {}
local MainFrame = UI.MainFrame
local Styles = UI.Styles
local Layout = BAG.Branding.Layout
local Theme = BAG.Branding.Theme

function MainFrame:Create()
  if self.frame then
    return self.frame
  end

  local settings = BAG.SavedVars and BAG.SavedVars:GetUISettings() or {}
  local width = settings.width or Layout.frame.width
  local height = settings.height or Layout.frame.height

  local frame = CreateFrame("Frame", "BAG_MainFrame", UIParent, "BackdropTemplate")
  frame:SetSize(width, height)
  frame:SetPoint(settings.point or "CENTER", UIParent, settings.relativePoint or "CENTER", settings.x or 0, settings.y or 0)
  frame:SetScale(settings.scale or 1.0)
  frame:SetFrameStrata("MEDIUM")
  frame:SetMovable(true)
  frame:SetResizable(true)
  frame:EnableMouse(true)
  frame:SetClampedToScreen(true)
  Styles:ApplyBackdrop(frame)

  local titleBar = CreateFrame("Frame", nil, frame)
  titleBar:SetHeight(Layout.headerHeight)
  titleBar:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
  titleBar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
  titleBar:EnableMouse(true)
  titleBar:RegisterForDrag("LeftButton")
  titleBar:SetScript("OnDragStart", function()
    if settings.locked then
      return
    end
    frame:StartMoving()
  end)
  titleBar:SetScript("OnDragStop", function()
    frame:StopMovingOrSizing()
    local point, _, relativePoint, x, y = frame:GetPoint()
    settings.point = point
    settings.relativePoint = relativePoint
    settings.x = x
    settings.y = y
    if BAG.SavedVars then
      BAG.SavedVars:SaveUISettings(settings)
    end
  end)

  local titleBg = titleBar:CreateTexture(nil, "BACKGROUND")
  titleBg:SetAllPoints(titleBar)
  titleBg:SetColorTexture(Theme.colors.secondary.r, Theme.colors.secondary.g, Theme.colors.secondary.b, 0.95)

  local accent = frame:CreateTexture(nil, "ARTWORK")
  accent:SetHeight(2)
  accent:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, -Layout.headerHeight)
  accent:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, -Layout.headerHeight)
  accent:SetColorTexture(Theme.colors.primary.r, Theme.colors.primary.g, Theme.colors.primary.b, 0.85)

  local logo = BAG.Branding:CreateLogo(titleBar)
  self.logo = logo

  local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
  close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, -2)

  local minimize = CreateFrame("Button", nil, frame)
  minimize:SetSize(18, 18)
  minimize:SetPoint("TOPRIGHT", close, "TOPLEFT", -4, 0)
  minimize:SetNormalTexture("Interface\\Buttons\\UI-Panel-CollapseButton-Up")
  minimize:SetPushedTexture("Interface\\Buttons\\UI-Panel-CollapseButton-Down")
  minimize:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
  minimize:SetScript("OnClick", function()
    if frame.content and frame.content:IsShown() then
      frame.content:Hide()
    else
      if frame.content then
        frame.content:Show()
      end
    end
  end)

  local resize = CreateFrame("Button", nil, frame)
  resize:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
  resize:SetSize(16, 16)
  resize:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
  resize:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
  resize:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
  resize:RegisterForDrag("LeftButton")
  resize:SetScript("OnDragStart", function()
    frame:StartSizing("BOTTOMRIGHT")
  end)
  resize:SetScript("OnDragStop", function()
    frame:StopMovingOrSizing()
    local w, h = frame:GetSize()
    settings.width = math.max(w, Layout.frame.minWidth)
    settings.height = math.max(h, Layout.frame.minHeight)
    frame:SetSize(settings.width, settings.height)
    if BAG.SavedVars then
      BAG.SavedVars:SaveUISettings(settings)
    end
  end)

  local contentBg = CreateFrame("Frame", nil, frame, "BackdropTemplate")
  contentBg:SetPoint("TOPLEFT", frame, "TOPLEFT", 6, -Layout.headerHeight - 6)
  contentBg:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -6, 6)
  contentBg:SetBackdrop({
    bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 10,
    insets = { left = 2, right = 2, top = 2, bottom = 2 },
  })
  contentBg:SetBackdropColor(0.04, 0.06, 0.1, 0.7)
  contentBg:SetBackdropBorderColor(Theme.colors.secondary.r, Theme.colors.secondary.g, Theme.colors.secondary.b, 0.7)

  local content = CreateFrame("Frame", nil, contentBg)
  content:SetPoint("TOPLEFT", contentBg, "TOPLEFT", Layout.padding, -Layout.padding)
  content:SetPoint("BOTTOMRIGHT", contentBg, "BOTTOMRIGHT", -Layout.padding, Layout.padding)
  frame.content = content
  frame.contentBg = contentBg

  self.frame = frame
  return frame
end
