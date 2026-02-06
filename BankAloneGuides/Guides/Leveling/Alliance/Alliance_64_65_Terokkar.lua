-------------------------------------------------------------------------------
-- Bank Alone Guides — Alliance 64-65: Terokkar Forest
-- Original routing through the forest and Bone Wastes
-- (c) Bradley S. Scott — All rights reserved
-------------------------------------------------------------------------------
local BAG = BankAlone

BAG.Parser:RegisterGuide("Alliance_64_65_Terokkar", {
    title      = "Terokkar Forest (64-65)",
    faction    = "Alliance",
    levelRange = { 64, 65 },
    zone       = "Terokkar Forest",
    steps = {
        { type = "fly",     destination = "Allerian Stronghold", zone = "Terokkar Forest", text = "Fly or ride to Allerian Stronghold in Terokkar" },
        { type = "fp",      zone = "Terokkar Forest", text = "Grab the Allerian Stronghold flight path" },
        { type = "note",    text = "Set your Hearthstone at the Allerian Stronghold inn." },
        { type = "accept",  questID = 9989, questName = "Refugee Assistance",      zone = "Terokkar Forest", x = 57.0, y = 53.0, text = "Help the refugees around the Cenarion outpost" },
        { type = "note",    text = "Pick up all quests at the stronghold." },
        { type = "kill",    target = "Arakkoa",                                    zone = "Terokkar Forest", x = 60.0, y = 42.0, text = "Clear the arakkoa bird-men in the eastern forests" },
        { type = "turnin",  questID = 9989, questName = "Refugee Assistance",      zone = "Terokkar Forest", x = 57.0, y = 53.0, text = "Return to the stronghold" },
        { type = "accept",  questID = 10040, questName = "Bone Wastes Patrol",     zone = "Terokkar Forest", x = 51.4, y = 45.3, text = "Scout the Bone Wastes for Legion activity" },
        { type = "goto",    zone = "Terokkar Forest", x = 39.0, y = 72.0, text = "Head south into the Bone Wastes" },
        { type = "kill",    target = "Auchenai Spirits",                           zone = "Terokkar Forest", x = 40.0, y = 70.0, text = "Deal with the restless spirits around Auchindoun" },
        { type = "kill",    target = "Shadow Council Warlocks",                    zone = "Terokkar Forest", x = 33.0, y = 74.0, text = "Eliminate Shadow Council forces in the southern wastes" },
        { type = "turnin",  questID = 10040, questName = "Bone Wastes Patrol",     zone = "Terokkar Forest", x = 51.4, y = 45.3, text = "Report the patrol findings" },
        { type = "note",    text = "Visit Shattrath City for the faction selection quest if you haven't yet." },
        { type = "goto",    zone = "Shattrath City", x = 52.0, y = 53.0, text = "Travel to Shattrath City" },
        { type = "fp",      zone = "Shattrath City", text = "Get the Shattrath flight path" },
        { type = "note",    text = "Choose Aldor or Scryer faction. Complete remaining Terokkar quests, then head to Nagrand at 65." },
        { type = "hs",      text = "Hearthstone to Allerian Stronghold" },
    },
})
