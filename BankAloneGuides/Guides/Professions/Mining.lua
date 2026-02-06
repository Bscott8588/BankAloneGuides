--[[
    Bank Alone Guides - Mining Profession Guide (1-375)
    SCS / Bank Alone Guides
    Original routing and material suggestions.
]]

local BAG = BankAlone

BAG.Parser:RegisterGuideTable("Profession_Mining", {
    title = "Mining 1-375",
    faction = "Both",
    levelRange = {1, 70},
    category = "Profession",
    steps = {
        { type = "note", text = "Mining Guide: Learn Mining from any capital city trainer. Purchase a Mining Pick.", conditions = {} },
        { type = "train", text = "Visit a Mining trainer in your capital city. Alliance: Geofram Bouldertoe in Ironforge. Horde: Makaru in Orgrimmar.", conditions = {} },

        -- 1-65: Copper
        { type = "note", text = "[1-65] Mine Copper Ore in any starting zone. Smelt Copper Bars at a forge.", conditions = {} },
        { type = "note", text = "Alliance: Elwynn Forest, Dun Morogh, or Darkshore. Horde: Durotar, Mulgore, or Tirisfal Glades.", conditions = {} },
        { type = "note", text = "Smelt all copper ore into bars for skill points up to ~50, then continue mining nodes.", conditions = {} },

        -- 65-125: Tin & Silver
        { type = "note", text = "[65-125] Mine Tin Ore (and occasional Silver). Good zones: Hillsbrad, Wetlands, Barrens, Redridge, Ashenvale.", conditions = {} },
        { type = "note", text = "Smelt Tin into Tin Bars, and combine Tin + Copper into Bronze Bars for extra points.", conditions = {} },
        { type = "note", text = "Train Journeyman Mining (skill 50) at your trainer.", conditions = {} },

        -- 125-175: Iron
        { type = "note", text = "[125-175] Mine Iron Ore. Best zones: Arathi Highlands, Desolace, Badlands, Stranglethorn Vale.", conditions = {} },
        { type = "note", text = "Smelt Iron Bars for a few skill points. Gold Ore nodes also appear in these zones.", conditions = {} },
        { type = "note", text = "Train Expert Mining (skill 125) at your trainer.", conditions = {} },

        -- 175-250: Mithril
        { type = "note", text = "[175-250] Mine Mithril Ore. Best zones: Tanaris, Badlands, Hinterlands, Felwood, Searing Gorge.", conditions = {} },
        { type = "note", text = "Tanaris is particularly good - run circles around the zone edges near mountains.", conditions = {} },
        { type = "note", text = "Truesilver Ore also appears in this range. Save it - valuable on the AH.", conditions = {} },
        { type = "note", text = "Train Artisan Mining (skill 200) from an Expert trainer.", conditions = {} },

        -- 250-300: Thorium
        { type = "note", text = "[250-300] Mine Thorium Ore. Best zones: Un'Goro Crater, Burning Steppes, Eastern Plaguelands, Winterspring.", conditions = {} },
        { type = "note", text = "Un'Goro Crater has the highest density of Small Thorium Veins. Run the edges of the crater.", conditions = {} },
        { type = "note", text = "At skill 275, Rich Thorium Veins appear in Burning Steppes and Winterspring.", conditions = {} },

        -- 300-325: Fel Iron
        { type = "note", text = "[300-325] Travel to Outland! Mine Fel Iron Ore in Hellfire Peninsula.", conditions = {} },
        { type = "note", text = "Train Master Mining (skill 275+) from Hurnak Grimmord (Honor Hold) or Krugosh (Thrallmar).", conditions = {} },
        { type = "note", text = "Hellfire Peninsula has excellent Fel Iron density. Follow the zone edges and around Hellfire Citadel.", conditions = {} },

        -- 325-350: Adamantite
        { type = "note", text = "[325-350] Mine Adamantite Ore. Best zones: Nagrand, Blade's Edge Mountains, Netherstorm.", conditions = {} },
        { type = "note", text = "Nagrand has great Adamantite spawn points along the mountain ridges.", conditions = {} },
        { type = "note", text = "Smelt Adamantite Bars - they sell well to Blacksmiths.", conditions = {} },

        -- 350-375: Khorium & Rich Adamantite
        { type = "note", text = "[350-375] Mine Rich Adamantite Deposits and Khorium Veins. Best zones: Netherstorm, Shadowmoon Valley.", conditions = {} },
        { type = "note", text = "Khorium is rare but valuable. Netherstorm has the best spawn density.", conditions = {} },
        { type = "note", text = "Continue mining any nodes you see. Rich Adamantite gives skill up to 375.", conditions = {} },
        { type = "note", text = "Mining 375 reached! Congratulations. Focus on farming Khorium and Adamantite for gold.", conditions = {} },
    },
})
