--[[
    Bank Alone Guides - Waypoint Arrow
    SCS / Bank Alone Guides
    
    A frameless, floating directional arrow that points toward the current step's
    coordinates. Displays clear instruction text and distance below the arrow.
    No box frame -- just the arrow graphic, text, and distance floating on screen.
    
    Inspired by the Zygor-style waypoint but with our own SCS neon-blue aesthetic.
    The arrow rotates to point toward the target based on the player's facing direction.
]]

local BAG = BankAlone

BAG.UI = BAG.UI or {}
BAG.UI.WaypointArrow = BAG.UI.WaypointArrow or {}
local WP = BAG.UI.WaypointArrow

-- State
WP._frame = nil
WP._arrow = nil
WP._targetX = nil
WP._targetY = nil
WP._targetZone = nil
WP._stepText = nil
WP._active = false
WP._lastAngle = 0
WP._arrived = false

-- Arrow size
local ARROW_SIZE = 42
local UPDATE_INTERVAL = 0.03  -- ~30fps rotation updates
local ARRIVAL_THRESHOLD = 0.012  -- ~1.2% of zone = "arrived"

-- ============================================================
-- CREATION
-- ============================================================

function WP:Create()
    if self._frame then return end

    -- Master anchor frame (invisible, movable, NO background or border)
    local anchor = CreateFrame("Frame", "BAG_WaypointAnchor", UIParent)
    anchor:SetSize(220, 90)
    anchor:SetPoint("TOP", UIParent, "TOP", 0, -100)
    anchor:SetFrameStrata("HIGH")
    anchor:SetFrameLevel(50)
    anchor:SetClampedToScreen(true)
    anchor:SetMovable(true)
    anchor:EnableMouse(true)
    anchor:RegisterForDrag("LeftButton")
    anchor:SetScript("OnDragStart", function(self) self:StartMoving() end)
    anchor:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        WP:SavePosition()
    end)

    -- NO background texture, NO borders -- completely frameless

    self._frame = anchor

    -- ============================================================
    -- The Arrow Texture (neon-blue, drawn with triangles)
    -- We use the built-in arrow texture and color it neon-blue
    -- ============================================================

    -- Arrow container (centered in the anchor, holds the rotating arrow)
    local arrowContainer = CreateFrame("Frame", nil, anchor)
    arrowContainer:SetSize(ARROW_SIZE, ARROW_SIZE)
    arrowContainer:SetPoint("TOP", anchor, "TOP", 0, 0)

    -- Primary arrow texture using a WoW built-in arrow
    -- We use the Minimap tracking arrow or a quest pointer and tint it
    local arrowTex = arrowContainer:CreateTexture(nil, "ARTWORK", nil, 2)
    arrowTex:SetSize(ARROW_SIZE, ARROW_SIZE)
    arrowTex:SetPoint("CENTER", arrowContainer, "CENTER", 0, 0)
    -- Use the player arrow texture from minimap (points up by default)
    arrowTex:SetTexture("Interface\\Minimap\\MinimapArrow")
    arrowTex:SetVertexColor(0.0, 0.85, 1.0, 1.0)  -- Neon blue tint
    self._arrowTex = arrowTex

    -- Glow layer behind the arrow for that neon effect
    local arrowGlow = arrowContainer:CreateTexture(nil, "ARTWORK", nil, 1)
    arrowGlow:SetSize(ARROW_SIZE + 12, ARROW_SIZE + 12)
    arrowGlow:SetPoint("CENTER", arrowContainer, "CENTER", 0, 0)
    arrowGlow:SetTexture("Interface\\Minimap\\MinimapArrow")
    arrowGlow:SetVertexColor(0.0, 0.6, 1.0, 0.25)  -- Dim blue glow
    arrowGlow:SetBlendMode("ADD")
    self._arrowGlow = arrowGlow

    self._arrowContainer = arrowContainer

    -- ============================================================
    -- "Arrived" checkmark (shown when player reaches destination)
    -- ============================================================
    local arrivedText = arrowContainer:CreateFontString(nil, "OVERLAY")
    arrivedText:SetFont("Fonts\\FRIZQT__.TTF", 26, "OUTLINE")
    arrivedText:SetText("|cFF00FF00\226\156\147|r")  -- Green checkmark
    arrivedText:SetPoint("CENTER", arrowContainer, "CENTER", 0, 0)
    arrivedText:Hide()
    self._arrivedText = arrivedText

    -- ============================================================
    -- Distance text (right below the arrow)
    -- ============================================================
    local distText = anchor:CreateFontString(nil, "OVERLAY")
    distText:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE")
    distText:SetTextColor(0.0, 0.9, 1.0, 1.0)  -- Bright neon blue
    distText:SetPoint("TOP", arrowContainer, "BOTTOM", 0, -2)
    distText:SetJustifyH("CENTER")
    distText:SetText("")
    self._distText = distText

    -- ============================================================
    -- Step instruction text (below the distance)
    -- This is the main info line: "Turn in: Reclaiming Sunstrider Isle"
    -- ============================================================
    local instrText = anchor:CreateFontString(nil, "OVERLAY")
    instrText:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    instrText:SetTextColor(1.0, 1.0, 1.0, 0.95)  -- White, high contrast
    instrText:SetPoint("TOP", distText, "BOTTOM", 0, -2)
    instrText:SetWidth(260)
    instrText:SetJustifyH("CENTER")
    instrText:SetWordWrap(true)
    instrText:SetMaxLines(2)
    instrText:SetText("")
    self._instrText = instrText

    -- ============================================================
    -- Coordinates text (below the instruction, smaller)
    -- ============================================================
    local coordText = anchor:CreateFontString(nil, "OVERLAY")
    coordText:SetFont("Fonts\\ARIALN.TTF", 10, "OUTLINE")
    coordText:SetTextColor(0.6, 0.7, 0.8, 0.8)  -- Muted gray-blue
    coordText:SetPoint("TOP", instrText, "BOTTOM", 0, -1)
    coordText:SetJustifyH("CENTER")
    coordText:SetText("")
    self._coordText = coordText

    -- ============================================================
    -- OnUpdate handler for smooth arrow rotation
    -- ============================================================
    local elapsed_acc = 0
    anchor:SetScript("OnUpdate", function(frame, elapsed)
        elapsed_acc = elapsed_acc + elapsed
        if elapsed_acc >= UPDATE_INTERVAL then
            elapsed_acc = 0
            WP:OnUpdate()
        end
    end)

    -- Start hidden
    anchor:Hide()
end

-- ============================================================
-- POSITION SAVE / RESTORE
-- ============================================================

function WP:SavePosition()
    if self._frame then
        local point, _, relPoint, x, y = self._frame:GetPoint()
        BAG.SavedVars:SetUI("arrowX", x)
        BAG.SavedVars:SetUI("arrowY", y)
        BAG.SavedVars:SetUI("arrowPoint", point)
        BAG.SavedVars:SetUI("arrowRelPoint", relPoint)
    end
end

function WP:RestorePosition()
    if self._frame then
        local x = BAG.SavedVars:GetUI("arrowX")
        local y = BAG.SavedVars:GetUI("arrowY")
        local point = BAG.SavedVars:GetUI("arrowPoint")
        local relPoint = BAG.SavedVars:GetUI("arrowRelPoint")
        if x and y then
            self._frame:ClearAllPoints()
            self._frame:SetPoint(point or "TOP", UIParent, relPoint or "TOP", x, y)
        end
    end
end

-- ============================================================
-- SET / CLEAR TARGET
-- ============================================================

-- Set the waypoint target from a step's data
function WP:SetFromStep(step)
    if not step then
        self:Clear()
        return
    end

    -- Determine coordinates (step stores them as zone-percentage 0-100)
    local tx, ty = step.x, step.y
    local zone = step.zone

    -- Build instruction text from step data
    local instrText = self:BuildInstructionText(step)

    if tx and ty and tx > 0 and ty > 0 then
        -- Convert from percentage (0-100) to map fraction (0-1)
        self._targetX = tx / 100
        self._targetY = ty / 100
        self._targetZone = zone
        self._stepText = instrText
        self._active = true
        self._arrived = false

        -- Update static text
        if self._instrText then
            self._instrText:SetText(instrText)
        end
        if self._coordText then
            self._coordText:SetText(string.format("%.1f, %.1f  %s", tx, ty, zone or ""))
        end

        -- Show everything
        self:Show()
    else
        -- Step has no coordinates -- show text only, hide arrow
        self._targetX = nil
        self._targetY = nil
        self._targetZone = zone
        self._stepText = instrText
        self._active = false
        self._arrived = false

        if self._instrText then
            self._instrText:SetText(instrText)
        end
        if self._coordText then
            self._coordText:SetText(zone or "")
        end
        if self._distText then
            self._distText:SetText("")
        end

        -- Show text but hide the arrow graphic
        if self._frame then
            self._frame:Show()
        end
        if self._arrowTex then
            self._arrowTex:Hide()
        end
        if self._arrowGlow then
            self._arrowGlow:Hide()
        end
        if self._arrivedText then
            self._arrivedText:Hide()
        end
    end
end

-- Build a clear instruction string from a step
function WP:BuildInstructionText(step)
    if not step then return "" end

    local prefix = ""
    local body = step.text or ""

    -- Build a clear, Zygor-style instruction prefix
    if step.type == "accept" then
        prefix = "Accept: "
        if step.questID and BAG.Data and BAG.Data.Quests and BAG.Data.Quests[step.questID] then
            body = BAG.Data.Quests[step.questID].name
        end
    elseif step.type == "turnin" then
        prefix = "Turn in: "
        if step.questID and BAG.Data and BAG.Data.Quests and BAG.Data.Quests[step.questID] then
            body = BAG.Data.Quests[step.questID].name
        end
    elseif step.type == "complete" then
        prefix = "Complete: "
        if step.questID and BAG.Data and BAG.Data.Quests and BAG.Data.Quests[step.questID] then
            body = BAG.Data.Quests[step.questID].name
        end
    elseif step.type == "kill" then
        prefix = "Kill: "
        body = step.target or step.text or "enemies"
    elseif step.type == "collect" then
        prefix = "Collect: "
    elseif step.type == "goto" or step.type == "travel" then
        prefix = "Go to: "
        body = step.text or step.zone or "destination"
    elseif step.type == "hearth" then
        prefix = ""
        body = "Use Hearthstone"
    elseif step.type == "fly" then
        prefix = "Fly to: "
        body = step.text or step.zone or "destination"
    elseif step.type == "flightpath" then
        prefix = ""
        body = "Get the flight path"
    elseif step.type == "train" then
        prefix = "Train: "
    elseif step.type == "vendor" or step.type == "buy" then
        prefix = "Vendor: "
    elseif step.type == "note" then
        prefix = ""
    elseif step.type == "level" then
        prefix = ""
        body = "Reach level " .. (step.targetLevel or "??")
    end

    -- If body is the same as step.text and we already have a good prefix, use it
    local result = prefix .. body

    -- Truncate if too long
    if #result > 80 then
        result = result:sub(1, 77) .. "..."
    end

    return result
end

-- Clear the waypoint
function WP:Clear()
    self._targetX = nil
    self._targetY = nil
    self._targetZone = nil
    self._stepText = nil
    self._active = false
    self._arrived = false
    self:Hide()
end

-- ============================================================
-- SHOW / HIDE
-- ============================================================

function WP:Show()
    if self._frame then
        self._frame:Show()
    end
    if self._arrowTex then
        self._arrowTex:Show()
    end
    if self._arrowGlow then
        self._arrowGlow:Show()
    end
    if self._arrivedText then
        self._arrivedText:Hide()
    end
end

function WP:Hide()
    if self._frame then
        self._frame:Hide()
    end
end

function WP:IsVisible()
    return self._frame and self._frame:IsShown()
end

-- ============================================================
-- CORE UPDATE LOOP (called ~30fps)
-- ============================================================

function WP:OnUpdate()
    if not self._active then return end
    if not self._targetX or not self._targetY then return end

    -- Get player position
    local pos = BAG.API.Map:GetPlayerPosition()
    if not pos or (pos.x == 0 and pos.y == 0) then
        -- Can't determine position, show arrow pointing up
        if self._distText then
            self._distText:SetText("Position unknown")
        end
        return
    end

    local px, py = pos.x, pos.y
    local tx, ty = self._targetX, self._targetY

    -- Calculate distance (in map-fraction units)
    local dx = tx - px
    local dy = ty - py
    local dist = math.sqrt(dx * dx + dy * dy)

    -- Check if arrived
    if dist < ARRIVAL_THRESHOLD then
        if not self._arrived then
            self._arrived = true
            self:ShowArrived()
        end
        self:UpdateDistanceText(dist)
        return
    end

    -- Not arrived -- make sure arrow is showing
    if self._arrived then
        self._arrived = false
        self:HideArrived()
    end

    -- Calculate angle from player to target
    -- In WoW map coordinates: x increases right, y increases DOWN
    -- atan2 gives angle in standard math coords
    local angleToTarget = math.atan2(-dx, dy)

    -- Get player facing direction
    local facing = GetPlayerFacing()
    if not facing then facing = 0 end

    -- Arrow rotation = how much to rotate the arrow from "pointing up"
    -- facing is 0=north, increases clockwise; angleToTarget is similar
    local rotation = angleToTarget - facing

    -- Smooth the rotation slightly
    local diff = rotation - self._lastAngle
    -- Normalize to [-pi, pi]
    while diff > math.pi do diff = diff - 2 * math.pi end
    while diff < -math.pi do diff = diff + 2 * math.pi end
    local smoothed = self._lastAngle + diff * 0.4  -- 40% lerp for smoothness
    self._lastAngle = smoothed

    -- Apply rotation
    if self._arrowTex then
        self._arrowTex:SetRotation(smoothed)
    end
    if self._arrowGlow then
        self._arrowGlow:SetRotation(smoothed)
    end

    -- Update distance text
    self:UpdateDistanceText(dist)
end

-- ============================================================
-- DISTANCE DISPLAY
-- ============================================================

function WP:UpdateDistanceText(dist)
    if not self._distText then return end

    -- Convert map-fraction distance to approximate yards
    -- A rough estimate: 1.0 map fraction ~ 1000-1500 yards depending on zone
    -- We use a general multiplier for display purposes
    local yards = dist * 1200

    local text
    local r, g, b

    if yards < 5 then
        text = "|cFF00FF00Arrived|r"
        r, g, b = 0, 1, 0
    elseif yards < 20 then
        text = string.format("|cFF00FF00%.0f yards|r", yards)
        r, g, b = 0, 1, 0
    elseif yards < 100 then
        text = string.format("|cFF66FF66%.0f yards|r", yards)
        r, g, b = 0.4, 1, 0.4
    elseif yards < 300 then
        text = string.format("|cFFFFFF00%.0f yards|r", yards)
        r, g, b = 1, 1, 0
    else
        text = string.format("|cFF00CCFF%.0f yards|r", yards)
        r, g, b = 0, 0.8, 1
    end

    self._distText:SetText(text)
end

-- ============================================================
-- ARRIVED STATE
-- ============================================================

function WP:ShowArrived()
    if self._arrowTex then self._arrowTex:Hide() end
    if self._arrowGlow then self._arrowGlow:Hide() end
    if self._arrivedText then self._arrivedText:Show() end

    if self._distText then
        self._distText:SetText("|cFF00FF00Arrived|r")
    end
end

function WP:HideArrived()
    if self._arrowTex then self._arrowTex:Show() end
    if self._arrowGlow then self._arrowGlow:Show() end
    if self._arrivedText then self._arrivedText:Hide() end
end

-- ============================================================
-- REFRESH (called when step changes)
-- ============================================================

function WP:Refresh()
    local step = BAG.Engine:GetCurrentStep()
    if step then
        self:SetFromStep(step)
    else
        self:Clear()
    end
end
