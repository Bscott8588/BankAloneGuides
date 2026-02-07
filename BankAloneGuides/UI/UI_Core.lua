local BAG = BankAlone
local UI = BAG.UI

function UI:Initialize()
  if self.initialized then
    return
  end
  self.initialized = true

  if self.MainFrame and self.MainFrame.Create then
    self.mainFrame = self.MainFrame:Create()
  end
  if self.StepPanel and self.StepPanel.Initialize and self.mainFrame then
    self.StepPanel:Initialize(self.mainFrame)
  end
  if self.Buttons and self.Buttons.Initialize and self.mainFrame then
    self.Buttons:Initialize(self.mainFrame)
  end
  if self.Options and self.Options.Initialize and self.mainFrame then
    self.Options:Initialize(self.mainFrame)
  end
  if self.Navigation and self.Navigation.Initialize and self.mainFrame then
    self.Navigation:Initialize(self.mainFrame)
  end
end

function UI:Refresh()
  if self.StepPanel and self.StepPanel.Update then
    self.StepPanel:Update()
  end
  if self.Navigation and self.Navigation.Update then
    self.Navigation:Update()
  end
end

function UI:Toggle()
  if not self.mainFrame then
    return
  end
  if self.mainFrame:IsShown() then
    self.mainFrame:Hide()
  else
    self.mainFrame:Show()
  end
end
