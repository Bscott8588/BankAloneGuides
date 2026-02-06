local BAG = BankAlone

BAG.Parser:Register("H-60-62-Hellfire", [[
# Title: Hellfire Peninsula 60-62
# Faction: Horde
# Category: Leveling
# LevelRange: 60-62
# Zones: Hellfire Peninsula
# StartZone: Hellfire Peninsula
# Outland: true
step
.goto Hellfire Peninsula,55.0,36.0
.accept 10242
.note Check in with Thrallmar for the first orders.
step
.goto Hellfire Peninsula,59.1,32.3
.kill Bonechewer Scavengers
.note Clear the road to secure the camp.
step
.goto Hellfire Peninsula,55.0,36.0
.turnin 10242
.note Turn in the report and restock.
step
.goto Hellfire Peninsula,56.8,37.8
.fp
.note Grab the Thrallmar flight path.
step
.goto Hellfire Peninsula,58.0,40.4
.accept 10388
.note Pick up the follow-up from command.
step
.goto Hellfire Peninsula,45.1,41.1
.collect 23424,6
.note Mine fel iron or buy from the market.
step
.goto Hellfire Peninsula,55.0,36.0
.turnin 10388
.note Finish the Hellfire cycle before moving on.
]], { category = "Leveling", faction = "Horde", levelRange = { 60, 62 }, zones = { "Hellfire Peninsula" }, startZone = "Hellfire Peninsula", isOutland = true })

