--[[
    Bank Alone Guides - Alliance 66-70: Netherstorm & Shadowmoon Valley
    SCS / Bank Alone Guides
    
    Final Outland zones to 70. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Alliance_6670_Netherstorm", {
    title = "Alliance 66-70: Netherstorm & Shadowmoon",
    faction = "Alliance",
    levelRange = {66, 70},
    category = "Leveling",
    nextGuide = nil,
    steps = {
        -- Netherstorm (67-70)
        { type = "goto", text = "Enter Netherstorm from Blade's Edge Mountains heading northeast.", zone = "Netherstorm", x = 33.0, y = 64.0, conditions = {} },
        { type = "goto", text = "Head to Area 52, the main quest hub in Netherstorm.", zone = "Netherstorm", x = 32.5, y = 63.5, conditions = {} },
        { type = "flightpath", text = "Get the Area 52 flight path.", zone = "Netherstorm", conditions = {} },
        { type = "note", text = "Set your hearthstone at Area 52 (or keep Shattrath).", conditions = {} },
        { type = "note", text = "Pick up all quests at Area 52: ethereal investigations, blood elf manaforge disruption, and dimensional anomalies.", conditions = {} },
        { type = "accept", questID = 10338, text = "Take the Consortium crystal collection quest.", zone = "Netherstorm", conditions = {} },
        { type = "complete", questID = 10338, text = "Collect ethereal crystals from the various crystal formations around the zone.", zone = "Netherstorm", x = 37.0, y = 56.0, conditions = {} },
        { type = "turnin", questID = 10338, text = "Return the crystals to the Consortium agent.", zone = "Netherstorm", conditions = {} },
        { type = "accept", questID = 10424, text = "Accept the Manaforge B'naar sabotage quest.", zone = "Netherstorm", conditions = {} },
        { type = "complete", questID = 10424, text = "Travel southeast to Manaforge B'naar and disable the blood elf operations.", zone = "Netherstorm", x = 25.0, y = 68.0, conditions = {} },
        { type = "turnin", questID = 10424, text = "Report the manaforge successfully sabotaged.", zone = "Netherstorm", conditions = {} },
        { type = "note", text = "Work through the manaforge quest chain - there are multiple forges to disrupt across the zone.", conditions = {} },
        { type = "note", text = "Visit the Protectorate camp for more Consortium quests.", zone = "Netherstorm", x = 59.0, y = 32.0, conditions = {} },
        { type = "note", text = "Complete the Eco-Dome quests for ecology-themed tasks.", zone = "Netherstorm", x = 50.0, y = 52.0, conditions = {} },
        { type = "note", text = "Don't miss Kirin'Var Village in the south for the mage-themed quest chain.", zone = "Netherstorm", x = 58.0, y = 86.0, conditions = {} },
        { type = "note", text = "Work the Socrethar questline at the Ethereum areas for group-required content.", conditions = {} },
        { type = "note", text = "Run Mechanar, Botanica, and Arcatraz dungeons for gear and reputation.", conditions = {} },
        { type = "level", targetLevel = 69, text = "Work Netherstorm quests to level 69.", conditions = {} },

        -- Shadowmoon Valley (67-70)
        { type = "note", text = "Head to Shadowmoon Valley for the final push to 70.", conditions = {} },
        { type = "goto", text = "Enter Shadowmoon Valley from Terokkar Forest heading southeast.", zone = "Shadowmoon Valley", x = 61.0, y = 28.0, conditions = {} },
        { type = "goto", text = "Head to Wildhammer Stronghold, the Alliance base.", zone = "Shadowmoon Valley", x = 37.0, y = 55.0, conditions = {} },
        { type = "flightpath", text = "Get the Wildhammer Stronghold flight path.", zone = "Shadowmoon Valley", conditions = {} },
        { type = "note", text = "Pick up quests: Illidari forces, eclipse point assault, and demon clearing.", conditions = {} },
        { type = "accept", questID = 10551, text = "Take the Shadowmoon training grounds quest.", zone = "Shadowmoon Valley", conditions = {} },
        { type = "complete", questID = 10551, text = "Prove your combat skills at the training facility.", zone = "Shadowmoon Valley", x = 71.0, y = 57.0, conditions = {} },
        { type = "turnin", questID = 10551, text = "Return with honor from the training grounds.", zone = "Shadowmoon Valley", conditions = {} },
        { type = "note", text = "Work the Netherwing Ledge area for additional quests.", zone = "Shadowmoon Valley", x = 69.0, y = 85.0, conditions = {} },
        { type = "accept", questID = 10583, text = "Begin the Cipher of Damnation chain if you haven't already.", zone = "Shadowmoon Valley", conditions = {} },
        { type = "note", text = "This is a long, multi-part quest chain that reveals Shadowmoon's dark history. Follow each step carefully.", conditions = {} },
        { type = "note", text = "Complete the Altar of Sha'tar quests for Aldor/Scryer reputation.", conditions = {} },
        { type = "note", text = "Work the Legion Hold and Deathforge quest chains for group content.", conditions = {} },
        { type = "level", targetLevel = 70, text = "Reach level 70! Congratulations!", conditions = {} },
        { type = "note", text = "You've hit max level! Focus on reputation grinds, attunements, and dungeons. Welcome to endgame TBC!", conditions = {} },
        { type = "note", text = "Key priorities at 70: complete key attunements (Karazhan, Heroic keys), gear up through Normal/Heroic dungeons, and start raiding!", conditions = {} },
    },
})
