--[[
    Bank Alone Guides - UI Animations
    Smooth animations for UI transitions
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.UI.Animations = {}

-- Fade in animation
function BAG.UI.Animations:FadeIn(frame, duration, callback)
    duration = duration or BAG.Theme.Animation.FadeSpeed
    
    if not frame or not frame.CreateAnimationGroup then
        return
    end
    
    -- Stop any existing animations
    if frame.fadeAnim then
        frame.fadeAnim:Stop()
    end
    
    -- Create animation group
    frame.fadeAnim = frame:CreateAnimationGroup()
    
    local fade = frame.fadeAnim:CreateAnimation("Alpha")
    fade:SetFromAlpha(0)
    fade:SetToAlpha(1)
    fade:SetDuration(duration)
    fade:SetSmoothing("IN")
    
    if callback then
        frame.fadeAnim:SetScript("OnFinished", callback)
    end
    
    frame:SetAlpha(0)
    frame:Show()
    frame.fadeAnim:Play()
end

-- Fade out animation
function BAG.UI.Animations:FadeOut(frame, duration, callback)
    duration = duration or BAG.Theme.Animation.FadeSpeed
    
    if not frame or not frame.CreateAnimationGroup then
        if callback then callback() end
        return
    end
    
    -- Stop any existing animations
    if frame.fadeAnim then
        frame.fadeAnim:Stop()
    end
    
    -- Create animation group
    frame.fadeAnim = frame:CreateAnimationGroup()
    
    local fade = frame.fadeAnim:CreateAnimation("Alpha")
    fade:SetFromAlpha(frame:GetAlpha())
    fade:SetToAlpha(0)
    fade:SetDuration(duration)
    fade:SetSmoothing("OUT")
    
    frame.fadeAnim:SetScript("OnFinished", function()
        frame:Hide()
        if callback then callback() end
    end)
    
    frame.fadeAnim:Play()
end

-- Slide in animation
function BAG.UI.Animations:SlideIn(frame, direction, duration, callback)
    direction = direction or "DOWN" -- UP, DOWN, LEFT, RIGHT
    duration = duration or BAG.Theme.Animation.SlideSpeed
    
    if not frame or not frame.CreateAnimationGroup then
        return
    end
    
    -- Stop any existing animations
    if frame.slideAnim then
        frame.slideAnim:Stop()
    end
    
    -- Create animation group
    frame.slideAnim = frame:CreateAnimationGroup()
    
    local slide = frame.slideAnim:CreateAnimation("Translation")
    slide:SetDuration(duration)
    slide:SetSmoothing("IN_OUT")
    
    -- Set offset based on direction
    local offset = 50
    if direction == "UP" then
        slide:SetOffset(0, offset)
    elseif direction == "DOWN" then
        slide:SetOffset(0, -offset)
    elseif direction == "LEFT" then
        slide:SetOffset(offset, 0)
    elseif direction == "RIGHT" then
        slide:SetOffset(-offset, 0)
    end
    
    if callback then
        frame.slideAnim:SetScript("OnFinished", callback)
    end
    
    frame:Show()
    frame.slideAnim:Play()
end

-- Pulse animation (for highlighting)
function BAG.UI.Animations:Pulse(frame, duration, callback)
    duration = duration or 0.5
    
    if not frame or not frame.CreateAnimationGroup then
        return
    end
    
    -- Stop any existing animations
    if frame.pulseAnim then
        frame.pulseAnim:Stop()
    end
    
    -- Create animation group
    frame.pulseAnim = frame:CreateAnimationGroup()
    
    -- Scale up
    local scaleUp = frame.pulseAnim:CreateAnimation("Scale")
    scaleUp:SetScale(1.1, 1.1)
    scaleUp:SetDuration(duration / 2)
    scaleUp:SetSmoothing("IN")
    
    -- Scale down
    local scaleDown = frame.pulseAnim:CreateAnimation("Scale")
    scaleDown:SetScale(0.909, 0.909) -- Back to 1.0 (1/1.1)
    scaleDown:SetDuration(duration / 2)
    scaleDown:SetSmoothing("OUT")
    scaleDown:SetStartDelay(duration / 2)
    
    if callback then
        frame.pulseAnim:SetScript("OnFinished", callback)
    end
    
    frame.pulseAnim:Play()
end

-- Glow pulse animation
function BAG.UI.Animations:GlowPulse(frame, duration)
    duration = duration or BAG.Theme.Animation.GlowSpeed
    
    if not frame or not frame.CreateAnimationGroup then
        return
    end
    
    -- Add glow if not exists
    local glow = BAG.UI.Styles:AddGlow(frame)
    
    -- Stop any existing animations
    if glow.pulseAnim then
        glow.pulseAnim:Stop()
    end
    
    -- Create animation group
    glow.pulseAnim = glow:CreateAnimationGroup()
    glow.pulseAnim:SetLooping("REPEAT")
    
    -- Fade in
    local fadeIn = glow.pulseAnim:CreateAnimation("Alpha")
    fadeIn:SetFromAlpha(0.2)
    fadeIn:SetToAlpha(0.6)
    fadeIn:SetDuration(duration / 2)
    fadeIn:SetSmoothing("IN_OUT")
    
    -- Fade out
    local fadeOut = glow.pulseAnim:CreateAnimation("Alpha")
    fadeOut:SetFromAlpha(0.6)
    fadeOut:SetToAlpha(0.2)
    fadeOut:SetDuration(duration / 2)
    fadeOut:SetSmoothing("IN_OUT")
    fadeOut:SetStartDelay(duration / 2)
    
    glow.pulseAnim:Play()
end

-- Stop all animations on a frame
function BAG.UI.Animations:StopAll(frame)
    if not frame then return end
    
    if frame.fadeAnim then
        frame.fadeAnim:Stop()
    end
    
    if frame.slideAnim then
        frame.slideAnim:Stop()
    end
    
    if frame.pulseAnim then
        frame.pulseAnim:Stop()
    end
    
    if frame.glow and frame.glow.pulseAnim then
        frame.glow.pulseAnim:Stop()
    end
end

-- Shake animation (for errors or warnings)
function BAG.UI.Animations:Shake(frame, duration, callback)
    duration = duration or 0.3
    
    if not frame or not frame.CreateAnimationGroup then
        return
    end
    
    -- Stop any existing animations
    if frame.shakeAnim then
        frame.shakeAnim:Stop()
    end
    
    -- Create animation group
    frame.shakeAnim = frame:CreateAnimationGroup()
    
    local shakeAmount = 10
    local steps = 4
    local stepDuration = duration / steps
    
    for i = 1, steps do
        local shake = frame.shakeAnim:CreateAnimation("Translation")
        shake:SetDuration(stepDuration)
        shake:SetStartDelay((i - 1) * stepDuration)
        
        if i % 2 == 1 then
            shake:SetOffset(shakeAmount, 0)
        else
            shake:SetOffset(-shakeAmount, 0)
        end
    end
    
    if callback then
        frame.shakeAnim:SetScript("OnFinished", callback)
    end
    
    frame.shakeAnim:Play()
end

-- Smooth scroll animation
function BAG.UI.Animations:SmoothScroll(scrollFrame, targetScroll, duration, callback)
    duration = duration or 0.3
    
    if not scrollFrame or not scrollFrame.SetVerticalScroll then
        return
    end
    
    local startScroll = scrollFrame:GetVerticalScroll()
    local scrollDelta = targetScroll - startScroll
    
    local elapsed = 0
    local ticker
    
    ticker = C_Timer.NewTicker(0.01, function()
        elapsed = elapsed + 0.01
        
        if elapsed >= duration then
            scrollFrame:SetVerticalScroll(targetScroll)
            ticker:Cancel()
            if callback then callback() end
            return
        end
        
        local progress = elapsed / duration
        -- Ease in-out
        progress = progress < 0.5 and 2 * progress * progress or 1 - math.pow(-2 * progress + 2, 2) / 2
        
        local currentScroll = startScroll + (scrollDelta * progress)
        scrollFrame:SetVerticalScroll(currentScroll)
    end)
end

-- Flash animation (for notifications)
function BAG.UI.Animations:Flash(frame, count, duration, callback)
    count = count or 3
    duration = duration or 0.2
    
    if not frame or not frame.CreateAnimationGroup then
        return
    end
    
    -- Stop any existing animations
    if frame.flashAnim then
        frame.flashAnim:Stop()
    end
    
    -- Create animation group
    frame.flashAnim = frame:CreateAnimationGroup()
    
    for i = 1, count do
        -- Flash on
        local flashOn = frame.flashAnim:CreateAnimation("Alpha")
        flashOn:SetFromAlpha(frame:GetAlpha())
        flashOn:SetToAlpha(1)
        flashOn:SetDuration(duration / 2)
        flashOn:SetStartDelay((i - 1) * duration)
        
        -- Flash off
        local flashOff = frame.flashAnim:CreateAnimation("Alpha")
        flashOff:SetFromAlpha(1)
        flashOff:SetToAlpha(frame:GetAlpha())
        flashOff:SetDuration(duration / 2)
        flashOff:SetStartDelay((i - 1) * duration + duration / 2)
    end
    
    if callback then
        frame.flashAnim:SetScript("OnFinished", callback)
    end
    
    frame.flashAnim:Play()
end

-- Step transition animation
function BAG.UI.Animations:StepTransition(stepPanel, callback)
    if not stepPanel then
        if callback then callback() end
        return
    end
    
    -- Fade out current steps
    self:FadeOut(stepPanel, 0.1, function()
        -- Update step content
        stepPanel:Update()
        
        -- Fade back in
        self:FadeIn(stepPanel, 0.15, callback)
    end)
end
