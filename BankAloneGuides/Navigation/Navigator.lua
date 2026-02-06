-------------------------------------------------------------------------------
-- Bank Alone Guides — Navigation / Navigator
-- High-level navigation logic: guide selection, auto-advance, smart start
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Navigator = BAG.Navigator or {}

--- Find the best guide for the player's current state.
-- This is called by SmartStart in Init.lua but can also be used to suggest
-- a guide switch when the player changes zones or levels up.
-- @return guideKey or nil
function BAG.Navigator:FindBestGuide()
    return BAG:SmartStart()
end

--- Check if the player should switch to a different guide.
-- Called after level-up or zone change events.
function BAG.Navigator:ConsiderGuideSwitch()
    local level   = BAG.PlayerAPI:GetLevel()
    local current = BAG.Engine.currentGuide
    if not current then return end

    local maxLvl = current.levelRange and current.levelRange[2] or 70

    -- If player has outleveled the current guide by 3+ levels, suggest switch
    if level > maxLvl + 2 then
        local newGuide = self:FindBestGuide()
        if newGuide and newGuide ~= BAG.Engine.currentGuideKey then
            BAG:Print("You may have outleveled this guide. Type /bag smart to switch.")
        end
    end
end

--- Get a sorted list of all guides for a faction.
-- @param faction  "Alliance" or "Horde"
-- @return table  Sorted by level range
function BAG.Navigator:GetGuidesForFaction(faction)
    local guides = {}
    for key, guide in pairs(BAG.Guides.Registry) do
        if guide.faction == "Both" or guide.faction == faction then
            guides[#guides + 1] = {
                key   = key,
                guide = guide,
                minLvl = guide.levelRange and guide.levelRange[1] or 1,
                maxLvl = guide.levelRange and guide.levelRange[2] or 70,
            }
        end
    end

    -- Sort by minimum level
    table.sort(guides, function(a, b)
        if a.minLvl == b.minLvl then
            return a.maxLvl < b.maxLvl
        end
        return a.minLvl < b.minLvl
    end)

    return guides
end

--- Attempt to auto-advance the engine.
-- Called periodically or after events.
function BAG.Navigator:AutoAdvance()
    local step = BAG.Engine:GetCurrentStep()
    if not step then return end

    -- Refresh quest cache
    BAG.QuestTrack:RefreshCache()

    local complete = false

    -- Check by step type
    if step.type == "accept" and step.questID then
        complete = BAG.QuestTrack:IsActive(step.questID) or
                   BAG.QuestTrack:IsTurnedIn(step.questID)

    elseif step.type == "turnin" and step.questID then
        complete = BAG.QuestTrack:IsTurnedIn(step.questID)

    elseif step.type == "collect" and step.itemID and step.count then
        local count = BAG.InventoryAPI:CountItem(step.itemID)
        complete = count >= step.count

    elseif step.type == "goto" or step.type == "travel" or
           step.type == "run" or step.type == "mount" then
        complete = BAG.Travel:IsAtDestination(step)
    end

    if complete then
        local autoAdv = BAG.SavedVars:GetPref("autoAdvance")
        if autoAdv ~= false then
            BAG.Engine:NextStep()
        end
    end
end

--- Get guide info for display.
-- @param guideKey  The guide key.
-- @return table  { title, faction, levelRange, zone, numSteps }
function BAG.Navigator:GetGuideInfo(guideKey)
    local guide = BAG.Guides.Registry[guideKey]
    if not guide then return nil end
    return {
        title      = guide.title or guideKey,
        faction    = guide.faction or "Both",
        levelRange = guide.levelRange or { 1, 70 },
        zone       = guide.zone or "Various",
        numSteps   = guide.steps and #guide.steps or 0,
    }
end
