-------------------------------------------------------------------------------
-- Bank Alone Guides — Profession: Leatherworking (1-375)
-- Original routing
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Prof_Leatherworking", {
    title      = "Leatherworking (1-375)",
    faction    = "Both",
    levelRange = { 1, 70 },
    category   = "profession",
    steps = {
        { type = "train",  skill = "Leatherworking", text = "Learn Apprentice Leatherworking" },
        { type = "note",   text = "[1-20] Craft Light Armor Kits (Light Leather x1). Need ~20 Light Leather." },
        { type = "note",   text = "[20-45] Craft Handstitched Leather Cloak (Light Leather x2, Coarse Thread x1)." },
        { type = "note",   text = "[45-55] Craft Embossed Leather Gloves (Light Leather x3, Coarse Thread x2)." },
        { type = "train",  skill = "Leatherworking", text = "Train Journeyman Leatherworking at 50+" },
        { type = "note",   text = "[55-100] Craft Fine Leather Belt (Light Leather x6, Coarse Thread x2)." },
        { type = "note",   text = "[100-120] Craft Cured Medium Hide (Medium Hide x1, Salt x1). Buy Salt from vendors." },
        { type = "train",  skill = "Leatherworking", text = "Train Expert Leatherworking at 125+" },
        { type = "note",   text = "[120-150] Craft Dark Leather Belt (Medium Leather x6)." },
        { type = "note",   text = "[150-200] Craft Heavy Armor Kits, Hillman's Shoulders, Barbaric Shoulders." },
        { type = "train",  skill = "Leatherworking", text = "Train Artisan Leatherworking at 200+" },
        { type = "note",   text = "[200-250] Craft Thick Armor Kits (Thick Leather x5). Need ~250 Thick Leather." },
        { type = "note",   text = "[250-300] Craft Wicked Leather items, Rugged Armor Kits." },
        { type = "train",  skill = "Leatherworking", text = "Train Master Leatherworking (300) in Hellfire Peninsula" },
        { type = "note",   text = "[300-325] Craft Knothide Armor Kits (Knothide Leather x4)." },
        { type = "note",   text = "[325-350] Craft Heavy Knothide Leather, Thick Draenic Vest." },
        { type = "note",   text = "[350-375] Choose Dragonscale, Elemental, or Tribal specialization and craft epics." },
        { type = "note",   text = "At 375, Leatherworking is maxed! Drums of Battle are highly valued for raiding." },
    },
})
