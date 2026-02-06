local BAG = BankAlone

BAG.Parser:Register("H-58-60-BlastedLands-Outland", [[
# Title: Blasted Lands to Outland 58-60
# Faction: Horde
# Category: Leveling
# LevelRange: 58-60
# Zones: Blasted Lands,Hellfire Peninsula
# StartZone: Blasted Lands
step
.goto Blasted Lands,62.5,18.9
.note Arrive at Dreadmaul Hold and prepare for the portal.
step
.goto Blasted Lands,58.2,55.9
.accept 10119
.note Collect the portal briefing and supplies.
step
.goto Blasted Lands,58.2,55.9
.hs
.note Hearth if you need training, then return.
step
.goto Blasted Lands,58.0,55.4
.note Step through the Dark Portal into Outland.
step
.goto Hellfire Peninsula,87.4,48.2
.turnin 10119
.note Report to Thrallmar in Hellfire Peninsula.
step
.goto Hellfire Peninsula,87.4,48.2
.accept 10288
.note Grab the first Outland orders.
]], { category = "Leveling", faction = "Horde", levelRange = { 58, 60 }, zones = { "Blasted Lands", "Hellfire Peninsula" }, startZone = "Blasted Lands", isOutland = true })

