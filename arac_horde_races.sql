-- Re-clone Horde custom races (13,14,15,18,21) from base race 2 (Orc / Durotar).
-- Alliance races (12,16,17,19,20) keep their race-1 (Human) clone.
-- racemask for race R = 1 << (R-1):
--   13=4096 14=8192 15=16384 18=131072 21=1048576
-- DELETE then INSERT for clean replacement (Orc class set may differ from Human).

-- ===== Race 13 (Vulpera) <- Orc =====
DELETE FROM `playercreateinfo` WHERE race=13;
DELETE FROM `playercreateinfo_action` WHERE race=13;
DELETE FROM `player_race_stats` WHERE Race=13;
DELETE FROM `playercreateinfo_spell_custom` WHERE racemask=4096;
INSERT INTO `playercreateinfo` SELECT 13, class, map, zone, position_x, position_y, position_z, orientation FROM `playercreateinfo` WHERE race=2;
INSERT INTO `playercreateinfo_action` SELECT 13, class, button, `action`, `type` FROM `playercreateinfo_action` WHERE race=2;
INSERT INTO `player_race_stats` SELECT 13, Strength, Agility, Stamina, Intellect, Spirit FROM `player_race_stats` WHERE Race=2;
INSERT INTO `playercreateinfo_spell_custom` SELECT 4096, classmask, Spell, Note FROM `playercreateinfo_spell_custom` WHERE racemask=2;

-- ===== Race 14 (Nightborne) <- Orc =====
DELETE FROM `playercreateinfo` WHERE race=14;
DELETE FROM `playercreateinfo_action` WHERE race=14;
DELETE FROM `player_race_stats` WHERE Race=14;
DELETE FROM `playercreateinfo_spell_custom` WHERE racemask=8192;
INSERT INTO `playercreateinfo` SELECT 14, class, map, zone, position_x, position_y, position_z, orientation FROM `playercreateinfo` WHERE race=2;
INSERT INTO `playercreateinfo_action` SELECT 14, class, button, `action`, `type` FROM `playercreateinfo_action` WHERE race=2;
INSERT INTO `player_race_stats` SELECT 14, Strength, Agility, Stamina, Intellect, Spirit FROM `player_race_stats` WHERE Race=2;
INSERT INTO `playercreateinfo_spell_custom` SELECT 8192, classmask, Spell, Note FROM `playercreateinfo_spell_custom` WHERE racemask=2;

-- ===== Race 15 (Pandaren Horde) <- Orc =====
DELETE FROM `playercreateinfo` WHERE race=15;
DELETE FROM `playercreateinfo_action` WHERE race=15;
DELETE FROM `player_race_stats` WHERE Race=15;
DELETE FROM `playercreateinfo_spell_custom` WHERE racemask=16384;
INSERT INTO `playercreateinfo` SELECT 15, class, map, zone, position_x, position_y, position_z, orientation FROM `playercreateinfo` WHERE race=2;
INSERT INTO `playercreateinfo_action` SELECT 15, class, button, `action`, `type` FROM `playercreateinfo_action` WHERE race=2;
INSERT INTO `player_race_stats` SELECT 15, Strength, Agility, Stamina, Intellect, Spirit FROM `player_race_stats` WHERE Race=2;
INSERT INTO `playercreateinfo_spell_custom` SELECT 16384, classmask, Spell, Note FROM `playercreateinfo_spell_custom` WHERE racemask=2;

-- ===== Race 18 (Zandalari Troll) <- Orc =====
DELETE FROM `playercreateinfo` WHERE race=18;
DELETE FROM `playercreateinfo_action` WHERE race=18;
DELETE FROM `player_race_stats` WHERE Race=18;
DELETE FROM `playercreateinfo_spell_custom` WHERE racemask=131072;
INSERT INTO `playercreateinfo` SELECT 18, class, map, zone, position_x, position_y, position_z, orientation FROM `playercreateinfo` WHERE race=2;
INSERT INTO `playercreateinfo_action` SELECT 18, class, button, `action`, `type` FROM `playercreateinfo_action` WHERE race=2;
INSERT INTO `player_race_stats` SELECT 18, Strength, Agility, Stamina, Intellect, Spirit FROM `player_race_stats` WHERE Race=2;
INSERT INTO `playercreateinfo_spell_custom` SELECT 131072, classmask, Spell, Note FROM `playercreateinfo_spell_custom` WHERE racemask=2;

-- ===== Race 21 (Demon Hunter Horde) <- Orc =====
DELETE FROM `playercreateinfo` WHERE race=21;
DELETE FROM `playercreateinfo_action` WHERE race=21;
DELETE FROM `player_race_stats` WHERE Race=21;
DELETE FROM `playercreateinfo_spell_custom` WHERE racemask=1048576;
INSERT INTO `playercreateinfo` SELECT 21, class, map, zone, position_x, position_y, position_z, orientation FROM `playercreateinfo` WHERE race=2;
INSERT INTO `playercreateinfo_action` SELECT 21, class, button, `action`, `type` FROM `playercreateinfo_action` WHERE race=2;
INSERT INTO `player_race_stats` SELECT 21, Strength, Agility, Stamina, Intellect, Spirit FROM `player_race_stats` WHERE Race=2;
INSERT INTO `playercreateinfo_spell_custom` SELECT 1048576, classmask, Spell, Note FROM `playercreateinfo_spell_custom` WHERE racemask=2;
