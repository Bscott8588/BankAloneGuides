local BAG = BankAlone
BAG.ZoneDetection = BAG.ZoneDetection or {}

local ZoneDetection = BAG.ZoneDetection

ZoneDetection.outlandZones = {
    ["Hellfire Peninsula"] = true,
    ["Zangarmarsh"] = true,
    ["Terokkar Forest"] = true,
    ["Nagrand"] = true,
    ["Blade's Edge Mountains"] = true,
    ["Netherstorm"] = true,
    ["Shadowmoon Valley"] = true,
    ["Shattrath City"] = true,
}

function ZoneDetection:GetZoneName()
    return GetRealZoneText() or "Unknown"
end

function ZoneDetection:GetSubZone()
    return GetSubZoneText() or ""
end

function ZoneDetection:IsOutland(zoneName)
    return self.outlandZones[zoneName] or false
end

function ZoneDetection:IsInOutland()
    local zone = self:GetZoneName()
    return self:IsOutland(zone)
end

