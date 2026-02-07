local BAG = BankAlone
local UI = BAG.UI
UI.Navigation = UI.Navigation or {}
local Navigation = UI.Navigation
local Styles = UI.Styles

function Navigation:Initialize()
  if self.frame then
    return
  end

  local settings = BAG.SavedVars:GetNavSettings()
  local size = settings.size or 96

  local frame = CreateFrame("Frame", "BAG_NavFrame", UIParent, "BackdropTemplate")
  frame:SetSize(size, size)
  frame:SetPoint(settings.point or "CENTER", UIParent, settings.relativePoint or "CENTER", settings.x or 0, settings.y or 0)
  frame:SetScale(settings.scale or 1.0)
  frame:SetFrameStrata("HIGH")
  frame:SetMovable(true)
  frame:SetResizable(true)
  frame:EnableMouse(true)
  frame:SetClampedToScreen(true)
  frame:RegisterForDrag("LeftButton")
  frame:SetScript("OnDragStart", function()
    if settings.locked then
      return
    end
    frame:StartMoving()
  end)
  frame:SetScript("OnDragStop", function()
    frame:StopMovingOrSizing()
    local point, _, relativePoint, x, y = frame:GetPoint()
    settings.point = point
    settings.relativePoint = relativePoint
    settings.x = x
    settings.y = y
    BAG.SavedVars:SaveNavSettings(settings)
  end)

  local plate = frame:CreateTexture(nil, "BACKGROUND")
  plate:SetAllPoints(frame)
  plate:SetColorTexture(0.02, 0.05, 0.08, 0.85)

  local ring = frame:CreateTexture(nil, "BORDER")
  ring:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
  ring:SetAllPoints(frame)
  ring:SetVertexColor(0.15, 0.45, 0.75, 0.9)

  local glow = frame:CreateTexture(nil, "BORDER")
  glow:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
  glow:SetBlendMode("ADD")
  glow:SetVertexColor(0.25, 0.85, 1.0, 0.9)

  local arrow = frame:CreateTexture(nil, "ARTWORK")
  arrow:SetTexture("Interface\\Minimap\\MinimapArrow")
  arrow:SetBlendMode("ADD")
  arrow:SetVertexColor(0.35, 0.9, 1.0, 1.0)

  local shine = frame:CreateTexture(nil, "OVERLAY")
  shine:SetTexture("Interface\\Cooldown\\star4")
  shine:SetBlendMode("ADD")
  shine:SetVertexColor(0.4, 0.9, 1.0, 0.55)

  local text = frame:CreateFontString(nil, "OVERLAY")
  text:SetFont(Styles.fonts.body, 10, "OUTLINE")
  text:SetTextColor(Styles.colors.muted.r, Styles.colors.muted.g, Styles.colors.muted.b)
  text:SetPoint("TOP", frame, "BOTTOM", 0, -2)

  local resize = CreateFrame("Button", nil, frame)
  resize:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2)
  resize:SetSize(16, 16)
  resize:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
  resize:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
  resize:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
  resize:RegisterForDrag("LeftButton")
  resize:SetScript("OnDragStart", function()
    if settings.locked then
      return
    end
    frame:StartSizing("BOTTOMRIGHT")
  end)
  resize:SetScript("OnDragStop", function()
    frame:StopMovingOrSizing()
    local w = frame:GetWidth()
    settings.size = math.max(70, math.min(160, w))
    BAG.SavedVars:SaveNavSettings(settings)
    Navigation:ApplySize(settings.size)
  end)

  frame:Hide()
  frame:SetScript("OnUpdate", function(_, elapsed)
    Navigation:OnUpdate(elapsed)
  end)

  self.frame = frame
  self.plate = plate
  self.ring = ring
  self.glow = glow
  self.arrow = arrow
  self.shine = shine
  self.text = text
  self.resize = resize
  self:ApplySize(size)
end

function Navigation:ApplySize(size)
  if not self.frame then
    return
  end
  local s = size or 96
  self.frame:SetSize(s, s)
  self.glow:SetSize(s * 1.35, s * 1.35)
  self.glow:SetPoint("CENTER", self.frame, "CENTER", 0, 0)
  self.arrow:SetSize(s * 0.55, s * 0.55)
  self.arrow:SetPoint("CENTER", self.frame, "CENTER", 0, 0)
  self.shine:SetSize(s * 0.9, s * 0.9)
  self.shine:SetPoint("CENTER", self.frame, "CENTER", 0, 0)
end

function Navigation:OnUpdate(elapsed)
  self.elapsed = (self.elapsed or 0) + elapsed
  if self.elapsed < 0.2 then
    return
  end
  self.elapsed = 0
  self:Update()
end

function Navigation:UpdateVisibility()
  local settings = BAG.SavedVars:GetNavSettings()
  if settings.show == false then
    if self.frame then
      self.frame:Hide()
    end
    return
  end
  self:Update()
end

function Navigation:Update()
  if not self.frame then
    return
  end

  local settings = BAG.SavedVars:GetNavSettings()
  if settings.show == false then
    self.frame:Hide()
    return
  end

  local step = BAG.Engine and BAG.Engine:GetCurrentStep()
  if not step or not step.zone or not step.x or not step.y then
    self.frame:Hide()
    return
  end

  local zone, px, py = BAG.API.Map:GetPlayerPosition()
  if not zone or not px or not py then
    self.frame:Hide()
    return
  end

  if zone ~= step.zone then
    self.arrow:SetRotation(0)
    self.text:SetText(step.zone)
    self.frame:Show()
    return
  end

  local dx = step.x - px
  local dy = step.y - py
  local distance = math.sqrt(dx * dx + dy * dy)
  local angle = math.atan2(-dy, dx)
  local facing = GetPlayerFacing() or 0

  self.arrow:SetRotation(angle - facing)
  self.text:SetText(string.format("%.0f map", distance))
  self.frame:Show()
end
