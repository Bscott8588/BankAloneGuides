--[[
    Bank Alone Guides - UI Animations
    Provides smooth animations for UI elements
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
BAG.UI.Animations = {}

-- Fade in animation
function BAG.UI.Animations:FadeIn(frame, duration, callback)
    duration = duration or BAG.Theme.Animation.FadeInDuration
    
    if not frame.fadeGroup then
        frame.fadeGroup = frame:CreateAnimationGroup()
        frame.fadeAnim = frame.fadeGroup:CreateAnimation("Alpha")
    end
    
    frame:SetAlpha(0)
    frame:Show()
    
    frame.fadeAnim:SetFromAlpha(0)
    frame.fadeAnim:SetToAlpha(1)
    frame.fadeAnim:SetDuration(duration)
    frame.fadeAnim:SetSmoothing("IN")
    
    if callback then
        frame.fadeGroup:SetScript("OnFinished", callback)
    end
    
    frame.fadeGroup:Play()
end

-- Fade out animation
function BAG.UI.Animations:FadeOut(frame, duration, callback)
    duration = duration or BAG.Theme.Animation.FadeOutDuration
    
    if not frame.fadeGroup then
        frame.fadeGroup = frame:CreateAnimationGroup()
        frame.fadeAnim = frame.fadeGroup:CreateAnimation("Alpha")
    end
    
    frame.fadeAnim:SetFromAlpha(1)
    frame.fadeAnim:SetToAlpha(0)
    frame.fadeAnim:SetDuration(duration)
    frame.fadeAnim:SetSmoothing("OUT")
    
    frame.fadeGroup:SetScript("OnFinished", function()
        frame:Hide()
        if callback then
            callback()
        end
    end)
    
    frame.fadeGroup:Play()
end

-- Slide in animation
function BAG.UI.Animations:SlideIn(frame, direction, duration, callback)
    direction = direction or "RIGHT"  -- RIGHT, LEFT, UP, DOWN
    duration = duration or BAG.Theme.Animation.SlideDuration
    
    if not frame.slideGroup then
        frame.slideGroup = frame:CreateAnimationGroup()
        frame.slideAnim = frame.slideGroup:CreateAnimation("Translation")
    end
    
    local width, height = frame:GetSize()
    local offsetX, offsetY = 0, 0
    
    if direction == "RIGHT" then
        offsetX = -width
    elseif direction == "LEFT" then
        offsetX = width
    elseif direction == "UP" then
        offsetY = -height
    elseif direction == "DOWN" then
        offsetY = height
    end
    
    frame:SetPoint("CENTER", offsetX, offsetY)
    frame:Show()
    
    frame.slideAnim:SetOffset(-offsetX, -offsetY)
    frame.slideAnim:SetDuration(duration)
    frame.slideAnim:SetSmoothing("IN_OUT")
    
    if callback then
        frame.slideGroup:SetScript("OnFinished", callback)
    end
    
    frame.slideGroup:Play()
end

-- Pulse animation (scale)
function BAG.UI.Animations:Pulse(frame, scale, duration, loops)
    scale = scale or 1.1
    duration = duration or 0.3
    loops = loops or 1
    
    if not frame.pulseGroup then
        frame.pulseGroup = frame:CreateAnimationGroup()
        frame.pulseScaleUp = frame.pulseGroup:CreateAnimation("Scale")
        frame.pulseScaleDown = frame.pulseGroup:CreateAnimation("Scale")
    end
    
    -- Scale up
    frame.pulseScaleUp:SetScale(scale, scale)
    frame.pulseScaleUp:SetDuration(duration)
    frame.pulseScaleUp:SetOrder(1)
    frame.pulseScaleUp:SetSmoothing("IN")
    
    -- Scale down
    frame.pulseScaleDown:SetScale(1/scale, 1/scale)
    frame.pulseScaleDown:SetDuration(duration)
    frame.pulseScaleDown:SetOrder(2)
    frame.pulseScaleDown:SetSmoothing("OUT")
    
    if loops > 1 then
        frame.pulseGroup:SetLooping("REPEAT")
    else
        frame.pulseGroup:SetLooping("NONE")
    end
    
    frame.pulseGroup:Play()
end

-- Shake animation
function BAG.UI.Animations:Shake(frame, intensity, duration)
    intensity = intensity or 5
    duration = duration or 0.5
    
    if not frame.shakeGroup then
        frame.shakeGroup = frame:CreateAnimationGroup()
    else
        frame.shakeGroup:Stop()
        -- Clear old animations
        local animations = {frame.shakeGroup:GetAnimations()}
        for _, anim in ipairs(animations) do
            frame.shakeGroup:Remove(anim)
        end
    end
    
    local numShakes = 8
    local shakeDuration = duration / numShakes
    
    for i = 1, numShakes do
        local anim = frame.shakeGroup:CreateAnimation("Translation")
        anim:SetOffset(
            math.random(-intensity, intensity),
            math.random(-intensity, intensity)
        )
        anim:SetDuration(shakeDuration)
        anim:SetOrder(i)
    end
    
    frame.shakeGroup:Play()
end

-- Rotate animation
function BAG.UI.Animations:Rotate(frame, degrees, duration, callback)
    degrees = degrees or 360
    duration = duration or 1.0
    
    if not frame.rotateGroup then
        frame.rotateGroup = frame:CreateAnimationGroup()
        frame.rotateAnim = frame.rotateGroup:CreateAnimation("Rotation")
    end
    
    frame.rotateAnim:SetDegrees(degrees)
    frame.rotateAnim:SetDuration(duration)
    frame.rotateAnim:SetSmoothing("IN_OUT")
    
    if callback then
        frame.rotateGroup:SetScript("OnFinished", callback)
    end
    
    frame.rotateGroup:Play()
end

-- Glow pulse animation
function BAG.UI.Animations:GlowPulse(frame)
    if not frame.glow then
        BAG.UI.Styles:ApplyGlow(frame)
    end
    
    -- Already set up in ApplyGlow
    if frame.glowAnimation then
        frame.glowAnimation:Play()
    end
end

-- Stop glow pulse
function BAG.UI.Animations:StopGlow(frame)
    BAG.UI.Styles:RemoveGlow(frame)
end

-- Progress bar fill animation
function BAG.UI.Animations:FillProgressBar(progressBar, fromValue, toValue, maxValue, duration)
    duration = duration or 0.5
    
    if not progressBar.progress then
        return
    end
    
    local fromWidth = (progressBar:GetWidth() - 4) * (fromValue / maxValue)
    local toWidth = (progressBar:GetWidth() - 4) * (toValue / maxValue)
    
    if not progressBar.fillGroup then
        progressBar.fillGroup = progressBar.progress:CreateAnimationGroup()
        progressBar.fillAnim = progressBar.fillGroup:CreateAnimation("Translation")
    end
    
    progressBar.progress:SetWidth(fromWidth)
    
    progressBar.fillAnim:SetOffset(toWidth - fromWidth, 0)
    progressBar.fillAnim:SetDuration(duration)
    progressBar.fillAnim:SetSmoothing("IN_OUT")
    
    progressBar.fillGroup:Play()
    
    -- Update text
    if progressBar.text then
        progressBar.text:SetText(string.format("%d / %d", toValue, maxValue))
    end
end

-- Number count-up animation
function BAG.UI.Animations:CountUp(fontString, fromValue, toValue, duration)
    duration = duration or 1.0
    
    local startTime = GetTime()
    local endTime = startTime + duration
    
    local function UpdateNumber()
        local now = GetTime()
        if now >= endTime then
            fontString:SetText(tostring(toValue))
            return
        end
        
        local progress = (now - startTime) / duration
        local currentValue = fromValue + (toValue - fromValue) * progress
        fontString:SetText(string.format("%d", math.floor(currentValue)))
        
        C_Timer.After(0.03, UpdateNumber)
    end
    
    UpdateNumber()
end

-- Flash animation
function BAG.UI.Animations:Flash(frame, duration, count)
    duration = duration or 0.3
    count = count or 3
    
    if not frame.flashGroup then
        frame.flashGroup = frame:CreateAnimationGroup()
        frame.flashFadeOut = frame.flashGroup:CreateAnimation("Alpha")
        frame.flashFadeIn = frame.flashGroup:CreateAnimation("Alpha")
    end
    
    frame.flashFadeOut:SetFromAlpha(1)
    frame.flashFadeOut:SetToAlpha(0)
    frame.flashFadeOut:SetDuration(duration / 2)
    frame.flashFadeOut:SetOrder(1)
    
    frame.flashFadeIn:SetFromAlpha(0)
    frame.flashFadeIn:SetToAlpha(1)
    frame.flashFadeIn:SetDuration(duration / 2)
    frame.flashFadeIn:SetOrder(2)
    
    if count > 1 then
        frame.flashGroup:SetLooping("REPEAT")
        C_Timer.After(duration * count, function()
            frame.flashGroup:Stop()
            frame:SetAlpha(1)
        end)
    else
        frame.flashGroup:SetLooping("NONE")
    end
    
    frame.flashGroup:Play()
end

-- Bounce animation
function BAG.UI.Animations:Bounce(frame, height, duration)
    height = height or 20
    duration = duration or 0.5
    
    if not frame.bounceGroup then
        frame.bounceGroup = frame:CreateAnimationGroup()
        frame.bounceUp = frame.bounceGroup:CreateAnimation("Translation")
        frame.bounceDown = frame.bounceGroup:CreateAnimation("Translation")
    end
    
    frame.bounceUp:SetOffset(0, height)
    frame.bounceUp:SetDuration(duration / 2)
    frame.bounceUp:SetOrder(1)
    frame.bounceUp:SetSmoothing("OUT")
    
    frame.bounceDown:SetOffset(0, -height)
    frame.bounceDown:SetDuration(duration / 2)
    frame.bounceDown:SetOrder(2)
    frame.bounceDown:SetSmoothing("IN")
    
    frame.bounceGroup:Play()
end

-- Stop all animations on a frame
function BAG.UI.Animations:StopAll(frame)
    if frame.fadeGroup then
        frame.fadeGroup:Stop()
    end
    if frame.slideGroup then
        frame.slideGroup:Stop()
    end
    if frame.pulseGroup then
        frame.pulseGroup:Stop()
    end
    if frame.shakeGroup then
        frame.shakeGroup:Stop()
    end
    if frame.rotateGroup then
        frame.rotateGroup:Stop()
    end
    if frame.flashGroup then
        frame.flashGroup:Stop()
    end
    if frame.bounceGroup then
        frame.bounceGroup:Stop()
    end
end

-- Animate step completion
function BAG.UI.Animations:AnimateStepComplete(stepFrame)
    -- Flash green
    local originalBG = stepFrame:GetBackdropColor()
    local success = BAG.Theme.Colors.Success
    stepFrame:SetBackdropColor(success.r, success.g, success.b, success.a * 0.3)
    
    C_Timer.After(0.5, function()
        stepFrame:SetBackdropColor(originalBG)
    end)
    
    -- Pulse
    self:Pulse(stepFrame, 1.05, 0.3, 1)
end

-- Animate guide complete
function BAG.UI.Animations:AnimateGuideComplete(mainFrame)
    -- Flash and pulse
    self:Flash(mainFrame, 0.4, 3)
    
    -- Show completion message
    -- TODO: Create fancy completion popup
end

print("|cff00B3FF[Bank Alone Guides]|r UI Animations loaded")
