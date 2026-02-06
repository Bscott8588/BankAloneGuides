local BAG = BankAlone
BAG.UI.Animations = BAG.UI.Animations or {}

local Animations = BAG.UI.Animations

function Animations:FadeIn(frame, duration)
    if not frame then
        return
    end
    if UIFrameFadeIn then
        UIFrameFadeIn(frame, duration or 0.2, frame:GetAlpha() or 0, 1)
    else
        frame:SetAlpha(1)
    end
end

function Animations:FadeOut(frame, duration)
    if not frame then
        return
    end
    if UIFrameFadeOut then
        UIFrameFadeOut(frame, duration or 0.2, frame:GetAlpha() or 1, 0)
    else
        frame:SetAlpha(0)
    end
end

function Animations:Pulse(frame)
    if not frame then
        return
    end
    if frame.bagPulse then
        frame.bagPulse:Stop()
        frame.bagPulse:Play()
        return
    end
    local group = frame:CreateAnimationGroup()
    local alpha1 = group:CreateAnimation("Alpha")
    alpha1:SetFromAlpha(0.6)
    alpha1:SetToAlpha(1.0)
    alpha1:SetDuration(0.25)
    alpha1:SetOrder(1)
    local alpha2 = group:CreateAnimation("Alpha")
    alpha2:SetFromAlpha(1.0)
    alpha2:SetToAlpha(0.6)
    alpha2:SetDuration(0.25)
    alpha2:SetOrder(2)
    frame.bagPulse = group
    group:Play()
end

