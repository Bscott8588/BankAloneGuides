local BAG = BankAlone
BAG.Navigation.ZoneDetection = BAG.Navigation.ZoneDetection or {}
local ZoneDetection = BAG.Navigation.ZoneDetection

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

function ZoneDetection:GetZone()
  return BAG.API.Map:GetZone()
end

function ZoneDetection:IsOutland(zoneName)
  local zone = zoneName or self:GetZone()
  return self.outlandZones[zone] or false
end
