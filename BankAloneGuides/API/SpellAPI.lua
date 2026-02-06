--[[
    Bank Alone Guides - Spell API
    Wraps WoW spell and ability functions
    Copyright (c) 2026 Bradley S. Scott
]]--

local addonName, BAG = ...

BAG.SpellAPI = {}

-- Check if player has a spell/ability
function BAG.SpellAPI:HasSpell(spellIDOrName)
    if not spellIDOrName then return false end
    
    -- If it's a number, treat as spell ID
    if type(spellIDOrName) == "number" then
        local spellName = GetSpellInfo(spellIDOrName)
        if not spellName then return false end
        return IsSpellKnown(spellIDOrName) or IsPlayerSpell(spellIDOrName)
    end
    
    -- If it's a string, search by name
    local spellName = spellIDOrName
    local spellID = select(7, GetSpellInfo(spellName))
    
    if not spellID then
        -- Try to find it in spellbook
        local i = 1
        while true do
            local name, _, _, _, _, _, id = GetSpellInfo(i, BOOKTYPE_SPELL)
            if not name then break end
            
            if name:lower() == spellName:lower() then
                return true
            end
            
            i = i + 1
        end
        return false
    end
    
    return IsSpellKnown(spellID) or IsPlayerSpell(spellID)
end

-- Get spell cooldown
function BAG.SpellAPI:GetSpellCooldown(spellIDOrName)
    if not spellIDOrName then return 0 end
    
    local spellName
    if type(spellIDOrName) == "number" then
        spellName = GetSpellInfo(spellIDOrName)
    else
        spellName = spellIDOrName
    end
    
    if not spellName then return 0 end
    
    local start, duration, enabled = GetSpellCooldown(spellName)
    
    if start == 0 then
        return 0
    end
    
    local remaining = duration - (GetTime() - start)
    return math.max(0, remaining)
end

-- Check if a spell is on cooldown
function BAG.SpellAPI:IsSpellOnCooldown(spellIDOrName)
    return self:GetSpellCooldown(spellIDOrName) > 0
end

-- Get spell info
function BAG.SpellAPI:GetSpellInfo(spellIDOrName)
    if not spellIDOrName then return nil end
    
    local name, rank, icon, castTime, minRange, maxRange, spellID = GetSpellInfo(spellIDOrName)
    
    if not name then return nil end
    
    return {
        name = name,
        rank = rank,
        icon = icon,
        castTime = castTime,
        minRange = minRange,
        maxRange = maxRange,
        spellID = spellID,
    }
end

-- Cast a spell
function BAG.SpellAPI:CastSpell(spellIDOrName, target)
    if not spellIDOrName then return false end
    
    local spellName
    if type(spellIDOrName) == "number" then
        spellName = GetSpellInfo(spellIDOrName)
    else
        spellName = spellIDOrName
    end
    
    if not spellName then return false end
    
    if target then
        CastSpellByName(spellName, target)
    else
        CastSpellByName(spellName)
    end
    
    return true
end

-- Check if player is casting
function BAG.SpellAPI:IsCasting()
    return UnitCastingInfo("player") ~= nil or UnitChannelInfo("player") ~= nil
end

-- Get current cast info
function BAG.SpellAPI:GetCastInfo()
    local name, _, _, _, startTime, endTime, _, castID = UnitCastingInfo("player")
    
    if name then
        return {
            name = name,
            startTime = startTime,
            endTime = endTime,
            castID = castID,
            isChanneled = false,
        }
    end
    
    name, _, _, _, startTime, endTime, _, castID = UnitChannelInfo("player")
    
    if name then
        return {
            name = name,
            startTime = startTime,
            endTime = endTime,
            castID = castID,
            isChanneled = true,
        }
    end
    
    return nil
end

-- Interrupt current cast
function BAG.SpellAPI:InterruptCast()
    SpellStopCasting()
end

-- Get all spells in spellbook
function BAG.SpellAPI:GetAllSpells()
    local spells = {}
    local i = 1
    
    while true do
        local spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
        if not spellName then break end
        
        local _, _, spellID = GetSpellInfo(spellName)
        
        table.insert(spells, {
            index = i,
            name = spellName,
            rank = spellRank,
            spellID = spellID,
        })
        
        i = i + 1
    end
    
    return spells
end

-- Check if a spell is passive
function BAG.SpellAPI:IsPassiveSpell(spellIDOrName)
    -- In TBC, passive spells don't have a cast time or cooldown
    local info = self:GetSpellInfo(spellIDOrName)
    if not info then return false end
    
    return info.castTime == 0 and self:GetSpellCooldown(spellIDOrName) == 0
end

-- Get spell range
function BAG.SpellAPI:GetSpellRange(spellIDOrName)
    local info = self:GetSpellInfo(spellIDOrName)
    if not info then return 0, 0 end
    
    return info.minRange or 0, info.maxRange or 0
end

-- Check if spell is in range of target
function BAG.SpellAPI:IsSpellInRange(spellIDOrName, unit)
    unit = unit or "target"
    
    local spellName
    if type(spellIDOrName) == "number" then
        spellName = GetSpellInfo(spellIDOrName)
    else
        spellName = spellIDOrName
    end
    
    if not spellName then return false end
    
    local inRange = IsSpellInRange(spellName, unit)
    return inRange == 1
end

-- Get spell cost (mana, rage, energy, etc.)
function BAG.SpellAPI:GetSpellCost(spellIDOrName)
    -- TBC doesn't have a direct API for this
    -- Would need to parse tooltip
    return 0
end

-- Check if player has enough resources to cast spell
function BAG.SpellAPI:CanAffordSpell(spellIDOrName)
    -- Simplified check - just check if not casting and not on cooldown
    return not self:IsCasting() and not self:IsSpellOnCooldown(spellIDOrName)
end

-- Get talent rank for a specific talent
function BAG.SpellAPI:GetTalentRank(tabIndex, talentIndex)
    local name, icon, tier, column, rank, maxRank = GetTalentInfo(tabIndex, talentIndex)
    return rank or 0, maxRank or 0
end

-- Check if a talent is learned
function BAG.SpellAPI:HasTalent(tabIndex, talentIndex, minRank)
    minRank = minRank or 1
    local rank = self:GetTalentRank(tabIndex, talentIndex)
    return rank >= minRank
end

-- Get all buffs on player
function BAG.SpellAPI:GetPlayerBuffs()
    local buffs = {}
    local i = 1
    
    while true do
        local name, rank, icon, count, debuffType, duration, expirationTime = UnitBuff("player", i)
        if not name then break end
        
        table.insert(buffs, {
            name = name,
            rank = rank,
            icon = icon,
            count = count,
            type = debuffType,
            duration = duration,
            expirationTime = expirationTime,
            index = i,
        })
        
        i = i + 1
    end
    
    return buffs
end

-- Get all debuffs on player
function BAG.SpellAPI:GetPlayerDebuffs()
    local debuffs = {}
    local i = 1
    
    while true do
        local name, rank, icon, count, debuffType, duration, expirationTime = UnitDebuff("player", i)
        if not name then break end
        
        table.insert(debuffs, {
            name = name,
            rank = rank,
            icon = icon,
            count = count,
            type = debuffType,
            duration = duration,
            expirationTime = expirationTime,
            index = i,
        })
        
        i = i + 1
    end
    
    return debuffs
end

-- Check if player has a specific buff
function BAG.SpellAPI:HasBuff(buffName)
    local buffs = self:GetPlayerBuffs()
    for _, buff in ipairs(buffs) do
        if buff.name:lower() == buffName:lower() then
            return true
        end
    end
    return false
end

-- Check if player has a specific debuff
function BAG.SpellAPI:HasDebuff(debuffName)
    local debuffs = self:GetPlayerDebuffs()
    for _, debuff in ipairs(debuffs) do
        if debuff.name:lower() == debuffName:lower() then
            return true
        end
    end
    return false
end

-- Cancel a buff
function BAG.SpellAPI:CancelBuff(buffName)
    local i = 1
    while true do
        local name = UnitBuff("player", i)
        if not name then break end
        
        if name:lower() == buffName:lower() then
            CancelUnitBuff("player", i)
            return true
        end
        
        i = i + 1
    end
    return false
end
