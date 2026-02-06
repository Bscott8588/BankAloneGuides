local BAG = BankAlone

function BAG.Branding:CreateLogo(parent)
    local theme = BAG.Branding.Theme
    local logo = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    logo:SetFont(theme.fonts.title, 14, "OUTLINE")
    logo:SetTextColor(unpack(theme.colors.primary))
    logo:SetText("SCS | Bank Alone Guides")
    return logo
end

