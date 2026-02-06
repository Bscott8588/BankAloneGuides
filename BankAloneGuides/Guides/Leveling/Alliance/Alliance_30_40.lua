local BAG = BankAlone

BAG.Parser:Register("A-30-40-STV-Desolace", [[
# Title: Stranglethorn Vale and Desolace 30-40
# Faction: Alliance
# Category: Leveling
# LevelRange: 30-40
# Zones: Stranglethorn Vale,Desolace
# StartZone: Stranglethorn Vale
step
.goto Stranglethorn Vale,27.0,77.2
.accept 185
.note Begin in Booty Bay with the first hunter tasks.
step
.goto Stranglethorn Vale,30.0,63.0
.kill Jungle Stalkers
.note Work the jungle edges for fast kills.
step
.goto Stranglethorn Vale,27.0,77.2
.turnin 185
.note Turn in your hunting credit.
step
.goto Stranglethorn Vale,28.3,76.3
.fp
.note Pick up the Booty Bay flight path.
step
.goto Desolace,66.2,10.8
.accept 1437
.note Shift to Nijel's Point for new quests.
step
.goto Desolace,72.0,23.2
.kill Gelkis Marauders
.note Clear the nearby centaur patrols.
step
.goto Desolace,66.2,10.8
.turnin 1437
.note Return for rewards and restock.
step
.goto Desolace,51.3,53.5
.note Travel south toward the next zone.
]], { category = "Leveling", faction = "Alliance", levelRange = { 30, 40 }, zones = { "Stranglethorn Vale", "Desolace" }, startZone = "Stranglethorn Vale" })

