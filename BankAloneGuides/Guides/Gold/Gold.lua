local BAG = BankAlone
local Guides = BAG.Guides

local function goldGuide(id, title, steps)
  Guides:RegisterGuide({
    id = id,
    title = title,
    faction = "Both",
    levelRange = { 60, 70 },
    category = "Gold",
    steps = steps,
  })
end

goldGuide("GOLD_PRIMAL_NAGRAND", "Primal Farming - Nagrand", {
  { type = "travel", zone = "Nagrand", x = 54.2, y = 75.0, text = "Set up in Nagrand with a full inventory." },
  { type = "note", zone = "Nagrand", x = 54.2, y = 75.0, text = "Circle the elemental plateau for motes of life and earth." },
  { type = "collect", itemId = 22575, count = 10, zone = "Nagrand", x = 52.0, y = 70.0, text = "Collect motes and convert to Primals at 10 stacks." },
  { type = "note", zone = "Nagrand", x = 56.8, y = 34.8, text = "Sell extra greens or disenchant for dust." },
})

goldGuide("GOLD_HERB_TREKKAR", "Herb Loop - Terokkar", {
  { type = "travel", zone = "Terokkar Forest", x = 48.8, y = 45.3, text = "Start at Stonebreaker Hold or Shattrath." },
  { type = "note", zone = "Terokkar Forest", x = 44.2, y = 65.1, text = "Run a clockwise loop around the forest for Dreaming Glory." },
  { type = "collect", text = "Prioritize nodes near the rivers and lakes." },
  { type = "note", zone = "Terokkar Forest", x = 36.8, y = 54.1, text = "Mail herbs to alts or list in stacks of 20." },
})

goldGuide("GOLD_DUNGEON_SLAVEPENS", "Dungeon Farm - Slave Pens", {
  { type = "travel", zone = "Zangarmarsh", x = 50.2, y = 40.9, text = "Enter Coilfang Reservoir and head to Slave Pens." },
  { type = "note", zone = "Zangarmarsh", x = 50.2, y = 40.9, text = "Focus on fast trash clears; vendor grays after each reset." },
  { type = "collect", text = "Save rare drops and crafting materials for auction." },
  { type = "note", text = "Limit instance resets to avoid lockout issues." },
})
