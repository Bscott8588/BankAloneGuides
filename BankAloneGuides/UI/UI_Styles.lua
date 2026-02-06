-------------------------------------------------------------------------------
-- Bank Alone Guides — UI / Styles
-- Centralized styling helpers for the neon-blue SCS aesthetic
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Styles = BAG.Styles or {}

--- Apply the SCS dark background to a frame.
function BAG.Styles:ApplyBackground(frame)
    local bg = frame:CreateTexture(nil, "BACKGROUND")
    bg:SetTexture(BAG.Theme.Textures.Flat)
    bg:SetVertexColor(BAG.Theme:RGBA(BAG.Theme.Colors.Background))
    bg:SetAllPoints(frame)
    frame._bg = bg
    return bg
end

--- Apply a neon-blue border to a frame (1px lines using flat textures).
function BAG.Styles:ApplyBorder(frame, color)
    color = color or BAG.Theme.Colors.Border
    local size = 1

    local borders = {}

    -- Top
    local top = frame:CreateTexture(nil, "OVERLAY")
    top:SetTexture(BAG.Theme.Textures.Flat)
    top:SetVertexColor(BAG.Theme:RGBA(color))
    top:SetHeight(size)
    top:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    top:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    borders.top = top

    -- Bottom
    local bottom = frame:CreateTexture(nil, "OVERLAY")
    bottom:SetTexture(BAG.Theme.Textures.Flat)
    bottom:SetVertexColor(BAG.Theme:RGBA(color))
    bottom:SetHeight(size)
    bottom:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
    bottom:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
    borders.bottom = bottom

    -- Left
    local left = frame:CreateTexture(nil, "OVERLAY")
    left:SetTexture(BAG.Theme.Textures.Flat)
    left:SetVertexColor(BAG.Theme:RGBA(color))
    left:SetWidth(size)
    left:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    left:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 0, 0)
    borders.left = left

    -- Right
    local right = frame:CreateTexture(nil, "OVERLAY")
    right:SetTexture(BAG.Theme.Textures.Flat)
    right:SetVertexColor(BAG.Theme:RGBA(color))
    right:SetWidth(size)
    right:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)
    right:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
    borders.right = right

    frame._borders = borders
    return borders
end

--- Apply a glow border (slightly larger, lower alpha).
function BAG.Styles:ApplyGlow(frame)
    local glow = CreateFrame("Frame", nil, frame)
    glow:SetPoint("TOPLEFT", frame, "TOPLEFT", -2, 2)
    glow:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 2, -2)
    glow:SetFrameLevel(math.max(0, frame:GetFrameLevel() - 1))

    local bg = glow:CreateTexture(nil, "BACKGROUND")
    bg:SetTexture(BAG.Theme.Textures.Flat)
    bg:SetVertexColor(BAG.Theme:RGBA(BAG.Theme.Colors.BorderGlow))
    bg:SetAllPoints(glow)

    frame._glow = glow
    return glow
end

--- Create a styled text button.
function BAG.Styles:CreateButton(parent, text, width, height, onClick)
    local btn = CreateFrame("Button", nil, parent)
    btn:SetSize(width or 80, height or 24)

    -- Background
    local bg = btn:CreateTexture(nil, "BACKGROUND")
    bg:SetTexture(BAG.Theme.Textures.Flat)
    bg:SetVertexColor(BAG.Theme:RGBA(BAG.Theme.Colors.PrimaryDark))
    bg:SetAllPoints(btn)
    btn._bg = bg

    -- Label
    local label = btn:CreateFontString(nil, "OVERLAY")
    label:SetFont(BAG.Theme.Fonts.Normal.face, BAG.Theme.Fonts.Normal.size, BAG.Theme.Fonts.Normal.flags)
    label:SetPoint("CENTER")
    label:SetText(text or "")
    label:SetTextColor(BAG.Theme:RGBA(BAG.Theme.Colors.Text))
    btn._label = label

    -- Border
    self:ApplyBorder(btn, BAG.Theme.Colors.Primary)

    -- Hover highlight
    btn:SetScript("OnEnter", function(self)
        bg:SetVertexColor(BAG.Theme:RGBA(BAG.Theme.Colors.Primary))
        label:SetTextColor(1, 1, 1, 1)
    end)
    btn:SetScript("OnLeave", function(self)
        bg:SetVertexColor(BAG.Theme:RGBA(BAG.Theme.Colors.PrimaryDark))
        label:SetTextColor(BAG.Theme:RGBA(BAG.Theme.Colors.Text))
    end)

    if onClick then
        btn:SetScript("OnClick", onClick)
    end

    return btn
end

--- Create a styled font string.
function BAG.Styles:CreateLabel(parent, fontDef, color)
    fontDef = fontDef or BAG.Theme.Fonts.Normal
    color = color or BAG.Theme.Colors.Text

    local fs = parent:CreateFontString(nil, "OVERLAY")
    fs:SetFont(fontDef.face, fontDef.size, fontDef.flags)
    fs:SetTextColor(BAG.Theme:RGBA(color))
    return fs
end

--- Style a progress bar.
function BAG.Styles:CreateProgressBar(parent, height)
    local bar = CreateFrame("StatusBar", nil, parent)
    bar:SetHeight(height or BAG.Layout.ProgressBar.Height)
    bar:SetStatusBarTexture(BAG.Theme.Textures.Flat)
    bar:SetStatusBarColor(BAG.Theme:RGBA(BAG.Theme.Colors.Primary))
    bar:SetMinMaxValues(0, 1)
    bar:SetValue(0)

    -- Track background
    local bgTex = bar:CreateTexture(nil, "BACKGROUND")
    bgTex:SetTexture(BAG.Theme.Textures.Flat)
    bgTex:SetVertexColor(BAG.Theme:RGBA(BAG.Theme.Colors.SecondaryLight))
    bgTex:SetAllPoints(bar)

    bar._bgTex = bgTex
    return bar
end
