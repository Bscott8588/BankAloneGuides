local BAG = BankAlone
BAG.API.Player = BAG.API.Player or {}
local Player = BAG.API.Player

function Player:GetLevel()
  return UnitLevel("player") or 1
end

function Player:GetClass()
  local _, classFile = UnitClass("player")
  return classFile or "UNKNOWN"
end

function Player:GetRace()
  local _, raceFile = UnitRace("player")
  return raceFile or "UNKNOWN"
end

function Player:GetFaction()
  return UnitFactionGroup("player") or "Neutral"
end

function Player:GetMoney()
  return GetMoney() or 0
end

function Player:GetProfessionSkill(professionName)
  if not professionName then
    return 0
  end
  local profs = { GetProfessions() }
  for _, profIndex in ipairs(profs) do
    if profIndex then
      local name, _, skillLevel = GetProfessionInfo(profIndex)
      if name == professionName then
        return skillLevel or 0
      end
    end
  end
  return 0
end
