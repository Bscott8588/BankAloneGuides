--[[
    Bank Alone Guides - Logo System
    Text-based SCS branding logo
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Logo = {}

-- Create the logo frame (text-based)
function BAG.Logo:Create(parent)
    local logo = CreateFrame("Frame", "BAG_LogoFrame", parent)
    logo:SetSize(BAG.Layout.Logo.Width, BAG.Layout.Logo.Height)
    
    -- Main text: "BANK ALONE"
    logo.mainText = logo:CreateFontString(nil, "OVERLAY")
    logo.mainText:SetFont(BAG.Theme.Fonts.Title, 14, "OUTLINE")
    logo.mainText:SetText("BANK ALONE")
    logo.mainText:SetTextColor(BAG.Theme:GetColor("Primary"))
    logo.mainText:SetPoint("LEFT", logo, "LEFT", 0, 2)
    
    -- Subtitle: "GUIDES"
    logo.subText = logo:CreateFontString(nil, "OVERLAY")
    logo.subText:SetFont(BAG.Theme.Fonts.Title, 10, "OUTLINE")
    logo.subText:SetText("GUIDES")
    logo.subText:SetTextColor(BAG.Theme:GetColor("Accent"))
    logo.subText:SetPoint("LEFT", logo.mainText, "RIGHT", 4, -1)
    
    -- SCS Badge (small indicator)
    logo.badge = logo:CreateFontString(nil, "OVERLAY")
    logo.badge:SetFont(BAG.Theme.Fonts.Small, 8, "OUTLINE")
    logo.badge:SetText("SCS")
    logo.badge:SetTextColor(BAG.Theme:GetColor("TextDim"))
    logo.badge:SetPoint("TOPLEFT", logo.mainText, "TOPLEFT", 0, 10)
    
    -- Add subtle glow animation
    logo.glow = logo:CreateTexture(nil, "BACKGROUND")
    logo.glow:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    logo.glow:SetBlendMode("ADD")
    logo.glow:SetVertexColor(BAG.Theme:GetColor("Glow"))
    logo.glow:SetPoint("LEFT", logo.mainText, "LEFT", -10, 0)
    logo.glow:SetPoint("RIGHT", logo.subText, "RIGHT", 10, 0)
    logo.glow:SetHeight(24)
    logo.glow:SetAlpha(0.2)
    
    -- Pulse animation for glow
    logo.glowAnim = logo.glow:CreateAnimationGroup()
    local fadeIn = logo.glowAnim:CreateAnimation("Alpha")
    fadeIn:SetFromAlpha(0.1)
    fadeIn:SetToAlpha(0.4)
    fadeIn:SetDuration(2.0)
    fadeIn:SetSmoothing("IN_OUT")
    
    local fadeOut = logo.glowAnim:CreateAnimation("Alpha")
    fadeOut:SetFromAlpha(0.4)
    fadeOut:SetToAlpha(0.1)
    fadeOut:SetDuration(2.0)
    fadeOut:SetSmoothing("IN_OUT")
    fadeOut:SetStartDelay(2.0)
    
    logo.glowAnim:SetLooping("REPEAT")
    logo.glowAnim:Play()
    
    return logo
end

-- Update logo colors (for theme changes)
function BAG.Logo:UpdateColors(logoFrame)
    if logoFrame and logoFrame.mainText then
        logoFrame.mainText:SetTextColor(BAG.Theme:GetColor("Primary"))
        logoFrame.subText:SetTextColor(BAG.Theme:GetColor("Accent"))
        logoFrame.badge:SetTextColor(BAG.Theme:GetColor("TextDim"))
        logoFrame.glow:SetVertexColor(BAG.Theme:GetColor("Glow"))
    end
end
