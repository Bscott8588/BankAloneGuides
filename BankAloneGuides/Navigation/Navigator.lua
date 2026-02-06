local BAG = BankAlone
local Navigator = BAG.Navigator

function Navigator:Initialize()
  self.guides = BAG.Guides
end

function Navigator:SmartStart()
  local player = BAG.API.Player
  local faction = player:GetFaction()
  local race = player:GetRace()
  local level = player:GetLevel()
  local zone = BAG.Navigation.ZoneDetection:GetZone()

  local savedGuideId, savedStep = BAG.SavedVars:GetGuideState()
  local savedGuide = savedGuideId and BAG.Guides:GetGuideById(savedGuideId)

  if savedGuide and self:IsGuideValidForPlayer(savedGuide, faction, level, race) then
    BAG.Engine:LoadGuide(savedGuide, savedStep)
    return
  end

  local guide = self:FindBestGuide(faction, level, race, zone)
  if guide then
    local stepIndex = self:FindStepForZone(guide, zone)
    BAG.Engine:LoadGuide(guide, stepIndex)
  end
end

function Navigator:IsGuideValidForPlayer(guide, faction, level, race)
  if guide.faction ~= "Both" and guide.faction ~= faction then
    return false
  end
  if level < guide.levelRange[1] or level > guide.levelRange[2] then
    return false
  end
  if guide.races then
    local ok = false
    for _, r in ipairs(guide.races) do
      if r == race then
        ok = true
      end
    end
    if not ok then
      return false
    end
  end
  return true
end

function Navigator:FindBestGuide(faction, level, race, zone)
  local guides = BAG.Guides.DB
  if not guides then
    return nil
  end

  if level < 10 then
    for _, guide in ipairs(guides) do
      if guide.levelRange[1] == 1 and guide.levelRange[2] == 10 then
        if guide.faction == "Both" or guide.faction == faction then
          if guide.races then
            for _, r in ipairs(guide.races) do
              if r == race then
                return guide
              end
            end
          end
        end
      end
    end
  end

  local bestGuide = nil
  local bestScore = -1
  local isOutland = BAG.Navigation.ZoneDetection:IsOutland(zone)

  for _, guide in ipairs(guides) do
    if guide.faction == "Both" or guide.faction == faction then
      if level >= guide.levelRange[1] and level <= guide.levelRange[2] then
        if isOutland and guide.levelRange[2] < 58 then
          -- skip old world guides when already in Outland
        else
          local score = 0
          if guide.races then
            for _, r in ipairs(guide.races) do
              if r == race then
                score = score + 2
              end
            end
          end
          if guide.zoneHints then
            for _, z in ipairs(guide.zoneHints) do
              if z == zone then
                score = score + 3
              end
            end
          end
          if isOutland and guide.levelRange[1] >= 58 then
            score = score + 2
          end
          if score > bestScore then
            bestScore = score
            bestGuide = guide
          end
        end
      end
    end
  end

  return bestGuide
end

function Navigator:FindStepForZone(guide, zone)
  if not guide or not guide.steps or not zone then
    return nil
  end
  for i, step in ipairs(guide.steps) do
    if step.zone == zone then
      return i
    end
  end
  return nil
end

function Navigator:MaybeSwitchGuide()
  if not BAG.Engine.currentGuide then
    self:SmartStart()
    return
  end
  local guide = BAG.Engine.currentGuide
  local level = BAG.API.Player:GetLevel()
  if level < guide.levelRange[1] or level > guide.levelRange[2] then
    self:SmartStart()
  end
end

function Navigator:HandleZoneChange()
  self:MaybeSwitchGuide()
end
