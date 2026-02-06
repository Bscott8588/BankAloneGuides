--[[
    Bank Alone Guides - Core Step Engine
    SCS / Bank Alone Guides
    
    Loads guides, tracks current step, auto-advances, and supports manual navigation.
]]

local BAG = BankAlone

BAG.Engine = BAG.Engine or {}
local Engine = BAG.Engine

-- Engine state
Engine._currentGuide = nil
Engine._currentGuideName = nil
Engine._currentStep = 1
Engine._totalSteps = 0
Engine._autoAdvance = true

function Engine:Initialize()
    self._autoAdvance = true
    BAG:Debug("Engine initialized")
end

-- Load a guide by name key
function Engine:LoadGuide(guideName)
    local guide = BAG.Guides[guideName]
    if not guide then
        BAG:Error("Guide not found: " .. tostring(guideName))
        return false
    end

    self._currentGuide = guide
    self._currentGuideName = guideName
    self._currentStep = 1
    self._totalSteps = guide.steps and #guide.steps or 0

    BAG:Debug("Loaded guide:", guideName, "Steps:", self._totalSteps)

    -- Save progress
    BAG.SavedVars:SaveProgress(guideName, 1)

    -- Update UI
    BAG.UI:RefreshGuide()

    return true
end

-- Get current guide table
function Engine:GetCurrentGuide()
    return self._currentGuide
end

-- Get current guide name key
function Engine:GetCurrentGuideName()
    return self._currentGuideName
end

-- Get current step index
function Engine:GetCurrentStepIndex()
    return self._currentStep
end

-- Get total steps
function Engine:GetTotalSteps()
    return self._totalSteps
end

-- Get current step data
function Engine:GetCurrentStep()
    if not self._currentGuide or not self._currentGuide.steps then return nil end
    return self._currentGuide.steps[self._currentStep]
end

-- Get a specific step by index
function Engine:GetStep(index)
    if not self._currentGuide or not self._currentGuide.steps then return nil end
    return self._currentGuide.steps[index]
end

-- Get multiple steps (for display in the panel)
function Engine:GetStepRange(startIdx, count)
    local steps = {}
    if not self._currentGuide or not self._currentGuide.steps then return steps end

    for i = startIdx, math.min(startIdx + count - 1, self._totalSteps) do
        steps[#steps + 1] = {
            index = i,
            data = self._currentGuide.steps[i],
            isCurrent = (i == self._currentStep),
            isComplete = BAG.SavedVars:IsStepComplete(self._currentGuideName, i),
        }
    end
    return steps
end

-- Set current step directly
function Engine:SetStep(index)
    if not self._currentGuide then return end
    index = BAG.Utils:Clamp(index, 1, self._totalSteps)
    self._currentStep = index

    -- Skip steps whose conditions are not met
    self:SkipInvalidSteps()

    -- Save progress
    BAG.SavedVars:SaveProgress(self._currentGuideName, self._currentStep)

    -- Update UI
    BAG.UI:RefreshStep()
end

-- Advance to next step
function Engine:NextStep()
    if not self._currentGuide then return end
    if self._currentStep >= self._totalSteps then
        BAG:Print("Guide complete! Well done.")
        self:OnGuideComplete()
        return
    end

    -- Mark current step complete
    BAG.SavedVars:MarkStepComplete(self._currentGuideName, self._currentStep)

    self._currentStep = self._currentStep + 1

    -- Skip steps whose display conditions are not met
    self:SkipInvalidSteps()

    -- Save progress
    BAG.SavedVars:SaveProgress(self._currentGuideName, self._currentStep)

    -- Update UI
    BAG.UI:RefreshStep()

    BAG:Debug("Advanced to step", self._currentStep)
end

-- Go to previous step
function Engine:PrevStep()
    if not self._currentGuide then return end
    if self._currentStep <= 1 then return end

    self._currentStep = self._currentStep - 1

    -- Save progress
    BAG.SavedVars:SaveProgress(self._currentGuideName, self._currentStep)

    -- Update UI
    BAG.UI:RefreshStep()

    BAG:Debug("Went back to step", self._currentStep)
end

-- Skip steps whose conditions are not met (class, race, etc.)
function Engine:SkipInvalidSteps()
    local maxAttempts = 50 -- prevent infinite loops
    local attempts = 0

    while attempts < maxAttempts and self._currentStep <= self._totalSteps do
        local step = self._currentGuide.steps[self._currentStep]
        if step and step.conditions and #step.conditions > 0 then
            if not BAG.Conditions:Check(step) then
                BAG:Debug("Skipping step", self._currentStep, "- conditions not met")
                self._currentStep = self._currentStep + 1
                attempts = attempts + 1
            else
                break
            end
        else
            break
        end
    end
end

-- Auto-advance check (called by events)
function Engine:TryAutoAdvance()
    if not self._autoAdvance then return end
    if not self._currentGuide then return end

    local step = self:GetCurrentStep()
    if not step then return end

    if BAG.Conditions:IsComplete(step) then
        BAG:Debug("Auto-advancing from step", self._currentStep)
        self:NextStep()
    end
end

-- Re-evaluate current step (user-triggered)
function Engine:Reevaluate()
    self:TryAutoAdvance()
    BAG.UI:RefreshStep()
end

-- Handle guide completion
function Engine:OnGuideComplete()
    BAG:Print("Congratulations! You've completed: " .. (self._currentGuide.title or self._currentGuideName))

    -- Try to load the next guide in sequence
    local nextGuide = self._currentGuide.nextGuide
    if nextGuide and BAG.Guides[nextGuide] then
        BAG:Print("Loading next guide: " .. nextGuide)
        self:LoadGuide(nextGuide)
    else
        BAG.UI:ShowGuideComplete()
    end
end

-- Get progress percentage
function Engine:GetProgress()
    if self._totalSteps == 0 then return 0 end
    return (self._currentStep - 1) / self._totalSteps * 100
end

-- Toggle auto-advance
function Engine:SetAutoAdvance(enabled)
    self._autoAdvance = enabled
end

function Engine:IsAutoAdvanceEnabled()
    return self._autoAdvance
end

-- Get list of all available guides for a faction
function Engine:GetAvailableGuides(faction)
    local list = {}
    for name, guide in pairs(BAG.Guides) do
        if not faction or guide.faction == faction or guide.faction == "Both" then
            list[#list + 1] = {
                key = name,
                title = guide.title or name,
                faction = guide.faction,
                levelRange = guide.levelRange,
                category = guide.category or "Leveling",
            }
        end
    end

    -- Sort by level range
    table.sort(list, function(a, b)
        local aMin = a.levelRange and a.levelRange[1] or 0
        local bMin = b.levelRange and b.levelRange[1] or 0
        if aMin == bMin then
            return (a.title or "") < (b.title or "")
        end
        return aMin < bMin
    end)

    return list
end
