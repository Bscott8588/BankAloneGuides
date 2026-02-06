--[[
    Bank Alone Guides - Logo
    SCS / Bank Alone Guides
    
    Text-based logo frame for the main UI.
]]

local BAG = BankAlone

BAG.Branding = BAG.Branding or {}
BAG.Branding.Logo = BAG.Branding.Logo or {}
local Logo = BAG.Branding.Logo

-- Create a text-based logo element
function Logo:Create(parent)
    local frame = CreateFrame("Frame", "BAG_Logo", parent)
    frame:SetSize(200, 30)

    -- Logo diamond icon
    local diamond = frame:CreateFontString(nil, "OVERLAY")
    diamond:SetFont("Fonts\\FRIZQT__.TTF", 16, "OUTLINE")
    diamond:SetText("|cFF00CCFF◆|r")
    diamond:SetPoint("LEFT", frame, "LEFT", 0, 0)

    -- "Bank Alone" text
    local nameText = frame:CreateFontString(nil, "OVERLAY")
    nameText:SetFont("Fonts\\FRIZQT__.TTF", 13, "")
    nameText:SetText("|cFF00CCFFBank Alone|r |cFF88CCDDGuides|r")
    nameText:SetPoint("LEFT", diamond, "RIGHT", 4, 0)

    -- "SCS" small tag
    local scsTag = frame:CreateFontString(nil, "OVERLAY")
    scsTag:SetFont("Fonts\\ARIALN.TTF", 8, "OUTLINE")
    scsTag:SetText("|cFF667788SCS|r")
    scsTag:SetPoint("LEFT", nameText, "RIGHT", 6, -2)

    frame.diamond = diamond
    frame.nameText = nameText
    frame.scsTag = scsTag

    return frame
end

-- Create a minimal logo (just the diamond and short name)
function Logo:CreateMini(parent)
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(80, 20)

    local diamond = frame:CreateFontString(nil, "OVERLAY")
    diamond:SetFont("Fonts\\FRIZQT__.TTF", 11, "OUTLINE")
    diamond:SetText("|cFF00CCFF◆|r")
    diamond:SetPoint("LEFT", frame, "LEFT", 0, 0)

    local nameText = frame:CreateFontString(nil, "OVERLAY")
    nameText:SetFont("Fonts\\FRIZQT__.TTF", 10, "")
    nameText:SetText("|cFF00CCFFBAG|r")
    nameText:SetPoint("LEFT", diamond, "RIGHT", 2, 0)

    return frame
end
