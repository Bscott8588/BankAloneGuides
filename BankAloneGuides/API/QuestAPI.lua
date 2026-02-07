local BAG = BankAlone
BAG.API.Quest = BAG.API.Quest or {}
local Quest = BAG.API.Quest

function Quest:IsQuestActive(questId)
  if not questId then
    return false
  end
  if C_QuestLog and C_QuestLog.IsOnQuest then
    return C_QuestLog.IsOnQuest(questId)
  end
  local numEntries = GetNumQuestLogEntries()
  for i = 1, numEntries do
    local _, _, _, _, _, _, _, id = GetQuestLogTitle(i)
    if id == questId then
      return true
    end
  end
  return false
end

function Quest:IsQuestComplete(questId)
  if not questId then
    return false
  end
  if C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted then
    return C_QuestLog.IsQuestFlaggedCompleted(questId)
  end
  return false
end

function Quest:GetObjectiveInfo(questId, objectiveIndex)
  if not questId then
    return nil
  end
  if GetQuestObjectiveInfo then
    local text, objectiveType, finished = GetQuestObjectiveInfo(questId, objectiveIndex, false)
    return text, objectiveType, finished
  end
  return nil
end
