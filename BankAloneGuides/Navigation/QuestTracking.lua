--[[
    Bank Alone Guides - Quest Tracking
    SCS / Bank Alone Guides
    
    Tracks quest states, completed quests, and objective progress.
]]

local BAG = BankAlone

BAG.QuestTrack = BAG.QuestTrack or {}
local QT = BAG.QuestTrack

-- Quests turned in during this session
QT._turnedIn = {}

-- Record a quest as turned in
function QT:OnQuestTurnedIn(questID)
    if questID then
        self._turnedIn[questID] = true
        BAG:Debug("Quest tracked as turned in:", questID)
    end
end

-- Check if a quest was turned in this session
function QT:WasTurnedIn(questID)
    return self._turnedIn[questID] or false
end

-- Get all active quests as a lookup table { [questID] = true }
function QT:GetActiveQuests()
    local active = {}
    local numEntries = GetNumQuestLogEntries() or 0
    for i = 1, numEntries do
        local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, qID
        if GetQuestLogTitle then
            title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, qID = GetQuestLogTitle(i)
        end
        if qID and not isHeader then
            active[qID] = {
                title = title,
                level = level,
                isComplete = isComplete,
                logIndex = i,
            }
        end
    end
    return active
end

-- Get quest objective progress text
function QT:GetObjectiveText(questID)
    local logIndex = BAG.API.Quest:GetLogIndex(questID)
    if not logIndex then return nil end

    local objectives = {}
    local numObj = GetNumQuestLeaderBoards(logIndex) or 0
    for i = 1, numObj do
        local text, objType, finished = GetQuestLogLeaderBoard(i, logIndex)
        if text then
            objectives[#objectives + 1] = {
                text = text,
                finished = finished,
            }
        end
    end
    return objectives
end

-- Get formatted quest progress for display
function QT:GetProgressString(questID)
    local objectives = self:GetObjectiveText(questID)
    if not objectives or #objectives == 0 then return nil end

    local parts = {}
    for _, obj in ipairs(objectives) do
        local color = obj.finished and "00FF00" or "FFCC00"
        parts[#parts + 1] = "|cFF" .. color .. obj.text .. "|r"
    end
    return table.concat(parts, "\n")
end

-- Check overall objective completion percentage
function QT:GetCompletionPercent(questID)
    local logIndex = BAG.API.Quest:GetLogIndex(questID)
    if not logIndex then return 0 end

    local numObj = GetNumQuestLeaderBoards(logIndex) or 0
    if numObj == 0 then return 0 end

    local done = 0
    for i = 1, numObj do
        local _, _, finished = GetQuestLogLeaderBoard(i, logIndex)
        if finished then
            done = done + 1
        end
    end

    return (done / numObj) * 100
end
