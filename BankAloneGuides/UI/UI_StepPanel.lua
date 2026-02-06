-------------------------------------------------------------------------------
-- Bank Alone Guides — UI / Step Panel
-- Displays current and upcoming guide steps
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.UI.StepPanel = BAG.UI.StepPanel or {}

-- Pool of step row frames
BAG.UI.StepPanel.rows = {}

-- ── Step-type icons (using in-game textures) ──────────────────────────────
local STEP_ICONS = {
    accept   = "Interface\\GossipFrame\\AvailableQuestIcon",
    turnin   = "Interface\\GossipFrame\\ActiveQuestIcon",
    kill     = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_8",  -- skull
    collect  = "Interface\\Icons\\INV_Misc_Bag_10",
    travel   = "Interface\\Minimap\\Tracking\\None",
    goto     = "Interface\\Minimap\\Tracking\\None",
    train    = "Interface\\GossipFrame\\TrainerGossipIcon",
    vendor   = "Interface\\GossipFrame\\VendorGossipIcon",
    fly      = "Interface\\GossipFrame\\TaxiGossipIcon",
    fp       = "Interface\\GossipFrame\\TaxiGossipIcon",
    hearth   = "Interface\\Icons\\INV_Misc_Rune_01",
    hs       = "Interface\\Icons\\INV_Misc_Rune_01",
    note     = "Interface\\GossipFrame\\GossipGossipIcon",
    use      = "Interface\\Icons\\INV_Misc_QuestionMark",
    equip    = "Interface\\PaperDollInfoFrame\\UI-EquipmentManager-Toggle",
    buy      = "Interface\\GossipFrame\\VendorGossipIcon",
    boat     = "Interface\\Minimap\\Tracking\\None",
    zeppelin = "Interface\\Minimap\\Tracking\\None",
    run      = "Interface\\Minimap\\Tracking\\None",
    mount    = "Interface\\Icons\\Ability_Mount_RidingHorse",
}

--- Create the step panel container.
function BAG.UI.StepPanel:Create(parent)
    if self.container then return end

    local layout = BAG.Layout.StepPanel

    -- Container frame
    local container = CreateFrame("Frame", "BAG_StepPanel", parent)
    container:SetPoint("TOPLEFT", parent, "TOPLEFT", layout.PaddingX,
                       -(BAG.Layout.TitleBar.Height + 28 + BAG.Layout.ProgressBar.Height))
    container:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT",
                       -layout.PaddingX, BAG.Layout.ButtonBar.Height + layout.PaddingY)
    self.container = container

    -- Create step rows
    self:CreateRows()
end

--- Create reusable step row frames.
function BAG.UI.StepPanel:CreateRows()
    local layout = BAG.Layout.StepPanel
    local count  = layout.VisibleSteps or 6

    for i = 1, count do
        local row = self:CreateSingleRow(self.container, i)
        self.rows[i] = row
    end
end

--- Create a single step row.
function BAG.UI.StepPanel:CreateSingleRow(parent, index)
    local layout = BAG.Layout.StepPanel

    local row = CreateFrame("Frame", "BAG_StepRow" .. index, parent)
    row:SetHeight(layout.StepHeight)

    if index == 1 then
        row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, 0)
        row:SetPoint("TOPRIGHT", parent, "TOPRIGHT", 0, 0)
    else
        row:SetPoint("TOPLEFT", self.rows[index - 1], "BOTTOMLEFT", 0, -layout.StepGap)
        row:SetPoint("TOPRIGHT", self.rows[index - 1], "BOTTOMRIGHT", 0, -layout.StepGap)
    end

    -- Row background
    local bg = row:CreateTexture(nil, "BACKGROUND")
    bg:SetTexture(BAG.Theme.Textures.Flat)
    bg:SetVertexColor(BAG.Theme:RGBA(BAG.Theme.Colors.BackgroundAlt))
    bg:SetAllPoints(row)
    row._bg = bg

    -- Step type icon
    local icon = row:CreateTexture(nil, "ARTWORK")
    icon:SetSize(layout.IconSize, layout.IconSize)
    icon:SetPoint("LEFT", row, "LEFT", 6, 0)
    row._icon = icon

    -- Step number
    local numText = row:CreateFontString(nil, "OVERLAY")
    numText:SetFont(BAG.Theme.Fonts.Tiny.face, BAG.Theme.Fonts.Tiny.size, "OUTLINE")
    numText:SetPoint("TOPLEFT", icon, "TOPRIGHT", 4, 0)
    numText:SetTextColor(BAG.Theme:RGBA(BAG.Theme.Colors.TextDim))
    row._numText = numText

    -- Main instruction text
    local mainText = row:CreateFontString(nil, "OVERLAY")
    mainText:SetFont(BAG.Theme.Fonts.Normal.face, BAG.Theme.Fonts.Normal.size, BAG.Theme.Fonts.Normal.flags)
    mainText:SetPoint("TOPLEFT", icon, "TOPRIGHT", 4, -2)
    mainText:SetPoint("RIGHT", row, "RIGHT", -8, 0)
    mainText:SetJustifyH("LEFT")
    mainText:SetWordWrap(true)
    mainText:SetMaxLines(2)
    mainText:SetTextColor(BAG.Theme:RGBA(BAG.Theme.Colors.Text))
    row._mainText = mainText

    -- Coordinate / zone text
    local coordText = row:CreateFontString(nil, "OVERLAY")
    coordText:SetFont(BAG.Theme.Fonts.Tiny.face, layout.CoordFontSize, "")
    coordText:SetPoint("BOTTOMLEFT", icon, "BOTTOMRIGHT", 4, 2)
    coordText:SetTextColor(BAG.Theme:RGBA(BAG.Theme.Colors.TextDim))
    row._coordText = coordText

    -- Condition tags (class/race/profession)
    local tagText = row:CreateFontString(nil, "OVERLAY")
    tagText:SetFont(BAG.Theme.Fonts.Tiny.face, BAG.Theme.Fonts.Tiny.size, "OUTLINE")
    tagText:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT", -6, 4)
    tagText:SetJustifyH("RIGHT")
    tagText:SetTextColor(BAG.Theme:RGBA(BAG.Theme.Colors.Warning))
    row._tagText = tagText

    -- Active step indicator (left edge highlight)
    local indicator = row:CreateTexture(nil, "ARTWORK")
    indicator:SetTexture(BAG.Theme.Textures.Flat)
    indicator:SetVertexColor(BAG.Theme:RGBA(BAG.Theme.Colors.Primary))
    indicator:SetWidth(3)
    indicator:SetPoint("TOPLEFT", row, "TOPLEFT", 0, 0)
    indicator:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", 0, 0)
    indicator:Hide()
    row._indicator = indicator

    row:Hide()
    return row
end

--- Refresh the step panel with current engine data.
function BAG.UI.StepPanel:Refresh()
    local steps = BAG.Engine:GetVisibleSteps(BAG.Layout.StepPanel.VisibleSteps)

    for i, row in ipairs(self.rows) do
        local data = steps[i]
        if data then
            self:PopulateRow(row, data)
            row:Show()
        else
            row:Hide()
        end
    end
end

--- Fill a row with step data.
function BAG.UI.StepPanel:PopulateRow(row, data)
    local step = data.step
    if not step then return end

    local stepType = step.type or "note"

    -- Icon
    local iconPath = STEP_ICONS[stepType] or STEP_ICONS.note
    row._icon:SetTexture(iconPath)

    -- Step number
    row._numText:SetText("#" .. data.index)

    -- Main text
    local text = step.text or step.note or ""
    if stepType == "accept" then
        text = "Accept: " .. (step.questName or text)
    elseif stepType == "turnin" then
        text = "Turn in: " .. (step.questName or text)
    elseif stepType == "kill" then
        text = "Defeat: " .. (step.target or text)
    elseif stepType == "collect" then
        text = "Collect: " .. (step.itemName or text)
    elseif stepType == "goto" or stepType == "travel" then
        text = "Travel: " .. (step.text or "Go to destination")
    elseif stepType == "fly" then
        text = "Fly to: " .. (step.destination or text)
    elseif stepType == "hs" or stepType == "hearth" then
        text = "Use Hearthstone"
    elseif stepType == "train" then
        text = "Train: " .. (step.skill or text)
    elseif stepType == "vendor" or stepType == "buy" then
        text = "Visit vendor: " .. (step.text or "")
    end
    row._mainText:SetText(text)

    -- Coordinates
    if step.zone and step.x and step.y then
        row._coordText:SetText(step.zone .. " (" ..
            string.format("%.1f", step.x) .. ", " ..
            string.format("%.1f", step.y) .. ")")
        row._coordText:Show()
    elseif step.zone then
        row._coordText:SetText(step.zone)
        row._coordText:Show()
    else
        row._coordText:Hide()
    end

    -- Condition tags
    local tags = self:BuildTags(step)
    if tags ~= "" then
        row._tagText:SetText(tags)
        row._tagText:Show()
    else
        row._tagText:Hide()
    end

    -- Active step highlight
    if data.isCurrent then
        row._bg:SetVertexColor(BAG.Theme:RGBA(BAG.Theme.Colors.StepActive))
        row._indicator:Show()
        row._mainText:SetTextColor(BAG.Theme:RGBA(BAG.Theme.Colors.TextHighlight))
    elseif data.isComplete then
        row._bg:SetVertexColor(BAG.Theme:RGBA(BAG.Theme.Colors.StepComplete))
        row._indicator:Hide()
        row._mainText:SetTextColor(BAG.Theme:RGBA(BAG.Theme.Colors.Success))
    else
        row._bg:SetVertexColor(BAG.Theme:RGBA(BAG.Theme.Colors.BackgroundAlt))
        row._indicator:Hide()
        row._mainText:SetTextColor(BAG.Theme:RGBA(BAG.Theme.Colors.Text))
    end
end

--- Build tag strings from step conditions.
function BAG.UI.StepPanel:BuildTags(step)
    if not step.conditions then return "" end
    local tags = {}
    for _, cond in ipairs(step.conditions) do
        if cond.type == "class" then
            tags[#tags + 1] = BAG.Theme:Colorize("[" .. cond.value .. "]", BAG.Theme.Colors.Warning)
        elseif cond.type == "race" then
            tags[#tags + 1] = BAG.Theme:Colorize("[" .. cond.value .. "]", BAG.Theme.Colors.PrimaryLight)
        elseif cond.type == "profession" then
            tags[#tags + 1] = BAG.Theme:Colorize("[" .. cond.name .. "]", BAG.Theme.Colors.Accent)
        end
    end
    return table.concat(tags, " ")
end
