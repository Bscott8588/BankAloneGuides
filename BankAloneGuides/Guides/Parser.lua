local BAG = BankAlone
BAG.Guides = BAG.Guides or { DB = {} }
local Guides = BAG.Guides

Guides.DB = Guides.DB or {}
Guides.byId = Guides.byId or {}

function Guides:Initialize()
  self.DB = self.DB or {}
  self.byId = self.byId or {}
end

function Guides:RegisterGuide(guide)
  if not guide or not guide.id then
    return
  end
  self.byId[guide.id] = guide
  table.insert(self.DB, guide)
end

function Guides:GetGuideById(guideId)
  return self.byId and self.byId[guideId] or nil
end

local function trim(text)
  return (text:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function parseMeta(line, guide)
  local key, value = line:match("^#%s*([^:]+):%s*(.+)$")
  if not key then
    return false
  end
  key = key:lower()
  if key == "title" then
    guide.title = value
  elseif key == "faction" then
    guide.faction = value
  elseif key == "levels" then
    local min, max = value:match("(%d+)%s*%-%s*(%d+)")
    if min and max then
      guide.levelRange = { tonumber(min), tonumber(max) }
    end
  end
  return true
end

function Guides:Parse(script)
  if not script then
    return nil
  end
  local lines = {}
  if type(script) == "string" then
    for line in script:gmatch("[^\n]+") do
      table.insert(lines, line)
    end
  else
    lines = script
  end

  local guide = { steps = {} }
  local currentStep = nil

  for _, rawLine in ipairs(lines) do
    local line = trim(rawLine)
    if line == "" then
      -- skip
    elseif line:sub(1, 1) == "#" then
      if not parseMeta(line, guide) and not guide.title then
        guide.title = trim(line:sub(2))
      end
    elseif line == "step" then
      currentStep = { type = "note" }
      table.insert(guide.steps, currentStep)
    elseif currentStep then
      if line:find("^%.goto") then
        local zone, x, y = line:match("^%.goto%s+([^,]+),%s*(%d+%.?%d*),%s*(%d+%.?%d*)")
        currentStep.type = "travel"
        currentStep.zone = zone
        currentStep.x = tonumber(x)
        currentStep.y = tonumber(y)
      elseif line:find("^%.accept") then
        local questId = tonumber(line:match("^%.accept%s+(%d+)"))
        currentStep.type = "accept"
        currentStep.questId = questId
      elseif line:find("^%.turnin") then
        local questId = tonumber(line:match("^%.turnin%s+(%d+)"))
        currentStep.type = "turnin"
        currentStep.questId = questId
      elseif line:find("^%.kill") then
        currentStep.type = "kill"
        currentStep.text = trim(line:sub(6))
      elseif line:find("^%.collect") then
        local itemId, count = line:match("^%.collect%s+(%d+),%s*(%d+)")
        currentStep.type = "collect"
        currentStep.itemId = tonumber(itemId)
        currentStep.count = tonumber(count) or 1
      elseif line:find("^%.train") then
        currentStep.type = "train"
        currentStep.text = trim(line:sub(7))
      elseif line:find("^%.vendor") then
        currentStep.type = "vendor"
      elseif line:find("^%.buy") then
        local itemId, count = line:match("^%.buy%s+(%d+),%s*(%d+)")
        currentStep.type = "buy"
        currentStep.itemId = tonumber(itemId)
        currentStep.count = tonumber(count) or 1
      elseif line:find("^%.use") then
        local itemId = tonumber(line:match("^%.use%s+(%d+)"))
        currentStep.type = "use"
        currentStep.itemId = itemId
      elseif line:find("^%.equip") then
        local itemId = tonumber(line:match("^%.equip%s+(%d+)"))
        currentStep.type = "equip"
        currentStep.itemId = itemId
      elseif line:find("^%.hs") then
        currentStep.type = "hs"
      elseif line:find("^%.fly") then
        currentStep.type = "fly"
        currentStep.zone = trim(line:sub(5))
      elseif line:find("^%.fp") then
        currentStep.type = "fp"
      elseif line:find("^%.note") then
        currentStep.type = "note"
        currentStep.text = trim(line:sub(6))
      elseif line:find("^%.class") then
        currentStep.conditions = currentStep.conditions or {}
        currentStep.conditions.class = trim(line:sub(7))
      elseif line:find("^%.race") then
        currentStep.conditions = currentStep.conditions or {}
        currentStep.conditions.race = trim(line:sub(6))
      elseif line:find("^%.profession") then
        local name, skill = line:match("^%.profession%s+([^,]+),?%s*(%d*)")
        currentStep.conditions = currentStep.conditions or {}
        currentStep.conditions.profession = { name = trim(name), skill = tonumber(skill) or 1 }
      else
        currentStep.text = line
      end
    end
  end

  return guide
end
