--[[
    Bank Alone Guides - Quest API
    Wraps WoW quest functions for easier access
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Get quest log index by quest ID
function BAG.QuestAPI:GetQuestLogIndex(questID)
    if not questID then
        return nil
    end
    
    for i = 1, GetNumQuestLogEntries() do
        local _, _, _, _, _, _, _, id = GetQuestLogTitle(i)
        if id == questID then
            return i
        end
    end
    
    return nil
end

-- Check if quest is in quest log
function BAG.QuestAPI:IsQuestActive(questID)
    return self:GetQuestLogIndex(questID) ~= nil
end

-- Check if quest is complete (but not turned in)
function BAG.QuestAPI:IsQuestComplete(questID)
    local index = self:GetQuestLogIndex(questID)
    if not index then
        return false
    end
    
    local _, _, _, _, _, isComplete = GetQuestLogTitle(index)
    return isComplete == 1 or isComplete == true
end

-- Check if quest has been turned in (completed in the past)
-- Note: In TBC Classic, this requires checking quest completion history
function BAG.QuestAPI:IsQuestTurnedIn(questID)
    -- Check if quest is not in log but is completed
    -- In TBC, we don't have a direct API for this, so we track it ourselves
    if not self:IsQuestActive(questID) then
        -- Could check BAG.Data.Quests for prerequisite logic
        -- or maintain our own completion tracking
        return false
    end
    
    return false
end

-- Get quest title
function BAG.QuestAPI:GetQuestTitle(questID)
    local index = self:GetQuestLogIndex(questID)
    if not index then
        -- Try to get from our data tables
        if BAG.Data and BAG.Data.Quests and BAG.Data.Quests[questID] then
            return BAG.Data.Quests[questID].name
        end
        return "Unknown Quest"
    end
    
    local title = GetQuestLogTitle(index)
    return title or "Unknown Quest"
end

-- Get quest level
function BAG.QuestAPI:GetQuestLevel(questID)
    local index = self:GetQuestLogIndex(questID)
    if not index then
        -- Try to get from our data tables
        if BAG.Data and BAG.Data.Quests and BAG.Data.Quests[questID] then
            return BAG.Data.Quests[questID].level
        end
        return nil
    end
    
    local _, level = GetQuestLogTitle(index)
    return level
end

-- Get quest objectives
function BAG.QuestAPI:GetQuestObjectives(questID)
    local index = self:GetQuestLogIndex(questID)
    if not index then
        return {}
    end
    
    local objectives = {}
    local numObjectives = GetNumQuestLeaderBoards(index)
    
    for i = 1, numObjectives do
        local text, type, finished = GetQuestLogLeaderBoard(i, index)
        table.insert(objectives, {
            text = text,
            type = type,
            finished = finished,
            index = i
        })
    end
    
    return objectives
end

-- Check if specific objective is complete
function BAG.QuestAPI:IsObjectiveComplete(questID, objectiveIndex)
    local index = self:GetQuestLogIndex(questID)
    if not index then
        return false
    end
    
    local _, _, finished = GetQuestLogLeaderBoard(objectiveIndex, index)
    return finished == true or finished == 1
end

-- Get quest description
function BAG.QuestAPI:GetQuestDescription(questID)
    local index = self:GetQuestLogIndex(questID)
    if not index then
        -- Try to get from our data tables
        if BAG.Data and BAG.Data.Quests and BAG.Data.Quests[questID] then
            return BAG.Data.Quests[questID].description
        end
        return nil
    end
    
    SelectQuestLogEntry(index)
    local description = GetQuestLogQuestText()
    return description
end

-- Get number of quests in log
function BAG.QuestAPI:GetNumQuests()
    local numEntries, numQuests = GetNumQuestLogEntries()
    return numQuests or 0
end

-- Check if quest log is full
function BAG.QuestAPI:IsQuestLogFull()
    local numQuests = self:GetNumQuests()
    return numQuests >= 20  -- TBC Classic quest log limit
end

-- Get quest tag (e.g., "Elite", "Dungeon", "Raid", "PvP")
function BAG.QuestAPI:GetQuestTag(questID)
    local index = self:GetQuestLogIndex(questID)
    if not index then
        return nil
    end
    
    local _, _, _, _, _, _, _, _, _, _, _, _, _, tag = GetQuestLogTitle(index)
    return tag
end

-- Check if quest is elite
function BAG.QuestAPI:IsQuestElite(questID)
    local tag = self:GetQuestTag(questID)
    return tag == "Elite"
end

-- Check if quest is dungeon quest
function BAG.QuestAPI:IsQuestDungeon(questID)
    local tag = self:GetQuestTag(questID)
    return tag == "Dungeon"
end

-- Check if quest is raid quest
function BAG.QuestAPI:IsQuestRaid(questID)
    local tag = self:GetQuestTag(questID)
    return tag == "Raid"
end

-- Get quest rewards
function BAG.QuestAPI:GetQuestRewards(questID)
    local index = self:GetQuestLogIndex(questID)
    if not index then
        return nil
    end
    
    SelectQuestLogEntry(index)
    
    local rewards = {
        money = GetQuestLogRewardMoney(),
        xp = GetQuestLogRewardXP(),
        items = {},
        choices = {}
    }
    
    -- Get fixed rewards
    local numRewards = GetNumQuestLogRewards()
    for i = 1, numRewards do
        local name, texture, numItems, quality = GetQuestLogRewardInfo(i)
        table.insert(rewards.items, {
            name = name,
            texture = texture,
            count = numItems,
            quality = quality
        })
    end
    
    -- Get choice rewards
    local numChoices = GetNumQuestLogChoices()
    for i = 1, numChoices do
        local name, texture, numItems, quality = GetQuestLogChoiceInfo(i)
        table.insert(rewards.choices, {
            name = name,
            texture = texture,
            count = numItems,
            quality = quality
        })
    end
    
    return rewards
end

-- Abandon quest
function BAG.QuestAPI:AbandonQuest(questID)
    local index = self:GetQuestLogIndex(questID)
    if not index then
        return false
    end
    
    SelectQuestLogEntry(index)
    SetAbandonQuest()
    AbandonQuest()
    
    return true
end

-- Share quest
function BAG.QuestAPI:ShareQuest(questID)
    local index = self:GetQuestLogIndex(questID)
    if not index then
        return false
    end
    
    SelectQuestLogEntry(index)
    QuestLogPushQuest()
    
    return true
end

-- Track quest
function BAG.QuestAPI:TrackQuest(questID, track)
    local index = self:GetQuestLogIndex(questID)
    if not index then
        return false
    end
    
    if track == nil then
        track = true
    end
    
    if track then
        AddQuestWatch(index)
    else
        RemoveQuestWatch(index)
    end
    
    return true
end

-- Check if quest is tracked
function BAG.QuestAPI:IsQuestTracked(questID)
    local index = self:GetQuestLogIndex(questID)
    if not index then
        return false
    end
    
    return IsQuestWatched(index)
end

print("|cff00B3FF[Bank Alone Guides]|r Quest API loaded")
