local BAG = BankAlone

BAG.Parser:Register("P-Mining-1-375", [[
# Title: Mining 1-375 (TBC Classic)
# Faction: Both
# Category: Profession
# LevelRange: 1-375
# Zones: Dun Morogh,The Barrens,Hellfire Peninsula
step
.train Mining
.note Train Mining in your capital city before gathering.
step
.note Mine copper in starter zones until skill 65.
.collect 2770,20
step
.note Move to The Barrens or Loch Modan and mine tin to 125.
step
.note Smelt bronze and mine iron in mid zones to 175.
step
.note Transition to mithril and thorium in higher zones to 300.
step
.note Head to Hellfire Peninsula and mine fel iron to 375.
.collect 23424,20
]], { category = "Profession", faction = "Both", levelRange = { 1, 375 }, zones = { "Dun Morogh", "The Barrens", "Hellfire Peninsula" } })

BAG.Parser:Register("P-Herbalism-1-375", [[
# Title: Herbalism 1-375 (TBC Classic)
# Faction: Both
# Category: Profession
# LevelRange: 1-375
# Zones: Elwynn Forest,Westfall,Terokkar Forest
step
.train Herbalism
.note Learn Herbalism and grab a herb pouch if possible.
step
.note Gather peacebloom and silverleaf to 70 in starter zones.
.collect 2447,20
step
.note Move to Westfall or The Barrens for briarthorn to 150.
step
.note Gather kingsblood and liferoot to 225 in mid zones.
step
.note Farm dreamfoil and plaguebloom to reach 300.
step
.note In Outland, gather felweed and terocone to 375.
]], { category = "Profession", faction = "Both", levelRange = { 1, 375 }, zones = { "Elwynn Forest", "Westfall", "Terokkar Forest" } })

BAG.Parser:Register("P-Skinning-1-375", [[
# Title: Skinning 1-375 (TBC Classic)
# Faction: Both
# Category: Profession
# LevelRange: 1-375
# Zones: Mulgore,Stranglethorn Vale,Nagrand
step
.train Skinning
.note Train Skinning and purchase a skinning knife.
step
.note Skin beasts in starter zones to 100.
.collect 2318,20
step
.note Move to Stranglethorn Vale for medium and heavy leather to 200.
step
.note Continue with thick leather in higher zones to 300.
step
.note In Outland, skin clefthoofs and talbuks to 375.
]], { category = "Profession", faction = "Both", levelRange = { 1, 375 }, zones = { "Mulgore", "Stranglethorn Vale", "Nagrand" } })

BAG.Parser:Register("P-Blacksmithing-1-375", [[
# Title: Blacksmithing 1-375 (TBC Classic)
# Faction: Both
# Category: Profession
# LevelRange: 1-375
# Zones: Stormwind City,Orgrimmar,Hellfire Peninsula
step
.train Blacksmithing
.note Train Blacksmithing and stock up on mining supplies.
step
.note Craft rough grinding stones and copper items to 75.
step
.note Use bronze and iron recipes to reach 150.
step
.note Craft steel and mithril gear to 250.
step
.note Push thorium and arcanite crafts to 300.
step
.note Learn Outland plans and craft fel iron items to 375.
]], { category = "Profession", faction = "Both", levelRange = { 1, 375 }, zones = { "Stormwind City", "Orgrimmar", "Hellfire Peninsula" } })

BAG.Parser:Register("P-Engineering-1-375", [[
# Title: Engineering 1-375 (TBC Classic)
# Faction: Both
# Category: Profession
# LevelRange: 1-375
# Zones: Ironforge,Orgrimmar,Netherstorm
step
.train Engineering
.note Train Engineering and gather copper bars.
step
.note Craft rough blasting powder to 75.
step
.note Use bronze tubes and iron grenades to 150.
step
.note Craft mithril casings and gadgets to 250.
step
.note Push thorium widgets to 300.
step
.note Learn Outland schematics and craft fel iron bombs to 375.
]], { category = "Profession", faction = "Both", levelRange = { 1, 375 }, zones = { "Ironforge", "Orgrimmar", "Netherstorm" } })

BAG.Parser:Register("P-Leatherworking-1-375", [[
# Title: Leatherworking 1-375 (TBC Classic)
# Faction: Both
# Category: Profession
# LevelRange: 1-375
# Zones: Thunder Bluff,Stranglethorn Vale,Nagrand
step
.train Leatherworking
.note Train Leatherworking and stock up on light leather.
step
.note Craft light armor kits to 100.
step
.note Use medium and heavy leather to reach 200.
step
.note Craft thick and rugged gear to 300.
step
.note Learn Outland patterns and craft fel leather items to 375.
]], { category = "Profession", faction = "Both", levelRange = { 1, 375 }, zones = { "Thunder Bluff", "Stranglethorn Vale", "Nagrand" } })

BAG.Parser:Register("P-Tailoring-1-375", [[
# Title: Tailoring 1-375 (TBC Classic)
# Faction: Both
# Category: Profession
# LevelRange: 1-375
# Zones: Stormwind City,Undercity,Netherstorm
step
.train Tailoring
.note Train Tailoring and gather linen cloth.
step
.note Craft linen bolts and bags to 75.
step
.note Use wool and silk to reach 175.
step
.note Craft mageweave and runecloth items to 300.
step
.note In Outland, craft netherweave items to 375.
]], { category = "Profession", faction = "Both", levelRange = { 1, 375 }, zones = { "Stormwind City", "Undercity", "Netherstorm" } })

BAG.Parser:Register("P-Enchanting-1-375", [[
# Title: Enchanting 1-375 (TBC Classic)
# Faction: Both
# Category: Profession
# LevelRange: 1-375
# Zones: Stormwind City,Shattrath City
step
.train Enchanting
.note Train Enchanting and gather dusts from unwanted gear.
step
.note Craft minor weapon enchants to 75.
step
.note Use bracer enchants to reach 150.
step
.note Push through mid-range enchants to 250.
step
.note Craft runecloth and brilliant enchants to 300.
step
.note Learn Outland formulas in Shattrath to reach 375.
]], { category = "Profession", faction = "Both", levelRange = { 1, 375 }, zones = { "Stormwind City", "Shattrath City" } })

BAG.Parser:Register("P-Alchemy-1-375", [[
# Title: Alchemy 1-375 (TBC Classic)
# Faction: Both
# Category: Profession
# LevelRange: 1-375
# Zones: Stormwind City,Undercity,Hellfire Peninsula
step
.train Alchemy
.note Train Alchemy and keep a steady herb supply.
step
.note Brew minor healing potions to 60.
step
.note Use swiftness and mana potions to 150.
step
.note Craft elixirs and oils to 250.
step
.note Push through major potions to 300.
step
.note Learn Outland recipes and brew fel potions to 375.
]], { category = "Profession", faction = "Both", levelRange = { 1, 375 }, zones = { "Stormwind City", "Undercity", "Hellfire Peninsula" } })

BAG.Parser:Register("P-Cooking-1-375", [[
# Title: Cooking 1-375 (TBC Classic)
# Faction: Both
# Category: Profession
# LevelRange: 1-375
# Zones: Crossroads,Darkshire,Shattrath City
step
.train Cooking
.note Train Cooking and buy basic cooking supplies.
step
.note Cook simple meats to 50.
step
.note Use boar and crab recipes to 150.
step
.note Craft mid-tier dishes to 250.
step
.note Push through Runecloth-style recipes to 300.
step
.note Learn Outland dishes in Shattrath to reach 375.
]], { category = "Profession", faction = "Both", levelRange = { 1, 375 }, zones = { "The Barrens", "Duskwood", "Shattrath City" } })

BAG.Parser:Register("P-Fishing-1-375", [[
# Title: Fishing 1-375 (TBC Classic)
# Faction: Both
# Category: Profession
# LevelRange: 1-375
# Zones: Elwynn Forest,Stranglethorn Vale,Terokkar Forest
step
.train Fishing
.note Train Fishing and buy a basic pole.
step
.note Fish in starter ponds to 75.
step
.note Move to higher zones and fish to 200.
step
.note Fish coastal areas to 300.
step
.note In Outland, fish in Terokkar and Nagrand to 375.
]], { category = "Profession", faction = "Both", levelRange = { 1, 375 }, zones = { "Elwynn Forest", "Stranglethorn Vale", "Terokkar Forest" } })

BAG.Parser:Register("P-FirstAid-1-375", [[
# Title: First Aid 1-375 (TBC Classic)
# Faction: Both
# Category: Profession
# LevelRange: 1-375
# Zones: Anywhere
step
.train First Aid
.note Train First Aid and keep cloth supplies ready.
step
.note Craft linen bandages to 80.
step
.note Use wool and silk bandages to 200.
step
.note Craft mageweave and runecloth bandages to 300.
step
.note Learn Outland bandages and push to 375.
]], { category = "Profession", faction = "Both", levelRange = { 1, 375 }, zones = { "Anywhere" } })

