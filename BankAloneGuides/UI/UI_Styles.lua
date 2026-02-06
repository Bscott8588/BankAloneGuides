local BAG = BankAlone
BAG.UI.Styles = BAG.UI.Styles or {}

local Styles = BAG.UI.Styles

function Styles:GetTheme()
    return BAG.Branding.Theme
end

function Styles:ApplyFrameStyle(frame)
    local theme = self:GetTheme()
    if not frame.SetBackdrop then
        return
    end
    frame:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 12,
        insets = { left = 2, right = 2, top = 2, bottom = 2 },
    })
    frame:SetBackdropColor(unpack(theme.colors.background))
    frame:SetBackdropBorderColor(unpack(theme.colors.primary))
end

function Styles:ApplyHeaderStyle(text)
    local theme = self:GetTheme()
    text:SetFont(theme.fonts.title, 13, "OUTLINE")
    text:SetTextColor(unpack(theme.colors.primary))
end

function Styles:ApplyBodyStyle(text)
    local theme = self:GetTheme()
    text:SetFont(theme.fonts.body, 12, "OUTLINE")
    text:SetTextColor(unpack(theme.colors.text))
end

function Styles:ApplyMutedStyle(text)
    local theme = self:GetTheme()
    text:SetFont(theme.fonts.body, 11, "OUTLINE")
    text:SetTextColor(unpack(theme.colors.muted))
end

