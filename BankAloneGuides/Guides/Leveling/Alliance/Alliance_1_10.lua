local BAG = BankAlone

BAG.Parser:Register("A-1-10-Elwynn", [[
# Title: Elwynn Forest 1-10
# Faction: Alliance
# Category: Leveling
# LevelRange: 1-10
# Zones: Elwynn Forest,Stormwind City
# StartZone: Elwynn Forest
step
.goto Elwynn Forest,48.2,42.9
.accept 783
.note Report to the abbey and pick up your first assignment.
step
.goto Elwynn Forest,48.9,41.6
.accept 7
.note Get the cleanup task from the deputy.
step
.goto Elwynn Forest,50.2,38.3
.kill Kobold Workers
.collect 2589,6
.note Clear the mine entrance while collecting linen.
step
.goto Elwynn Forest,48.9,41.6
.turnin 7
.note Turn in the cleanup quest before moving on.
step
.goto Elwynn Forest,48.2,42.9
.turnin 783
.accept 15
.note Chain into the follow-up and restock.
step
.goto Elwynn Forest,43.3,65.7
.note Head toward Goldshire and set your hearth.
]], { category = "Leveling", faction = "Alliance", levelRange = { 1, 10 }, zones = { "Elwynn Forest", "Stormwind City" }, startZone = "Elwynn Forest" })

BAG.Parser:Register("A-1-10-DunMorogh", [[
# Title: Dun Morogh 1-10
# Faction: Alliance
# Category: Leveling
# LevelRange: 1-10
# Zones: Dun Morogh,Ironforge
# StartZone: Dun Morogh
step
.goto Dun Morogh,29.9,71.3
.accept 179
.note Meet the Coldridge mentor and grab supplies.
step
.goto Dun Morogh,29.2,67.5
.vendor
.note Check vendor stock for starter bags.
step
.goto Dun Morogh,24.9,69.2
.kill Rockjaw Troggs
.collect 2589,4
.note Clear troggs and gather linen.
step
.goto Dun Morogh,29.9,71.3
.turnin 179
.note Return for credit and new tasks.
step
.goto Dun Morogh,46.7,52.0
.note Move toward Kharanos and set your hearth.
step
.goto Dun Morogh,53.9,52.7
.fp
.note Grab the flight path for future travel.
]], { category = "Leveling", faction = "Alliance", levelRange = { 1, 10 }, zones = { "Dun Morogh", "Ironforge" }, startZone = "Dun Morogh" })

BAG.Parser:Register("A-1-10-Teldrassil", [[
# Title: Teldrassil 1-10
# Faction: Alliance
# Category: Leveling
# LevelRange: 1-10
# Zones: Teldrassil,Darnassus
# StartZone: Teldrassil
step
.goto Teldrassil,59.5,44.8
.accept 456
.note Check in with the grove for your opening task.
step
.goto Teldrassil,60.8,42.1
.kill Grells
.note Push back the nearby grells.
step
.goto Teldrassil,59.5,44.8
.turnin 456
.note Return to the grove for your reward.
step
.goto Teldrassil,57.9,45.1
.accept 458
.note Take the next forest balance assignment.
step
.goto Teldrassil,54.6,47.7
.collect 2589,4
.note Gather linen drops from the wildlife while questing.
step
.goto Teldrassil,55.7,47.4
.note Travel to Dolanaar and set your hearth.
]], { category = "Leveling", faction = "Alliance", levelRange = { 1, 10 }, zones = { "Teldrassil", "Darnassus" }, startZone = "Teldrassil" })

BAG.Parser:Register("A-1-10-Azuremyst", [[
# Title: Azuremyst Isle 1-10
# Faction: Alliance
# Category: Leveling
# LevelRange: 1-10
# Zones: Azuremyst Isle,The Exodar
# StartZone: Azuremyst Isle
step
.goto Azuremyst Isle,58.4,54.0
.accept 9279
.note Speak with the scout for your first mission.
step
.goto Azuremyst Isle,57.6,49.9
.kill Mutated Root Lasher
.note Clear corrupted creatures near the crash site.
step
.goto Azuremyst Isle,58.4,54.0
.turnin 9279
.note Report back for the next lead.
step
.goto Azuremyst Isle,56.9,53.7
.accept 9280
.note Accept the follow-up investigation.
step
.goto Azuremyst Isle,54.4,51.2
.collect 2447,6
.note Gather peacebloom along the path.
step
.goto Azuremyst Isle,48.4,49.2
.fp
.note Pick up the Azure Watch flight path.
]], { category = "Leveling", faction = "Alliance", levelRange = { 1, 10 }, zones = { "Azuremyst Isle", "The Exodar" }, startZone = "Azuremyst Isle" })

