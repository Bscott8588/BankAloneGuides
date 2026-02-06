--[[
    Bank Alone Guides - Quest API Wrapper
    SCS / Bank Alone Guides
    
    Wraps WoW quest functions for use by the engine and conditions.
]]

local BAG = BankAlone

BAG.API = BAG.API or {}
BAG.API.Quest = BAG.API.Quest or {}
local QuestAPI = BAG.API.Quest

-- Check if a quest is currently in the player's quest log
function QuestAPI:IsActive(questID)
    if not questID then return false end

    -- TBC Classic uses GetQuestLogIndexByID or manual iteration
    local numEntries = GetNumQuestLogEntries() or 0
    for i = 1, numEntries do
        local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, qID
        -- TBC Classic API
        if GetQuestLogTitle then
            title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, qID = GetQuestLogTitle(i)
        end
        if qID and qID == questID then
            return true
        end
    end
    return false
end

-- Check if a quest is complete (all objectives done, ready to turn in)
function QuestAPI:IsComplete(questID)
    if not questID then return false end

    local numEntries = GetNumQuestLogEntries() or 0
    for i = 1, numEntries do
        local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, qID
        if GetQuestLogTitle then
            title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, qID = GetQuestLogTitle(i)
        end
        if qID and qID == questID then
            return isComplete == 1 or isComplete == true
        end
    end
    return false
end

-- Get the quest log index for a quest ID
function QuestAPI:GetLogIndex(questID)
    if not questID then return nil end

    local numEntries = GetNumQuestLogEntries() or 0
    for i = 1, numEntries do
        local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, qID
        if GetQuestLogTitle then
            title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, qID = GetQuestLogTitle(i)
        end
        if qID and qID == questID then
            return i
        end
    end
    return nil
end

-- Get quest objective info
function QuestAPI:GetObjectives(questID)
    local logIndex = self:GetLogIndex(questID)
    if not logIndex then return {} end

    local objectives = {}
    local numObjectives = GetNumQuestLeaderBoards(logIndex) or 0

    for i = 1, numObjectives do
        local text, objType, finished = GetQuestLogLeaderBoard(i, logIndex)
        objectives[#objectives + 1] = {
            text = text,
            type = objType,
            finished = finished,
        }
    end

    return objectives
end

-- Check if a specific quest has ever been completed (using query API if available)
function QuestAPI:IsQuestFlaggedComplete(questID)
    if not questID then return false end
    -- In TBC Classic, C_QuestLog may not have IsQuestFlaggedCompleted
    if C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted then
        return C_QuestLog.IsQuestFlaggedCompleted(questID)
    end
    -- Fallback: check with IsQuestComplete (global)
    if IsQuestComplete then
        return IsQuestComplete(questID)
    end
    return false
end

-- Get quest title by ID from the quest log
function QuestAPI:GetQuestTitle(questID)
    local logIndex = self:GetLogIndex(questID)
    if logIndex then
        local title = GetQuestLogTitle(logIndex)
        return title
    end
    -- Check our data table
    if BAG.Data and BAG.Data.Quests and BAG.Data.Quests[questID] then
        return BAG.Data.Quests[questID].name
    end
    return "Quest #" .. questID
end
