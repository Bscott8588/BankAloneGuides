local BAG = BankAlone
local Guides = BAG.Guides

local function profGuide(id, title, steps)
  Guides:RegisterGuide({
    id = id,
    title = title,
    faction = "Both",
    levelRange = { 1, 70 },
    category = "Profession",
    steps = steps,
  })
end

profGuide("PROF_MINING_1_375", "Mining 1-375 Route", {
  { type = "train", text = "Train Mining in your starting zone (see Trainers.lua for exact NPCs)." },
  { type = "collect", text = "Mine Copper and Tin in starter zones and The Barrens/Westfall until 125." },
  { type = "train", text = "Train Journeyman and Expert Mining in a capital city to reach 225." },
  { type = "collect", text = "Farm Iron and Mithril in Thousand Needles, Arathi, and Tanaris until 275." },
  { type = "collect", text = "Mine Thorium in Winterspring and Silithus to reach 300." },
  { type = "train", text = "Train Master Mining in Hellfire Peninsula and mine Fel Iron/Adamantite to 375." },
})

profGuide("PROF_HERBALISM_1_375", "Herbalism 1-375 Route", {
  { type = "train", text = "Train Herbalism in your starting zone or capital city." },
  { type = "collect", text = "Gather Peacebloom, Silverleaf, and Earthroot to 75." },
  { type = "collect", text = "Farm Bruiseweed and Wild Steelbloom in Hillsbrad/Stonetalon to 150." },
  { type = "collect", text = "Pick Kingsblood and Goldthorn in Arathi/Tanaris to 225." },
  { type = "collect", text = "Farm Dreamfoil and Plaguebloom in Felwood/Plaguelands to 300." },
  { type = "collect", text = "In Outland, gather Felweed and Dreaming Glory to 375." },
})

profGuide("PROF_SKINNING_1_375", "Skinning 1-375 Route", {
  { type = "train", text = "Train Skinning and buy a Skinning Knife from a vendor." },
  { type = "collect", text = "Skin beasts in starter zones to 75." },
  { type = "collect", text = "Move to The Barrens/Westfall and skin to 150." },
  { type = "collect", text = "Farm heavy leather in Stranglethorn and Desolace to 225." },
  { type = "collect", text = "Skin rugged leather in Winterspring and Blasted Lands to 300." },
  { type = "collect", text = "In Outland, skin clefthoofs and ravagers to 375." },
})

profGuide("PROF_BLACKSMITHING_1_375", "Blacksmithing 1-375 Route", {
  { type = "train", text = "Train Blacksmithing at a capital forge (see Trainers.lua)." },
  { type = "collect", text = "Smelt Copper/Tin for 1-75; craft simple plates." },
  { type = "buy", text = "Buy coarse and heavy grinding stone recipes from vendors in major cities." },
  { type = "collect", text = "Use Iron/Mithril bars to reach 225 with bracers and belts." },
  { type = "collect", text = "Use Thorium to reach 300 with weapon chains and plates." },
  { type = "train", text = "Train Master Blacksmithing in Hellfire Peninsula and craft Fel Iron gear to 375." },
})

profGuide("PROF_ENGINEERING_1_375", "Engineering 1-375 Route", {
  { type = "train", text = "Train Engineering and buy a few basic schematics from vendors." },
  { type = "collect", text = "Use Copper/Tin to craft bolts and blasting powder to 125." },
  { type = "buy", text = "Check vendor recipes in major cities for goggles and scopes." },
  { type = "collect", text = "Craft Iron/Mithril gadgets and scopes to 225." },
  { type = "collect", text = "Use Thorium to build advanced explosives to 300." },
  { type = "train", text = "Train Master Engineering in Hellfire Peninsula and craft Fel Iron devices to 375." },
})

profGuide("PROF_LEATHERWORKING_1_375", "Leatherworking 1-375 Route", {
  { type = "train", text = "Train Leatherworking at a city trainer." },
  { type = "collect", text = "Use light leather to craft armor kits to 100." },
  { type = "collect", text = "Craft medium/heavy leather gear to 200." },
  { type = "buy", text = "Buy specialized patterns from vendors (see Vendors.lua)." },
  { type = "collect", text = "Use rugged leather to push to 300." },
  { type = "train", text = "Train Master Leatherworking in Outland and craft fel leather items to 375." },
})

profGuide("PROF_TAILORING_1_375", "Tailoring 1-375 Route", {
  { type = "train", text = "Train Tailoring in a capital city." },
  { type = "collect", text = "Use linen/wool to craft bolts and basic gear to 125." },
  { type = "collect", text = "Craft silk/mageweave pieces to reach 225." },
  { type = "buy", text = "Check cloth vendors for bolts and patterns." },
  { type = "collect", text = "Use runecloth to reach 300." },
  { type = "train", text = "Train Master Tailoring in Outland and use Netherweave to 375." },
})

profGuide("PROF_ENCHANTING_1_375", "Enchanting 1-375 Route", {
  { type = "train", text = "Train Enchanting and craft a Runed Copper Rod." },
  { type = "collect", text = "Disenchant green gear and apply basic enchants to 100." },
  { type = "buy", text = "Buy vendor formulas for bracer and chest enchants." },
  { type = "collect", text = "Disenchant dungeon gear and push to 225." },
  { type = "collect", text = "Use runecloth/rare shards to reach 300." },
  { type = "train", text = "Train Master Enchanting in Shattrath and use Outland dust to 375." },
})

profGuide("PROF_ALCHEMY_1_375", "Alchemy 1-375 Route", {
  { type = "train", text = "Train Alchemy and buy a few basic vial recipes." },
  { type = "collect", text = "Craft minor potions with Peacebloom/Silverleaf to 60." },
  { type = "collect", text = "Use Briarthorn/Bruiseweed to reach 150." },
  { type = "buy", text = "Purchase new potion recipes from city vendors." },
  { type = "collect", text = "Use Goldthorn/Sungrass to reach 300." },
  { type = "train", text = "Train Master Alchemy in Outland and craft Felweed potions to 375." },
})

profGuide("PROF_COOKING_1_375", "Cooking 1-375 Route", {
  { type = "train", text = "Train Cooking at a local inn trainer." },
  { type = "collect", text = "Cook simple meats from starter beasts to 75." },
  { type = "collect", text = "Use fish and meat recipes to reach 150." },
  { type = "buy", text = "Buy recipe upgrades from cooking vendors in cities." },
  { type = "collect", text = "Use rugged meats and fish to reach 300." },
  { type = "train", text = "Train Master Cooking in Outland and cook Netherwing/clefthoof recipes to 375." },
})

profGuide("PROF_FISHING_1_375", "Fishing 1-375 Route", {
  { type = "train", text = "Train Fishing and buy a basic pole from a vendor." },
  { type = "collect", text = "Fish in starter zones to 75, then move to rivers and lakes to 150." },
  { type = "collect", text = "Fish in coastal areas like Stranglethorn to reach 225." },
  { type = "collect", text = "Move to high-level zones like Winterspring to reach 300." },
  { type = "collect", text = "In Outland, fish in Zangarmarsh and Nagrand to 375." },
})

profGuide("PROF_FIRSTAID_1_375", "First Aid 1-375 Route", {
  { type = "train", text = "Train First Aid at a local medic." },
  { type = "collect", text = "Craft linen/wool bandages to 150." },
  { type = "collect", text = "Craft silk/mageweave bandages to 225." },
  { type = "collect", text = "Craft runecloth bandages to 300." },
  { type = "train", text = "Train Master First Aid in Outland and craft Netherweave bandages to 375." },
})
