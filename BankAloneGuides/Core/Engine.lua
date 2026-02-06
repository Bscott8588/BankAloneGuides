--[[
    Bank Alone Guides - Core Engine
    Main guide progression engine that manages steps and auto-advancement
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Engine state
BAG.Engine.currentGuide = nil
BAG.Engine.currentStep = 1
BAG.Engine.steps = {}
BAG.Engine.availableGuides = {}

-- Initialize engine
function BAG.Engine:Initialize()
    BAG.Logo:Print("Engine initialized")
end

-- Register a guide
function BAG.Engine:RegisterGuide(guide)
    if not guide or not guide.id then
        BAG.Logo:PrintError("Invalid guide registration")
        return false
    end
    
    self.availableGuides[guide.id] = guide
    BAG:Debug("Registered guide:", guide.id)
    return true
end

-- Get list of available guides
function BAG.Engine:GetAvailableGuides()
    local guides = {}
    for id, guide in pairs(self.availableGuides) do
        table.insert(guides, guide)
    end
    return guides
end

-- Load a guide
function BAG.Engine:LoadGuide(guideID, startStep)
    startStep = startStep or 1
    
    local guide = self.availableGuides[guideID]
    
    if not guide then
        BAG.Logo:PrintError("Guide not found: " .. tostring(guideID))
        return false
    end
    
    -- Validate guide structure
    if not guide.steps or #guide.steps == 0 then
        BAG.Logo:PrintError("Guide has no steps: " .. guideID)
        return false
    end
    
    -- Load guide
    self.currentGuide = guide
    self.currentStep = startStep
    self.steps = guide.steps
    
    -- Save to SavedVars
    BAG.SavedVars:SetCurrentGuide(guideID, startStep)
    
    -- Validate start step
    if startStep > #self.steps then
        self.currentStep = #self.steps
    end
    
    BAG.Logo:Print("Loaded guide: " .. (guide.title or guideID))
    BAG.Logo:Print(string.format("Step %d / %d", self.currentStep, #self.steps))
    
    -- Update UI
    if BAG.UI then
        BAG.UI:Update()
    end
    
    -- Trigger custom event
    BAG.Events:TriggerCustom("GUIDE_LOADED", guideID, guide)
    
    return true
end

-- Get current step
function BAG.Engine:GetCurrentStep()
    if not self.steps or not self.currentStep then
        return nil
    end
    
    return self.steps[self.currentStep]
end

-- Get step by index
function BAG.Engine:GetStep(index)
    if not self.steps or index < 1 or index > #self.steps then
        return nil
    end
    
    return self.steps[index]
end

-- Get next available steps for display
function BAG.Engine:GetNextSteps(count)
    count = count or 5
    local steps = {}
    
    if not self.steps then
        return steps
    end
    
    for i = self.currentStep, math.min(self.currentStep + count - 1, #self.steps) do
        local step = self.steps[i]
        if step then
            table.insert(steps, {
                index = i,
                step = step,
                isCurrent = (i == self.currentStep),
                isAvailable = BAG.Conditions:Check(step),
                isComplete = self:IsStepComplete(step, i)
            })
        end
    end
    
    return steps
end

-- Check if a step is complete
function BAG.Engine:IsStepComplete(step, index)
    if not step then
        return false
    end
    
    -- Check saved completion state
    if self.currentGuide and index then
        if BAG.SavedVars:IsStepComplete(self.currentGuide.id, index) then
            return true
        end
    end
    
    -- Check step completion conditions
    local stepType = step.type
    
    if stepType == "accept" and step.questID then
        return BAG.QuestAPI:IsQuestActive(step.questID) or BAG.QuestAPI:IsQuestComplete(step.questID)
    elseif stepType == "turnin" and step.questID then
        return BAG.QuestAPI:IsQuestTurnedIn(step.questID)
    elseif stepType == "collect" and step.itemID and step.count then
        return BAG.InventoryAPI:GetItemCount(step.itemID) >= step.count
    elseif stepType == "kill" and step.questID then
        return BAG.QuestAPI:IsQuestComplete(step.questID)
    elseif stepType == "goto" then
        -- Check if player is near destination
        if step.x and step.y and step.zone then
            local currentZone = BAG.MapAPI:GetCurrentZone()
            if currentZone == step.zone then
                local px, py = BAG.MapAPI:GetPlayerPosition()
                if px and py then
                    local distance = BAG.Utils:Distance(px, py, step.x, step.y)
                    return distance < 0.02  -- Within ~20 yards
                end
            end
        end
    end
    
    return false
end

-- Mark step as complete
function BAG.Engine:MarkStepComplete(index)
    index = index or self.currentStep
    
    if self.currentGuide then
        BAG.SavedVars:MarkStepComplete(self.currentGuide.id, index)
    end
    
    -- Trigger custom event
    BAG.Events:TriggerCustom("STEP_COMPLETE", index)
end

-- Advance to next step
function BAG.Engine:NextStep()
    if not self.steps then
        return false
    end
    
    -- Mark current step complete
    self:MarkStepComplete(self.currentStep)
    
    -- Move to next step
    if self.currentStep < #self.steps then
        self.currentStep = self.currentStep + 1
        
        -- Save progress
        if self.currentGuide then
            BAG.SavedVars:SetCurrentGuide(self.currentGuide.id, self.currentStep)
        end
        
        -- Skip unavailable steps if configured
        if BAG.SavedVars:Get("guide.skipCompleted") then
            while self.currentStep <= #self.steps and self:IsStepComplete(self:GetCurrentStep(), self.currentStep) do
                self.currentStep = self.currentStep + 1
            end
        end
        
        BAG:Debug("Advanced to step", self.currentStep)
        
        -- Update UI
        if BAG.UI then
            BAG.UI:Update()
        end
        
        -- Trigger custom event
        BAG.Events:TriggerCustom("STEP_CHANGED", self.currentStep)
        
        return true
    else
        -- Guide complete
        self:OnGuideComplete()
        return false
    end
end

-- Go to previous step
function BAG.Engine:PreviousStep()
    if not self.steps or self.currentStep <= 1 then
        return false
    end
    
    self.currentStep = self.currentStep - 1
    
    -- Save progress
    if self.currentGuide then
        BAG.SavedVars:SetCurrentGuide(self.currentGuide.id, self.currentStep)
    end
    
    BAG:Debug("Returned to step", self.currentStep)
    
    -- Update UI
    if BAG.UI then
        BAG.UI:Update()
    end
    
    -- Trigger custom event
    BAG.Events:TriggerCustom("STEP_CHANGED", self.currentStep)
    
    return true
end

-- Jump to specific step
function BAG.Engine:GotoStep(index)
    if not self.steps or index < 1 or index > #self.steps then
        return false
    end
    
    self.currentStep = index
    
    -- Save progress
    if self.currentGuide then
        BAG.SavedVars:SetCurrentGuide(self.currentGuide.id, self.currentStep)
    end
    
    BAG:Debug("Jumped to step", self.currentStep)
    
    -- Update UI
    if BAG.UI then
        BAG.UI:Update()
    end
    
    -- Trigger custom event
    BAG.Events:TriggerCustom("STEP_CHANGED", self.currentStep)
    
    return true
end

-- Update steps (check for auto-completion)
function BAG.Engine:UpdateSteps()
    if not self.steps or not self.currentStep then
        return
    end
    
    local currentStep = self:GetCurrentStep()
    if not currentStep then
        return
    end
    
    -- Check if current step is complete
    if self:IsStepComplete(currentStep, self.currentStep) then
        -- Auto-advance if enabled
        if BAG.SavedVars:Get("guide.autoAdvance") then
            BAG:Debug("Auto-advancing from completed step")
            self:NextStep()
        else
            -- Just update UI to show completion
            if BAG.UI then
                BAG.UI:Update()
            end
        end
    end
end

-- Check item-related steps
function BAG.Engine:CheckItemSteps()
    self:UpdateSteps()
end

-- Event handlers
function BAG.Engine:OnQuestAccepted(questID)
    BAG:Debug("Engine: Quest accepted", questID)
    self:UpdateSteps()
end

function BAG.Engine:OnQuestCompleted(questID)
    BAG:Debug("Engine: Quest completed", questID)
    self:UpdateSteps()
end

function BAG.Engine:OnQuestRemoved(questID)
    BAG:Debug("Engine: Quest removed", questID)
    self:UpdateSteps()
end

-- Guide completion
function BAG.Engine:OnGuideComplete()
    if not self.currentGuide then
        return
    end
    
    BAG.Logo:PrintSuccess("Guide complete: " .. (self.currentGuide.title or self.currentGuide.id))
    
    -- Mark guide as complete
    BAG.SavedVars:MarkGuideComplete(self.currentGuide.id)
    
    -- Show notification
    if BAG.SavedVars:Get("notifications.guideCompleted") then
        -- Could show a fancy completion UI here
    end
    
    -- Trigger custom event
    BAG.Events:TriggerCustom("GUIDE_COMPLETE", self.currentGuide.id)
    
    -- Suggest next guide
    self:SuggestNextGuide()
end

-- Suggest next guide based on current state
function BAG.Engine:SuggestNextGuide()
    if not self.currentGuide then
        return
    end
    
    local playerInfo = BAG.PlayerAPI:GetPlayerInfo()
    local level = playerInfo.level
    local faction = playerInfo.faction
    
    -- Find appropriate next guide
    local nextGuideID = nil
    
    -- Simple logic: suggest next level bracket
    local currentID = self.currentGuide.id
    
    if BAG.Utils:Contains(currentID, "_01_10") then
        nextGuideID = faction .. "_10_20"
    elseif BAG.Utils:Contains(currentID, "_10_20") then
        nextGuideID = faction .. "_20_30"
    elseif BAG.Utils:Contains(currentID, "_20_30") then
        nextGuideID = faction .. "_30_40"
    elseif BAG.Utils:Contains(currentID, "_30_40") then
        nextGuideID = faction .. "_40_50"
    elseif BAG.Utils:Contains(currentID, "_40_50") then
        nextGuideID = faction .. "_50_60"
    elseif BAG.Utils:Contains(currentID, "_50_60") then
        nextGuideID = faction .. "_58_70_Outland"
    end
    
    if nextGuideID and self.availableGuides[nextGuideID] then
        BAG.Logo:Print("Suggested next guide: " .. nextGuideID)
        BAG.Logo:Print("Use /bag to load it")
        
        -- Could auto-load here
        -- self:LoadGuide(nextGuideID, 1)
    end
end

-- Get progress information
function BAG.Engine:GetProgress()
    if not self.currentGuide or not self.steps then
        return {
            guideTitle = "No guide loaded",
            currentStep = 0,
            totalSteps = 0,
            percent = 0
        }
    end
    
    return {
        guideTitle = self.currentGuide.title or self.currentGuide.id,
        currentStep = self.currentStep,
        totalSteps = #self.steps,
        percent = math.floor((self.currentStep / #self.steps) * 100)
    }
end

-- Reset current guide
function BAG.Engine:ResetGuide()
    if not self.currentGuide then
        return
    end
    
    self.currentStep = 1
    
    if self.currentGuide then
        BAG.SavedVars:SetCurrentGuide(self.currentGuide.id, 1)
    end
    
    BAG.Logo:Print("Guide reset to beginning")
    
    if BAG.UI then
        BAG.UI:Update()
    end
end

print("|cff00B3FF[Bank Alone Guides]|r Engine system loaded")
