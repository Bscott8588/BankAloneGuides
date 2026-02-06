local addonName, BAG = ...
BAG.Guides.Professions.Skinning = {
    title = "Skinning 1-375",
    faction = "Both",
    profession = "Skinning",
    steps = {
        BAG.Parser:Note("Skinning is easy to level while questing!"),
        BAG.Parser:Train("Skinning Apprentice"),
        BAG.Parser:Buy(7005, 1, "Buy a Skinning Knife"),
        BAG.Parser:Note("Skin any beast you kill while leveling"),
    },
}
