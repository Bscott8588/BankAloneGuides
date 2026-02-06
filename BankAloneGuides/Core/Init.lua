BankAlone = BankAlone or {}
local BAG = BankAlone

BAG.addonName = "BankAloneGuides"
BAG.version = "1.0"

BAG.API = BAG.API or {}
BAG.Data = BAG.Data or {}
BAG.Branding = BAG.Branding or {}
BAG.UI = BAG.UI or {}
BAG.Navigation = BAG.Navigation or {}
BAG.Guides = BAG.Guides or { list = {}, byId = {} }

function BAG:Print(message)
    if DEFAULT_CHAT_FRAME and message then
        DEFAULT_CHAT_FRAME:AddMessage("|cff3fd0ffBank Alone Guides|r: " .. message)
    end
end

function BAG:Initialize()
    if self.initialized then
        return
    end
    self.initialized = true

    BAG.SavedVars:Init()
    BAG.Engine:Init()
    if BAG.UI and BAG.UI.Init then
        BAG.UI:Init()
    end
    if BAG.Navigator and BAG.Navigator.Init then
        BAG.Navigator:Init()
    end
    if BAG.Navigator and BAG.Navigator.SmartStart then
        BAG.Navigator:SmartStart()
    end
end

if BAG.Events and BAG.Events.Init then
    BAG.Events:Init()
end

