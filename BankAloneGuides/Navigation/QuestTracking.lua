--[[
    Bank Alone Guides - Quest Tracking
    Enhanced quest tracking and objective monitoring
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Tracked quests
BAG.QuestTracking.trackedQuests = {}
BAG.QuestTracking.objectiveProgress = {}

-- Track a quest
function BAG.QuestTracking:TrackQuest(questID)
    if not questID then
        return false
    end
    
    -- Check if quest is active
    if not BAG.QuestAPI:IsQuestActive(questID) then
        return false
    end
    
    -- Add to WoW's quest watch
    local index = BAG.QuestAPI:GetQuestLogIndex(questID)
    if index then
        AddQuestWatch(index)
        self.trackedQuests[questID] = true
        return true
    end
    
    return false
end

-- Untrack a quest
function BAG.QuestTracking:UntrackQuest(questID)
    if not questID then
        return false
    end
    
    local index = BAG.QuestAPI:GetQuestLogIndex(questID)
    if index then
        RemoveQuestWatch(index)
        self.trackedQuests[questID] = nil
        return true
    end
    
    return false
end

-- Check if quest is tracked
function BAG.QuestTracking:IsQuestTracked(questID)
    return self.trackedQuests[questID] == true
end

-- Get quest objectives
function BAG.QuestTracking:GetObjectives(questID)
    if not questID then
        return {}
    end
    
    return BAG.QuestAPI:GetQuestObjectives(questID)
end

-- Get objective completion percentage
function BAG.QuestTracking:GetObjectiveProgress(questID)
    local objectives = self:GetObjectives(questID)
    if #objectives == 0 then
        return 0
    end
    
    local completed = 0
    for _, obj in ipairs(objectives) do
        if obj.finished then
            completed = completed + 1
        end
    end
    
    return math.floor((completed / #objectives) * 100)
end

-- Update objective progress
function BAG.QuestTracking:UpdateObjectiveProgress(questID)
    if not questID then
        return
    end
    
    local progress = self:GetObjectiveProgress(questID)
    self.objectiveProgress[questID] = progress
end

-- Get all tracked quests
function BAG.QuestTracking:GetTrackedQuests()
    local quests = {}
    
    for questID, _ in pairs(self.trackedQuests) do
        if BAG.QuestAPI:IsQuestActive(questID) then
            table.insert(quests, {
                id = questID,
                title = BAG.QuestAPI:GetQuestTitle(questID),
                level = BAG.QuestAPI:GetQuestLevel(questID),
                progress = self:GetObjectiveProgress(questID),
                objectives = self:GetObjectives(questID),
                isComplete = BAG.QuestAPI:IsQuestComplete(questID)
            })
        else
            -- Quest no longer active, untrack it
            self.trackedQuests[questID] = nil
        end
    end
    
    return quests
end

-- Auto-track guide quests
function BAG.QuestTracking:AutoTrackGuideQuests()
    if not BAG.Engine or not BAG.Engine.currentGuide then
        return
    end
    
    -- Get next few steps
    local steps = BAG.Engine:GetNextSteps(5)
    
    for _, stepData in ipairs(steps) do
        local step = stepData.step
        
        -- Track quest-related steps
        if step.questID and BAG.QuestAPI:IsQuestActive(step.questID) then
            if not self:IsQuestTracked(step.questID) then
                self:TrackQuest(step.questID)
            end
        end
    end
end

-- Untrack non-guide quests
function BAG.QuestTracking:UntrackNonGuideQuests()
    if not BAG.Engine or not BAG.Engine.currentGuide then
        return
    end
    
    -- Build set of guide quest IDs
    local guideQuestIDs = {}
    if BAG.Engine.steps then
        for _, step in ipairs(BAG.Engine.steps) do
            if step.questID then
                guideQuestIDs[step.questID] = true
            end
        end
    end
    
    -- Untrack quests not in guide
    for questID, _ in pairs(self.trackedQuests) do
        if not guideQuestIDs[questID] then
            self:UntrackQuest(questID)
        end
    end
end

-- Check if quest objectives are complete
function BAG.QuestTracking:AreObjectivesComplete(questID)
    local objectives = self:GetObjectives(questID)
    
    for _, obj in ipairs(objectives) do
        if not obj.finished then
            return false
        end
    end
    
    return #objectives > 0
end

-- Get nearest quest objective location
function BAG.QuestTracking:GetNearestObjectiveLocation(questID)
    -- This would require additional data about objective locations
    -- For now, return nil
    -- TODO: Implement objective location tracking
    return nil
end

-- Parse objective text to extract counts
function BAG.QuestTracking:ParseObjectiveText(objectiveText)
    if not objectiveText then
        return nil
    end
    
    -- Try to extract "X/Y" pattern
    local current, total = string.match(objectiveText, "(%d+)/(%d+)")
    
    if current and total then
        return {
            current = tonumber(current),
            total = tonumber(total),
            percent = math.floor((tonumber(current) / tonumber(total)) * 100)
        }
    end
    
    return nil
end

-- Get objective details
function BAG.QuestTracking:GetObjectiveDetails(questID, objectiveIndex)
    local objectives = self:GetObjectives(questID)
    
    if objectiveIndex > 0 and objectiveIndex <= #objectives then
        local obj = objectives[objectiveIndex]
        local counts = self:ParseObjectiveText(obj.text)
        
        return {
            text = obj.text,
            type = obj.type,
            finished = obj.finished,
            counts = counts
        }
    end
    
    return nil
end

-- Check if ready to turn in quest
function BAG.QuestTracking:IsReadyToTurnIn(questID)
    return BAG.QuestAPI:IsQuestComplete(questID)
end

-- Get quests ready to turn in
function BAG.QuestTracking:GetQuestsReadyToTurnIn()
    local quests = {}
    
    local numQuests = GetNumQuestLogEntries()
    for i = 1, numQuests do
        local title, _, _, _, _, isComplete, _, questID = GetQuestLogTitle(i)
        
        if isComplete and questID then
            table.insert(quests, {
                id = questID,
                title = title,
                index = i
            })
        end
    end
    
    return quests
end

-- Sync tracking with guide
function BAG.QuestTracking:SyncWithGuide()
    if not BAG.SavedVars:Get("navigation.autoTrack") then
        return
    end
    
    self:AutoTrackGuideQuests()
    self:UntrackNonGuideQuests()
end

-- Clear all tracked quests
function BAG.QuestTracking:ClearAll()
    for questID, _ in pairs(self.trackedQuests) do
        self:UntrackQuest(questID)
    end
    
    self.trackedQuests = {}
    self.objectiveProgress = {}
end

-- Get tracking summary
function BAG.QuestTracking:GetSummary()
    local tracked = self:GetTrackedQuests()
    local readyToTurnIn = {}
    local inProgress = {}
    
    for _, quest in ipairs(tracked) do
        if quest.isComplete then
            table.insert(readyToTurnIn, quest)
        else
            table.insert(inProgress, quest)
        end
    end
    
    return {
        total = #tracked,
        readyToTurnIn = readyToTurnIn,
        inProgress = inProgress
    }
end

print("|cff00B3FF[Bank Alone Guides]|r Quest Tracking loaded")
