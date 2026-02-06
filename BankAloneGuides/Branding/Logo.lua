-------------------------------------------------------------------------------
-- Bank Alone Guides — Branding / Logo
-- Text-based logo element for the main frame
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Logo = BAG.Logo or {}

--- Create the logo text on a given parent frame.
-- @param parent  The parent frame to anchor the logo to.
-- @return logoFrame  The created logo frame.
function BAG.Logo:Create(parent)
    if self.frame then return self.frame end

    local f = CreateFrame("Frame", "BAG_LogoFrame", parent)
    f:SetSize(BAG.Layout.MainFrame.DefaultWidth - 20, BAG.Layout.TitleBar.Height - 4)
    f:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, -3)

    -- "BANK ALONE" in neon blue with outline
    local title = f:CreateFontString(nil, "OVERLAY")
    title:SetFont(BAG.Theme.Fonts.Header.face, BAG.Theme.Fonts.Header.size, BAG.Theme.Fonts.Header.flags)
    title:SetPoint("LEFT", f, "LEFT", 0, 0)
    title:SetText(BAG.Theme:Colorize("BANK ALONE", BAG.Theme.Colors.Primary) ..
                  BAG.Theme:Colorize(" GUIDES", BAG.Theme.Colors.PrimaryLight))
    title:SetShadowOffset(1, -1)
    title:SetShadowColor(0, 0, 0, 0.8)
    f.title = title

    -- Subtle "SCS" tag to the right
    local tag = f:CreateFontString(nil, "OVERLAY")
    tag:SetFont(BAG.Theme.Fonts.Tiny.face, BAG.Theme.Fonts.Tiny.size, "OUTLINE")
    tag:SetPoint("RIGHT", f, "RIGHT", 0, 0)
    tag:SetText(BAG.Theme:Colorize("SCS", BAG.Theme.Colors.TextDim))
    f.tag = tag

    -- Neon underline
    local line = f:CreateTexture(nil, "ARTWORK")
    line:SetTexture(BAG.Theme.Textures.Flat)
    line:SetVertexColor(BAG.Theme:RGBA(BAG.Theme.Colors.Primary))
    line:SetHeight(1)
    line:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 0, 0)
    line:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 0, 0)
    f.underline = line

    self.frame = f
    return f
end
