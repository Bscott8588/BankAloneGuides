local BAG = BankAlone
BAG.API.Map = BAG.API.Map or {}
local Map = BAG.API.Map

function Map:GetZone()
  return GetRealZoneText() or ""
end

function Map:GetPlayerPosition()
  local zone = self:GetZone()
  if C_Map and C_Map.GetBestMapForUnit and C_Map.GetPlayerMapPosition then
    local mapId = C_Map.GetBestMapForUnit("player")
    if mapId then
      local position = C_Map.GetPlayerMapPosition(mapId, "player")
      if position then
        return zone, position.x * 100, position.y * 100
      end
    end
  end
  if GetPlayerMapPosition then
    local x, y = GetPlayerMapPosition("player")
    if x and y then
      return zone, x * 100, y * 100
    end
  end
  return zone, nil, nil
end

function Map:GetDistance(zone, x, y)
  local currentZone, px, py = self:GetPlayerPosition()
  if not px or not py or not zone or not x or not y then
    return nil
  end
  if currentZone ~= zone then
    return nil
  end
  local dx = px - x
  local dy = py - y
  return math.sqrt(dx * dx + dy * dy)
end

function Map:IsPlayerNear(zone, x, y, radius)
  local distance = self:GetDistance(zone, x, y)
  if not distance then
    return false
  end
  return distance <= (radius or 15)
end
