local BAG = BankAlone
BAG.Navigation.QuestTracking = BAG.Navigation.QuestTracking or {}

local QuestTracking = BAG.Navigation.QuestTracking

function QuestTracking:IsActive(questId)
    return BAG.API.QuestAPI:IsActive(questId)
end

function QuestTracking:IsComplete(questId)
    return BAG.API.QuestAPI:IsCompleted(questId)
end

function QuestTracking:GetObjectiveInfo(questId, objectiveIndex)
    return BAG.API.QuestAPI:GetObjectiveInfo(questId, objectiveIndex)
end

