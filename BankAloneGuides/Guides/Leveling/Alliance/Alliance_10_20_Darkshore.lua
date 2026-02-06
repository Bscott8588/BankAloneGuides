-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 10-20: Darkshore
-- Original routing for Night Elf / Draenei progression
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_10_20_Darkshore", {
    title      = "Darkshore (10-20)",
    faction    = "Alliance",
    levelRange = { 10, 20 },
    zone       = "Darkshore",
    steps = {
        { type = "goto",    zone = "Darkshore", x = 36.4, y = 44.2, text = "Arrive in Auberdine (boat from Rut'theran or fly)" },
        { type = "fp",      zone = "Darkshore", text = "Grab the Auberdine flight path" },
        { type = "note",    text = "Set your Hearthstone at the Auberdine inn." },
        { type = "note",    text = "Pick up all Auberdine quests: coastal cleanup, shipwreck investigation, and wildlife management." },
        { type = "goto",    zone = "Darkshore", x = 37.0, y = 37.0, text = "Head north along the coast to the ancient ruins" },
        { type = "kill",    target = "Darkshore Murlocs",                         zone = "Darkshore", x = 38.0, y = 35.0, text = "Clear murlocs from the tide pools north of Auberdine" },
        { type = "note",    text = "Investigate the grounded vessel debris along the northern coast." },
        { type = "goto",    zone = "Darkshore", x = 39.0, y = 28.0, text = "Continue north to the Cliffspring area" },
        { type = "kill",    target = "Corrupted Wildlife",                        zone = "Darkshore", x = 40.0, y = 27.0, text = "Deal with corrupted wildlife in the Cliffspring Falls area" },
        { type = "hs",      text = "Hearthstone to Auberdine" },
        { type = "note",    text = "Turn in completed quests and pick up follow-ups." },
        { type = "goto",    zone = "Darkshore", x = 43.0, y = 53.0, text = "Head south along the road to the Tower of Althalaxx area" },
        { type = "note",    text = "Work the satyr and cultist quests in the southern half of Darkshore." },
        { type = "kill",    target = "Satyrs",                                    zone = "Darkshore", x = 44.0, y = 58.0, text = "Clear satyrs from the camps south of Auberdine" },
        { type = "goto",    zone = "Darkshore", x = 42.0, y = 69.0, text = "Push further south to the grove of the ancients area" },
        { type = "kill",    target = "Furbolgs",                                  zone = "Darkshore", x = 43.0, y = 71.0, text = "Thin the aggressive furbolg population" },
        { type = "hs",      text = "Hearthstone to Auberdine" },
        { type = "note",    text = "At level 18-20, take the boat to Menethil Harbor and head to Wetlands, or go south to Ashenvale." },
    },
})
