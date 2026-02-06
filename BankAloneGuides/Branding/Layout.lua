-------------------------------------------------------------------------------
-- Bank Alone Guides — Branding / Layout
-- Layout constants and frame dimensions
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Layout = BAG.Layout or {}

-- ── Main frame defaults ────────────────────────────────────────────────────
BAG.Layout.MainFrame = {
    DefaultWidth   = 340,
    DefaultHeight  = 480,
    MinWidth       = 280,
    MinHeight      = 300,
    MaxWidth       = 600,
    MaxHeight      = 800,
    DefaultPoint   = { "RIGHT", UIParent, "RIGHT", -40, 0 },
}

-- ── Title bar ──────────────────────────────────────────────────────────────
BAG.Layout.TitleBar = {
    Height      = 30,
    PaddingX    = 10,
    PaddingY    = 4,
    ButtonSize  = 20,
    ButtonGap   = 4,
}

-- ── Step panel ─────────────────────────────────────────────────────────────
BAG.Layout.StepPanel = {
    PaddingX       = 10,
    PaddingY       = 8,
    StepHeight     = 60,      -- height per step row
    StepGap        = 4,
    IconSize       = 22,
    VisibleSteps   = 6,       -- how many steps to show at once
    TagHeight      = 14,
    TagPaddingX    = 4,
    CoordFontSize  = 10,
}

-- ── Buttons bar (bottom) ──────────────────────────────────────────────────
BAG.Layout.ButtonBar = {
    Height      = 36,
    PaddingX    = 10,
    PaddingY    = 6,
    ButtonWidth = 80,
    ButtonHeight= 24,
    ButtonGap   = 8,
}

-- ── Progress bar ──────────────────────────────────────────────────────────
BAG.Layout.ProgressBar = {
    Height = 6,
    Inset  = 10,
}

-- ── General spacing ───────────────────────────────────────────────────────
BAG.Layout.Padding = {
    Small   = 4,
    Medium  = 8,
    Large   = 12,
    XLarge  = 16,
}
