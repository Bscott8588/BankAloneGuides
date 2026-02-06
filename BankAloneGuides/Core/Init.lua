--[[
    Bank Alone Guides - Initialization
    Core initialization and namespace setup
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"

-- Namespace already created in Theme.lua
local BAG = BankAlone

-- Version information
BAG.Version = "1.0"
BAG.Build = "20260206"
BAG.MinInterface = 20504

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
BAG.Data = {}

-- Initialization flags
BAG.IsInitialized = false
BAG.IsLoaded = false

-- Debug mode
BAG.DebugMode = false

-- Main initialization function
function BAG:Initialize()
    if self.IsInitialized then
        return
    end
    
    BAG.Logo:Print("Initializing v" .. self.Version .. "...")
    
    -- Initialize SavedVariables
    self.SavedVars:Initialize()
    
    -- Get player information
    local playerInfo = self.PlayerAPI:GetPlayerInfo()
    BAG.Logo:Print(string.format("Welcome, %s! Level %d %s %s", 
        playerInfo.name,
        playerInfo.level,
        playerInfo.race,
        playerInfo.class))
    
    -- Initialize UI
    self.UI:Initialize()
    
    -- Register events
    self.Events:Initialize()
    
    -- Initialize engine
    self.Engine:Initialize()
    
    -- Smart start: Load appropriate guide
    self:SmartStart()
    
    self.IsInitialized = true
    BAG.Logo:PrintSuccess("Initialization complete!")
end

-- Smart start system: Detect level/zone and load appropriate guide
function BAG:SmartStart()
    local playerInfo = self.PlayerAPI:GetPlayerInfo()
    local level = playerInfo.level
    local faction = playerInfo.faction
    local zone = self.MapAPI:GetCurrentZone()
    
    BAG.Logo:Print(string.format("Smart Start: Level %d %s in %s", level, faction, zone or "Unknown"))
    
    -- Check if user has a saved guide in progress
    local savedGuide = self.SavedVars:GetCurrentGuide()
    if savedGuide then
        BAG.Logo:Print("Resuming saved guide: " .. savedGuide.title)
        self.Engine:LoadGuide(savedGuide.id, savedGuide.step or 1)
        return
    end
    
    -- Determine best guide based on level and faction
    local guideID = self:DetermineGuide(level, faction, zone)
    
    if guideID then
        BAG.Logo:Print("Loading guide: " .. guideID)
        self.Engine:LoadGuide(guideID, 1)
    else
        BAG.Logo:PrintWarning("No suitable guide found. Please select a guide from the menu.")
    end
end

-- Determine which guide to load based on player state
function BAG:DetermineGuide(level, faction, zone)
    -- Outland zones (58-70)
    local outlandZones = {
        ["Hellfire Peninsula"] = true,
        ["Zangarmarsh"] = true,
        ["Terokkar Forest"] = true,
        ["Nagrand"] = true,
        ["Blade's Edge Mountains"] = true,
        ["Netherstorm"] = true,
        ["Shadowmoon Valley"] = true,
    }
    
    -- If in Outland, use Outland guide
    if outlandZones[zone] then
        if faction == "Alliance" then
            return "Alliance_58_70_Outland"
        else
            return "Horde_58_70_Outland"
        end
    end
    
    -- Level-based guide selection
    local guidePrefix = faction == "Alliance" and "Alliance" or "Horde"
    
    if level < 10 then
        return guidePrefix .. "_01_10"
    elseif level < 20 then
        return guidePrefix .. "_10_20"
    elseif level < 30 then
        return guidePrefix .. "_20_30"
    elseif level < 40 then
        return guidePrefix .. "_30_40"
    elseif level < 50 then
        return guidePrefix .. "_40_50"
    elseif level < 60 then
        return guidePrefix .. "_50_60"
    else
        -- Level 60+, use Outland guide
        return guidePrefix .. "_58_70_Outland"
    end
end

-- Debug function
function BAG:Debug(...)
    if self.DebugMode then
        BAG.Logo:Print("[DEBUG] " .. strjoin(" ", tostringall(...)))
    end
end

-- Reload addon
function BAG:Reload()
    BAG.Logo:Print("Reloading addon...")
    self.IsInitialized = false
    self.IsLoaded = false
    self:Initialize()
end

-- Get addon info
function BAG:GetInfo()
    return {
        name = ADDON_NAME,
        version = self.Version,
        build = self.Build,
        author = "Bradley S. Scott",
        website = "https://scs-gaming.com"
    }
end

-- Slash commands
SLASH_BANKALONEGUIDES1 = "/bag"
SLASH_BANKALONEGUIDES2 = "/bankalone"
SLASH_BANKALONEGUIDES3 = "/bankaloneguides"

SlashCmdList["BANKALONEGUIDES"] = function(msg)
    msg = string.lower(msg or "")
    
    if msg == "" or msg == "show" then
        BAG.UI:Toggle()
    elseif msg == "hide" then
        BAG.UI:Hide()
    elseif msg == "reload" then
        BAG:Reload()
    elseif msg == "debug" then
        BAG.DebugMode = not BAG.DebugMode
        BAG.Logo:Print("Debug mode: " .. (BAG.DebugMode and "ON" or "OFF"))
    elseif msg == "version" or msg == "v" then
        local info = BAG:GetInfo()
        BAG.Logo:Print(string.format("Version %s (Build %s)", info.version, info.build))
    elseif msg == "reset" then
        BAG.SavedVars:Reset()
        BAG.Logo:PrintSuccess("Settings reset. Reloading UI...")
        ReloadUI()
    elseif msg == "help" then
        BAG.Logo:Print("Available commands:")
        print("  /bag - Toggle guide window")
        print("  /bag show - Show guide window")
        print("  /bag hide - Hide guide window")
        print("  /bag reload - Reload addon")
        print("  /bag debug - Toggle debug mode")
        print("  /bag version - Show version info")
        print("  /bag reset - Reset all settings")
        print("  /bag help - Show this help")
    else
        BAG.Logo:PrintError("Unknown command. Type /bag help for available commands.")
    end
end

print("|cff00B3FF[Bank Alone Guides]|r Core initialization loaded")
