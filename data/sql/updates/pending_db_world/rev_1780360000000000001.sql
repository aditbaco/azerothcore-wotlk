--
-- Starter inventory: give every new character item 32588 (pet auto-loot).
-- race = 0 / class = 0 means "all races / all classes".
-- The core grants it on creation via StoreNewItemInBestSlots.
--

DELETE FROM `playercreateinfo_item` WHERE `itemid` = 32588 AND `race` = 0 AND `class` = 0;
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES
(0, 0, 32588, 1);
