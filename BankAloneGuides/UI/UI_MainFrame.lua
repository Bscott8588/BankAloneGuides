--[[
    Bank Alone Guides - Main Frame
    Creates the main guide window
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
BAG.UI.MainFrame = {}

-- Create main frame
function BAG.UI.MainFrame:Create()
    local frame = CreateFrame("Frame", "BAG_MainFrame", UIParent)
    
    -- Set initial size and position
    frame:SetSize(BAG.Layout.MainFrame.DefaultWidth, 
                 BAG.Layout.MainFrame.DefaultHeight)
    
    local defaultPos = BAG.Layout:GetDefaultPosition()
    frame:SetPoint(defaultPos.point, defaultPos.relativeTo, 
                  defaultPos.relativePoint, defaultPos.x, defaultPos.y)
    
    -- Make movable
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:SetClampedToScreen(true)
    frame:SetResizable(true)
    
    -- Apply backdrop
    BAG.Theme:ApplyBackdrop(frame, "default")
    
    -- Set frame strata and level
    frame:SetFrameStrata("MEDIUM")
    frame:SetFrameLevel(10)
    
    -- Create title bar
    self:CreateTitleBar(frame)
    
    -- Create content area
    self:CreateContentArea(frame)
    
    -- Create button bar
    self:CreateButtonBar(frame)
    
    -- Create resize grip
    self:CreateResizeGrip(frame)
    
    -- Save on hide
    frame:SetScript("OnHide", function()
        BAG.UI:SaveSettings()
    end)
    
    return frame
end

-- Create title bar
function BAG.UI.MainFrame:CreateTitleBar(frame)
    local titleBar = CreateFrame("Frame", nil, frame)
    titleBar:SetPoint("TOPLEFT", 0, 0)
    titleBar:SetPoint("TOPRIGHT", 0, 0)
    titleBar:SetHeight(BAG.Layout.TitleBar.Height)
    
    -- Backdrop
    BAG.Theme:ApplyBackdrop(titleBar, "simple")
    local bg = BAG.Theme.Colors.SecondaryLight
    titleBar:SetBackdropColor(bg.r, bg.g, bg.b, bg.a)
    
    -- Logo
    local logo = BAG.Logo:Create(titleBar)
    logo:SetPoint("LEFT", BAG.Layout.TitleBar.Padding, 0)
    
    -- Close button
    local closeButton = CreateFrame("Button", nil, titleBar)
    closeButton:SetSize(BAG.Layout.TitleBar.ButtonSize, BAG.Layout.TitleBar.ButtonSize)
    closeButton:SetPoint("TOPRIGHT", -BAG.Layout.TitleBar.Padding, -6)
    closeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
    closeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    closeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
    closeButton:SetScript("OnClick", function()
        BAG.UI:Hide()
    end)
    
    -- Minimize button (toggle compact mode)
    local minimizeButton = CreateFrame("Button", nil, titleBar)
    minimizeButton:SetSize(BAG.Layout.TitleBar.ButtonSize, BAG.Layout.TitleBar.ButtonSize)
    minimizeButton:SetPoint("RIGHT", closeButton, "LEFT", -BAG.Layout.TitleBar.ButtonSpacing, 0)
    minimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
    minimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Highlight")
    minimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
    minimizeButton:SetScript("OnClick", function()
        BAG.UI:ToggleCompactMode()
    end)
    
    -- Options button
    local optionsButton = CreateFrame("Button", nil, titleBar)
    optionsButton:SetSize(BAG.Layout.TitleBar.ButtonSize, BAG.Layout.TitleBar.ButtonSize)
    optionsButton:SetPoint("RIGHT", minimizeButton, "LEFT", -BAG.Layout.TitleBar.ButtonSpacing, 0)
    optionsButton:SetNormalTexture("Interface\\Buttons\\UI-OptionsButton")
    optionsButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
    optionsButton:SetScript("OnClick", function()
        BAG.UI:ShowOptions()
    end)
    
    -- Make title bar draggable
    titleBar:EnableMouse(true)
    titleBar:RegisterForDrag("LeftButton")
    titleBar:SetScript("OnDragStart", function()
        frame:StartMoving()
    end)
    titleBar:SetScript("OnDragStop", function()
        frame:StopMovingOrSizing()
        BAG.UI:SaveSettings()
    end)
    
    frame.titleBar = titleBar
    frame.closeButton = closeButton
    frame.minimizeButton = minimizeButton
    frame.optionsButton = optionsButton
end

-- Create content area
function BAG.UI.MainFrame:CreateContentArea(frame)
    local content = CreateFrame("Frame", nil, frame)
    content:SetPoint("TOPLEFT", 0, -BAG.Layout.TitleBar.Height)
    content:SetPoint("BOTTOMRIGHT", 0, BAG.Layout.ButtonBar.Height)
    
    -- Progress bar at top
    local progressBar = BAG.UI.Styles:CreateProgressBar(content, 
        BAG.Layout.MainFrame.DefaultWidth - 20, 
        BAG.Layout.StepPanel.ProgressBarHeight)
    progressBar:SetPoint("TOP", content, "TOP", 0, -10)
    content.progressBar = progressBar
    
    -- Guide title
    local guideTitle = BAG.UI.Styles:CreateHeadingText(content, "No Guide Loaded")
    guideTitle:SetPoint("TOP", progressBar, "BOTTOM", 0, -8)
    content.guideTitle = guideTitle
    
    -- Step panel
    local stepPanel = BAG.UI.StepPanel:Create(content)
    stepPanel:SetPoint("TOPLEFT", 10, -40)
    stepPanel:SetPoint("BOTTOMRIGHT", -10, 10)
    content.stepPanel = stepPanel
    
    frame.content = content
    
    -- Update content
    function frame:UpdateContent()
        local progress = BAG.Engine:GetProgress()
        
        -- Update title
        self.content.guideTitle:SetText(progress.guideTitle)
        
        -- Update progress bar
        self.content.progressBar:SetProgress(progress.currentStep, progress.totalSteps)
    end
end

-- Create button bar
function BAG.UI.MainFrame:CreateButtonBar(frame)
    local buttonBar = CreateFrame("Frame", nil, frame)
    buttonBar:SetPoint("BOTTOMLEFT", 0, 0)
    buttonBar:SetPoint("BOTTOMRIGHT", 0, 0)
    buttonBar:SetHeight(BAG.Layout.ButtonBar.Height)
    
    -- Backdrop
    BAG.Theme:ApplyBackdrop(buttonBar, "simple")
    local bg = BAG.Theme.Colors.SecondaryLight
    buttonBar:SetBackdropColor(bg.r, bg.g, bg.b, bg.a)
    
    -- Previous button
    local prevButton = BAG.UI.Styles:CreateButton(buttonBar, "< Prev", 
        BAG.Layout.ButtonBar.ButtonWidth, BAG.Layout.ButtonBar.ButtonHeight)
    prevButton:SetPoint("LEFT", BAG.Layout.ButtonBar.Padding, 0)
    prevButton:SetScript("OnClick", function()
        BAG.Engine:PreviousStep()
    end)
    
    -- Next button
    local nextButton = BAG.UI.Styles:CreateButton(buttonBar, "Next >", 
        BAG.Layout.ButtonBar.ButtonWidth, BAG.Layout.ButtonBar.ButtonHeight)
    nextButton:SetPoint("RIGHT", -BAG.Layout.ButtonBar.Padding, 0)
    nextButton:SetScript("OnClick", function()
        BAG.Engine:NextStep()
    end)
    
    -- Re-evaluate button
    local revalButton = BAG.UI.Styles:CreateButton(buttonBar, "Check", 
        BAG.Layout.ButtonBar.ButtonWidth - 20, BAG.Layout.ButtonBar.ButtonHeight)
    revalButton:SetPoint("CENTER", 0, 0)
    revalButton:SetScript("OnClick", function()
        BAG.Engine:UpdateSteps()
        BAG.Logo:Print("Checking step conditions...")
    end)
    
    frame.buttonBar = buttonBar
    frame.prevButton = prevButton
    frame.nextButton = nextButton
    frame.revalButton = revalButton
end

-- Create resize grip
function BAG.UI.MainFrame:CreateResizeGrip(frame)
    local grip = CreateFrame("Button", nil, frame)
    grip:SetSize(16, 16)
    grip:SetPoint("BOTTOMRIGHT", -2, 2)
    
    local texture = grip:CreateTexture(nil, "OVERLAY")
    texture:SetAllPoints()
    texture:SetTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    local color = BAG.Theme.Colors.Primary
    texture:SetVertexColor(color.r, color.g, color.b, 0.5)
    
    grip:EnableMouse(true)
    grip:RegisterForDrag("LeftButton")
    grip:SetScript("OnDragStart", function()
        frame:StartSizing("BOTTOMRIGHT")
    end)
    grip:SetScript("OnDragStop", function()
        frame:StopMovingOrSizing()
        
        -- Enforce min/max sizes
        local width, height = frame:GetSize()
        width = BAG.Utils:Clamp(width, BAG.Layout.MainFrame.MinWidth, BAG.Layout.MainFrame.MaxWidth)
        height = BAG.Utils:Clamp(height, BAG.Layout.MainFrame.MinHeight, BAG.Layout.MainFrame.MaxHeight)
        frame:SetSize(width, height)
        
        BAG.UI:SaveSettings()
    end)
    
    frame.resizeGrip = grip
end

-- Toggle compact mode
function BAG.UI:ToggleCompactMode()
    local compact = BAG.SavedVars:Get("display.compactMode")
    BAG.SavedVars:Set("display.compactMode", not compact)
    
    if not compact then
        BAG.Logo:Print("Compact mode enabled")
        -- Reduce height
        if self.mainFrame then
            self.mainFrame:SetHeight(300)
        end
    else
        BAG.Logo:Print("Compact mode disabled")
        -- Restore height
        if self.mainFrame then
            self.mainFrame:SetHeight(BAG.Layout.MainFrame.DefaultHeight)
        end
    end
    
    self:Update()
end

-- Show options (placeholder for now)
function BAG.UI:ShowOptions()
    BAG.Logo:Print("Options panel - coming soon!")
    -- TODO: Implement options panel
end

print("|cff00B3FF[Bank Alone Guides]|r Main Frame loaded")
