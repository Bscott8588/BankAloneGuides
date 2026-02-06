local BAG = BankAlone
local UI = BAG.UI
UI.Animations = UI.Animations or {}
local Animations = UI.Animations

function Animations:FadeIn(frame, duration)
  if not frame then
    return
  end
  if UIFrameFadeIn then
    UIFrameFadeIn(frame, duration or 0.2, 0, 1)
  else
    frame:SetAlpha(1)
  end
end

function Animations:FadeOut(frame, duration)
  if not frame then
    return
  end
  if UIFrameFadeOut then
    UIFrameFadeOut(frame, duration or 0.2, 1, 0)
  else
    frame:SetAlpha(0)
  end
end

function Animations:Pulse(frame)
  if not frame then
    return
  end
  frame:SetAlpha(1)
  self:FadeOut(frame, 0.3)
  C_Timer.After(0.35, function()
    self:FadeIn(frame, 0.3)
  end)
end
