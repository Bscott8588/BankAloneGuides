--[[
    Bank Alone Guides - UI Styles
    Centralized styling functions for UI elements
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
BAG.UI.Styles = {}

-- Apply themed backdrop to frame
function BAG.UI.Styles:ApplyFrameBackdrop(frame, style)
    style = style or "default"
    BAG.Theme:ApplyBackdrop(frame, style, true)
end

-- Create themed button
function BAG.UI.Styles:CreateButton(parent, text, width, height)
    local button = CreateFrame("Button", nil, parent)
    button:SetSize(width or 80, height or 24)
    
    -- Backdrop
    BAG.Theme:ApplyBackdrop(button, "default")
    
    -- Text
    local buttonText = button:CreateFontString(nil, "OVERLAY")
    buttonText:SetPoint("CENTER")
    BAG.Theme:ApplyFont(buttonText, "Normal")
    buttonText:SetText(text or "Button")
    button.text = buttonText
    
    -- Hover effect
    button:SetScript("OnEnter", function(self)
        local color = BAG.Theme.Colors.BorderHighlight
        self:SetBackdropBorderColor(color.r, color.g, color.b, color.a)
    end)
    
    button:SetScript("OnLeave", function(self)
        local color = BAG.Theme.Colors.Border
        self:SetBackdropBorderColor(color.r, color.g, color.b, color.a)
    end)
    
    return button
end

-- Create themed scroll frame
function BAG.UI.Styles:CreateScrollFrame(parent, width, height)
    local scrollFrame = CreateFrame("ScrollFrame", nil, parent)
    scrollFrame:SetSize(width, height)
    
    -- Scroll child
    local scrollChild = CreateFrame("Frame", nil, scrollFrame)
    scrollChild:SetSize(width, height)
    scrollFrame:SetScrollChild(scrollChild)
    
    -- Scroll bar
    local scrollBar = CreateFrame("Slider", nil, scrollFrame)
    scrollBar:SetPoint("TOPRIGHT", scrollFrame, "TOPRIGHT", -4, -16)
    scrollBar:SetPoint("BOTTOMRIGHT", scrollFrame, "BOTTOMRIGHT", -4, 16)
    scrollBar:SetWidth(16)
    scrollBar:SetOrientation("VERTICAL")
    scrollBar:SetMinMaxValues(0, 1)
    scrollBar:SetValue(0)
    
    -- Scroll bar backdrop
    BAG.Theme:ApplyBackdrop(scrollBar, "simple")
    local bg = BAG.Theme.Colors.BackgroundLight
    scrollBar:SetBackdropColor(bg.r, bg.g, bg.b, bg.a * 0.5)
    
    -- Scroll bar thumb
    local thumb = scrollBar:CreateTexture(nil, "OVERLAY")
    thumb:SetSize(12, 24)
    thumb:SetTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
    local color = BAG.Theme.Colors.Primary
    thumb:SetVertexColor(color.r, color.g, color.b)
    scrollBar:SetThumbTexture(thumb)
    
    -- Scroll functionality
    scrollBar:SetScript("OnValueChanged", function(self, value)
        local min, max = self:GetMinMaxValues()
        local range = max - min
        if range > 0 then
            scrollChild:SetPoint("TOPLEFT", 0, value)
        end
    end)
    
    -- Mouse wheel support
    scrollFrame:EnableMouseWheel(true)
    scrollFrame:SetScript("OnMouseWheel", function(self, delta)
        local current = scrollBar:GetValue()
        local min, max = scrollBar:GetMinMaxValues()
        local step = (max - min) / 10
        
        if delta < 0 then
            scrollBar:SetValue(math.min(current + step, max))
        else
            scrollBar:SetValue(math.max(current - step, min))
        end
    end)
    
    scrollFrame.scrollBar = scrollBar
    scrollFrame.scrollChild = scrollChild
    
    return scrollFrame
end

-- Create progress bar
function BAG.UI.Styles:CreateProgressBar(parent, width, height)
    local bar = CreateFrame("Frame", nil, parent)
    bar:SetSize(width, height)
    
    -- Background
    BAG.Theme:ApplyBackdrop(bar, "simple")
    local bg = BAG.Theme.Colors.Background
    bar:SetBackdropColor(bg.r, bg.g, bg.b, bg.a)
    
    -- Progress texture
    local progress = bar:CreateTexture(nil, "ARTWORK")
    progress:SetPoint("LEFT")
    progress:SetHeight(height - 4)
    progress:SetWidth(width - 4)
    progress:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
    local color = BAG.Theme.Colors.Primary
    progress:SetVertexColor(color.r, color.g, color.b)
    
    bar.progress = progress
    
    -- Progress text
    local text = bar:CreateFontString(nil, "OVERLAY")
    text:SetPoint("CENTER")
    BAG.Theme:ApplyFont(text, "Small")
    bar.text = text
    
    -- Set progress method
    function bar:SetProgress(value, maxValue)
        local percent = math.min(value / maxValue, 1)
        self.progress:SetWidth((width - 4) * percent)
        self.text:SetText(string.format("%d / %d", value, maxValue))
    end
    
    return bar
end

-- Create icon frame
function BAG.UI.Styles:CreateIcon(parent, size, texture)
    local icon = CreateFrame("Frame", nil, parent)
    icon:SetSize(size, size)
    
    -- Background
    BAG.Theme:ApplyBackdrop(icon, "simple")
    local bg = BAG.Theme.Colors.BackgroundLight
    icon:SetBackdropColor(bg.r, bg.g, bg.b, bg.a)
    
    -- Icon texture
    local tex = icon:CreateTexture(nil, "ARTWORK")
    tex:SetPoint("CENTER")
    tex:SetSize(size - 4, size - 4)
    if texture then
        tex:SetTexture(texture)
    end
    icon.texture = tex
    
    function icon:SetIcon(newTexture)
        self.texture:SetTexture(newTexture)
    end
    
    return icon
end

-- Create separator line
function BAG.UI.Styles:CreateSeparator(parent, width)
    local line = parent:CreateTexture(nil, "ARTWORK")
    line:SetHeight(1)
    line:SetWidth(width)
    line:SetTexture("Interface\\Buttons\\WHITE8X8")
    local color = BAG.Theme.Colors.Border
    line:SetVertexColor(color.r, color.g, color.b, color.a * 0.5)
    
    return line
end

-- Create title text
function BAG.UI.Styles:CreateTitleText(parent, text)
    local title = parent:CreateFontString(nil, "OVERLAY")
    BAG.Theme:ApplyFont(title, "Title")
    title:SetText(text)
    
    return title
end

-- Create heading text
function BAG.UI.Styles:CreateHeadingText(parent, text)
    local heading = parent:CreateFontString(nil, "OVERLAY")
    BAG.Theme:ApplyFont(heading, "Heading")
    heading:SetText(text)
    
    return heading
end

-- Create normal text
function BAG.UI.Styles:CreateNormalText(parent, text)
    local normal = parent:CreateFontString(nil, "OVERLAY")
    BAG.Theme:ApplyFont(normal, "Normal")
    if text then
        normal:SetText(text)
    end
    
    return normal
end

-- Create small text
function BAG.UI.Styles:CreateSmallText(parent, text)
    local small = parent:CreateFontString(nil, "OVERLAY")
    BAG.Theme:ApplyFont(small, "Small")
    if text then
        small:SetText(text)
    end
    
    return small
end

-- Apply glow effect to frame
function BAG.UI.Styles:ApplyGlow(frame)
    if frame.glow then
        return  -- Already has glow
    end
    
    local glow = frame:CreateTexture(nil, "BACKGROUND")
    glow:SetAllPoints()
    glow:SetTexture("Interface\\Buttons\\WHITE8X8")
    local color = BAG.Theme.Colors.Glow
    glow:SetVertexColor(color.r, color.g, color.b, 0)
    glow:SetBlendMode("ADD")
    
    frame.glow = glow
    
    -- Pulse animation
    local ag = glow:CreateAnimationGroup()
    local fadeIn = ag:CreateAnimation("Alpha")
    fadeIn:SetFromAlpha(0)
    fadeIn:SetToAlpha(color.a)
    fadeIn:SetDuration(0.75)
    fadeIn:SetOrder(1)
    
    local fadeOut = ag:CreateAnimation("Alpha")
    fadeOut:SetFromAlpha(color.a)
    fadeOut:SetToAlpha(0)
    fadeOut:SetDuration(0.75)
    fadeOut:SetOrder(2)
    
    ag:SetLooping("REPEAT")
    ag:Play()
    
    frame.glowAnimation = ag
end

-- Remove glow effect
function BAG.UI.Styles:RemoveGlow(frame)
    if frame.glow then
        if frame.glowAnimation then
            frame.glowAnimation:Stop()
        end
        frame.glow:Hide()
        frame.glow = nil
    end
end

-- Create tooltip
function BAG.UI.Styles:ShowTooltip(frame, title, text)
    GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
    
    if title then
        GameTooltip:AddLine(title, 1, 1, 1, true)
    end
    
    if text then
        GameTooltip:AddLine(text, nil, nil, nil, true)
    end
    
    GameTooltip:Show()
end

-- Hide tooltip
function BAG.UI.Styles:HideTooltip()
    GameTooltip:Hide()
end

-- Create checkbox
function BAG.UI.Styles:CreateCheckbox(parent, text)
    local checkbox = CreateFrame("CheckButton", nil, parent)
    checkbox:SetSize(24, 24)
    
    -- Checkbox texture
    checkbox:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
    checkbox:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
    checkbox:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
    checkbox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
    
    -- Label
    if text then
        local label = checkbox:CreateFontString(nil, "OVERLAY")
        label:SetPoint("LEFT", checkbox, "RIGHT", 4, 0)
        BAG.Theme:ApplyFont(label, "Normal")
        label:SetText(text)
        checkbox.label = label
    end
    
    return checkbox
end

-- Create dropdown menu (simple version)
function BAG.UI.Styles:CreateDropdown(parent, width)
    local dropdown = CreateFrame("Frame", nil, parent)
    dropdown:SetSize(width or 150, 32)
    
    BAG.Theme:ApplyBackdrop(dropdown, "default")
    
    local text = dropdown:CreateFontString(nil, "OVERLAY")
    text:SetPoint("LEFT", 8, 0)
    BAG.Theme:ApplyFont(text, "Normal")
    text:SetText("Select...")
    dropdown.text = text
    
    -- Arrow indicator
    local arrow = dropdown:CreateFontString(nil, "OVERLAY")
    arrow:SetPoint("RIGHT", -8, 0)
    BAG.Theme:ApplyFont(arrow, "Normal")
    arrow:SetText("▼")
    
    dropdown:EnableMouse(true)
    dropdown:SetScript("OnEnter", function(self)
        local color = BAG.Theme.Colors.BorderHighlight
        self:SetBackdropBorderColor(color.r, color.g, color.b, color.a)
    end)
    
    dropdown:SetScript("OnLeave", function(self)
        local color = BAG.Theme.Colors.Border
        self:SetBackdropBorderColor(color.r, color.g, color.b, color.a)
    end)
    
    return dropdown
end

print("|cff00B3FF[Bank Alone Guides]|r UI Styles loaded")
