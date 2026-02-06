local BAG = BankAlone

BAG.Parser:Register("H-20-30-Stonetalon-Ashenvale", [[
# Title: Stonetalon and Ashenvale 20-30
# Faction: Horde
# Category: Leveling
# LevelRange: 20-30
# Zones: Stonetalon Mountains,Ashenvale
# StartZone: Stonetalon Mountains
step
.goto Stonetalon Mountains,47.4,62.6
.accept 1093
.note Start at Sun Rock Retreat with a new briefing.
step
.goto Stonetalon Mountains,52.7,46.6
.kill Venture Co. Loggers
.note Disrupt the nearby logging camp.
step
.goto Stonetalon Mountains,47.4,62.6
.turnin 1093
.note Return for turn-ins and repairs.
step
.goto Stonetalon Mountains,45.1,51.5
.fp
.note Grab the Sun Rock flight path.
step
.goto Ashenvale,12.2,33.8
.accept 1010
.note Move into Ashenvale for additional quests.
step
.goto Ashenvale,12.2,34.2
.kill Nightsaber Stalkers
.note Clear the roads around the outpost.
step
.goto Ashenvale,12.2,33.8
.turnin 1010
.note Turn in and prepare for the next zone.
step
.goto Ashenvale,73.2,61.6
.note Travel toward the next leveling hub.
]], { category = "Leveling", faction = "Horde", levelRange = { 20, 30 }, zones = { "Stonetalon Mountains", "Ashenvale" }, startZone = "Stonetalon Mountains" })

