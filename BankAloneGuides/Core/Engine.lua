-------------------------------------------------------------------------------
-- Bank Alone Guides — Core / Engine
-- Step engine: load guides, track progress, advance/retreat steps
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Engine = BAG.Engine or {}

-- Current state
BAG.Engine.currentGuideKey = nil
BAG.Engine.currentGuide    = nil  -- the guide table
BAG.Engine.currentStep     = 1
BAG.Engine.totalSteps      = 0

--- Load a guide by key and optionally jump to a specific step.
-- @param guideKey  The key in BAG.Guides.Registry
-- @param stepIndex (optional) Step to start at; defaults to 1
function BAG.Engine:LoadGuide(guideKey, stepIndex)
    local guide = BAG.Guides.Registry[guideKey]
    if not guide then
        BAG:Print("Guide not found: " .. tostring(guideKey))
        return
    end

    self.currentGuideKey = guideKey
    self.currentGuide    = guide
    self.totalSteps      = guide.steps and #guide.steps or 0
    self.currentStep     = BAG.Utils:Clamp(stepIndex or 1, 1, math.max(1, self.totalSteps))

    BAG.SavedVars:Set("currentGuide", guideKey)
    BAG.SavedVars:Set("currentStep", self.currentStep)

    BAG:Debug("Engine loaded: " .. guideKey .. " step " .. self.currentStep .. "/" .. self.totalSteps)

    -- Skip steps whose conditions are not met
    self:SkipInvalidSteps(1)

    -- Update UI
    if BAG.UI and BAG.UI.Refresh then
        BAG.UI:Refresh()
    end
end

--- Get the current step data.
function BAG.Engine:GetCurrentStep()
    if not self.currentGuide or not self.currentGuide.steps then return nil end
    return self.currentGuide.steps[self.currentStep]
end

--- Get a range of steps for display.
-- @param count  Number of steps to preview ahead (default 4)
-- @return table of { index, step, isCurrent, isComplete }
function BAG.Engine:GetVisibleSteps(count)
    count = count or BAG.Layout.StepPanel.VisibleSteps or 6
    local result = {}
    if not self.currentGuide or not self.currentGuide.steps then return result end

    for i = 0, count - 1 do
        local idx = self.currentStep + i
        if idx <= self.totalSteps then
            local step = self.currentGuide.steps[idx]
            result[#result + 1] = {
                index     = idx,
                step      = step,
                isCurrent = (i == 0),
                isComplete= BAG.SavedVars:IsStepComplete(self.currentGuideKey, idx),
            }
        end
    end
    return result
end

--- Advance to the next valid step.
function BAG.Engine:NextStep()
    if self.currentStep < self.totalSteps then
        BAG.SavedVars:MarkStepComplete(self.currentGuideKey, self.currentStep)
        self.currentStep = self.currentStep + 1
        self:SkipInvalidSteps(1)
        self:SaveProgress()
        if BAG.UI and BAG.UI.Refresh then BAG.UI:Refresh() end
    else
        BAG:Debug("Already at last step.")
    end
end

--- Go back to the previous valid step.
function BAG.Engine:PrevStep()
    if self.currentStep > 1 then
        self.currentStep = self.currentStep - 1
        self:SkipInvalidSteps(-1)
        self:SaveProgress()
        if BAG.UI and BAG.UI.Refresh then BAG.UI:Refresh() end
    else
        BAG:Debug("Already at first step.")
    end
end

--- Jump to a specific step.
function BAG.Engine:GoToStep(index)
    if not self.currentGuide then return end
    self.currentStep = BAG.Utils:Clamp(index, 1, self.totalSteps)
    self:SaveProgress()
    if BAG.UI and BAG.UI.Refresh then BAG.UI:Refresh() end
end

--- Skip steps whose conditions are not met.
-- @param direction  1 for forward, -1 for backward
function BAG.Engine:SkipInvalidSteps(direction)
    direction = direction or 1
    local maxAttempts = self.totalSteps
    local attempts = 0

    while attempts < maxAttempts do
        local step = self:GetCurrentStep()
        if not step then break end

        if BAG.Conditions:Check(step) then
            break  -- valid step found
        end

        self.currentStep = self.currentStep + direction
        if self.currentStep < 1 then self.currentStep = 1; break end
        if self.currentStep > self.totalSteps then self.currentStep = self.totalSteps; break end
        attempts = attempts + 1
    end
end

--- Check if the current step is auto-completable and advance if so.
function BAG.Engine:Evaluate()
    local step = self:GetCurrentStep()
    if not step then return end

    local complete = false

    -- Auto-complete based on step type
    if step.type == "accept" and step.questID then
        complete = BAG.QuestAPI:IsQuestActive(step.questID)
    elseif step.type == "turnin" and step.questID then
        complete = BAG.QuestAPI:IsQuestComplete(step.questID)
    elseif step.type == "collect" and step.itemID and step.count then
        local count = BAG.InventoryAPI:CountItem(step.itemID)
        complete = count >= step.count
    end

    -- Check if auto-advance is enabled
    local autoAdvance = BAG.SavedVars:GetPref("autoAdvance")
    if autoAdvance == nil then autoAdvance = true end

    if complete and autoAdvance then
        BAG:Debug("Auto-advancing from step " .. self.currentStep)
        self:NextStep()
    elseif BAG.UI and BAG.UI.Refresh then
        BAG.UI:Refresh()
    end
end

--- Save current progress to saved variables.
function BAG.Engine:SaveProgress()
    BAG.SavedVars:Set("currentGuide", self.currentGuideKey)
    BAG.SavedVars:Set("currentStep", self.currentStep)
end

--- Get progress as a fraction (0-1).
function BAG.Engine:GetProgress()
    if self.totalSteps <= 0 then return 0 end
    return (self.currentStep - 1) / self.totalSteps
end

--- Get the current guide's title.
function BAG.Engine:GetGuideTitle()
    if self.currentGuide and self.currentGuide.title then
        return self.currentGuide.title
    end
    return "No Guide Loaded"
end
