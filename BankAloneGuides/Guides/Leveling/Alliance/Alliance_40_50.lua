local BAG = BankAlone

BAG.Parser:Register("A-40-50-Feralas-Tanaris", [[
# Title: Feralas and Tanaris 40-50
# Faction: Alliance
# Category: Leveling
# LevelRange: 40-50
# Zones: Feralas,Tanaris
# StartZone: Feralas
step
.goto Feralas,30.6,43.5
.accept 2970
.note Start at Feathermoon with local assignments.
step
.goto Feralas,42.4,48.7
.kill Feralas Yetis
.note Clear the hillside for quick experience.
step
.goto Feralas,30.6,43.5
.turnin 2970
.note Return to Feathermoon for rewards.
step
.goto Feralas,30.3,43.7
.fp
.note Pick up the Feathermoon flight path.
step
.goto Tanaris,52.5,28.5
.accept 5863
.note Shift to Gadgetzan and grab errands.
step
.goto Tanaris,48.5,35.1
.kill Wastewander Thieves
.note Clear the thieves camp for quick turn-ins.
step
.goto Tanaris,52.5,28.5
.turnin 5863
.note Turn in your progress and restock water.
step
.goto Tanaris,51.1,29.7
.hs
.note Hearth to reset before pushing onward.
]], { category = "Leveling", faction = "Alliance", levelRange = { 40, 50 }, zones = { "Feralas", "Tanaris" }, startZone = "Feralas" })

