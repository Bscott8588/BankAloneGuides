--[[
    Bank Alone Guides - UI Buttons
    SCS / Bank Alone Guides
    
    Creates Next, Previous, Options, and Re-evaluate buttons.
]]

local BAG = BankAlone

BAG.UI = BAG.UI or {}
BAG.UI.Buttons = BAG.UI.Buttons or {}
local Buttons = BAG.UI.Buttons
local Styles

-- Create the button bar at the bottom of the main frame
function Buttons:Create(parent)
    Styles = BAG.UI.Styles

    local buttonBar = CreateFrame("Frame", nil, parent)
    buttonBar:SetHeight(Styles.Layout.buttonHeight + 8)
    buttonBar:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", Styles.Layout.framePadding, 6)
    buttonBar:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -Styles.Layout.framePadding, 6)

    -- Top separator
    local sep = buttonBar:CreateTexture(nil, "ARTWORK")
    local sc = Styles.Colors.borderDim
    sep:SetColorTexture(sc[1], sc[2], sc[3], sc[4])
    sep:SetHeight(1)
    sep:SetPoint("TOPLEFT", buttonBar, "TOPLEFT", 0, 0)
    sep:SetPoint("TOPRIGHT", buttonBar, "TOPRIGHT", 0, 0)

    -- Previous button
    local prevBtn = self:CreateButton(buttonBar, "◄ Prev", 70)
    prevBtn:SetPoint("BOTTOMLEFT", buttonBar, "BOTTOMLEFT", 0, 0)
    prevBtn:SetScript("OnClick", function()
        BAG.Engine:PrevStep()
    end)

    -- Next button
    local nextBtn = self:CreateButton(buttonBar, "Next ►", 70)
    nextBtn:SetPoint("BOTTOMLEFT", prevBtn, "BOTTOMRIGHT", Styles.Layout.buttonSpacing, 0)
    nextBtn:SetScript("OnClick", function()
        BAG.Engine:NextStep()
    end)

    -- Re-evaluate button
    local reEvalBtn = self:CreateButton(buttonBar, "⟳ Check", 65)
    reEvalBtn:SetPoint("BOTTOMLEFT", nextBtn, "BOTTOMRIGHT", Styles.Layout.buttonSpacing, 0)
    reEvalBtn:SetScript("OnClick", function()
        BAG.Engine:Reevaluate()
        BAG:Print("Re-evaluated current step.")
    end)

    -- Options button (right-aligned)
    local optBtn = self:CreateButton(buttonBar, "⚙", 28)
    optBtn:SetPoint("BOTTOMRIGHT", buttonBar, "BOTTOMRIGHT", 0, 0)
    optBtn:SetScript("OnClick", function()
        self:ToggleOptionsMenu(optBtn)
    end)

    parent.buttonBar = buttonBar
    parent.prevBtn = prevBtn
    parent.nextBtn = nextBtn
    parent.reEvalBtn = reEvalBtn
    parent.optBtn = optBtn
end

-- Create a styled button
function Buttons:CreateButton(parent, label, width)
    local btn = CreateFrame("Button", nil, parent)
    btn:SetSize(width, Styles.Layout.buttonHeight)

    -- Background
    local bg = btn:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(btn)
    local c = Styles.Colors.btnNormal
    bg:SetColorTexture(c[1], c[2], c[3], c[4])
    btn.bg = bg

    -- Border
    Styles:CreateBorder(btn, "borderDim", 1)

    -- Label
    local text = btn:CreateFontString(nil, "OVERLAY")
    Styles:ApplyFont(text, "small")
    Styles:ApplyTextColor(text, "textLight")
    text:SetText(label)
    text:SetAllPoints(btn)
    btn.label = text

    -- Hover effects
    btn:SetScript("OnEnter", function(self)
        local hc = Styles.Colors.btnHover
        self.bg:SetColorTexture(hc[1], hc[2], hc[3], hc[4])
        Styles:ApplyTextColor(self.label, "textWhite")
    end)
    btn:SetScript("OnLeave", function(self)
        local nc = Styles.Colors.btnNormal
        self.bg:SetColorTexture(nc[1], nc[2], nc[3], nc[4])
        Styles:ApplyTextColor(self.label, "textLight")
    end)
    btn:SetScript("OnMouseDown", function(self)
        local pc = Styles.Colors.btnPressed
        self.bg:SetColorTexture(pc[1], pc[2], pc[3], pc[4])
    end)
    btn:SetScript("OnMouseUp", function(self)
        local hc = Styles.Colors.btnHover
        self.bg:SetColorTexture(hc[1], hc[2], hc[3], hc[4])
    end)

    return btn
end

-- Toggle options dropdown menu
function Buttons:ToggleOptionsMenu(anchor)
    if self._optionsMenu and self._optionsMenu:IsShown() then
        self._optionsMenu:Hide()
        return
    end

    if not self._optionsMenu then
        self._optionsMenu = self:CreateOptionsMenu()
    end

    self._optionsMenu:ClearAllPoints()
    self._optionsMenu:SetPoint("BOTTOMRIGHT", anchor, "TOPRIGHT", 0, 4)
    self._optionsMenu:Show()
end

-- Create options dropdown menu
function Buttons:CreateOptionsMenu()
    local menu = CreateFrame("Frame", "BAG_OptionsMenu", BAG.UI._mainFrame, "BackdropTemplate")
    menu:SetSize(160, 140)
    menu:SetFrameStrata("DIALOG")

    Styles:CreateBackground(menu, "bgMedium")
    Styles:CreateBorder(menu, "borderNeon", 1)

    local options = {
        { text = "Toggle Auto-Advance", func = function()
            local enabled = not BAG.Engine:IsAutoAdvanceEnabled()
            BAG.Engine:SetAutoAdvance(enabled)
            BAG:Print("Auto-advance: " .. (enabled and "ON" or "OFF"))
        end },
        { text = "Guide List", func = function()
            BAG:Print("Use /bag to manage guides.")
            menu:Hide()
        end },
        { text = "Reset Progress", func = function()
            BAG.SavedVars:ResetCharacter()
            BAG:SmartStart()
            menu:Hide()
        end },
        { text = "Lock Frame", func = function()
            local frame = BAG.UI._mainFrame
            if frame then
                local locked = not frame:IsMovable()
                frame:SetMovable(not locked)
                BAG:Print("Frame " .. (locked and "unlocked" or "locked"))
            end
            menu:Hide()
        end },
        { text = "Close Menu", func = function()
            menu:Hide()
        end },
    }

    for i, opt in ipairs(options) do
        local item = CreateFrame("Button", nil, menu)
        item:SetHeight(22)
        item:SetPoint("TOPLEFT", menu, "TOPLEFT", 4, -4 - ((i - 1) * 24))
        item:SetPoint("RIGHT", menu, "RIGHT", -4, 0)

        local itemText = item:CreateFontString(nil, "OVERLAY")
        Styles:ApplyFont(itemText, "small")
        Styles:ApplyTextColor(itemText, "textLight")
        itemText:SetText(opt.text)
        itemText:SetAllPoints(item)
        itemText:SetJustifyH("LEFT")
        item.label = itemText

        item:SetScript("OnClick", opt.func)
        item:SetScript("OnEnter", function(self)
            Styles:ApplyTextColor(self.label, "textHighlight")
        end)
        item:SetScript("OnLeave", function(self)
            Styles:ApplyTextColor(self.label, "textLight")
        end)
    end

    -- Auto-hide when clicking elsewhere
    menu:SetScript("OnShow", function()
        C_Timer.After(5, function()
            if menu:IsShown() then menu:Hide() end
        end)
    end)

    menu:Hide()
    return menu
end
