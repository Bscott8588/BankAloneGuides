-------------------------------------------------------------------------------
-- Bank Alone Guides — UI / Core
-- UI initialization and management
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.UI = BAG.UI or {}
BAG.UI.initialized = false

--- Initialize the entire UI system.
function BAG.UI:Initialize()
    if self.initialized then return end

    -- Build main frame
    BAG.UI.MainFrame:Create()

    -- Build step panel inside main frame
    BAG.UI.StepPanel:Create(BAG.UI.MainFrame.frame)

    -- Build button bar
    BAG.UI.Buttons:Create(BAG.UI.MainFrame.frame)

    -- Restore saved position/size
    self:RestorePosition()

    -- Show on login if preference says so
    local showOnLogin = BAG.SavedVars:GetPref("showOnLogin")
    if showOnLogin ~= false then
        BAG.UI.MainFrame.frame:Show()
        BAG.Animations:FadeIn(BAG.UI.MainFrame.frame, 0.3)
    end

    self.initialized = true
    self:Refresh()
end

--- Refresh all UI components with current engine state.
function BAG.UI:Refresh()
    if not self.initialized then return end

    -- Update title/subtitle
    BAG.UI.MainFrame:UpdateTitle()

    -- Update step display
    BAG.UI.StepPanel:Refresh()

    -- Update progress bar
    BAG.UI.MainFrame:UpdateProgress()

    -- Update button states
    BAG.UI.Buttons:UpdateStates()
end

--- Toggle main frame visibility.
function BAG.UI:Toggle()
    if not self.initialized then
        self:Initialize()
    end

    local f = BAG.UI.MainFrame.frame
    if f:IsShown() then
        BAG.Animations:FadeOut(f, 0.2, function() f:Hide() end)
    else
        f:Show()
        BAG.Animations:FadeIn(f, 0.2)
    end
end

--- Hide main frame.
function BAG.UI:Hide()
    if BAG.UI.MainFrame and BAG.UI.MainFrame.frame then
        BAG.UI.MainFrame.frame:Hide()
    end
end

--- Show main frame.
function BAG.UI:Show()
    if not self.initialized then self:Initialize() end
    if BAG.UI.MainFrame and BAG.UI.MainFrame.frame then
        BAG.UI.MainFrame.frame:Show()
    end
end

--- Reset frame to default position.
function BAG.UI:ResetPosition()
    if BAG.UI.MainFrame and BAG.UI.MainFrame.frame then
        local f = BAG.UI.MainFrame.frame
        f:ClearAllPoints()
        local dp = BAG.Layout.MainFrame.DefaultPoint
        f:SetPoint(dp[1], dp[2], dp[3], dp[4], dp[5])
        f:SetSize(BAG.Layout.MainFrame.DefaultWidth, BAG.Layout.MainFrame.DefaultHeight)
        BAG.SavedVars:Set("framePos", nil)
        BAG.SavedVars:Set("frameSize", nil)
    end
end

--- Restore saved frame position.
function BAG.UI:RestorePosition()
    local pos = BAG.SavedVars:Get("framePos")
    local size = BAG.SavedVars:Get("frameSize")
    local f = BAG.UI.MainFrame.frame
    if not f then return end

    if pos and pos.point then
        f:ClearAllPoints()
        f:SetPoint(pos.point, UIParent, pos.relPoint or "CENTER", pos.x or 0, pos.y or 0)
    end

    if size and size.width and size.height then
        f:SetSize(size.width, size.height)
    end
end
