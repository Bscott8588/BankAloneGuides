local BAG = BankAlone

BAG.Parser:Register("A-62-64-Zangarmarsh", [[
# Title: Zangarmarsh 62-64
# Faction: Alliance
# Category: Leveling
# LevelRange: 62-64
# Zones: Zangarmarsh
# StartZone: Zangarmarsh
# Outland: true
step
.goto Zangarmarsh,68.3,49.4
.accept 9776
.note Arrive at Cenarion Refuge and grab scouting work.
step
.goto Zangarmarsh,66.8,47.9
.kill Marshfang Rippers
.note Clear local threats along the river.
step
.goto Zangarmarsh,68.3,49.4
.turnin 9776
.note Turn in the scouting report.
step
.goto Zangarmarsh,78.4,62.1
.accept 9808
.note Head to Telredor for additional tasks.
step
.goto Zangarmarsh,79.1,63.0
.fp
.note Secure the Telredor flight path.
step
.goto Zangarmarsh,74.0,56.8
.collect 2447,10
.note Gather herbs while moving between objectives.
step
.goto Zangarmarsh,78.4,62.1
.turnin 9808
.note Return to Telredor and prepare for Terokkar.
]], { category = "Leveling", faction = "Alliance", levelRange = { 62, 64 }, zones = { "Zangarmarsh" }, startZone = "Zangarmarsh", isOutland = true })

