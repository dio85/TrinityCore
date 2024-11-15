DELETE FROM `creature_template_gossip` 
WHERE `CreatureID` IN (915, 916, 917, 918, 1234, 1411, 2122, 2130, 3155, 3170, 3327, 3328, 3401, 3594, 3599, 4163, 4214, 4215, 4582, 4583, 4584, 4990, 5165, 5166, 5167, 5960, 5968, 13283, 15285, 16279, 16684, 16685, 16686, 16759, 23566, 26329, 34693, 35806, 35871, 36524, 36630, 38244, 38517, 38796, 42366, 44464, 45095, 45717, 47233, 48615, 49730, 49745, 49782, 49870, 49909, 49939, 49949, 50015, 50016, 50027, 50127, 50147, 50158, 50498, 51998);
INSERT INTO `creature_template_gossip` (`CreatureID`, `MenuID`, `VerifiedBuild`) VALUES
(915, 12050, 57359),
(916, 12050, 57359),
(917, 12050, 57359),
(918, 12050, 57359),
(1234, 12050, 57359),
(1411, 12050, 57359),
(2122, 12050, 57359),
(2130, 12050, 57359),
(3155, 12050, 57359),
(3170, 12050, 57359),
(3327, 12050, 57359),
(3328, 12050, 57359),
(3401, 12050, 57359),
(3594, 12050, 57359),
(3599, 12050, 57359),
(4163, 12050, 57359),
(4214, 12050, 57359),
(4215, 12050, 57359),
(4582, 12050, 57359),
(4583, 12050, 57359),
(4584, 12050, 57359),
(4990, 12050, 57359),
(5165, 12050, 57359),
(5166, 12050, 57359),
(5167, 12050, 57359),
(5960, 12050, 57359),
(5968, 12050, 57359),
(13283, 12050, 57359),
(15285, 12050, 57359),
(16279, 12050, 57359),
(16684, 12050, 57359),
(16685, 12050, 57359),
(16686, 12050, 57359),
(16759, 12050, 57359),
(23566, 12050, 57359),
(26329, 12050, 57359),
(34693, 12050, 57359),
(35806, 12050, 57359),
(35871, 12050, 57359),
(36524, 12050, 57359),
(36630, 12050, 57359),
(38244, 12050, 57359),
(38517, 12050, 57359),
(38796, 12050, 57359),
(42366, 12050, 57359),
(44464, 12050, 57359),
(45095, 12050, 57359),
(45717, 12050, 57359),
(47233, 12050, 57359),
(48615, 12050, 57359),
(49730, 12050, 57359),
(49745, 12050, 57359),
(49782, 12050, 57359),
(49870, 12050, 57359),
(49909, 12050, 57359),
(49939, 12050, 57359),
(49949, 12050, 57359),
(50015, 12050, 57359),
(50016, 12050, 57359),
(50027, 12050, 57359),
(50127, 12050, 57359),
(50147, 12050, 57359),
(50158, 12050, 57359),
(50498, 12050, 57359),
(51998, 12050, 57359);

DELETE FROM `trainer` WHERE `Id`=33;
INSERT INTO `trainer` (`Id`, `Type`, `Greeting`, `VerifiedBuild`) VALUES
(33, 0, 'Hello, rogue!  Ready for some training?', 57359);


DELETE FROM `trainer_spell` WHERE (`TrainerId`=33 AND `SpellId` IN (2098,1784,87504,87496,73651,1804,1856,32645,5171,8647,1842,2836,57934,74001,76577,2094,53,51722,51723,6770,2983,31224,5277,8676,26679,5938,82245,1833,921,703,1943,408,1966,1766,73981,1776,1725,1860));
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`, `VerifiedBuild`) VALUES
(33, 2098, 57, 0, 0, 0, 0, 0, 3, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 1784, 135, 0, 0, 0, 0, 0, 5, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 87504, 21375, 0, 0, 0, 0, 0, 50, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 87496, 210900, 0, 0, 0, 0, 0, 80, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 73651, 1023, 0, 0, 0, 0, 0, 12, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 1804, 3420, 0, 0, 0, 0, 0, 20, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 1856, 4845, 0, 0, 1784, 0, 0, 24, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 32645, 22800, 0, 0, 0, 0, 0, 54, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 5171, 3990, 0, 0, 0, 0, 0, 22, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 8647, 11400, 0, 0, 0, 0, 0, 36, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 1842, 18525, 0, 0, 2836, 0, 0, 44, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 2836, 8550, 0, 0, 0, 0, 0, 32, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 57934, 168150, 0, 0, 0, 0, 0, 75, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 74001, 222300, 0, 0, 0, 0, 0, 81, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 76577, 267900, 0, 0, 0, 0, 0, 85, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 2094, 9975, 0, 0, 0, 0, 0, 34, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 53, 2646, 0, 0, 0, 0, 0, 18, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 51722, 12825, 0, 0, 0, 0, 0, 38, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 51723, 210900, 0, 0, 0, 0, 0, 80, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 6770, 646, 0, 0, 0, 0, 0, 10, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 2983, 1957, 0, 0, 0, 0, 0, 16, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 31224, 25650, 0, 0, 0, 0, 0, 58, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 5277, 524, 0, 0, 0, 0, 0, 9, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 8676, 370, 0, 0, 0, 0, 0, 8, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 26679, 76950, 0, 0, 0, 0, 0, 62, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 5938, 125400, 0, 0, 0, 0, 0, 70, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 82245, 1023, 0, 0, 0, 0, 0, 12, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 1833, 5700, 0, 0, 0, 0, 0, 26, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 921, 271, 0, 0, 0, 0, 0, 7, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 703, 14250, 0, 0, 0, 0, 0, 40, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 1943, 18525, 0, 0, 0, 0, 0, 46, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 408, 7125, 0, 0, 0, 0, 0, 30, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 1966, 15675, 0, 0, 0, 0, 0, 42, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 1766, 1348, 0, 0, 0, 0, 0, 14, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 73981, 245100, 0, 0, 0, 0, 0, 83, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 1776, 1957, 0, 0, 0, 0, 0, 16, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 1725, 7125, 0, 0, 0, 0, 0, 28, 57359), -- No Faction found! MoneyCost not recalculated!
(33, 1860, 19950, 0, 0, 0, 0, 0, 48, 57359); -- No Faction found! MoneyCost not recalculated!


DELETE FROM `creature_trainer` 
WHERE `CreatureID` IN (915, 916, 917, 918, 1234, 1411, 2122, 2130, 3155, 3170, 3327, 3328, 3401, 3594, 3599, 4163, 4214, 4215, 4582, 4583, 4584, 4990, 5165, 5166, 5167, 5960, 5968, 13283, 15285, 16279, 16684, 16685, 16686, 16759, 23566, 26329, 34693, 35806, 35871, 36524, 36630, 38244, 38517, 38796, 42366, 44464, 45095, 45717, 47233, 48615, 49730, 49745, 49782, 49870, 49909, 49939, 49949, 50015, 50016, 50027, 50127, 50147, 50158, 50498, 51998);
INSERT INTO `creature_trainer` (`CreatureID`, `TrainerID`, `MenuID`, `OptionID`) VALUES
(915, 33, 12050, 0),
(916, 33, 12050, 0),
(917, 33, 12050, 0),
(918, 33, 12050, 0),
(1234, 33, 12050, 0),
(1411, 33, 12050, 0),
(2122, 33, 12050, 0),
(2130, 33, 12050, 0),
(3155, 33, 12050, 0),
(3170, 33, 12050, 0),
(3327, 33, 12050, 0),
(3328, 33, 12050, 0),
(3401, 33, 12050, 0),
(3594, 33, 12050, 0),
(3599, 33, 12050, 0),
(4163, 33, 12050, 0),
(4214, 33, 12050, 0),
(4215, 33, 12050, 0),
(4582, 33, 12050, 0),
(4583, 33, 12050, 0),
(4584, 33, 12050, 0),
(4990, 33, 12050, 0),
(5165, 33, 12050, 0),
(5166, 33, 12050, 0),
(5167, 33, 12050, 0),
(5960, 33, 12050, 0),
(5968, 33, 12050, 0),
(13283, 33, 12050, 0),
(15285, 33, 12050, 0),
(16279, 33, 12050, 0),
(16684, 33, 12050, 0),
(16685, 33, 12050, 0),
(16686, 33, 12050, 0),
(16759, 33, 12050, 0),
(23566, 33, 12050, 0),
(26329, 33, 12050, 0),
(34693, 33, 12050, 0),
(35806, 33, 12050, 0),
(35871, 33, 12050, 0),
(36524, 33, 12050, 0),
(36630, 33, 12050, 0),
(38244, 33, 12050, 0),
(38517, 33, 12050, 0),
(38796, 33, 12050, 0),
(42366, 33, 12050, 0),
(44464, 33, 12050, 0),
(45095, 33, 12050, 0),
(45717, 33, 12050, 0),
(47233, 33, 12050, 0),
(48615, 33, 12050, 0),
(49730, 33, 12050, 0),
(49745, 33, 12050, 0),
(49782, 33, 12050, 0),
(49870, 33, 12050, 0),
(49909, 33, 12050, 0),
(49939, 33, 12050, 0),
(49949, 33, 12050, 0),
(50015, 33, 12050, 0),
(50016, 33, 12050, 0),
(50027, 33, 12050, 0),
(50127, 33, 12050, 0),
(50147, 33, 12050, 0),
(50158, 33, 12050, 0),
(50498, 33, 12050, 0),
(51998, 33, 12050, 0);

DELETE FROM `gossip_menu_option` WHERE (`MenuID`=12050 AND `OptionID`=0);
INSERT INTO `gossip_menu_option` (`MenuID`, `GossipOptionID`, `OptionID`, `OptionNpc`, `OptionText`, `OptionBroadcastTextID`, `Language`, `Flags`, `ActionMenuID`, `ActionPoiID`, `GossipNpcOptionID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `SpellID`, `OverrideIconID`, `VerifiedBuild`) VALUES
(12050, 112783, 0, 3, 'I require rogue training.', 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 0, NULL, NULL, 57359);
