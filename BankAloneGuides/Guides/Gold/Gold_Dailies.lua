-------------------------------------------------------------------------------
-- Bank Alone Guides — Gold: Daily Routines
-- Original daily quest gold strategies for TBC Classic
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Gold_Dailies", {
    title      = "Gold Daily Routines",
    faction    = "Both",
    levelRange = { 70, 70 },
    category   = "gold",
    steps = {
        { type = "note",   text = "=== DAILY QUEST GOLD ROUTINES ===" },
        { type = "note",   text = "TBC has limited dailies compared to later expansions. Maximize what's available." },

        { type = "note",   text = "--- Sha'tari Skyguard Dailies ---" },
        { type = "goto",   zone = "Terokkar Forest", x = 64.0, y = 66.0, text = "Visit the Skyguard outpost in Terokkar" },
        { type = "note",   text = "Kill Arakkoa for skulls (daily turn-in) and complete bombing runs." },
        { type = "note",   text = "Rewards: ~12g per daily + Skyguard rep toward Nether Ray mount." },

        { type = "note",   text = "--- Ogri'la Dailies ---" },
        { type = "goto",   zone = "Blade's Edge Mountains", x = 28.0, y = 57.0, text = "Visit Ogri'la above Blade's Edge" },
        { type = "note",   text = "Complete the Simon Says game, bombing run, and crystal powder turn-in." },
        { type = "note",   text = "Rewards: ~30g total from all Ogri'la dailies." },

        { type = "note",   text = "--- Netherwing Dailies ---" },
        { type = "goto",   zone = "Shadowmoon Valley", x = 65.0, y = 87.0, text = "Visit Netherwing Ledge in Shadowmoon" },
        { type = "note",   text = "Requires starting the Netherwing quest chain first." },
        { type = "note",   text = "Mine Nethercite Ore, gather Netherdust, and collect eggs." },
        { type = "note",   text = "Rewards: ~50g total daily + Netherwing Drake mount at Exalted." },

        { type = "note",   text = "--- PvP Daily ---" },
        { type = "note",   text = "Complete the daily battleground quest for bonus honor AND gold." },

        { type = "note",   text = "--- Heroic Dungeon Daily ---" },
        { type = "note",   text = "Complete the daily heroic dungeon quest for Badge of Justice + gold." },

        { type = "note",   text = "--- Cooking Daily (Shattrath) ---" },
        { type = "goto",   zone = "Shattrath City", x = 61.0, y = 15.0, text = "Check the Shattrath cooking daily" },
        { type = "note",   text = "Complete for a cooking reward bag — can contain rare recipes." },

        { type = "note",   text = "--- Optimal Daily Route ---" },
        { type = "note",   text = "1. Shattrath cooking daily" },
        { type = "note",   text = "2. Fly to Ogri'la for 3 dailies" },
        { type = "note",   text = "3. Fly to Skyguard for 2 dailies" },
        { type = "note",   text = "4. Fly to Netherwing Ledge for 4-6 dailies" },
        { type = "note",   text = "5. Complete heroic dungeon daily" },
        { type = "note",   text = "Total: ~100-120g per day from dailies alone. Takes 1-2 hours." },
    },
})
