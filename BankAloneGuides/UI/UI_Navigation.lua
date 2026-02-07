local BAG = BankAlone
local UI = BAG.UI
UI.Navigation = UI.Navigation or {}
local Navigation = UI.Navigation
local Styles = UI.Styles

function Navigation:Initialize(parent)
  if self.frame then
    return
  end

  local frame = CreateFrame("Frame", nil, parent.content)
  frame:SetSize(36, 36)
  frame:SetPoint("TOPRIGHT", parent.content, "TOPRIGHT", 0, 0)

  local arrow = frame:CreateTexture(nil, "ARTWORK")
  arrow:SetAllPoints(frame)
  arrow:SetTexture("Interface\\Minimap\\MinimapArrow")

  local text = frame:CreateFontString(nil, "OVERLAY")
  text:SetFont(Styles.fonts.body, 9)
  text:SetTextColor(Styles.colors.muted.r, Styles.colors.muted.g, Styles.colors.muted.b)
  text:SetPoint("TOP", frame, "BOTTOM", 0, -2)

  frame:Hide()
  frame:SetScript("OnUpdate", function(_, elapsed)
    Navigation:OnUpdate(elapsed)
  end)

  self.frame = frame
  self.arrow = arrow
  self.text = text
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
  local settings = BAG.SavedVars:GetUISettings()
  if settings.showArrow == false then
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

  local settings = BAG.SavedVars:GetUISettings()
  if settings.showArrow == false then
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
  self.text:SetText(string.format("%.1f map", distance))
  self.frame:Show()
end
