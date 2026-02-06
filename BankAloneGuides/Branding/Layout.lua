--[[
    Bank Alone Guides - Layout Configuration
    Defines layout constants and positioning for UI elements
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
BAG.Layout = {}

-- Main Frame Dimensions
BAG.Layout.MainFrame = {
    DefaultWidth = 380,
    DefaultHeight = 500,
    MinWidth = 300,
    MinHeight = 350,
    MaxWidth = 600,
    MaxHeight = 800,
    
    -- Default position (center-right of screen)
    DefaultX = -50,
    DefaultY = 0,
    DefaultPoint = "RIGHT",
    DefaultRelativePoint = "RIGHT"
}

-- Title Bar
BAG.Layout.TitleBar = {
    Height = 32,
    Padding = 8,
    ButtonSize = 20,
    ButtonSpacing = 4
}

-- Step Panel
BAG.Layout.StepPanel = {
    Padding = 10,
    StepHeight = 60,
    StepSpacing = 6,
    IconSize = 32,
    MaxVisibleSteps = 5,
    
    -- Step elements
    IconPadding = 6,
    TextPadding = 8,
    CoordWidth = 80,
    
    -- Progress indicator
    ProgressBarHeight = 4,
    ProgressBarPadding = 2
}

-- Button Bar
BAG.Layout.ButtonBar = {
    Height = 40,
    Padding = 8,
    ButtonWidth = 80,
    ButtonHeight = 24,
    ButtonSpacing = 6
}

-- Tooltip
BAG.Layout.Tooltip = {
    MaxWidth = 300,
    Padding = 8,
    LineSpacing = 2
}

-- Minimap Button
BAG.Layout.MinimapButton = {
    Size = 32,
    DefaultAngle = 200  -- degrees
}

-- Step Type Icons (using built-in WoW icons)
BAG.Layout.StepIcons = {
    accept = "Interface\\GossipFrame\\AvailableQuestIcon",
    turnin = "Interface\\GossipFrame\\ActiveQuestIcon",
    kill = "Interface\\Icons\\Ability_DualWield",
    collect = "Interface\\Icons\\INV_Misc_Bag_08",
    goto = "Interface\\Icons\\Ability_Tracking",
    fly = "Interface\\Icons\\Ability_Mount_JungleTiger",
    fp = "Interface\\TaxiFrame\\UI-TaxiNode-Neutral",
    hs = "Interface\\Icons\\INV_Misc_Rune_01",
    train = "Interface\\Icons\\INV_Scroll_03",
    vendor = "Interface\\Icons\\INV_Misc_Coin_01",
    buy = "Interface\\Icons\\INV_Misc_Coin_02",
    use = "Interface\\Icons\\INV_Misc_Gear_01",
    equip = "Interface\\Icons\\INV_Chest_Plate01",
    note = "Interface\\Icons\\INV_Misc_Note_01",
    boat = "Interface\\Icons\\Spell_Frost_SummonWaterElemental",
    zeppelin = "Interface\\Icons\\Spell_Nature_AstralRecal",
    run = "Interface\\Icons\\Ability_Rogue_Sprint",
    mount = "Interface\\Icons\\Ability_Mount_RidingHorse",
    profession = "Interface\\Icons\\Trade_Engineering",
    default = "Interface\\Icons\\INV_Misc_QuestionMark"
}

-- Get icon for step type
function BAG.Layout:GetStepIcon(stepType)
    return self.StepIcons[stepType] or self.StepIcons.default
end

-- Calculate step panel scroll height
function BAG.Layout:GetStepPanelScrollHeight(numSteps)
    return numSteps * (self.StepPanel.StepHeight + self.StepPanel.StepSpacing)
end

-- Get main frame default position
function BAG.Layout:GetDefaultPosition()
    return {
        point = self.MainFrame.DefaultPoint,
        relativeTo = UIParent,
        relativePoint = self.MainFrame.DefaultRelativePoint,
        x = self.MainFrame.DefaultX,
        y = self.MainFrame.DefaultY
    }
end

-- Helper to calculate centered position
function BAG.Layout:GetCenteredPosition(width, height)
    return {
        point = "CENTER",
        relativeTo = UIParent,
        relativePoint = "CENTER",
        x = 0,
        y = 0
    }
end

-- Z-ordering
BAG.Layout.ZOrder = {
    Background = 1,
    Content = 2,
    Overlay = 3,
    Tooltip = 4,
    Dialog = 5
}

print("|cff00B3FF[Bank Alone Guides]|r Layout configuration loaded")
