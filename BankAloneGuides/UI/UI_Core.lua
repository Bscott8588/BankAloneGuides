local BAG = BankAlone
BAG.UI = BAG.UI or {}

local UI = BAG.UI

function UI:Init()
    if self.frame then
        return
    end
    self.frame = BAG.UI.MainFrame:Create()
    self.stepPanel = BAG.UI.StepPanel:Create(self.frame)
    self.buttons = BAG.UI.Buttons:Create(self.frame)
    self:ApplySavedPosition()
    self:Refresh()
end

function UI:ApplySavedPosition()
    if not self.frame then
        return
    end
    local ui = BAG.db.profile.ui
    self.frame:ClearAllPoints()
    self.frame:SetPoint(ui.point, UIParent, ui.relativePoint, ui.x, ui.y)
    self.frame:SetSize(ui.width, ui.height)
    if ui.minimized then
        self:Minimize()
    end
end

function UI:Refresh(auto)
    if not self.frame then
        return
    end
    local currentStep = BAG.Engine:GetCurrentStep()
    local upcoming = BAG.Engine:GetUpcomingSteps(2)
    self.stepPanel:SetSteps(currentStep, upcoming)
    if auto then
        BAG.UI.Animations:FadeIn(self.stepPanel, 0.15)
    end
end

function UI:OnEvent()
    self:Refresh()
end

function UI:Minimize()
    if not self.frame or self.minimized then
        return
    end
    self.minimized = true
    BAG.db.profile.ui.minimized = true
    self.stepPanel:Hide()
    self.buttons:Hide()
    self.frame:SetHeight(BAG.Branding.Layout.headerHeight + 12)
end

function UI:Maximize()
    if not self.frame or not self.minimized then
        return
    end
    self.minimized = false
    BAG.db.profile.ui.minimized = false
    self.stepPanel:Show()
    self.buttons:Show()
    self.frame:SetHeight(BAG.db.profile.ui.height or BAG.Branding.Layout.frameHeight)
end

function UI:ToggleMinimize()
    if self.minimized then
        self:Maximize()
    else
        self:Minimize()
    end
end

