local BAG = BankAlone
BAG.Engine:RegisterGuide(BAG.Parser:CreateGuide({
    id = "Gold_Dungeons",
    title = "Gold from Dungeons (TBC)",
    faction = "Both",
    steps = {
        {type = "note", text = "Best dungeons for gold farming:"},
        {type = "note", text = "Slave Pens: Fast clears, good drops"},
        {type = "note", text = "Shadow Labyrinth: Good gold per hour"},
        {type = "note", text = "Shattered Halls: Excellent for AoE farming"},
        {type = "note", text = "Stratholme: Classic gold farm still viable"}
    }
}))
