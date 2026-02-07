local BAG = BankAlone
local UI = BAG.UI
UI.StepPanel = UI.StepPanel or {}
local StepPanel = UI.StepPanel
local Styles = UI.Styles
local Layout = Styles.layout

local iconMap = {
  accept = "Interface\\Icons\\INV_Scroll_03",
  turnin = "Interface\\Icons\\INV_Scroll_06",
  kill = "Interface\\Icons\\INV_Sword_04",
  collect = "Interface\\Icons\\INV_Misc_Bag_10",
  travel = "Interface\\Icons\\INV_Misc_Map_01",
  note = "Interface\\Icons\\INV_Misc_QuestionMark",
  train = "Interface\\Icons\\INV_Misc_Book_11",
  vendor = "Interface\\Icons\\INV_Misc_Coin_01",
  buy = "Interface\\Icons\\INV_Misc_Coin_02",
  use = "Interface\\Icons\\INV_Misc_QuestionMark",
  equip = "Interface\\Icons\\INV_Chest_Cloth_17",
  hs = "Interface\\Icons\\INV_Misc_Rune_01",
  fly = "Interface\\Icons\\Ability_Mount_Wyvern_01",
  fp = "Interface\\Icons\\Ability_Mount_WhiteTiger",
}

function StepPanel:Initialize(parent)
  if self.frame then
    return
  end
  local frame = CreateFrame("Frame", nil, parent.content)
  frame:SetAllPoints(parent.content)

  self.lines = {}
  for i = 1, Layout.stepCount do
    local line = CreateFrame("Frame", nil, frame)
    line:SetHeight(Layout.stepLineHeight)
    line:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, -((i - 1) * (Layout.stepLineHeight + Layout.spacing)))
    line:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, -((i - 1) * (Layout.stepLineHeight + Layout.spacing)))

    local bg = line:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(line)
    bg:SetColorTexture(0.04, 0.07, 0.11, 0.65)
    line.bg = bg

    local icon = line:CreateTexture(nil, "ARTWORK")
    icon:SetSize(18, 18)
    icon:SetPoint("LEFT", line, "LEFT", 2, 0)
    line.icon = icon

    local text = line:CreateFontString(nil, "OVERLAY")
    text:SetFont(Styles.fonts.body, 12)
    text:SetTextColor(Styles.colors.text.r, Styles.colors.text.g, Styles.colors.text.b)
    text:SetPoint("LEFT", icon, "RIGHT", 6, 0)
    text:SetPoint("RIGHT", line, "RIGHT", -60, 0)
    text:SetJustifyH("LEFT")
    line.text = text

    local tags = line:CreateFontString(nil, "OVERLAY")
    tags:SetFont(Styles.fonts.body, 9)
    tags:SetTextColor(Styles.colors.muted.r, Styles.colors.muted.g, Styles.colors.muted.b)
    tags:SetPoint("RIGHT", line, "RIGHT", 0, 0)
    tags:SetJustifyH("RIGHT")
    line.tags = tags

    self.lines[i] = line
  end

  self.frame = frame
end

function StepPanel:BuildTags(step)
  if not step or not step.conditions then
    return ""
  end
  local tags = {}
  if step.conditions.class then
    table.insert(tags, step.conditions.class)
  end
  if step.conditions.race then
    table.insert(tags, step.conditions.race)
  end
  if step.conditions.profession then
    local name = step.conditions.profession.name or step.conditions.profession
    table.insert(tags, name)
  end
  if step.conditions.level then
    table.insert(tags, "Level " .. tostring(step.conditions.level))
  end
  return table.concat(tags, " | ")
end

function StepPanel:Update()
  if not self.frame then
    return
  end
  local steps = BAG.Engine:GetUpcomingSteps(Layout.stepCount)
  for i = 1, Layout.stepCount do
    local line = self.lines[i]
    local step = steps[i]
    if step then
      local icon = iconMap[step.type or "note"] or iconMap.note
      line.icon:SetTexture(icon)
      local prefix = (i == 1) and ">> " or "   "
      line.text:SetText(prefix .. BAG.Utils:BuildStepText(step))
      line.tags:SetText(self:BuildTags(step))

      if i == 1 then
        line.bg:SetColorTexture(0.08, 0.2, 0.35, 0.9)
        line.text:SetTextColor(Styles.colors.primary.r, Styles.colors.primary.g, Styles.colors.primary.b)
      else
        line.bg:SetColorTexture(0.04, 0.07, 0.11, 0.65)
        line.text:SetTextColor(Styles.colors.text.r, Styles.colors.text.g, Styles.colors.text.b)
      end
      line:Show()
    else
      line.text:SetText("")
      line.tags:SetText("")
      line.icon:SetTexture(nil)
      line:Hide()
    end
  end
end
