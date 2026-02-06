--[[
    Bank Alone Guides - Theme System
    Defines the neon-blue SCS branding theme for the addon
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"

-- Create namespace
BankAlone = BankAlone or {}
local BAG = BankAlone
BAG.Theme = {}

-- SCS Neon-Blue Color Palette
BAG.Theme.Colors = {
    -- Primary Colors
    Primary = {r = 0.0, g = 0.7, b = 1.0, a = 1.0},          -- Bright neon blue
    PrimaryDark = {r = 0.0, g = 0.4, b = 0.7, a = 1.0},      -- Darker blue
    PrimaryLight = {r = 0.4, g = 0.85, b = 1.0, a = 1.0},    -- Light blue
    
    -- Secondary Colors
    Secondary = {r = 0.15, g = 0.15, b = 0.2, a = 0.95},     -- Dark blue-gray background
    SecondaryLight = {r = 0.2, g = 0.22, b = 0.28, a = 1.0}, -- Lighter gray
    
    -- Accent Colors
    Accent = {r = 0.0, g = 0.9, b = 1.0, a = 1.0},           -- Bright cyan accent
    Glow = {r = 0.2, g = 0.8, b = 1.0, a = 0.5},             -- Subtle glow effect
    
    -- Status Colors
    Success = {r = 0.0, g = 0.8, b = 0.4, a = 1.0},          -- Green for complete
    Warning = {r = 1.0, g = 0.7, b = 0.0, a = 1.0},          -- Orange for warning
    Error = {r = 1.0, g = 0.2, b = 0.2, a = 1.0},            -- Red for error
    Info = {r = 0.6, g = 0.8, b = 1.0, a = 1.0},             -- Light blue for info
    
    -- Text Colors
    TextPrimary = {r = 1.0, g = 1.0, b = 1.0, a = 1.0},      -- White text
    TextSecondary = {r = 0.7, g = 0.8, b = 0.9, a = 1.0},    -- Light gray text
    TextAccent = {r = 0.4, g = 0.9, b = 1.0, a = 1.0},       -- Cyan text
    TextDisabled = {r = 0.4, g = 0.4, b = 0.5, a = 1.0},     -- Disabled text
    
    -- UI Element Colors
    Border = {r = 0.0, g = 0.6, b = 0.9, a = 1.0},           -- Border color
    BorderHighlight = {r = 0.2, g = 0.9, b = 1.0, a = 1.0},  -- Highlighted border
    Background = {r = 0.05, g = 0.05, b = 0.1, a = 0.95},    -- Main background
    BackgroundLight = {r = 0.1, g = 0.12, b = 0.18, a = 1.0},-- Lighter background
    
    -- Step Type Colors
    Quest = {r = 1.0, g = 0.82, b = 0.0, a = 1.0},           -- Gold for quests
    Kill = {r = 1.0, g = 0.3, b = 0.3, a = 1.0},             -- Red for kill
    Collect = {r = 0.5, g = 0.8, b = 0.3, a = 1.0},          -- Green for collect
    Travel = {r = 0.3, g = 0.7, b = 1.0, a = 1.0},           -- Blue for travel
    Train = {r = 0.8, g = 0.5, b = 1.0, a = 1.0},            -- Purple for training
    Vendor = {r = 0.9, g = 0.7, b = 0.4, a = 1.0},           -- Orange for vendor
}

-- Font Settings
BAG.Theme.Fonts = {
    Title = {
        font = "Fonts\\FRIZQT__.TTF",
        size = 16,
        flags = "OUTLINE",
        color = BAG.Theme.Colors.Primary
    },
    Heading = {
        font = "Fonts\\FRIZQT__.TTF",
        size = 14,
        flags = "OUTLINE",
        color = BAG.Theme.Colors.TextPrimary
    },
    Normal = {
        font = "Fonts\\ARIALN.TTF",
        size = 12,
        flags = "",
        color = BAG.Theme.Colors.TextPrimary
    },
    Small = {
        font = "Fonts\\ARIALN.TTF",
        size = 10,
        flags = "",
        color = BAG.Theme.Colors.TextSecondary
    },
    Code = {
        font = "Fonts\\ARIALN.TTF",
        size = 11,
        flags = "MONOCHROME",
        color = BAG.Theme.Colors.Accent
    }
}

-- Border Settings
BAG.Theme.Border = {
    Texture = "Interface\\Tooltips\\UI-Tooltip-Border",
    EdgeSize = 16,
    Insets = {left = 4, right = 4, top = 4, bottom = 4},
    Color = BAG.Theme.Colors.Border,
    HighlightColor = BAG.Theme.Colors.BorderHighlight
}

-- Background Settings
BAG.Theme.Background = {
    Texture = "Interface\\DialogFrame\\UI-DialogBox-Background",
    TileSize = 32,
    Color = BAG.Theme.Colors.Background
}

-- Animation Settings
BAG.Theme.Animation = {
    FadeInDuration = 0.2,
    FadeOutDuration = 0.15,
    SlideDuration = 0.25,
    GlowPulseDuration = 1.5
}

-- Spacing and Layout
BAG.Theme.Spacing = {
    Padding = 8,
    PaddingSmall = 4,
    PaddingLarge = 12,
    Margin = 6,
    MarginSmall = 3,
    MarginLarge = 10,
    ButtonSpacing = 4,
    SectionSpacing = 12
}

-- Helper Functions
function BAG.Theme:GetColor(colorName)
    return self.Colors[colorName] or self.Colors.TextPrimary
end

function BAG.Theme:ApplyColor(frame, colorName)
    local color = self:GetColor(colorName)
    if frame.SetVertexColor then
        frame:SetVertexColor(color.r, color.g, color.b, color.a)
    elseif frame.SetTextColor then
        frame:SetTextColor(color.r, color.g, color.b, color.a)
    elseif frame.SetBackdropBorderColor then
        frame:SetBackdropBorderColor(color.r, color.g, color.b, color.a)
    end
end

function BAG.Theme:ApplyFont(fontString, fontType)
    local font = self.Fonts[fontType] or self.Fonts.Normal
    fontString:SetFont(font.font, font.size, font.flags)
    if font.color then
        fontString:SetTextColor(font.color.r, font.color.g, font.color.b, font.color.a)
    end
end

function BAG.Theme:ColorToHex(color)
    return string.format("|cff%02x%02x%02x", 
        math.floor(color.r * 255),
        math.floor(color.g * 255),
        math.floor(color.b * 255))
end

function BAG.Theme:ColorText(text, colorName)
    local color = self:GetColor(colorName)
    local hex = self:ColorToHex(color)
    return hex .. text .. "|r"
end

-- Create standard backdrop configurations
function BAG.Theme:GetBackdrop(style)
    style = style or "default"
    
    local backdrops = {
        default = {
            bgFile = self.Background.Texture,
            edgeFile = self.Border.Texture,
            tile = true,
            tileSize = self.Background.TileSize,
            edgeSize = self.Border.EdgeSize,
            insets = self.Border.Insets
        },
        simple = {
            bgFile = self.Background.Texture,
            tile = true,
            tileSize = 16,
            edgeSize = 0
        },
        tooltip = {
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true,
            tileSize = 16,
            edgeSize = 16,
            insets = {left = 4, right = 4, top = 4, bottom = 4}
        }
    }
    
    return backdrops[style] or backdrops.default
end

-- Apply themed backdrop to a frame
function BAG.Theme:ApplyBackdrop(frame, style, applyColors)
    applyColors = applyColors ~= false  -- default true
    
    local backdrop = self:GetBackdrop(style)
    frame:SetBackdrop(backdrop)
    
    if applyColors then
        local bg = self.Colors.Background
        local border = self.Colors.Border
        frame:SetBackdropColor(bg.r, bg.g, bg.b, bg.a)
        frame:SetBackdropBorderColor(border.r, border.g, border.b, border.a)
    end
end

print("|cff00B3FF[Bank Alone Guides]|r Theme system loaded")
