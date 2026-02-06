local BAG = BankAlone
BAG.UI.Buttons = BAG.UI.Buttons or {}

local Buttons = BAG.UI.Buttons

function Buttons:Create(parent)
    local container = CreateFrame("Frame", nil, parent)
    container:SetHeight(30)
    container:SetPoint("BOTTOMLEFT", 12, 10)
    container:SetPoint("BOTTOMRIGHT", -12, 10)

    local prevButton = CreateFrame("Button", nil, container, "UIPanelButtonTemplate")
    prevButton:SetSize(70, 22)
    prevButton:SetText("Prev")
    prevButton:SetPoint("LEFT", 0, 0)
    prevButton:SetScript("OnClick", function()
        BAG.Engine:PrevStep()
    end)
    container.prevButton = prevButton

    local nextButton = CreateFrame("Button", nil, container, "UIPanelButtonTemplate")
    nextButton:SetSize(70, 22)
    nextButton:SetText("Next")
    nextButton:SetPoint("LEFT", prevButton, "RIGHT", 6, 0)
    nextButton:SetScript("OnClick", function()
        BAG.Engine:NextStep()
    end)
    container.nextButton = nextButton

    local reevaluateButton = CreateFrame("Button", nil, container, "UIPanelButtonTemplate")
    reevaluateButton:SetSize(92, 22)
    reevaluateButton:SetText("Re-evaluate")
    reevaluateButton:SetPoint("LEFT", nextButton, "RIGHT", 6, 0)
    reevaluateButton:SetScript("OnClick", function()
        BAG.Engine:Evaluate()
        BAG.UI.Animations:Pulse(container)
    end)
    container.reevaluateButton = reevaluateButton

    local optionsButton = CreateFrame("Button", nil, container, "UIPanelButtonTemplate")
    optionsButton:SetSize(70, 22)
    optionsButton:SetText("Options")
    optionsButton:SetPoint("RIGHT", 0, 0)
    optionsButton:SetScript("OnClick", function()
        BAG:Print("Options panel is coming soon.")
    end)
    container.optionsButton = optionsButton

    return container
end

