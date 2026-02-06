--[[
    Bank Alone Guides - Step Panel
    Displays current and upcoming guide steps
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
BAG.UI.StepPanel = {}

-- Create step panel
function BAG.UI.StepPanel:Create(parent)
    local panel = CreateFrame("Frame", nil, parent)
    
    -- Create scroll frame
    local scrollFrame = BAG.UI.Styles:CreateScrollFrame(panel, 
        BAG.Layout.MainFrame.DefaultWidth - 20,
        BAG.Layout.MainFrame.DefaultHeight - 150)
    scrollFrame:SetAllPoints(panel)
    
    panel.scrollFrame = scrollFrame
    panel.stepFrames = {}
    
    -- Update method
    function panel:Update()
        BAG.UI.StepPanel:UpdateSteps(self)
    end
    
    return panel
end

-- Update step display
function BAG.UI.StepPanel:UpdateSteps(panel)
    if not panel or not panel.scrollFrame then
        return
    end
    
    local scrollChild = panel.scrollFrame.scrollChild
    
    -- Clear existing step frames
    for _, frame in ipairs(panel.stepFrames) do
        frame:Hide()
        frame:ClearAllPoints()
    end
    
    -- Get steps to display
    local maxSteps = BAG.SavedVars:Get("display.maxSteps") or 5
    local steps = BAG.Engine:GetNextSteps(maxSteps)
    
    if #steps == 0 then
        -- Show "no guide loaded" message
        self:ShowNoGuideMessage(scrollChild)
        return
    end
    
    -- Create or reuse step frames
    local yOffset = -10
    for i, stepData in ipairs(steps) do
        local stepFrame = panel.stepFrames[i]
        
        if not stepFrame then
            stepFrame = self:CreateStepFrame(scrollChild)
            panel.stepFrames[i] = stepFrame
        end
        
        stepFrame:SetPoint("TOPLEFT", 10, yOffset)
        stepFrame:SetPoint("TOPRIGHT", -10, yOffset)
        stepFrame:Show()
        
        -- Update step content
        self:UpdateStepFrame(stepFrame, stepData)
        
        yOffset = yOffset - (BAG.Layout.StepPanel.StepHeight + BAG.Layout.StepPanel.StepSpacing)
    end
    
    -- Update scroll range
    local totalHeight = math.abs(yOffset) + 20
    scrollChild:SetHeight(math.max(totalHeight, panel.scrollFrame:GetHeight()))
    
    local scrollBar = panel.scrollFrame.scrollBar
    if scrollBar then
        local maxScroll = math.max(0, totalHeight - panel.scrollFrame:GetHeight())
        scrollBar:SetMinMaxValues(0, maxScroll)
    end
end

-- Create a step frame
function BAG.UI.StepPanel:CreateStepFrame(parent)
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetHeight(BAG.Layout.StepPanel.StepHeight)
    
    -- Backdrop
    BAG.Theme:ApplyBackdrop(frame, "default")
    local bg = BAG.Theme.Colors.BackgroundLight
    frame:SetBackdropColor(bg.r, bg.g, bg.b, bg.a)
    
    -- Icon
    local icon = BAG.UI.Styles:CreateIcon(frame, BAG.Layout.StepPanel.IconSize)
    icon:SetPoint("LEFT", BAG.Layout.StepPanel.IconPadding, 0)
    frame.icon = icon
    
    -- Step text
    local text = BAG.UI.Styles:CreateNormalText(frame)
    text:SetPoint("TOPLEFT", icon, "TOPRIGHT", BAG.Layout.StepPanel.TextPadding, -4)
    text:SetPoint("TOPRIGHT", -BAG.Layout.StepPanel.CoordWidth - 10, -4)
    text:SetJustifyH("LEFT")
    text:SetWordWrap(true)
    frame.text = text
    
    -- Coordinates
    local coords = BAG.UI.Styles:CreateSmallText(frame)
    coords:SetPoint("BOTTOMLEFT", icon, "BOTTOMRIGHT", BAG.Layout.StepPanel.TextPadding, 4)
    local coordColor = BAG.Theme.Colors.Accent
    coords:SetTextColor(coordColor.r, coordColor.g, coordColor.b)
    frame.coords = coords
    
    -- Zone text
    local zone = BAG.UI.Styles:CreateSmallText(frame)
    zone:SetPoint("TOPLEFT", coords, "TOPRIGHT", 8, 0)
    frame.zone = zone
    
    -- Conditions/tags
    local tags = BAG.UI.Styles:CreateSmallText(frame)
    tags:SetPoint("TOPRIGHT", -10, -4)
    frame.tags = tags
    
    -- Complete indicator
    local complete = frame:CreateTexture(nil, "OVERLAY")
    complete:SetSize(24, 24)
    complete:SetPoint("RIGHT", -10, 0)
    complete:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
    complete:Hide()
    frame.complete = complete
    
    -- Hover effect
    frame:EnableMouse(true)
    frame:SetScript("OnEnter", function(self)
        local color = BAG.Theme.Colors.BorderHighlight
        self:SetBackdropBorderColor(color.r, color.g, color.b, color.a)
        
        -- Show tooltip if step has details
        if self.stepData and self.stepData.step then
            BAG.UI.StepPanel:ShowStepTooltip(self, self.stepData)
        end
    end)
    
    frame:SetScript("OnLeave", function(self)
        local color = BAG.Theme.Colors.Border
        self:SetBackdropBorderColor(color.r, color.g, color.b, color.a)
        BAG.UI.Styles:HideTooltip()
    end)
    
    return frame
end

-- Update step frame content
function BAG.UI.StepPanel:UpdateStepFrame(frame, stepData)
    local step = stepData.step
    local isCurrent = stepData.isCurrent
    local isComplete = stepData.isComplete
    local isAvailable = stepData.isAvailable
    
    frame.stepData = stepData
    
    -- Update icon
    local iconTexture = BAG.Layout:GetStepIcon(step.type)
    frame.icon:SetIcon(iconTexture)
    
    -- Color icon based on step type
    local iconColor = self:GetStepTypeColor(step.type)
    frame.icon.texture:SetVertexColor(iconColor.r, iconColor.g, iconColor.b)
    
    -- Update text
    local stepText = self:FormatStepText(step)
    frame.text:SetText(stepText)
    
    -- Update coordinates
    if step.x and step.y then
        frame.coords:SetText(BAG.MapAPI:FormatCoords(step.x, step.y))
        frame.coords:Show()
    else
        frame.coords:Hide()
    end
    
    -- Update zone
    if step.zone then
        frame.zone:SetText(step.zone)
        frame.zone:Show()
    else
        frame.zone:Hide()
    end
    
    -- Update tags/conditions
    local tagText = self:FormatStepTags(step)
    if tagText ~= "" then
        frame.tags:SetText(tagText)
        frame.tags:Show()
    else
        frame.tags:Hide()
    end
    
    -- Highlight current step
    if isCurrent then
        BAG.UI.Styles:ApplyGlow(frame)
        local currentColor = BAG.Theme.Colors.Primary
        frame:SetBackdropBorderColor(currentColor.r, currentColor.g, currentColor.b)
    else
        BAG.UI.Styles:RemoveGlow(frame)
        local borderColor = BAG.Theme.Colors.Border
        frame:SetBackdropBorderColor(borderColor.r, borderColor.g, borderColor.b)
    end
    
    -- Show complete indicator
    if isComplete then
        frame.complete:Show()
    else
        frame.complete:Hide()
    end
    
    -- Dim if not available
    if not isAvailable then
        frame:SetAlpha(0.5)
    else
        frame:SetAlpha(1.0)
    end
end

-- Format step text
function BAG.UI.StepPanel:FormatStepText(step)
    local text = step.text or ""
    local prefix = ""
    
    -- Add type prefix
    if step.type == "accept" then
        prefix = "Accept: "
    elseif step.type == "turnin" then
        prefix = "Turn in: "
    elseif step.type == "kill" then
        prefix = "Kill: "
    elseif step.type == "collect" then
        prefix = "Collect: "
    elseif step.type == "goto" then
        prefix = "Go to: "
    elseif step.type == "train" then
        prefix = "Train: "
    elseif step.type == "vendor" then
        prefix = "Vendor: "
    elseif step.type == "buy" then
        prefix = "Buy: "
    end
    
    -- Add quest name if available
    if step.questID and BAG.Data and BAG.Data.Quests then
        local quest = BAG.Data.Quests[step.questID]
        if quest then
            text = quest.name
        end
    end
    
    return prefix .. text
end

-- Format step tags (conditions, class, race, etc.)
function BAG.UI.StepPanel:FormatStepTags(step)
    local tags = {}
    
    if step.conditions then
        for condType, condValue in pairs(step.conditions) do
            local tagText = BAG.Conditions:FormatConditionText(condType, condValue)
            if tagText then
                table.insert(tags, tagText)
            end
        end
    end
    
    return table.concat(tags, " | ")
end

-- Get color for step type
function BAG.UI.StepPanel:GetStepTypeColor(stepType)
    local colors = {
        accept = BAG.Theme.Colors.Quest,
        turnin = BAG.Theme.Colors.Success,
        kill = BAG.Theme.Colors.Kill,
        collect = BAG.Theme.Colors.Collect,
        goto = BAG.Theme.Colors.Travel,
        train = BAG.Theme.Colors.Train,
        vendor = BAG.Theme.Colors.Vendor,
        buy = BAG.Theme.Colors.Vendor,
        fly = BAG.Theme.Colors.Travel,
        fp = BAG.Theme.Colors.Travel,
        hs = BAG.Theme.Colors.Travel,
    }
    
    return colors[stepType] or BAG.Theme.Colors.TextPrimary
end

-- Show step tooltip
function BAG.UI.StepPanel:ShowStepTooltip(frame, stepData)
    local step = stepData.step
    
    GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
    
    -- Title
    local title = self:FormatStepText(step)
    GameTooltip:AddLine(title, 1, 1, 1, true)
    
    -- Quest info
    if step.questID then
        local questTitle = BAG.QuestAPI:GetQuestTitle(step.questID)
        local questLevel = BAG.QuestAPI:GetQuestLevel(step.questID)
        if questLevel then
            GameTooltip:AddLine(string.format("[%d] %s", questLevel, questTitle), 1, 0.82, 0)
        end
    end
    
    -- Location
    if step.zone then
        local locText = step.zone
        if step.x and step.y then
            locText = locText .. " (" .. BAG.MapAPI:FormatCoords(step.x, step.y) .. ")"
        end
        GameTooltip:AddLine(locText, 0.4, 0.9, 1.0)
    end
    
    -- Conditions
    if step.conditions then
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Requirements:", 1, 0.5, 0)
        
        local failed = BAG.Conditions:GetFailedConditions(step)
        for condType, condValue in pairs(step.conditions) do
            local condText = BAG.Conditions:FormatConditionText(condType, condValue)
            local isFailed = false
            
            for _, fail in ipairs(failed) do
                if fail.type == condType then
                    isFailed = true
                    break
                end
            end
            
            if isFailed then
                GameTooltip:AddLine("  " .. condText, 1, 0.2, 0.2)
            else
                GameTooltip:AddLine("  " .. condText, 0, 0.8, 0.4)
            end
        end
    end
    
    -- Additional notes
    if step.note then
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine(step.note, 0.7, 0.8, 0.9, true)
    end
    
    GameTooltip:Show()
end

-- Show "no guide loaded" message
function BAG.UI.StepPanel:ShowNoGuideMessage(parent)
    local message = parent:CreateFontString(nil, "OVERLAY")
    message:SetPoint("CENTER")
    BAG.Theme:ApplyFont(message, "Heading")
    message:SetText("No guide loaded\n\nUse /bag to load a guide")
    local color = BAG.Theme.Colors.TextSecondary
    message:SetTextColor(color.r, color.g, color.b)
end

print("|cff00B3FF[Bank Alone Guides]|r Step Panel loaded")
