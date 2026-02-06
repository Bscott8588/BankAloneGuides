local BAG = BankAlone
BAG.Engine = BAG.Engine or {}

local Engine = BAG.Engine

function Engine:Init()
    self.currentGuide = nil
    self.currentStepIndex = 1
end

function Engine:LoadGuide(guide)
    if not guide then
        return
    end
    self.currentGuide = guide
    local char = BAG.SavedVars:GetCharacter()
    local stepIndex = 1
    if char.currentGuideId == guide.id and char.currentStep then
        stepIndex = char.currentStep
    end
    self.currentStepIndex = BAG.Utils:Clamp(stepIndex, 1, #guide.steps)
    local validIndex = self:FindNextValidStep(self.currentStepIndex, 1)
    if validIndex then
        self.currentStepIndex = validIndex
    end
    BAG.SavedVars:SetCurrentGuide(guide.id)
    BAG.SavedVars:SetCurrentStep(self.currentStepIndex)
    self:RefreshUI()
end

function Engine:GetCurrentGuide()
    return self.currentGuide
end

function Engine:GetCurrentStep()
    if not self.currentGuide then
        return nil
    end
    return self.currentGuide.steps[self.currentStepIndex]
end

function Engine:FindNextValidStep(startIndex, direction)
    if not self.currentGuide then
        return nil
    end
    local idx = startIndex
    local steps = self.currentGuide.steps
    while idx >= 1 and idx <= #steps do
        local step = steps[idx]
        if BAG.Conditions:Check(step) then
            return idx
        end
        idx = idx + direction
    end
    return nil
end

function Engine:SetStep(index)
    if not self.currentGuide then
        return
    end
    local validIndex = self:FindNextValidStep(index, 1)
    if not validIndex then
        return
    end
    self.currentStepIndex = validIndex
    BAG.SavedVars:SetCurrentStep(self.currentStepIndex)
    self:RefreshUI()
end

function Engine:NextStep(auto)
    if not self.currentGuide then
        return
    end
    local nextIndex = self:FindNextValidStep(self.currentStepIndex + 1, 1)
    if nextIndex then
        self.currentStepIndex = nextIndex
        BAG.SavedVars:SetCurrentStep(self.currentStepIndex)
        self:RefreshUI(auto)
    end
end

function Engine:PrevStep()
    if not self.currentGuide then
        return
    end
    local prevIndex = self:FindNextValidStep(self.currentStepIndex - 1, -1)
    if prevIndex then
        self.currentStepIndex = prevIndex
        BAG.SavedVars:SetCurrentStep(self.currentStepIndex)
        self:RefreshUI()
    end
end

function Engine:GetUpcomingSteps(count)
    if not self.currentGuide then
        return {}
    end
    local results = {}
    local idx = self.currentStepIndex + 1
    while #results < count and idx <= #self.currentGuide.steps do
        local step = self.currentGuide.steps[idx]
        if BAG.Conditions:Check(step) then
            table.insert(results, step)
        end
        idx = idx + 1
    end
    return results
end

function Engine:FormatStep(step)
    if not step then
        return ""
    end
    local lines = {}
    if step.textLines then
        for _, line in ipairs(step.textLines) do
            table.insert(lines, line)
        end
    elseif step.text then
        table.insert(lines, step.text)
    end

    if step.tags and #step.tags > 0 then
        table.insert(lines, "Tags: " .. table.concat(step.tags, ", "))
    end

    return table.concat(lines, "\n")
end

function Engine:RefreshUI(auto)
    if BAG.UI and BAG.UI.Refresh then
        BAG.UI:Refresh(auto)
    end
end

function Engine:Evaluate()
    local step = self:GetCurrentStep()
    if not step then
        return
    end
    if not BAG.Conditions:Check(step) then
        self:NextStep(true)
        return
    end
    if step.autoAdvance and BAG.Conditions:CheckComplete(step) then
        self:NextStep(true)
    end
end

function Engine:OnEvent()
    self:Evaluate()
end

