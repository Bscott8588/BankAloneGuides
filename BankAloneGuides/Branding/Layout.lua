--[[
    Bank Alone Guides - Layout Configuration
    Defines layout constants and positioning
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Layout = {
    -- Main Frame Dimensions
    MainFrame = {
        Width = 420,
        Height = 600,
        MinWidth = 350,
        MinHeight = 400,
        MaxWidth = 800,
        MaxHeight = 1000,
        DefaultX = 100,
        DefaultY = -200,
    },
    
    -- Title Bar
    TitleBar = {
        Height = 32,
        ButtonSize = 24,
        ButtonSpacing = 4,
    },
    
    -- Step Panel
    StepPanel = {
        PaddingTop = 40,
        PaddingBottom = 60,
        PaddingSides = 12,
        StepHeight = 60,
        StepSpacing = 6,
        IconSize = 24,
        MaxVisibleSteps = 8,
    },
    
    -- Button Bar
    ButtonBar = {
        Height = 50,
        ButtonWidth = 90,
        ButtonHeight = 32,
        ButtonSpacing = 8,
    },
    
    -- Step Display
    Step = {
        IconSize = 32,
        IconPadding = 8,
        TextPadding = 8,
        ConditionTagHeight = 18,
        CoordFontSize = 10,
    },
    
    -- Logo
    Logo = {
        Width = 120,
        Height = 24,
    },
    
    -- Padding and Margins
    Padding = {
        Small = 4,
        Medium = 8,
        Large = 12,
        XLarge = 16,
    },
    
    -- Z-Layer ordering
    ZLayers = {
        Background = "BACKGROUND",
        Border = "BORDER",
        Artwork = "ARTWORK",
        Overlay = "OVERLAY",
        Highlight = "HIGHLIGHT",
    },
}

-- Helper function to get safe screen position
function BAG.Layout:GetSafePosition(x, y)
    local screenWidth = GetScreenWidth()
    local screenHeight = GetScreenHeight()
    
    x = x or self.MainFrame.DefaultX
    y = y or self.MainFrame.DefaultY
    
    -- Ensure the frame stays on screen
    if x < 0 then x = 0 end
    if x > screenWidth - self.MainFrame.MinWidth then
        x = screenWidth - self.MainFrame.MinWidth
    end
    
    if y > 0 then y = 0 end
    if y < -(screenHeight - self.MainFrame.MinHeight) then
        y = -(screenHeight - self.MainFrame.MinHeight)
    end
    
    return x, y
end

-- Helper function to get frame dimensions
function BAG.Layout:GetDimensions(frameType, savedWidth, savedHeight)
    local config = self[frameType] or self.MainFrame
    
    local width = savedWidth or config.Width
    local height = savedHeight or config.Height
    
    -- Clamp to min/max
    if config.MinWidth and width < config.MinWidth then
        width = config.MinWidth
    end
    if config.MaxWidth and width > config.MaxWidth then
        width = config.MaxWidth
    end
    if config.MinHeight and height < config.MinHeight then
        height = config.MinHeight
    end
    if config.MaxHeight and height > config.MaxHeight then
        height = config.MaxHeight
    end
    
    return width, height
end

-- Calculate step panel content area
function BAG.Layout:GetStepPanelArea(frameWidth, frameHeight)
    local x = self.StepPanel.PaddingSides
    local y = -self.StepPanel.PaddingTop
    local width = frameWidth - (self.StepPanel.PaddingSides * 2)
    local height = frameHeight - self.StepPanel.PaddingTop - self.StepPanel.PaddingBottom
    
    return x, y, width, height
end

-- Calculate how many steps can fit in the panel
function BAG.Layout:GetMaxVisibleSteps(panelHeight)
    local stepTotalHeight = self.StepPanel.StepHeight + self.StepPanel.StepSpacing
    local maxSteps = math.floor(panelHeight / stepTotalHeight)
    
    return math.max(1, math.min(maxSteps, self.StepPanel.MaxVisibleSteps))
end
