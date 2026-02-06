-- Bank Alone Guides - Core Init
BankAlone = _G.BankAlone or {}
local BAG = BankAlone
_G.BankAlone = BAG

BAG.Name = "Bank Alone Guides"
BAG.Version = "1.0"

-- Module namespaces
BAG.Engine = BAG.Engine or {}
BAG.Events = BAG.Events or {}
BAG.Conditions = BAG.Conditions or {}
BAG.SavedVars = BAG.SavedVars or {}
BAG.UI = BAG.UI or {}
BAG.Navigator = BAG.Navigator or {}
BAG.Guides = BAG.Guides or { DB = {} }
BAG.Data = BAG.Data or {}
BAG.API = BAG.API or {}
BAG.Branding = BAG.Branding or {}
BAG.Utils = BAG.Utils or {}
BAG.Navigation = BAG.Navigation or {}

function BAG:Initialize()
  if self.initialized then
    return
  end
  self.initialized = true

  if self.SavedVars and self.SavedVars.Initialize then
    self.SavedVars:Initialize()
  end
  if self.UI and self.UI.Initialize then
    self.UI:Initialize()
  end
  if self.Guides and self.Guides.Initialize then
    self.Guides:Initialize()
  end
  if self.Navigator and self.Navigator.Initialize then
    self.Navigator:Initialize()
  end
  if self.Engine and self.Engine.Initialize then
    self.Engine:Initialize()
  end
  if self.Events and self.Events.Initialize then
    self.Events:Initialize()
  end

  if self.Navigator and self.Navigator.SmartStart then
    self.Navigator:SmartStart()
  end
end
