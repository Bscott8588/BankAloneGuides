--[[
    Bank Alone Guides - UI Animations
    SCS / Bank Alone Guides
    
    Subtle animations for step transitions, frame show/hide, and progress updates.
]]

local BAG = BankAlone

BAG.UI = BAG.UI or {}
BAG.UI.Animations = BAG.UI.Animations or {}
local Anim = BAG.UI.Animations

-- Fade in a frame
function Anim:FadeIn(frame, duration, callback)
    if not frame then return end
    duration = duration or 0.2

    frame:SetAlpha(0)
    frame:Show()

    local elapsed = 0
    local ticker
    ticker = C_Timer.NewTicker(0.016, function()
        elapsed = elapsed + 0.016
        local progress = math.min(elapsed / duration, 1)
        -- Ease out quad
        local alpha = 1 - (1 - progress) * (1 - progress)
        frame:SetAlpha(alpha)

        if progress >= 1 then
            frame:SetAlpha(1)
            ticker:Cancel()
            if callback then callback() end
        end
    end)
end

-- Fade out a frame
function Anim:FadeOut(frame, duration, callback)
    if not frame then return end
    duration = duration or 0.2

    local startAlpha = frame:GetAlpha()
    local elapsed = 0
    local ticker
    ticker = C_Timer.NewTicker(0.016, function()
        elapsed = elapsed + 0.016
        local progress = math.min(elapsed / duration, 1)
        -- Ease in quad
        local alpha = startAlpha * (1 - progress * progress)
        frame:SetAlpha(math.max(0, alpha))

        if progress >= 1 then
            frame:SetAlpha(0)
            ticker:Cancel()
            if callback then callback() end
        end
    end)
end

-- Slide a frame (used for step transitions)
function Anim:SlideDown(frame, distance, duration, callback)
    if not frame then return end
    distance = distance or 10
    duration = duration or 0.15

    local startAlpha = frame:GetAlpha()
    frame:SetAlpha(0)

    local point, relativeTo, relativePoint, xOfs, yOfs = frame:GetPoint()
    if not point then return end

    local startY = yOfs + distance
    frame:ClearAllPoints()
    frame:SetPoint(point, relativeTo, relativePoint, xOfs, startY)

    local elapsed = 0
    local ticker
    ticker = C_Timer.NewTicker(0.016, function()
        elapsed = elapsed + 0.016
        local progress = math.min(elapsed / duration, 1)
        -- Ease out cubic
        local t = 1 - (1 - progress) ^ 3
        local currentY = startY + (yOfs - startY) * t
        local alpha = t

        frame:ClearAllPoints()
        frame:SetPoint(point, relativeTo, relativePoint, xOfs, currentY)
        frame:SetAlpha(alpha)

        if progress >= 1 then
            frame:ClearAllPoints()
            frame:SetPoint(point, relativeTo, relativePoint, xOfs, yOfs)
            frame:SetAlpha(startAlpha)
            ticker:Cancel()
            if callback then callback() end
        end
    end)
end

-- Flash a frame briefly (for completion feedback)
function Anim:Flash(frame, duration, color)
    if not frame then return end
    duration = duration or 0.3
    color = color or { 0, 0.8, 1, 0.3 }

    -- Create a flash overlay if it doesn't exist
    if not frame._flashOverlay then
        local overlay = frame:CreateTexture(nil, "OVERLAY", nil, 7)
        overlay:SetAllPoints(frame)
        overlay:SetColorTexture(color[1], color[2], color[3], 0)
        frame._flashOverlay = overlay
    end

    local overlay = frame._flashOverlay
    overlay:SetColorTexture(color[1], color[2], color[3], color[4])
    overlay:Show()

    local elapsed = 0
    local ticker
    ticker = C_Timer.NewTicker(0.016, function()
        elapsed = elapsed + 0.016
        local progress = math.min(elapsed / duration, 1)
        local alpha = color[4] * (1 - progress)
        overlay:SetColorTexture(color[1], color[2], color[3], alpha)

        if progress >= 1 then
            overlay:Hide()
            ticker:Cancel()
        end
    end)
end

-- Pulse effect (scale up slightly then back)
function Anim:Pulse(frame, scale, duration)
    if not frame then return end
    scale = scale or 1.05
    duration = duration or 0.3

    local originalScale = frame:GetScale()
    local elapsed = 0
    local ticker
    ticker = C_Timer.NewTicker(0.016, function()
        elapsed = elapsed + 0.016
        local progress = math.min(elapsed / duration, 1)
        -- Sin wave for smooth pulse
        local t = math.sin(progress * math.pi)
        local currentScale = originalScale + (scale - originalScale) * t

        frame:SetScale(currentScale)

        if progress >= 1 then
            frame:SetScale(originalScale)
            ticker:Cancel()
        end
    end)
end

-- Progress bar smooth fill animation
function Anim:AnimateProgress(statusBar, targetValue, duration)
    if not statusBar then return end
    duration = duration or 0.3

    local startValue = statusBar:GetValue()
    local elapsed = 0
    local ticker
    ticker = C_Timer.NewTicker(0.016, function()
        elapsed = elapsed + 0.016
        local progress = math.min(elapsed / duration, 1)
        -- Ease out
        local t = 1 - (1 - progress) ^ 2
        local currentValue = startValue + (targetValue - startValue) * t

        statusBar:SetValue(currentValue)

        if progress >= 1 then
            statusBar:SetValue(targetValue)
            ticker:Cancel()
        end
    end)
end
