local BAG = BankAlone
BAG.Parser = BAG.Parser or {}

local Parser = BAG.Parser

function BAG.Guides:Register(guide)
    if not guide or not guide.id then
        return
    end
    BAG.Guides.byId[guide.id] = guide
    table.insert(BAG.Guides.list, guide)
end

local function parseRange(value)
    if not value then
        return nil
    end
    local min, max = value:match("(%d+)%s*%-%s*(%d+)")
    if min and max then
        return { tonumber(min), tonumber(max) }
    end
    return nil
end

local function addTag(step, label, value)
    step.tags = step.tags or {}
    table.insert(step.tags, label .. ": " .. value)
end

function Parser:Parse(text, meta)
    local guide = {
        id = meta and meta.id or nil,
        title = meta and meta.title or "Untitled Guide",
        faction = meta and meta.faction or "Both",
        category = meta and meta.category or "Leveling",
        levelRange = meta and meta.levelRange or { 1, 60 },
        zones = meta and meta.zones or {},
        startZone = meta and meta.startZone or nil,
        isOutland = meta and meta.isOutland or false,
        steps = {},
    }

    local currentStep = nil
    for rawLine in string.gmatch(text, "[^\r\n]+") do
        local line = BAG.Utils:Trim(rawLine)
        if line == "" then
            goto continue
        end

        if line:sub(1, 1) == "#" then
            local key, value = line:match("^#%s*(%w+)%s*:%s*(.+)$")
            if key and value then
                if key == "Title" then
                    guide.title = value
                elseif key == "Faction" then
                    guide.faction = value
                elseif key == "Category" then
                    guide.category = value
                elseif key == "LevelRange" then
                    guide.levelRange = parseRange(value) or guide.levelRange
                elseif key == "Zones" then
                    guide.zones = BAG.Utils:ToList(value)
                elseif key == "StartZone" then
                    guide.startZone = value
                elseif key == "Id" then
                    guide.id = value
                elseif key == "Outland" then
                    guide.isOutland = string.lower(value) == "true"
                end
            end
            goto continue
        end

        if line:lower() == "step" then
            currentStep = {
                elements = {},
                textLines = {},
                conditions = {},
                completions = {},
                autoAdvance = false,
            }
            table.insert(guide.steps, currentStep)
            goto continue
        end

        if not currentStep then
            currentStep = {
                elements = {},
                textLines = {},
                conditions = {},
                completions = {},
                autoAdvance = false,
            }
            table.insert(guide.steps, currentStep)
        end

        if line:sub(1, 1) == "." then
            local directive, rest = line:match("^%.(%w+)%s*(.*)$")
            directive = directive and directive:lower() or ""
            rest = BAG.Utils:Trim(rest or "")

            if directive == "goto" then
                local zone, x, y = rest:match("^([^,]+),%s*([%d%.]+),%s*([%d%.]+)")
                if zone and x and y then
                    local element = { type = "goto", zone = zone, x = tonumber(x), y = tonumber(y) }
                    table.insert(currentStep.elements, element)
                    table.insert(currentStep.textLines, "Go to " .. zone .. " (" .. BAG.Utils:FormatCoords(element.x, element.y) .. ").")
                end
            elseif directive == "accept" then
                local questId = tonumber(rest)
                if questId then
                    table.insert(currentStep.elements, { type = "accept", questId = questId })
                    table.insert(currentStep.textLines, "Accept quest #" .. questId .. ".")
                    table.insert(currentStep.completions, { type = "questactive", id = questId })
                    currentStep.autoAdvance = true
                end
            elseif directive == "turnin" then
                local questId = tonumber(rest)
                if questId then
                    table.insert(currentStep.elements, { type = "turnin", questId = questId })
                    table.insert(currentStep.textLines, "Turn in quest #" .. questId .. ".")
                    table.insert(currentStep.completions, { type = "questcomplete", id = questId })
                    currentStep.autoAdvance = true
                end
            elseif directive == "kill" then
                local target = rest
                if target ~= "" then
                    table.insert(currentStep.elements, { type = "kill", target = target })
                    table.insert(currentStep.textLines, "Defeat " .. target .. ".")
                end
            elseif directive == "collect" then
                local itemId, count = rest:match("(%d+)%s*,%s*(%d+)")
                itemId = tonumber(itemId)
                count = tonumber(count)
                if itemId and count then
                    table.insert(currentStep.elements, { type = "collect", itemId = itemId, count = count })
                    table.insert(currentStep.textLines, "Collect " .. count .. "x item #" .. itemId .. ".")
                    table.insert(currentStep.completions, { type = "itemcount", id = itemId, count = count })
                    currentStep.autoAdvance = true
                end
            elseif directive == "train" then
                if rest ~= "" then
                    table.insert(currentStep.elements, { type = "train", skill = rest })
                    table.insert(currentStep.textLines, "Train " .. rest .. ".")
                end
            elseif directive == "vendor" then
                table.insert(currentStep.elements, { type = "vendor" })
                table.insert(currentStep.textLines, "Visit a vendor and restock.")
            elseif directive == "buy" then
                local itemId, count = rest:match("(%d+)%s*,%s*(%d+)")
                itemId = tonumber(itemId)
                count = tonumber(count)
                if itemId and count then
                    table.insert(currentStep.elements, { type = "buy", itemId = itemId, count = count })
                    table.insert(currentStep.textLines, "Buy " .. count .. "x item #" .. itemId .. ".")
                    table.insert(currentStep.completions, { type = "itemcount", id = itemId, count = count })
                    currentStep.autoAdvance = true
                end
            elseif directive == "use" then
                local itemId = tonumber(rest)
                if itemId then
                    table.insert(currentStep.elements, { type = "use", itemId = itemId })
                    table.insert(currentStep.textLines, "Use item #" .. itemId .. ".")
                end
            elseif directive == "equip" then
                local itemId = tonumber(rest)
                if itemId then
                    table.insert(currentStep.elements, { type = "equip", itemId = itemId })
                    table.insert(currentStep.textLines, "Equip item #" .. itemId .. ".")
                end
            elseif directive == "hs" then
                table.insert(currentStep.elements, { type = "hs" })
                table.insert(currentStep.textLines, "Hearth to your home inn.")
            elseif directive == "fly" then
                table.insert(currentStep.elements, { type = "fly", zone = rest })
                table.insert(currentStep.textLines, "Fly to " .. rest .. ".")
            elseif directive == "fp" then
                table.insert(currentStep.elements, { type = "fp" })
                table.insert(currentStep.textLines, "Pick up the flight path.")
            elseif directive == "note" then
                table.insert(currentStep.elements, { type = "note", text = rest })
                table.insert(currentStep.textLines, rest)
            elseif directive == "class" then
                local classes = BAG.Utils:ToList(rest)
                table.insert(currentStep.conditions, { type = "class", values = classes })
                addTag(currentStep, "Class", rest)
            elseif directive == "race" then
                local races = BAG.Utils:ToList(rest)
                table.insert(currentStep.conditions, { type = "race", values = races })
                addTag(currentStep, "Race", rest)
            elseif directive == "profession" then
                local name, skill = rest:match("^([^,]+),%s*(%d+)")
                if not name and rest ~= "" then
                    name = rest
                end
                if name then
                    table.insert(currentStep.conditions, { type = "profession", name = BAG.Utils:Trim(name), skill = tonumber(skill) })
                    if skill then
                        addTag(currentStep, "Prof", BAG.Utils:Trim(name) .. " " .. skill)
                    else
                        addTag(currentStep, "Prof", BAG.Utils:Trim(name))
                    end
                end
            end
        end

        ::continue::
    end

    return guide
end

function Parser:Register(id, text, meta)
    meta = meta or {}
    meta.id = id
    local guide = self:Parse(text, meta)
    BAG.Guides:Register(guide)
end

