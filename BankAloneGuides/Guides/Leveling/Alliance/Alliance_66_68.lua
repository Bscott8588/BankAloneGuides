local BAG = BankAlone

BAG.Parser:Register("A-66-68-Nagrand-BladesEdge", [[
# Title: Nagrand and Blade's Edge 66-68
# Faction: Alliance
# Category: Leveling
# LevelRange: 66-68
# Zones: Nagrand,Blade's Edge Mountains
# StartZone: Nagrand
# Outland: true
step
.goto Nagrand,54.2,70.8
.accept 9910
.note Arrive at Telaar and collect hunting tasks.
step
.goto Nagrand,61.8,67.1
.kill Clefthoof Bulls
.note Clear clefthoof packs for materials.
step
.goto Nagrand,54.2,70.8
.turnin 9910
.note Return to Telaar for turn-ins.
step
.goto Nagrand,54.2,75.0
.fp
.note Grab the Telaar flight path.
step
.goto Blade's Edge Mountains,37.8,63.2
.accept 10505
.note Move to Sylvanaar for a new mission set.
step
.goto Blade's Edge Mountains,35.7,67.2
.kill Ruuan Weald Treants
.note Clear the forest edge to open the route.
step
.goto Blade's Edge Mountains,37.8,63.2
.turnin 10505
.note Turn in at Sylvanaar and prepare for Netherstorm.
]], { category = "Leveling", faction = "Alliance", levelRange = { 66, 68 }, zones = { "Nagrand", "Blade's Edge Mountains" }, startZone = "Nagrand", isOutland = true })

