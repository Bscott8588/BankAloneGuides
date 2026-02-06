local BAG = BankAlone
BAG.API.SpellAPI = BAG.API.SpellAPI or {}

local SpellAPI = BAG.API.SpellAPI

function SpellAPI:HasSpell(spell)
    if not spell then
        return false
    end
    if type(spell) == "number" then
        return IsSpellKnown(spell)
    end
    local name = spell
    return IsSpellKnown(name)
end

function SpellAPI:GetSpellCooldown(spell)
    if not spell then
        return 0, 0
    end
    local start, duration, enabled = GetSpellCooldown(spell)
    return start or 0, duration or 0, enabled or 0
end

