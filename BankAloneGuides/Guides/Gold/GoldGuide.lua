--[[
    Bank Alone Guides - Gold Making Guide
    SCS / Bank Alone Guides
    
    Original gold-making strategies for TBC Classic.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Gold_Farming", {
    title = "Gold Making: Farming Routes",
    faction = "Both",
    levelRange = {60, 70},
    category = "Gold",
    steps = {
        { type = "note", text = "=== GOLD MAKING GUIDE FOR TBC CLASSIC ===", conditions = {} },
        { type = "note", text = "This guide covers the best gold-making methods at level 70.", conditions = {} },

        -- Gathering Professions
        { type = "note", text = "--- GATHERING PROFESSIONS (Best for raw gold) ---", conditions = {} },
        { type = "note", text = "Mining + Herbalism is the most profitable gathering combo.", conditions = {} },
        { type = "note", text = "Farming Route: Nagrand Mining - Circle the zone edges hitting Adamantite and Fel Iron nodes. 50-80g/hour.", conditions = {} },
        { type = "note", text = "Farming Route: Netherstorm Mining - Rich Adamantite and Khorium nodes. Higher value per node. 60-100g/hour.", conditions = {} },
        { type = "note", text = "Farming Route: Terokkar Herbalism - Terocone is highly sought after for flasks. 40-70g/hour.", conditions = {} },
        { type = "note", text = "Farming Route: Shadowmoon Herbalism - Nightmare Vine for endgame flasks. 50-80g/hour.", conditions = {} },
        { type = "note", text = "Skinning Route: Nagrand clefthooves - Kill and skin for Knothide Leather and Thick Clefthoof Leather. 40-60g/hour.", conditions = {} },

        -- Profession-Based Gold
        { type = "note", text = "--- PROFESSION CRAFTING ---", conditions = {} },
        { type = "note", text = "Alchemy: Transmute Primal Might (daily-ish cooldown). Each sells for 50-100g profit.", conditions = {} },
        { type = "note", text = "Alchemy: Craft Super Mana Potions and Elixirs for raiders. Consistent market.", conditions = {} },
        { type = "note", text = "Tailoring: Craft Netherweave Bags (always in demand). Also specialty cloth cooldowns.", conditions = {} },
        { type = "note", text = "Enchanting: Sell enchant scrolls on AH. Mongoose, Spellpower, and Healing Power are top sellers.", conditions = {} },
        { type = "note", text = "Blacksmithing: Craft and sell Adamantite Sharpening Stones and Weightstone.", conditions = {} },
        { type = "note", text = "Leatherworking: Drums of Battle are required for raiding. Consistent demand.", conditions = {} },

        -- Dungeon Farming
        { type = "note", text = "--- DUNGEON FARMING ---", conditions = {} },
        { type = "note", text = "Heroic Dungeons: Run Heroic Mechanar for Primal Fire drops and Badges of Justice.", conditions = {} },
        { type = "note", text = "Solo Farming: Paladins and Hunters can solo Slave Pens for herbs and greens.", conditions = {} },
        { type = "note", text = "Stratholme: Solo the undead side for Righteous Orbs and raw gold (vendor everything).", conditions = {} },

        -- Open World Farming
        { type = "note", text = "--- OPEN WORLD FARMING ---", conditions = {} },
        { type = "note", text = "Primal Fire: Farm in the Throne of Kil'jaeden area (Hellfire Peninsula) or Elemental Plateau.", conditions = {} },
        { type = "note", text = "Primal Water: Farm water elementals in Nagrand's Skysong Lake. 30-50g/hour.", conditions = {} },
        { type = "note", text = "Primal Air: Farm air elementals at Elemental Plateau in Nagrand. Competitive area.", conditions = {} },
        { type = "note", text = "Primal Mana: Farm mana worms in Netherstorm. Good consistent drops.", conditions = {} },
        { type = "note", text = "Mote of Shadow: Farm void walkers in Nagrand or Shadowmoon Valley.", conditions = {} },
        { type = "note", text = "Primal Life: Farm at the Spawning Glen in Zangarmarsh from bog giants.", conditions = {} },

        -- Daily Quests
        { type = "note", text = "--- DAILY QUESTS ---", conditions = {} },
        { type = "note", text = "Skyguard Dailies: 3-4 quests per day at Skettis for ~40-50g total.", conditions = {} },
        { type = "note", text = "Ogri'la Dailies: 3-4 quests in Blade's Edge for ~40-50g total.", conditions = {} },
        { type = "note", text = "Netherwing Dailies: Mine eggs and complete quests for gold while working toward mount.", conditions = {} },
        { type = "note", text = "Cooking/Fishing Dailies: Quick daily quests for ~10-15g each in Shattrath.", conditions = {} },
        { type = "note", text = "Total daily quest income: 100-150g per day for ~1 hour of work.", conditions = {} },

        -- AH Tips
        { type = "note", text = "--- AUCTION HOUSE TIPS ---", conditions = {} },
        { type = "note", text = "Scan the AH regularly for underpriced materials. Resell at market value.", conditions = {} },
        { type = "note", text = "Post items on Tuesday/Wednesday when raiders restock for the week.", conditions = {} },
        { type = "note", text = "Craft items from cheap mats: buy Netherweave Cloth, make bags. Buy herbs, make potions.", conditions = {} },
        { type = "note", text = "Watch for Primal market fluctuations. Buy low on weekends, sell high mid-week.", conditions = {} },
    },
})

BAG.Parser:RegisterGuideTable("Gold_Dailies", {
    title = "Gold Making: Daily Routine",
    faction = "Both",
    levelRange = {70, 70},
    category = "Gold",
    steps = {
        { type = "note", text = "=== OPTIMAL DAILY GOLD ROUTINE ===", conditions = {} },
        { type = "note", text = "Follow this routine each day for maximum gold efficiency.", conditions = {} },

        { type = "note", text = "Step 1: Log in, check AH for expired/sold items. Repost as needed.", conditions = {} },
        { type = "note", text = "Step 2: Do your profession cooldowns (Transmute, Specialty Cloth, etc).", conditions = {} },
        { type = "note", text = "Step 3: Complete Shattrath cooking and fishing dailies. Quick 15-20g.", conditions = {} },
        { type = "note", text = "Step 4: Fly to Ogri'la and complete the Blade's Edge daily quests. ~40g.", conditions = {} },
        { type = "note", text = "Step 5: Head to Skettis for Skyguard dailies. ~40g.", conditions = {} },
        { type = "note", text = "Step 6: If Netherwing is unlocked, complete those dailies for ~60g.", conditions = {} },
        { type = "note", text = "Step 7: Spend remaining time on farming routes or Heroic dungeons.", conditions = {} },
        { type = "note", text = "Step 8: Before logging off, post crafted items and gathered materials on the AH.", conditions = {} },

        { type = "note", text = "Expected daily income: 150-300g depending on time invested and profession.", conditions = {} },
        { type = "note", text = "Weekly target: 1000-2000g is very achievable with consistent play.", conditions = {} },
    },
})
