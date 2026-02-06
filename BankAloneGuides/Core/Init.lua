--[[
    Bank Alone Guides - Core Initialization
    SCS / Bank Alone Guides
    Author: Bradley S. Scott
    
    Creates the global BankAlone namespace and initializes all submodules.
    Install path: C:\Program Files (x86)\World of Warcraft\_anniversary_\Interface\AddOns\BankAloneGuides
]]

-- Global addon table
BankAlone = BankAlone or {}
local BAG = BankAlone

-- Version info
BAG.VERSION = "1.0"
BAG.ADDON_NAME = "Bank Alone Guides"
BAG.ADDON_SHORT = "BAG"

-- Submodule stubs (populated by respective files)
BAG.Engine = BAG.Engine or {}
BAG.Events = BAG.Events or {}
BAG.Conditions = BAG.Conditions or {}
BAG.SavedVars = BAG.SavedVars or {}
BAG.Utils = BAG.Utils or {}
BAG.UI = BAG.UI or {}
BAG.Navigator = BAG.Navigator or {}
BAG.ZoneDetect = BAG.ZoneDetect or {}
BAG.QuestTrack = BAG.QuestTrack or {}
BAG.Travel = BAG.Travel or {}
BAG.Parser = BAG.Parser or {}
BAG.Data = BAG.Data or {}
BAG.API = BAG.API or {}
BAG.Branding = BAG.Branding or {}
BAG.Guides = BAG.Guides or {}

-- Internal state
BAG._initialized = false
BAG._debugMode = false

-- Debug print
function BAG:Debug(...)
    if self._debugMode then
        print("|cFF00CCFF[BAG Debug]|r", ...)
    end
end

-- Print helper
function BAG:Print(...)
    print("|cFF00CCFF[Bank Alone]|r", ...)
end

-- Error print
function BAG:Error(...)
    print("|cFFFF3333[Bank Alone Error]|r", ...)
end

-- Smart Start Logic
-- Determines the best guide to load based on player's current state
function BAG:SmartStart()
    local faction = BAG.API.Player:GetFaction()
    local level = BAG.API.Player:GetLevel()
    local zone = BAG.ZoneDetect:GetCurrentZone()
    local race = BAG.API.Player:GetRace()

    BAG:Debug("SmartStart - Faction:", faction, "Level:", level, "Zone:", zone, "Race:", race)

    -- Check if we have saved progress for this character
    local savedGuide = BAG.SavedVars:GetCharVar("currentGuide")
    local savedStep = BAG.SavedVars:GetCharVar("currentStep")

    if savedGuide and savedStep then
        -- Resume from saved progress
        local guide = BAG.Guides[savedGuide]
        if guide then
            BAG:Print("Resuming guide: " .. (guide.title or savedGuide) .. " at step " .. savedStep)
            BAG.Engine:LoadGuide(savedGuide)
            BAG.Engine:SetStep(savedStep)
            return
        end
    end

    -- No saved progress - determine best guide
    local guideName = BAG:DetermineGuide(faction, level, zone, race)

    if guideName then
        BAG:Print("Starting guide: " .. guideName)
        BAG.Engine:LoadGuide(guideName)

        -- Try to find the best starting step within the guide
        local bestStep = BAG.Navigator:FindBestStep(level, zone)
        if bestStep and bestStep > 1 then
            BAG.Engine:SetStep(bestStep)
            BAG:Print("Jumping to step " .. bestStep .. " based on your current progress.")
        end
    else
        BAG:Print("No matching guide found for your character. Open the guide list to pick one manually.")
    end
end

-- Determine the best guide based on faction, level, zone, and race
function BAG:DetermineGuide(faction, level, zone, race)
    -- Outland detection (58-70)
    local outlandZones = {
        ["Hellfire Peninsula"] = true,
        ["Zangarmarsh"] = true,
        ["Terokkar Forest"] = true,
        ["Nagrand"] = true,
        ["Blade's Edge Mountains"] = true,
        ["Netherstorm"] = true,
        ["Shadowmoon Valley"] = true,
        ["Shattrath City"] = true,
    }

    local prefix = faction -- "Alliance" or "Horde"

    -- If player is in Outland
    if outlandZones[zone] then
        if level >= 66 then
            return prefix .. "_6670_Netherstorm"
        elseif level >= 64 then
            return prefix .. "_6466_BladesEdge"
        elseif level >= 62 then
            return prefix .. "_6264_Terokkar"
        elseif level >= 60 then
            return prefix .. "_6062_Zangarmarsh"
        else
            return prefix .. "_5860_Hellfire"
        end
    end

    -- Azeroth leveling ranges
    if level < 10 then
        return BAG:GetStartingGuide(faction, race)
    elseif level < 20 then
        return prefix .. "_1020"
    elseif level < 30 then
        return prefix .. "_2030"
    elseif level < 40 then
        return prefix .. "_3040"
    elseif level < 50 then
        return prefix .. "_4050"
    elseif level < 58 then
        return prefix .. "_5058"
    elseif level < 60 then
        return prefix .. "_5860_Hellfire"
    else
        return prefix .. "_6062_Zangarmarsh"
    end
end

-- Get the starting zone guide (1-10) based on race
function BAG:GetStartingGuide(faction, race)
    local raceGuides = {
        -- Alliance
        ["Human"]    = "Alliance_0110_Elwynn",
        ["Dwarf"]    = "Alliance_0110_DunMorogh",
        ["Gnome"]    = "Alliance_0110_DunMorogh",
        ["Night Elf"]= "Alliance_0110_Teldrassil",
        ["Draenei"]  = "Alliance_0110_AzuremystIsle",
        -- Horde
        ["Orc"]      = "Horde_0110_Durotar",
        ["Troll"]    = "Horde_0110_Durotar",
        ["Tauren"]   = "Horde_0110_Mulgore",
        ["Undead"]   = "Horde_0110_TirisfalGlades",
        ["Blood Elf"]= "Horde_0110_EversongWoods",
    }

    local guide = raceGuides[race]
    if guide then return guide end

    -- Fallback
    if faction == "Alliance" then
        return "Alliance_0110_Elwynn"
    else
        return "Horde_0110_Durotar"
    end
end

-- Main initialization (called on PLAYER_LOGIN)
function BAG:Initialize()
    if self._initialized then return end

    BAG:Debug("Initializing Bank Alone Guides v" .. BAG.VERSION)

    -- Init SavedVariables
    BAG.SavedVars:Initialize()

    -- Init UI
    BAG.UI:Initialize()

    -- Init branding
    BAG.Branding:ApplyTheme()

    -- Init engine
    BAG.Engine:Initialize()

    -- Init navigator
    BAG.Navigator:Initialize()

    -- Smart start
    BAG:SmartStart()

    self._initialized = true
    BAG:Print("v" .. BAG.VERSION .. " loaded. Type /bag for options.")
end

-- Slash commands
SLASH_BANKALONE1 = "/bag"
SLASH_BANKALONE2 = "/bankalone"
SlashCmdList["BANKALONE"] = function(msg)
    msg = (msg or ""):lower():trim()

    if msg == "show" then
        BAG.UI:Show()
    elseif msg == "hide" then
        BAG.UI:Hide()
    elseif msg == "toggle" then
        BAG.UI:Toggle()
    elseif msg == "debug" then
        BAG._debugMode = not BAG._debugMode
        BAG:Print("Debug mode: " .. (BAG._debugMode and "ON" or "OFF"))
    elseif msg == "reset" then
        BAG.SavedVars:ResetCharacter()
        BAG:Print("Character progress reset.")
        BAG:SmartStart()
    elseif msg == "next" then
        BAG.Engine:NextStep()
    elseif msg == "prev" then
        BAG.Engine:PrevStep()
    elseif msg == "status" then
        local guide = BAG.Engine:GetCurrentGuideName()
        local step = BAG.Engine:GetCurrentStepIndex()
        local total = BAG.Engine:GetTotalSteps()
        BAG:Print(string.format("Guide: %s | Step: %d/%d", guide or "None", step or 0, total or 0))
    else
        BAG:Print("Commands: /bag [show|hide|toggle|next|prev|status|reset|debug]")
    end
end
