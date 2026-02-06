-------------------------------------------------------------------------------
-- Bank Alone Guides — Horde 64-65: Terokkar Forest
-- Original routing through the forest and Bone Wastes
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Horde_64_65_Terokkar", {
    title      = "Terokkar Forest (64-65)",
    faction    = "Horde",
    levelRange = { 64, 65 },
    zone       = "Terokkar Forest",
    steps = {
        { type = "fly",     destination = "Stonebreaker Hold", zone = "Terokkar Forest", text = "Fly to Stonebreaker Hold (Horde hub) in Terokkar" },
        { type = "fp",      zone = "Terokkar Forest", text = "Get the Stonebreaker Hold flight path" },
        { type = "note",    text = "Set Hearthstone at Stonebreaker Hold." },
        { type = "note",    text = "Pick up all quests: arakkoa hunting, timber wolf pelts, and Bone Wastes scouting." },
        { type = "kill",    target = "Arakkoa",                                    zone = "Terokkar Forest", x = 59.0, y = 56.0, text = "Assault arakkoa camps east of the hold" },
        { type = "accept",  questID = 9989, questName = "Refugee Assistance",      zone = "Terokkar Forest", x = 49.0, y = 45.0, text = "Help displaced residents near the road" },
        { type = "turnin",  questID = 9989, questName = "Refugee Assistance",      zone = "Terokkar Forest", x = 49.0, y = 45.0, text = "Complete the refugee aid" },
        { type = "accept",  questID = 10040, questName = "Bone Wastes Patrol",     zone = "Terokkar Forest", x = 49.0, y = 45.0, text = "Scout the Bone Wastes" },
        { type = "goto",    zone = "Terokkar Forest", x = 40.0, y = 72.0, text = "Head south into the Bone Wastes" },
        { type = "kill",    target = "Auchenai Death-Speakers",                    zone = "Terokkar Forest", x = 38.0, y = 70.0, text = "Defeat the death-speakers around Auchindoun" },
        { type = "kill",    target = "Shadow Council Forces",                      zone = "Terokkar Forest", x = 33.0, y = 76.0, text = "Eliminate Shadow Council warlocks in the south" },
        { type = "turnin",  questID = 10040, questName = "Bone Wastes Patrol",     zone = "Terokkar Forest", x = 49.0, y = 45.0, text = "Report the patrol findings" },
        { type = "goto",    zone = "Shattrath City", x = 52.0, y = 53.0, text = "Visit Shattrath for faction selection" },
        { type = "fp",      zone = "Shattrath City", text = "Get the Shattrath flight path" },
        { type = "note",    text = "Choose Aldor or Scryer. Complete remaining Terokkar quests, then head to Nagrand at 65." },
        { type = "hs",      text = "Hearthstone to Stonebreaker Hold" },
    },
})
