local BAG = BankAlone

BAG.Parser:Register("A-60-62-Hellfire", [[
# Title: Hellfire Peninsula 60-62
# Faction: Alliance
# Category: Leveling
# LevelRange: 60-62
# Zones: Hellfire Peninsula
# StartZone: Hellfire Peninsula
# Outland: true
step
.goto Hellfire Peninsula,56.6,66.5
.accept 10210
.note Check in with Honor Hold for field orders.
step
.goto Hellfire Peninsula,61.7,60.8
.kill Bonechewer Scouts
.note Clear the roads to secure travel.
step
.goto Hellfire Peninsula,56.6,66.5
.turnin 10210
.note Return for updates and supplies.
step
.goto Hellfire Peninsula,54.7,63.6
.fp
.note Grab the Honor Hold flight path.
step
.goto Hellfire Peninsula,52.8,67.2
.accept 10211
.note Pick up the next outpost assignment.
step
.goto Hellfire Peninsula,47.8,66.4
.collect 23424,6
.note Mine fel iron or buy from the market if needed.
step
.goto Hellfire Peninsula,54.7,63.6
.note Wrap up in Honor Hold before heading to Zangarmarsh.
]], { category = "Leveling", faction = "Alliance", levelRange = { 60, 62 }, zones = { "Hellfire Peninsula" }, startZone = "Hellfire Peninsula", isOutland = true })

