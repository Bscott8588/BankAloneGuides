--[[
    Bank Alone Guides - Main Frame
    Creates the main addon window
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

-- Create the main addon frame
function BAG.UI:CreateMainFrame()
    local frame = CreateFrame("Frame", "BAG_MainFrame", UIParent)
    
    -- Set size and position
    frame:SetSize(BAG.Layout.MainFrame.Width, BAG.Layout.MainFrame.Height)
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    
    -- Make movable and resizable
    frame:SetMovable(true)
    frame:SetResizable(true)
    frame:SetClampedToScreen(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    
    -- Set frame strata and level
    frame:SetFrameStrata("MEDIUM")
    frame:SetFrameLevel(10)
    
    -- Apply styling
    BAG.UI.Styles:StyleFrame(frame, {
        border = true,
        bgColor = "Background",
        borderColor = "Border",
    })
    
    -- Create title bar
    frame.titleBar = BAG.UI.Styles:CreateTitleBar(frame, "BANK ALONE GUIDES")
    
    -- Add logo to title bar
    frame.logo = BAG.Logo:Create(frame.titleBar)
    frame.logo:SetPoint("LEFT", frame.titleBar, "LEFT", 8, 0)
    
    -- Create close button
    frame.closeButton = CreateFrame("Button", nil, frame.titleBar)
    frame.closeButton:SetSize(BAG.Layout.TitleBar.ButtonSize, BAG.Layout.TitleBar.ButtonSize)
    frame.closeButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -4, -4)
    frame.closeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
    frame.closeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
    frame.closeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    frame.closeButton:SetScript("OnClick", function()
        BAG.UI:Hide()
    end)
    frame.closeButton:SetScript("OnEnter", function(self)
        BAG.UI.Styles:ShowTooltip(self, "Close", "Hide the guide window")
    end)
    frame.closeButton:SetScript("OnLeave", function()
        BAG.UI.Styles:HideTooltip()
    end)
    
    -- Create minimize button
    frame.minimizeButton = CreateFrame("Button", nil, frame.titleBar)
    frame.minimizeButton:SetSize(BAG.Layout.TitleBar.ButtonSize, BAG.Layout.TitleBar.ButtonSize)
    frame.minimizeButton:SetPoint("RIGHT", frame.closeButton, "LEFT", -2, 0)
    frame.minimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
    frame.minimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
    frame.minimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    frame.minimizeButton:SetScript("OnClick", function()
        -- Toggle minimize (future feature)
        BAG:Print("Minimize feature coming soon!")
    end)
    
    -- Create progress bar
    frame.progressBar = BAG.UI.Styles:CreateProgressBar(frame, frame:GetWidth() - 24, 16)
    frame.progressBar:SetPoint("TOPLEFT", frame.titleBar, "BOTTOMLEFT", 12, -8)
    frame.progressBar:SetPoint("TOPRIGHT", frame.titleBar, "BOTTOMRIGHT", -12, -8)
    
    -- Create step panel
    frame.stepPanel = BAG.UI:CreateStepPanel(frame)
    frame.stepPanel:SetPoint("TOPLEFT", frame.progressBar, "BOTTOMLEFT", 0, -8)
    frame.stepPanel:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -12, 60)
    
    -- Create button bar
    frame.buttonBar = BAG.UI:CreateButtonBar(frame)
    frame.buttonBar:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 12, 12)
    frame.buttonBar:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -12, 12)
    
    -- Drag to move
    frame:SetScript("OnDragStart", function(self)
        if not BAG.SavedVars:Get("ui.locked") then
            self:StartMoving()
        end
    end)
    
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        BAG.UI:SavePosition()
    end)
    
    -- Mouse wheel scrolling
    frame:EnableMouseWheel(true)
    frame:SetScript("OnMouseWheel", function(self, delta)
        if frame.stepPanel and frame.stepPanel.scroll then
            frame.stepPanel.scroll:OnMouseWheel(delta)
        end
    end)
    
    -- Create resize grip
    frame.resizeGrip = CreateFrame("Button", nil, frame)
    frame.resizeGrip:SetSize(16, 16)
    frame.resizeGrip:SetPoint("BOTTOMRIGHT", -2, 2)
    frame.resizeGrip:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    frame.resizeGrip:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    frame.resizeGrip:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    
    frame.resizeGrip:SetScript("OnMouseDown", function(self)
        if not BAG.SavedVars:Get("ui.locked") then
            frame:StartSizing("BOTTOMRIGHT")
        end
    end)
    
    frame.resizeGrip:SetScript("OnMouseUp", function(self)
        frame:StopMovingOrSizing()
        BAG.UI:SavePosition()
        BAG.UI:Update()
    end)
    
    -- Size constraints
    frame:SetMinResize(BAG.Layout.MainFrame.MinWidth, BAG.Layout.MainFrame.MinHeight)
    frame:SetMaxResize(BAG.Layout.MainFrame.MaxWidth, BAG.Layout.MainFrame.MaxHeight)
    
    -- On size changed
    frame:SetScript("OnSizeChanged", function(self, width, height)
        -- Update progress bar width
        if frame.progressBar then
            frame.progressBar:SetWidth(width - 24)
        end
        
        -- Update step panel
        if frame.stepPanel then
            frame.stepPanel:UpdateLayout()
        end
    end)
    
    -- Hide on escape
    table.insert(UISpecialFrames, "BAG_MainFrame")
    
    return frame
end
