local BAG = BankAlone
BAG.API.Spell = BAG.API.Spell or {}
local Spell = BAG.API.Spell

function Spell:HasSpell(spellIdOrName)
  if not spellIdOrName then
    return false
  end
  if type(spellIdOrName) == "number" then
    return IsPlayerSpell(spellIdOrName)
  end
  local spellName = spellIdOrName
  return IsSpellKnown(spellName) or IsPlayerSpell(spellName)
end

function Spell:GetSpellCooldown(spellIdOrName)
  if not spellIdOrName then
    return 0, 0
  end
  local start, duration = GetSpellCooldown(spellIdOrName)
  return start or 0, duration or 0
end
