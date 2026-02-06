--[[
    Bank Alone Guides - Button Management
    Manages UI buttons and their states
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
BAG.UI.Buttons = {}

-- Update button states
function BAG.UI.Buttons:Update()
    local mainFrame = BAG.UI.mainFrame
    if not mainFrame then
        return
    end
    
    local progress = BAG.Engine:GetProgress()
    
    -- Update Previous button
    if mainFrame.prevButton then
        if progress.currentStep > 1 then
            mainFrame.prevButton:Enable()
            mainFrame.prevButton:SetAlpha(1.0)
        else
            mainFrame.prevButton:Disable()
            mainFrame.prevButton:SetAlpha(0.5)
        end
    end
    
    -- Update Next button
    if mainFrame.nextButton then
        if progress.currentStep < progress.totalSteps then
            mainFrame.nextButton:Enable()
            mainFrame.nextButton:SetAlpha(1.0)
            
            -- Check if current step is complete
            local currentStep = BAG.Engine:GetCurrentStep()
            if currentStep and BAG.Engine:IsStepComplete(currentStep, progress.currentStep) then
                -- Highlight next button
                BAG.UI.Styles:ApplyGlow(mainFrame.nextButton)
            else
                BAG.UI.Styles:RemoveGlow(mainFrame.nextButton)
            end
        else
            mainFrame.nextButton:Disable()
            mainFrame.nextButton:SetAlpha(0.5)
            BAG.UI.Styles:RemoveGlow(mainFrame.nextButton)
        end
    end
    
    -- Update Re-evaluate button
    if mainFrame.revalButton then
        mainFrame.revalButton:Enable()
        mainFrame.revalButton:SetAlpha(1.0)
    end
end

-- Create minimap button
function BAG.UI.Buttons:CreateMinimapButton()
    if self.minimapButton then
        return self.minimapButton
    end
    
    local button = CreateFrame("Button", "BAG_MinimapButton", Minimap)
    button:SetSize(BAG.Layout.MinimapButton.Size, BAG.Layout.MinimapButton.Size)
    button:SetFrameStrata("MEDIUM")
    button:SetFrameLevel(8)
    
    -- Icon
    local icon = button:CreateTexture(nil, "BACKGROUND")
    icon:SetAllPoints()
    icon:SetTexture("Interface\\Icons\\INV_Misc_Map_01")
    local color = BAG.Theme.Colors.Primary
    icon:SetVertexColor(color.r, color.g, color.b)
    
    -- Border
    local border = button:CreateTexture(nil, "OVERLAY")
    border:SetAllPoints()
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    
    -- Highlight
    button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    
    -- Click handler
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    button:SetScript("OnClick", function(self, mouseButton)
        if mouseButton == "LeftButton" then
            BAG.UI:Toggle()
        elseif mouseButton == "RightButton" then
            BAG.UI:ShowOptions()
        end
    end)
    
    -- Tooltip
    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:AddLine("Bank Alone Guides", 1, 1, 1)
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Left-click: Toggle guide window", 0.4, 0.9, 1.0)
        GameTooltip:AddLine("Right-click: Options", 0.4, 0.9, 1.0)
        GameTooltip:Show()
    end)
    
    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    
    -- Dragging
    button:RegisterForDrag("LeftButton")
    button:SetScript("OnDragStart", function(self)
        self:LockHighlight()
        self.isDragging = true
    end)
    
    button:SetScript("OnDragStop", function(self)
        self:UnlockHighlight()
        self.isDragging = false
        local angle = self.angle or BAG.Layout.MinimapButton.DefaultAngle
        BAG.SavedVars:Set("ui.minimapButton.angle", angle)
    end)
    
    button:SetScript("OnUpdate", function(self)
        if self.isDragging then
            local mx, my = Minimap:GetCenter()
            local px, py = GetCursorPosition()
            local scale = Minimap:GetEffectiveScale()
            px, py = px / scale, py / scale
            
            local angle = math.deg(math.atan2(py - my, px - mx))
            self.angle = angle
            self:UpdatePosition()
        end
    end)
    
    -- Position update
    function button:UpdatePosition()
        local angle = self.angle or BAG.Layout.MinimapButton.DefaultAngle
        local x = math.cos(math.rad(angle)) * 80
        local y = math.sin(math.rad(angle)) * 80
        self:SetPoint("CENTER", Minimap, "CENTER", x, y)
    end
    
    -- Initial position
    local savedAngle = BAG.SavedVars:Get("ui.minimapButton.angle")
    button.angle = savedAngle or BAG.Layout.MinimapButton.DefaultAngle
    button:UpdatePosition()
    
    -- Show/hide based on settings
    local shown = BAG.SavedVars:Get("ui.minimapButton.shown")
    if shown == false then
        button:Hide()
    end
    
    self.minimapButton = button
    return button
end

-- Show/hide minimap button
function BAG.UI.Buttons:ShowMinimapButton(show)
    if show == nil then
        show = true
    end
    
    if not self.minimapButton then
        if show then
            self:CreateMinimapButton()
        end
        return
    end
    
    if show then
        self.minimapButton:Show()
    else
        self.minimapButton:Hide()
    end
    
    BAG.SavedVars:Set("ui.minimapButton.shown", show)
end

-- Toggle minimap button
function BAG.UI.Buttons:ToggleMinimapButton()
    local shown = BAG.SavedVars:Get("ui.minimapButton.shown")
    self:ShowMinimapButton(not shown)
end

-- Create context menu for steps
function BAG.UI.Buttons:CreateStepContextMenu(stepData)
    local menu = {}
    
    if not stepData or not stepData.step then
        return menu
    end
    
    local step = stepData.step
    
    -- Jump to step
    table.insert(menu, {
        text = "Jump to this step",
        func = function()
            BAG.Engine:GotoStep(stepData.index)
        end
    })
    
    -- Track quest
    if step.questID and BAG.QuestAPI:IsQuestActive(step.questID) then
        local tracked = BAG.QuestAPI:IsQuestTracked(step.questID)
        table.insert(menu, {
            text = tracked and "Untrack quest" or "Track quest",
            func = function()
                BAG.QuestAPI:TrackQuest(step.questID, not tracked)
            end
        })
    end
    
    -- Share quest
    if step.questID and BAG.QuestAPI:IsQuestActive(step.questID) then
        table.insert(menu, {
            text = "Share quest",
            func = function()
                BAG.QuestAPI:ShareQuest(step.questID)
            end
        })
    end
    
    -- Set waypoint (if using external waypoint addon)
    if step.x and step.y and step.zone then
        table.insert(menu, {
            text = "Set waypoint",
            func = function()
                BAG.Logo:Print(string.format("Waypoint: %s (%s)", 
                    step.zone, BAG.MapAPI:FormatCoords(step.x, step.y)))
                -- TODO: Integrate with waypoint addons
            end
        })
    end
    
    return menu
end

-- Show context menu
function BAG.UI.Buttons:ShowContextMenu(frame, menu)
    if not menu or #menu == 0 then
        return
    end
    
    -- Create dropdown menu
    local dropdown = CreateFrame("Frame", "BAG_ContextMenu", UIParent, "UIDropDownMenuTemplate")
    
    local function InitializeMenu(self, level)
        for i, item in ipairs(menu) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = item.text
            info.func = item.func
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)
        end
    end
    
    UIDropDownMenu_Initialize(dropdown, InitializeMenu, "MENU")
    ToggleDropDownMenu(1, nil, dropdown, frame, 0, 0)
end

print("|cff00B3FF[Bank Alone Guides]|r Button management loaded")
