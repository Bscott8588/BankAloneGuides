local BAG = BankAlone
BAG.Navigation.Travel = BAG.Navigation.Travel or {}
local Travel = BAG.Navigation.Travel

function Travel:BuildInstruction(step)
  if not step then
    return ""
  end
  if step.type == "hs" then
    return "Hearthstone to your set inn."
  elseif step.type == "fly" then
    return "Fly to " .. (step.zone or "the next hub") .. "."
  elseif step.type == "fp" then
    return "Grab the flight path at this hub."
  elseif step.type == "boat" then
    return "Take the boat to the next continent."
  elseif step.type == "zeppelin" then
    return "Ride the zeppelin to the next hub."
  elseif step.type == "mount" then
    return "Mount up and ride toward the waypoint."
  elseif step.type == "run" then
    return "Travel on foot to the waypoint."
  end
  return ""
end
