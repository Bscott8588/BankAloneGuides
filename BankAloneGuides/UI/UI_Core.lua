--[[
    Bank Alone Guides - UI Core
    SCS / Bank Alone Guides
    
    Creates the BAG.UI table and provides initialization and management functions.
]]

local BAG = BankAlone

BAG.UI = BAG.UI or {}
local UI = BAG.UI

-- UI State
UI._initialized = false
UI._mainFrame = nil
UI._visible = true

-- Initialize the UI system
function UI:Initialize()
    if self._initialized then return end

    BAG:Debug("Initializing UI system")

    -- Create main frame
    BAG.UI.MainFrame:Create()

    -- Create waypoint arrow (frameless floating arrow)
    BAG.UI.WaypointArrow:Create()
    BAG.UI.WaypointArrow:RestorePosition()

    -- Restore saved position/size
    self:RestorePosition()

    -- Show on login if preference is set
    local showOnLogin = BAG.SavedVars:GetUI("showOnLogin")
    if showOnLogin ~= false then
        self:Show()
    else
        self:Hide()
    end

    self._initialized = true
    BAG:Debug("UI initialized")
end

-- Show the main frame and waypoint arrow
function UI:Show()
    if self._mainFrame then
        self._mainFrame:Show()
        self._visible = true
        BAG.UI.Animations:FadeIn(self._mainFrame, 0.2)
    end
    -- Also show the waypoint arrow
    BAG.UI.WaypointArrow:Refresh()
end

-- Hide the main frame and waypoint arrow
function UI:Hide()
    if self._mainFrame then
        BAG.UI.Animations:FadeOut(self._mainFrame, 0.2, function()
            if self._mainFrame then
                self._mainFrame:Hide()
            end
        end)
        self._visible = false
    end
    BAG.UI.WaypointArrow:Hide()
end

-- Toggle visibility
function UI:Toggle()
    if self._visible then
        self:Hide()
    else
        self:Show()
    end
end

-- Refresh the entire guide display
function UI:RefreshGuide()
    if not self._initialized then return end
    BAG.UI.StepPanel:Refresh()
    self:UpdateProgressBar()
    self:UpdateTitleText()
    BAG.UI.WaypointArrow:Refresh()
end

-- Refresh only the current step display
function UI:RefreshStep()
    if not self._initialized then return end
    BAG.UI.StepPanel:Refresh()
    self:UpdateProgressBar()
    BAG.UI.WaypointArrow:Refresh()
end

-- Show guide complete message
function UI:ShowGuideComplete()
    if not self._initialized then return end
    BAG.UI.StepPanel:ShowComplete()
end

-- Update the progress bar
function UI:UpdateProgressBar()
    if self._mainFrame and self._mainFrame.progressBar then
        local progress = BAG.Engine:GetProgress()
        local bar = self._mainFrame.progressBar
        bar:SetValue(progress)

        if self._mainFrame.progressText then
            local current = BAG.Engine:GetCurrentStepIndex() or 0
            local total = BAG.Engine:GetTotalSteps() or 0
            self._mainFrame.progressText:SetText(string.format("%d / %d (%.0f%%)", current, total, progress))
        end
    end
end

-- Update the title text with current guide name
function UI:UpdateTitleText()
    if self._mainFrame and self._mainFrame.titleText then
        local guide = BAG.Engine:GetCurrentGuide()
        if guide then
            self._mainFrame.titleText:SetText(guide.title or "Bank Alone Guides")
        else
            self._mainFrame.titleText:SetText("Bank Alone Guides")
        end
    end
end

-- Save frame position
function UI:SavePosition()
    if self._mainFrame then
        local point, _, relPoint, x, y = self._mainFrame:GetPoint()
        BAG.SavedVars:SetUI("x", x)
        BAG.SavedVars:SetUI("y", y)
        BAG.SavedVars:SetUI("point", point)
        BAG.SavedVars:SetUI("relPoint", relPoint)
    end
end

-- Restore frame position
function UI:RestorePosition()
    if self._mainFrame then
        local x = BAG.SavedVars:GetUI("x")
        local y = BAG.SavedVars:GetUI("y")
        local point = BAG.SavedVars:GetUI("point")
        local relPoint = BAG.SavedVars:GetUI("relPoint")
        local width = BAG.SavedVars:GetUI("width") or 340
        local height = BAG.SavedVars:GetUI("height") or 480

        self._mainFrame:SetSize(width, height)

        if x and y then
            self._mainFrame:ClearAllPoints()
            self._mainFrame:SetPoint(point or "CENTER", UIParent, relPoint or "CENTER", x, y)
        end

        local scale = BAG.SavedVars:GetUI("scale") or 1.0
        self._mainFrame:SetScale(scale)
    end
end

-- Get the main frame reference
function UI:GetMainFrame()
    return self._mainFrame
end
