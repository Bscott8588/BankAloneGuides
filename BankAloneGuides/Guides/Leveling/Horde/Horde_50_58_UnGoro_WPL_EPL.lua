-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 50-58: Un'Goro, WPL & EPL
-- Original routing for the final Azeroth stretch
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_50_58_UnGoro_WPL_EPL", {
    title      = "Un'Goro / Plaguelands (50-58)",
    faction    = "Horde",
    levelRange = { 50, 58 },
    zone       = "Un'Goro Crater",
    steps = {
        -- Un'Goro Crater (48-55)
        { type = "fly",     destination = "Marshal's Refuge", zone = "Un'Goro Crater", text = "Fly to Marshal's Refuge in Un'Goro Crater" },
        { type = "fp",      zone = "Un'Goro Crater", text = "Get the Marshal's Refuge flight path" },
        { type = "note",    text = "Set Hearthstone at Marshal's Refuge." },
        { type = "note",    text = "Pick up all quests: crystal gathering, dinosaur research, and soil samples." },
        { type = "kill",    target = "Ravasaurs",                                  zone = "Un'Goro Crater", x = 63.0, y = 17.0, text = "Hunt ravasaurs in the northeastern jungle" },
        { type = "kill",    target = "Pterrordax",                                 zone = "Un'Goro Crater", x = 50.0, y = 25.0, text = "Defeat pterrordax on the crater ridges" },
        { type = "goto",    zone = "Un'Goro Crater", x = 68.0, y = 28.0, text = "Head to Fire Plume Ridge for the volcano quests" },
        { type = "note",    text = "Collect power crystals from all four pylons around the crater edge." },
        { type = "kill",    target = "Tar Beasts",                                 zone = "Un'Goro Crater", x = 46.0, y = 46.0, text = "Clear tar creatures in the western pits" },
        { type = "hs",      text = "Hearthstone to Marshal's Refuge" },

        -- Western Plaguelands (51-58)
        { type = "note",    text = "At 53+, head to the Plaguelands." },
        { type = "fly",     destination = "The Bulwark", zone = "Western Plaguelands", text = "Fly to The Bulwark (Horde entrance to WPL)" },
        { type = "fp",      zone = "Western Plaguelands", text = "Get The Bulwark flight path" },
        { type = "note",    text = "Set Hearthstone to The Bulwark." },
        { type = "note",    text = "Pick up Horde-specific undead extermination quests." },
        { type = "kill",    target = "Scourge around Andorhal",                    zone = "Western Plaguelands", x = 51.0, y = 43.0, text = "Clear undead in the ruins of Andorhal" },
        { type = "note",    text = "Work the cauldron destruction quest chain across WPL." },
        { type = "kill",    target = "Cauldron Lords",                             zone = "Western Plaguelands", x = 60.0, y = 56.0, text = "Destroy the plague cauldron guardians" },
        { type = "hs",      text = "Hearth to The Bulwark" },

        -- Eastern Plaguelands (55-58)
        { type = "fly",     destination = "Light's Hope Chapel", zone = "Eastern Plaguelands", text = "Fly to Light's Hope Chapel" },
        { type = "fp",      zone = "Eastern Plaguelands", text = "Get the Light's Hope Chapel flight path" },
        { type = "note",    text = "Accept Argent Dawn quests and tower reclamation missions." },
        { type = "kill",    target = "Plague creatures",                           zone = "Eastern Plaguelands", x = 55.0, y = 60.0, text = "Eliminate plague beasts in the central fields" },
        { type = "note",    text = "At 58, proceed to Hellfire Peninsula through the Dark Portal!" },
    },
})
