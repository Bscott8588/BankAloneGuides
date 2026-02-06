--[[
    Bank Alone Guides - Core Engine
    Main guide execution engine
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.Engine = {
    currentGuide = nil,
    currentGuideName = nil,
    currentStepIndex = 1,
    currentStep = nil,
    steps = {},
    isRunning = false,
}

-- Load a guide by name
function BAG.Engine:LoadGuide(guideName)
    if not guideName then
        BAG:Error("No guide name provided")
        return false
    end
    
    -- Find the guide
    local guide = self:FindGuide(guideName)
    if not guide then
        BAG:Error("Guide not found:", guideName)
        return false
    end
    
    self.currentGuideName = guideName
    self.currentGuide = guide
    self.steps = guide.steps or {}
    
    -- Load saved progress or start from beginning
    local savedGuideName, savedStepIndex = BAG.SavedVars:LoadProgress()
    
    if savedGuideName == guideName and savedStepIndex and savedStepIndex > 0 then
        self.currentStepIndex = savedStepIndex
        BAG:DebugPrint("Resumed guide at step", savedStepIndex)
    else
        self.currentStepIndex = 1
        BAG:DebugPrint("Starting guide from beginning")
    end
    
    -- Set current step
    self:SetStep(self.currentStepIndex)
    
    -- Start the engine
    self.isRunning = true
    
    BAG:Print("Loaded guide:", guide.title or guideName)
    
    return true
end

-- Find a guide by name
function BAG.Engine:FindGuide(guideName)
    -- Check leveling guides
    for faction, guides in pairs(BAG.Guides.Leveling) do
        for name, guide in pairs(guides) do
            if name == guideName then
                return guide
            end
        end
    end
    
    -- Check profession guides
    for name, guide in pairs(BAG.Guides.Professions) do
        if name == guideName then
            return guide
        end
    end
    
    -- Check gold guides
    for name, guide in pairs(BAG.Guides.Gold) do
        if name == guideName then
            return guide
        end
    end
    
    return nil
end

-- Set current step
function BAG.Engine:SetStep(stepIndex)
    if stepIndex < 1 or stepIndex > #self.steps then
        BAG:DebugPrint("Step index out of range:", stepIndex)
        return false
    end
    
    self.currentStepIndex = stepIndex
    self.currentStep = self.steps[stepIndex]
    
    -- Save progress
    BAG.SavedVars:SaveProgress(self.currentGuideName, stepIndex)
    
    BAG:DebugPrint("Current step:", stepIndex, "/", #self.steps)
    
    return true
end

-- Go to next step
function BAG.Engine:NextStep()
    if not self.currentGuide then
        BAG:Print("No guide loaded")
        return false
    end
    
    local nextIndex = self.currentStepIndex + 1
    
    -- Check if at end of guide
    if nextIndex > #self.steps then
        BAG:Print("Guide complete!")
        self:OnGuideComplete()
        return false
    end
    
    -- Skip steps that don't meet conditions if configured
    if BAG.SavedVars:Get("guide.skipCompleted") then
        while nextIndex <= #self.steps do
            local step = self.steps[nextIndex]
            if BAG.Conditions:Check(step) and not self:IsStepComplete(step, nextIndex) then
                break
            end
            nextIndex = nextIndex + 1
        end
    end
    
    if nextIndex > #self.steps then
        BAG:Print("Guide complete!")
        self:OnGuideComplete()
        return false
    end
    
    self:SetStep(nextIndex)
    BAG.UI:Update()
    
    return true
end

-- Go to previous step
function BAG.Engine:PreviousStep()
    if not self.currentGuide then
        BAG:Print("No guide loaded")
        return false
    end
    
    local prevIndex = self.currentStepIndex - 1
    
    if prevIndex < 1 then
        BAG:Print("Already at first step")
        return false
    end
    
    self:SetStep(prevIndex)
    BAG.UI:Update()
    
    return true
end

-- Check if current step is complete
function BAG.Engine:IsCurrentStepComplete()
    if not self.currentStep then return false end
    return self:IsStepComplete(self.currentStep, self.currentStepIndex)
end

-- Check if a specific step is complete
function BAG.Engine:IsStepComplete(step, stepIndex)
    if not step then return false end
    
    -- Check if manually marked as complete
    if BAG.SavedVars:IsStepCompleted(self.currentGuideName, stepIndex) then
        return true
    end
    
    -- Check step-specific completion criteria
    if step.type == "accept" then
        return BAG.QuestAPI:IsQuestActive(step.questID) or BAG.QuestAPI:IsQuestFinished(step.questID)
    elseif step.type == "turnin" then
        return BAG.QuestAPI:IsQuestFinished(step.questID)
    elseif step.type == "kill" then
        -- Usually completed when quest is done
        if step.questID then
            return BAG.QuestAPI:IsQuestObjectiveComplete(step.questID, step.objectiveIndex or 1)
        end
        return false
    elseif step.type == "collect" then
        if step.itemID and step.count then
            return BAG.InventoryAPI:CountItem(step.itemID) >= step.count
        end
        return false
    elseif step.type == "use" then
        -- Can't really auto-detect, rely on manual completion
        return false
    elseif step.type == "train" then
        if step.spellID then
            return BAG.SpellAPI:HasSpell(step.spellID)
        end
        return false
    elseif step.type == "goto" then
        -- Check if player is near the coordinates
        if step.zone and step.x and step.y then
            local playerZone = BAG.ZoneDetection:GetCurrentZone()
            if playerZone == step.zone then
                local px, py = BAG.MapAPI:GetPlayerPosition()
                if px and py then
                    local distance = BAG.Utils:Distance2D(px, py, step.x, step.y)
                    return distance < 0.05 -- Within ~5 yards (coordinates are 0-1 scale)
                end
            end
        end
        return false
    elseif step.type == "note" then
        -- Notes are always "complete" after being read
        return false
    end
    
    return false
end

-- Evaluate current state and auto-advance if needed
function BAG.Engine:Evaluate()
    if not self.isRunning or not self.currentGuide then
        return
    end
    
    -- Check if current step is complete
    if self:IsCurrentStepComplete() then
        BAG:DebugPrint("Current step complete, checking auto-advance")
        
        -- Auto-advance if enabled
        if BAG.SavedVars:Get("guide.autoAdvance") then
            self:NextStep()
        end
    end
end

-- Mark current step as complete
function BAG.Engine:CompleteCurrentStep()
    if not self.currentStep or not self.currentGuideName then return end
    
    BAG.SavedVars:MarkStepCompleted(self.currentGuideName, self.currentStepIndex)
    BAG:Print("Step marked as complete")
    
    -- Auto-advance if enabled
    if BAG.SavedVars:Get("guide.autoAdvance") then
        self:NextStep()
    end
    
    BAG.UI:Update()
end

-- Handle quest accepted
function BAG.Engine:OnQuestAccepted(questID)
    if not self.currentStep then return end
    
    if self.currentStep.type == "accept" and self.currentStep.questID == questID then
        BAG:DebugPrint("Accept step complete for quest", questID)
        self:CompleteCurrentStep()
    end
end

-- Handle quest turned in
function BAG.Engine:OnQuestTurnedIn(questID)
    if not self.currentStep then return end
    
    if self.currentStep.type == "turnin" and self.currentStep.questID == questID then
        BAG:DebugPrint("Turnin step complete for quest", questID)
        self:CompleteCurrentStep()
    end
end

-- Handle guide completion
function BAG.Engine:OnGuideComplete()
    if not self.currentGuideName then return end
    
    BAG.SavedVars:MarkGuideCompleted(self.currentGuideName)
    BAG:Print("Congratulations! Guide completed:", self.currentGuide.title or self.currentGuideName)
    
    -- Try to find next guide
    local nextGuide = self:FindNextGuide()
    if nextGuide then
        BAG:Print("Next guide available:", nextGuide)
        -- Optionally auto-load next guide
        -- self:LoadGuide(nextGuide)
    end
end

-- Find the next logical guide
function BAG.Engine:FindNextGuide()
    if not self.currentGuide or not self.currentGuide.levelRange then
        return nil
    end
    
    local maxLevel = self.currentGuide.levelRange.max
    local playerLevel = BAG.PlayerAPI:GetLevel()
    local faction = BAG.PlayerAPI:GetFaction()
    
    -- Look for guides that start around the max level of current guide
    return BAG.Navigator:DetermineStartingGuide(maxLevel, faction, nil, nil)
end

-- Stop the engine
function BAG.Engine:Stop()
    self.isRunning = false
    BAG:Print("Guide engine stopped")
end

-- Resume the engine
function BAG.Engine:Resume()
    if not self.currentGuide then
        BAG:Print("No guide loaded")
        return false
    end
    
    self.isRunning = true
    self:Evaluate()
    BAG:Print("Guide engine resumed")
    
    return true
end

-- Get guide progress (percentage)
function BAG.Engine:GetProgress()
    if not self.currentGuide or #self.steps == 0 then
        return 0
    end
    
    return (self.currentStepIndex - 1) / #self.steps * 100
end

-- Get upcoming steps
function BAG.Engine:GetUpcomingSteps(count)
    count = count or 5
    local steps = {}
    
    for i = self.currentStepIndex, math.min(self.currentStepIndex + count - 1, #self.steps) do
        table.insert(steps, {
            index = i,
            step = self.steps[i],
            isCurrent = (i == self.currentStepIndex),
        })
    end
    
    return steps
end
