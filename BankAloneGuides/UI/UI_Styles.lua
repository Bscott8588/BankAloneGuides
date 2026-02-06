local BAG = BankAlone
local UI = BAG.UI
UI.Styles = UI.Styles or {}
local Styles = UI.Styles
local Theme = BAG.Branding.Theme
local Layout = BAG.Branding.Layout

Styles.colors = Theme.colors
Styles.fonts = Theme.fonts
Styles.layout = Layout

function Styles:ApplyBackdrop(frame)
  frame:SetBackdrop({
    bgFile = Theme.borders.bgFile,
    edgeFile = Theme.borders.edgeFile,
    tile = Theme.borders.tile,
    tileSize = Theme.borders.tileSize,
    edgeSize = Theme.borders.edgeSize,
    insets = {
      left = Theme.borders.inset,
      right = Theme.borders.inset,
      top = Theme.borders.inset,
      bottom = Theme.borders.inset,
    },
  })
  frame:SetBackdropColor(Theme.colors.secondary.r, Theme.colors.secondary.g, Theme.colors.secondary.b, 0.85)
  frame:SetBackdropBorderColor(Theme.colors.primary.r, Theme.colors.primary.g, Theme.colors.primary.b, 0.9)
end
