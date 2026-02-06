local BAG = BankAlone

BAG.Parser:Register("H-10-20-Barrens", [[
# Title: The Barrens 10-20
# Faction: Horde
# Category: Leveling
# LevelRange: 10-20
# Zones: The Barrens
# StartZone: The Barrens
step
.goto The Barrens,52.2,31.0
.accept 844
.note Begin at the Crossroads with the first barrens quests.
step
.goto The Barrens,51.5,32.3
.fp
.note Grab the Crossroads flight path.
step
.goto The Barrens,54.3,25.0
.kill Savannah Huntresses
.note Clear the savannah for quick experience.
step
.goto The Barrens,52.2,31.0
.turnin 844
.note Turn in the hunt report and restock.
step
.goto The Barrens,56.3,30.7
.accept 870
.note Pick up the raptor hunt.
step
.goto The Barrens,62.3,36.2
.kill Raptors
.note Collect raptor heads for the quest.
step
.goto The Barrens,56.3,30.7
.turnin 870
.note Turn in the raptor hunt.
step
.goto The Barrens,45.1,57.7
.note Travel south to Ratchet and set hearth.
]], { category = "Leveling", faction = "Horde", levelRange = { 10, 20 }, zones = { "The Barrens" }, startZone = "The Barrens" })

