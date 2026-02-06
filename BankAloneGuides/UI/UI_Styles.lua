--[[
    Bank Alone Guides - UI Styles
    SCS / Bank Alone Guides
    
    Centralized colors, fonts, spacing, and style constants.
    Neon-blue SCS tech aesthetic.
]]

local BAG = BankAlone

BAG.UI = BAG.UI or {}
BAG.UI.Styles = BAG.UI.Styles or {}
local Styles = BAG.UI.Styles

-- ============================================================
-- COLOR PALETTE - Neon Blue SCS Theme
-- ============================================================
Styles.Colors = {
    -- Primary neon blue
    primary     = { 0.00, 0.80, 1.00, 1.00 },
    primaryDim  = { 0.00, 0.55, 0.80, 1.00 },

    -- Secondary dark blue-gray
    secondary   = { 0.08, 0.12, 0.18, 0.95 },
    secondaryLt = { 0.12, 0.18, 0.25, 0.95 },

    -- Accent glow
    accent      = { 0.30, 0.90, 1.00, 0.80 },
    accentDim   = { 0.15, 0.60, 0.80, 0.50 },

    -- Background
    bgDark      = { 0.05, 0.07, 0.10, 0.92 },
    bgMedium    = { 0.08, 0.12, 0.16, 0.90 },
    bgLight     = { 0.12, 0.16, 0.22, 0.88 },
    bgStep      = { 0.10, 0.14, 0.20, 0.85 },
    bgStepActive= { 0.05, 0.20, 0.30, 0.90 },

    -- Text
    textWhite   = { 1.00, 1.00, 1.00, 1.00 },
    textLight   = { 0.85, 0.90, 0.95, 1.00 },
    textMuted   = { 0.55, 0.60, 0.65, 1.00 },
    textHighlight={ 0.00, 0.90, 1.00, 1.00 },

    -- Status colors
    complete    = { 0.00, 0.85, 0.30, 1.00 },
    incomplete  = { 1.00, 0.80, 0.00, 1.00 },
    error       = { 1.00, 0.20, 0.20, 1.00 },

    -- Borders
    borderNeon  = { 0.00, 0.70, 0.90, 0.70 },
    borderDim   = { 0.15, 0.25, 0.35, 0.60 },

    -- Progress bar
    progressFill = { 0.00, 0.75, 1.00, 0.90 },
    progressBg   = { 0.05, 0.08, 0.12, 0.80 },

    -- Buttons
    btnNormal   = { 0.10, 0.20, 0.30, 0.90 },
    btnHover    = { 0.15, 0.30, 0.45, 0.95 },
    btnPressed  = { 0.05, 0.15, 0.25, 0.95 },
    btnDisabled = { 0.08, 0.10, 0.14, 0.70 },
}

-- ============================================================
-- FONTS
-- ============================================================
Styles.Fonts = {
    title    = { font = "Fonts\\FRIZQT__.TTF", size = 14, flags = "" },
    header   = { font = "Fonts\\FRIZQT__.TTF", size = 12, flags = "" },
    normal   = { font = "Fonts\\FRIZQT__.TTF", size = 11, flags = "" },
    small    = { font = "Fonts\\FRIZQT__.TTF", size = 10, flags = "" },
    tiny     = { font = "Fonts\\FRIZQT__.TTF", size = 9, flags = "" },
    bold     = { font = "Fonts\\FRIZQT__.TTF", size = 11, flags = "OUTLINE" },
    coords   = { font = "Fonts\\ARIALN.TTF",   size = 10, flags = "OUTLINE" },
}

-- ============================================================
-- SPACING & LAYOUT
-- ============================================================
Styles.Layout = {
    framePadding    = 8,
    innerPadding    = 6,
    stepSpacing     = 4,
    buttonHeight    = 24,
    buttonSpacing   = 6,
    titleBarHeight  = 28,
    progressBarH    = 6,
    borderThickness = 1.5,
    cornerRadius    = 0, -- WoW doesn't support rounded corners natively
    stepIconSize    = 18,
}

-- ============================================================
-- HELPER FUNCTIONS
-- ============================================================

-- Apply color to a texture
function Styles:ApplyColor(texture, colorName)
    local c = self.Colors[colorName]
    if c and texture then
        texture:SetColorTexture(c[1], c[2], c[3], c[4])
    end
end

-- Apply font to a font string
function Styles:ApplyFont(fontString, fontName)
    local f = self.Fonts[fontName]
    if f and fontString then
        fontString:SetFont(f.font, f.size, f.flags)
    end
end

-- Apply text color to a font string
function Styles:ApplyTextColor(fontString, colorName)
    local c = self.Colors[colorName]
    if c and fontString then
        fontString:SetTextColor(c[1], c[2], c[3], c[4])
    end
end

-- Create a colored background texture for a frame
function Styles:CreateBackground(frame, colorName)
    local bg = frame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(frame)
    local c = self.Colors[colorName] or self.Colors.bgDark
    bg:SetColorTexture(c[1], c[2], c[3], c[4])
    return bg
end

-- Create a border around a frame
function Styles:CreateBorder(frame, colorName, thickness)
    thickness = thickness or self.Layout.borderThickness
    local c = self.Colors[colorName] or self.Colors.borderNeon

    local borders = {}

    -- Top
    local top = frame:CreateTexture(nil, "OVERLAY")
    top:SetColorTexture(c[1], c[2], c[3], c[4])
    top:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    top:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    top:SetHeight(thickness)
    borders.top = top

    -- Bottom
    local bottom = frame:CreateTexture(nil, "OVERLAY")
    bottom:SetColorTexture(c[1], c[2], c[3], c[4])
    bottom:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
    bottom:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
    bottom:SetHeight(thickness)
    borders.bottom = bottom

    -- Left
    local left = frame:CreateTexture(nil, "OVERLAY")
    left:SetColorTexture(c[1], c[2], c[3], c[4])
    left:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    left:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
    left:SetWidth(thickness)
    borders.left = left

    -- Right
    local right = frame:CreateTexture(nil, "OVERLAY")
    right:SetColorTexture(c[1], c[2], c[3], c[4])
    right:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    right:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
    right:SetWidth(thickness)
    borders.right = right

    return borders
end

-- Create a neon glow line (subtle accent)
function Styles:CreateGlowLine(frame, point, colorName)
    local c = self.Colors[colorName] or self.Colors.accentDim
    local glow = frame:CreateTexture(nil, "ARTWORK")
    glow:SetColorTexture(c[1], c[2], c[3], c[4])
    glow:SetHeight(1)

    if point == "TOP" then
        glow:SetPoint("TOPLEFT", frame, "TOPLEFT", 2, -1)
        glow:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -2, -1)
    elseif point == "BOTTOM" then
        glow:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 2, 1)
        glow:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 1)
    end

    return glow
end
