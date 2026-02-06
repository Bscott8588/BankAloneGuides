# Bank Alone Guides

**Version:** 1.0.0  
**Author:** Bradley S. Scott  
**Game:** World of Warcraft - Burning Crusade Classic Anniversary  
**Type:** Leveling & Profession Guide Addon

## Features

### Core Features
- **Complete 1-70 Leveling Guides** for both Alliance and Horde factions
- **Smart Start System** - Automatically detects your character level and zone, starting you in the most appropriate guide
- **Race-Specific Starting Guides** - Tailored paths for all TBC races (Human, Dwarf, Gnome, Night Elf, Draenei, Orc, Troll, Tauren, Undead, Blood Elf)
- **Outland Content** - Full 58-70 Burning Crusade guides for Hellfire Peninsula through Shadowmoon Valley
- **Profession Guides** - Leveling paths for all gathering and crafting professions (1-375)
- **Gold Farming Guides** - Tips and strategies for making gold at all levels

### UI Features
- **Modern Neon-Blue Theme** - Clean, original SCS-branded interface
- **Movable & Resizable** - Customize the window to fit your screen
- **Step-by-Step Navigation** - Clear instructions with coordinates and zone information
- **Auto-Advance** - Steps automatically complete when objectives are met
- **Progress Tracking** - Visual progress bar showing guide completion
- **Condition System** - Steps adapt based on your class, race, level, and quests

### Technical Features
- **Smart Quest Tracking** - Integrates with WoW's quest system
- **Zone Detection** - Knows where you are and suggests appropriate content
- **Saved Progress** - Remembers your position across logins
- **Per-Character Data** - Each character has independent progress
- **Lightweight & Efficient** - Minimal performance impact

## Installation

1. Download the `BankAloneGuides` folder
2. Copy it to your WoW AddOns directory:
   ```
   C:\Program Files (x86)\World of Warcraft\_anniversary_\Interface\AddOns\
   ```
3. Restart World of Warcraft or reload UI with `/reload`
4. The addon will automatically start with an appropriate guide for your character

## Commands

- `/bag` - Toggle the guide window
- `/bag show` - Show the guide window
- `/bag hide` - Hide the guide window
- `/bag next` - Go to the next step
- `/bag prev` - Go to the previous step
- `/bag reload` - Reload and find the best guide for your character
- `/bag debug` - Toggle debug mode
- `/bag help` - Show all commands

## Guide Structure

### Alliance Leveling
- Human 1-10 (Elwynn Forest)
- Dwarf/Gnome 1-10 (Dun Morogh)
- Night Elf 1-10 (Teldrassil)
- Draenei 1-10 (Azuremyst Isle)
- Alliance 10-20 (Westfall/Loch Modan)
- Alliance 20-30 (Redridge/Duskwood)
- Alliance 30-40 (Stranglethorn Vale)
- Alliance 40-50 (Tanaris/Feralas)
- Alliance 50-58 (Western Plaguelands/Winterspring)
- Alliance 58-70 (Outland Complete)

### Horde Leveling
- Orc/Troll 1-10 (Durotar)
- Tauren 1-10 (Mulgore)
- Undead 1-10 (Tirisfal Glades)
- Blood Elf 1-10 (Eversong Woods)
- Horde 10-20 (The Barrens)
- Horde 20-30 (Stonetalon/Hillsbrad)
- Horde 30-40 (Stranglethorn Vale)
- Horde 40-50 (Tanaris/Feralas)
- Horde 50-58 (Eastern Plaguelands/Winterspring)
- Horde 58-70 (Outland Complete)

### Profession Guides
- Mining (1-375)
- Herbalism (1-375)
- Skinning (1-375)
- Blacksmithing (1-375)
- Engineering (1-375)
- Leatherworking (1-375)
- Tailoring (1-375)
- Enchanting (1-375)
- Alchemy (1-375)
- Cooking (1-375)
- Fishing (1-375)
- First Aid (1-375)

### Gold Guides
- Farming Routes
- Profession Gold Making
- Dungeon Farming
- Daily Quests

## Architecture

The addon is built with a modular architecture:

- **Core/** - Main engine, events, conditions, saved variables
- **API/** - Wrappers for WoW APIs (quest, player, inventory, spell, map)
- **Data/** - Databases of NPCs, quests, zones, items, trainers, vendors
- **Navigation/** - Smart routing, zone detection, quest tracking
- **UI/** - Complete interface system with custom theme
- **Guides/** - All guide content and parser
- **Branding/** - SCS theme and styling

## Legal & Content

All guide content is **completely original** and not copied from any other source. Quest IDs, NPC IDs, and zone names are used as technical references only. All descriptions, routing, and instructional text is original work.

This addon does NOT:
- Copy Blizzard's quest text
- Copy Zygor or any other commercial addon
- Violate any copyrights or intellectual property

## Support

For bug reports, feature requests, or support:
- Website: https://bankalone.gg
- Support: https://bankalone.gg/support

## Credits

**Developer:** Bradley S. Scott  
**Brand:** SCS / Bank Alone  
**Version:** 1.0.0 (2026-02-06)

## License

Copyright (c) 2026 Bradley S. Scott. All rights reserved.

This addon is provided as-is for personal use in World of Warcraft: Burning Crusade Classic Anniversary.
