local BAG = BankAlone

BAG.Parser:Register("A-58-60-BlastedLands-Outland", [[
# Title: Blasted Lands to Outland 58-60
# Faction: Alliance
# Category: Leveling
# LevelRange: 58-60
# Zones: Blasted Lands,Hellfire Peninsula
# StartZone: Blasted Lands
step
.goto Blasted Lands,66.0,19.0
.note Travel to Nethergarde Keep and prepare for the portal.
step
.goto Blasted Lands,58.2,55.9
.accept 10119
.note Pick up the briefing before entering the portal.
step
.goto Blasted Lands,58.2,55.9
.hs
.note Hearth if you need supplies, then return to the portal.
step
.goto Blasted Lands,58.0,55.4
.note Step through the Dark Portal into Outland.
step
.goto Hellfire Peninsula,87.4,50.7
.turnin 10119
.note Report to the forward base in Hellfire Peninsula.
step
.goto Hellfire Peninsula,87.4,50.7
.accept 10288
.note Grab the first Outland orders.
]], { category = "Leveling", faction = "Alliance", levelRange = { 58, 60 }, zones = { "Blasted Lands", "Hellfire Peninsula" }, startZone = "Blasted Lands", isOutland = true })

