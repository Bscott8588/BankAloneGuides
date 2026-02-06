local BAG = BankAlone
BAG.Navigation.QuestTracking = BAG.Navigation.QuestTracking or {}
local QuestTracking = BAG.Navigation.QuestTracking

function QuestTracking:IsQuestActive(questId)
  return BAG.API.Quest:IsQuestActive(questId)
end

function QuestTracking:IsQuestComplete(questId)
  return BAG.API.Quest:IsQuestComplete(questId)
end

function QuestTracking:Update()
  if BAG.Engine and BAG.Engine.EvaluateCurrentStep then
    BAG.Engine:EvaluateCurrentStep()
  end
end
