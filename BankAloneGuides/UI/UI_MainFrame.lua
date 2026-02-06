local BAG = BankAlone
BAG.UI.MainFrame = BAG.UI.MainFrame or {}

local MainFrame = BAG.UI.MainFrame

function MainFrame:Create()
    local layout = BAG.Branding.Layout
    local frame = CreateFrame("Frame", "BAG_MainFrame", UIParent, "BackdropTemplate")
    frame:SetSize(layout.frameWidth, layout.frameHeight)
    frame:SetPoint("CENTER")
    frame:SetClampedToScreen(true)
    frame:SetMovable(true)
    frame:SetResizable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function(self)
        if not BAG.db.profile.ui.locked then
            self:StartMoving()
        end
    end)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local point, _, relativePoint, x, y = self:GetPoint()
        local ui = BAG.db.profile.ui
        ui.point = point
        ui.relativePoint = relativePoint
        ui.x = x
        ui.y = y
    end)

    BAG.UI.Styles:ApplyFrameStyle(frame)

    local header = CreateFrame("Frame", nil, frame, "BackdropTemplate")
    header:SetHeight(layout.headerHeight)
    header:SetPoint("TOPLEFT", 4, -4)
    header:SetPoint("TOPRIGHT", -4, -4)
    header:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 12,
        insets = { left = 2, right = 2, top = 2, bottom = 2 },
    })
    header:SetBackdropColor(0.03, 0.06, 0.12, 0.95)
    header:SetBackdropBorderColor(unpack(BAG.Branding.Theme.colors.primary))

    local logo = BAG.Branding:CreateLogo(header)
    logo:SetPoint("LEFT", 8, 0)
    frame.logo = logo

    local title = header:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    BAG.UI.Styles:ApplyHeaderStyle(title)
    title:SetText("Guide Console")
    title:SetPoint("RIGHT", -28, 0)
    frame.title = title

    local closeButton = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeButton:SetPoint("TOPRIGHT", -6, -6)
    frame.closeButton = closeButton

    local minimizeButton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    minimizeButton:SetSize(22, 18)
    minimizeButton:SetText("-")
    minimizeButton:SetPoint("TOPRIGHT", closeButton, "TOPLEFT", -2, -2)
    minimizeButton:SetScript("OnClick", function()
        BAG.UI:ToggleMinimize()
    end)
    frame.minimizeButton = minimizeButton

    local resizer = CreateFrame("Button", nil, frame)
    resizer:SetSize(16, 16)
    resizer:SetPoint("BOTTOMRIGHT", -2, 2)
    resizer:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    resizer:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    resizer:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    resizer:SetScript("OnMouseDown", function(self)
        if not BAG.db.profile.ui.locked then
            self:GetParent():StartSizing("BOTTOMRIGHT")
        end
    end)
    resizer:SetScript("OnMouseUp", function(self)
        local parent = self:GetParent()
        parent:StopMovingOrSizing()
        local ui = BAG.db.profile.ui
        ui.width = parent:GetWidth()
        ui.height = parent:GetHeight()
    end)
    frame.resizer = resizer

    return frame
end

