--[[
    Bank Alone Guides - Event System
    Handles WoW game events and triggers appropriate addon responses
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Event frame
local eventFrame = CreateFrame("Frame")

-- Event handlers
local eventHandlers = {}

-- Register event handler
function BAG.Events:RegisterHandler(event, handler)
    if not eventHandlers[event] then
        eventHandlers[event] = {}
        eventFrame:RegisterEvent(event)
    end
    
    table.insert(eventHandlers[event], handler)
end

-- Unregister event handler
function BAG.Events:UnregisterHandler(event, handler)
    if eventHandlers[event] then
        for i, h in ipairs(eventHandlers[event]) do
            if h == handler then
                table.remove(eventHandlers[event], i)
                break
            end
        end
        
        -- If no more handlers, unregister event
        if #eventHandlers[event] == 0 then
            eventFrame:UnregisterEvent(event)
            eventHandlers[event] = nil
        end
    end
end

-- Dispatch event to handlers
local function DispatchEvent(event, ...)
    if eventHandlers[event] then
        for _, handler in ipairs(eventHandlers[event]) do
            BAG.Utils:SafeCall(handler, event, ...)
        end
    end
end

-- Set up event frame handler
eventFrame:SetScript("OnEvent", function(self, event, ...)
    DispatchEvent(event, ...)
end)

-- Initialize event system
function BAG.Events:Initialize()
    -- Core events
    self:RegisterHandler("PLAYER_LOGIN", self.OnPlayerLogin)
    self:RegisterHandler("PLAYER_ENTERING_WORLD", self.OnPlayerEnteringWorld)
    self:RegisterHandler("PLAYER_LOGOUT", self.OnPlayerLogout)
    self:RegisterHandler("PLAYER_LEVEL_UP", self.OnPlayerLevelUp)
    
    -- Quest events
    self:RegisterHandler("QUEST_ACCEPTED", self.OnQuestAccepted)
    self:RegisterHandler("QUEST_TURNED_IN", self.OnQuestTurnedIn)
    self:RegisterHandler("QUEST_REMOVED", self.OnQuestRemoved)
    self:RegisterHandler("QUEST_LOG_UPDATE", self.OnQuestLogUpdate)
    self:RegisterHandler("QUEST_COMPLETE", self.OnQuestComplete)
    
    -- Zone events
    self:RegisterHandler("ZONE_CHANGED", self.OnZoneChanged)
    self:RegisterHandler("ZONE_CHANGED_NEW_AREA", self.OnZoneChangedNewArea)
    
    -- Combat events
    self:RegisterHandler("PLAYER_REGEN_DISABLED", self.OnCombatStart)
    self:RegisterHandler("PLAYER_REGEN_ENABLED", self.OnCombatEnd)
    
    -- Inventory events
    self:RegisterHandler("BAG_UPDATE", self.OnBagUpdate)
    
    -- Unit events
    self:RegisterHandler("UNIT_QUEST_LOG_CHANGED", self.OnUnitQuestLogChanged)
    
    BAG.Logo:Print("Event system initialized")
end

-- Event Handlers

function BAG.Events:OnPlayerLogin()
    BAG:Debug("PLAYER_LOGIN")
    
    -- Initialize addon
    if not BAG.IsLoaded then
        BAG:Initialize()
        BAG.IsLoaded = true
    end
end

function BAG.Events:OnPlayerEnteringWorld(isInitialLogin, isReloadingUI)
    BAG:Debug("PLAYER_ENTERING_WORLD", isInitialLogin, isReloadingUI)
    
    -- Update character info
    if BAG.IsLoaded then
        local charData = BAG.SavedVars:GetCharacterData()
        if charData then
            charData.character.level = UnitLevel("player")
        end
    end
end

function BAG.Events:OnPlayerLogout()
    BAG:Debug("PLAYER_LOGOUT")
    
    -- Save any pending data
    if BAG.Engine and BAG.Engine.currentGuide then
        BAG.SavedVars:SetCurrentGuide(BAG.Engine.currentGuide.id, BAG.Engine.currentStep)
    end
end

function BAG.Events:OnPlayerLevelUp(level)
    BAG:Debug("PLAYER_LEVEL_UP", level)
    
    -- Update saved level
    local charData = BAG.SavedVars:GetCharacterData()
    if charData then
        charData.character.level = level
        BAG.SavedVars:IncrementStat("levelsGained")
    end
    
    -- Show notification
    if BAG.SavedVars:Get("notifications.levelUp") then
        BAG.Logo:PrintSuccess("Level " .. level .. "!")
    end
    
    -- Update engine (may unlock new steps)
    if BAG.Engine then
        BAG.Engine:UpdateSteps()
    end
    
    -- Update UI
    if BAG.UI then
        BAG.UI:Update()
    end
end

function BAG.Events:OnQuestAccepted(questID)
    BAG:Debug("QUEST_ACCEPTED", questID)
    
    -- Show notification
    if BAG.SavedVars:Get("notifications.questAccepted") then
        local questTitle = BAG.QuestAPI:GetQuestTitle(questID)
        if questTitle then
            BAG.Logo:Print("Quest accepted: " .. questTitle)
        end
    end
    
    -- Update engine
    if BAG.Engine then
        BAG.Engine:OnQuestAccepted(questID)
    end
    
    -- Update UI
    if BAG.UI then
        BAG.UI:Update()
    end
end

function BAG.Events:OnQuestTurnedIn(questID, xp, money)
    BAG:Debug("QUEST_TURNED_IN", questID, xp, money)
    
    -- Update statistics
    BAG.SavedVars:IncrementStat("questsCompleted")
    
    -- Show notification
    if BAG.SavedVars:Get("notifications.questCompleted") then
        local questTitle = BAG.QuestAPI:GetQuestTitle(questID)
        if questTitle then
            BAG.Logo:PrintSuccess("Quest completed: " .. questTitle)
        end
    end
    
    -- Update engine
    if BAG.Engine then
        BAG.Engine:OnQuestCompleted(questID)
    end
    
    -- Update UI
    if BAG.UI then
        BAG.UI:Update()
    end
end

function BAG.Events:OnQuestRemoved(questID)
    BAG:Debug("QUEST_REMOVED", questID)
    
    -- Update engine
    if BAG.Engine then
        BAG.Engine:OnQuestRemoved(questID)
    end
    
    -- Update UI
    if BAG.UI then
        BAG.UI:Update()
    end
end

function BAG.Events:OnQuestLogUpdate()
    BAG:Debug("QUEST_LOG_UPDATE")
    
    -- Update engine
    if BAG.Engine then
        BAG.Engine:UpdateSteps()
    end
    
    -- Update UI
    if BAG.UI then
        BAG.UI:Update()
    end
end

function BAG.Events:OnQuestComplete()
    BAG:Debug("QUEST_COMPLETE")
    
    -- Update UI
    if BAG.UI then
        BAG.UI:Update()
    end
end

function BAG.Events:OnZoneChanged()
    BAG:Debug("ZONE_CHANGED")
    
    -- Update UI
    if BAG.UI then
        BAG.UI:Update()
    end
end

function BAG.Events:OnZoneChangedNewArea()
    local zone = GetZoneText()
    BAG:Debug("ZONE_CHANGED_NEW_AREA", zone)
    
    -- Track zone visit
    if zone and zone ~= "" then
        BAG.SavedVars:AddVisitedZone(zone)
    end
    
    -- Update engine (may affect available steps)
    if BAG.Engine then
        BAG.Engine:UpdateSteps()
    end
    
    -- Update UI
    if BAG.UI then
        BAG.UI:Update()
    end
end

function BAG.Events:OnCombatStart()
    BAG:Debug("PLAYER_REGEN_DISABLED")
    
    -- Could minimize UI or change display during combat
    -- Currently just track state
    BAG.inCombat = true
end

function BAG.Events:OnCombatEnd()
    BAG:Debug("PLAYER_REGEN_ENABLED")
    
    BAG.inCombat = false
    
    -- Update engine (check for step completion)
    if BAG.Engine then
        BAG.Engine:UpdateSteps()
    end
    
    -- Update UI
    if BAG.UI then
        BAG.UI:Update()
    end
end

function BAG.Events:OnBagUpdate(bagID)
    BAG:Debug("BAG_UPDATE", bagID)
    
    -- Update engine (check for item-related steps)
    if BAG.Engine then
        BAG.Engine:CheckItemSteps()
    end
end

function BAG.Events:OnUnitQuestLogChanged(unit)
    if unit == "player" then
        BAG:Debug("UNIT_QUEST_LOG_CHANGED", unit)
        
        -- Update UI
        if BAG.UI then
            BAG.UI:Update()
        end
    end
end

-- Custom event system (for addon-internal events)
local customEventHandlers = {}

function BAG.Events:TriggerCustom(eventName, ...)
    BAG:Debug("Custom event:", eventName)
    
    if customEventHandlers[eventName] then
        for _, handler in ipairs(customEventHandlers[eventName]) do
            BAG.Utils:SafeCall(handler, eventName, ...)
        end
    end
end

function BAG.Events:RegisterCustom(eventName, handler)
    if not customEventHandlers[eventName] then
        customEventHandlers[eventName] = {}
    end
    
    table.insert(customEventHandlers[eventName], handler)
end

-- Throttling utility for frequent events
local throttledEvents = {}

function BAG.Events:Throttle(eventName, interval, callback)
    local lastCall = throttledEvents[eventName] or 0
    local now = GetTime()
    
    if now - lastCall >= interval then
        throttledEvents[eventName] = now
        callback()
    end
end

print("|cff00B3FF[Bank Alone Guides]|r Event system loaded")
