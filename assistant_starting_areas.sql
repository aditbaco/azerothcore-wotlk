-- Assistant (mod-assistant) in every STARTING AREA — deploy-proof.
--
-- mod-assistant's module SQL runs `DELETE FROM creature WHERE id1=9000000` and
-- respawns the assistant ONLY in capital cities, which wipes any custom
-- starting-area spawns that share entry 9000000. To survive that, we clone the
-- assistant into a dedicated entry 9000001 and put the starting-area spawns on
-- THAT entry — the module's id1=9000000 delete can never touch them. Capitals
-- stay on 9000000 (module-managed); both coexist.
--
-- Idempotent. Run on `acore_world` AFTER mod-assistant's SQL has been applied.

SET SESSION group_concat_max_len = 1000000;

-- 1) clone creature_template 9000000 -> 9000001 (schema-agnostic, copies all columns)
SET @cols := (SELECT GROUP_CONCAT(CONCAT('`', COLUMN_NAME, '`') ORDER BY ORDINAL_POSITION)
              FROM information_schema.COLUMNS
              WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'creature_template' AND COLUMN_NAME <> 'entry');
DELETE FROM `creature_template` WHERE `entry` = 9000001;
SET @sql := CONCAT('INSERT INTO `creature_template` (`entry`,', @cols,
                   ') SELECT 9000001,', @cols, ' FROM `creature_template` WHERE `entry`=9000000');
PREPARE s FROM @sql; EXECUTE s; DEALLOCATE PREPARE s;

-- 2) clone creature_template_model 9000000 -> 9000001 (so the NPC has its model)
SET @mcols := (SELECT GROUP_CONCAT(CONCAT('`', COLUMN_NAME, '`') ORDER BY ORDINAL_POSITION)
               FROM information_schema.COLUMNS
               WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'creature_template_model' AND COLUMN_NAME <> 'CreatureID');
DELETE FROM `creature_template_model` WHERE `CreatureID` = 9000001;
SET @msql := CONCAT('INSERT INTO `creature_template_model` (`CreatureID`,', @mcols,
                    ') SELECT 9000001,', @mcols, ' FROM `creature_template_model` WHERE `CreatureID`=9000000');
PREPARE s2 FROM @msql; EXECUTE s2; DEALLOCATE PREPARE s2;

-- 3) starting-area spawns on the dedicated entry 9000001
DELETE FROM `creature` WHERE `id1` = 9000001;
INSERT INTO `creature`
  (`guid`,`id1`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`) VALUES
  (9000000,9000001,0,  1,1, -8948.509, -128.235,  83.375,  3.5511, 300), -- Northshire Valley (Human)
  (9000001,9000001,0,  1,1, -6236.522,  334.148,  383.04,  3.3822, 300), -- Coldridge Valley (Dwarf, Gnome)
  (9000002,9000001,0,  1,1,  1679.71,   1678.31,  121.67,  3.14159,300), -- Deathknell (Undead)
  (9000003,9000001,1,  1,1,  -611.17,  -4248.487, 38.956,  3.3191, 300), -- Valley of Trials (Orc, Troll)
  (9000004,9000001,1,  1,1, -2913.693, -248.672,  53.079,  3.421,  300), -- Camp Narache (Tauren)
  (9000005,9000001,1,  1,1, 10314.3,    832.463,  1326.41, 3.14159,300), -- Shadowglen (Night Elf)
  (9000006,9000001,530,1,1, -3958.64, -13931.2,   100.615, 3.14159,300), -- Ammen Vale (Draenei)
  (9000007,9000001,530,1,1, 10352.6,  -6357.29,   33.403,  3.14159,300), -- Sunstrider Isle (Blood Elf)
  (9000008,9000001,609,1,1,  2358.84,  -5664.77,  426.028, 3.14159,300); -- Ebon Hold (Death Knight)
