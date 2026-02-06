local BAG = BankAlone

BAG.Parser:Register("A-64-66-Terokkar", [[
# Title: Terokkar Forest 64-66
# Faction: Alliance
# Category: Leveling
# LevelRange: 64-66
# Zones: Terokkar Forest,Shattrath City
# StartZone: Terokkar Forest
# Outland: true
step
.goto Terokkar Forest,56.7,53.2
.accept 10847
.note Begin in Allerian Stronghold with your field briefing.
step
.goto Terokkar Forest,50.3,44.9
.kill Arakkoa Outcasts
.note Clear the nearby nests for quick experience.
step
.goto Terokkar Forest,56.7,53.2
.turnin 10847
.note Return to the stronghold for turn-ins.
step
.goto Shattrath City,54.8,44.6
.note Visit Shattrath for flight paths and trainers.
step
.goto Terokkar Forest,37.4,51.6
.accept 10896
.note Head to the Refugee Caravan for assistance quests.
step
.goto Terokkar Forest,40.2,43.6
.collect 22577,6
.note Gather motes while moving through the forest.
step
.goto Terokkar Forest,37.4,51.6
.turnin 10896
.note Turn in and prepare for Nagrand.
]], { category = "Leveling", faction = "Alliance", levelRange = { 64, 66 }, zones = { "Terokkar Forest", "Shattrath City" }, startZone = "Terokkar Forest", isOutland = true })

