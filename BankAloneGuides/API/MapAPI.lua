local BAG = BankAlone
BAG.API.MapAPI = BAG.API.MapAPI or {}

local MapAPI = BAG.API.MapAPI

function MapAPI:GetPlayerPosition()
    local zoneName = GetRealZoneText()
    local x, y
    if C_Map and C_Map.GetBestMapForUnit and C_Map.GetPlayerMapPosition then
        local mapId = C_Map.GetBestMapForUnit("player")
        if mapId then
            local position = C_Map.GetPlayerMapPosition(mapId, "player")
            if position then
                x = position.x * 100
                y = position.y * 100
            end
        end
    elseif GetPlayerMapPosition then
        local px, py = GetPlayerMapPosition("player")
        x = px and px * 100 or nil
        y = py and py * 100 or nil
    end
    return zoneName, x, y
end

function MapAPI:GetDistance(ax, ay, bx, by)
    if not ax or not ay or not bx or not by then
        return nil
    end
    local dx = ax - bx
    local dy = ay - by
    return math.sqrt(dx * dx + dy * dy)
end

