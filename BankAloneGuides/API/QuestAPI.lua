-------------------------------------------------------------------------------
-- Bank Alone Guides — API / QuestAPI
-- Wrappers around WoW quest functions
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.QuestAPI = BAG.QuestAPI or {}

--- Check if a quest is currently in the player's quest log (active).
-- @param questID  The numeric quest ID.
-- @return boolean
function BAG.QuestAPI:IsQuestActive(questID)
    if not questID then return false end
    -- TBC Classic: iterate quest log
    local numEntries = GetNumQuestLogEntries and GetNumQuestLogEntries() or 0
    for i = 1, numEntries do
        local title, level, suggestedGroup, isHeader, isCollapsed, isComplete,
              frequency, qID = GetQuestLogTitle(i)
        if qID == questID then
            return true
        end
    end
    return false
end

--- Check if a quest has been completed (turned in previously).
-- Uses C_QuestLog.IsQuestFlaggedCompleted if available, falls back to scanning.
-- @param questID  The numeric quest ID.
-- @return boolean
function BAG.QuestAPI:IsQuestComplete(questID)
    if not questID then return false end

    if C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted then
        return C_QuestLog.IsQuestFlaggedCompleted(questID)
    end

    -- Fallback: check if the quest is in the log and marked complete
    if IsQuestComplete and IsQuestComplete() then
        -- This only works if the quest dialog is open; not reliable as a standalone check.
    end

    return false
end

--- Check if a quest's objectives are all fulfilled (but not yet turned in).
-- @param questID  The numeric quest ID.
-- @return boolean
function BAG.QuestAPI:AreObjectivesComplete(questID)
    if not questID then return false end

    local numEntries = GetNumQuestLogEntries and GetNumQuestLogEntries() or 0
    for i = 1, numEntries do
        local title, level, suggestedGroup, isHeader, isCollapsed, isComplete,
              frequency, qID = GetQuestLogTitle(i)
        if qID == questID then
            return isComplete == 1 or isComplete == true
        end
    end
    return false
end

--- Get objective info for a quest in the log.
-- @param questID  The numeric quest ID.
-- @return table of { text, numRequired, numFulfilled, finished }
function BAG.QuestAPI:GetObjectives(questID)
    if not questID then return {} end

    local objectives = {}
    local numEntries = GetNumQuestLogEntries and GetNumQuestLogEntries() or 0

    for i = 1, numEntries do
        local _, _, _, isHeader, _, _, _, qID = GetQuestLogTitle(i)
        if qID == questID then
            SelectQuestLogEntry(i)
            local numObjectives = GetNumQuestLeaderBoards(i) or 0
            for j = 1, numObjectives do
                local text, objType, finished = GetQuestLogLeaderBoard(j, i)
                objectives[#objectives + 1] = {
                    text = text or "",
                    type = objType or "",
                    finished = finished or false,
                }
            end
            break
        end
    end
    return objectives
end

--- Get the number of quests in the log.
-- @return number
function BAG.QuestAPI:GetNumQuests()
    if GetNumQuestLogEntries then
        local numEntries, numQuests = GetNumQuestLogEntries()
        return numQuests or numEntries or 0
    end
    return 0
end
