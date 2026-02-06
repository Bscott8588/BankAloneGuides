-------------------------------------------------------------------------------
-- Bank Alone Guides — Core / Init
-- Global namespace creation and addon bootstrap
-- Install path: Interface\AddOns\BankAloneGuides
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------

-- Create the global namespace
BankAlone = BankAlone or {}
local BAG = BankAlone

-- Addon metadata
BAG.AddonName    = "Bank Alone Guides"
BAG.Version      = "1.0"
BAG.Author       = "Bradley S. Scott"
BAG.Brand        = "SCS"
BAG.DebugMode    = false

-- ── Sub-module stubs ───────────────────────────────────────────────────────
BAG.Engine      = BAG.Engine      or {}
BAG.Events      = BAG.Events      or {}
BAG.Conditions  = BAG.Conditions  or {}
BAG.SavedVars   = BAG.SavedVars   or {}
BAG.Utils       = BAG.Utils       or {}
BAG.UI          = BAG.UI          or {}
BAG.Navigator   = BAG.Navigator   or {}
BAG.ZoneDetect  = BAG.ZoneDetect  or {}
BAG.QuestTrack  = BAG.QuestTrack  or {}
BAG.Travel      = BAG.Travel      or {}
BAG.Parser      = BAG.Parser      or {}
BAG.Theme       = BAG.Theme       or {}
BAG.Layout      = BAG.Layout      or {}
BAG.Logo        = BAG.Logo        or {}
BAG.QuestAPI    = BAG.QuestAPI    or {}
BAG.PlayerAPI   = BAG.PlayerAPI   or {}
BAG.InventoryAPI= BAG.InventoryAPI or {}
BAG.SpellAPI    = BAG.SpellAPI    or {}
BAG.MapAPI      = BAG.MapAPI      or {}
BAG.Data        = BAG.Data        or {}
BAG.Guides      = BAG.Guides      or {}

-- Registry for all loaded guides
BAG.Guides.Registry = BAG.Guides.Registry or {}

-- ── Race → starting zone mapping (for smart start level 1-10) ──────────
BAG.RaceStartZones = {
    -- Alliance
    Human    = "Elwynn Forest",
    Dwarf    = "Dun Morogh",
    Gnome    = "Dun Morogh",
    NightElf = "Teldrassil",
    Draenei  = "Azuremyst Isle",
    -- Horde
    Orc      = "Durotar",
    Troll    = "Durotar",
    Undead   = "Tirisfal Glades",
    Tauren   = "Mulgore",
    BloodElf = "Eversong Woods",
}

-- ── Smart Start Logic ──────────────────────────────────────────────────────
--- Determine the best guide for the player on login.
-- Reads faction, level, race, and current zone to pick the right segment.
-- @return guideKey  The key into BAG.Guides.Registry
function BAG:SmartStart()
    local level   = BAG.PlayerAPI:GetLevel()
    local faction = BAG.PlayerAPI:GetFaction()
    local race    = BAG.PlayerAPI:GetRace()
    local zone    = BAG.ZoneDetect:GetCurrentZone()

    BAG:Debug("SmartStart — Lv " .. level .. " " .. race .. " " .. faction .. " in " .. zone)

    -- 1) Check if there's a guide specifically matching the current zone
    local bestGuide = nil
    local bestScore = -1

    for key, guide in pairs(BAG.Guides.Registry) do
        -- Faction filter
        if guide.faction == "Both" or guide.faction == faction then
            local score = 0
            local minLvl = guide.levelRange and guide.levelRange[1] or 1
            local maxLvl = guide.levelRange and guide.levelRange[2] or 70

            -- Level must be in range (allow 2 levels below minimum)
            if level >= (minLvl - 2) and level <= maxLvl then
                -- Score: prefer guides whose min level is closest to current level
                score = 100 - math.abs(level - minLvl)

                -- Bonus if the guide's zone matches current zone
                if guide.zone and guide.zone == zone then
                    score = score + 50
                end

                -- Bonus for race-specific start zones at low levels
                if level < 10 and guide.zone == BAG.RaceStartZones[race] then
                    score = score + 30
                end

                -- Outland bonus if player is in Outland
                if BAG.ZoneDetect:IsOutland(zone) and minLvl >= 58 then
                    score = score + 40
                end

                if score > bestScore then
                    bestScore = score
                    bestGuide = key
                end
            end
        end
    end

    if bestGuide then
        BAG:Debug("SmartStart chose guide: " .. bestGuide)
    else
        -- Fallback: pick first 1-10 guide for faction
        for key, guide in pairs(BAG.Guides.Registry) do
            if (guide.faction == "Both" or guide.faction == faction) and
               guide.levelRange and guide.levelRange[1] == 1 then
                bestGuide = key
                break
            end
        end
        BAG:Debug("SmartStart fallback guide: " .. tostring(bestGuide))
    end

    return bestGuide
end

-- ── Addon Bootstrap (called from Events.lua on PLAYER_LOGIN) ──────────────
function BAG:Initialize()
    -- 1. Load/create saved variables
    BAG.SavedVars:Initialize()

    -- 2. Determine the best guide for this character
    local savedGuide = BAG.SavedVars:Get("currentGuide")
    local savedStep  = BAG.SavedVars:Get("currentStep")

    if savedGuide and BAG.Guides.Registry[savedGuide] then
        -- Resume where they left off
        BAG.Engine:LoadGuide(savedGuide, savedStep)
    else
        -- Smart start
        local guideKey = BAG:SmartStart()
        if guideKey then
            BAG.Engine:LoadGuide(guideKey, 1)
        end
    end

    -- 3. Build and show UI
    BAG.UI:Initialize()

    -- 4. Print welcome message
    BAG:Print(BAG.Theme:Colorize("Bank Alone Guides", BAG.Theme.Colors.Primary) ..
              " v" .. BAG.Version .. " loaded. Type /bag for options.")
end

-- ── Utility: print to chat ─────────────────────────────────────────────────
function BAG:Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cff00b3ff[BAG]|r " .. tostring(msg))
end

function BAG:Debug(msg)
    if self.DebugMode then
        DEFAULT_CHAT_FRAME:AddMessage("|cff888888[BAG-DBG]|r " .. tostring(msg))
    end
end

-- ── Slash commands ─────────────────────────────────────────────────────────
SLASH_BANKALONE1 = "/bag"
SLASH_BANKALONE2 = "/bankalone"
SlashCmdList["BANKALONE"] = function(input)
    local cmd = (input or ""):lower():trim()
    if cmd == "show" or cmd == "toggle" or cmd == "" then
        BAG.UI:Toggle()
    elseif cmd == "hide" then
        BAG.UI:Hide()
    elseif cmd == "reset" then
        BAG.UI:ResetPosition()
        BAG:Print("Frame position reset.")
    elseif cmd == "debug" then
        BAG.DebugMode = not BAG.DebugMode
        BAG:Print("Debug mode: " .. (BAG.DebugMode and "ON" or "OFF"))
    elseif cmd == "smart" then
        local key = BAG:SmartStart()
        if key then
            BAG.Engine:LoadGuide(key, 1)
            BAG:Print("Smart-started guide: " .. key)
        end
    else
        BAG:Print("Commands: /bag [show|hide|reset|debug|smart]")
    end
end
