local BAG = BankAlone

BAG.Parser:Register("H-40-50-Tanaris-Feralas", [[
# Title: Tanaris and Feralas 40-50
# Faction: Horde
# Category: Leveling
# LevelRange: 40-50
# Zones: Tanaris,Feralas
# StartZone: Tanaris
step
.goto Tanaris,52.6,27.0
.accept 5863
.note Begin in Gadgetzan with desert assignments.
step
.goto Tanaris,48.5,35.1
.kill Wastewander Thieves
.note Clear the thieves camp for fast turn-ins.
step
.goto Tanaris,52.6,27.0
.turnin 5863
.note Return to Gadgetzan and regroup.
step
.goto Tanaris,51.1,29.7
.fp
.note Grab the Gadgetzan flight path.
step
.goto Feralas,74.7,42.9
.accept 2973
.note Travel to Camp Mojache for new quests.
step
.goto Feralas,72.4,55.5
.kill Gordunni Ogres
.note Clear the ogre camps near the plateau.
step
.goto Feralas,74.7,42.9
.turnin 2973
.note Turn in and prepare for the next zone.
step
.goto Feralas,75.5,44.3
.note Restock supplies and train if needed.
]], { category = "Leveling", faction = "Horde", levelRange = { 40, 50 }, zones = { "Tanaris", "Feralas" }, startZone = "Tanaris" })

