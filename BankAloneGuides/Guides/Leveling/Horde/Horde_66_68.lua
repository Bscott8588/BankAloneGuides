local BAG = BankAlone

BAG.Parser:Register("H-66-68-Nagrand-BladesEdge", [[
# Title: Nagrand and Blade's Edge 66-68
# Faction: Horde
# Category: Leveling
# LevelRange: 66-68
# Zones: Nagrand,Blade's Edge Mountains
# StartZone: Nagrand
# Outland: true
step
.goto Nagrand,56.7,34.6
.accept 9863
.note Begin at Garadar with hunting tasks.
step
.goto Nagrand,61.8,35.8
.kill Talbuk Stags
.note Clear talbuks for quick experience.
step
.goto Nagrand,56.7,34.6
.turnin 9863
.note Return to Garadar for turn-ins.
step
.goto Nagrand,57.2,35.3
.fp
.note Grab the Garadar flight path.
step
.goto Blade's Edge Mountains,52.0,57.8
.accept 10502
.note Move to Thunderlord Stronghold for new tasks.
step
.goto Blade's Edge Mountains,57.5,52.8
.kill Gronnlings
.note Clear the nearby paths for safety.
step
.goto Blade's Edge Mountains,52.0,57.8
.turnin 10502
.note Turn in before heading to Netherstorm.
]], { category = "Leveling", faction = "Horde", levelRange = { 66, 68 }, zones = { "Nagrand", "Blade's Edge Mountains" }, startZone = "Nagrand", isOutland = true })

