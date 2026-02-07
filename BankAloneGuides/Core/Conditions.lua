local BAG = BankAlone
local Conditions = BAG.Conditions

function Conditions:Check(step)
  return self:IsStepComplete(step)
end

function Conditions:CheckVisibility(step)
  if not step or not step.conditions then
    return true
  end
  return self:CheckConditions(step.conditions)
end

function Conditions:CheckConditions(conditions)
  if not conditions then
    return true
  end

  local player = BAG.API.Player
  local quest = BAG.API.Quest
  local inventory = BAG.API.Inventory
  local mapAPI = BAG.API.Map

  if conditions.level and player:GetLevel() < conditions.level then
    return false
  end
  if conditions.class and player:GetClass() ~= conditions.class then
    return false
  end
  if conditions.race and player:GetRace() ~= conditions.race then
    return false
  end
  if conditions.faction and player:GetFaction() ~= conditions.faction then
    return false
  end
  if conditions.zone and mapAPI:GetZone() ~= conditions.zone then
    return false
  end
  if conditions.questactive and not quest:IsQuestActive(conditions.questactive) then
    return false
  end
  if conditions.questcomplete and not quest:IsQuestComplete(conditions.questcomplete) then
    return false
  end
  if conditions.itemcount then
    local itemId = conditions.itemcount.id
    local count = conditions.itemcount.count or 1
    if inventory:CountItem(itemId) < count then
      return false
    end
  end
  if conditions.profession then
    local p = conditions.profession
    local name = p.name or p
    local minSkill = p.skill or 1
    if player:GetProfessionSkill(name) < minSkill then
      return false
    end
  end

  return true
end

function Conditions:CheckToken(token)
  if not token then
    return false
  end
  if token.type == "level" then
    return BAG.API.Player:GetLevel() >= (token.level or 1)
  end
  if token.type == "questactive" then
    return BAG.API.Quest:IsQuestActive(token.id)
  end
  if token.type == "questcomplete" then
    return BAG.API.Quest:IsQuestComplete(token.id)
  end
  if token.type == "itemcount" then
    return BAG.API.Inventory:CountItem(token.id) >= (token.count or 1)
  end
  if token.type == "zone" then
    return BAG.API.Map:GetZone() == token.zone
  end
  if token.type == "near" then
    return BAG.API.Map:IsPlayerNear(token.zone, token.x, token.y, token.radius or 15)
  end
  return false
end

function Conditions:IsStepComplete(step)
  if not step then
    return false
  end
  if step.complete then
    return self:CheckToken(step.complete)
  end

  local stepType = step.type
  if stepType == "accept" and step.questId then
    return BAG.API.Quest:IsQuestActive(step.questId)
  elseif stepType == "turnin" and step.questId then
    return BAG.API.Quest:IsQuestComplete(step.questId)
  elseif stepType == "collect" and step.itemId then
    return BAG.API.Inventory:CountItem(step.itemId) >= (step.count or 1)
  elseif stepType == "kill" and step.questId then
    return BAG.API.Quest:IsQuestComplete(step.questId)
  elseif stepType == "travel" and step.zone and step.x and step.y then
    return BAG.API.Map:IsPlayerNear(step.zone, step.x, step.y, step.radius or 20)
  elseif stepType == "note" then
    return false
  end

  return false
end
