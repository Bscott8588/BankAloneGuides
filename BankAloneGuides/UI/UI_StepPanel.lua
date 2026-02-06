--[[
    Bank Alone Guides - Step Panel
    Displays current and upcoming guide steps
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

-- Create the step display panel
function BAG.UI:CreateStepPanel(parent)
    local panel = CreateFrame("Frame", "BAG_StepPanel", parent)
    
    -- Background
    BAG.UI.Styles:StyleFrame(panel, {
        border = false,
        bgColor = "BackgroundDark",
        alpha = 0.8,
    })
    
    -- Scroll frame for steps
    panel.scrollFrame = CreateFrame("ScrollFrame", nil, panel)
    panel.scrollFrame:SetPoint("TOPLEFT", 4, -4)
    panel.scrollFrame:SetPoint("BOTTOMRIGHT", -4, 4)
    
    -- Content frame
    panel.content = CreateFrame("Frame", nil, panel.scrollFrame)
    panel.content:SetWidth(1)
    panel.scrollFrame:SetScrollChild(panel.content)
    
    -- Step frames pool
    panel.stepFrames = {}
    panel.numVisibleSteps = 0
    
    -- Mouse wheel scrolling
    panel:EnableMouseWheel(true)
    panel:SetScript("OnMouseWheel", function(self, delta)
        local currentScroll = panel.scrollFrame:GetVerticalScroll()
        local scrollHeight = panel.scrollFrame:GetVerticalScrollRange()
        
        local newScroll = currentScroll - (delta * 40)
        newScroll = math.max(0, math.min(scrollHeight, newScroll))
        
        panel.scrollFrame:SetVerticalScroll(newScroll)
    end)
    
    panel.scroll = panel
    
    -- Update function
    function panel:Update()
        self:Clear()
        
        if not BAG.Engine.currentGuide or not BAG.Engine.currentStep then
            self:ShowNoGuideMessage()
            return
        end
        
        -- Get upcoming steps
        local upcomingSteps = BAG.Engine:GetUpcomingSteps(8)
        
        if #upcomingSteps == 0 then
            self:ShowNoStepsMessage()
            return
        end
        
        -- Display steps
        local yOffset = 0
        for i, stepInfo in ipairs(upcomingSteps) do
            local stepFrame = self:CreateStepFrame(stepInfo.step, stepInfo.index, stepInfo.isCurrent)
            stepFrame:SetPoint("TOPLEFT", self.content, "TOPLEFT", 0, yOffset)
            stepFrame:SetPoint("TOPRIGHT", self.content, "TOPRIGHT", 0, yOffset)
            stepFrame:Show()
            
            table.insert(self.stepFrames, stepFrame)
            yOffset = yOffset - (stepFrame:GetHeight() + BAG.Layout.StepPanel.StepSpacing)
        end
        
        -- Update content height
        self.content:SetHeight(math.abs(yOffset))
        self.numVisibleSteps = #upcomingSteps
    end
    
    -- Clear all step frames
    function panel:Clear()
        for _, stepFrame in ipairs(self.stepFrames) do
            stepFrame:Hide()
            stepFrame:SetParent(nil)
        end
        self.stepFrames = {}
        self.numVisibleSteps = 0
    end
    
    -- Create a step frame
    function panel:CreateStepFrame(step, stepIndex, isCurrent)
        local stepFrame = CreateFrame("Frame", nil, self.content)
        stepFrame:SetHeight(BAG.Layout.StepPanel.StepHeight)
        
        -- Background
        if isCurrent then
            BAG.UI.Styles:StyleFrame(stepFrame, {
                border = true,
                bgColor = "Secondary",
                borderColor = "Primary",
            })
            BAG.UI.Styles:AddGlow(stepFrame, "Glow")
        else
            BAG.UI.Styles:StyleFrame(stepFrame, {
                border = true,
                bgColor = "Background",
                borderColor = "Border",
            })
        end
        
        -- Step number
        stepFrame.number = stepFrame:CreateFontString(nil, "OVERLAY")
        stepFrame.number:SetFont(BAG.Theme.Fonts.Number, BAG.Theme.FontSizes.Normal, "OUTLINE")
        stepFrame.number:SetTextColor(isCurrent and BAG.Theme:GetColor("Accent") or BAG.Theme:GetColor("TextDim"))
        stepFrame.number:SetText(stepIndex)
        stepFrame.number:SetPoint("TOPLEFT", 8, -8)
        
        -- Step icon
        stepFrame.icon = BAG.UI.Styles:CreateStepIcon(stepFrame, step.type)
        stepFrame.icon:SetPoint("LEFT", stepFrame.number, "RIGHT", 8, 0)
        
        -- Step type
        stepFrame.typeText = stepFrame:CreateFontString(nil, "OVERLAY")
        stepFrame.typeText:SetFont(BAG.Theme.Fonts.Small, BAG.Theme.FontSizes.Small, "OUTLINE")
        stepFrame.typeText:SetTextColor(BAG.Theme:GetColor("TextDim"))
        stepFrame.typeText:SetText(BAG.Utils:FormatStepType(step.type))
        stepFrame.typeText:SetPoint("TOPLEFT", stepFrame.icon, "TOPRIGHT", 8, 2)
        
        -- Main instruction text
        stepFrame.text = stepFrame:CreateFontString(nil, "OVERLAY")
        stepFrame.text:SetFont(BAG.Theme.Fonts.Normal, BAG.Theme.FontSizes.Normal, "OUTLINE")
        stepFrame.text:SetTextColor(isCurrent and BAG.Theme:GetColor("Text") or BAG.Theme:GetColor("TextDim"))
        stepFrame.text:SetPoint("TOPLEFT", stepFrame.icon, "BOTTOMLEFT", 0, -4)
        stepFrame.text:SetPoint("TOPRIGHT", stepFrame, "TOPRIGHT", -8, -28)
        stepFrame.text:SetJustifyH("LEFT")
        stepFrame.text:SetWordWrap(true)
        
        -- Format step text
        local stepText = self:FormatStepText(step)
        stepFrame.text:SetText(stepText)
        
        -- Coordinates
        if step.x and step.y then
            stepFrame.coords = stepFrame:CreateFontString(nil, "OVERLAY")
            stepFrame.coords:SetFont(BAG.Theme.Fonts.Number, BAG.Theme.FontSizes.Tiny, "OUTLINE")
            stepFrame.coords:SetTextColor(BAG.Theme:GetColor("Accent"))
            stepFrame.coords:SetText(BAG.MapAPI:FormatCoordinates(step.x, step.y))
            stepFrame.coords:SetPoint("BOTTOMRIGHT", stepFrame, "BOTTOMRIGHT", -8, 8)
        end
        
        -- Zone
        if step.zone then
            stepFrame.zone = stepFrame:CreateFontString(nil, "OVERLAY")
            stepFrame.zone:SetFont(BAG.Theme.Fonts.Small, BAG.Theme.FontSizes.Tiny, "OUTLINE")
            stepFrame.zone:SetTextColor(BAG.Theme:GetColor("TextDim"))
            stepFrame.zone:SetText(step.zone)
            stepFrame.zone:SetPoint("BOTTOMLEFT", stepFrame, "BOTTOMLEFT", 8, 8)
        end
        
        -- Conditions (if any)
        if step.conditions then
            local condText = self:FormatConditions(step.conditions)
            if condText then
                stepFrame.condText = stepFrame:CreateFontString(nil, "OVERLAY")
                stepFrame.condText:SetFont(BAG.Theme.Fonts.Small, BAG.Theme.FontSizes.Tiny, "OUTLINE")
                stepFrame.condText:SetTextColor(BAG.Theme:GetColor("Warning"))
                stepFrame.condText:SetText(condText)
                stepFrame.condText:SetPoint("TOPRIGHT", stepFrame, "TOPRIGHT", -8, -8)
            end
        end
        
        -- Click handler
        stepFrame:EnableMouse(true)
        stepFrame:SetScript("OnEnter", function(self)
            BAG.UI.Styles:AddGlow(self, "Primary")
            
            -- Show detailed tooltip
            local tooltip = self:BuildTooltip(step, stepIndex)
            BAG.UI.Styles:ShowTooltip(self, tooltip.title, tooltip.text)
        end)
        
        stepFrame:SetScript("OnLeave", function(self)
            if self.glow and not isCurrent then
                self.glow:Hide()
            end
            BAG.UI.Styles:HideTooltip()
        end)
        
        return stepFrame
    end
    
    -- Format step text for display
    function panel:FormatStepText(step)
        if step.text then
            return step.text
        end
        
        if step.type == "accept" then
            local questName = step.questID and BAG.Data.Quests:GetQuestName(step.questID) or "Quest"
            return "Accept: " .. questName
        elseif step.type == "turnin" then
            local questName = step.questID and BAG.Data.Quests:GetQuestName(step.questID) or "Quest"
            return "Turn in: " .. questName
        elseif step.type == "goto" then
            return BAG.Travel:GetInstruction(step)
        else
            return BAG.Travel:GetInstruction(step)
        end
    end
    
    -- Format conditions for display
    function panel:FormatConditions(conditions)
        if not conditions or BAG.Utils:TableSize(conditions) == 0 then
            return nil
        end
        
        local parts = {}
        for condType, condValue in pairs(conditions) do
            table.insert(parts, BAG.Conditions:FormatCondition(condType, condValue))
        end
        
        return "(" .. table.concat(parts, ", ") .. ")"
    end
    
    -- Build tooltip for a step
    function panel:BuildTooltip(step, stepIndex)
        local title = "Step " .. stepIndex .. ": " .. BAG.Utils:FormatStepType(step.type)
        local lines = {}
        
        -- Main instruction
        table.insert(lines, self:FormatStepText(step))
        
        -- Location
        if step.zone then
            table.insert(lines, "Zone: " .. step.zone)
        end
        
        if step.x and step.y then
            table.insert(lines, "Coords: " .. BAG.MapAPI:FormatCoordinates(step.x, step.y))
        end
        
        -- Conditions
        if step.conditions then
            local unmet = BAG.Conditions:GetUnmetConditions(step)
            if #unmet > 0 then
                table.insert(lines, "\nConditions not met:")
                for _, cond in ipairs(unmet) do
                    table.insert(lines, "- " .. BAG.Conditions:FormatCondition(cond.type, cond.value))
                end
            end
        end
        
        return {
            title = title,
            text = table.concat(lines, "\n"),
        }
    end
    
    -- Show "no guide loaded" message
    function panel:ShowNoGuideMessage()
        local msg = self.content:CreateFontString(nil, "OVERLAY")
        msg:SetFont(BAG.Theme.Fonts.Normal, BAG.Theme.FontSizes.Normal, "OUTLINE")
        msg:SetTextColor(BAG.Theme:GetColor("TextDim"))
        msg:SetText("No guide loaded.\n\nUse /bag reload to load a guide for your character.")
        msg:SetPoint("CENTER", self, "CENTER")
        msg:SetJustifyH("CENTER")
        
        table.insert(self.stepFrames, {Hide = function() msg:Hide() end})
    end
    
    -- Show "no steps" message
    function panel:ShowNoStepsMessage()
        local msg = self.content:CreateFontString(nil, "OVERLAY")
        msg:SetFont(BAG.Theme.Fonts.Normal, BAG.Theme.FontSizes.Normal, "OUTLINE")
        msg:SetTextColor(BAG.Theme:GetColor("TextDim"))
        msg:SetText("Guide complete!\n\nCongratulations on finishing this guide.")
        msg:SetPoint("CENTER", self, "CENTER")
        msg:SetJustifyH("CENTER")
        
        table.insert(self.stepFrames, {Hide = function() msg:Hide() end})
    end
    
    -- Update layout
    function panel:UpdateLayout()
        self:Update()
    end
    
    return panel
end
