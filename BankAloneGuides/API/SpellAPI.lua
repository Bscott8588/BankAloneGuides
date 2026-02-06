--[[
    Bank Alone Guides - Spell API Wrapper
    SCS / Bank Alone Guides
    
    Wraps spell-related WoW functions.
]]

local BAG = BankAlone

BAG.API = BAG.API or {}
BAG.API.Spell = BAG.API.Spell or {}
local SpellAPI = BAG.API.Spell

-- Check if the player knows a spell by name
function SpellAPI:HasSpell(spellNameOrID)
    if not spellNameOrID then return false end

    if type(spellNameOrID) == "number" then
        -- Check by spell ID
        local name = GetSpellInfo(spellNameOrID)
        if name then
            return self:HasSpellByName(name)
        end
        return false
    else
        return self:HasSpellByName(spellNameOrID)
    end
end

-- Check if the player knows a spell by name (scan spellbook)
function SpellAPI:HasSpellByName(spellName)
    if not spellName then return false end
    spellName = spellName:lower()

    -- Iterate through spellbook tabs
    local numTabs = GetNumSpellTabs() or 0
    for tab = 1, numTabs do
        local _, _, offset, numSpells = GetSpellTabInfo(tab)
        for i = offset + 1, offset + numSpells do
            local name = GetSpellBookItemName(i, BOOKTYPE_SPELL)
            if name and name:lower() == spellName then
                return true
            end
        end
    end

    return false
end

-- Get spell cooldown info
function SpellAPI:GetSpellCooldown(spellNameOrID)
    if not spellNameOrID then return nil end

    local spellName = spellNameOrID
    if type(spellNameOrID) == "number" then
        spellName = GetSpellInfo(spellNameOrID)
    end

    if not spellName then return nil end

    local start, duration, enabled = GetSpellCooldown(spellName)
    if start and start > 0 then
        local remaining = (start + duration) - GetTime()
        return {
            start = start,
            duration = duration,
            remaining = math.max(0, remaining),
            ready = remaining <= 0,
        }
    end

    return {
        start = 0,
        duration = 0,
        remaining = 0,
        ready = true,
    }
end

-- Check if Hearthstone is ready
function SpellAPI:IsHearthstoneReady()
    -- Hearthstone item ID is 6948
    local start, duration, enabled = GetItemCooldown(6948)
    if start and start > 0 then
        local remaining = (start + duration) - GetTime()
        return remaining <= 0
    end
    return true
end

-- Get Hearthstone location
function SpellAPI:GetHearthstoneLocation()
    return GetBindLocation() or "Unknown"
end
