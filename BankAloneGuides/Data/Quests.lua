--[[
    Bank Alone Guides - Quest Data
    SCS / Bank Alone Guides
    
    Key quests used in the leveling guides. All summaries are original.
    Quest IDs and names are technical references only.
]]

local BAG = BankAlone

BAG.Data = BAG.Data or {}
BAG.Data.Quests = BAG.Data.Quests or {}

local Q = BAG.Data.Quests

-- Format: Q[questID] = { name, summary, levelRange, zone, faction, prereqs, followups }

-- ============================================================
-- ALLIANCE 1-10: ELWYNN FOREST
-- ============================================================
Q[783]  = { name = "A Threat Within", summary = "Report to the local marshal about growing dangers in Northshire.", levelRange = {1, 3}, zone = "Elwynn Forest", faction = "Alliance" }
Q[7]    = { name = "Kobold Camp Cleanup", summary = "Eliminate vermin that have infested the mining tunnels near Northshire.", levelRange = {1, 4}, zone = "Elwynn Forest", faction = "Alliance" }
Q[5261] = { name = "A New Threat", summary = "Deal with the bandits threatening the peaceful farms of Elwynn.", levelRange = {1, 4}, zone = "Elwynn Forest", faction = "Alliance" }
Q[15]   = { name = "Investigate Echo Ridge", summary = "Explore the mine and report on the kobold infestation inside.", levelRange = {2, 5}, zone = "Elwynn Forest", faction = "Alliance" }
Q[21]   = { name = "Skirmish at Echo Ridge", summary = "Clear out the deeper kobold presence in the mine.", levelRange = {3, 6}, zone = "Elwynn Forest", faction = "Alliance" }
Q[54]   = { name = "Report to Goldshire", summary = "Deliver dispatches to the Goldshire innkeeper.", levelRange = {5, 8}, zone = "Elwynn Forest", faction = "Alliance" }
Q[46]   = { name = "Goldtooth", summary = "Retrieve a stolen necklace from a particularly greedy kobold.", levelRange = {4, 7}, zone = "Elwynn Forest", faction = "Alliance" }
Q[40]   = { name = "A Fishy Peril", summary = "Alert the authorities about murloc activity near Crystal Lake.", levelRange = {5, 8}, zone = "Elwynn Forest", faction = "Alliance" }
Q[62]   = { name = "The Fargodeep Mine", summary = "Investigate strange happenings at the local mine south of Goldshire.", levelRange = {5, 8}, zone = "Elwynn Forest", faction = "Alliance" }
Q[76]   = { name = "Old Blanchy", summary = "Gather feed ingredients for a farmer's beloved horse.", levelRange = {6, 9}, zone = "Elwynn Forest", faction = "Alliance" }
Q[84]   = { name = "Westfall Stew", summary = "Collect ingredients from the surrounding farms for a hearty recipe.", levelRange = {7, 10}, zone = "Elwynn Forest", faction = "Alliance" }

-- ============================================================
-- ALLIANCE 1-10: DUN MOROGH
-- ============================================================
Q[170]  = { name = "Dwarven Outfitters", summary = "Gather pelts from local wildlife to supply the Coldridge garrison.", levelRange = {1, 3}, zone = "Dun Morogh", faction = "Alliance" }
Q[179]  = { name = "Wolves Across the Border", summary = "Thin out the wolf population threatening travelers near Coldridge.", levelRange = {1, 3}, zone = "Dun Morogh", faction = "Alliance" }
Q[182]  = { name = "Scalding Mornbrew Delivery", summary = "Deliver a hot beverage to a freezing guard on watch duty.", levelRange = {2, 5}, zone = "Dun Morogh", faction = "Alliance" }
Q[218]  = { name = "The Troll Cave", summary = "Venture into a nearby cave to deal with a troll encampment.", levelRange = {3, 6}, zone = "Dun Morogh", faction = "Alliance" }
Q[313]  = { name = "Frostmane Hold", summary = "Push deeper into troll territory and eliminate their leaders.", levelRange = {4, 7}, zone = "Dun Morogh", faction = "Alliance" }
Q[282]  = { name = "The Public Servant", summary = "Clear out troggs that have invaded the tunnels near Kharanos.", levelRange = {5, 8}, zone = "Dun Morogh", faction = "Alliance" }

-- ============================================================
-- ALLIANCE 1-10: TELDRASSIL
-- ============================================================
Q[457]  = { name = "The Balance of Nature", summary = "Help maintain the natural balance by thinning aggressive nightsabers.", levelRange = {1, 3}, zone = "Teldrassil", faction = "Alliance" }
Q[458]  = { name = "The Balance of Nature (2)", summary = "Continue restoring balance by dealing with fiercer creatures.", levelRange = {2, 5}, zone = "Teldrassil", faction = "Alliance" }
Q[459]  = { name = "The Woodland Protector", summary = "Assist a treant guardian with a corruption problem nearby.", levelRange = {3, 6}, zone = "Teldrassil", faction = "Alliance" }
Q[916]  = { name = "Crown of the Earth", summary = "Fill a special phial at a moonwell to investigate corruption.", levelRange = {4, 7}, zone = "Teldrassil", faction = "Alliance" }

-- ============================================================
-- ALLIANCE 1-10: AZUREMYST ISLE
-- ============================================================
Q[9279] = { name = "You Survived!", summary = "Recover from the crash landing and report to a nearby draenei survivor.", levelRange = {1, 3}, zone = "Azuremyst Isle", faction = "Alliance" }
Q[9280] = { name = "Replenishing the Healing Crystals", summary = "Gather blood moth samples to recharge damaged healing technology.", levelRange = {1, 4}, zone = "Azuremyst Isle", faction = "Alliance" }
Q[9283] = { name = "Volatile Mutations", summary = "Deal with mutated creatures affected by the crashed vessel's energy.", levelRange = {2, 5}, zone = "Azuremyst Isle", faction = "Alliance" }
Q[9294] = { name = "What Must Be Done...", summary = "Eliminate corrupted wildlife threatening the crash survivors.", levelRange = {3, 6}, zone = "Azuremyst Isle", faction = "Alliance" }

-- ============================================================
-- HORDE 1-10: DUROTAR
-- ============================================================
Q[788]  = { name = "Your Place In The World", summary = "Report to the sergeant to begin your service to the Horde.", levelRange = {1, 3}, zone = "Durotar", faction = "Horde" }
Q[790]  = { name = "Cutting Teeth", summary = "Prove your combat readiness by hunting boars in the Valley of Trials.", levelRange = {1, 3}, zone = "Durotar", faction = "Horde" }
Q[804]  = { name = "Sarkoth", summary = "Defeat a troublesome scorpion threatening the training grounds.", levelRange = {1, 4}, zone = "Durotar", faction = "Horde" }
Q[791]  = { name = "Sting of the Scorpid", summary = "Gather scorpion tails to help create antivenom supplies.", levelRange = {2, 5}, zone = "Durotar", faction = "Horde" }
Q[805]  = { name = "Vile Familiars", summary = "Clear out demonic imps that have crept into a nearby cave.", levelRange = {3, 6}, zone = "Durotar", faction = "Horde" }
Q[794]  = { name = "Galgar's Cactus Apple Surprise", summary = "Collect cactus apples for a hungry peon's favorite recipe.", levelRange = {2, 5}, zone = "Durotar", faction = "Horde" }
Q[840]  = { name = "A Peon's Burden", summary = "Deliver supplies from the Valley to the nearby settlement.", levelRange = {4, 7}, zone = "Durotar", faction = "Horde" }
Q[5441] = { name = "Lazy Peons", summary = "Wake up slacking peons who have fallen asleep on the job.", levelRange = {4, 7}, zone = "Durotar", faction = "Horde" }

-- ============================================================
-- HORDE 1-10: MULGORE
-- ============================================================
Q[747]  = { name = "The Hunt Begins", summary = "Prove yourself as a hunter by gathering plainstrider feathers.", levelRange = {1, 3}, zone = "Mulgore", faction = "Horde" }
Q[745]  = { name = "A Humble Task", summary = "Deliver a message to the elder at the base of the mesa.", levelRange = {1, 3}, zone = "Mulgore", faction = "Horde" }
Q[746]  = { name = "A Humble Task (2)", summary = "Continue carrying important messages between tribal leaders.", levelRange = {2, 5}, zone = "Mulgore", faction = "Horde" }
Q[752]  = { name = "Mazzranache", summary = "Track down an elusive tallstrider roaming the plains.", levelRange = {4, 7}, zone = "Mulgore", faction = "Horde" }

-- ============================================================
-- HORDE 1-10: TIRISFAL GLADES
-- ============================================================
Q[363]  = { name = "Rude Awakening", summary = "Rise from the crypt and report to the deathguard above.", levelRange = {1, 3}, zone = "Tirisfal Glades", faction = "Horde" }
Q[364]  = { name = "The Damned", summary = "Destroy mindless undead shambling near the starting crypt.", levelRange = {1, 4}, zone = "Tirisfal Glades", faction = "Horde" }
Q[376]  = { name = "Marla's Last Wish", summary = "Retrieve a memento from a farmstead overrun by undead.", levelRange = {2, 5}, zone = "Tirisfal Glades", faction = "Horde" }
Q[380]  = { name = "The Mills Overrun", summary = "Deal with threats at the abandoned mills north of Brill.", levelRange = {5, 8}, zone = "Tirisfal Glades", faction = "Horde" }

-- ============================================================
-- HORDE 1-10: EVERSONG WOODS
-- ============================================================
Q[8325] = { name = "Reclaiming Sunstrider Isle", summary = "Clear mana-warped creatures from the blood elf homeland.", levelRange = {1, 3}, zone = "Eversong Woods", faction = "Horde" }
Q[8326] = { name = "Unfortunate Measures", summary = "Gather lynx collars to assess the state of local wildlife.", levelRange = {1, 4}, zone = "Eversong Woods", faction = "Horde" }
Q[8327] = { name = "Report to Lanthan Perilon", summary = "Deliver reconnaissance to an officer deeper in the woods.", levelRange = {3, 5}, zone = "Eversong Woods", faction = "Horde" }
Q[8330] = { name = "Aggression", summary = "Reduce the threat posed by wretched elves in the area.", levelRange = {4, 7}, zone = "Eversong Woods", faction = "Horde" }

-- ============================================================
-- SHARED / KEY QUESTS 10-60
-- ============================================================
Q[65]   = { name = "Westfall Stew", summary = "Gather ingredients for a special stew recipe in Westfall.", levelRange = {10, 15}, zone = "Westfall", faction = "Alliance" }
Q[176]  = { name = "Wanted: Hogger", summary = "Track down and defeat the notorious gnoll chieftain near Goldshire.", levelRange = {8, 11}, zone = "Elwynn Forest", faction = "Alliance" }
Q[26]   = { name = "The People's Militia", summary = "Join the organized defense against the Defias threat in Westfall.", levelRange = {10, 15}, zone = "Westfall", faction = "Alliance" }
Q[153]  = { name = "The Defias Brotherhood", summary = "Uncover the conspiracy behind the organized bandit network.", levelRange = {14, 18}, zone = "Westfall", faction = "Alliance" }
Q[166]  = { name = "The Deadmines", summary = "Venture into the secret lair beneath Moonbrook to end the threat.", levelRange = {17, 24}, zone = "Westfall", faction = "Alliance" }

Q[842]  = { name = "Report to Sen'jin Village", summary = "Travel south to deliver urgent news to the troll settlement.", levelRange = {5, 8}, zone = "Durotar", faction = "Horde" }
Q[825]  = { name = "Crossroads Delivery", summary = "Carry supplies to the Crossroads, the Horde hub of the Barrens.", levelRange = {10, 14}, zone = "The Barrens", faction = "Horde" }
Q[844]  = { name = "Plainstrider Menace", summary = "Reduce the aggressive plainstrider population near the roads.", levelRange = {10, 14}, zone = "The Barrens", faction = "Horde" }
Q[870]  = { name = "Raptor Thieves", summary = "Recover stolen supplies from clever raptors south of the Crossroads.", levelRange = {12, 16}, zone = "The Barrens", faction = "Horde" }
Q[871]  = { name = "The Forgotten Pools", summary = "Investigate strange occurrences at the oasis near the Crossroads.", levelRange = {13, 17}, zone = "The Barrens", faction = "Horde" }

-- ============================================================
-- OUTLAND KEY QUESTS (58-70)
-- ============================================================
Q[10119] = { name = "Through the Dark Portal", summary = "Enter Outland through the Dark Portal and report to the forward camp.", levelRange = {58, 60}, zone = "Hellfire Peninsula", faction = "Alliance" }
Q[10120] = { name = "Through the Dark Portal", summary = "Enter Outland through the Dark Portal and report to the Horde base.", levelRange = {58, 60}, zone = "Hellfire Peninsula", faction = "Horde" }
Q[10121] = { name = "Arrival in Outland", summary = "Secure the Alliance foothold at Honor Hold in Hellfire Peninsula.", levelRange = {58, 60}, zone = "Hellfire Peninsula", faction = "Alliance" }
Q[10289] = { name = "Bonechewer Blood", summary = "Gather blood samples from the fel orc encampments in Hellfire.", levelRange = {58, 61}, zone = "Hellfire Peninsula", faction = "Both" }
Q[10078] = { name = "The Path of Anguish", summary = "Fight through fel orc territory to reach a strategic overlook.", levelRange = {59, 62}, zone = "Hellfire Peninsula", faction = "Both" }
Q[9752]  = { name = "Cruel Taskmasters", summary = "Free slaves from the Hellfire Citadel's mining operations.", levelRange = {59, 62}, zone = "Hellfire Peninsula", faction = "Alliance" }
Q[9607]  = { name = "Helboar, the Other White Meat", summary = "Collect boar meat to feed the hungry troops at the outpost.", levelRange = {58, 61}, zone = "Hellfire Peninsula", faction = "Horde" }

Q[9747]  = { name = "Warden Hamoot", summary = "Report to the Cenarion warden overseeing Zangarmarsh operations.", levelRange = {60, 63}, zone = "Zangarmarsh", faction = "Both" }
Q[9714]  = { name = "The Umbrafen Tribe", summary = "Investigate the hostile lost ones lurking in the southern marshes.", levelRange = {60, 64}, zone = "Zangarmarsh", faction = "Both" }
Q[9753]  = { name = "Plants of Zangarmarsh", summary = "Catalog the unique fungal specimens growing throughout the marsh.", levelRange = {61, 64}, zone = "Zangarmarsh", faction = "Both" }

Q[9998]  = { name = "The Infested Protectors", summary = "Help cure the infested ancients in Terokkar's forests.", levelRange = {62, 65}, zone = "Terokkar Forest", faction = "Both" }
Q[10039] = { name = "Torgos!", summary = "Defeat the massive arakkoa threat terrorizing the bone wastes.", levelRange = {63, 66}, zone = "Terokkar Forest", faction = "Both" }

Q[9861]  = { name = "Do My Eyes Deceive Me?", summary = "Investigate the Burning Blade presence in the Nagrand wilds.", levelRange = {64, 67}, zone = "Nagrand", faction = "Both" }
Q[9918]  = { name = "The Ring of Blood", summary = "Fight through a series of arena battles for fame and fortune.", levelRange = {65, 67}, zone = "Nagrand", faction = "Both" }

Q[10488] = { name = "Killing the Crawlers", summary = "Clear out the ravager infestation in the mountain passes.", levelRange = {65, 68}, zone = "Blade's Edge Mountains", faction = "Both" }
Q[10518] = { name = "Ogre Heaven", summary = "Infiltrate the ogre settlements to disrupt their operations.", levelRange = {66, 68}, zone = "Blade's Edge Mountains", faction = "Both" }

Q[10338] = { name = "Consortium Crystal Collection", summary = "Gather ethereal crystals for the Consortium's trade operations.", levelRange = {67, 70}, zone = "Netherstorm", faction = "Both" }
Q[10424] = { name = "Manaforge B'naar", summary = "Sabotage the blood elf manaforge draining Netherstorm's energy.", levelRange = {67, 70}, zone = "Netherstorm", faction = "Both" }

Q[10551] = { name = "Karabor Training Grounds", summary = "Prove your worth at the Shadowmoon training facility.", levelRange = {67, 70}, zone = "Shadowmoon Valley", faction = "Both" }
Q[10583] = { name = "The Cipher of Damnation", summary = "Unravel the ancient cipher to understand Shadowmoon's dark history.", levelRange = {68, 70}, zone = "Shadowmoon Valley", faction = "Both" }
