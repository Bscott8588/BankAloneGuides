-------------------------------------------------------------------------------
-- Bank Alone Guides — UI / Main Frame
-- The primary addon window with title bar, resize, and drag
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.UI.MainFrame = BAG.UI.MainFrame or {}

--- Create the main addon frame.
function BAG.UI.MainFrame:Create()
    if self.frame then return self.frame end

    local layout = BAG.Layout.MainFrame
    local theme  = BAG.Theme

    -- ── Main container ─────────────────────────────────────────────────────
    local f = CreateFrame("Frame", "BAG_MainFrame", UIParent, "BackdropTemplate")
    f:SetSize(layout.DefaultWidth, layout.DefaultHeight)
    f:SetPoint(layout.DefaultPoint[1], layout.DefaultPoint[2],
               layout.DefaultPoint[3], layout.DefaultPoint[4], layout.DefaultPoint[5])
    f:SetFrameStrata("MEDIUM")
    f:SetFrameLevel(10)
    f:SetClampedToScreen(true)
    f:SetMovable(true)
    f:SetResizable(true)
    f:EnableMouse(true)
    f:Hide()

    -- Background and border
    BAG.Styles:ApplyBackground(f)
    BAG.Styles:ApplyBorder(f, theme.Colors.Border)
    BAG.Styles:ApplyGlow(f)

    -- ── Title bar region ──────────────────────────────────────────────────
    local titleBar = CreateFrame("Frame", nil, f)
    titleBar:SetHeight(BAG.Layout.TitleBar.Height)
    titleBar:SetPoint("TOPLEFT", f, "TOPLEFT", 0, 0)
    titleBar:SetPoint("TOPRIGHT", f, "TOPRIGHT", 0, 0)
    titleBar:EnableMouse(true)

    -- Title bar background (slightly lighter than main)
    local tbBg = titleBar:CreateTexture(nil, "BACKGROUND")
    tbBg:SetTexture(BAG.Theme.Textures.Flat)
    tbBg:SetVertexColor(BAG.Theme:RGBA(BAG.Theme.Colors.SecondaryLight))
    tbBg:SetAllPoints(titleBar)

    -- Drag functionality on title bar
    titleBar:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            f:StartMoving()
        end
    end)
    titleBar:SetScript("OnMouseUp", function(self, button)
        f:StopMovingOrSizing()
        -- Save position
        local point, _, relPoint, x, y = f:GetPoint(1)
        BAG.SavedVars:SaveFramePosition(point, nil, relPoint, x, y)
    end)

    -- Logo in title bar
    BAG.Logo:Create(titleBar)

    -- ── Close button ──────────────────────────────────────────────────────
    local closeBtn = CreateFrame("Button", nil, titleBar)
    closeBtn:SetSize(BAG.Layout.TitleBar.ButtonSize, BAG.Layout.TitleBar.ButtonSize)
    closeBtn:SetPoint("RIGHT", titleBar, "RIGHT", -BAG.Layout.TitleBar.PaddingX, 0)
    closeBtn:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
    closeBtn:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
    closeBtn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    closeBtn:SetScript("OnClick", function()
        BAG.Animations:FadeOut(f, 0.15, function() f:Hide() end)
    end)

    -- ── Minimize button ───────────────────────────────────────────────────
    local minimized = false
    local savedHeight = layout.DefaultHeight

    local minBtn = CreateFrame("Button", nil, titleBar)
    minBtn:SetSize(BAG.Layout.TitleBar.ButtonSize, BAG.Layout.TitleBar.ButtonSize)
    minBtn:SetPoint("RIGHT", closeBtn, "LEFT", -BAG.Layout.TitleBar.ButtonGap, 0)
    minBtn:SetNormalTexture("Interface\\Buttons\\UI-Panel-CollapseButton-Up")
    minBtn:SetPushedTexture("Interface\\Buttons\\UI-Panel-CollapseButton-Down")
    minBtn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    minBtn:SetScript("OnClick", function()
        if minimized then
            f:SetHeight(savedHeight)
            minimized = false
            BAG.SavedVars:Set("minimized", false)
        else
            savedHeight = f:GetHeight()
            f:SetHeight(BAG.Layout.TitleBar.Height + 2)
            minimized = true
            BAG.SavedVars:Set("minimized", true)
        end
    end)

    -- ── Subtitle text (guide name + step X/Y) ────────────────────────────
    local subtitle = f:CreateFontString(nil, "OVERLAY")
    subtitle:SetFont(BAG.Theme.Fonts.Small.face, BAG.Theme.Fonts.Small.size, BAG.Theme.Fonts.Small.flags)
    subtitle:SetPoint("TOPLEFT", titleBar, "BOTTOMLEFT", BAG.Layout.TitleBar.PaddingX, -4)
    subtitle:SetPoint("TOPRIGHT", titleBar, "BOTTOMRIGHT", -BAG.Layout.TitleBar.PaddingX, -4)
    subtitle:SetTextColor(BAG.Theme:RGBA(BAG.Theme.Colors.TextDim))
    subtitle:SetJustifyH("LEFT")
    subtitle:SetText("Loading...")
    self.subtitle = subtitle

    -- ── Progress bar ──────────────────────────────────────────────────────
    local progressBar = BAG.Styles:CreateProgressBar(f, BAG.Layout.ProgressBar.Height)
    progressBar:SetPoint("TOPLEFT", subtitle, "BOTTOMLEFT", 0, -4)
    progressBar:SetPoint("RIGHT", f, "RIGHT", -BAG.Layout.ProgressBar.Inset, 0)
    self.progressBar = progressBar

    -- ── Resize handle ─────────────────────────────────────────────────────
    local resizer = CreateFrame("Button", nil, f)
    resizer:SetSize(16, 16)
    resizer:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -2, 2)
    resizer:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    resizer:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    resizer:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")

    resizer:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            f:StartSizing("BOTTOMRIGHT")
        end
    end)
    resizer:SetScript("OnMouseUp", function(self, button)
        f:StopMovingOrSizing()
        BAG.SavedVars:SaveFrameSize(f:GetWidth(), f:GetHeight())
        if BAG.UI.StepPanel and BAG.UI.StepPanel.Refresh then
            BAG.UI.StepPanel:Refresh()
        end
    end)

    -- Min/max resize
    f:SetResizeBounds(layout.MinWidth, layout.MinHeight, layout.MaxWidth, layout.MaxHeight)

    self.frame     = f
    self.titleBar  = titleBar
    self.closeBtn  = closeBtn
    self.minBtn    = minBtn
    self.resizer   = resizer

    return f
end

--- Update the subtitle with guide title and step info.
function BAG.UI.MainFrame:UpdateTitle()
    if not self.subtitle then return end
    local title = BAG.Engine:GetGuideTitle()
    local step  = BAG.Engine.currentStep
    local total = BAG.Engine.totalSteps
    self.subtitle:SetText(title .. "  |  Step " .. step .. " / " .. total)
end

--- Update the progress bar.
function BAG.UI.MainFrame:UpdateProgress()
    if not self.progressBar then return end
    self.progressBar:SetValue(BAG.Engine:GetProgress())
end
