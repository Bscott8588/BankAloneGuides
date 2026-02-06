--[[
    Bank Alone Guides - Event System
    Handles WoW events and triggers guide updates
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Events = {}

-- Event frame
local eventFrame = CreateFrame("Frame")
BAG.Events.frame = eventFrame

-- Event handlers
BAG.Events.handlers = {}

-- Register an event
function BAG.Events:Register(event, handler)
    if not self.handlers[event] then
        self.handlers[event] = {}
        eventFrame:RegisterEvent(event)
    end
    table.insert(self.handlers[event], handler)
end

-- Unregister an event
function BAG.Events:Unregister(event, handler)
    if not self.handlers[event] then return end
    
    for i, h in ipairs(self.handlers[event]) do
        if h == handler then
            table.remove(self.handlers[event], i)
            break
        end
    end
    
    if #self.handlers[event] == 0 then
        eventFrame:UnregisterEvent(event)
        self.handlers[event] = nil
    end
end

-- Fire event handlers
function BAG.Events:Fire(event, ...)
    if not self.handlers[event] then return end
    
    for _, handler in ipairs(self.handlers[event]) do
        BAG.Utils:SafeCall(handler, event, ...)
    end
end

-- Main event dispatcher
eventFrame:SetScript("OnEvent", function(self, event, ...)
    BAG.Events:Fire(event, ...)
end)

-- Initialize event system
function BAG.Events:Initialize()
    -- Player level up
    self:Register("PLAYER_LEVEL_UP", function(event, newLevel)
        BAG:DebugPrint("Player leveled up to", newLevel)
        BAG.PlayerLevel = newLevel
        
        -- Check if we should switch guides
        if BAG.Engine.currentGuide then
            local guide = BAG.Engine.currentGuide
            if guide.levelRange then
                local min, max = guide.levelRange.min, guide.levelRange.max
                if newLevel > max then
                    -- Player outleveled this guide, try to find next one
                    BAG:Print("You've outleveled this guide. Finding next guide...")
                    BAG:SmartStart()
                end
            end
        end
        
        -- Update engine and UI
        BAG.Engine:Evaluate()
        BAG.UI:Update()
    end)
    
    -- Quest accepted
    self:Register("QUEST_ACCEPTED", function(event, questIndex, questID)
        BAG:DebugPrint("Quest accepted:", questID)
        
        -- Mark relevant steps as complete
        BAG.Engine:OnQuestAccepted(questID)
        BAG.Engine:Evaluate()
        BAG.UI:Update()
    end)
    
    -- Quest turned in
    self:Register("QUEST_TURNED_IN", function(event, questID)
        BAG:DebugPrint("Quest turned in:", questID)
        
        -- Mark relevant steps as complete
        BAG.Engine:OnQuestTurnedIn(questID)
        BAG.Engine:Evaluate()
        BAG.UI:Update()
    end)
    
    -- Quest removed (abandoned)
    self:Register("QUEST_REMOVED", function(event, questID)
        BAG:DebugPrint("Quest removed:", questID)
        
        -- Update engine
        BAG.Engine:Evaluate()
        BAG.UI:Update()
    end)
    
    -- Zone changed
    self:Register("ZONE_CHANGED_NEW_AREA", function(event)
        local newZone = GetZoneText()
        BAG:DebugPrint("Zone changed to:", newZone)
        BAG.PlayerZone = newZone
        
        -- Update engine
        BAG.Engine:Evaluate()
        BAG.UI:Update()
    end)
    
    -- Zone changed (including subzones)
    self:Register("ZONE_CHANGED", function(event)
        -- Update for subzone changes
        BAG.Engine:Evaluate()
        BAG.UI:Update()
    end)
    
    -- Quest log update
    self:Register("QUEST_LOG_UPDATE", function(event)
        -- Update quest tracking
        BAG.QuestTracking:Update()
        BAG.Engine:Evaluate()
        BAG.UI:Update()
    end)
    
    -- Unit quest log changed
    self:Register("UNIT_QUEST_LOG_CHANGED", function(event, unit)
        if unit == "player" then
            BAG.QuestTracking:Update()
            BAG.Engine:Evaluate()
            BAG.UI:Update()
        end
    end)
    
    -- Player entering world (includes reloads and zone changes)
    self:Register("PLAYER_ENTERING_WORLD", function(event)
        BAG:DebugPrint("Player entering world")
        
        -- Update player info
        BAG.PlayerLevel = BAG.PlayerAPI:GetLevel()
        BAG.PlayerZone = BAG.ZoneDetection:GetCurrentZone()
        
        -- Evaluate current state
        BAG.Engine:Evaluate()
        BAG.UI:Update()
    end)
    
    -- Bag update (for item collection steps)
    self:Register("BAG_UPDATE", function(event, bagID)
        -- Check if current step involves items
        if BAG.Engine.currentStep then
            local step = BAG.Engine.currentStep
            if step.type == "collect" or step.type == "use" or step.type == "equip" then
                BAG.Engine:Evaluate()
                BAG.UI:Update()
            end
        end
    end)
    
    -- Trainer show (for training steps)
    self:Register("TRAINER_SHOW", function(event)
        BAG:DebugPrint("Trainer window opened")
        
        if BAG.Engine.currentStep and BAG.Engine.currentStep.type == "train" then
            BAG.Engine:Evaluate()
            BAG.UI:Update()
        end
    end)
    
    -- Merchant show (for vendor steps)
    self:Register("MERCHANT_SHOW", function(event)
        BAG:DebugPrint("Merchant window opened")
        
        if BAG.Engine.currentStep and BAG.Engine.currentStep.type == "vendor" then
            BAG.Engine:Evaluate()
            BAG.UI:Update()
        end
    end)
    
    -- Player money update (for gold tracking)
    self:Register("PLAYER_MONEY", function(event)
        BAG.Engine:Evaluate()
        BAG.UI:Update()
    end)
    
    -- Skill learned (for profession steps)
    self:Register("SKILL_LINES_CHANGED", function(event)
        BAG:DebugPrint("Skill lines changed")
        
        BAG.Engine:Evaluate()
        BAG.UI:Update()
    end)
    
    -- Chat message (for checking specific triggers)
    self:Register("CHAT_MSG_SYSTEM", function(event, message)
        -- Check for quest completion messages, etc.
        if message:find("Quest accepted:") or message:find("Quest complete") then
            BAG.Engine:Evaluate()
            BAG.UI:Update()
        end
    end)
    
    BAG:DebugPrint("Event system initialized")
end

-- Clean up event system
function BAG.Events:Shutdown()
    eventFrame:UnregisterAllEvents()
    self.handlers = {}
end
