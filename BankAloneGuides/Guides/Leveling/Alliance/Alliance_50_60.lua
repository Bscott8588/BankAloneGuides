local BAG = BankAlone

BAG.Parser:Register("A-50-60-Hinterlands-Winterspring", [[
# Title: Hinterlands and Winterspring 50-60
# Faction: Alliance
# Category: Leveling
# LevelRange: 50-60
# Zones: The Hinterlands,Winterspring,Eastern Plaguelands
# StartZone: The Hinterlands
step
.goto The Hinterlands,14.2,44.8
.accept 2641
.note Begin in Aerie Peak with fieldwork tasks.
step
.goto The Hinterlands,32.0,57.4
.kill Mangy Mountain Boars
.note Clear the lower hills for quick experience.
step
.goto The Hinterlands,14.2,44.8
.turnin 2641
.note Turn in the boar report and restock.
step
.goto Eastern Plaguelands,75.6,52.0
.note Stop at Light's Hope for repairs and supplies.
step
.goto Winterspring,59.8,36.4
.accept 4861
.note Shift to Everlook for high-level assignments.
step
.goto Winterspring,62.3,38.5
.kill Winterfall Furbolgs
.note Clear furbolgs for reputation and experience.
step
.goto Winterspring,59.8,36.4
.turnin 4861
.note Return to Everlook and prepare for Outland.
step
.goto Winterspring,60.1,36.3
.fp
.note Grab the Everlook flight path before leaving.
]], { category = "Leveling", faction = "Alliance", levelRange = { 50, 60 }, zones = { "The Hinterlands", "Winterspring", "Eastern Plaguelands" }, startZone = "The Hinterlands" })

