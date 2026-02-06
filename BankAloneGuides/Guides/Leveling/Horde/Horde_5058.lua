--[[
    Bank Alone Guides - Horde 50-58
    SCS / Bank Alone Guides
    
    Un'Goro Crater, Burning Steppes, Western/Eastern Plaguelands, Winterspring. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Horde_5058", {
    title = "Horde 50-58: Plaguelands & Un'Goro",
    faction = "Horde",
    levelRange = {50, 58},
    category = "Leveling",
    nextGuide = "Horde_5860_Hellfire",
    steps = {
        -- Un'Goro Crater (50-53)
        { type = "note", text = "Start with Un'Goro Crater. Fly to Gadgetzan and head west into the crater.", conditions = {} },
        { type = "goto", text = "Enter Un'Goro Crater and find Marshal's Refuge.", zone = "Un'Goro Crater", x = 43.6, y = 7.5, conditions = {} },
        { type = "flightpath", text = "Get the Marshal's Refuge flight path.", zone = "Un'Goro Crater", conditions = {} },
        { type = "note", text = "Set your hearthstone at Marshal's Refuge.", conditions = {} },
        { type = "note", text = "Pick up all quests: dinosaur hunting, crystal collection, soil sampling, Linken chain, and the tar pits.", conditions = {} },
        { type = "note", text = "Work a circle around the crater: east for devilsaurs and pterrordax, south for slimes, west for fire elementals.", conditions = {} },
        { type = "note", text = "Collect all four colors of power crystals as you explore.", conditions = {} },
        { type = "note", text = "Visit the three crystal pylons (north, east, west) to activate crystal buffs.", conditions = {} },
        { type = "note", text = "Complete the Linken quest chain for a nice trinket reward.", conditions = {} },
        { type = "level", targetLevel = 53, text = "Complete Un'Goro to level 53.", conditions = {} },

        -- Felwood (52-55)
        { type = "note", text = "Head to Felwood for corruption-themed quests. Fly to Orgrimmar and travel through Ashenvale.", conditions = {} },
        { type = "goto", text = "Enter Felwood and find the Emerald Sanctuary or Bloodvenom Post.", zone = "Felwood", x = 34.3, y = 52.4, conditions = {} },
        { type = "flightpath", text = "Get the Bloodvenom Post flight path.", zone = "Felwood", conditions = {} },
        { type = "note", text = "Pick up quests: cleansing corrupted plants, slime collection, satyr elimination, and furbolg tasks.", conditions = {} },
        { type = "note", text = "Work the corrupted furbolg camps and the Jadefire satyr ruins.", conditions = {} },
        { type = "note", text = "Complete Timbermaw Hold rep quests at the northern tunnel for convenient travel.", conditions = {} },
        { type = "level", targetLevel = 55, text = "Work Felwood to level 55.", conditions = {} },

        -- Western Plaguelands (53-57)
        { type = "note", text = "Head to Western Plaguelands. Take the zeppelin to Undercity and travel northeast.", conditions = {} },
        { type = "goto", text = "Travel to the Bulwark at the entrance to Western Plaguelands.", zone = "Western Plaguelands", x = 83.2, y = 69.1, conditions = {} },
        { type = "note", text = "Pick up quests from the Bulwark: undead elimination, cauldron neutralization, and scouting.", conditions = {} },
        { type = "note", text = "Work the cauldron fields across the zone - each has a quest chain.", conditions = {} },
        { type = "note", text = "Clear Andorhal's undead for multiple quest completions.", zone = "Western Plaguelands", x = 45.0, y = 55.0, conditions = {} },
        { type = "note", text = "Complete the Scholomance preparation quests.", conditions = {} },
        { type = "level", targetLevel = 57, text = "Complete Western Plaguelands to 57.", conditions = {} },

        -- Eastern Plaguelands (55-58)
        { type = "note", text = "Push into Eastern Plaguelands for the final stretch.", conditions = {} },
        { type = "goto", text = "Enter Eastern Plaguelands and go to Light's Hope Chapel.", zone = "Eastern Plaguelands", x = 81.6, y = 59.3, conditions = {} },
        { type = "flightpath", text = "Get the Light's Hope Chapel flight path.", zone = "Eastern Plaguelands", conditions = {} },
        { type = "note", text = "Pick up Argent Dawn quests and the various undead clearing tasks.", conditions = {} },
        { type = "note", text = "Work Darrowshire and the Undercroft areas.", conditions = {} },
        { type = "note", text = "Complete Stratholme dungeon quests if you can find a group.", conditions = {} },
        { type = "level", targetLevel = 58, text = "Reach level 58 - Outland awaits!", conditions = {} },

        -- Winterspring/Silithus alternatives
        { type = "note", text = "Winterspring and Silithus also offer 53-60 content if you need extra XP.", conditions = {} },
        { type = "note", text = "At level 58, head to the Blasted Lands and enter the Dark Portal!", conditions = {} },
    },
})
