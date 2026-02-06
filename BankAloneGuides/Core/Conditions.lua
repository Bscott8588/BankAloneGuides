-------------------------------------------------------------------------------
-- Bank Alone Guides — Core / Conditions
-- Conditional step evaluation system
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Conditions = BAG.Conditions or {}

--- Evaluate all conditions on a step.
-- A step may have a `conditions` table: list of condition descriptors.
-- Returns true if ALL conditions pass (or if there are no conditions).
-- @param step  A step table with optional `conditions` field.
-- @return boolean
function BAG.Conditions:Check(step)
    if not step or not step.conditions then return true end

    for _, cond in ipairs(step.conditions) do
        if not self:EvalSingle(cond) then
            return false
        end
    end
    return true
end

--- Evaluate a single condition descriptor.
-- Condition format: { type = "...", ... }
-- Supported types:
--   level          { type="level", op=">=", value=10 }
--   questactive    { type="questactive", questID=123 }
--   questcomplete  { type="questcomplete", questID=123 }
--   class          { type="class", value="Warrior" }
--   race           { type="race", value="Orc" }
--   profession     { type="profession", name="Mining", skill=150 }
--   itemcount      { type="itemcount", itemID=1234, op=">=", value=5 }
--   zone           { type="zone", value="Hellfire Peninsula" }
--   faction        { type="faction", value="Alliance" }
-- @param cond  A condition table.
-- @return boolean
function BAG.Conditions:EvalSingle(cond)
    if not cond or not cond.type then return true end

    local t = cond.type:lower()

    -- ── Level ──────────────────────────────────────────────────────────────
    if t == "level" then
        local playerLevel = BAG.PlayerAPI:GetLevel()
        return self:CompareOp(playerLevel, cond.op or ">=", cond.value or 1)
    end

    -- ── Quest Active ──────────────────────────────────────────────────────
    if t == "questactive" then
        return BAG.QuestAPI:IsQuestActive(cond.questID)
    end

    -- ── Quest Complete (turned in) ────────────────────────────────────────
    if t == "questcomplete" then
        return BAG.QuestAPI:IsQuestComplete(cond.questID)
    end

    -- ── Class ─────────────────────────────────────────────────────────────
    if t == "class" then
        local pClass = BAG.PlayerAPI:GetClass()
        return BAG.Utils:StrEq(pClass, cond.value)
    end

    -- ── Race ──────────────────────────────────────────────────────────────
    if t == "race" then
        local pRace = BAG.PlayerAPI:GetRace()
        return BAG.Utils:StrEq(pRace, cond.value)
    end

    -- ── Faction ───────────────────────────────────────────────────────────
    if t == "faction" then
        local pFaction = BAG.PlayerAPI:GetFaction()
        return BAG.Utils:StrEq(pFaction, cond.value)
    end

    -- ── Profession ────────────────────────────────────────────────────────
    if t == "profession" then
        local skill = BAG.PlayerAPI:GetProfessionSkill(cond.name)
        if cond.skill then
            return skill >= (cond.skill or 0)
        end
        return skill > 0  -- just has the profession
    end

    -- ── Item Count ────────────────────────────────────────────────────────
    if t == "itemcount" then
        local count = BAG.InventoryAPI:CountItem(cond.itemID)
        return self:CompareOp(count, cond.op or ">=", cond.value or 1)
    end

    -- ── Zone ──────────────────────────────────────────────────────────────
    if t == "zone" then
        local currentZone = BAG.ZoneDetect:GetCurrentZone()
        return BAG.Utils:StrEq(currentZone, cond.value)
    end

    -- Unknown condition type — pass
    BAG:Debug("Unknown condition type: " .. tostring(cond.type))
    return true
end

--- Compare a value using an operator string.
-- @param left   The left-hand value (number).
-- @param op     Operator string: ">=", "<=", ">", "<", "==", "~="
-- @param right  The right-hand value (number).
-- @return boolean
function BAG.Conditions:CompareOp(left, op, right)
    left  = tonumber(left)  or 0
    right = tonumber(right) or 0

    if op == ">="  then return left >= right end
    if op == "<="  then return left <= right end
    if op == ">"   then return left > right end
    if op == "<"   then return left < right end
    if op == "=="  then return left == right end
    if op == "~="  then return left ~= right end
    return left >= right  -- default
end
