local BAG = BankAlone
BAG.API.QuestAPI = BAG.API.QuestAPI or {}

local QuestAPI = BAG.API.QuestAPI

function QuestAPI:IsActive(questId)
    if not questId then
        return false
    end
    if C_QuestLog and C_QuestLog.IsOnQuest then
        return C_QuestLog.IsOnQuest(questId)
    end
    local numEntries = GetNumQuestLogEntries()
    for index = 1, numEntries do
        local _, _, _, isHeader, _, _, _, questID = GetQuestLogTitle(index)
        if not isHeader and questID == questId then
            return true
        end
    end
    return false
end

function QuestAPI:IsCompleted(questId)
    if not questId then
        return false
    end
    if C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted then
        return C_QuestLog.IsQuestFlaggedCompleted(questId)
    end
    return IsQuestFlaggedCompleted(questId)
end

function QuestAPI:GetObjectiveInfo(questId, objectiveIndex)
    if not questId then
        return nil
    end
    local numEntries = GetNumQuestLogEntries()
    for index = 1, numEntries do
        local _, _, _, isHeader, _, _, _, questID = GetQuestLogTitle(index)
        if not isHeader and questID == questId then
            local text, objectiveType, finished = GetQuestLogLeaderBoard(objectiveIndex, index)
            return {
                text = text,
                objectiveType = objectiveType,
                finished = finished,
            }
        end
    end
    return nil
end

