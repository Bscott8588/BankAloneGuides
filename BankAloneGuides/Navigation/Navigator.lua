local BAG = BankAlone
BAG.Navigator = BAG.Navigator or {}

local Navigator = BAG.Navigator

function Navigator:Init()
    self.startingZoneByRace = {
        ["Human"] = "A-1-10-Elwynn",
        ["Dwarf"] = "A-1-10-DunMorogh",
        ["Gnome"] = "A-1-10-DunMorogh",
        ["Night Elf"] = "A-1-10-Teldrassil",
        ["Draenei"] = "A-1-10-Azuremyst",
        ["Orc"] = "H-1-10-Durotar",
        ["Troll"] = "H-1-10-Durotar",
        ["Tauren"] = "H-1-10-Mulgore",
        ["Undead"] = "H-1-10-Tirisfal",
        ["Blood Elf"] = "H-1-10-Eversong",
    }
end

local function levelInRange(level, range)
    if not range or not level then
        return false
    end
    return level >= range[1] and level <= range[2]
end

function Navigator:ScoreGuide(guide, level, zone)
    local score = 0
    if levelInRange(level, guide.levelRange) then
        score = score + 50
    else
        local distance = math.min(math.abs(level - guide.levelRange[1]), math.abs(level - guide.levelRange[2]))
        score = score - distance
    end
    if zone and guide.zones then
        for _, guideZone in ipairs(guide.zones) do
            if guideZone == zone then
                score = score + 35
                break
            end
        end
    end
    if guide.startZone and zone == guide.startZone then
        score = score + 20
    end
    if guide.isOutland and BAG.ZoneDetection:IsOutland(zone) then
        score = score + 15
    end
    return score
end

function Navigator:PickGuide(level, zone, faction, race)
    if level < 10 then
        local startId = self.startingZoneByRace[race]
        if startId and BAG.Guides.byId[startId] then
            return BAG.Guides.byId[startId]
        end
    end

    local bestGuide = nil
    local bestScore = -9999
    for _, guide in ipairs(BAG.Guides.list) do
        if guide.category == "Leveling" and (guide.faction == "Both" or guide.faction == faction) then
            local score = self:ScoreGuide(guide, level, zone)
            if score > bestScore then
                bestScore = score
                bestGuide = guide
            end
        end
    end
    return bestGuide
end

function Navigator:SmartStart()
    local char = BAG.SavedVars:GetCharacter()
    if char.currentGuideId and BAG.Guides.byId[char.currentGuideId] then
        BAG.Engine:LoadGuide(BAG.Guides.byId[char.currentGuideId])
        return
    end
    local level = BAG.API.PlayerAPI:GetLevel()
    local zone = BAG.ZoneDetection:GetZoneName()
    local faction = BAG.API.PlayerAPI:GetFaction()
    local race = BAG.API.PlayerAPI:GetRace()
    local guide = self:PickGuide(level, zone, faction, race)
    if guide then
        BAG.Engine:LoadGuide(guide)
    else
        BAG:Print("No matching guide found for your current level.")
    end
end

function Navigator:OnEvent(event)
    if event == "ZONE_CHANGED_NEW_AREA" then
        local zone = BAG.ZoneDetection:GetZoneName()
        BAG.SavedVars:SetLastZone(zone)
    elseif event == "PLAYER_LEVEL_UP" then
        BAG.Engine:Evaluate()
    end
end

