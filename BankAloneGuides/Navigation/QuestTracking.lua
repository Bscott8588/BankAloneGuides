--[[
    Bank Alone Guides - Quest Tracking
    Tracks quest progress and objectives
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.QuestTracking = {
    activeQuests = {},
    completedQuests = {},
    lastUpdate = 0,
    updateInterval = 2, -- Update every 2 seconds
}

-- Update quest tracking
function BAG.QuestTracking:Update()
    local now = GetTime()
    if now - self.lastUpdate < self.updateInterval then
        return
    end
    
    self:RefreshActiveQuests()
    self.lastUpdate = now
end

-- Refresh list of active quests
function BAG.QuestTracking:RefreshActiveQuests()
    self.activeQuests = {}
    
    local numQuests = GetNumQuestLogEntries()
    for i = 1, numQuests do
        local questTitle, level, questTag, isHeader, _, isComplete, _, questID = GetQuestLogTitle(i)
        
        if not isHeader and questID then
            self.activeQuests[questID] = {
                title = questTitle,
                level = level,
                tag = questTag,
                isComplete = isComplete,
                logIndex = i,
                objectives = self:GetQuestObjectives(i),
            }
        end
    end
end

-- Get quest objectives
function BAG.QuestTracking:GetQuestObjectives(logIndex)
    SelectQuestLogEntry(logIndex)
    
    local objectives = {}
    local numObjectives = GetNumQuestLeaderBoards(logIndex)
    
    for i = 1, numObjectives do
        local text, objectiveType, isComplete = GetQuestLogLeaderBoard(i, logIndex)
        if text then
            table.insert(objectives, {
                text = text,
                type = objectiveType,
                isComplete = isComplete,
                index = i,
            })
        end
    end
    
    return objectives
end

-- Check if a quest is being tracked
function BAG.QuestTracking:IsQuestTracked(questID)
    self:Update()
    return self.activeQuests[questID] ~= nil
end

-- Get quest progress
function BAG.QuestTracking:GetQuestProgress(questID)
    self:Update()
    
    local quest = self.activeQuests[questID]
    if not quest then
        return nil
    end
    
    local total = #quest.objectives
    local completed = 0
    
    for _, obj in ipairs(quest.objectives) do
        if obj.isComplete then
            completed = completed + 1
        end
    end
    
    return {
        questID = questID,
        title = quest.title,
        completed = completed,
        total = total,
        percent = total > 0 and (completed / total * 100) or 0,
        isComplete = quest.isComplete,
        objectives = quest.objectives,
    }
end

-- Check if a specific objective is complete
function BAG.QuestTracking:IsObjectiveComplete(questID, objectiveIndex)
    self:Update()
    
    local quest = self.activeQuests[questID]
    if not quest or not quest.objectives[objectiveIndex] then
        return false
    end
    
    return quest.objectives[objectiveIndex].isComplete
end

-- Get all active quests
function BAG.QuestTracking:GetActiveQuests()
    self:Update()
    return self.activeQuests
end

-- Get quests ready to turn in
function BAG.QuestTracking:GetCompletedQuests()
    self:Update()
    
    local completed = {}
    for questID, quest in pairs(self.activeQuests) do
        if quest.isComplete then
            completed[questID] = quest
        end
    end
    
    return completed
end

-- Get quests in progress (not complete)
function BAG.QuestTracking:GetInProgressQuests()
    self:Update()
    
    local inProgress = {}
    for questID, quest in pairs(self.activeQuests) do
        if not quest.isComplete then
            inProgress[questID] = quest
        end
    end
    
    return inProgress
end

-- Check if quest log is full
function BAG.QuestTracking:IsQuestLogFull()
    local numQuests = GetNumQuestLogEntries()
    return numQuests >= 25 -- TBC quest log limit
end

-- Get quest log capacity
function BAG.QuestTracking:GetQuestLogCapacity()
    local numQuests = GetNumQuestLogEntries()
    return numQuests, 25
end

-- Get quest by ID
function BAG.QuestTracking:GetQuest(questID)
    self:Update()
    return self.activeQuests[questID]
end

-- Watch a quest
function BAG.QuestTracking:WatchQuest(questID)
    local quest = self:GetQuest(questID)
    if quest then
        AddQuestWatch(quest.logIndex)
        return true
    end
    return false
end

-- Unwatch a quest
function BAG.QuestTracking:UnwatchQuest(questID)
    local quest = self:GetQuest(questID)
    if quest then
        RemoveQuestWatch(quest.logIndex)
        return true
    end
    return false
end

-- Check if a quest is watched
function BAG.QuestTracking:IsWatched(questID)
    local quest = self:GetQuest(questID)
    if quest then
        return IsQuestWatched(quest.logIndex)
    end
    return false
end

-- Get objective progress text
function BAG.QuestTracking:GetObjectiveText(questID, objectiveIndex)
    local quest = self:GetQuest(questID)
    if not quest or not quest.objectives[objectiveIndex] then
        return nil
    end
    
    return quest.objectives[objectiveIndex].text
end

-- Parse objective counts (e.g., "Wolves slain: 5/10")
function BAG.QuestTracking:ParseObjectiveCounts(objectiveText)
    if not objectiveText then return nil, nil end
    
    local current, total = objectiveText:match("(%d+)/(%d+)")
    if current and total then
        return tonumber(current), tonumber(total)
    end
    
    return nil, nil
end

-- Get detailed objective info with counts
function BAG.QuestTracking:GetDetailedObjectives(questID)
    local quest = self:GetQuest(questID)
    if not quest then return {} end
    
    local detailed = {}
    for i, obj in ipairs(quest.objectives) do
        local current, total = self:ParseObjectiveCounts(obj.text)
        table.insert(detailed, {
            index = i,
            text = obj.text,
            type = obj.type,
            isComplete = obj.isComplete,
            current = current,
            total = total,
            percent = (current and total and total > 0) and (current / total * 100) or 0,
        })
    end
    
    return detailed
end

-- Check if any guide-relevant quests are complete
function BAG.QuestTracking:HasCompletedQuestsForGuide(guide)
    local completed = self:GetCompletedQuests()
    
    if not guide or not guide.steps then
        return false
    end
    
    for _, step in ipairs(guide.steps) do
        if step.type == "turnin" and step.questID then
            if completed[step.questID] then
                return true
            end
        end
    end
    
    return false
end

-- Force immediate update
function BAG.QuestTracking:ForceUpdate()
    self.lastUpdate = 0
    self:Update()
end

-- Clear cached data
function BAG.QuestTracking:Clear()
    self.activeQuests = {}
    self.completedQuests = {}
    self.lastUpdate = 0
end
