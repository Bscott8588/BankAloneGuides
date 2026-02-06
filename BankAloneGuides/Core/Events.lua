local BAG = BankAlone
BAG.Events = BAG.Events or {}

local Events = BAG.Events

function Events:Init()
    if self.frame then
        return
    end
    self.frame = CreateFrame("Frame")
    self.frame:SetScript("OnEvent", function(_, event, ...)
        self:OnEvent(event, ...)
    end)

    self.frame:RegisterEvent("PLAYER_LOGIN")
    self.frame:RegisterEvent("PLAYER_LEVEL_UP")
    self.frame:RegisterEvent("QUEST_ACCEPTED")
    self.frame:RegisterEvent("QUEST_TURNED_IN")
    self.frame:RegisterEvent("QUEST_REMOVED")
    self.frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
end

function Events:OnEvent(event, ...)
    if event == "PLAYER_LOGIN" then
        if BAG.Initialize then
            BAG:Initialize()
        end
        return
    end

    if BAG.Engine and BAG.Engine.OnEvent then
        BAG.Engine:OnEvent(event, ...)
    end
    if BAG.UI and BAG.UI.OnEvent then
        BAG.UI:OnEvent(event, ...)
    end
    if BAG.Navigator and BAG.Navigator.OnEvent then
        BAG.Navigator:OnEvent(event, ...)
    end
end

Events:Init()

