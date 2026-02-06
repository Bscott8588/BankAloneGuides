local BAG = BankAlone

BAG.Parser:Register("G-Mote-Farm-Outland", [[
# Title: Outland Elemental Mote Circuit
# Faction: Both
# Category: Gold
# LevelRange: 60-70
# Zones: Nagrand,Shadowmoon Valley
step
.note Focus on elemental motes for steady gold.
step
.goto Nagrand,72.0,70.5
.kill Air Elementals
.collect 22577,10
.note Farm air elementals for motes.
step
.goto Shadowmoon Valley,46.4,44.0
.kill Shadow Revenants
.collect 22577,10
.note Rotate to shadow elementals for extra motes.
step
.note Sell motes in stacks or convert to primals.
]], { category = "Gold", faction = "Both", levelRange = { 60, 70 }, zones = { "Nagrand", "Shadowmoon Valley" } })

BAG.Parser:Register("G-Herb-Route-Outland", [[
# Title: Outland Herbalism Loop
# Faction: Both
# Category: Gold
# LevelRange: 60-70
# Zones: Zangarmarsh,Terokkar Forest
step
.note Use a mounted herb loop for steady income.
step
.goto Zangarmarsh,80.2,46.4
.note Loop the outer ring for felweed and dreamfoil.
step
.goto Terokkar Forest,49.2,28.0
.note Sweep the forest edge for terocone and mana thistle.
step
.note Mail herbs to a bank alt for auction sales.
]], { category = "Gold", faction = "Both", levelRange = { 60, 70 }, zones = { "Zangarmarsh", "Terokkar Forest" } })

BAG.Parser:Register("G-Dungeon-Farm-SlavePens", [[
# Title: Slave Pens Quick Runs
# Faction: Both
# Category: Gold
# LevelRange: 60-70
# Zones: Zangarmarsh
step
.note Run Slave Pens for cloth, greens, and reputation.
step
.goto Zangarmarsh,50.4,40.9
.note Enter the Coilfang Reservoir and queue a run.
step
.note Focus on fast clears and vendor trash for gold.
step
.note Disenchant or auction greens for extra profit.
]], { category = "Gold", faction = "Both", levelRange = { 60, 70 }, zones = { "Zangarmarsh" } })

BAG.Parser:Register("G-Classic-Mats", [[
# Title: Classic Materials Cash-In
# Faction: Both
# Category: Gold
# LevelRange: 30-60
# Zones: Stranglethorn Vale,Winterspring
step
.note Farm classic materials that still sell well.
step
.goto Stranglethorn Vale,35.2,10.2
.kill Jungle Stalkers
.collect 2318,12
.note Farm leather while leveling alts or pets.
step
.goto Winterspring,66.2,34.2
.note Farm high-level cloth and vendor trash.
step
.note Sell materials in stacks and keep an eye on demand.
]], { category = "Gold", faction = "Both", levelRange = { 30, 60 }, zones = { "Stranglethorn Vale", "Winterspring" } })

