local BAG = BankAlone
local Branding = BAG.Branding
local Theme = Branding.Theme

function Branding:CreateLogo(parent)
  local logo = parent:CreateFontString(nil, "OVERLAY")
  logo:SetFont(Theme.fonts.title, 13, "OUTLINE")
  logo:SetTextColor(Theme.colors.primary.r, Theme.colors.primary.g, Theme.colors.primary.b)
  logo:SetText("SCS  |  Bank Alone Guides")
  logo:SetPoint("LEFT", parent, "LEFT", 12, 0)
  return logo
end
