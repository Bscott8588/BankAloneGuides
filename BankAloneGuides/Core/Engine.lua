local BAG = BankAlone
local Engine = BAG.Engine

Engine.currentGuide = nil
Engine.currentStepIndex = 1

function Engine:Initialize()
  self.currentGuide = nil
  self.currentStepIndex = 1
end

function Engine:LoadGuide(guide, stepIndex)
  if type(guide) == "string" then
    guide = BAG.Guides:GetGuideById(guide)
  end
  if not guide or not guide.steps then
    return
  end

  self.currentGuide = guide
  self.currentStepIndex = stepIndex or 1
  local nextIndex = self:FindNextAvailableStep(self.currentStepIndex)
  if nextIndex then
    self.currentStepIndex = nextIndex
  end

  if BAG.SavedVars and BAG.SavedVars.SaveGuideState then
    BAG.SavedVars:SaveGuideState(guide.id, self.currentStepIndex)
  end

  if BAG.UI and BAG.UI.Refresh then
    BAG.UI:Refresh()
  end
end

function Engine:GetCurrentStep()
  if not self.currentGuide then
    return nil
  end
  return self.currentGuide.steps[self.currentStepIndex]
end

function Engine:FindNextAvailableStep(startIndex)
  if not self.currentGuide then
    return nil
  end
  for i = startIndex, #self.currentGuide.steps do
    local step = self.currentGuide.steps[i]
    if BAG.Conditions:CheckVisibility(step) then
      return i
    end
  end
  return nil
end

function Engine:FindPreviousAvailableStep(startIndex)
  if not self.currentGuide then
    return nil
  end
  for i = startIndex, 1, -1 do
    local step = self.currentGuide.steps[i]
    if BAG.Conditions:CheckVisibility(step) then
      return i
    end
  end
  return nil
end

function Engine:NextStep()
  if not self.currentGuide then
    return
  end
  local nextIndex = self:FindNextAvailableStep(self.currentStepIndex + 1)
  if nextIndex then
    self.currentStepIndex = nextIndex
    BAG.SavedVars:SaveGuideState(self.currentGuide.id, self.currentStepIndex)
    BAG.UI:Refresh()
  end
end

function Engine:PreviousStep()
  if not self.currentGuide then
    return
  end
  local prevIndex = self:FindPreviousAvailableStep(self.currentStepIndex - 1)
  if prevIndex then
    self.currentStepIndex = prevIndex
    BAG.SavedVars:SaveGuideState(self.currentGuide.id, self.currentStepIndex)
    BAG.UI:Refresh()
  end
end

function Engine:GetUpcomingSteps(count)
  local steps = {}
  if not self.currentGuide then
    return steps
  end
  local idx = self.currentStepIndex
  local added = 0
  while idx <= #self.currentGuide.steps and added < count do
    local step = self.currentGuide.steps[idx]
    if BAG.Conditions:CheckVisibility(step) then
      table.insert(steps, step)
      added = added + 1
    end
    idx = idx + 1
  end
  return steps
end

function Engine:EvaluateCurrentStep()
  if not self.currentGuide then
    return
  end
  local step = self:GetCurrentStep()
  if step and BAG.Conditions:Check(step) then
    local nextIndex = self:FindNextAvailableStep(self.currentStepIndex + 1)
    if nextIndex then
      self.currentStepIndex = nextIndex
      BAG.SavedVars:SaveGuideState(self.currentGuide.id, self.currentStepIndex)
      BAG.UI:Refresh()
    end
  end
end
