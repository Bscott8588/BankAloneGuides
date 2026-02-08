--[[
    Bank Alone Guides - Event System
    SCS / Bank Alone Guides
    
    Registers and handles all relevant WoW events.
]]

local BAG = BankAlone

BAG.Events = BAG.Events or {}
local Events = BAG.Events

-- Create the event frame
local eventFrame = CreateFrame("Frame", "BAG_EventFrame", UIParent)
Events._frame = eventFrame

-- Event handlers table
Events._handlers = {}

-- Register an event with a handler
function Events:Register(event, handler)
    if not self._handlers[event] then
        self._handlers[event] = {}
        self._frame:RegisterEvent(event)
    end
    self._handlers[event][#self._handlers[event] + 1] = handler
end

-- Unregister an event handler
function Events:Unregister(event)
    if self._handlers[event] then
        self._frame:UnregisterEvent(event)
        self._handlers[event] = nil
    end
end

-- Main event dispatcher
eventFrame:SetScript("OnEvent", function(self, event, ...)
    local handlers = Events._handlers[event]
    if handlers then
        for _, handler in ipairs(handlers) do
            local ok, err = pcall(handler, event, ...)
            if not ok then
                BAG:Error("Event handler error [" .. event .. "]: " .. tostring(err))
            end
        end
    end
end)

-- ============================================================
-- Register core events
-- ============================================================

-- PLAYER_LOGIN: Main initialization
Events:Register("PLAYER_LOGIN", function(event)
    -- Delay slightly to ensure all addons are loaded
    C_Timer.After(0.5, function()
        BAG:Initialize()
    end)
end)

-- PLAYER_LEVEL_UP: Re-evaluate guide and possibly suggest next guide
Events:Register("PLAYER_LEVEL_UP", function(event, newLevel)
    BAG:Debug("Level up!", newLevel)
    BAG.Engine:TryAutoAdvance()
    BAG.UI:RefreshStep()
end)

-- QUEST_ACCEPTED: A quest was accepted
Events:Register("QUEST_ACCEPTED", function(event, questIndex, questID)
    -- In TBC Classic, the second arg may be questID
    BAG:Debug("Quest accepted:", questIndex, questID)
    C_Timer.After(0.2, function()
        BAG.Engine:TryAutoAdvance()
        BAG.UI:RefreshStep()
    end)
end)

-- QUEST_TURNED_IN: A quest was turned in
Events:Register("QUEST_TURNED_IN", function(event, questID, xpReward, moneyReward)
    BAG:Debug("Quest turned in:", questID)
    if questID then
        BAG.QuestTrack:OnQuestTurnedIn(questID)
    end
    C_Timer.After(0.2, function()
        BAG.Engine:TryAutoAdvance()
        BAG.UI:RefreshStep()
    end)
end)

-- QUEST_REMOVED: A quest was abandoned or completed
Events:Register("QUEST_REMOVED", function(event, questID)
    BAG:Debug("Quest removed:", questID)
    C_Timer.After(0.2, function()
        BAG.Engine:TryAutoAdvance()
        BAG.UI:RefreshStep()
    end)
end)

-- UNIT_QUEST_LOG_CHANGED: Quest log updated (objective progress, etc.)
Events:Register("UNIT_QUEST_LOG_CHANGED", function(event, unit)
    if unit == "player" then
        C_Timer.After(0.2, function()
            BAG.Engine:TryAutoAdvance()
            BAG.UI:RefreshStep()
        end)
    end
end)

-- QUEST_LOG_UPDATE: Fires when quest objectives change (kill count, collect count, etc.)
-- This is the key event for live objective tracking like Zygor
Events:Register("QUEST_LOG_UPDATE", function(event)
    C_Timer.After(0.1, function()
        BAG.Engine:TryAutoAdvance()
        BAG.UI:RefreshStep()
    end)
end)

-- COMBAT_LOG_EVENT_UNFILTERED: Catch mob kills for faster objective updates
Events:Register("COMBAT_LOG_EVENT_UNFILTERED", function(event)
    -- Only process when we have a kill-type current step
    local step = BAG.Engine:GetCurrentStep()
    if step and (step.type == "kill" or step.type == "complete" or step.type == "collect") then
        -- Debounce: refresh after a short delay (combat log fires rapidly)
        if not BAG._combatRefreshPending then
            BAG._combatRefreshPending = true
            C_Timer.After(0.5, function()
                BAG._combatRefreshPending = false
                BAG.UI:RefreshStep()
            end)
        end
    end
end)

-- ZONE_CHANGED_NEW_AREA: Player entered a new zone
Events:Register("ZONE_CHANGED_NEW_AREA", function(event)
    BAG:Debug("Zone changed:", BAG.ZoneDetect:GetCurrentZone())
    BAG.Engine:TryAutoAdvance()
    BAG.UI:RefreshStep()
end)

-- ZONE_CHANGED: Subzone change
Events:Register("ZONE_CHANGED", function(event)
    BAG.Engine:TryAutoAdvance()
end)

-- BAG_UPDATE: Inventory changed (for collect steps)
Events:Register("BAG_UPDATE", function(event, bagID)
    C_Timer.After(0.15, function()
        BAG.Engine:TryAutoAdvance()
        BAG.UI:RefreshStep()
    end)
end)

-- PLAYER_ENTERING_WORLD: Also fires on login/reload
Events:Register("PLAYER_ENTERING_WORLD", function(event, isLogin, isReload)
    if isReload then
        C_Timer.After(0.5, function()
            if not BAG._initialized then
                BAG:Initialize()
            end
        end)
    end
end)
