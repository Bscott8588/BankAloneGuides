--[[
    Bank Alone Guides - Button Bar
    Navigation and control buttons
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

-- Create the button bar
function BAG.UI:CreateButtonBar(parent)
    local buttonBar = CreateFrame("Frame", "BAG_ButtonBar", parent)
    buttonBar:SetHeight(BAG.Layout.ButtonBar.Height)
    
    -- Background
    BAG.UI.Styles:StyleFrame(buttonBar, {
        border = false,
        bgColor = "BackgroundDark",
        alpha = 0.8,
    })
    
    -- Previous button
    buttonBar.prevButton = CreateFrame("Button", nil, buttonBar)
    buttonBar.prevButton:SetSize(BAG.Layout.ButtonBar.ButtonWidth, BAG.Layout.ButtonBar.ButtonHeight)
    buttonBar.prevButton:SetPoint("LEFT", BAG.Layout.ButtonBar.ButtonSpacing, 0)
    buttonBar.prevButton:SetText("Previous")
    BAG.UI.Styles:StyleButton(buttonBar.prevButton)
    
    buttonBar.prevButton:SetScript("OnClick", function()
        BAG.Engine:PreviousStep()
    end)
    
    buttonBar.prevButton:SetScript("OnEnter", function(self)
        BAG.UI.Styles:ShowTooltip(self, "Previous Step", "Go to the previous step in the guide\n(Shift+Left Click to skip back 5 steps)")
    end)
    
    buttonBar.prevButton:SetScript("OnLeave", function()
        BAG.UI.Styles:HideTooltip()
    end)
    
    -- Next button
    buttonBar.nextButton = CreateFrame("Button", nil, buttonBar)
    buttonBar.nextButton:SetSize(BAG.Layout.ButtonBar.ButtonWidth, BAG.Layout.ButtonBar.ButtonHeight)
    buttonBar.nextButton:SetPoint("LEFT", buttonBar.prevButton, "RIGHT", BAG.Layout.ButtonBar.ButtonSpacing, 0)
    buttonBar.nextButton:SetText("Next")
    BAG.UI.Styles:StyleButton(buttonBar.nextButton)
    
    buttonBar.nextButton:SetScript("OnClick", function()
        BAG.Engine:NextStep()
    end)
    
    buttonBar.nextButton:SetScript("OnEnter", function(self)
        BAG.UI.Styles:ShowTooltip(self, "Next Step", "Advance to the next step in the guide\n(Shift+Right Click to skip ahead 5 steps)")
    end)
    
    buttonBar.nextButton:SetScript("OnLeave", function()
        BAG.UI.Styles:HideTooltip()
    end)
    
    -- Complete button
    buttonBar.completeButton = CreateFrame("Button", nil, buttonBar)
    buttonBar.completeButton:SetSize(BAG.Layout.ButtonBar.ButtonWidth, BAG.Layout.ButtonBar.ButtonHeight)
    buttonBar.completeButton:SetPoint("LEFT", buttonBar.nextButton, "RIGHT", BAG.Layout.ButtonBar.ButtonSpacing, 0)
    buttonBar.completeButton:SetText("Complete")
    BAG.UI.Styles:StyleButton(buttonBar.completeButton)
    
    buttonBar.completeButton:SetScript("OnClick", function()
        BAG.Engine:CompleteCurrentStep()
    end)
    
    buttonBar.completeButton:SetScript("OnEnter", function(self)
        BAG.UI.Styles:ShowTooltip(self, "Complete Step", "Manually mark the current step as complete\nand advance to the next step")
    end)
    
    buttonBar.completeButton:SetScript("OnLeave", function()
        BAG.UI.Styles:HideTooltip()
    end)
    
    -- Options button
    buttonBar.optionsButton = CreateFrame("Button", nil, buttonBar)
    buttonBar.optionsButton:SetSize(BAG.Layout.ButtonBar.ButtonWidth, BAG.Layout.ButtonBar.ButtonHeight)
    buttonBar.optionsButton:SetPoint("RIGHT", -BAG.Layout.ButtonBar.ButtonSpacing, 0)
    buttonBar.optionsButton:SetText("Options")
    BAG.UI.Styles:StyleButton(buttonBar.optionsButton)
    
    buttonBar.optionsButton:SetScript("OnClick", function()
        BAG:Print("Options panel coming soon!")
        -- Future: Open options panel
    end)
    
    buttonBar.optionsButton:SetScript("OnEnter", function(self)
        BAG.UI.Styles:ShowTooltip(self, "Options", "Open addon settings and preferences")
    end)
    
    buttonBar.optionsButton:SetScript("OnLeave", function()
        BAG.UI.Styles:HideTooltip()
    end)
    
    -- Update function
    function buttonBar:Update()
        local hasGuide = BAG.Engine.currentGuide ~= nil
        local hasPrevious = hasGuide and BAG.Engine.currentStepIndex > 1
        local hasNext = hasGuide and BAG.Engine.currentStepIndex < #BAG.Engine.steps
        
        -- Enable/disable buttons based on state
        self.prevButton:SetEnabled(hasPrevious)
        self.prevButton:SetAlpha(hasPrevious and 1.0 or 0.5)
        
        self.nextButton:SetEnabled(hasNext)
        self.nextButton:SetAlpha(hasNext and 1.0 or 0.5)
        
        self.completeButton:SetEnabled(hasGuide)
        self.completeButton:SetAlpha(hasGuide and 1.0 or 0.5)
    end
    
    return buttonBar
end
