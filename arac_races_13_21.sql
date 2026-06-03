-- Clone base race 1 (Human) data into custom races 13..21, mirroring race 12.
-- Idempotent: REPLACE on PK (race/class, Race, racemask/classmask/Spell).
-- racemask for race R = 1 << (R-1):
--   13=4096 14=8192 15=16384 16=32768 17=65536 18=131072 19=262144 20=524288 21=1048576

-- ===== Race 13 (racemask 4096) =====
REPLACE INTO `playercreateinfo` SELECT 13, class, map, zone, position_x, position_y, position_z, orientation FROM `playercreateinfo` WHERE race=1;
REPLACE INTO `playercreateinfo_action` SELECT 13, class, button, `action`, `type` FROM `playercreateinfo_action` WHERE race=1;
REPLACE INTO `player_race_stats` SELECT 13, Strength, Agility, Stamina, Intellect, Spirit FROM `player_race_stats` WHERE Race=1;
REPLACE INTO `playercreateinfo_spell_custom` SELECT 4096, classmask, Spell, Note FROM `playercreateinfo_spell_custom` WHERE racemask=1;

-- ===== Race 14 (racemask 8192) =====
REPLACE INTO `playercreateinfo` SELECT 14, class, map, zone, position_x, position_y, position_z, orientation FROM `playercreateinfo` WHERE race=1;
REPLACE INTO `playercreateinfo_action` SELECT 14, class, button, `action`, `type` FROM `playercreateinfo_action` WHERE race=1;
REPLACE INTO `player_race_stats` SELECT 14, Strength, Agility, Stamina, Intellect, Spirit FROM `player_race_stats` WHERE Race=1;
REPLACE INTO `playercreateinfo_spell_custom` SELECT 8192, classmask, Spell, Note FROM `playercreateinfo_spell_custom` WHERE racemask=1;

-- ===== Race 15 (racemask 16384) =====
REPLACE INTO `playercreateinfo` SELECT 15, class, map, zone, position_x, position_y, position_z, orientation FROM `playercreateinfo` WHERE race=1;
REPLACE INTO `playercreateinfo_action` SELECT 15, class, button, `action`, `type` FROM `playercreateinfo_action` WHERE race=1;
REPLACE INTO `player_race_stats` SELECT 15, Strength, Agility, Stamina, Intellect, Spirit FROM `player_race_stats` WHERE Race=1;
REPLACE INTO `playercreateinfo_spell_custom` SELECT 16384, classmask, Spell, Note FROM `playercreateinfo_spell_custom` WHERE racemask=1;

-- ===== Race 16 (racemask 32768) =====
REPLACE INTO `playercreateinfo` SELECT 16, class, map, zone, position_x, position_y, position_z, orientation FROM `playercreateinfo` WHERE race=1;
REPLACE INTO `playercreateinfo_action` SELECT 16, class, button, `action`, `type` FROM `playercreateinfo_action` WHERE race=1;
REPLACE INTO `player_race_stats` SELECT 16, Strength, Agility, Stamina, Intellect, Spirit FROM `player_race_stats` WHERE Race=1;
REPLACE INTO `playercreateinfo_spell_custom` SELECT 32768, classmask, Spell, Note FROM `playercreateinfo_spell_custom` WHERE racemask=1;

-- ===== Race 17 (racemask 65536) =====
REPLACE INTO `playercreateinfo` SELECT 17, class, map, zone, position_x, position_y, position_z, orientation FROM `playercreateinfo` WHERE race=1;
REPLACE INTO `playercreateinfo_action` SELECT 17, class, button, `action`, `type` FROM `playercreateinfo_action` WHERE race=1;
REPLACE INTO `player_race_stats` SELECT 17, Strength, Agility, Stamina, Intellect, Spirit FROM `player_race_stats` WHERE Race=1;
REPLACE INTO `playercreateinfo_spell_custom` SELECT 65536, classmask, Spell, Note FROM `playercreateinfo_spell_custom` WHERE racemask=1;

-- ===== Race 18 (racemask 131072) =====
REPLACE INTO `playercreateinfo` SELECT 18, class, map, zone, position_x, position_y, position_z, orientation FROM `playercreateinfo` WHERE race=1;
REPLACE INTO `playercreateinfo_action` SELECT 18, class, button, `action`, `type` FROM `playercreateinfo_action` WHERE race=1;
REPLACE INTO `player_race_stats` SELECT 18, Strength, Agility, Stamina, Intellect, Spirit FROM `player_race_stats` WHERE Race=1;
REPLACE INTO `playercreateinfo_spell_custom` SELECT 131072, classmask, Spell, Note FROM `playercreateinfo_spell_custom` WHERE racemask=1;

-- ===== Race 19 (racemask 262144) =====
REPLACE INTO `playercreateinfo` SELECT 19, class, map, zone, position_x, position_y, position_z, orientation FROM `playercreateinfo` WHERE race=1;
REPLACE INTO `playercreateinfo_action` SELECT 19, class, button, `action`, `type` FROM `playercreateinfo_action` WHERE race=1;
REPLACE INTO `player_race_stats` SELECT 19, Strength, Agility, Stamina, Intellect, Spirit FROM `player_race_stats` WHERE Race=1;
REPLACE INTO `playercreateinfo_spell_custom` SELECT 262144, classmask, Spell, Note FROM `playercreateinfo_spell_custom` WHERE racemask=1;

-- ===== Race 20 (racemask 524288) =====
REPLACE INTO `playercreateinfo` SELECT 20, class, map, zone, position_x, position_y, position_z, orientation FROM `playercreateinfo` WHERE race=1;
REPLACE INTO `playercreateinfo_action` SELECT 20, class, button, `action`, `type` FROM `playercreateinfo_action` WHERE race=1;
REPLACE INTO `player_race_stats` SELECT 20, Strength, Agility, Stamina, Intellect, Spirit FROM `player_race_stats` WHERE Race=1;
REPLACE INTO `playercreateinfo_spell_custom` SELECT 524288, classmask, Spell, Note FROM `playercreateinfo_spell_custom` WHERE racemask=1;

-- ===== Race 21 (racemask 1048576) =====
REPLACE INTO `playercreateinfo` SELECT 21, class, map, zone, position_x, position_y, position_z, orientation FROM `playercreateinfo` WHERE race=1;
REPLACE INTO `playercreateinfo_action` SELECT 21, class, button, `action`, `type` FROM `playercreateinfo_action` WHERE race=1;
REPLACE INTO `player_race_stats` SELECT 21, Strength, Agility, Stamina, Intellect, Spirit FROM `player_race_stats` WHERE Race=1;
REPLACE INTO `playercreateinfo_spell_custom` SELECT 1048576, classmask, Spell, Note FROM `playercreateinfo_spell_custom` WHERE racemask=1;
