local BAG = BankAlone

BAG.Parser:Register("H-50-60-Winterspring-EPL", [[
# Title: Winterspring and Eastern Plaguelands 50-60
# Faction: Horde
# Category: Leveling
# LevelRange: 50-60
# Zones: Winterspring,Eastern Plaguelands
# StartZone: Winterspring
step
.goto Winterspring,59.8,36.4
.accept 4861
.note Begin in Everlook with initial errands.
step
.goto Winterspring,62.3,38.5
.kill Winterfall Furbolgs
.note Clear furbolg camps for fast progress.
step
.goto Winterspring,59.8,36.4
.turnin 4861
.note Turn in and restock supplies.
step
.goto Winterspring,60.1,36.3
.fp
.note Secure the Everlook flight path.
step
.goto Eastern Plaguelands,75.7,53.4
.note Travel to Light's Hope for repairs and buffs.
step
.goto Eastern Plaguelands,70.1,49.7
.kill Plaguehounds
.note Clear the road patrols for experience.
step
.goto Eastern Plaguelands,75.7,53.4
.note Turn in tasks and prepare for Outland.
step
.goto Eastern Plaguelands,75.7,53.4
.hs
.note Hearth to handle training before the portal run.
]], { category = "Leveling", faction = "Horde", levelRange = { 50, 60 }, zones = { "Winterspring", "Eastern Plaguelands" }, startZone = "Winterspring" })

