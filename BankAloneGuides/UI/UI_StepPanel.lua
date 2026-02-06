local BAG = BankAlone
BAG.UI.StepPanel = BAG.UI.StepPanel or {}

local StepPanel = BAG.UI.StepPanel

function StepPanel:Create(parent)
    local panel = CreateFrame("Frame", nil, parent)
    panel:SetPoint("TOPLEFT", 12, -46)
    panel:SetPoint("BOTTOMRIGHT", -12, 48)

    local currentTitle = panel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    BAG.UI.Styles:ApplyHeaderStyle(currentTitle)
    currentTitle:SetText("Current Step")
    currentTitle:SetPoint("TOPLEFT", 0, 0)

    local currentIcon = panel:CreateTexture(nil, "ARTWORK")
    currentIcon:SetSize(18, 18)
    currentIcon:SetPoint("TOPLEFT", currentTitle, "BOTTOMLEFT", 0, -4)
    panel.currentIcon = currentIcon

    local currentText = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    BAG.UI.Styles:ApplyBodyStyle(currentText)
    currentText:SetJustifyH("LEFT")
    currentText:SetJustifyV("TOP")
    currentText:SetPoint("TOPLEFT", currentIcon, "TOPRIGHT", 6, 2)
    currentText:SetPoint("TOPRIGHT", -10, 0)
    currentText:SetText("")
    panel.currentText = currentText

    local nextTitle = panel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    BAG.UI.Styles:ApplyHeaderStyle(nextTitle)
    nextTitle:SetText("Up Next")
    nextTitle:SetPoint("TOPLEFT", currentText, "BOTTOMLEFT", 0, -16)

    local nextIcon1 = panel:CreateTexture(nil, "ARTWORK")
    nextIcon1:SetSize(16, 16)
    nextIcon1:SetPoint("TOPLEFT", nextTitle, "BOTTOMLEFT", 0, -4)
    panel.nextIcon1 = nextIcon1

    local nextText1 = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    BAG.UI.Styles:ApplyMutedStyle(nextText1)
    nextText1:SetJustifyH("LEFT")
    nextText1:SetJustifyV("TOP")
    nextText1:SetPoint("TOPLEFT", nextIcon1, "TOPRIGHT", 6, 2)
    nextText1:SetPoint("TOPRIGHT", -10, 0)
    nextText1:SetText("")
    panel.nextText1 = nextText1

    local nextIcon2 = panel:CreateTexture(nil, "ARTWORK")
    nextIcon2:SetSize(16, 16)
    nextIcon2:SetPoint("TOPLEFT", nextText1, "BOTTOMLEFT", -22, -8)
    panel.nextIcon2 = nextIcon2

    local nextText2 = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    BAG.UI.Styles:ApplyMutedStyle(nextText2)
    nextText2:SetJustifyH("LEFT")
    nextText2:SetJustifyV("TOP")
    nextText2:SetPoint("TOPLEFT", nextIcon2, "TOPRIGHT", 6, 2)
    nextText2:SetPoint("TOPRIGHT", -10, 0)
    nextText2:SetText("")
    panel.nextText2 = nextText2

    return panel
end

function StepPanel:GetIconForStep(step)
    if not step or not step.elements or not step.elements[1] then
        return "Interface\\Icons\\INV_Misc_QuestionMark"
    end
    local stepType = step.elements[1].type
    if stepType == "accept" then
        return "Interface\\GossipFrame\\AvailableQuestIcon"
    elseif stepType == "turnin" then
        return "Interface\\GossipFrame\\ActiveQuestIcon"
    elseif stepType == "kill" then
        return "Interface\\TargetingFrame\\UI-TargetingFrame-Skull"
    elseif stepType == "collect" or stepType == "buy" then
        return "Interface\\Icons\\INV_Misc_Bag_08"
    elseif stepType == "goto" or stepType == "fly" or stepType == "fp" or stepType == "hs" then
        return "Interface\\Minimap\\Tracking\\FlightMaster"
    elseif stepType == "train" then
        return "Interface\\Icons\\INV_Misc_Book_09"
    elseif stepType == "vendor" then
        return "Interface\\Icons\\INV_Misc_Coin_02"
    end
    return "Interface\\Icons\\INV_Misc_QuestionMark"
end

function StepPanel:SetSteps(currentStep, nextSteps)
    if not currentStep then
        self.currentText:SetText("No guide loaded.")
        self.nextText1:SetText("")
        self.nextText2:SetText("")
        self.currentIcon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
        self.nextIcon1:SetTexture(nil)
        self.nextIcon2:SetTexture(nil)
        return
    end

    self.currentText:SetText(BAG.Engine:FormatStep(currentStep))
    self.currentIcon:SetTexture(self:GetIconForStep(currentStep))
    self.nextText1:SetText(nextSteps[1] and BAG.Engine:FormatStep(nextSteps[1]) or "")
    self.nextText2:SetText(nextSteps[2] and BAG.Engine:FormatStep(nextSteps[2]) or "")
    self.nextIcon1:SetTexture(nextSteps[1] and self:GetIconForStep(nextSteps[1]) or nil)
    self.nextIcon2:SetTexture(nextSteps[2] and self:GetIconForStep(nextSteps[2]) or nil)
end

