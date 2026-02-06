--[[
    Bank Alone Guides - Main Frame
    SCS / Bank Alone Guides
    
    Creates the main guide window with title bar, close/minimize, neon-blue SCS theme.
]]

local BAG = BankAlone

BAG.UI = BAG.UI or {}
BAG.UI.MainFrame = BAG.UI.MainFrame or {}
local MainFrame = BAG.UI.MainFrame
local Styles = BAG.UI.Styles
local Layout

-- Create the main guide window
function MainFrame:Create()
    Layout = Styles.Layout

    local frame = CreateFrame("Frame", "BAG_MainFrame", UIParent, "BackdropTemplate")
    frame:SetSize(340, 480)
    frame:SetPoint("CENTER", UIParent, "CENTER", 300, 0)
    frame:SetFrameStrata("MEDIUM")
    frame:SetFrameLevel(10)
    frame:SetClampedToScreen(true)
    frame:SetMovable(true)
    frame:SetResizable(true)

    -- Set min/max resize bounds
    if frame.SetResizeBounds then
        frame:SetResizeBounds(280, 300, 500, 700)
    elseif frame.SetMinResize then
        frame:SetMinResize(280, 300)
        frame:SetMaxResize(500, 700)
    end

    -- Background
    Styles:CreateBackground(frame, "bgDark")

    -- Border
    Styles:CreateBorder(frame, "borderNeon", 1.5)

    -- Top glow line
    Styles:CreateGlowLine(frame, "TOP", "accent")

    -- Title bar
    self:CreateTitleBar(frame)

    -- Progress bar
    self:CreateProgressBar(frame)

    -- Step panel container
    self:CreateStepContainer(frame)

    -- Button bar
    BAG.UI.Buttons:Create(frame)

    -- Resize grip
    self:CreateResizeGrip(frame)

    -- Store reference
    BAG.UI._mainFrame = frame

    -- Mouse interaction for moving
    frame:EnableMouse(true)

    -- Initially hide
    frame:Hide()
end

-- Create the title bar
function MainFrame:CreateTitleBar(parent)
    local titleBar = CreateFrame("Frame", nil, parent)
    titleBar:SetHeight(Layout.titleBarHeight)
    titleBar:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, 0)
    titleBar:SetPoint("TOPRIGHT", parent, "TOPRIGHT", 0, 0)

    -- Title bar background
    local titleBg = titleBar:CreateTexture(nil, "BACKGROUND")
    titleBg:SetAllPoints(titleBar)
    local c = Styles.Colors.secondaryLt
    titleBg:SetColorTexture(c[1], c[2], c[3], c[4])

    -- Bottom separator
    local sep = titleBar:CreateTexture(nil, "ARTWORK")
    local sc = Styles.Colors.borderNeon
    sep:SetColorTexture(sc[1], sc[2], sc[3], sc[4])
    sep:SetHeight(1)
    sep:SetPoint("BOTTOMLEFT", titleBar, "BOTTOMLEFT", 0, 0)
    sep:SetPoint("BOTTOMRIGHT", titleBar, "BOTTOMRIGHT", 0, 0)

    -- Brand icon (text-based)
    local brandIcon = titleBar:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(brandIcon, "bold")
    brandIcon:SetText("|cFF00CCFF◆|r")
    brandIcon:SetPoint("LEFT", titleBar, "LEFT", 8, 0)

    -- Title text
    local titleText = titleBar:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(titleText, "header")
    Styles:ApplyTextColor(titleText, "textHighlight")
    titleText:SetText("Bank Alone Guides")
    titleText:SetPoint("LEFT", brandIcon, "RIGHT", 6, 0)
    titleText:SetPoint("RIGHT", titleBar, "RIGHT", -60, 0)
    titleText:SetJustifyH("LEFT")
    titleText:SetWordWrap(false)
    parent.titleText = titleText

    -- Dragging
    titleBar:EnableMouse(true)
    titleBar:RegisterForDrag("LeftButton")
    titleBar:SetScript("OnDragStart", function()
        parent:StartMoving()
    end)
    titleBar:SetScript("OnDragStop", function()
        parent:StopMovingOrSizing()
        BAG.UI:SavePosition()
    end)

    -- Minimize button
    local minBtn = CreateFrame("Button", nil, titleBar)
    minBtn:SetSize(18, 18)
    minBtn:SetPoint("RIGHT", titleBar, "RIGHT", -26, 0)

    local minText = minBtn:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(minText, "bold")
    minText:SetText("|cFF00CCFF—|r")
    minText:SetAllPoints(minBtn)
    minBtn:SetScript("OnClick", function()
        BAG.UI:ToggleMinimize()
    end)
    minBtn:SetScript("OnEnter", function(self)
        minText:SetText("|cFFFFFFFF—|r")
    end)
    minBtn:SetScript("OnLeave", function(self)
        minText:SetText("|cFF00CCFF—|r")
    end)

    -- Close button
    local closeBtn = CreateFrame("Button", nil, titleBar)
    closeBtn:SetSize(18, 18)
    closeBtn:SetPoint("RIGHT", titleBar, "RIGHT", -6, 0)

    local closeText = closeBtn:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(closeText, "bold")
    closeText:SetText("|cFF00CCFF✕|r")
    closeText:SetAllPoints(closeBtn)
    closeBtn:SetScript("OnClick", function()
        BAG.UI:Hide()
    end)
    closeBtn:SetScript("OnEnter", function(self)
        closeText:SetText("|cFFFF3333✕|r")
    end)
    closeBtn:SetScript("OnLeave", function(self)
        closeText:SetText("|cFF00CCFF✕|r")
    end)

    parent.titleBar = titleBar
end

-- Create the progress bar
function MainFrame:CreateProgressBar(parent)
    local barContainer = CreateFrame("Frame", nil, parent)
    barContainer:SetHeight(Layout.progressBarH + 10)
    barContainer:SetPoint("TOPLEFT", parent.titleBar, "BOTTOMLEFT", Layout.framePadding, -4)
    barContainer:SetPoint("TOPRIGHT", parent.titleBar, "BOTTOMRIGHT", -Layout.framePadding, -4)

    -- Progress bar background
    local barBg = CreateFrame("Frame", nil, barContainer)
    barBg:SetHeight(Layout.progressBarH)
    barBg:SetPoint("TOPLEFT", barContainer, "TOPLEFT", 0, 0)
    barBg:SetPoint("TOPRIGHT", barContainer, "TOPRIGHT", 0, 0)

    local bgTex = barBg:CreateTexture(nil, "BACKGROUND")
    bgTex:SetAllPoints(barBg)
    local bgc = Styles.Colors.progressBg
    bgTex:SetColorTexture(bgc[1], bgc[2], bgc[3], bgc[4])

    -- Progress bar fill (using StatusBar)
    local bar = CreateFrame("StatusBar", nil, barBg)
    bar:SetAllPoints(barBg)
    bar:SetMinMaxValues(0, 100)
    bar:SetValue(0)

    local fillTex = bar:CreateTexture(nil, "ARTWORK")
    local fc = Styles.Colors.progressFill
    fillTex:SetColorTexture(fc[1], fc[2], fc[3], fc[4])
    bar:SetStatusBarTexture(fillTex)

    parent.progressBar = bar

    -- Progress text
    local progText = barContainer:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(progText, "tiny")
    Styles:ApplyTextColor(progText, "textMuted")
    progText:SetPoint("TOP", barBg, "BOTTOM", 0, -2)
    progText:SetText("0 / 0 (0%)")
    parent.progressText = progText
end

-- Create the step panel container (where steps are displayed)
function MainFrame:CreateStepContainer(parent)
    local container = CreateFrame("Frame", nil, parent)
    container:SetPoint("TOPLEFT", parent.titleBar, "BOTTOMLEFT", Layout.framePadding, -(Layout.progressBarH + 20))
    container:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -Layout.framePadding, 40)

    parent.stepContainer = container

    -- Initialize the step panel
    BAG.UI.StepPanel:Create(container)
end

-- Create resize grip
function MainFrame:CreateResizeGrip(parent)
    local grip = CreateFrame("Frame", nil, parent)
    grip:SetSize(16, 16)
    grip:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -2, 2)
    grip:EnableMouse(true)

    local gripTex = grip:CreateTexture(nil, "OVERLAY")
    local gc = Styles.Colors.borderDim
    gripTex:SetColorTexture(gc[1], gc[2], gc[3], gc[4])
    gripTex:SetAllPoints(grip)

    -- Draw grip lines
    local line1 = grip:CreateTexture(nil, "OVERLAY", nil, 1)
    local lc = Styles.Colors.primary
    line1:SetColorTexture(lc[1], lc[2], lc[3], 0.5)
    line1:SetSize(10, 1)
    line1:SetPoint("BOTTOMRIGHT", grip, "BOTTOMRIGHT", -2, 5)

    local line2 = grip:CreateTexture(nil, "OVERLAY", nil, 1)
    line2:SetColorTexture(lc[1], lc[2], lc[3], 0.5)
    line2:SetSize(6, 1)
    line2:SetPoint("BOTTOMRIGHT", grip, "BOTTOMRIGHT", -2, 8)

    grip:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            parent:StartSizing("BOTTOMRIGHT")
        end
    end)
    grip:SetScript("OnMouseUp", function(self, button)
        parent:StopMovingOrSizing()
        BAG.SavedVars:SetUI("width", parent:GetWidth())
        BAG.SavedVars:SetUI("height", parent:GetHeight())
        BAG.UI:SavePosition()
        BAG.UI.StepPanel:Refresh()
    end)
end

-- Toggle minimize
function BAG.UI:ToggleMinimize()
    local frame = self._mainFrame
    if not frame then return end

    if frame._minimized then
        -- Restore
        frame:SetHeight(frame._savedHeight or 480)
        if frame.stepContainer then frame.stepContainer:Show() end
        if frame.progressBar then frame.progressBar:GetParent():Show() end
        frame._minimized = false
    else
        -- Minimize
        frame._savedHeight = frame:GetHeight()
        frame:SetHeight(Styles.Layout.titleBarHeight + 2)
        if frame.stepContainer then frame.stepContainer:Hide() end
        if frame.progressBar then frame.progressBar:GetParent():Hide() end
        frame._minimized = true
    end
end
