-------------------------------------------------------------------------------
-- Bank Alone Guides — UI / Buttons
-- Navigation and control buttons
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.UI.Buttons = BAG.UI.Buttons or {}

--- Create the button bar at the bottom of the main frame.
function BAG.UI.Buttons:Create(parent)
    if self.bar then return end

    local layout = BAG.Layout.ButtonBar

    -- Button bar container
    local bar = CreateFrame("Frame", "BAG_ButtonBar", parent)
    bar:SetHeight(layout.Height)
    bar:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", layout.PaddingX, layout.PaddingY)
    bar:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -layout.PaddingX, layout.PaddingY)

    -- Separator line above buttons
    local sep = bar:CreateTexture(nil, "ARTWORK")
    sep:SetTexture(BAG.Theme.Textures.Flat)
    sep:SetVertexColor(BAG.Theme:RGBA(BAG.Theme.Colors.Border))
    sep:SetHeight(1)
    sep:SetPoint("TOPLEFT", bar, "TOPLEFT", 0, 0)
    sep:SetPoint("TOPRIGHT", bar, "TOPRIGHT", 0, 0)

    -- ── Previous button ───────────────────────────────────────────────────
    local prevBtn = BAG.Styles:CreateButton(bar, "< Prev", layout.ButtonWidth, layout.ButtonHeight,
        function()
            BAG.Engine:PrevStep()
        end)
    prevBtn:SetPoint("LEFT", bar, "LEFT", 0, -2)
    self.prevBtn = prevBtn

    -- ── Next button ───────────────────────────────────────────────────────
    local nextBtn = BAG.Styles:CreateButton(bar, "Next >", layout.ButtonWidth, layout.ButtonHeight,
        function()
            BAG.Engine:NextStep()
        end)
    nextBtn:SetPoint("LEFT", prevBtn, "RIGHT", layout.ButtonGap, 0)
    self.nextBtn = nextBtn

    -- ── Re-evaluate button ────────────────────────────────────────────────
    local evalBtn = BAG.Styles:CreateButton(bar, "Refresh", layout.ButtonWidth - 10, layout.ButtonHeight,
        function()
            BAG.Engine:Evaluate()
            BAG:Print("Re-evaluated current step.")
        end)
    evalBtn:SetPoint("RIGHT", bar, "RIGHT", 0, -2)
    self.evalBtn = evalBtn

    -- ── Options button (small gear) ───────────────────────────────────────
    local optBtn = BAG.Styles:CreateButton(bar, "Options", layout.ButtonWidth - 20, layout.ButtonHeight,
        function()
            BAG:Print("Options panel coming soon!")
        end)
    optBtn:SetPoint("RIGHT", evalBtn, "LEFT", -layout.ButtonGap, 0)
    self.optBtn = optBtn

    self.bar = bar
end

--- Update button enabled/disabled states based on engine state.
function BAG.UI.Buttons:UpdateStates()
    if not self.bar then return end

    -- Prev button
    if BAG.Engine.currentStep <= 1 then
        self.prevBtn:SetAlpha(0.4)
        self.prevBtn:Disable()
    else
        self.prevBtn:SetAlpha(1)
        self.prevBtn:Enable()
    end

    -- Next button
    if BAG.Engine.currentStep >= BAG.Engine.totalSteps then
        self.nextBtn:SetAlpha(0.4)
        self.nextBtn:Disable()
    else
        self.nextBtn:SetAlpha(1)
        self.nextBtn:Enable()
    end
end
