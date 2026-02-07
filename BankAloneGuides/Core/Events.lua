local BAG = BankAlone
local Events = BAG.Events

Events.frame = Events.frame or CreateFrame("Frame")

Events.eventList = {
  "PLAYER_LOGIN",
  "PLAYER_LEVEL_UP",
  "QUEST_ACCEPTED",
  "QUEST_TURNED_IN",
  "QUEST_REMOVED",
  "ZONE_CHANGED_NEW_AREA",
}

function Events:Initialize()
  if self.initialized then
    return
  end
  self.initialized = true

  for _, eventName in ipairs(self.eventList) do
    self.frame:RegisterEvent(eventName)
  end
  self.frame:SetScript("OnEvent", function(_, eventName, ...)
    self:OnEvent(eventName, ...)
  end)
end

function Events:OnEvent(eventName)
  if eventName == "PLAYER_LOGIN" then
    BAG:Initialize()
  elseif eventName == "PLAYER_LEVEL_UP" then
    if BAG.Navigator and BAG.Navigator.MaybeSwitchGuide then
      BAG.Navigator:MaybeSwitchGuide()
    end
  elseif eventName == "ZONE_CHANGED_NEW_AREA" then
    if BAG.Navigator and BAG.Navigator.HandleZoneChange then
      BAG.Navigator:HandleZoneChange()
    end
  end

  if BAG.Engine and BAG.Engine.EvaluateCurrentStep then
    BAG.Engine:EvaluateCurrentStep()
  end
  if BAG.UI and BAG.UI.Refresh then
    BAG.UI:Refresh()
  end
end

Events:Initialize()
