local BAG = BankAlone

BAG.Parser:Register("H-1-10-Durotar", [[
# Title: Durotar 1-10
# Faction: Horde
# Category: Leveling
# LevelRange: 1-10
# Zones: Durotar,Orgrimmar
# StartZone: Durotar
step
.goto Durotar,42.1,68.4
.accept 788
.note Check in with the canyon guide for your first task.
step
.goto Durotar,43.7,62.6
.kill Mottled Boars
.note Clear boars near the trail.
step
.goto Durotar,42.1,68.4
.turnin 788
.note Turn in and pick up follow-up work.
step
.goto Durotar,51.9,43.5
.accept 790
.note Move to Razor Hill for more assignments.
step
.goto Durotar,52.2,43.9
.fp
.note Grab the Razor Hill flight path.
step
.goto Durotar,57.4,58.0
.collect 2589,6
.note Gather linen while clearing nearby camps.
]], { category = "Leveling", faction = "Horde", levelRange = { 1, 10 }, zones = { "Durotar", "Orgrimmar" }, startZone = "Durotar" })

BAG.Parser:Register("H-1-10-Mulgore", [[
# Title: Mulgore 1-10
# Faction: Horde
# Category: Leveling
# LevelRange: 1-10
# Zones: Mulgore,Thunder Bluff
# StartZone: Mulgore
step
.goto Mulgore,44.9,77.0
.accept 747
.note Speak with the camp elder for your first hunt.
step
.goto Mulgore,50.0,81.1
.kill Plainstriders
.note Clear the nearby plains for quick experience.
step
.goto Mulgore,44.9,77.0
.turnin 747
.note Turn in and grab the follow-up.
step
.goto Mulgore,47.8,55.8
.accept 750
.note Head to Bloodhoof Village for new tasks.
step
.goto Mulgore,47.5,58.7
.fp
.note Grab the Bloodhoof flight path.
step
.goto Mulgore,52.2,59.6
.collect 2318,4
.note Gather light leather while leveling.
]], { category = "Leveling", faction = "Horde", levelRange = { 1, 10 }, zones = { "Mulgore", "Thunder Bluff" }, startZone = "Mulgore" })

BAG.Parser:Register("H-1-10-Tirisfal", [[
# Title: Tirisfal Glades 1-10
# Faction: Horde
# Category: Leveling
# LevelRange: 1-10
# Zones: Tirisfal Glades,Undercity
# StartZone: Tirisfal Glades
step
.goto Tirisfal Glades,61.7,51.4
.accept 249
.note Receive your first assignment in Deathknell.
step
.goto Tirisfal Glades,58.6,50.8
.kill Mindless Zombies
.note Clear the graveyard edge.
step
.goto Tirisfal Glades,61.7,51.4
.turnin 249
.note Return for your next instructions.
step
.goto Tirisfal Glades,59.4,38.9
.accept 354
.note Travel to Brill and pick up new quests.
step
.goto Tirisfal Glades,60.1,52.7
.fp
.note Grab the Brill flight path.
step
.goto Tirisfal Glades,54.7,46.3
.collect 2589,6
.note Gather linen from nearby undead.
]], { category = "Leveling", faction = "Horde", levelRange = { 1, 10 }, zones = { "Tirisfal Glades", "Undercity" }, startZone = "Tirisfal Glades" })

BAG.Parser:Register("H-1-10-Eversong", [[
# Title: Eversong Woods 1-10
# Faction: Horde
# Category: Leveling
# LevelRange: 1-10
# Zones: Eversong Woods,Silvermoon City
# StartZone: Eversong Woods
step
.goto Eversong Woods,38.1,21.0
.accept 8325
.note Check in at the lodge for opening tasks.
step
.goto Eversong Woods,35.3,23.5
.kill Mana Wyrms
.note Clear the glade to stabilize the area.
step
.goto Eversong Woods,38.1,21.0
.turnin 8325
.note Return for follow-up instructions.
step
.goto Eversong Woods,44.9,32.5
.accept 8330
.note Move toward Falconwing Square for new tasks.
step
.goto Eversong Woods,45.4,30.5
.fp
.note Grab the flight path for later travel.
step
.goto Eversong Woods,46.4,28.4
.collect 2447,6
.note Gather herbs along the roads.
]], { category = "Leveling", faction = "Horde", levelRange = { 1, 10 }, zones = { "Eversong Woods", "Silvermoon City" }, startZone = "Eversong Woods" })

