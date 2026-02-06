--[[
    Bank Alone Guides - Initialization
    Core addon initialization and namespace setup
    Copyright (c) 2026 Bradley S. Scott
]]--

-- Create global namespace
BankAlone = {}
local addonName, BAG = ...
BankAlone.Internal = BAG

-- Local reference for performance
local BAG = BAG

-- Version information
BAG.Version = "1.0.0"
BAG.Build = "20504"
BAG.ReleaseDate = "2026-02-06"

-- Addon state
BAG.Initialized = false
BAG.PlayerLevel = 1
BAG.PlayerClass = nil
BAG.PlayerRace = nil
BAG.PlayerFaction = nil
BAG.PlayerZone = nil

-- Initialize submodules
BAG.Engine = {}
BAG.Events = {}
BAG.Conditions = {}
BAG.SavedVars = {}
BAG.Utils = {}
BAG.UI = {}
BAG.Navigator = {}
BAG.QuestAPI = {}
BAG.PlayerAPI = {}
BAG.InventoryAPI = {}
BAG.SpellAPI = {}
BAG.MapAPI = {}
BAG.ZoneDetection = {}
BAG.QuestTracking = {}
BAG.Travel = {}
BAG.Parser = {}
BAG.Data = {
    Zones = {},
    Items = {},
    NPCs = {},
    Quests = {},
    Trainers = {},
    Vendors = {},
}
BAG.Guides = {
    Leveling = {
        Alliance = {},
        Horde = {},
    },
    Professions = {},
    Gold = {},
    Class = {},
    Meta = {},
}

-- Debug mode
BAG.Debug = false

-- Debug print function
function BAG:Print(...)
    local message = strjoin(" ", ...)
    DEFAULT_CHAT_FRAME:AddMessage("|cff33aaff[Bank Alone]|r " .. tostring(message))
end

function BAG:DebugPrint(...)
    if self.Debug then
        local message = strjoin(" ", ...)
        DEFAULT_CHAT_FRAME:AddMessage("|cff33aaff[BAG Debug]|r " .. tostring(message))
    end
end

function BAG:Error(...)
    local message = strjoin(" ", ...)
    DEFAULT_CHAT_FRAME:AddMessage("|cff33aaff[Bank Alone]|r |cffff3333ERROR:|r " .. tostring(message))
end

-- Main initialization function
function BAG:Initialize()
    if self.Initialized then
        return
    end
    
    self:Print("Bank Alone Guides v" .. self.Version .. " Loading...")
    
    -- Initialize saved variables
    self.SavedVars:Initialize()
    
    -- Get player info
    self.PlayerClass = self.PlayerAPI:GetClass()
    self.PlayerRace = self.PlayerAPI:GetRace()
    self.PlayerFaction = self.PlayerAPI:GetFaction()
    self.PlayerLevel = self.PlayerAPI:GetLevel()
    self.PlayerZone = self.ZoneDetection:GetCurrentZone()
    
    self:DebugPrint("Player Info:", self.PlayerRace, self.PlayerClass, "Level", self.PlayerLevel, "Faction:", self.PlayerFaction)
    
    -- Initialize UI
    self.UI:Initialize()
    
    -- Smart start: Load appropriate guide
    self:SmartStart()
    
    self.Initialized = true
    self:Print("Ready! Use /bag to toggle the guide window.")
end

-- Smart start: Detect player state and load appropriate guide
function BAG:SmartStart()
    local level = self.PlayerLevel
    local faction = self.PlayerFaction
    local race = self.PlayerRace
    local zone = self.PlayerZone
    
    self:DebugPrint("Smart Start: Level", level, "Zone:", zone)
    
    -- Determine the best starting guide
    local guideName = self.Navigator:DetermineStartingGuide(level, faction, race, zone)
    
    if guideName then
        self:DebugPrint("Loading guide:", guideName)
        self.Engine:LoadGuide(guideName)
    else
        self:Print("No appropriate guide found for your character. Please select a guide manually.")
    end
end

-- Slash command handler
SLASH_BANKALONE1 = "/bag"
SLASH_BANKALONE2 = "/bankalone"
SLASH_BANKALONE3 = "/bankaloneguides"

SlashCmdList["BANKALONE"] = function(msg)
    msg = msg:lower():trim()
    
    if msg == "debug" then
        BAG.Debug = not BAG.Debug
        BAG:Print("Debug mode:", BAG.Debug and "ON" or "OFF")
    elseif msg == "reload" or msg == "reset" then
        BAG:Print("Reloading guide...")
        BAG:SmartStart()
    elseif msg == "next" then
        BAG.Engine:NextStep()
    elseif msg == "prev" or msg == "previous" then
        BAG.Engine:PreviousStep()
    elseif msg == "show" then
        BAG.UI:Show()
    elseif msg == "hide" then
        BAG.UI:Hide()
    elseif msg == "toggle" then
        BAG.UI:Toggle()
    elseif msg == "help" then
        BAG:Print("Commands:")
        BAG:Print("/bag - Toggle guide window")
        BAG:Print("/bag show - Show guide window")
        BAG:Print("/bag hide - Hide guide window")
        BAG:Print("/bag next - Next step")
        BAG:Print("/bag prev - Previous step")
        BAG:Print("/bag reload - Reload current guide")
        BAG:Print("/bag debug - Toggle debug mode")
    else
        -- Default: toggle window
        BAG.UI:Toggle()
    end
end

-- Event frame for initialization
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:RegisterEvent("PLAYER_LOGIN")

initFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "BankAloneGuides" then
        -- Addon loaded, but wait for PLAYER_LOGIN
        BAG:DebugPrint("Addon files loaded")
    elseif event == "PLAYER_LOGIN" then
        -- Player fully logged in, safe to initialize
        C_Timer.After(0.5, function()
            BAG:Initialize()
        end)
    end
end)
