--[[
    Bank Alone Guides - Step Panel
    SCS / Bank Alone Guides
    
    Displays the current step and upcoming steps with icons, coordinates, and conditions.
]]

local BAG = BankAlone

BAG.UI = BAG.UI or {}
BAG.UI.StepPanel = BAG.UI.StepPanel or {}
local Panel = BAG.UI.StepPanel
local Styles

-- Number of step rows to display
local MAX_VISIBLE_STEPS = 8

-- Step row pool
Panel._rows = {}
Panel._container = nil

-- Create the step panel inside the given container
function Panel:Create(container)
    Styles = BAG.UI.Styles
    Panel._container = container

    -- Create a scroll frame
    local scrollFrame = CreateFrame("ScrollFrame", "BAG_StepScroll", container, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", container, "TOPLEFT", 0, 0)
    scrollFrame:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -20, 0)

    local scrollChild = CreateFrame("Frame", "BAG_StepScrollChild", scrollFrame)
    scrollChild:SetWidth(container:GetWidth() - 24)
    scrollChild:SetHeight(1) -- Will be resized
    scrollFrame:SetScrollChild(scrollChild)

    Panel._scrollFrame = scrollFrame
    Panel._scrollChild = scrollChild

    -- Create step rows
    for i = 1, MAX_VISIBLE_STEPS do
        self:CreateStepRow(scrollChild, i)
    end
end

-- Create a single step row
function Panel:CreateStepRow(parent, index)
    local rowHeight = 52
    local row = CreateFrame("Frame", "BAG_StepRow" .. index, parent)
    row:SetHeight(rowHeight)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -((index - 1) * (rowHeight + Styles.Layout.stepSpacing)))
    row:SetPoint("RIGHT", parent, "RIGHT", 0, 0)

    -- Background
    local bg = row:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(row)
    local c = Styles.Colors.bgStep
    bg:SetColorTexture(c[1], c[2], c[3], c[4])
    row.bg = bg

    -- Left accent bar (shows current step)
    local accentBar = row:CreateTexture(nil, "ARTWORK")
    local ac = Styles.Colors.primary
    accentBar:SetColorTexture(ac[1], ac[2], ac[3], ac[4])
    accentBar:SetWidth(3)
    accentBar:SetPoint("TOPLEFT", row, "TOPLEFT", 0, 0)
    accentBar:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", 0, 0)
    accentBar:Hide()
    row.accentBar = accentBar

    -- Step number
    local stepNum = row:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(stepNum, "small")
    Styles:ApplyTextColor(stepNum, "textMuted")
    stepNum:SetPoint("TOPLEFT", row, "TOPLEFT", 8, -6)
    stepNum:SetWidth(24)
    stepNum:SetJustifyH("LEFT")
    row.stepNum = stepNum

    -- Step icon (text-based icon from Navigator)
    local icon = row:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(icon, "normal")
    icon:SetPoint("LEFT", stepNum, "RIGHT", 2, 0)
    row.icon = icon

    -- Step type tag
    local typeTag = row:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(typeTag, "tiny")
    Styles:ApplyTextColor(typeTag, "primary")
    typeTag:SetPoint("TOPLEFT", row, "TOPLEFT", 8, -20)
    row.typeTag = typeTag

    -- Main text
    local mainText = row:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(mainText, "normal")
    Styles:ApplyTextColor(mainText, "textLight")
    mainText:SetPoint("TOPLEFT", icon, "TOPRIGHT", 4, 0)
    mainText:SetPoint("RIGHT", row, "RIGHT", -8, 0)
    mainText:SetJustifyH("LEFT")
    mainText:SetWordWrap(true)
    mainText:SetMaxLines(2)
    row.mainText = mainText

    -- Coordinates text
    local coords = row:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(coords, "coords")
    Styles:ApplyTextColor(coords, "textMuted")
    coords:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", 8, 4)
    row.coords = coords

    -- Quest progress text
    local progress = row:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(progress, "tiny")
    Styles:ApplyTextColor(progress, "incomplete")
    progress:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", -8, 4)
    progress:SetJustifyH("RIGHT")
    row.progress = progress

    -- Condition tags
    local condTag = row:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(condTag, "tiny")
    Styles:ApplyTextColor(condTag, "accentDim")
    condTag:SetPoint("BOTTOMLEFT", coords, "BOTTOMRIGHT", 8, 0)
    row.condTag = condTag

    -- Completion check mark
    local checkMark = row:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(checkMark, "bold")
    checkMark:SetText("|cFF00DD00✓|r")
    checkMark:SetPoint("RIGHT", row, "RIGHT", -8, 0)
    checkMark:Hide()
    row.checkMark = checkMark

    -- Click to select step
    row:EnableMouse(true)
    row:SetScript("OnMouseUp", function(self, button)
        if button == "LeftButton" then
            local stepData = self._stepData
            if stepData and stepData.index then
                BAG.Engine:SetStep(stepData.index)
            end
        end
    end)

    -- Hover effect
    row:SetScript("OnEnter", function(self)
        if not self._isCurrent then
            local hc = Styles.Colors.bgStepActive
            self.bg:SetColorTexture(hc[1], hc[2], hc[3], hc[4] * 0.5)
        end
    end)
    row:SetScript("OnLeave", function(self)
        if not self._isCurrent then
            local nc = Styles.Colors.bgStep
            self.bg:SetColorTexture(nc[1], nc[2], nc[3], nc[4])
        end
    end)

    Panel._rows[index] = row
end

-- Refresh the step panel display
function Panel:Refresh()
    Styles = BAG.UI.Styles
    local currentIdx = BAG.Engine:GetCurrentStepIndex() or 1
    local steps = BAG.Engine:GetStepRange(currentIdx, MAX_VISIBLE_STEPS)

    -- Update scroll child height
    if Panel._scrollChild then
        Panel._scrollChild:SetHeight(#steps * (52 + Styles.Layout.stepSpacing) + 10)
        Panel._scrollChild:SetWidth(Panel._container:GetWidth() - 24)
    end

    -- Update each row
    for i = 1, MAX_VISIBLE_STEPS do
        local row = Panel._rows[i]
        if not row then break end

        local stepInfo = steps[i]
        if stepInfo then
            row:Show()
            self:UpdateRow(row, stepInfo)
        else
            row:Hide()
        end
    end
end

-- Update a single step row with step data
function Panel:UpdateRow(row, stepInfo)
    local data = stepInfo.data
    local isCurrent = stepInfo.isCurrent
    local isComplete = stepInfo.isComplete

    row._stepData = stepInfo
    row._isCurrent = isCurrent

    -- Step number
    row.stepNum:SetText(tostring(stepInfo.index))

    -- Step icon
    local icon = BAG.Navigator:GetStepIcon(data.type)
    row.icon:SetText(icon)

    -- Main text
    local text = data.text or BAG.Navigator:FormatStep(data)
    row.mainText:SetText(text)

    -- Type tag
    local typeStr = (data.type or "step"):upper()
    row.typeTag:SetText(BAG.Utils:NeonBlue(typeStr))

    -- Coordinates
    local coordStr = BAG.Navigator:GetStepCoords(data)
    if coordStr then
        row.coords:SetText(coordStr)
        row.coords:Show()
    else
        row.coords:Hide()
    end

    -- Quest progress
    if data.questID and BAG.API.Quest:IsActive(data.questID) then
        local progressStr = BAG.QuestTrack:GetProgressString(data.questID)
        if progressStr then
            row.progress:SetText(progressStr)
            row.progress:Show()
        else
            row.progress:Hide()
        end
    else
        row.progress:Hide()
    end

    -- Condition tags
    if data.conditions and #data.conditions > 0 then
        local tags = {}
        for _, cond in ipairs(data.conditions) do
            if cond.type == "class" then
                tags[#tags + 1] = cond.class
            elseif cond.type == "race" then
                tags[#tags + 1] = cond.race
            elseif cond.type == "profession" then
                tags[#tags + 1] = cond.profession
            end
        end
        if #tags > 0 then
            row.condTag:SetText("[" .. table.concat(tags, ", ") .. "]")
            row.condTag:Show()
        else
            row.condTag:Hide()
        end
    else
        row.condTag:Hide()
    end

    -- Current step highlighting
    if isCurrent then
        local ac = Styles.Colors.bgStepActive
        row.bg:SetColorTexture(ac[1], ac[2], ac[3], ac[4])
        row.accentBar:Show()
        Styles:ApplyTextColor(row.mainText, "textWhite")
    else
        local nc = Styles.Colors.bgStep
        row.bg:SetColorTexture(nc[1], nc[2], nc[3], nc[4])
        row.accentBar:Hide()
        Styles:ApplyTextColor(row.mainText, "textLight")
    end

    -- Completion check
    if isComplete then
        row.checkMark:Show()
        Styles:ApplyTextColor(row.mainText, "textMuted")
    else
        row.checkMark:Hide()
    end
end

-- Show guide complete message
function Panel:ShowComplete()
    for i = 1, MAX_VISIBLE_STEPS do
        local row = Panel._rows[i]
        if row then
            if i == 1 then
                row:Show()
                row.stepNum:SetText("")
                row.icon:SetText("|cFF00DD00★|r")
                row.mainText:SetText("|cFF00DD00Guide Complete! Excellent work, adventurer.|r")
                row.typeTag:SetText("")
                row.coords:Hide()
                row.progress:Hide()
                row.condTag:Hide()
                row.checkMark:Hide()
                row.accentBar:Show()
            else
                row:Hide()
            end
        end
    end
end
