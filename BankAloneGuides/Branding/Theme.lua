-------------------------------------------------------------------------------
-- Bank Alone Guides — Branding / Theme
-- SCS neon-blue tech aesthetic
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Theme = BAG.Theme or {}

-- ── Primary palette ─────────────────────────────────────────────────────────
BAG.Theme.Colors = {
    Primary       = { r = 0.00, g = 0.70, b = 1.00, a = 1 },   -- Neon blue
    PrimaryDark   = { r = 0.00, g = 0.40, b = 0.70, a = 1 },   -- Deep blue
    PrimaryLight  = { r = 0.40, g = 0.85, b = 1.00, a = 1 },   -- Light blue
    Secondary     = { r = 0.12, g = 0.14, b = 0.18, a = 0.92 }, -- Dark charcoal
    SecondaryLight= { r = 0.18, g = 0.22, b = 0.28, a = 1 },   -- Medium gray
    Accent        = { r = 0.00, g = 1.00, b = 0.85, a = 1 },   -- Cyan glow
    Background    = { r = 0.08, g = 0.10, b = 0.14, a = 0.95 }, -- Near black
    BackgroundAlt = { r = 0.10, g = 0.13, b = 0.18, a = 0.90 }, -- Slightly lighter
    Text          = { r = 0.90, g = 0.92, b = 0.96, a = 1 },   -- Off-white
    TextDim       = { r = 0.55, g = 0.58, b = 0.65, a = 1 },   -- Muted
    TextHighlight = { r = 0.00, g = 0.85, b = 1.00, a = 1 },   -- Bright blue
    Success       = { r = 0.20, g = 0.85, b = 0.35, a = 1 },   -- Green
    Warning       = { r = 1.00, g = 0.75, b = 0.20, a = 1 },   -- Amber
    Error         = { r = 1.00, g = 0.30, b = 0.30, a = 1 },   -- Red
    Border        = { r = 0.00, g = 0.50, b = 0.80, a = 0.70 }, -- Blue border
    BorderGlow    = { r = 0.00, g = 0.70, b = 1.00, a = 0.35 }, -- Glow effect
    StepActive    = { r = 0.00, g = 0.70, b = 1.00, a = 0.18 }, -- Active row highlight
    StepComplete  = { r = 0.20, g = 0.85, b = 0.35, a = 0.12 }, -- Completed row
}

-- ── Step-type accent colors ────────────────────────────────────────────────
BAG.Theme.StepColors = {
    accept   = { r = 1.00, g = 0.82, b = 0.00 },  -- Gold
    turnin   = { r = 0.20, g = 0.85, b = 0.35 },  -- Green
    kill     = { r = 1.00, g = 0.30, b = 0.30 },  -- Red
    collect  = { r = 0.80, g = 0.50, b = 1.00 },  -- Purple
    travel   = { r = 0.40, g = 0.85, b = 1.00 },  -- Cyan
    train    = { r = 1.00, g = 0.65, b = 0.20 },  -- Orange
    vendor   = { r = 0.60, g = 0.80, b = 0.30 },  -- Yellow-green
    note     = { r = 0.70, g = 0.75, b = 0.80 },  -- Gray
    fly      = { r = 0.40, g = 0.85, b = 1.00 },  -- Cyan
    hearth   = { r = 0.60, g = 0.40, b = 1.00 },  -- Violet
    use      = { r = 0.80, g = 0.50, b = 1.00 },  -- Purple
    equip    = { r = 0.00, g = 0.70, b = 1.00 },  -- Blue
    buy      = { r = 0.60, g = 0.80, b = 0.30 },  -- Yellow-green
}

-- ── Fonts ──────────────────────────────────────────────────────────────────
BAG.Theme.Fonts = {
    Title    = { face = "Fonts\\FRIZQT__.TTF", size = 14, flags = "OUTLINE" },
    Normal   = { face = "Fonts\\FRIZQT__.TTF", size = 12, flags = "" },
    Small    = { face = "Fonts\\FRIZQT__.TTF", size = 10, flags = "" },
    Bold     = { face = "Fonts\\FRIZQT__.TTF", size = 12, flags = "OUTLINE" },
    Header   = { face = "Fonts\\MORPHEUS.TTF", size = 16, flags = "OUTLINE" },
    Tiny     = { face = "Fonts\\ARIALN.TTF",   size = 9,  flags = "" },
}

-- ── Textures (WoW built-ins) ──────────────────────────────────────────────
BAG.Theme.Textures = {
    Background      = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
    Border          = "Interface\\Tooltips\\UI-Tooltip-Border",
    TitleBar        = "Interface\\DialogFrame\\UI-DialogBox-Header",
    Highlight       = "Interface\\QuestFrame\\UI-QuestTitleHighlight",
    Flat            = "Interface\\Buttons\\WHITE8X8",
    ProgressBar     = "Interface\\TargetingFrame\\UI-StatusBar",
    GlowOverlay     = "Interface\\SpellActivationOverlay\\IconAlert",
    CheckMark       = "Interface\\RaidFrame\\ReadyCheck-Ready",
    ArrowRight      = "Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up",
    ArrowLeft       = "Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up",
    MinimizeButton  = "Interface\\Buttons\\UI-Panel-CollapseButton-Up",
    CloseButton     = "Interface\\Buttons\\UI-Panel-MinimizeButton-Up",
}

-- ── Metrics ────────────────────────────────────────────────────────────────
BAG.Theme.Metrics = {
    BorderSize     = 1,
    CornerRadius   = 0,  -- WoW doesn't support true corners; we fake it
    GlowSize       = 3,
    AnimDuration   = 0.25,
}

-- Helper: unpack a color table into r,g,b,a
function BAG.Theme:RGBA(color)
    return color.r, color.g, color.b, color.a or 1
end

-- Helper: create a hex string from a color table
function BAG.Theme:Hex(color)
    return string.format("|cff%02x%02x%02x",
        math.floor(color.r * 255),
        math.floor(color.g * 255),
        math.floor(color.b * 255))
end

-- Helper: colorize text
function BAG.Theme:Colorize(text, color)
    return self:Hex(color) .. text .. "|r"
end
