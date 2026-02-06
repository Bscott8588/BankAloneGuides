local BAG = BankAlone

BAG.Parser:Register("H-68-70-Netherstorm-Shadowmoon", [[
# Title: Netherstorm and Shadowmoon 68-70
# Faction: Horde
# Category: Leveling
# LevelRange: 68-70
# Zones: Netherstorm,Shadowmoon Valley
# StartZone: Netherstorm
# Outland: true
step
.goto Netherstorm,32.1,64.2
.accept 10189
.note Start in Area 52 with arcane disruption tasks.
step
.goto Netherstorm,25.8,67.6
.kill Sunfury Conjurers
.note Clear the nearby camps for quick experience.
step
.goto Netherstorm,32.1,64.2
.turnin 10189
.note Turn in progress and restock.
step
.goto Netherstorm,33.8,63.9
.fp
.note Grab the Area 52 flight path.
step
.goto Shadowmoon Valley,30.3,27.8
.accept 10645
.note Move into Shadowmoon and accept your first tasks.
step
.goto Shadowmoon Valley,28.0,38.0
.kill Infernal Attackers
.note Clear the road toward the base camp.
step
.goto Shadowmoon Valley,30.3,27.8
.turnin 10645
.note Complete the Shadowmoon opening quests.
step
.goto Shadowmoon Valley,29.5,30.2
.note Finish remaining objectives to reach level 70.
]], { category = "Leveling", faction = "Horde", levelRange = { 68, 70 }, zones = { "Netherstorm", "Shadowmoon Valley" }, startZone = "Netherstorm", isOutland = true })

