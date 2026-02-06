local BAG = BankAlone

BAG.Parser:Register("A-20-30-Redridge-Duskwood", [[
# Title: Redridge and Duskwood 20-30
# Faction: Alliance
# Category: Leveling
# LevelRange: 20-30
# Zones: Redridge Mountains,Duskwood
# StartZone: Redridge Mountains
step
.goto Redridge Mountains,30.6,59.4
.accept 244
.note Speak with Marshal Marris for initial tasks.
step
.goto Redridge Mountains,33.0,48.0
.kill Redridge Brutes
.note Thin the gnoll camps near the bridge.
step
.goto Redridge Mountains,30.6,59.4
.turnin 244
.note Turn in the report and pick up follow-ups.
step
.goto Redridge Mountains,21.8,46.3
.fp
.note Acquire the Lakeshire flight path.
step
.goto Duskwood,73.6,46.8
.accept 173
.note Head to Darkshire and gather new leads.
step
.goto Duskwood,77.2,36.2
.kill Nightbane Shadow Weavers
.note Clear the cemetery for quick progress.
step
.goto Duskwood,73.6,46.8
.turnin 173
.note Turn in the cemetery assignment.
step
.goto Duskwood,75.0,48.0
.hs
.note Hearth to reset and train before moving on.
]], { category = "Leveling", faction = "Alliance", levelRange = { 20, 30 }, zones = { "Redridge Mountains", "Duskwood" }, startZone = "Redridge Mountains" })

