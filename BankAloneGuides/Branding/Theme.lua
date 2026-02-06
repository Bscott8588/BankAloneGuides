--[[
    Bank Alone Guides - Theme
    SCS / Bank Alone Guides
    
    Defines the neon-blue SCS theme and provides theming utilities.
]]

local BAG = BankAlone

BAG.Branding = BAG.Branding or {}
local Branding = BAG.Branding

-- Theme definition
Branding.Theme = {
    name = "SCS Neon Blue",
    colors = {
        primary      = { r = 0.00, g = 0.80, b = 1.00 },
        primaryDark  = { r = 0.00, g = 0.55, b = 0.80 },
        secondary    = { r = 0.08, g = 0.12, b = 0.18 },
        accent       = { r = 0.30, g = 0.90, b = 1.00 },
        background   = { r = 0.05, g = 0.07, b = 0.10 },
        surface      = { r = 0.10, g = 0.14, b = 0.20 },
        text         = { r = 1.00, g = 1.00, b = 1.00 },
        textSecondary= { r = 0.70, g = 0.75, b = 0.80 },
        success      = { r = 0.00, g = 0.85, b = 0.30 },
        warning      = { r = 1.00, g = 0.80, b = 0.00 },
        danger       = { r = 1.00, g = 0.20, b = 0.20 },
    },
    fonts = {
        primary = "Fonts\\FRIZQT__.TTF",
        secondary = "Fonts\\ARIALN.TTF",
    },
    brandName = "Bank Alone Guides",
    brandShort = "BAG",
    brandTagline = "SCS Premium Guides",
    hexPrimary = "00CCFF",
    hexAccent  = "4DE6FF",
}

-- Apply theme to the UI (called during initialization)
function Branding:ApplyTheme()
    -- Theme is applied through UI_Styles.lua constants
    -- This function can be extended for dynamic theme switching
    BAG:Debug("SCS Neon Blue theme applied")
end

-- Get a theme color as r, g, b
function Branding:GetColor(name)
    local color = self.Theme.colors[name]
    if color then
        return color.r, color.g, color.b
    end
    return 1, 1, 1
end

-- Get a theme color as hex string
function Branding:GetHexColor(name)
    local r, g, b = self:GetColor(name)
    return string.format("%02X%02X%02X", r * 255, g * 255, b * 255)
end

-- Colorize text with primary brand color
function Branding:BrandText(text)
    return "|cFF" .. self.Theme.hexPrimary .. text .. "|r"
end

-- Get branded addon name
function Branding:GetBrandedName()
    return self:BrandText(self.Theme.brandName)
end
