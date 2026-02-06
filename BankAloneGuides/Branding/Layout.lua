--[[
    Bank Alone Guides - Layout Constants
    SCS / Bank Alone Guides
    
    Defines default layout values for the UI system.
]]

local BAG = BankAlone

BAG.Branding = BAG.Branding or {}
BAG.Branding.Layout = BAG.Branding.Layout or {}
local BLayout = BAG.Branding.Layout

-- Default frame dimensions
BLayout.DEFAULT_WIDTH = 340
BLayout.DEFAULT_HEIGHT = 480
BLayout.MIN_WIDTH = 280
BLayout.MIN_HEIGHT = 300
BLayout.MAX_WIDTH = 500
BLayout.MAX_HEIGHT = 700

-- Padding and margins
BLayout.FRAME_PADDING = 8
BLayout.INNER_PADDING = 6
BLayout.SECTION_SPACING = 10

-- Title bar
BLayout.TITLE_BAR_HEIGHT = 28

-- Step panel
BLayout.STEP_ROW_HEIGHT = 52
BLayout.STEP_ROW_SPACING = 4
BLayout.STEP_ICON_SIZE = 18
BLayout.MAX_VISIBLE_STEPS = 8

-- Buttons
BLayout.BUTTON_HEIGHT = 24
BLayout.BUTTON_SPACING = 6
BLayout.BUTTON_BAR_HEIGHT = 32

-- Progress bar
BLayout.PROGRESS_BAR_HEIGHT = 6

-- Fonts
BLayout.FONT_SIZE_TITLE = 14
BLayout.FONT_SIZE_HEADER = 12
BLayout.FONT_SIZE_NORMAL = 11
BLayout.FONT_SIZE_SMALL = 10
BLayout.FONT_SIZE_TINY = 9
