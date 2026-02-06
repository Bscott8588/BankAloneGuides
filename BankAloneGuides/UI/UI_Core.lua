--[[
    Bank Alone Guides - UI Core
    Core UI initialization and management
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.UI = BAG.UI or {}

-- UI State
BAG.UI.initialized = false
BAG.UI.mainFrame = nil
BAG.UI.isShown = false

-- Initialize UI system
function BAG.UI:Initialize()
    if self.initialized then
        return
    end
    
    BAG:DebugPrint("Initializing UI...")
    
    -- Create main frame
    self.mainFrame = self:CreateMainFrame()
    
    -- Initialize event system for UI updates
    BAG.Events:Initialize()
    
    -- Restore saved position
    self:RestorePosition()
    
    -- Show or hide based on saved settings
    local shouldShow = BAG.SavedVars:Get("ui.shown")
    if shouldShow then
        self:Show()
    else
        self:Hide()
    end
    
    self.initialized = true
    BAG:DebugPrint("UI initialized")
end

-- Show UI
function BAG.UI:Show()
    if not self.mainFrame then
        self:Initialize()
    end
    
    self.mainFrame:Show()
    self.isShown = true
    BAG.SavedVars:Set("ui.shown", true)
    
    -- Update display
    self:Update()
end

-- Hide UI
function BAG.UI:Hide()
    if self.mainFrame then
        self.mainFrame:Hide()
        self.isShown = false
        BAG.SavedVars:Set("ui.shown", false)
    end
end

-- Toggle UI visibility
function BAG.UI:Toggle()
    if self.isShown then
        self:Hide()
    else
        self:Show()
    end
end

-- Update UI with current guide state
function BAG.UI:Update()
    if not self.mainFrame or not self.isShown then
        return
    end
    
    -- Update step panel
    if self.mainFrame.stepPanel then
        self.mainFrame.stepPanel:Update()
    end
    
    -- Update buttons
    if self.mainFrame.buttonBar then
        self.mainFrame.buttonBar:Update()
    end
    
    -- Update progress
    if self.mainFrame.progressBar then
        local progress = BAG.Engine:GetProgress()
        self.mainFrame.progressBar:SetValue(progress)
        self.mainFrame.progressBar.text:SetText(string.format("%.0f%%", progress))
    end
end

-- Save current position
function BAG.UI:SavePosition()
    if not self.mainFrame then return end
    
    local point, _, _, x, y = self.mainFrame:GetPoint()
    local width = self.mainFrame:GetWidth()
    local height = self.mainFrame:GetHeight()
    
    BAG.SavedVars:SaveUIPosition(point, x, y, width, height)
end

-- Restore saved position
function BAG.UI:RestorePosition()
    if not self.mainFrame then return end
    
    local pos = BAG.SavedVars:LoadUIPosition()
    
    if pos and pos.point then
        self.mainFrame:ClearAllPoints()
        self.mainFrame:SetPoint(pos.point, UIParent, pos.point, pos.x, pos.y)
    end
    
    if pos and pos.width and pos.height then
        self.mainFrame:SetSize(pos.width, pos.height)
    end
end

-- Lock/unlock frame
function BAG.UI:ToggleLock()
    if not self.mainFrame then return end
    
    local locked = BAG.SavedVars:Get("ui.locked")
    locked = not locked
    
    BAG.SavedVars:Set("ui.locked", locked)
    
    if locked then
        self.mainFrame:EnableMouse(false)
        self.mainFrame:SetMovable(false)
        self.mainFrame:SetResizable(false)
        BAG:Print("UI locked")
    else
        self.mainFrame:EnableMouse(true)
        self.mainFrame:SetMovable(true)
        self.mainFrame:SetResizable(true)
        BAG:Print("UI unlocked")
    end
end

-- Reset UI position to default
function BAG.UI:ResetPosition()
    if not self.mainFrame then return end
    
    self.mainFrame:ClearAllPoints()
    self.mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    self.mainFrame:SetSize(
        BAG.Layout.MainFrame.Width,
        BAG.Layout.MainFrame.Height
    )
    
    self:SavePosition()
    BAG:Print("UI position reset")
end

-- Set UI scale
function BAG.UI:SetScale(scale)
    if not self.mainFrame then return end
    
    scale = BAG.Utils:Clamp(scale, 0.5, 2.0)
    self.mainFrame:SetScale(scale)
    BAG.SavedVars:Set("ui.scale", scale)
end

-- Get UI scale
function BAG.UI:GetScale()
    if not self.mainFrame then return 1.0 end
    return self.mainFrame:GetScale()
end

-- Set UI alpha
function BAG.UI:SetAlpha(alpha)
    if not self.mainFrame then return end
    
    alpha = BAG.Utils:Clamp(alpha, 0.1, 1.0)
    self.mainFrame:SetAlpha(alpha)
    BAG.SavedVars:Set("ui.alpha", alpha)
end

-- Get UI alpha
function BAG.UI:GetAlpha()
    if not self.mainFrame then return 1.0 end
    return self.mainFrame:GetAlpha()
end

-- Refresh UI (force full update)
function BAG.UI:Refresh()
    BAG:DebugPrint("Refreshing UI")
    
    if not self.mainFrame then
        return
    end
    
    -- Update all components
    self:Update()
    
    -- Re-evaluate current step
    BAG.Engine:Evaluate()
end

-- Get frame references for external use
function BAG.UI:GetMainFrame()
    return self.mainFrame
end

function BAG.UI:GetStepPanel()
    return self.mainFrame and self.mainFrame.stepPanel
end

function BAG.UI:GetButtonBar()
    return self.mainFrame and self.mainFrame.buttonBar
end

-- Error handler for UI errors
function BAG.UI:HandleError(err)
    BAG:Error("UI Error:", err)
    
    -- Try to recover
    if self.mainFrame then
        self.mainFrame:Hide()
        self.isShown = false
    end
end

-- Clean up UI
function BAG.UI:Shutdown()
    if self.mainFrame then
        self:SavePosition()
        self.mainFrame:Hide()
        self.mainFrame = nil
    end
    
    self.initialized = false
    self.isShown = false
end
