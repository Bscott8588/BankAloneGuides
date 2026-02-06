# Bank Alone Guides

**Version:** 1.0  
**Author:** Bradley S. Scott  
**Game:** Burning Crusade Classic Anniversary  
**Type:** Leveling and Guide Addon

## Overview

Bank Alone Guides (BAG) is a comprehensive, original leveling and guide addon for World of Warcraft: Burning Crusade Classic Anniversary. It features a modern neon-blue SCS-branded interface with smart starting logic, automatic step progression, and complete coverage from levels 1-70 for both Alliance and Horde factions.

## Features

### Smart Start System
- **Automatic Level Detection**: Detects your current level and zone, starts you in the most appropriate guide
- **No Forced Routing**: If you're already level 32 in Stranglethorn Vale, you won't be forced into a 1-10 starter guide
- **Intelligent Guide Selection**: Automatically picks the best guide based on your character's state

### Complete Coverage
- **Alliance Leveling**: 1-10, 10-20, 20-30, 30-40, 40-50, 50-60, and 58-70 (Outland)
- **Horde Leveling**: 1-10, 10-20, 20-30, 30-40, 40-50, 50-60, and 58-70 (Outland)
- **Race-Specific Starts**: Custom starting guides for all 8 races
- **Profession Guides**: All 12 professions (Mining, Herbalism, Skinning, Blacksmithing, Engineering, Leatherworking, Tailoring, Enchanting, Alchemy, Cooking, Fishing, First Aid)
- **Gold Farming**: Farming routes, profession gold-making, dungeon farms

### Modern UI
- **Neon-Blue SCS Theme**: Clean, modern aesthetic with tech-inspired styling
- **Draggable & Resizable**: Customize window position and size
- **Step Progress Tracking**: Visual progress bar and step completion indicators
- **Minimap Button**: Quick access from minimap
- **Smooth Animations**: Polished transitions and visual feedback

### Navigation & Tracking
- **Auto-Waypoint System**: Automatically sets waypoints for current objectives
- **Quest Tracking**: Integrated quest tracking with objective monitoring
- **Distance Calculation**: Shows distance and direction to objectives
- **Travel Routing**: Smart suggestions for flight paths, boats, and travel

### Condition System
- **Class/Race Filtering**: Steps shown only for relevant classes/races
- **Level Requirements**: Steps unlock at appropriate levels
- **Profession Requirements**: Profession-specific guidance
- **Quest State Tracking**: Steps adapt based on quest completion

## Installation

1. Download the addon
2. Extract the `BankAloneGuides` folder
3. Place it in:
   ```
   World of Warcraft\_anniversary_\Interface\AddOns\
   ```
4. Restart WoW or reload UI (`/reload`)

## Usage

### Basic Commands
```
/bag                 - Toggle guide window
/bag show            - Show guide window
/bag hide            - Hide guide window
/bag reload          - Reload addon
/bag debug           - Toggle debug mode
/bag version         - Show version info
/bag reset           - Reset all settings
/bag help            - Show help
```

### Getting Started

1. **Login**: The addon automatically detects your level/zone and loads the appropriate guide
2. **Follow Steps**: Complete steps in order, they auto-advance when conditions are met
3. **Manual Control**: Use Next/Previous buttons or click steps to jump around
4. **Smart Tracking**: Quest tracking and waypoints update automatically

### UI Controls

- **Drag Title Bar**: Move window
- **Drag Resize Grip**: Resize window (bottom-right corner)
- **Close Button**: Minimize window
- **Options Button**: Access settings (future feature)
- **Minimap Button**: Left-click to toggle, right-click for options

## Architecture

### Core Systems
- **Engine**: Step progression and auto-advancement
- **Events**: WoW event integration (quests, level-ups, zones)
- **Conditions**: Smart condition evaluation for step availability
- **SavedVars**: Persistent storage of progress and settings

### API Layer
- **QuestAPI**: Quest state and objective tracking
- **PlayerAPI**: Character information and professions
- **InventoryAPI**: Bag scanning and item counting
- **SpellAPI**: Ability checking and cooldowns
- **MapAPI**: Zone detection and coordinate calculations

### Data Layer
- **Zones**: 60+ zone database (Azeroth + Outland)
- **NPCs**: Quest givers, trainers, vendors, flight masters
- **Quests**: Quest metadata and descriptions
- **Items**: Profession materials and key items
- **Trainers**: Profession and class trainers by location
- **Vendors**: Supply vendors and special merchants

### Navigation
- **ZoneDetection**: Automatic zone and continent detection
- **QuestTracking**: Enhanced quest tracking with objectives
- **Travel**: Smart routing for all travel methods
- **Navigator**: Waypoint management and distance calculation

### UI Components
- **MainFrame**: Draggable, resizable main window
- **StepPanel**: Scrolling step list with icons and progress
- **Buttons**: Next/Previous/Check controls
- **Animations**: Smooth transitions and visual feedback

## Guide Format

Guides can be created using a simple, human-readable format:

```lua
##id: MyGuide_10_20
##title: My Custom Guide
##faction: Alliance
##level: 10-20

step
.goto Westfall,56.47,47.00
.accept 9
Accept The Fargodeep Mine quest

step
.goto Westfall,38.00,69.00
Complete mine objectives
.turnin 9
```

Supported directives:
- `.goto zone,x,y` - Travel to location
- `.accept questID` - Accept quest
- `.turnin questID` - Turn in quest
- `.kill mobName` - Kill mob/complete combat objective
- `.collect itemID,count` - Gather items
- `.train skillName` - Train profession/skill
- `.fly destination` - Take flight path
- `.fp` - Get flight path
- `.hs` - Use hearthstone
- `.class ClassName` - Class requirement
- `.race RaceName` - Race requirement
- `.level min-max` - Level requirement

## Legal & Content

All guide content, descriptions, and routing are **100% original** and created specifically for this addon. No content is copied from:
- Blizzard's quest text or descriptions
- Zygor Guides or any other commercial addon
- Any copyrighted game guides or walkthroughs

Quest IDs, NPC IDs, item IDs, and zone names are used as technical references only, which is permissible under fair use.

## Technical Details

- **Interface Version**: 20504 (TBC Classic Anniversary)
- **SavedVariables**: BAG_SavedVars (global), BAG_CharVars (per-character)
- **Dependencies**: None (standalone addon)
- **Lua Version**: 5.1 (WoW API)
- **Total Files**: 60+ Lua files

## Performance

- Lightweight and efficient
- Event-driven architecture (minimal CPU usage)
- Smart caching of zone and quest data
- Throttled updates to prevent lag
- No impact on game performance

## Future Enhancements

Potential future additions:
- Class-specific quest chains
- Dungeon and raid guides
- PvP leveling routes
- Alternative leveling paths
- Achievements and reputation guides
- Integration with popular waypoint addons
- Export/import custom guides
- Community guide sharing

## Support & Development

**Developer**: Bradley S. Scott  
**Website**: https://scs-gaming.com  
**License**: All Rights Reserved

## Version History

### Version 1.0 (February 6, 2026)
- Initial release
- Complete 1-70 leveling for Alliance and Horde
- Race-specific starting zones
- Comprehensive Outland guides (58-70)
- All profession guides
- Gold farming guides
- Modern SCS-themed UI
- Smart start system
- Auto-progression engine
- Full navigation and tracking

## Credits

Created with expertise in:
- World of Warcraft addon development
- Lua programming
- UI/UX design
- Game progression systems
- TBC Classic mechanics

---

**Note**: This addon is designed specifically for Burning Crusade Classic Anniversary edition. It may not work correctly on other versions of World of Warcraft.

For the best experience, use this addon from level 1 or when starting in a new zone. The smart start system will automatically detect your situation and guide you appropriately.

**Enjoy your journey through Azeroth and Outland with Bank Alone Guides!**
