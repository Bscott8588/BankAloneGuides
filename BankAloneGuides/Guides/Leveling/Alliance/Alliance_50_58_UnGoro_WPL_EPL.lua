-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 50-58: Un'Goro, WPL & EPL
-- Original routing for the final Azeroth stretch
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_50_58_UnGoro_WPL_EPL", {
    title      = "Un'Goro / Plaguelands (50-58)",
    faction    = "Alliance",
    levelRange = { 50, 58 },
    zone       = "Un'Goro Crater",
    steps = {
        -- Un'Goro Crater (48-55)
        { type = "fly",     destination = "Marshal's Refuge", zone = "Un'Goro Crater", text = "Fly to Marshal's Refuge in Un'Goro Crater" },
        { type = "fp",      zone = "Un'Goro Crater", text = "Get the Marshal's Refuge flight path" },
        { type = "note",    text = "Set Hearthstone at the Marshal's Refuge camp." },
        { type = "note",    text = "Pick up all quests: dinosaur research, crystal collection, and soil sampling." },
        { type = "kill",    target = "Devilsaurs (carefully)",                     zone = "Un'Goro Crater", x = 50.0, y = 52.0, text = "Hunt dinosaurs throughout the crater — avoid devilsaurs until ready" },
        { type = "collect", itemID = 11584, count = 15, itemName = "Crystal Samples", zone = "Un'Goro Crater", x = 35.0, y = 55.0, text = "Gather colored crystals from the power pylons around the crater" },
        { type = "goto",    zone = "Un'Goro Crater", x = 68.0, y = 28.0, text = "Visit the eastern Fire Plume Ridge for volcano tasks" },
        { type = "kill",    target = "Tar Elementals",                             zone = "Un'Goro Crater", x = 46.0, y = 47.0, text = "Deal with the tar creatures in the western pits" },
        { type = "hs",      text = "Hearthstone to Marshal's Refuge" },
        { type = "note",    text = "Complete remaining Un'Goro quests. Head to Plaguelands at 53+." },

        -- Western Plaguelands (51-58)
        { type = "fly",     destination = "Chillwind Camp", zone = "Western Plaguelands", text = "Fly to Chillwind Camp in Western Plaguelands" },
        { type = "fp",      zone = "Western Plaguelands", text = "Grab the Chillwind Camp flight path" },
        { type = "note",    text = "Set Hearthstone to Chillwind Camp." },
        { type = "note",    text = "Accept Cauldron quests, undead clearing tasks, and Scholomance prep quests." },
        { type = "kill",    target = "Scourge Undead",                             zone = "Western Plaguelands", x = 51.0, y = 44.0, text = "Clear undead around Andorhal" },
        { type = "kill",    target = "Cauldron Guardians",                         zone = "Western Plaguelands", x = 62.0, y = 58.0, text = "Destroy cauldron lords at each field outpost" },
        { type = "hs",      text = "Hearth to Chillwind Camp" },

        -- Eastern Plaguelands (55-58)
        { type = "fly",     destination = "Light's Hope Chapel", zone = "Eastern Plaguelands", text = "Fly to Light's Hope Chapel in Eastern Plaguelands" },
        { type = "fp",      zone = "Eastern Plaguelands", text = "Get the Light's Hope Chapel flight path" },
        { type = "note",    text = "Pick up Argent Dawn quests and tower patrol missions." },
        { type = "kill",    target = "Plaguebats and Gargoyles",                   zone = "Eastern Plaguelands", x = 55.0, y = 62.0, text = "Clear flying undead in the plague-ravaged fields" },
        { type = "note",    text = "Work the Tyr's Hand area for high-XP enemies at 56+." },
        { type = "note",    text = "At 58, you're ready for Outland! Head to the Blasted Lands and the Dark Portal." },
    },
})
