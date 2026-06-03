-- mod-assistant: spawn "Gabriella, The Assistant" (entry 9000000) in every
-- racial starting area plus the Death Knight hero start (Ebon Hold).
-- Reserved spawn guid range 9000000-9000019 (capital-city spawns from the
-- module use 5300753-5300762 and are left untouched). Faction 35 is friendly
-- to both factions; positions were hand-placed in-game near each spawn point.

DELETE FROM `creature` WHERE `guid` BETWEEN 9000000 AND 9000019;
INSERT INTO `creature` (`guid`, `id1`, `map`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES
(9000000, 9000000, 0, -8948.509, -128.235, 83.375, 3.5511),    -- Northshire Valley (Human)
(9000001, 9000000, 0, -6236.522, 334.148, 383.04, 3.3822),     -- Coldridge Valley (Dwarf, Gnome)
(9000002, 9000000, 0, 1679.71, 1678.31, 121.67, 3.14159),      -- Deathknell (Undead)
(9000003, 9000000, 1, -611.17, -4248.487, 38.956, 3.3191),     -- Valley of Trials (Orc, Troll)
(9000004, 9000000, 1, -2913.693, -248.672, 53.079, 3.421),     -- Camp Narache (Tauren)
(9000005, 9000000, 1, 10314.3, 832.463, 1326.41, 3.14159),     -- Shadowglen (Night Elf)
(9000006, 9000000, 530, -3958.64, -13931.2, 100.615, 3.14159), -- Ammen Vale (Draenei)
(9000007, 9000000, 530, 10352.6, -6357.29, 33.403, 3.14159),   -- Sunstrider Isle (Blood Elf)
(9000008, 9000000, 609, 2358.84, -5664.77, 426.028, 3.14159);  -- Ebon Hold (Death Knight)
