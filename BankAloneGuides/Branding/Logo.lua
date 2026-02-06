--[[
    Bank Alone Guides - Logo System
    Creates the SCS branding logo for the addon
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone
BAG.Logo = {}

-- Create text-based logo with SCS branding
function BAG.Logo:Create(parent)
    local logoFrame = CreateFrame("Frame", nil, parent)
    logoFrame:SetSize(200, 40)
    
    -- Main title text
    local titleText = logoFrame:CreateFontString(nil, "OVERLAY")
    titleText:SetPoint("TOP", logoFrame, "TOP", 0, -5)
    BAG.Theme:ApplyFont(titleText, "Title")
    titleText:SetText("Bank Alone Guides")
    
    -- SCS subtitle
    local subtitleText = logoFrame:CreateFontString(nil, "OVERLAY")
    subtitleText:SetPoint("TOP", titleText, "BOTTOM", 0, -2)
    BAG.Theme:ApplyFont(subtitleText, "Small")
    subtitleText:SetText(BAG.Theme:ColorText("SCS PREMIUM LEVELING", "Accent"))
    
    -- Store references
    logoFrame.titleText = titleText
    logoFrame.subtitleText = subtitleText
    
    return logoFrame
end

-- Create compact logo (for minimap button)
function BAG.Logo:CreateCompact(parent)
    local logoFrame = CreateFrame("Frame", nil, parent)
    logoFrame:SetSize(32, 32)
    
    -- Background circle
    local bg = logoFrame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture("Interface\\AddOns\\BankAloneGuides\\UI\\Assets\\textures\\minimap_icon")
    if not bg:GetTexture() then
        -- Fallback to simple colored texture
        bg:SetTexture("Interface\\Icons\\INV_Misc_Map_01")
    end
    
    local color = BAG.Theme.Colors.Primary
    bg:SetVertexColor(color.r, color.g, color.b)
    
    -- Initials text overlay
    local initials = logoFrame:CreateFontString(nil, "OVERLAY")
    initials:SetPoint("CENTER")
    initials:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    initials:SetText("BAG")
    local textColor = BAG.Theme.Colors.TextPrimary
    initials:SetTextColor(textColor.r, textColor.g, textColor.b)
    
    logoFrame.background = bg
    logoFrame.text = initials
    
    return logoFrame
end

-- Create inline logo (for tooltips, messages)
function BAG.Logo:CreateInline()
    return BAG.Theme:ColorText("[Bank Alone Guides]", "Primary")
end

-- Get branded chat prefix
function BAG.Logo:GetChatPrefix()
    return "|cff00B3FF[BAG]|r"
end

-- Print branded message to chat
function BAG.Logo:Print(message)
    print(self:GetChatPrefix() .. " " .. message)
end

-- Print branded error message
function BAG.Logo:PrintError(message)
    local errorColor = BAG.Theme:ColorToHex(BAG.Theme.Colors.Error)
    print(self:GetChatPrefix() .. " " .. errorColor .. message .. "|r")
end

-- Print branded success message
function BAG.Logo:PrintSuccess(message)
    local successColor = BAG.Theme:ColorToHex(BAG.Theme.Colors.Success)
    print(self:GetChatPrefix() .. " " .. successColor .. message .. "|r")
end

-- Print branded warning message
function BAG.Logo:PrintWarning(message)
    local warningColor = BAG.Theme:ColorToHex(BAG.Theme.Colors.Warning)
    print(self:GetChatPrefix() .. " " .. warningColor .. message .. "|r")
end

print("|cff00B3FF[Bank Alone Guides]|r Logo system loaded")
