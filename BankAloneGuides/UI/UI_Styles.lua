--[[
    Bank Alone Guides - UI Styles
    Centralized styling functions for UI elements
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.UI = BAG.UI or {}
BAG.UI.Styles = {}

-- Apply standard frame styling
function BAG.UI.Styles:StyleFrame(frame, options)
    options = options or {}
    
    local backdrop = BAG.Theme:GetBackdrop(options.border ~= false)
    frame:SetBackdrop(backdrop)
    
    BAG.Theme:ApplyColor(frame, options.bgColor or "Background")
    
    if options.border ~= false then
        BAG.Theme:ApplyBorderColor(frame, options.borderColor or "Border")
    end
    
    if options.alpha then
        frame:SetAlpha(options.alpha)
    end
    
    return frame
end

-- Apply button styling
function BAG.UI.Styles:StyleButton(button, options)
    options = options or {}
    
    -- Set up backdrop
    local backdrop = BAG.Theme:GetBackdrop(true)
    button:SetBackdrop(backdrop)
    
    -- Normal state
    BAG.Theme:ApplyColor(button, "Secondary")
    BAG.Theme:ApplyBorderColor(button, "Border")
    
    -- Highlight texture
    local highlight = button:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    highlight:SetBlendMode("ADD")
    highlight:SetAllPoints(button)
    highlight:SetVertexColor(BAG.Theme:GetColor("Accent"))
    highlight:SetAlpha(0.3)
    
    -- Button text
    local text = button:GetFontString() or button:CreateFontString(nil, "OVERLAY")
    text:SetFont(BAG.Theme.Fonts.Normal, BAG.Theme.FontSizes.Normal, "OUTLINE")
    text:SetTextColor(BAG.Theme:GetColor("Text"))
    text:SetPoint("CENTER")
    button:SetFontString(text)
    
    -- Hover effect
    button:SetScript("OnEnter", function(self)
        BAG.Theme:ApplyColor(self, "SecondaryLight")
        BAG.Theme:ApplyBorderColor(self, "Primary")
    end)
    
    button:SetScript("OnLeave", function(self)
        BAG.Theme:ApplyColor(self, "Secondary")
        BAG.Theme:ApplyBorderColor(self, "Border")
    end)
    
    return button
end

-- Create a styled title bar
function BAG.UI.Styles:CreateTitleBar(parent, title)
    local titleBar = CreateFrame("Frame", nil, parent)
    titleBar:SetHeight(BAG.Layout.TitleBar.Height)
    titleBar:SetPoint("TOPLEFT")
    titleBar:SetPoint("TOPRIGHT")
    
    -- Background
    local bg = titleBar:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
    bg:SetVertexColor(BAG.Theme:GetColor("PrimaryDark"))
    
    -- Title text
    titleBar.title = titleBar:CreateFontString(nil, "OVERLAY")
    titleBar.title:SetFont(BAG.Theme.Fonts.Title, BAG.Theme.FontSizes.Title, "OUTLINE")
    titleBar.title:SetTextColor(BAG.Theme:GetColor("Text"))
    titleBar.title:SetText(title or "Bank Alone Guides")
    titleBar.title:SetPoint("LEFT", 12, 0)
    
    return titleBar
end

-- Create a styled scrollable list
function BAG.UI.Styles:CreateScrollList(parent, itemHeight, numVisible)
    local list = CreateFrame("Frame", nil, parent)
    
    -- Scroll frame
    local scroll = CreateFrame("ScrollFrame", nil, list)
    scroll:SetPoint("TOPLEFT")
    scroll:SetPoint("BOTTOMRIGHT", -20, 0)
    
    -- Content frame
    local content = CreateFrame("Frame", nil, scroll)
    content:SetWidth(1)
    scroll:SetScrollChild(content)
    
    -- Scrollbar
    local scrollbar = CreateFrame("Slider", nil, list, "UIPanelScrollBarTemplate")
    scrollbar:SetPoint("TOPRIGHT", -4, -16)
    scrollbar:SetPoint("BOTTOMRIGHT", -4, 16)
    scrollbar:SetMinMaxValues(0, 100)
    scrollbar:SetValueStep(itemHeight)
    scrollbar:SetWidth(16)
    
    -- Style scrollbar
    scrollbar:GetThumbTexture():SetTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
    scrollbar:GetThumbTexture():SetVertexColor(BAG.Theme:GetColor("Primary"))
    
    scrollbar:SetScript("OnValueChanged", function(self, value)
        scroll:SetVerticalScroll(value)
    end)
    
    scroll:SetScript("OnMouseWheel", function(self, delta)
        local current = scrollbar:GetValue()
        local min, max = scrollbar:GetMinMaxValues()
        local newValue = current - (delta * itemHeight)
        newValue = math.max(min, math.min(max, newValue))
        scrollbar:SetValue(newValue)
    end)
    
    list.scroll = scroll
    list.content = content
    list.scrollbar = scrollbar
    
    return list
end

-- Create a step icon
function BAG.UI.Styles:CreateStepIcon(parent, stepType)
    local icon = parent:CreateTexture(nil, "ARTWORK")
    icon:SetSize(BAG.Layout.Step.IconSize, BAG.Layout.Step.IconSize)
    
    -- Map step types to icons
    local iconTextures = {
        accept = "Interface\\GossipFrame\\AvailableQuestIcon",
        turnin = "Interface\\GossipFrame\\ActiveQuestIcon",
        kill = "Interface\\Icons\\Ability_Warrior_Challange",
        collect = "Interface\\Icons\\INV_Misc_Bag_08",
        goto = "Interface\\Icons\\Ability_Tracking",
        train = "Interface\\Icons\\Spell_Nature_Polymorph",
        vendor = "Interface\\Icons\\INV_Misc_Coin_01",
        buy = "Interface\\Icons\\INV_Misc_Coin_02",
        use = "Interface\\Icons\\INV_Misc_QuestionMark",
        equip = "Interface\\Icons\\INV_Chest_Cloth_17",
        hs = "Interface\\Icons\\INV_Misc_Rune_01",
        fly = "Interface\\Icons\\Ability_Mount_Gryphon_01",
        fp = "Interface\\Icons\\Ability_Mount_Gryphon_01",
        boat = "Interface\\Icons\\Spell_Frost_SummonWaterElemental",
        zeppelin = "Interface\\Icons\\Ability_Vehicle_SiegeEngineRam",
        run = "Interface\\Icons\\Ability_Tracking",
        mount = "Interface\\Icons\\Ability_Mount_RidingHorse",
        note = "Interface\\Icons\\INV_Misc_Note_01",
    }
    
    local texture = iconTextures[stepType] or "Interface\\Icons\\INV_Misc_QuestionMark"
    icon:SetTexture(texture)
    
    return icon
end

-- Create a progress bar
function BAG.UI.Styles:CreateProgressBar(parent, width, height)
    local bar = CreateFrame("StatusBar", nil, parent)
    bar:SetSize(width, height)
    bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    bar:GetStatusBarTexture():SetVertexColor(BAG.Theme:GetColor("Primary"))
    bar:SetMinMaxValues(0, 100)
    bar:SetValue(0)
    
    -- Background
    local bg = bar:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
    bg:SetVertexColor(BAG.Theme:GetColor("BackgroundDark"))
    
    -- Border
    local border = CreateFrame("Frame", nil, bar)
    border:SetAllPoints()
    border:SetBackdrop({
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets = {left = 2, right = 2, top = 2, bottom = 2},
    })
    border:SetBackdropBorderColor(BAG.Theme:GetColor("Border"))
    
    -- Text
    bar.text = bar:CreateFontString(nil, "OVERLAY")
    bar.text:SetFont(BAG.Theme.Fonts.Number, BAG.Theme.FontSizes.Small, "OUTLINE")
    bar.text:SetTextColor(BAG.Theme:GetColor("Text"))
    bar.text:SetPoint("CENTER")
    
    return bar
end

-- Create a tooltip
function BAG.UI.Styles:ShowTooltip(frame, title, text)
    GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
    GameTooltip:ClearLines()
    
    if title then
        GameTooltip:AddLine(title, BAG.Theme:GetColor("Primary"))
    end
    
    if text then
        GameTooltip:AddLine(text, BAG.Theme:GetColor("Text"), true)
    end
    
    GameTooltip:Show()
end

-- Hide tooltip
function BAG.UI.Styles:HideTooltip()
    GameTooltip:Hide()
end

-- Create a separator line
function BAG.UI.Styles:CreateSeparator(parent)
    local separator = parent:CreateTexture(nil, "ARTWORK")
    separator:SetHeight(1)
    separator:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    separator:SetVertexColor(BAG.Theme:GetColor("Border"))
    
    return separator
end

-- Apply glow effect to frame
function BAG.UI.Styles:AddGlow(frame, color)
    if frame.glow then
        return frame.glow
    end
    
    local glow = frame:CreateTexture(nil, "BACKGROUND")
    glow:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    glow:SetPoint("TOPLEFT", -8, 8)
    glow:SetPoint("BOTTOMRIGHT", 8, -8)
    glow:SetBlendMode("ADD")
    glow:SetVertexColor(BAG.Theme:GetColor(color or "Glow"))
    glow:SetAlpha(0.3)
    
    frame.glow = glow
    return glow
end

-- Create a checkbox
function BAG.UI.Styles:CreateCheckbox(parent, label)
    local checkbox = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    checkbox:SetSize(24, 24)
    
    -- Style checkbox
    checkbox:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
    checkbox:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
    checkbox:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
    checkbox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
    
    -- Label
    if label then
        local text = checkbox:CreateFontString(nil, "OVERLAY")
        text:SetFont(BAG.Theme.Fonts.Normal, BAG.Theme.FontSizes.Normal, "OUTLINE")
        text:SetTextColor(BAG.Theme:GetColor("Text"))
        text:SetText(label)
        text:SetPoint("LEFT", checkbox, "RIGHT", 4, 0)
        checkbox.label = text
    end
    
    return checkbox
end

-- Create a dropdown menu
function BAG.UI.Styles:CreateDropdown(parent, width)
    local dropdown = CreateFrame("Frame", nil, parent)
    dropdown:SetSize(width or 150, 32)
    
    self:StyleFrame(dropdown, {border = true})
    
    -- Button
    local button = CreateFrame("Button", nil, dropdown)
    button:SetAllPoints()
    
    -- Text
    button.text = button:CreateFontString(nil, "OVERLAY")
    button.text:SetFont(BAG.Theme.Fonts.Normal, BAG.Theme.FontSizes.Normal, "OUTLINE")
    button.text:SetTextColor(BAG.Theme:GetColor("Text"))
    button.text:SetPoint("LEFT", 8, 0)
    button.text:SetText("Select...")
    
    -- Arrow
    local arrow = button:CreateTexture(nil, "ARTWORK")
    arrow:SetSize(16, 16)
    arrow:SetPoint("RIGHT", -8, 0)
    arrow:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up")
    
    dropdown.button = button
    
    return dropdown
end
