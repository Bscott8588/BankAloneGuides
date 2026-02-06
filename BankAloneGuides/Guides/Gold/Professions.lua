local BAG = BankAlone
BAG.Engine:RegisterGuide(BAG.Parser:CreateGuide({
    id = "Gold_Professions",
    title = "Gold via Professions (TBC)",
    faction = "Both",
    steps = {
        {type = "note", text = "Best profession combos for gold:"},
        {type = "note", text = "Mining + Herbalism: Pure gathering"},
        {type = "note", text = "Enchanting: Disenchant and sell materials"},
        {type = "note", text = "Alchemy: Transmutes and potions"},
        {type = "note", text = "Jewelcrafting: Cut gems (TBC exclusive)"},
        {type = "note", text = "Tailoring: Craft bags and cloth items"}
    }
}))
