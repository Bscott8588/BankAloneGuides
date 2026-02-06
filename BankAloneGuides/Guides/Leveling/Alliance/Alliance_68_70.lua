local BAG = BankAlone

BAG.Parser:Register("A-68-70-Netherstorm-Shadowmoon", [[
# Title: Netherstorm and Shadowmoon 68-70
# Faction: Alliance
# Category: Leveling
# LevelRange: 68-70
# Zones: Netherstorm,Shadowmoon Valley
# StartZone: Netherstorm
# Outland: true
step
.goto Netherstorm,32.1,64.2
.accept 10265
.note Begin in Area 52 with tech recovery tasks.
step
.goto Netherstorm,28.2,79.6
.kill Sunfury Arcanists
.note Clear the nearby camps for quick experience.
step
.goto Netherstorm,32.1,64.2
.turnin 10265
.note Turn in progress and resupply.
step
.goto Netherstorm,33.8,63.9
.fp
.note Grab the Area 52 flight path.
step
.goto Shadowmoon Valley,37.0,58.3
.accept 10562
.note Move into Shadowmoon and pick up your first tasks.
step
.goto Shadowmoon Valley,46.6,46.8
.kill Infernal Attackers
.note Clear the valley entry points.
step
.goto Shadowmoon Valley,37.0,58.3
.turnin 10562
.note Complete the opening Shadowmoon quests.
step
.goto Shadowmoon Valley,30.3,27.8
.note Finish remaining objectives to reach level 70.
]], { category = "Leveling", faction = "Alliance", levelRange = { 68, 70 }, zones = { "Netherstorm", "Shadowmoon Valley" }, startZone = "Netherstorm", isOutland = true })

