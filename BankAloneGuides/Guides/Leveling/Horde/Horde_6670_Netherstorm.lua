--[[
    Bank Alone Guides - Horde 66-70: Netherstorm & Shadowmoon Valley
    SCS / Bank Alone Guides
    
    Final push to 70. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Horde_6670_Netherstorm", {
    title = "Horde 66-70: Netherstorm & Shadowmoon",
    faction = "Horde",
    levelRange = {66, 70},
    category = "Leveling",
    nextGuide = nil,
    steps = {
        -- Netherstorm (67-70)
        { type = "goto", text = "Enter Netherstorm from Blade's Edge heading northeast.", zone = "Netherstorm", x = 33.0, y = 64.0, conditions = {} },
        { type = "goto", text = "Head to Area 52, the main neutral hub.", zone = "Netherstorm", x = 32.5, y = 63.5, conditions = {} },
        { type = "flightpath", text = "Get the Area 52 flight path.", zone = "Netherstorm", conditions = {} },
        { type = "note", text = "Pick up all quests: ethereal trade, blood elf manaforge sabotage, and dimensional studies.", conditions = {} },
        { type = "accept", questID = 10338, text = "Take the Consortium crystal collection quest.", zone = "Netherstorm", conditions = {} },
        { type = "complete", questID = 10338, text = "Collect crystals from formations across the zone.", zone = "Netherstorm", x = 37.0, y = 56.0, conditions = {} },
        { type = "turnin", questID = 10338, text = "Return to the Consortium.", zone = "Netherstorm", conditions = {} },
        { type = "accept", questID = 10424, text = "Begin the manaforge sabotage chain.", zone = "Netherstorm", conditions = {} },
        { type = "complete", questID = 10424, text = "Disable Manaforge B'naar in the south.", zone = "Netherstorm", x = 25.0, y = 68.0, conditions = {} },
        { type = "turnin", questID = 10424, text = "Report the manaforge disabled.", zone = "Netherstorm", conditions = {} },
        { type = "note", text = "Work through the manaforge chain: B'naar, Coruu, Duro, and Ara.", conditions = {} },
        { type = "note", text = "Visit the Protectorate camp for Consortium tasks.", zone = "Netherstorm", x = 59.0, y = 32.0, conditions = {} },
        { type = "note", text = "Complete the Eco-Dome quests.", zone = "Netherstorm", x = 50.0, y = 52.0, conditions = {} },
        { type = "note", text = "Visit Kirin'Var Village in the south for quest chains.", zone = "Netherstorm", x = 58.0, y = 86.0, conditions = {} },
        { type = "note", text = "Run Mechanar, Botanica, and Arcatraz dungeons.", conditions = {} },
        { type = "level", targetLevel = 69, text = "Work Netherstorm to level 69.", conditions = {} },

        -- Shadowmoon Valley (67-70)
        { type = "note", text = "Head to Shadowmoon Valley for the final stretch.", conditions = {} },
        { type = "goto", text = "Enter Shadowmoon Valley from Terokkar heading southeast.", zone = "Shadowmoon Valley", x = 61.0, y = 28.0, conditions = {} },
        { type = "goto", text = "Head to Shadowmoon Village, the Horde base.", zone = "Shadowmoon Valley", x = 30.0, y = 32.0, conditions = {} },
        { type = "flightpath", text = "Get the Shadowmoon Village flight path.", zone = "Shadowmoon Valley", conditions = {} },
        { type = "note", text = "Pick up quests: Illidari forces, eclipse point, demon clearing, and hand of gul'dan.", conditions = {} },
        { type = "accept", questID = 10551, text = "Take the training grounds quest.", zone = "Shadowmoon Valley", conditions = {} },
        { type = "complete", questID = 10551, text = "Prove yourself at the combat training facility.", zone = "Shadowmoon Valley", x = 71.0, y = 57.0, conditions = {} },
        { type = "turnin", questID = 10551, text = "Return with honor.", zone = "Shadowmoon Valley", conditions = {} },
        { type = "accept", questID = 10583, text = "Begin the Cipher of Damnation chain.", zone = "Shadowmoon Valley", conditions = {} },
        { type = "note", text = "Follow the multi-part Cipher chain through the zone's dark history.", conditions = {} },
        { type = "note", text = "Complete the Netherwing Ledge quests.", zone = "Shadowmoon Valley", x = 69.0, y = 85.0, conditions = {} },
        { type = "note", text = "Work the Altar of Sha'tar for reputation quests.", conditions = {} },
        { type = "note", text = "Complete the Legion Hold and Deathforge chains with a group.", conditions = {} },
        { type = "level", targetLevel = 70, text = "Reach level 70! Congratulations!", conditions = {} },
        { type = "note", text = "Welcome to endgame TBC! Focus on attunements, heroic keys, reputation, and gearing up for raids.", conditions = {} },
        { type = "note", text = "Priority: Karazhan attunement, Heroic dungeon keys (Revered with each faction), and pre-raid gear.", conditions = {} },
    },
})
