local BAG = BankAlone
BAG.Navigation.Travel = BAG.Navigation.Travel or {}

local Travel = BAG.Navigation.Travel

function Travel:Describe(element)
    if not element then
        return ""
    end
    if element.type == "goto" then
        local coords = BAG.Utils:FormatCoords(element.x, element.y)
        return "Travel to " .. element.zone .. " (" .. coords .. ")."
    elseif element.type == "hs" then
        return "Use your Hearthstone to return home."
    elseif element.type == "fly" then
        return "Fly to " .. element.zone .. "."
    elseif element.type == "fp" then
        return "Grab the flight path."
    elseif element.type == "boat" then
        return "Take the boat to the next destination."
    elseif element.type == "zeppelin" then
        return "Ride the zeppelin to the next hub."
    elseif element.type == "run" then
        return "Run to the next waypoint."
    elseif element.type == "mount" then
        return "Mount up for faster travel."
    end
    return ""
end

