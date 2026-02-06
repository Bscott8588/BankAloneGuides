-------------------------------------------------------------------------------
-- Bank Alone Guides — Profession: First Aid (1-375)
-- Original routing
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Prof_FirstAid", {
    title      = "First Aid (1-375)",
    faction    = "Both",
    levelRange = { 1, 70 },
    category   = "profession",
    steps = {
        { type = "train",  skill = "First Aid",     text = "Learn Apprentice First Aid from any city trainer" },
        { type = "note",   text = "[1-40] Craft Linen Bandage (Linen Cloth x1). Need ~40 Linen Cloth." },
        { type = "note",   text = "[40-80] Craft Heavy Linen Bandage (Linen Cloth x2). Need ~80 Linen Cloth." },
        { type = "train",  skill = "First Aid",     text = "Train Journeyman First Aid at 50+" },
        { type = "note",   text = "[80-115] Craft Wool Bandage (Wool Cloth x1). Need ~35 Wool Cloth." },
        { type = "note",   text = "[115-150] Craft Heavy Wool Bandage (Wool Cloth x2). Need ~70 Wool Cloth." },
        { type = "train",  skill = "First Aid",     text = "Train Expert First Aid at 125+ (buy the book)" },
        { type = "note",   text = "[150-180] Craft Silk Bandage (Silk Cloth x1). Need ~30 Silk Cloth." },
        { type = "note",   text = "[180-210] Craft Heavy Silk Bandage (Silk Cloth x2). Need ~60 Silk Cloth." },
        { type = "note",   text = "[210-240] Craft Mageweave Bandage (Mageweave Cloth x1)." },
        { type = "note",   text = "[240-260] Craft Heavy Mageweave Bandage (Mageweave Cloth x2)." },
        { type = "note",   text = "[260-290] Craft Runecloth Bandage (Runecloth x1)." },
        { type = "note",   text = "[290-300] Craft Heavy Runecloth Bandage (Runecloth x2)." },
        { type = "train",  skill = "First Aid",     text = "Train Master First Aid (300) in Hellfire Peninsula" },
        { type = "note",   text = "[300-330] Craft Netherweave Bandage (Netherweave Cloth x1)." },
        { type = "note",   text = "[330-375] Craft Heavy Netherweave Bandage (Netherweave Cloth x2)." },
        { type = "note",   text = "At 375, First Aid is maxed! Heavy Netherweave Bandages are great for all classes." },
    },
})
