-------------------------------------------------------------------------------
-- Bank Alone Guides — API / SpellAPI
-- Spell and ability helpers
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.SpellAPI = BAG.SpellAPI or {}

--- Check if the player knows a spell by name or ID.
-- @param spellIdentifier  Spell name (string) or spell ID (number).
-- @return boolean
function BAG.SpellAPI:HasSpell(spellIdentifier)
    if not spellIdentifier then return false end

    if type(spellIdentifier) == "number" then
        return IsSpellKnown and IsSpellKnown(spellIdentifier) or false
    end

    -- By name: scan the spellbook
    local name = spellIdentifier
    local i = 1
    while true do
        local spellName = GetSpellBookItemName(i, BOOKTYPE_SPELL)
        if not spellName then break end
        if spellName:lower() == name:lower() then return true end
        i = i + 1
    end
    return false
end

--- Get the cooldown of a spell by name or ID.
-- @param spellIdentifier  Spell name or ID.
-- @return number  Remaining cooldown in seconds (0 if ready).
function BAG.SpellAPI:GetSpellCooldown(spellIdentifier)
    if not spellIdentifier then return 0 end

    local start, duration, enabled
    if type(spellIdentifier) == "number" then
        local name = GetSpellInfo(spellIdentifier)
        if name then
            start, duration, enabled = GetSpellCooldown(name)
        end
    else
        start, duration, enabled = GetSpellCooldown(spellIdentifier)
    end

    if start and duration and start > 0 then
        local remaining = (start + duration) - GetTime()
        return math.max(0, remaining)
    end
    return 0
end

--- Check if the Hearthstone is on cooldown.
-- @return boolean  true if Hearthstone is on cooldown.
function BAG.SpellAPI:IsHearthOnCooldown()
    -- Hearthstone spell ID is 8690
    return self:GetSpellCooldown(8690) > 0
end

--- Get the Hearthstone location.
-- @return string  The bind location name.
function BAG.SpellAPI:GetHearthLocation()
    return GetBindLocation and GetBindLocation() or "Unknown"
end
