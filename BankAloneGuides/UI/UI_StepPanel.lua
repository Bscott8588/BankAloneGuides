--[[
    Bank Alone Guides - Step Panel (Zygor-style)
    SCS / Bank Alone Guides
    
    Displays quest objectives with live progression tracking.
    
    Layout like Zygor:
      >> PRIMARY TASK (highlighted at top with live quest objectives)
         - Objective 1 (3/5)
         - Objective 2 (done)
         . Coordinates for objectives
      
      UPCOMING STEPS (next guide steps)
      
      SECONDARY QUESTS (other active quests from the guide with their progress)
         - Kill Sunscale enemies
         - Collect 12 Raptor Heads (0/12)
]]

local BAG = BankAlone

BAG.UI = BAG.UI or {}
BAG.UI.StepPanel = BAG.UI.StepPanel or {}
local Panel = BAG.UI.StepPanel
local Styles

-- Maximum display rows
local MAX_DISPLAY_ROWS = 12

-- Row pool
Panel._rows = {}
Panel._container = nil

-- ============================================================
-- CREATE
-- ============================================================

function Panel:Create(container)
    Styles = BAG.UI.Styles
    Panel._container = container

    -- Scroll frame
    local scrollFrame = CreateFrame("ScrollFrame", "BAG_StepScroll", container, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", container, "TOPLEFT", 0, 0)
    scrollFrame:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -20, 0)

    local scrollChild = CreateFrame("Frame", "BAG_StepScrollChild", scrollFrame)
    scrollChild:SetWidth(container:GetWidth() - 24)
    scrollChild:SetHeight(1)
    scrollFrame:SetScrollChild(scrollChild)

    Panel._scrollFrame = scrollFrame
    Panel._scrollChild = scrollChild

    -- Pre-create row frames (they get dynamically sized)
    for i = 1, MAX_DISPLAY_ROWS do
        self:CreateRow(scrollChild, i)
    end
end

-- Create a single display row (variable height)
function Panel:CreateRow(parent, index)
    local row = CreateFrame("Frame", "BAG_Row" .. index, parent)
    row:SetHeight(20) -- will be resized dynamically
    row:SetPoint("LEFT", parent, "LEFT", 0, 0)
    row:SetPoint("RIGHT", parent, "RIGHT", 0, 0)
    -- Y position set during layout

    -- Background
    local bg = row:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(row)
    local c = Styles.Colors.bgStep
    bg:SetColorTexture(c[1], c[2], c[3], c[4])
    row.bg = bg

    -- Left accent bar (neon blue for primary, dim for others)
    local accentBar = row:CreateTexture(nil, "ARTWORK")
    local ac = Styles.Colors.primary
    accentBar:SetColorTexture(ac[1], ac[2], ac[3], ac[4])
    accentBar:SetWidth(3)
    accentBar:SetPoint("TOPLEFT", row, "TOPLEFT", 0, 0)
    accentBar:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", 0, 0)
    accentBar:Hide()
    row.accentBar = accentBar

    -- Icon (quest icon texture string)
    local icon = row:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(icon, "normal")
    icon:SetPoint("TOPLEFT", row, "TOPLEFT", 8, -4)
    row.icon = icon

    -- Header text (the step action: ">> Kill Plainstrider enemies")
    local headerText = row:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(headerText, "normal")
    Styles:ApplyTextColor(headerText, "textWhite")
    headerText:SetPoint("TOPLEFT", icon, "TOPRIGHT", 4, 0)
    headerText:SetPoint("RIGHT", row, "RIGHT", -8, 0)
    headerText:SetJustifyH("LEFT")
    headerText:SetWordWrap(true)
    headerText:SetMaxLines(3)
    row.headerText = headerText

    -- Objectives container (font string for multi-line objective text)
    local objText = row:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(objText, "small")
    objText:SetPoint("TOPLEFT", row, "TOPLEFT", 22, -20)
    objText:SetPoint("RIGHT", row, "RIGHT", -8, 0)
    objText:SetJustifyH("LEFT")
    objText:SetWordWrap(true)
    objText:SetMaxLines(8)
    objText:SetSpacing(2)
    row.objText = objText

    -- Coordinates / waypoint hints
    local coordText = row:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(coordText, "tiny")
    Styles:ApplyTextColor(coordText, "textMuted")
    coordText:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", 22, 3)
    coordText:SetPoint("RIGHT", row, "RIGHT", -8, 0)
    coordText:SetJustifyH("LEFT")
    coordText:SetMaxLines(2)
    coordText:SetWordWrap(true)
    row.coordText = coordText

    -- Section label (for "Secondary Quests" divider)
    local sectionLabel = row:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(sectionLabel, "tiny")
    Styles:ApplyTextColor(sectionLabel, "primaryDim")
    sectionLabel:SetPoint("TOPLEFT", row, "TOPLEFT", 6, -2)
    sectionLabel:Hide()
    row.sectionLabel = sectionLabel

    -- Click handler
    row:EnableMouse(true)
    row:SetScript("OnMouseUp", function(self, button)
        if button == "LeftButton" and self._stepIndex then
            BAG.Engine:SetStep(self._stepIndex)
        end
    end)

    -- Hover
    row:SetScript("OnEnter", function(self)
        if self._role ~= "primary" and self._role ~= "divider" then
            local hc = Styles.Colors.bgStepActive
            self.bg:SetColorTexture(hc[1], hc[2], hc[3], hc[4] * 0.4)
        end
    end)
    row:SetScript("OnLeave", function(self)
        if self._role ~= "primary" and self._role ~= "divider" then
            local nc = self._bgColor or Styles.Colors.bgStep
            self.bg:SetColorTexture(nc[1], nc[2], nc[3], nc[4])
        end
    end)

    Panel._rows[index] = row
end

-- ============================================================
-- REFRESH (main entry point, called on every update)
-- ============================================================

function Panel:Refresh()
    Styles = BAG.UI.Styles

    -- Get the smart display list from the engine
    local displayList = BAG.Engine:GetDisplayList()

    -- Build final row data with dividers
    local rowData = {}
    local lastRole = nil
    local hasSecondary = false

    for _, item in ipairs(displayList) do
        -- Insert divider before secondary section
        if item.role == "secondary" and not hasSecondary then
            hasSecondary = true
            rowData[#rowData + 1] = { role = "divider", label = "Other Active Quests:" }
        end
        rowData[#rowData + 1] = item
        lastRole = item.role
    end

    -- Layout rows
    local yOffset = 0
    local totalHeight = 0

    for i = 1, MAX_DISPLAY_ROWS do
        local row = Panel._rows[i]
        if not row then break end

        local data = rowData[i]
        if data then
            row:Show()

            if data.role == "divider" then
                self:LayoutDivider(row, data, yOffset)
                local h = 18
                row:SetHeight(h)
                yOffset = yOffset - h - 2
                totalHeight = totalHeight + h + 2
            else
                local h = self:LayoutQuestRow(row, data, yOffset)
                row:SetHeight(h)
                yOffset = yOffset - h - Styles.Layout.stepSpacing
                totalHeight = totalHeight + h + Styles.Layout.stepSpacing
            end
        else
            row:Hide()
        end
    end

    -- Resize scroll child
    if Panel._scrollChild then
        Panel._scrollChild:SetHeight(totalHeight + 10)
        if Panel._container then
            Panel._scrollChild:SetWidth(Panel._container:GetWidth() - 24)
        end
    end
end

-- ============================================================
-- LAYOUT: DIVIDER ROW (e.g., "Other Active Quests:")
-- ============================================================

function Panel:LayoutDivider(row, data, yOffset)
    row:ClearAllPoints()
    row:SetPoint("TOPLEFT", Panel._scrollChild, "TOPLEFT", 0, yOffset)
    row:SetPoint("RIGHT", Panel._scrollChild, "RIGHT", 0, 0)

    row._role = "divider"
    row._stepIndex = nil
    row._bgColor = Styles.Colors.bgDark

    -- Background
    local c = Styles.Colors.bgDark
    row.bg:SetColorTexture(c[1], c[2], c[3], c[4])

    -- Hide normal elements
    row.icon:SetText("")
    row.headerText:SetText("")
    row.objText:SetText("")
    row.coordText:SetText("")
    row.accentBar:Hide()

    -- Show section label
    row.sectionLabel:SetText(data.label or "")
    row.sectionLabel:Show()
end

-- ============================================================
-- LAYOUT: QUEST ROW (primary, upcoming, or secondary)
-- ============================================================

function Panel:LayoutQuestRow(row, item, yOffset)
    row:ClearAllPoints()
    row:SetPoint("TOPLEFT", Panel._scrollChild, "TOPLEFT", 0, yOffset)
    row:SetPoint("RIGHT", Panel._scrollChild, "RIGHT", 0, 0)

    row._role = item.role
    row._stepIndex = item.index
    row.sectionLabel:Hide()

    local step = item.data
    local isPrimary = (item.role == "primary")
    local isSecondary = (item.role == "secondary")

    -- ============================================================
    -- BACKGROUND + ACCENT BAR
    -- ============================================================
    if isPrimary then
        local ac = Styles.Colors.bgStepActive
        row.bg:SetColorTexture(ac[1], ac[2], ac[3], ac[4])
        row._bgColor = ac
        row.accentBar:Show()
        local pc = Styles.Colors.primary
        row.accentBar:SetColorTexture(pc[1], pc[2], pc[3], pc[4])
    elseif isSecondary then
        local sc = { 0.08, 0.11, 0.16, 0.80 }
        row.bg:SetColorTexture(sc[1], sc[2], sc[3], sc[4])
        row._bgColor = sc
        row.accentBar:Show()
        local dc = Styles.Colors.borderDim
        row.accentBar:SetColorTexture(dc[1], dc[2], dc[3], dc[4])
    else
        local nc = Styles.Colors.bgStep
        row.bg:SetColorTexture(nc[1], nc[2], nc[3], nc[4])
        row._bgColor = nc
        row.accentBar:Hide()
    end

    -- ============================================================
    -- ICON
    -- ============================================================
    local iconStr = BAG.Navigator:GetStepIcon(step.type)
    row.icon:SetText(iconStr)

    -- ============================================================
    -- HEADER TEXT (the action description)
    -- ============================================================
    local headerStr = self:BuildHeaderText(step, isPrimary, item.isComplete)
    row.headerText:SetText(headerStr)

    if isPrimary then
        Styles:ApplyFont(row.headerText, "normal")
    else
        Styles:ApplyFont(row.headerText, "small")
    end

    -- ============================================================
    -- LIVE QUEST OBJECTIVES (the key Zygor feature)
    -- ============================================================
    local objStr = ""
    local objHeight = 0

    if step.questID and BAG.API.Quest:IsActive(step.questID) then
        objStr = self:BuildObjectiveText(step.questID)
    end

    if objStr ~= "" then
        row.objText:SetText(objStr)
        row.objText:Show()
        -- Measure text height
        objHeight = row.objText:GetStringHeight() or 14
    else
        row.objText:SetText("")
        row.objText:Hide()
    end

    -- ============================================================
    -- COORDINATES / WAYPOINT HINTS
    -- ============================================================
    local coordStr = ""
    if step.x and step.y then
        local zoneStr = step.zone or ""
        coordStr = string.format("|cFF667788\226\151\134 %.1f, %.1f  %s|r", step.x, step.y, zoneStr)
    end
    if coordStr ~= "" then
        row.coordText:SetText(coordStr)
        row.coordText:Show()
    else
        row.coordText:SetText("")
        row.coordText:Hide()
    end

    -- ============================================================
    -- CALCULATE ROW HEIGHT
    -- ============================================================
    local headerHeight = row.headerText:GetStringHeight() or 14
    local coordHeight = (coordStr ~= "") and 12 or 0
    local totalH = 8 + headerHeight + 2

    if objHeight > 0 then
        totalH = totalH + objHeight + 2
    end
    if coordHeight > 0 then
        totalH = totalH + coordHeight + 2
    end

    totalH = math.max(totalH, 28)  -- minimum row height

    -- Reposition objective text based on header height
    row.objText:ClearAllPoints()
    row.objText:SetPoint("TOPLEFT", row, "TOPLEFT", 22, -(8 + headerHeight + 1))
    row.objText:SetPoint("RIGHT", row, "RIGHT", -8, 0)

    -- Reposition coord text at bottom
    row.coordText:ClearAllPoints()
    row.coordText:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", 22, 3)
    row.coordText:SetPoint("RIGHT", row, "RIGHT", -8, 0)

    return totalH
end

-- ============================================================
-- BUILD HEADER TEXT
-- The main action line like Zygor's ">> Kill Plainstrider enemies"
-- ============================================================

function Panel:BuildHeaderText(step, isPrimary, isComplete)
    local prefix = ""
    local body = ""
    local color = isPrimary and "FFFFFF" or "CCCCDD"

    if isComplete then
        color = "00CC00"  -- green for completed
    end

    -- Primary steps get >> prefix like Zygor
    if isPrimary then
        prefix = "|cFF00CCFF>>|r "
    end

    -- Build description based on step type
    if step.type == "accept" then
        local qName = self:GetQuestName(step)
        body = "Accept quest " .. qName
    elseif step.type == "turnin" then
        local qName = self:GetQuestName(step)
        body = "Turn in quest " .. qName
    elseif step.type == "complete" then
        local qName = self:GetQuestName(step)
        body = "Complete quest " .. qName
    elseif step.type == "kill" then
        body = "Kill " .. (step.target or "enemies")
        if step.text and step.text ~= "" and not step.text:find("^Kill") then
            body = step.text
        end
    elseif step.type == "collect" then
        body = step.text or "Collect items"
    elseif step.type == "goto" then
        body = step.text or ("Go to " .. (step.zone or "destination"))
    elseif step.type == "hearth" then
        body = "Use Hearthstone"
    elseif step.type == "fly" then
        body = "Fly to " .. (step.zone or step.text or "destination")
    elseif step.type == "flightpath" then
        body = step.text or "Get the flight path"
    elseif step.type == "train" then
        body = step.text or "Train skills"
    elseif step.type == "vendor" or step.type == "buy" then
        body = step.text or "Visit vendor"
    elseif step.type == "note" then
        body = step.text or "Note"
    elseif step.type == "level" then
        body = "Reach level " .. (step.targetLevel or "??")
    else
        body = step.text or (step.type or "Step")
    end

    return prefix .. "|cFF" .. color .. body .. "|r"
end

-- ============================================================
-- BUILD OBJECTIVE TEXT
-- Live quest objectives with counts, colored green/yellow/red
-- Like Zygor's:  "Collect 1 Plainstrider Beak (6/7)"
--                "Razormane Thornweaver Slain: 8/8" (green)
-- ============================================================

function Panel:BuildObjectiveText(questID)
    local logIndex = BAG.API.Quest:GetLogIndex(questID)
    if not logIndex then return "" end

    local numObj = GetNumQuestLeaderBoards(logIndex) or 0
    if numObj == 0 then
        -- No leaderboard objectives, check if it's ready to turn in
        if BAG.API.Quest:IsComplete(questID) then
            return "|cFF00CC00Ready to turn in|r"
        end
        return ""
    end

    local lines = {}
    for i = 1, numObj do
        local text, objType, finished = GetQuestLogLeaderBoard(i, logIndex)
        if text then
            local icon, color
            if finished then
                icon = "|cFF00CC00\226\156\147|r"  -- green checkmark
                color = "00CC00"
            else
                icon = "|cFFFFCC00\226\150\179|r"  -- yellow triangle
                color = "FFCC00"
            end
            lines[#lines + 1] = icon .. " |cFF" .. color .. text .. "|r"
        end
    end

    return table.concat(lines, "\n")
end

-- ============================================================
-- HELPER: Get quest name for display
-- ============================================================

function Panel:GetQuestName(step)
    if not step.questID then return step.text or "quest" end

    -- Try the live quest log first
    local title = BAG.API.Quest:GetQuestTitle(step.questID)
    if title and title ~= ("Quest #" .. step.questID) then
        return "|cFFFFDD00" .. title .. "|r"
    end

    -- Use whatever text the step has
    return "|cFFFFDD00" .. (step.text or ("Quest #" .. step.questID)) .. "|r"
end

-- ============================================================
-- SHOW GUIDE COMPLETE
-- ============================================================

function Panel:ShowComplete()
    for i = 1, MAX_DISPLAY_ROWS do
        local row = Panel._rows[i]
        if row then
            if i == 1 then
                row:Show()
                row:ClearAllPoints()
                row:SetPoint("TOPLEFT", Panel._scrollChild, "TOPLEFT", 0, 0)
                row:SetPoint("RIGHT", Panel._scrollChild, "RIGHT", 0, 0)
                row:SetHeight(50)
                row.icon:SetText("|cFF00DD00\226\152\133|r")
                row.headerText:SetText("|cFF00DD00Guide Complete! Excellent work, adventurer.|r")
                row.objText:SetText("")
                row.objText:Hide()
                row.coordText:SetText("")
                row.coordText:Hide()
                row.sectionLabel:Hide()
                row.accentBar:Show()
                local gc = Styles.Colors.complete
                row.accentBar:SetColorTexture(gc[1], gc[2], gc[3], gc[4])
                local bgc = Styles.Colors.bgStepActive
                row.bg:SetColorTexture(bgc[1], bgc[2], bgc[3], bgc[4])
            else
                row:Hide()
            end
        end
    end
end
