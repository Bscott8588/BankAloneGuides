local BAG = BankAlone

BAG.Parser:Register("A-10-20-Westfall-LochModan", [[
# Title: Westfall and Loch Modan 10-20
# Faction: Alliance
# Category: Leveling
# LevelRange: 10-20
# Zones: Westfall,Loch Modan,Stormwind City
# StartZone: Westfall
step
.goto Westfall,56.3,47.5
.accept 36
.note Pick up the first Westfall assignments at Sentinel Hill.
step
.goto Westfall,53.6,33.6
.kill Defias Bandits
.collect 2589,8
.note Clear the nearby farms while gathering linen.
step
.goto Westfall,56.3,47.5
.turnin 36
.note Turn in progress and consolidate quests.
step
.goto Westfall,52.9,53.6
.fp
.note Grab the flight path for faster returns.
step
.goto Loch Modan,33.9,50.9
.accept 1339
.note Shift to Loch Modan and pick up scouting work.
step
.goto Loch Modan,34.8,46.9
.kill Tunnel Rats
.note Clear the dig site for quick experience.
step
.goto Loch Modan,33.9,50.9
.turnin 1339
.note Turn in the dig report and restock.
step
.goto Stormwind City,66.0,62.0
.vendor
.note Return to Stormwind to train and resupply.
]], { category = "Leveling", faction = "Alliance", levelRange = { 10, 20 }, zones = { "Westfall", "Loch Modan", "Stormwind City" }, startZone = "Westfall" })

