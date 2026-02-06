-------------------------------------------------------------------------------
-- Bank Alone Guides — Navigation / Quest Tracking
-- Track quest states and integrate with the engine
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.QuestTrack = BAG.QuestTrack or {}

-- Cache of known quest states
BAG.QuestTrack.cache = {}

--- Refresh the quest cache from the quest log.
function BAG.QuestTrack:RefreshCache()
    self.cache = {}
    local numEntries = GetNumQuestLogEntries and GetNumQuestLogEntries() or 0

    for i = 1, numEntries do
        local title, level, suggestedGroup, isHeader, isCollapsed, isComplete,
              frequency, questID = GetQuestLogTitle(i)
        if questID and not isHeader then
            self.cache[questID] = {
                title      = title,
                level      = level,
                isComplete = isComplete,
                logIndex   = i,
            }
        end
    end
end

--- Check if a quest is in the log.
-- @param questID  Numeric quest ID.
-- @return boolean
function BAG.QuestTrack:IsActive(questID)
    if not questID then return false end
    return self.cache[questID] ~= nil
end

--- Check if a quest's objectives are complete (ready to turn in).
-- @param questID  Numeric quest ID.
-- @return boolean
function BAG.QuestTrack:IsReadyToTurnIn(questID)
    if not questID then return false end
    local entry = self.cache[questID]
    if entry then
        return entry.isComplete == 1 or entry.isComplete == true
    end
    return false
end

--- Check if a quest has been turned in (completed in history).
-- @param questID  Numeric quest ID.
-- @return boolean
function BAG.QuestTrack:IsTurnedIn(questID)
    return BAG.QuestAPI:IsQuestComplete(questID)
end

--- Evaluate whether a step involving a quest should be marked complete.
-- @param step  A step table.
-- @return boolean
function BAG.QuestTrack:IsStepComplete(step)
    if not step then return false end

    if step.type == "accept" and step.questID then
        return self:IsActive(step.questID) or self:IsTurnedIn(step.questID)
    end

    if step.type == "turnin" and step.questID then
        return self:IsTurnedIn(step.questID)
    end

    return false
end

--- Get objective progress text for a quest.
-- @param questID  Numeric quest ID.
-- @return string  Formatted progress text, or "" if not available.
function BAG.QuestTrack:GetProgressText(questID)
    if not questID then return "" end
    local objectives = BAG.QuestAPI:GetObjectives(questID)
    if #objectives == 0 then return "" end

    local parts = {}
    for _, obj in ipairs(objectives) do
        local status = obj.finished and "|cff33dd33Done|r" or obj.text
        parts[#parts + 1] = status
    end
    return table.concat(parts, " | ")
end
