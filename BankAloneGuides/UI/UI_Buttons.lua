local BAG = BankAlone
local UI = BAG.UI
UI.Buttons = UI.Buttons or {}
local Buttons = UI.Buttons
local Layout = BAG.Branding.Layout

local function CreateButton(parent, label, width)
  local btn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
  btn:SetText(label)
  btn:SetSize(width or 80, 20)
  return btn
end

function Buttons:Initialize(parent)
  if self.frame then
    return
  end
  local frame = CreateFrame("Frame", nil, parent.content)
  frame:SetPoint("BOTTOMLEFT", parent.content, "BOTTOMLEFT", 0, 0)
  frame:SetPoint("BOTTOMRIGHT", parent.content, "BOTTOMRIGHT", 0, 0)
  frame:SetHeight(24)

  local prev = CreateButton(frame, "Prev", 70)
  prev:SetPoint("LEFT", frame, "LEFT", 0, 0)
  prev:SetScript("OnClick", function()
    BAG.Engine:PreviousStep()
  end)

  local nextBtn = CreateButton(frame, "Next", 70)
  nextBtn:SetPoint("LEFT", prev, "RIGHT", 6, 0)
  nextBtn:SetScript("OnClick", function()
    BAG.Engine:NextStep()
  end)

  local reevaluate = CreateButton(frame, "Re-check", 80)
  reevaluate:SetPoint("LEFT", nextBtn, "RIGHT", 6, 0)
  reevaluate:SetScript("OnClick", function()
    BAG.Engine:EvaluateCurrentStep()
  end)

  local options = CreateButton(frame, "Options", 80)
  options:SetPoint("RIGHT", frame, "RIGHT", 0, 0)
  options:SetScript("OnClick", function()
    local settings = BAG.SavedVars:GetUISettings()
    settings.locked = not settings.locked
    if settings.locked then
      DEFAULT_CHAT_FRAME:AddMessage("BAG: Frame locked.")
    else
      DEFAULT_CHAT_FRAME:AddMessage("BAG: Frame unlocked.")
    end
  end)

  self.frame = frame
end
