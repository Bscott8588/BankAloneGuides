--[[
    Bank Alone Guides - Quest API
    Wraps WoW quest-related functions
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.QuestAPI = {}

-- Quest cache to improve performance
local questCache = {}
local cacheTime = 0
local CACHE_DURATION = 1 -- Refresh cache every 1 second

-- Update quest cache
local function UpdateQuestCache()
    local now = GetTime()
    if now - cacheTime < CACHE_DURATION then
        return -- Cache is still fresh
    end
    
    questCache = {}
    
    local numQuests = GetNumQuestLogEntries()
    for i = 1, numQuests do
        local questTitle, level, questTag, isHeader, _, isComplete, _, questID = GetQuestLogTitle(i)
        
        if not isHeader and questID then
            questCache[questID] = {
                title = questTitle,
                level = level,
                tag = questTag,
                isComplete = isComplete,
                logIndex = i,
            }
        end
    end
    
    cacheTime = now
end

-- Check if a quest is in the log (active)
function BAG.QuestAPI:IsQuestActive(questID)
    if not questID then return false end
    
    UpdateQuestCache()
    return questCache[questID] ~= nil
end

-- Check if a quest is complete (ready to turn in)
function BAG.QuestAPI:IsQuestComplete(questID)
    if not questID then return false end
    
    UpdateQuestCache()
    local quest = questCache[questID]
    
    if not quest then return false end
    
    return quest.isComplete == 1 or quest.isComplete == true
end

-- Check if a quest is finished (turned in)
function BAG.QuestAPI:IsQuestFinished(questID)
    if not questID then return false end
    
    -- In TBC, we can use IsQuestFlaggedCompleted
    if IsQuestFlaggedCompleted then
        return IsQuestFlaggedCompleted(questID)
    end
    
    -- Fallback: check if quest is not in log and not available
    return not self:IsQuestActive(questID)
end

-- Get quest info by ID
function BAG.QuestAPI:GetQuestInfo(questID)
    if not questID then return nil end
    
    UpdateQuestCache()
    return questCache[questID]
end

-- Get quest log index by ID
function BAG.QuestAPI:GetQuestLogIndex(questID)
    if not questID then return nil end
    
    UpdateQuestCache()
    local quest = questCache[questID]
    return quest and quest.logIndex or nil
end

-- Get quest objectives
function BAG.QuestAPI:GetQuestObjectives(questID)
    local logIndex = self:GetQuestLogIndex(questID)
    if not logIndex then return {} end
    
    SelectQuestLogEntry(logIndex)
    
    local objectives = {}
    local numObjectives = GetNumQuestLeaderBoards(logIndex)
    
    for i = 1, numObjectives do
        local text, objectiveType, isComplete = GetQuestLogLeaderBoard(i, logIndex)
        table.insert(objectives, {
            text = text,
            type = objectiveType,
            isComplete = isComplete,
            index = i,
        })
    end
    
    return objectives
end

-- Check if a specific quest objective is complete
function BAG.QuestAPI:IsQuestObjectiveComplete(questID, objectiveIndex)
    local objectives = self:GetQuestObjectives(questID)
    
    if objectiveIndex and objectives[objectiveIndex] then
        return objectives[objectiveIndex].isComplete
    end
    
    -- If no specific index, check if all objectives are complete
    for _, obj in ipairs(objectives) do
        if not obj.isComplete then
            return false
        end
    end
    
    return #objectives > 0
end

-- Get number of quests in log
function BAG.QuestAPI:GetNumQuests()
    local numQuests, numCompleted = GetNumQuestLogEntries()
    return numQuests - numCompleted, numCompleted
end

-- Get quest level
function BAG.QuestAPI:GetQuestLevel(questID)
    local info = self:GetQuestInfo(questID)
    return info and info.level or nil
end

-- Get quest title
function BAG.QuestAPI:GetQuestTitle(questID)
    local info = self:GetQuestInfo(questID)
    return info and info.title or "Unknown Quest"
end

-- Check if quest log is full
function BAG.QuestAPI:IsQuestLogFull()
    local numQuests = GetNumQuestLogEntries()
    return numQuests >= 25 -- TBC quest log limit
end

-- Abandon a quest
function BAG.QuestAPI:AbandonQuest(questID)
    local logIndex = self:GetQuestLogIndex(questID)
    if not logIndex then return false end
    
    SelectQuestLogEntry(logIndex)
    SetAbandonQuest()
    AbandonQuest()
    
    BAG:Print("Abandoned quest:", self:GetQuestTitle(questID))
    
    return true
end

-- Share a quest
function BAG.QuestAPI:ShareQuest(questID)
    local logIndex = self:GetQuestLogIndex(questID)
    if not logIndex then return false end
    
    SelectQuestLogEntry(logIndex)
    QuestLogPushQuest()
    
    return true
end

-- Get quest link
function BAG.QuestAPI:GetQuestLink(questID)
    local logIndex = self:GetQuestLogIndex(questID)
    if not logIndex then return nil end
    
    return GetQuestLink(logIndex)
end

-- Watch/unwatch a quest
function BAG.QuestAPI:WatchQuest(questID, watch)
    local logIndex = self:GetQuestLogIndex(questID)
    if not logIndex then return false end
    
    if watch then
        AddQuestWatch(logIndex)
    else
        RemoveQuestWatch(logIndex)
    end
    
    return true
end

-- Check if a quest is watched
function BAG.QuestAPI:IsQuestWatched(questID)
    local logIndex = self:GetQuestLogIndex(questID)
    if not logIndex then return false end
    
    return IsQuestWatched(logIndex)
end

-- Get quest description
function BAG.QuestAPI:GetQuestDescription(questID)
    local logIndex = self:GetQuestLogIndex(questID)
    if not logIndex then return "" end
    
    SelectQuestLogEntry(logIndex)
    local questDescription = GetQuestLogQuestText()
    
    return questDescription or ""
end

-- Get quest rewards
function BAG.QuestAPI:GetQuestRewards(questID)
    local logIndex = self:GetQuestLogIndex(questID)
    if not logIndex then return {} end
    
    SelectQuestLogEntry(logIndex)
    
    local rewards = {
        money = GetQuestLogRewardMoney(),
        xp = GetQuestLogRewardXP(),
        items = {},
        choices = {},
    }
    
    -- Fixed rewards
    local numRewards = GetNumQuestLogRewards()
    for i = 1, numRewards do
        local name, texture, count, quality = GetQuestLogRewardInfo(i)
        table.insert(rewards.items, {
            name = name,
            texture = texture,
            count = count,
            quality = quality,
        })
    end
    
    -- Choice rewards
    local numChoices = GetNumQuestLogChoices()
    for i = 1, numChoices do
        local name, texture, count, quality = GetQuestLogChoiceInfo(i)
        table.insert(rewards.choices, {
            name = name,
            texture = texture,
            count = count,
            quality = quality,
        })
    end
    
    return rewards
end

-- Clear quest cache (force refresh)
function BAG.QuestAPI:ClearCache()
    questCache = {}
    cacheTime = 0
end

-- Get all active quests
function BAG.QuestAPI:GetAllActiveQuests()
    UpdateQuestCache()
    
    local quests = {}
    for questID, info in pairs(questCache) do
        table.insert(quests, {
            questID = questID,
            title = info.title,
            level = info.level,
            isComplete = info.isComplete,
        })
    end
    
    return quests
end

-- Get completed quests ready to turn in
function BAG.QuestAPI:GetCompletedQuests()
    UpdateQuestCache()
    
    local quests = {}
    for questID, info in pairs(questCache) do
        if info.isComplete then
            table.insert(quests, {
                questID = questID,
                title = info.title,
                level = info.level,
            })
        end
    end
    
    return quests
end
