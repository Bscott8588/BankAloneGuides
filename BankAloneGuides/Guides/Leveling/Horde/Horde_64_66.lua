local BAG = BankAlone

BAG.Parser:Register("H-64-66-Terokkar", [[
# Title: Terokkar Forest 64-66
# Faction: Horde
# Category: Leveling
# LevelRange: 64-66
# Zones: Terokkar Forest,Shattrath City
# StartZone: Terokkar Forest
# Outland: true
step
.goto Terokkar Forest,49.2,44.0
.accept 10849
.note Check in at Stonebreaker Hold for assignments.
step
.goto Terokkar Forest,45.1,35.1
.kill Arakkoa Scouts
.note Clear the nearby arakkoa camps.
step
.goto Terokkar Forest,49.2,44.0
.turnin 10849
.note Turn in and grab follow-up work.
step
.goto Shattrath City,54.8,44.6
.note Visit Shattrath to grab flight paths and trainers.
step
.goto Terokkar Forest,37.4,51.6
.accept 10896
.note Assist the caravan with supply runs.
step
.goto Terokkar Forest,40.2,43.6
.collect 22577,6
.note Gather motes while traveling.
step
.goto Terokkar Forest,37.4,51.6
.turnin 10896
.note Turn in before moving to Nagrand.
]], { category = "Leveling", faction = "Horde", levelRange = { 64, 66 }, zones = { "Terokkar Forest", "Shattrath City" }, startZone = "Terokkar Forest", isOutland = true })

