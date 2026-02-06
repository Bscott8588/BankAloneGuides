local BAG = BankAlone
BAG.Engine:RegisterGuide(BAG.Parser:CreateGuide({
    id = "Gold_Farming",
    title = "Gold Farming (TBC)",
    faction = "Both",
    steps = {
        {type = "note", text = "Best gold farming methods for TBC:"},
        {type = "note", text = "1. Daily quests in Outland (Level 70)"},
        {type = "note", text = "2. Farm Primal materials in Outland"},
        {type = "note", text = "3. Run dungeons for raw gold and items"},
        {type = "note", text = "4. Gathering professions (Mining/Herbalism)"},
        {type = "note", text = "5. Farm Primals in Elemental Plateau"}
    }
}))
print("|cff00B3FF[Bank Alone Guides]|r Gold Farming guide loaded")
