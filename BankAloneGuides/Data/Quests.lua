-------------------------------------------------------------------------------
-- Bank Alone Guides — Data / Quests
-- Key quest references for TBC Classic Anniversary
-- All summaries are original content — not Blizzard quest text
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Data.Quests = BAG.Data.Quests or {}

-- Quest entry format:
-- [questID] = { name, summary, levelRange, zone, faction, prereqs, followups }
BAG.Data.Quests.List = {

    -- ══════════════════════════════════════════════════════════════════
    -- ELWYNN FOREST (Alliance 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [783]  = { name = "Eagan Peltskinner",  summary = "Assist a local trapper by gathering wolf pelts around Northshire",                        levelRange = {1, 4},   zone = "Elwynn Forest", faction = "Alliance" },
    [7]    = { name = "Kobold Camp Cleanup", summary = "Clear out the kobold infestation threatening Northshire's mine workers",                  levelRange = {1, 4},   zone = "Elwynn Forest", faction = "Alliance" },
    [15]   = { name = "Investigate Echo Ridge", summary = "Scout the Echo Ridge Mine to assess the kobold threat within",                        levelRange = {2, 5},   zone = "Elwynn Forest", faction = "Alliance" },
    [21]   = { name = "Report to Goldshire", summary = "Deliver news of Northshire's safety to the Goldshire marshal",                           levelRange = {5, 8},   zone = "Elwynn Forest", faction = "Alliance", prereqs = {15} },
    [54]   = { name = "Protect the Frontier", summary = "Hunt aggressive wildlife that threatens travelers along the roads",                     levelRange = {5, 8},   zone = "Elwynn Forest", faction = "Alliance" },
    [83]   = { name = "Riverpaw Bandits",    summary = "Deal with the gnoll raiders harassing farmers near the western border",                  levelRange = {7, 10},  zone = "Elwynn Forest", faction = "Alliance" },
    [40]   = { name = "A Fishy Peril",       summary = "Investigate reports of murlocs moving inland from Crystal Lake",                          levelRange = {7, 10},  zone = "Elwynn Forest", faction = "Alliance" },

    -- ══════════════════════════════════════════════════════════════════
    -- DUN MOROGH (Alliance 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [170]  = { name = "A New Threat",        summary = "The troggs are emerging from the mountains; thin their numbers",                          levelRange = {1, 4},   zone = "Dun Morogh", faction = "Alliance" },
    [179]  = { name = "Dwarven Outfitters",  summary = "Gather thick pelts from local wildlife for the cold weather ahead",                      levelRange = {1, 4},   zone = "Dun Morogh", faction = "Alliance" },
    [218]  = { name = "Ice and Fire",        summary = "Use a frost-resistant torch to seal a dangerous cave entrance",                           levelRange = {4, 7},   zone = "Dun Morogh", faction = "Alliance" },
    [313]  = { name = "Kharanos Hub",        summary = "Report to the innkeeper at Kharanos for your next set of assignments",                   levelRange = {6, 10},  zone = "Dun Morogh", faction = "Alliance" },

    -- ══════════════════════════════════════════════════════════════════
    -- TELDRASSIL (Alliance 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [456]  = { name = "The Balance of Nature", summary = "Maintain the forest's balance by thinning aggressive nightsaber populations",           levelRange = {1, 4},   zone = "Teldrassil", faction = "Alliance" },
    [457]  = { name = "Fel Moss Gathering",    summary = "Collect samples of the corrupted moss spreading through Shadowglen",                   levelRange = {2, 5},   zone = "Teldrassil", faction = "Alliance" },
    [916]  = { name = "Crown of the Earth",    summary = "Fill a special vial at the moonwell to help heal the World Tree",                      levelRange = {4, 8},   zone = "Teldrassil", faction = "Alliance" },
    [475]  = { name = "Dolanaar Delivery",     summary = "Bring supplies to the settlement of Dolanaar deeper in Teldrassil",                    levelRange = {5, 8},   zone = "Teldrassil", faction = "Alliance" },

    -- ══════════════════════════════════════════════════════════════════
    -- AZUREMYST ISLE (Alliance 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [9279] = { name = "Replenishing the Healing Crystals", summary = "Gather blood moth wings to recharge the Exodar's healing technology",      levelRange = {1, 4},   zone = "Azuremyst Isle", faction = "Alliance" },
    [9280] = { name = "Volatile Mutations",  summary = "Eliminate mutated wildlife caused by the crashed vessel's energy leaks",                  levelRange = {2, 5},   zone = "Azuremyst Isle", faction = "Alliance" },
    [9283] = { name = "Rescue the Survivors!", summary = "Locate and aid draenei survivors scattered around the crash site",                     levelRange = {4, 7},   zone = "Azuremyst Isle", faction = "Alliance" },

    -- ══════════════════════════════════════════════════════════════════
    -- DUROTAR (Horde 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [788]  = { name = "Sarkoth",             summary = "Prove your worth by defeating a dangerous scorpion in the Valley of Trials",              levelRange = {1, 4},   zone = "Durotar", faction = "Horde" },
    [790]  = { name = "Lazy Peons",          summary = "Motivate the sleeping peons who should be working in the lumber camp",                    levelRange = {1, 4},   zone = "Durotar", faction = "Horde" },
    [840]  = { name = "Vile Familiars",      summary = "Clear the corrupted imps from a cave near the Valley of Trials",                         levelRange = {2, 5},   zone = "Durotar", faction = "Horde" },
    [806]  = { name = "Report to Razor Hill", summary = "Deliver your graduation report to the sergeant at Razor Hill outpost",                  levelRange = {5, 8},   zone = "Durotar", faction = "Horde" },

    -- ══════════════════════════════════════════════════════════════════
    -- TIRISFAL GLADES (Horde 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [363]  = { name = "Rude Awakening",      summary = "Begin your new existence as a Forsaken and speak with the local overseer",                levelRange = {1, 3},   zone = "Tirisfal Glades", faction = "Horde" },
    [364]  = { name = "Mindless Ones",       summary = "Put down the truly lost undead who wander aimlessly near the graveyard",                  levelRange = {1, 4},   zone = "Tirisfal Glades", faction = "Horde" },
    [376]  = { name = "Fields of Grief",     summary = "Gather pumpkins from the farmlands that the Forsaken now claim",                          levelRange = {4, 7},   zone = "Tirisfal Glades", faction = "Horde" },
    [382]  = { name = "The Mills Overrun",   summary = "Investigate and clear the gnoll threat at the Agamand Mills",                             levelRange = {7, 10},  zone = "Tirisfal Glades", faction = "Horde" },

    -- ══════════════════════════════════════════════════════════════════
    -- MULGORE (Horde 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [747]  = { name = "The Hunt Begins",     summary = "Your first rite of passage: hunt the plainstriders of Mulgore",                           levelRange = {1, 4},   zone = "Mulgore", faction = "Horde" },
    [757]  = { name = "Rite of Strength",    summary = "Demonstrate your prowess by defeating bristleback intruders",                             levelRange = {2, 5},   zone = "Mulgore", faction = "Horde" },
    [761]  = { name = "Rite of Vision",      summary = "Embark on a spirit walk guided by the elders' wisdom",                                    levelRange = {4, 7},   zone = "Mulgore", faction = "Horde" },

    -- ══════════════════════════════════════════════════════════════════
    -- EVERSONG WOODS (Horde 1-10)
    -- ══════════════════════════════════════════════════════════════════
    [8325] = { name = "Reclaiming Sunstrider Isle", summary = "Defeat the arcane constructs that have gone haywire on the isle",                  levelRange = {1, 4},   zone = "Eversong Woods", faction = "Horde" },
    [8326] = { name = "Unfortunate Measures",       summary = "Deal with the mana wyrms that feed recklessly on ley-line energy",                levelRange = {1, 4},   zone = "Eversong Woods", faction = "Horde" },
    [8327] = { name = "Completing the Delivery",    summary = "Bring a package to Falconwing Square from Sunstrider Isle",                       levelRange = {4, 6},   zone = "Eversong Woods", faction = "Horde" },

    -- ══════════════════════════════════════════════════════════════════
    -- WESTFALL (Alliance 10-20)
    -- ══════════════════════════════════════════════════════════════════
    [36]   = { name = "The People's Militia", summary = "Join the Westfall militia to combat the Defias Brotherhood's growing power",             levelRange = {10, 14}, zone = "Westfall", faction = "Alliance" },
    [64]   = { name = "The Defias Brotherhood", summary = "Uncover the Defias leadership and their hidden operations",                           levelRange = {14, 18}, zone = "Westfall", faction = "Alliance", prereqs = {36} },
    [153]  = { name = "Red Linen Goods",     summary = "Collect linen cloth for the struggling settlers of Sentinel Hill",                        levelRange = {10, 12}, zone = "Westfall", faction = "Alliance" },

    -- ══════════════════════════════════════════════════════════════════
    -- HELLFIRE PENINSULA (Both 58-63)
    -- ══════════════════════════════════════════════════════════════════
    [10119] = { name = "Arrival in Outland",   summary = "Report to the forward camp after crossing through the Dark Portal",                    levelRange = {58, 60}, zone = "Hellfire Peninsula", faction = "Alliance" },
    [10120] = { name = "Through the Dark Portal (H)", summary = "Report to the Horde encampment after arriving in Outland",                     levelRange = {58, 60}, zone = "Hellfire Peninsula", faction = "Horde" },
    [10121] = { name = "Legion Assault",       summary = "Help defend the camp from an incoming wave of demonic attackers",                      levelRange = {58, 60}, zone = "Hellfire Peninsula", faction = "Both" },
    [10160] = { name = "Bonechewer Cleanup",   summary = "Reduce the numbers of the savage orc clan harassing supply routes",                    levelRange = {60, 62}, zone = "Hellfire Peninsula", faction = "Both" },
    [10165] = { name = "Honor Hold Provisions", summary = "Gather supplies scattered across the battlefield for the garrison",                   levelRange = {58, 60}, zone = "Hellfire Peninsula", faction = "Alliance" },
    [10289] = { name = "Thrallmar Assignments", summary = "Complete initial tasks at Thrallmar to establish your presence",                      levelRange = {58, 60}, zone = "Hellfire Peninsula", faction = "Horde" },

    -- ══════════════════════════════════════════════════════════════════
    -- ZANGARMARSH (Both 60-64)
    -- ══════════════════════════════════════════════════════════════════
    [9747]  = { name = "The Cenarion Expedition", summary = "Aid the druids in studying the unique ecosystem of the marshlands",                 levelRange = {60, 62}, zone = "Zangarmarsh", faction = "Both" },
    [9752]  = { name = "Naga Infestation",        summary = "Investigate the naga presence draining the marsh's water supply",                   levelRange = {61, 63}, zone = "Zangarmarsh", faction = "Both" },
    [9770]  = { name = "Spore Samples",           summary = "Collect mushroom spore samples for the Cenarion researchers",                       levelRange = {62, 64}, zone = "Zangarmarsh", faction = "Both" },

    -- ══════════════════════════════════════════════════════════════════
    -- TEROKKAR FOREST (Both 62-65)
    -- ══════════════════════════════════════════════════════════════════
    [9989]  = { name = "Refugee Assistance",    summary = "Help the displaced residents around the forest settlement",                           levelRange = {62, 64}, zone = "Terokkar Forest", faction = "Both" },
    [10040] = { name = "Bone Wastes Patrol",    summary = "Scout the desolate bone fields for signs of Burning Legion activity",                 levelRange = {63, 65}, zone = "Terokkar Forest", faction = "Both" },

    -- ══════════════════════════════════════════════════════════════════
    -- NAGRAND (Both 64-67)
    -- ══════════════════════════════════════════════════════════════════
    [9861]  = { name = "The Throne of Elements", summary = "Investigate the disrupted elemental forces at the sacred plateau",                   levelRange = {64, 66}, zone = "Nagrand", faction = "Both" },
    [9862]  = { name = "Murkblood Raiders",     summary = "Eliminate the Murkblood broken draenei threatening Garadar",                          levelRange = {65, 67}, zone = "Nagrand", faction = "Horde" },
    [9863]  = { name = "The Nesingwary Safari", summary = "Participate in the famous hunter's big game challenges in Nagrand",                   levelRange = {65, 67}, zone = "Nagrand", faction = "Both" },

    -- ══════════════════════════════════════════════════════════════════
    -- BLADE'S EDGE MOUNTAINS (Both 65-68)
    -- ══════════════════════════════════════════════════════════════════
    [10519] = { name = "Ogre Wrangling",        summary = "Help thin the ogre population threatening the mountain passes",                       levelRange = {65, 67}, zone = "Blade's Edge Mountains", faction = "Both" },
    [10521] = { name = "Crystal Corruption",    summary = "Investigate strange crystal growths altering the local wildlife",                     levelRange = {66, 68}, zone = "Blade's Edge Mountains", faction = "Both" },

    -- ══════════════════════════════════════════════════════════════════
    -- NETHERSTORM (Both 67-70)
    -- ══════════════════════════════════════════════════════════════════
    [10173] = { name = "Mana Forge Investigation", summary = "Infiltrate and sabotage the blood elf mana-siphoning operations",                 levelRange = {67, 69}, zone = "Netherstorm", faction = "Both" },
    [10211] = { name = "Eco-Dome Rescue",          summary = "Help the trapped researchers inside the bio-dome facilities",                     levelRange = {68, 70}, zone = "Netherstorm", faction = "Both" },

    -- ══════════════════════════════════════════════════════════════════
    -- SHADOWMOON VALLEY (Both 67-70)
    -- ══════════════════════════════════════════════════════════════════
    [10568] = { name = "Assault on the Dark Portal Remnants", summary = "Launch attacks against the Legion's remaining strongholds",             levelRange = {67, 69}, zone = "Shadowmoon Valley", faction = "Both" },
    [10570] = { name = "The Cipher of Damnation",             summary = "Piece together an ancient cipher to unlock powerful knowledge",         levelRange = {69, 70}, zone = "Shadowmoon Valley", faction = "Both" },
}

--- Get quest data by ID.
function BAG.Data.Quests:Get(questID)
    return self.List[questID]
end

--- Get quest name by ID.
function BAG.Data.Quests:GetName(questID)
    local q = self.List[questID]
    return q and q.name or ("Quest #" .. tostring(questID))
end

--- Find quests by zone.
function BAG.Data.Quests:GetByZone(zoneName)
    local results = {}
    for id, quest in pairs(self.List) do
        if quest.zone == zoneName then
            results[#results + 1] = { id = id, data = quest }
        end
    end
    return results
end
