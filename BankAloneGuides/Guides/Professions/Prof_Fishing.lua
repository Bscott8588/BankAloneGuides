-------------------------------------------------------------------------------
-- Bank Alone Guides — Profession: Fishing (1-375)
-- Original routing
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Prof_Fishing", {
    title      = "Fishing (1-375)",
    faction    = "Both",
    levelRange = { 1, 70 },
    category   = "profession",
    steps = {
        { type = "train",  skill = "Fishing",       text = "Learn Apprentice Fishing and buy a Fishing Pole" },
        { type = "note",   text = "[1-75] Fish anywhere in a capital city or starting zone. Just cast and reel in." },
        { type = "train",  skill = "Fishing",       text = "Train Journeyman Fishing at 50+ skill" },
        { type = "note",   text = "[75-150] Fish in 10-25 level zones. Use a lure to reduce 'fish got away' messages." },
        { type = "note",   text = "Buy Shiny Baubles from fishing supply vendors for +25 skill lure." },
        { type = "train",  skill = "Fishing",       text = "Train Expert Fishing at 125+ (book from vendors in Booty Bay)" },
        { type = "note",   text = "[150-225] Fish in Tanaris, STV coastline, or Dustwallow Marsh." },
        { type = "note",   text = "Buy Aquadynamic Fish Attractors for +100 lure from engineering or AH." },
        { type = "train",  skill = "Fishing",       text = "Train Artisan Fishing at 225+ (complete the fishing quest in Dustwallow)" },
        { type = "note",   text = "[225-300] Fish in Azshara, EPL, or Winterspring for high-value catches." },
        { type = "train",  skill = "Fishing",       text = "Train Master Fishing (300) from the Zangarmarsh trainer" },
        { type = "note",   text = "[300-375] Fish in Outland zones. Zangarmarsh has great fishing spots." },
        { type = "goto",   zone = "Zangarmarsh", x = 78.0, y = 66.0, text = "Fish in Zangarmarsh lakes for Zangarian Sporefish" },
        { type = "note",   text = "Nagrand and Terokkar highland lakes have valuable fish." },
        { type = "note",   text = "Mr. Pinchy (a rare catch in Terokkar) can grant an epic fishing reward." },
        { type = "note",   text = "At 375, Fishing is maxed! Fish for Spicy Crawdad ingredients for profit." },
    },
})
