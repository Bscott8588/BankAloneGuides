--[[
    Bank Alone Guides - Spell API
    Wraps spell and ability functions
    Copyright (c) Bradley S. Scott
]]

local ADDON_NAME = "BankAloneGuides"
local BAG = BankAlone

-- Check if player has a spell (by name or ID)
function BAG.SpellAPI:HasSpell(spellNameOrID)
    if type(spellNameOrID) == "number" then
        local spellName = GetSpellInfo(spellNameOrID)
        if spellName then
            return GetSpellBookItemInfo(spellName) ~= nil
        end
        return false
    elseif type(spellNameOrID) == "string" then
        return GetSpellBookItemInfo(spellNameOrID) ~= nil
    end
    
    return false
end

-- Get spell info
function BAG.SpellAPI:GetSpellInfo(spellNameOrID)
    local name, rank, icon, cost, isFunnel, powerType, castTime, minRange, maxRange = GetSpellInfo(spellNameOrID)
    
    if not name then
        return nil
    end
    
    return {
        name = name,
        rank = rank,
        icon = icon,
        cost = cost,
        isFunnel = isFunnel,
        powerType = powerType,
        castTime = castTime,
        minRange = minRange,
        maxRange = maxRange
    }
end

-- Get spell cooldown
function BAG.SpellAPI:GetSpellCooldown(spellNameOrID)
    local start, duration, enabled = GetSpellCooldown(spellNameOrID)
    return start, duration, enabled
end

-- Check if spell is on cooldown
function BAG.SpellAPI:IsSpellOnCooldown(spellNameOrID)
    local start, duration = self:GetSpellCooldown(spellNameOrID)
    if not duration or duration == 0 then
        return false
    end
    
    local remaining = (start + duration) - GetTime()
    return remaining > 1.5  -- Ignore GCD
end

-- Get spell cooldown remaining
function BAG.SpellAPI:GetSpellCooldownRemaining(spellNameOrID)
    local start, duration = self:GetSpellCooldown(spellNameOrID)
    if not duration or duration == 0 then
        return 0
    end
    
    local remaining = (start + duration) - GetTime()
    return math.max(0, remaining)
end

-- Cast spell
function BAG.SpellAPI:CastSpell(spellNameOrID, target)
    if self:IsSpellOnCooldown(spellNameOrID) then
        return false
    end
    
    if target then
        TargetUnit(target)
    end
    
    CastSpellByName(spellNameOrID)
    return true
end

-- Check if spell is usable
function BAG.SpellAPI:IsSpellUsable(spellNameOrID)
    local usable, notEnoughMana = IsUsableSpell(spellNameOrID)
    return usable == 1 and not notEnoughMana
end

-- Get spell range (in range, out of range, or nil if no range)
function BAG.SpellAPI:IsSpellInRange(spellNameOrID, unit)
    return IsSpellInRange(spellNameOrID, unit or "target")
end

-- Count number of spells in spellbook
function BAG.SpellAPI:GetNumSpells()
    local _, _, offset, numSpells = GetSpellTabInfo(1)
    return numSpells or 0
end

-- Get all known spells
function BAG.SpellAPI:GetAllSpells()
    local spells = {}
    local i = 1
    
    while true do
        local spellName, spellRank = GetSpellBookItemName(i, BOOKTYPE_SPELL)
        if not spellName then
            break
        end
        
        local spellType = GetSpellBookItemInfo(i, BOOKTYPE_SPELL)
        if spellType ~= "FUTURESPELL" and spellType ~= "PETACTION" then
            table.insert(spells, {
                name = spellName,
                rank = spellRank,
                index = i,
                type = spellType
            })
        end
        
        i = i + 1
    end
    
    return spells
end

-- Check if player knows spell rank
function BAG.SpellAPI:HasSpellRank(spellName, rank)
    local i = 1
    
    while true do
        local name, spellRank = GetSpellBookItemName(i, BOOKTYPE_SPELL)
        if not name then
            break
        end
        
        if name == spellName then
            if rank then
                local rankNum = tonumber(string.match(spellRank or "", "%d+"))
                local targetRank = tonumber(rank)
                if rankNum and targetRank and rankNum >= targetRank then
                    return true
                end
            else
                return true
            end
        end
        
        i = i + 1
    end
    
    return false
end

-- Get highest rank of spell
function BAG.SpellAPI:GetHighestSpellRank(spellName)
    local highestRank = 0
    local i = 1
    
    while true do
        local name, spellRank = GetSpellBookItemName(i, BOOKTYPE_SPELL)
        if not name then
            break
        end
        
        if name == spellName then
            local rankNum = tonumber(string.match(spellRank or "", "%d+"))
            if rankNum and rankNum > highestRank then
                highestRank = rankNum
            end
        end
        
        i = i + 1
    end
    
    return highestRank > 0 and highestRank or nil
end

-- Check if player can cast spell (all requirements met)
function BAG.SpellAPI:CanCastSpell(spellNameOrID)
    if not self:HasSpell(spellNameOrID) then
        return false, "Don't know spell"
    end
    
    if self:IsSpellOnCooldown(spellNameOrID) then
        return false, "On cooldown"
    end
    
    if not self:IsSpellUsable(spellNameOrID) then
        return false, "Not usable (insufficient mana/rage/energy)"
    end
    
    if UnitIsDead("player") then
        return false, "Player is dead"
    end
    
    return true
end

-- Format spell link for chat
function BAG.SpellAPI:GetSpellLink(spellNameOrID)
    local spellInfo = self:GetSpellInfo(spellNameOrID)
    if spellInfo then
        return GetSpellLink(spellInfo.name)
    end
    return nil
end

print("|cff00B3FF[Bank Alone Guides]|r Spell API loaded")
