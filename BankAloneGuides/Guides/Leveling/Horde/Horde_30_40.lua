local BAG = BankAlone

BAG.Parser:Register("H-30-40-STV-Desolace", [[
# Title: Stranglethorn Vale and Desolace 30-40
# Faction: Horde
# Category: Leveling
# LevelRange: 30-40
# Zones: Stranglethorn Vale,Desolace
# StartZone: Stranglethorn Vale
step
.goto Stranglethorn Vale,32.2,29.2
.accept 581
.note Start at Grom'gol with hunting tasks.
step
.goto Stranglethorn Vale,35.6,35.8
.kill Jungle Stalkers
.note Clear the jungle edge for quick experience.
step
.goto Stranglethorn Vale,32.2,29.2
.turnin 581
.note Turn in the hunt and restock.
step
.goto Stranglethorn Vale,31.5,29.7
.fp
.note Grab the Grom'gol flight path.
step
.goto Desolace,23.0,70.2
.accept 1437
.note Shift to Shadowprey Village and grab quests.
step
.goto Desolace,29.8,64.2
.kill Gelkis Marauders
.note Clear centaur camps for quick turn-ins.
step
.goto Desolace,23.0,70.2
.turnin 1437
.note Return to the village and prepare for the next zone.
step
.goto Desolace,21.7,74.0
.note Stock up before traveling onward.
]], { category = "Leveling", faction = "Horde", levelRange = { 30, 40 }, zones = { "Stranglethorn Vale", "Desolace" }, startZone = "Stranglethorn Vale" })

