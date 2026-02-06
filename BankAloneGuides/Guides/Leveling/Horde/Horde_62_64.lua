local BAG = BankAlone

BAG.Parser:Register("H-62-64-Zangarmarsh", [[
# Title: Zangarmarsh 62-64
# Faction: Horde
# Category: Leveling
# LevelRange: 62-64
# Zones: Zangarmarsh
# StartZone: Zangarmarsh
# Outland: true
step
.goto Zangarmarsh,30.7,50.9
.accept 9728
.note Arrive at Zabra'jin and take the first quests.
step
.goto Zangarmarsh,33.8,51.2
.kill Ango'rosh Brutes
.note Clear the nearby ogre camp.
step
.goto Zangarmarsh,30.7,50.9
.turnin 9728
.note Turn in the ogre report.
step
.goto Zangarmarsh,33.1,51.1
.fp
.note Grab the Zabra'jin flight path.
step
.goto Zangarmarsh,40.9,30.6
.accept 9747
.note Head to Swamprat Post for scouting tasks.
step
.goto Zangarmarsh,41.0,33.0
.collect 2447,10
.note Gather herbs while moving between objectives.
step
.goto Zangarmarsh,40.9,30.6
.turnin 9747
.note Turn in and prepare for Terokkar.
]], { category = "Leveling", faction = "Horde", levelRange = { 62, 64 }, zones = { "Zangarmarsh" }, startZone = "Zangarmarsh", isOutland = true })

