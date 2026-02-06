-------------------------------------------------------------------------------
-- Bank Alone Guides — Profession: Herbalism (1-375)
-- Original routing and zone guidance
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Prof_Herbalism", {
    title      = "Herbalism (1-375)",
    faction    = "Both",
    levelRange = { 1, 70 },
    category   = "profession",
    steps = {
        { type = "train",  skill = "Herbalism",     text = "Learn Apprentice Herbalism from any capital city trainer" },
        { type = "note",   text = "[1-50] Gather Peacebloom and Silverleaf. Found in all starting zones." },
        { type = "note",   text = "[50-70] Gather Earthroot near hills and cliff faces in 1-10 zones." },
        { type = "train",  skill = "Herbalism",     text = "Train Journeyman Herbalism at 50+ skill" },
        { type = "note",   text = "[70-100] Gather Mageroyal and Briarthorn in 10-20 zones." },
        { type = "note",   text = "[100-115] Bruiseweed in Stonetalon, Ashenvale, Wetlands, Duskwood." },
        { type = "train",  skill = "Herbalism",     text = "Train Expert Herbalism at 125+ skill" },
        { type = "note",   text = "[115-150] Kingsblood in Stranglethorn Vale, Arathi Highlands, Desolace." },
        { type = "note",   text = "[150-185] Fadeleaf and Goldthorn in Arathi, STV, Badlands." },
        { type = "train",  skill = "Herbalism",     text = "Train Artisan Herbalism at 200+ skill" },
        { type = "note",   text = "[185-230] Firebloom in Searing Gorge, Blasted Lands, Tanaris." },
        { type = "note",   text = "[230-270] Sungrass, Gromsblood in Felwood, Un'Goro, Blasted Lands." },
        { type = "note",   text = "[270-300] Dreamfoil, Mountain Silversage in EPL, Winterspring, Burning Steppes." },
        { type = "train",  skill = "Herbalism",     text = "Train Master Herbalism (300) in Hellfire Peninsula" },
        { type = "note",   text = "[300-325] Felweed — found throughout Hellfire Peninsula, very common." },
        { type = "goto",   zone = "Hellfire Peninsula", x = 55.0, y = 55.0, text = "Loop Hellfire for Felweed nodes" },
        { type = "note",   text = "[325-350] Dreaming Glory in Zangarmarsh, Nagrand, Terokkar." },
        { type = "goto",   zone = "Zangarmarsh", x = 60.0, y = 50.0, text = "Circuit Zangarmarsh for Dreaming Glory" },
        { type = "note",   text = "[350-375] Nightmare Vine and Mana Thistle in Netherstorm, Shadowmoon Valley." },
        { type = "note",   text = "Terocone (Terokkar only) and Ragveil (Zangarmarsh only) are zone-specific." },
        { type = "note",   text = "At 375, Herbalism is maxed! Sell herbs on the AH or use for Alchemy." },
    },
})
