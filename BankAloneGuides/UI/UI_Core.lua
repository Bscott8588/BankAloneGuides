--[[
    Bank Alone Guides - UI Core
    Main UI initialization and management
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- UI state
BAG.UI.initialized = false
BAG.UI.mainFrame = nil
BAG.UI.isShown = true

-- Initialize UI system
function BAG.UI:Initialize()
    if self.initialized then
        return
    end
    
    BAG.Logo:Print("Initializing UI...")
    
    -- Create main frame
    self:CreateMainFrame()
    
    -- Load saved UI settings
    self:LoadSettings()
    
    -- Show/hide based on saved state
    local savedShown = BAG.SavedVars:Get("ui.shown")
    if savedShown ~= nil then
        if savedShown then
            self:Show()
        else
            self:Hide()
        end
    else
        self:Show()
    end
    
    self.initialized = true
    BAG.Logo:Print("UI initialized")
end

-- Create main frame
function BAG.UI:CreateMainFrame()
    if self.mainFrame then
        return self.mainFrame
    end
    
    -- Create from UI_MainFrame module
    self.mainFrame = BAG.UI.MainFrame:Create()
    
    return self.mainFrame
end

-- Show UI
function BAG.UI:Show()
    if not self.mainFrame then
        self:Initialize()
    end
    
    if self.mainFrame then
        self.mainFrame:Show()
        self.isShown = true
        BAG.SavedVars:Set("ui.shown", true)
    end
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

-- Update UI (refresh display)
function BAG.UI:Update()
    if not self.mainFrame or not self.mainFrame:IsShown() then
        return
    end
    
    -- Update step panel
    if BAG.UI.StepPanel then
        BAG.UI.StepPanel:Update()
    end
    
    -- Update buttons
    if BAG.UI.Buttons then
        BAG.UI.Buttons:Update()
    end
end

-- Load UI settings from SavedVars
function BAG.UI:LoadSettings()
    if not self.mainFrame then
        return
    end
    
    -- Load position
    local pos = BAG.SavedVars:GetUIPosition()
    if pos then
        self.mainFrame:ClearAllPoints()
        self.mainFrame:SetPoint(pos.point, UIParent, pos.relativePoint, pos.x, pos.y)
        
        -- Verify on screen
        if not BAG.Utils:IsFrameOnScreen(self.mainFrame) then
            -- Reset to default position
            local defaultPos = BAG.Layout:GetDefaultPosition()
            self.mainFrame:ClearAllPoints()
            self.mainFrame:SetPoint(defaultPos.point, defaultPos.relativeTo, 
                                   defaultPos.relativePoint, defaultPos.x, defaultPos.y)
        end
    end
    
    -- Load size
    local size = BAG.SavedVars:GetUISize()
    if size then
        self.mainFrame:SetSize(size.width, size.height)
    end
    
    -- Load scale
    local scale = BAG.SavedVars:Get("ui.scale")
    if scale then
        self.mainFrame:SetScale(scale)
    end
    
    -- Load alpha
    local alpha = BAG.SavedVars:Get("ui.alpha")
    if alpha then
        self.mainFrame:SetAlpha(alpha)
    end
end

-- Save UI settings
function BAG.UI:SaveSettings()
    if not self.mainFrame then
        return
    end
    
    -- Save position
    local point, relativeTo, relativePoint, x, y = self.mainFrame:GetPoint()
    BAG.SavedVars:SaveUIPosition(point, "UIParent", relativePoint, x, y)
    
    -- Save size
    local width, height = self.mainFrame:GetSize()
    BAG.SavedVars:SaveUISize(width, height)
    
    -- Save scale
    BAG.SavedVars:Set("ui.scale", self.mainFrame:GetScale())
    
    -- Save alpha
    BAG.SavedVars:Set("ui.alpha", self.mainFrame:GetAlpha())
end

-- Reset UI to defaults
function BAG.UI:Reset()
    if not self.mainFrame then
        return
    end
    
    -- Reset position
    local defaultPos = BAG.Layout:GetDefaultPosition()
    self.mainFrame:ClearAllPoints()
    self.mainFrame:SetPoint(defaultPos.point, defaultPos.relativeTo, 
                           defaultPos.relativePoint, defaultPos.x, defaultPos.y)
    
    -- Reset size
    self.mainFrame:SetSize(BAG.Layout.MainFrame.DefaultWidth, 
                          BAG.Layout.MainFrame.DefaultHeight)
    
    -- Reset scale
    self.mainFrame:SetScale(1.0)
    
    -- Reset alpha
    self.mainFrame:SetAlpha(0.95)
    
    -- Save new settings
    self:SaveSettings()
    
    BAG.Logo:PrintSuccess("UI reset to defaults")
end

-- Lock/unlock UI
function BAG.UI:SetLocked(locked)
    if not self.mainFrame then
        return
    end
    
    self.mainFrame:SetMovable(not locked)
    self.mainFrame:EnableMouse(not locked)
    
    BAG.SavedVars:Set("ui.locked", locked)
    
    if locked then
        BAG.Logo:Print("UI locked")
    else
        BAG.Logo:Print("UI unlocked")
    end
end

-- Toggle lock
function BAG.UI:ToggleLock()
    local locked = BAG.SavedVars:Get("ui.locked")
    self:SetLocked(not locked)
end

-- Set scale
function BAG.UI:SetScale(scale)
    if not self.mainFrame then
        return
    end
    
    scale = BAG.Utils:Clamp(scale, 0.5, 2.0)
    self.mainFrame:SetScale(scale)
    BAG.SavedVars:Set("ui.scale", scale)
end

-- Set alpha
function BAG.UI:SetAlpha(alpha)
    if not self.mainFrame then
        return
    end
    
    alpha = BAG.Utils:Clamp(alpha, 0.3, 1.0)
    self.mainFrame:SetAlpha(alpha)
    BAG.SavedVars:Set("ui.alpha", alpha)
end

-- Get UI state info
function BAG.UI:GetInfo()
    if not self.mainFrame then
        return {
            initialized = false,
            shown = false
        }
    end
    
    local point, _, relativePoint, x, y = self.mainFrame:GetPoint()
    local width, height = self.mainFrame:GetSize()
    
    return {
        initialized = self.initialized,
        shown = self.isShown,
        position = {
            point = point,
            relativePoint = relativePoint,
            x = x,
            y = y
        },
        size = {
            width = width,
            height = height
        },
        scale = self.mainFrame:GetScale(),
        alpha = self.mainFrame:GetAlpha(),
        locked = BAG.SavedVars:Get("ui.locked")
    }
end

-- Register slash commands for UI
local function RegisterUICommands()
    -- Already registered in Init.lua, but we can add UI-specific ones here
end

-- Called when addon is fully loaded
function BAG.UI:OnAddonLoaded()
    -- Any post-load UI setup
end

-- Called on player logout
function BAG.UI:OnLogout()
    self:SaveSettings()
end

-- Register custom events for UI updates
BAG.Events:RegisterCustom("GUIDE_LOADED", function()
    BAG.UI:Update()
end)

BAG.Events:RegisterCustom("STEP_CHANGED", function()
    BAG.UI:Update()
end)

BAG.Events:RegisterCustom("STEP_COMPLETE", function()
    BAG.UI:Update()
end)

BAG.Events:RegisterCustom("GUIDE_COMPLETE", function()
    BAG.UI:Update()
end)

print("|cff00B3FF[Bank Alone Guides]|r UI Core loaded")
