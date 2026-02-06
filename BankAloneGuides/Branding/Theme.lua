--[[
    Bank Alone Guides - Theme System
    SCS Neon-Blue Modern Tech Aesthetic
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Theme = {
    -- Primary Colors (Neon Blue Palette)
    Colors = {
        Primary = {0.2, 0.6, 1.0, 1.0},           -- Bright neon blue
        PrimaryDark = {0.1, 0.3, 0.6, 1.0},       -- Darker blue
        Secondary = {0.15, 0.15, 0.25, 0.95},     -- Dark gray-blue background
        SecondaryLight = {0.25, 0.25, 0.35, 0.95},-- Lighter gray-blue
        Accent = {0.3, 0.8, 1.0, 1.0},            -- Bright cyan accent
        Success = {0.2, 1.0, 0.4, 1.0},           -- Bright green
        Warning = {1.0, 0.7, 0.2, 1.0},           -- Orange
        Error = {1.0, 0.2, 0.2, 1.0},             -- Red
        Text = {1.0, 1.0, 1.0, 1.0},              -- White
        TextDim = {0.7, 0.7, 0.8, 1.0},           -- Dimmed white
        TextHighlight = {0.3, 0.8, 1.0, 1.0},     -- Cyan for highlights
        Border = {0.2, 0.6, 1.0, 0.8},            -- Semi-transparent blue border
        Glow = {0.2, 0.6, 1.0, 0.3},              -- Subtle glow effect
        Background = {0.05, 0.05, 0.1, 0.95},     -- Very dark background
        BackgroundDark = {0.03, 0.03, 0.08, 0.98},-- Even darker for contrast
    },
    
    -- Fonts (using WoW's built-in fonts)
    Fonts = {
        Title = "Fonts\\FRIZQT__.TTF",           -- Main title font
        Normal = "Fonts\\FRIZQT__.TTF",          -- Normal text
        Small = "Fonts\\FRIZQT__.TTF",           -- Small text
        Number = "Fonts\\ARIALN.TTF",            -- Numbers and coordinates
    },
    
    -- Font Sizes
    FontSizes = {
        Title = 16,
        Header = 14,
        Normal = 12,
        Small = 10,
        Tiny = 9,
    },
    
    -- Spacing and Layout
    Spacing = {
        Small = 4,
        Medium = 8,
        Large = 12,
        XLarge = 16,
    },
    
    -- Border Settings
    Border = {
        Texture = "Interface\\Tooltips\\UI-Tooltip-Border",
        EdgeSize = 16,
        Insets = {left = 4, right = 4, top = 4, bottom = 4},
        GlowSize = 2,
    },
    
    -- Background Settings
    Background = {
        Texture = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
        TileSize = 32,
    },
    
    -- Animation Settings
    Animation = {
        FadeSpeed = 0.15,
        SlideSpeed = 0.2,
        GlowSpeed = 1.0,
    },
}

-- Helper function to apply color to a frame
function BAG.Theme:ApplyColor(frame, colorKey)
    local color = self.Colors[colorKey]
    if color and frame.SetBackdropColor then
        frame:SetBackdropColor(unpack(color))
    end
end

-- Helper function to apply border color
function BAG.Theme:ApplyBorderColor(frame, colorKey)
    local color = self.Colors[colorKey]
    if color and frame.SetBackdropBorderColor then
        frame:SetBackdropBorderColor(unpack(color))
    end
end

-- Helper function to create a font string with theme
function BAG.Theme:CreateFontString(parent, layer, sizeKey, colorKey)
    local fs = parent:CreateFontString(nil, layer or "OVERLAY")
    local size = self.FontSizes[sizeKey] or self.FontSizes.Normal
    local color = self.Colors[colorKey] or self.Colors.Text
    
    fs:SetFont(self.Fonts.Normal, size, "OUTLINE")
    fs:SetTextColor(unpack(color))
    
    return fs
end

-- Helper function to get RGB color values (0-1 range)
function BAG.Theme:GetColor(colorKey)
    return unpack(self.Colors[colorKey] or self.Colors.Text)
end

-- Helper function to get RGB as byte values (0-255 range)
function BAG.Theme:GetColorBytes(colorKey)
    local r, g, b, a = unpack(self.Colors[colorKey] or self.Colors.Text)
    return r * 255, g * 255, b * 255, (a or 1) * 255
end

-- Helper function to convert hex color to RGBA
function BAG.Theme:HexToRGBA(hex)
    hex = hex:gsub("#", "")
    local r = tonumber("0x" .. hex:sub(1,2)) / 255
    local g = tonumber("0x" .. hex:sub(3,4)) / 255
    local b = tonumber("0x" .. hex:sub(5,6)) / 255
    local a = 1.0
    if #hex == 8 then
        a = tonumber("0x" .. hex:sub(7,8)) / 255
    end
    return r, g, b, a
end

-- Create a themed backdrop configuration
function BAG.Theme:GetBackdrop(withBorder)
    if withBorder == nil then withBorder = true end
    
    local backdrop = {
        bgFile = self.Background.Texture,
        edgeFile = withBorder and self.Border.Texture or nil,
        tile = true,
        tileSize = self.Background.TileSize,
        edgeSize = withBorder and self.Border.EdgeSize or 0,
        insets = withBorder and self.Border.Insets or {left = 0, right = 0, top = 0, bottom = 0},
    }
    
    return backdrop
end

-- Apply complete theme to a frame
function BAG.Theme:StyleFrame(frame, options)
    options = options or {}
    
    -- Apply backdrop
    local backdrop = self:GetBackdrop(options.border ~= false)
    frame:SetBackdrop(backdrop)
    
    -- Apply colors
    self:ApplyColor(frame, options.bgColor or "Background")
    
    if options.border ~= false then
        self:ApplyBorderColor(frame, options.borderColor or "Border")
    end
    
    return frame
end

-- Create a glow effect on a frame
function BAG.Theme:AddGlow(frame)
    if not frame.glow then
        frame.glow = frame:CreateTexture(nil, "BACKGROUND")
        frame.glow:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
        frame.glow:SetPoint("TOPLEFT", frame, "TOPLEFT", -10, 10)
        frame.glow:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 10, -10)
        frame.glow:SetBlendMode("ADD")
        frame.glow:SetVertexColor(self:GetColor("Glow"))
        frame.glow:SetAlpha(0.5)
    end
    return frame.glow
end
