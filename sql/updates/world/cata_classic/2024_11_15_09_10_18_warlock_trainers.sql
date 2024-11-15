DELETE FROM `creature_template_gossip` WHERE `CreatureID` IN (459, 460, 461, 906, 988, 1408, 2126, 2127, 3156, 3172, 3324, 3325, 3326, 4563, 4564, 4565, 4993, 5039, 5171, 5172, 5173, 5495, 5496, 5612, 5962, 5970, 15283, 16266, 16646, 16647, 16648, 16770, 23534, 34696, 35778, 35869, 36519, 36652, 38513, 38797, 42618, 43455, 43881, 43883, 43892, 44469, 45138, 45720, 48612, 49718, 49769, 49791, 49895, 49945, 49963, 49998, 50017, 50028, 50128, 50142, 50156, 50502, 50723, 50729, 50732, 53404);
INSERT INTO `creature_template_gossip` (`CreatureID`, `MenuID`, `VerifiedBuild`) VALUES
(459, 11932, 57359),
(460, 11932, 57359),
(461, 11932, 57359),
(906, 11932, 57359),
(988, 11932, 57359),
(1408, 11932, 57359),
(2126, 11932, 57359),
(2127, 11932, 57359),
(3156, 11932, 57359),
(3172, 11932, 57359),
(3324, 11932, 57359),
(3325, 11932, 57359),
(3326, 11932, 57359),
(4563, 11932, 57359),
(4564, 11932, 57359),
(4565, 11932, 57359),
(4993, 11932, 57359),
(5039, 11932, 57359),
(5171, 11932, 57359),
(5172, 11932, 57359),
(5173, 11932, 57359),
(5495, 11932, 57359),
(5496, 11932, 57359),
(5612, 11932, 57359),
(5962, 11932, 57359),
(5970, 11932, 57359),
(15283, 11932, 57359),
(16266, 11932, 57359),
(16646, 11932, 57359),
(16647, 11932, 57359),
(16648, 11932, 57359),
(16770, 11932, 57359),
(23534, 11932, 57359),
(34696, 11932, 57359),
(35778, 11932, 57359),
(35869, 11932, 57359),
(36519, 11932, 57359),
(36652, 11932, 57359),
(38513, 11932, 57359),
(38797, 11932, 57359),
(42618, 11932, 57359),
(43455, 11932, 57359),
(43881, 11932, 57359),
(43883, 11932, 57359),
(43892, 11932, 57359),
(44469, 11932, 57359),
(45138, 11932, 57359),
(45720, 11932, 57359),
(48612, 11932, 57359),
(49718, 11932, 57359),
(49769, 11932, 57359),
(49791, 11932, 57359),
(49895, 11932, 57359),
(49945, 11932, 57359),
(49963, 11932, 57359),
(49998, 11932, 57359),
(50017, 11932, 57359),
(50028, 11932, 57359),
(50128, 11932, 57359),
(50142, 11932, 57359),
(50156, 11932, 57359),
(50502, 11932, 57359),
(50723, 11932, 57359),
(50729, 11932, 57359),
(50732, 11932, 57359),
(53404, 11932, 57359);

DELETE FROM `trainer` WHERE `Id`=154;
INSERT INTO `trainer` (`Id`, `Type`, `Greeting`, `VerifiedBuild`) VALUES
(154, 0, 'Hello, warlock!  Ready for some training?', 57359);


DELETE FROM `trainer_spell` WHERE (`TrainerId`=154 AND `SpellId` IN (172,348,1454,713,712,687,5784,23161,19028,5697,87498,86091,18540,691,1122,77801,6229,126,29893,27243,29858,29722,1490,1098,1120,5740,603,5676,77799,74434,79268,702,693,689,80398,5484,6789,6353,697,755,6201,5782,1714,980,1949,698,710,48020,48018,47897,28176));
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`, `VerifiedBuild`) VALUES
(154, 172, 93, 0, 0, 0, 0, 0, 4, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 348, 57, 0, 0, 0, 0, 0, 3, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 1454, 135, 0, 0, 0, 0, 0, 5, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 713, 3420, 0, 0, 0, 0, 0, 20, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 712, 3420, 0, 0, 0, 0, 0, 20, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 687, 456, 0, 0, 0, 0, 0, 8, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 5784, 3420, 0, 0, 0, 0, 0, 20, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 23161, 14250, 0, 0, 33391, 0, 0, 40, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 19028, 3420, 0, 0, 0, 0, 0, 20, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 5697, 1957, 0, 0, 0, 0, 0, 16, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 87498, 210900, 0, 0, 0, 0, 0, 80, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 86091, 21375, 0, 0, 0, 0, 0, 50, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 18540, 25650, 0, 0, 1120, 0, 0, 58, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 691, 7125, 0, 0, 0, 0, 0, 30, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 1122, 21375, 0, 0, 1120, 0, 0, 50, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 77801, 267900, 0, 0, 0, 0, 0, 85, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 6229, 9975, 0, 0, 0, 0, 0, 34, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 126, 3990, 0, 0, 0, 0, 0, 22, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 29893, 111150, 0, 0, 1120, 0, 0, 68, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 27243, 142500, 0, 0, 0, 0, 0, 72, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 29858, 99750, 0, 0, 1120, 0, 0, 66, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 29722, 88350, 0, 0, 0, 0, 0, 64, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 1490, 21375, 0, 0, 0, 0, 0, 52, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 1098, 7125, 0, 0, 0, 0, 0, 30, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 1120, 646, 0, 0, 0, 0, 0, 10, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 5740, 2646, 0, 0, 0, 0, 0, 18, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 603, 3420, 0, 0, 0, 0, 0, 20, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 5676, 2646, 0, 0, 0, 0, 0, 18, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 77799, 222300, 0, 0, 0, 0, 0, 81, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 74434, 646, 0, 0, 0, 0, 0, 10, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 79268, 1023, 0, 0, 0, 0, 0, 12, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 702, 1957, 0, 0, 0, 0, 0, 16, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 693, 2646, 0, 0, 1120, 0, 0, 18, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 689, 180, 0, 0, 0, 0, 0, 6, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 80398, 245100, 0, 0, 0, 0, 0, 83, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 5484, 18525, 0, 0, 0, 0, 0, 44, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 6789, 15675, 0, 0, 0, 0, 0, 42, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 6353, 3420, 0, 0, 0, 0, 0, 20, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 697, 370, 0, 0, 0, 0, 0, 8, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 755, 1023, 0, 0, 0, 0, 0, 12, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 6201, 524, 0, 0, 0, 0, 0, 9, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 5782, 1348, 0, 0, 0, 0, 0, 14, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 1714, 5700, 0, 0, 0, 0, 0, 26, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 980, 1023, 0, 0, 0, 0, 0, 12, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 1949, 7125, 0, 0, 0, 0, 0, 30, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 698, 15675, 0, 0, 0, 0, 0, 42, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 710, 8550, 0, 0, 0, 0, 0, 32, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 48020, 96900, 0, 0, 0, 0, 0, 78, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 48018, 96900, 0, 0, 0, 0, 0, 78, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 47897, 176700, 0, 0, 0, 0, 0, 76, 57359), -- No Faction found! MoneyCost not recalculated!
(154, 28176, 76950, 0, 0, 0, 0, 0, 62, 57359); -- No Faction found! MoneyCost not recalculated!


DELETE FROM `creature_trainer` WHERE `CreatureID` IN (459, 460, 461, 906, 988, 1408, 2126, 2127, 3156, 3172, 3324, 3325, 3326, 4563, 4564, 4565, 4993, 5039, 5171, 5172, 5173, 5495, 5496, 5612, 5962, 5970, 15283, 16266, 16646, 16647, 16648, 16770, 23534, 34696, 35778, 35869, 36519, 36652, 38513, 38797, 42618, 43455, 43881, 43883, 43892, 44469, 45138, 45720, 48612, 49718, 49769, 49791, 49895, 49945, 49963, 49998, 50017, 50028, 50128, 50142, 50156, 50502, 50723, 50729, 50732, 53404);
INSERT INTO `creature_trainer` (`CreatureID`, `TrainerID`, `MenuID`, `OptionID`) VALUES
(459, 154, 11932, 0),
(460, 154, 11932, 0),
(461, 154, 11932, 0),
(906, 154, 11932, 0),
(988, 154, 11932, 0),
(1408, 154, 11932, 0),
(2126, 154, 11932, 0),
(2127, 154, 11932, 0),
(3156, 154, 11932, 0),
(3172, 154, 11932, 0),
(3324, 154, 11932, 0),
(3325, 154, 11932, 0),
(3326, 154, 11932, 0),
(4563, 154, 11932, 0),
(4564, 154, 11932, 0),
(4565, 154, 11932, 0),
(4993, 154, 11932, 0),
(5039, 154, 11932, 0),
(5171, 154, 11932, 0),
(5172, 154, 11932, 0),
(5173, 154, 11932, 0),
(5495, 154, 11932, 0),
(5496, 154, 11932, 0),
(5612, 154, 11932, 0),
(5962, 154, 11932, 0),
(5970, 154, 11932, 0),
(15283, 154, 11932, 0),
(16266, 154, 11932, 0),
(16646, 154, 11932, 0),
(16647, 154, 11932, 0),
(16648, 154, 11932, 0),
(16770, 154, 11932, 0),
(23534, 154, 11932, 0),
(34696, 154, 11932, 0),
(35778, 154, 11932, 0),
(35869, 154, 11932, 0),
(36519, 154, 11932, 0),
(36652, 154, 11932, 0),
(38513, 154, 11932, 0),
(38797, 154, 11932, 0),
(42618, 154, 11932, 0),
(43455, 154, 11932, 0),
(43881, 154, 11932, 0),
(43883, 154, 11932, 0),
(43892, 154, 11932, 0),
(44469, 154, 11932, 0),
(45138, 154, 11932, 0),
(45720, 154, 11932, 0),
(48612, 154, 11932, 0),
(49718, 154, 11932, 0),
(49769, 154, 11932, 0),
(49791, 154, 11932, 0),
(49895, 154, 11932, 0),
(49945, 154, 11932, 0),
(49963, 154, 11932, 0),
(49998, 154, 11932, 0),
(50017, 154, 11932, 0),
(50028, 154, 11932, 0),
(50128, 154, 11932, 0),
(50142, 154, 11932, 0),
(50156, 154, 11932, 0),
(50502, 154, 11932, 0),
(50723, 154, 11932, 0),
(50729, 154, 11932, 0),
(50732, 154, 11932, 0),
(53404, 154, 11932, 0);

DELETE FROM `gossip_menu_option` WHERE (`MenuID`=11932 AND `OptionID`=0);
INSERT INTO `gossip_menu_option` (`MenuID`, `GossipOptionID`, `OptionID`, `OptionNpc`, `OptionText`, `OptionBroadcastTextID`, `Language`, `Flags`, `ActionMenuID`, `ActionPoiID`, `GossipNpcOptionID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `SpellID`, `OverrideIconID`, `VerifiedBuild`) VALUES
(11932, 112631, 0, 3, 'I am interested in warlock training.', 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, NULL, NULL, 57359);