-------------------------------------------------------------------------------
-- Bank Alone Guides — Core / Events
-- WoW event registration and dispatch
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Events = BAG.Events or {}

-- Create a hidden event frame
local eventFrame = CreateFrame("Frame", "BAG_EventFrame", UIParent)
BAG.Events.frame = eventFrame

-- Event handler table: event name → list of callbacks
local handlers = {}

--- Register a callback for a WoW event.
-- @param event     The WoW event name (e.g. "PLAYER_LOGIN")
-- @param callback  A function(self, event, ...) to call
function BAG.Events:Register(event, callback)
    if not handlers[event] then
        handlers[event] = {}
        eventFrame:RegisterEvent(event)
    end
    handlers[event][#handlers[event] + 1] = callback
end

--- Unregister all callbacks for an event.
function BAG.Events:Unregister(event)
    handlers[event] = nil
    eventFrame:UnregisterEvent(event)
end

-- Master dispatcher
eventFrame:SetScript("OnEvent", function(self, event, ...)
    if handlers[event] then
        for _, cb in ipairs(handlers[event]) do
            local ok, err = pcall(cb, BAG, event, ...)
            if not ok then
                BAG:Debug("Event error [" .. event .. "]: " .. tostring(err))
            end
        end
    end
end)

-- ═══════════════════════════════════════════════════════════════════════════
-- Register core events
-- ═══════════════════════════════════════════════════════════════════════════

-- ── PLAYER_LOGIN ──────────────────────────────────────────────────────────
BAG.Events:Register("PLAYER_LOGIN", function(self, event)
    BAG:Initialize()
end)

-- ── PLAYER_LEVEL_UP ───────────────────────────────────────────────────────
BAG.Events:Register("PLAYER_LEVEL_UP", function(self, event, newLevel)
    BAG:Debug("Level up! Now level " .. tostring(newLevel))
    BAG.Engine:Evaluate()
end)

-- ── QUEST_ACCEPTED ────────────────────────────────────────────────────────
BAG.Events:Register("QUEST_ACCEPTED", function(self, event, questIndex)
    BAG:Debug("Quest accepted")
    BAG.Engine:Evaluate()
end)

-- ── QUEST_TURNED_IN ───────────────────────────────────────────────────────
BAG.Events:Register("QUEST_TURNED_IN", function(self, event, questID, xpReward, moneyReward)
    BAG:Debug("Quest turned in: " .. tostring(questID))
    BAG.Engine:Evaluate()
end)

-- ── QUEST_REMOVED ─────────────────────────────────────────────────────────
BAG.Events:Register("QUEST_REMOVED", function(self, event, questID)
    BAG:Debug("Quest removed: " .. tostring(questID))
    BAG.Engine:Evaluate()
end)

-- ── ZONE_CHANGED_NEW_AREA ─────────────────────────────────────────────────
BAG.Events:Register("ZONE_CHANGED_NEW_AREA", function(self, event)
    local zone = BAG.ZoneDetect:GetCurrentZone()
    BAG:Debug("Zone changed: " .. tostring(zone))
    BAG.Engine:Evaluate()
end)

-- ── QUEST_LOG_UPDATE (for objective tracking) ─────────────────────────────
BAG.Events:Register("QUEST_LOG_UPDATE", function(self, event)
    BAG.Engine:Evaluate()
end)

-- ── BAG_UPDATE (for item collection tracking) ─────────────────────────────
BAG.Events:Register("BAG_UPDATE", function(self, event, bagID)
    BAG.Engine:Evaluate()
end)
