-------------------------------------------------------------------------------
-- Bank Alone Guides — UI / Animations
-- Subtle animations for step transitions and frame effects
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Animations = BAG.Animations or {}

--- Fade a frame in over duration seconds.
-- @param frame     The frame to fade in.
-- @param duration  Fade duration (default 0.25).
-- @param onFinish  Optional callback when done.
function BAG.Animations:FadeIn(frame, duration, onFinish)
    if not frame then return end
    duration = duration or BAG.Theme.Metrics.AnimDuration

    -- Use WoW's UIFrameFadeIn if available
    if UIFrameFadeIn then
        UIFrameFadeIn(frame, duration, frame:GetAlpha(), 1)
        if onFinish then
            C_Timer.After(duration, onFinish)
        end
    else
        frame:SetAlpha(1)
        frame:Show()
        if onFinish then onFinish() end
    end
end

--- Fade a frame out over duration seconds.
-- @param frame     The frame to fade out.
-- @param duration  Fade duration (default 0.25).
-- @param onFinish  Optional callback when done.
function BAG.Animations:FadeOut(frame, duration, onFinish)
    if not frame then return end
    duration = duration or BAG.Theme.Metrics.AnimDuration

    if UIFrameFadeOut then
        UIFrameFadeOut(frame, duration, frame:GetAlpha(), 0)
        if onFinish then
            C_Timer.After(duration, function()
                if onFinish then onFinish() end
            end)
        end
    else
        frame:SetAlpha(0)
        frame:Hide()
        if onFinish then onFinish() end
    end
end

--- Flash a frame briefly (highlight effect for step completion).
-- @param frame     The frame to flash.
-- @param color     Color table for the flash (default Accent).
-- @param duration  Total flash duration (default 0.5).
function BAG.Animations:Flash(frame, color, duration)
    if not frame then return end
    color = color or BAG.Theme.Colors.Accent
    duration = duration or 0.5

    -- Create a temporary overlay
    local overlay = frame:CreateTexture(nil, "OVERLAY")
    overlay:SetTexture(BAG.Theme.Textures.Flat)
    overlay:SetVertexColor(color.r, color.g, color.b, 0.4)
    overlay:SetAllPoints(frame)

    -- Fade the overlay out
    local elapsed = 0
    local ticker
    ticker = C_Timer.NewTicker(0.03, function()
        elapsed = elapsed + 0.03
        local alpha = 0.4 * (1 - (elapsed / duration))
        if alpha <= 0 then
            overlay:Hide()
            overlay:SetParent(nil)
            ticker:Cancel()
        else
            overlay:SetAlpha(alpha)
        end
    end)
end

--- Slide a frame vertically (for step list transitions).
-- @param frame      The frame to slide.
-- @param startY     Starting Y offset.
-- @param endY       Ending Y offset.
-- @param duration   Slide duration.
function BAG.Animations:SlideY(frame, startY, endY, duration)
    if not frame then return end
    duration = duration or BAG.Theme.Metrics.AnimDuration

    local point, relativeTo, relativePoint, xOfs = frame:GetPoint(1)
    if not point then return end

    local elapsed = 0
    local ticker
    ticker = C_Timer.NewTicker(0.02, function()
        elapsed = elapsed + 0.02
        local progress = math.min(1, elapsed / duration)
        -- Ease-out quad
        progress = 1 - (1 - progress) * (1 - progress)
        local currentY = startY + (endY - startY) * progress
        frame:SetPoint(point, relativeTo, relativePoint, xOfs, currentY)
        if elapsed >= duration then
            ticker:Cancel()
        end
    end)
end

--- Pulse a frame's alpha gently (for "active step" indicator).
-- @param frame     The frame to pulse.
-- @param minAlpha  Minimum alpha (default 0.6).
-- @param maxAlpha  Maximum alpha (default 1.0).
-- @param period    Pulse period in seconds (default 2).
-- @return stopFunc  Call this function to stop the pulse.
function BAG.Animations:Pulse(frame, minAlpha, maxAlpha, period)
    if not frame then return function() end end
    minAlpha = minAlpha or 0.6
    maxAlpha = maxAlpha or 1.0
    period = period or 2

    local running = true
    local elapsed = 0
    local ticker = C_Timer.NewTicker(0.03, function()
        if not running or not frame:IsShown() then return end
        elapsed = elapsed + 0.03
        local t = (math.sin(elapsed * 2 * math.pi / period) + 1) / 2
        frame:SetAlpha(minAlpha + t * (maxAlpha - minAlpha))
    end)

    return function()
        running = false
        if ticker then ticker:Cancel() end
        if frame:IsShown() then frame:SetAlpha(maxAlpha) end
    end
end
