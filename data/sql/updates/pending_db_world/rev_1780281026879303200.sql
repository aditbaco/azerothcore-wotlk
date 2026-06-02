--
-- Starter inventory: give every new character four 8-slot bags
-- (16-slot backpack + 4 x 8-slot Brown Leather Satchel = 48 usable slots).
-- The core auto-equips bags into the 4 bag slots via StoreNewItemInBestSlots.
-- race = 0 / class = 0 means "all races / all classes".
--

DELETE FROM `playercreateinfo_item` WHERE `itemid` = 4498 AND `race` = 0 AND `class` = 0;
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES
(0, 0, 4498, 4);
