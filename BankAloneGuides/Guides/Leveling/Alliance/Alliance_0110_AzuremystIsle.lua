--[[
    Bank Alone Guides - Alliance 1-10: Azuremyst Isle
    SCS / Bank Alone Guides
    
    Starting zone for Draenei. Original routing.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Alliance_0110_AzuremystIsle", {
    title = "Alliance 1-10: Azuremyst Isle",
    faction = "Alliance",
    levelRange = {1, 10},
    category = "Leveling",
    nextGuide = "Alliance_1020",
    steps = {
        { type = "accept", questID = 9279, text = "Recover from the crash and speak to the draenei survivor near the wreckage.", zone = "Azuremyst Isle", x = 52.4, y = 42.8, conditions = {} },
        { type = "turnin", questID = 9279, text = "Report to the nearby medic at the crash site.", zone = "Azuremyst Isle", x = 52.4, y = 42.8, conditions = {} },
        { type = "accept", questID = 9280, text = "Accept the quest to replenish healing crystals using blood moth samples.", zone = "Azuremyst Isle", x = 52.4, y = 42.8, conditions = {} },
        { type = "kill", questID = 9280, text = "Hunt blood moths in the crash area to gather their essence for the crystals.", zone = "Azuremyst Isle", x = 53.0, y = 44.0, target = "Vale Moth", conditions = {} },
        { type = "turnin", questID = 9280, text = "Return the samples and help restore the healing technology.", zone = "Azuremyst Isle", x = 52.4, y = 42.8, conditions = {} },
        { type = "accept", questID = 9283, text = "Take the quest to handle volatile mutations around the crash site.", zone = "Azuremyst Isle", x = 52.4, y = 42.8, conditions = {} },
        { type = "kill", questID = 9283, text = "Eliminate the mutated creatures that were warped by the vessel's energy.", zone = "Azuremyst Isle", x = 50.0, y = 45.0, target = "Volatile Mutation", conditions = {} },
        { type = "turnin", questID = 9283, text = "Report the mutations dealt with.", zone = "Azuremyst Isle", x = 52.4, y = 42.8, conditions = {} },
        { type = "accept", questID = 9294, text = "Pick up the follow-up quest to clear corrupted moonkin.", zone = "Azuremyst Isle", x = 52.4, y = 42.8, conditions = {} },
        { type = "kill", questID = 9294, text = "Defeat the corrupted owlkin east of the crash site.", zone = "Azuremyst Isle", x = 55.0, y = 42.0, target = "Moonkin", conditions = {} },
        { type = "turnin", questID = 9294, text = "Return and confirm the area is cleared.", zone = "Azuremyst Isle", x = 52.4, y = 42.8, conditions = {} },
        { type = "note", text = "You should be around level 4-5 now. Head south toward Azure Watch.", zone = "Azuremyst Isle", conditions = {} },
        { type = "goto", text = "Follow the path south to Azure Watch, the main draenei settlement.", zone = "Azuremyst Isle", x = 48.5, y = 52.0, conditions = {} },
        { type = "note", text = "Set your hearthstone at the inn in Azure Watch.", zone = "Azuremyst Isle", conditions = {} },
        { type = "note", text = "Pick up all quests in Azure Watch. Multiple quest givers offer tasks in every direction.", conditions = {} },
        { type = "note", text = "Work through the quest chains around the island: owlkin caves to the west, furbolg camp to the east, and murlocs along the coast.", conditions = {} },
        { type = "note", text = "Visit Odesyus' Landing on the southern shore for a chain of quests about a shipwreck.", zone = "Azuremyst Isle", x = 47.0, y = 70.0, conditions = {} },
        { type = "level", targetLevel = 10, text = "Complete the remaining Azuremyst Isle quests to reach level 10.", conditions = {} },
        { type = "note", text = "At level 10, visit class trainers at the Exodar, then proceed to Bloodmyst Isle or take the boat toward Darkshore to join the shared leveling route.", conditions = {} },
    },
})
