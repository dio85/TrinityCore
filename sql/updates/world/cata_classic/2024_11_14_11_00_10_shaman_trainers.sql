DELETE FROM `creature_template_gossip` WHERE `CreatureID` IN (373, 986, 1406, 2219, 3030, 3031, 3032, 3062, 3066, 3157, 3173, 3344, 3403, 4991, 5965, 5971, 13417, 16661, 17089, 17204, 17212, 17219, 17519, 17520, 18270, 20407, 23127, 34695, 35786, 36521, 36700, 37115, 38242, 38515, 43464, 44393, 44394, 44740, 45029, 45718, 49808, 49900, 49964, 50011, 50019, 50022, 50130, 50153, 50174, 51637, 51638, 51639, 51640, 52290, 52292, 52299, 52317, 53405);
INSERT INTO `creature_template_gossip` (`CreatureID`, `MenuID`, `VerifiedBuild`) VALUES
(373, 4105, 57359),
(986, 4105, 57359),
(1406, 4105, 57359),
(2219, 4105, 57359),
(3030, 4105, 57359),
(3031, 4105, 57359),
(3032, 4105, 57359),
(3062, 4105, 57359),
(3066, 4105, 57359),
(3157, 4105, 57359),
(3173, 4105, 57359),
(3344, 4105, 57359),
(3403, 4105, 57359),
(4991, 4105, 57359),
(5965, 4105, 57359),
(5971, 4105, 57359),
(13417, 4105, 57359),
(16661, 4105, 57359),
(17089, 4105, 57359),
(17204, 4105, 57359),
(17212, 4105, 57359),
(17219, 4105, 57359),
(17519, 4105, 57359),
(17520, 4105, 57359),
(18270, 4105, 57359),
(20407, 4105, 57359),
(23127, 4105, 57359),
(34695, 4105, 57359),
(35786, 4105, 57359),
(36521, 4105, 57359),
(36700, 4105, 57359),
(37115, 4105, 57359),
(38242, 4105, 57359),
(38515, 4105, 57359),
(43464, 4105, 57359),
(44393, 4105, 57359),
(44394, 4105, 57359),
(44740, 4105, 57359),
(45029, 4105, 57359),
(45718, 4105, 57359),
(49808, 4105, 57359),
(49900, 4105, 57359),
(49964, 4105, 57359),
(50011, 4105, 57359),
(50019, 4105, 57359),
(50022, 4105, 57359),
(50130, 4105, 57359),
(50153, 4105, 57359),
(50174, 4105, 57359),
(51637, 4105, 57359),
(51638, 4105, 57359),
(51639, 4105, 57359),
(51640, 4105, 57359),
(52290, 4105, 57359),
(52292, 4105, 57359),
(52299, 4105, 57359),
(52317, 4105, 57359),
(53405, 4105, 57359);

DELETE FROM `trainer` WHERE `Id`=124;
INSERT INTO `trainer` (`Id`, `Type`, `Greeting`, `VerifiedBuild`) VALUES
(124, 0, 'Hello, shaman!  Ready for some training?', 57359);


DELETE FROM `trainer_spell` WHERE (`TrainerId`=124 AND `SpellId` IN (8042,8075,73899,450762,87718,87507,87497,8737,331,66844,66843,66842,73920,2894,6196,2825,2062,3738,51514,52127,8232,8227,79206,77472,1064,546,8184,8190,8143,57994,51886,8004,556,2484,8024,370,2008,8017,324,76780,5730,5675,51505,8512,8177,1535,8050,20608,36936,421,8056,2645,131,51730,73680,8033,5394,3599,8071));
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`, `VerifiedBuild`) VALUES
(124, 8042, 135, 0, 0, 0, 0, 0, 5, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8075, 93, 0, 0, 0, 0, 0, 4, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 73899, 57, 0, 0, 0, 0, 0, 3, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 450762, 18525, 0, 0, 0, 0, 0, 44, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 87718, 159600, 0, 0, 0, 0, 0, 74, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 87507, 21375, 0, 0, 0, 0, 0, 50, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 87497, 210900, 0, 0, 0, 0, 0, 80, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8737, 14250, 0, 0, 0, 0, 0, 40, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 331, 271, 0, 0, 0, 0, 0, 7, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 66844, 21375, 0, 0, 0, 0, 0, 50, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 66843, 14250, 0, 0, 0, 0, 0, 40, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 66842, 7125, 0, 0, 0, 0, 0, 30, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 73920, 245100, 0, 0, 0, 0, 0, 83, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 2894, 99750, 0, 0, 0, 0, 0, 66, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 6196, 11400, 0, 0, 0, 0, 0, 36, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 2825, 125400, 0, 0, 0, 0, 0, 70, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 2062, 24225, 0, 0, 0, 0, 0, 56, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 3738, 18525, 0, 0, 0, 0, 0, 44, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 51514, 210900, 0, 0, 0, 0, 0, 80, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 52127, 3420, 0, 0, 0, 0, 0, 20, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8232, 8550, 0, 0, 0, 0, 0, 32, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8227, 1023, 0, 0, 0, 0, 0, 12, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 79206, 267900, 0, 0, 0, 0, 0, 85, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 77472, 111150, 0, 0, 0, 0, 0, 68, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 1064, 14250, 0, 0, 0, 0, 0, 40, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 546, 4845, 0, 0, 0, 0, 0, 24, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8184, 76950, 0, 0, 0, 0, 0, 62, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8190, 11400, 0, 0, 0, 0, 0, 36, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8143, 21375, 0, 0, 0, 0, 0, 52, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 57994, 1957, 0, 0, 0, 0, 0, 16, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 51886, 2646, 0, 0, 0, 0, 0, 18, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8004, 3420, 0, 0, 0, 0, 0, 20, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 556, 7125, 0, 0, 0, 0, 0, 30, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 2484, 2646, 0, 0, 0, 0, 0, 18, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8024, 646, 0, 0, 0, 0, 0, 10, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 370, 1023, 0, 0, 0, 0, 0, 12, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 2008, 1023, 0, 0, 0, 0, 0, 12, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8017, 168150, 0, 0, 0, 0, 0, 75, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 324, 370, 0, 0, 0, 0, 0, 8, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 76780, 88350, 0, 0, 0, 0, 0, 64, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 5730, 25650, 0, 0, 0, 0, 0, 58, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 5675, 15675, 0, 0, 0, 0, 0, 42, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 51505, 9975, 0, 0, 0, 0, 0, 34, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8512, 7125, 0, 0, 0, 0, 0, 30, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8177, 12825, 0, 0, 0, 0, 0, 38, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 1535, 7125, 0, 0, 0, 0, 0, 28, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8050, 1348, 0, 0, 0, 0, 0, 14, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 20608, 7125, 0, 0, 0, 0, 0, 30, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 36936, 7125, 0, 0, 0, 0, 0, 30, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 421, 7125, 0, 0, 0, 0, 0, 28, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8056, 3990, 0, 0, 0, 0, 0, 22, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 2645, 1643, 0, 0, 0, 0, 0, 15, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 131, 18525, 0, 0, 0, 0, 0, 46, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 51730, 22800, 0, 0, 0, 0, 0, 54, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 73680, 222300, 0, 0, 0, 0, 0, 81, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8033, 5700, 0, 0, 0, 0, 0, 26, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 5394, 3420, 0, 0, 0, 0, 0, 20, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 3599, 646, 0, 0, 0, 0, 0, 10, 57359), -- No Faction found! MoneyCost not recalculated!
(124, 8071, 19950, 0, 0, 0, 0, 0, 48, 57359); -- No Faction found! MoneyCost not recalculated!


DELETE FROM `creature_trainer` WHERE `CreatureID` IN (373, 986, 1406, 2219, 3030, 3031, 3032, 3062, 3066, 3157, 3173, 3344, 3403, 4991, 5965, 5971, 13417, 16661, 17089, 17204, 17212, 17219, 17519, 17520, 18270, 20407, 23127, 34695, 35786, 36521, 36700, 37115, 38242, 38515, 43464, 44393, 44394, 44740, 45029, 45718, 49808, 49900, 49964, 50011, 50019, 50022, 50130, 50153, 50174, 51637, 51638, 51639, 51640, 52290, 52292, 52299, 52317, 53405);
INSERT INTO `creature_trainer` (`CreatureID`, `TrainerID`, `MenuID`, `OptionID`) VALUES
(373, 124, 4105, 0),
(986, 124, 4105, 0),
(1406, 124, 4105, 0),
(2219, 124, 4105, 0),
(3030, 124, 4105, 0),
(3031, 124, 4105, 0),
(3032, 124, 4105, 0),
(3062, 124, 4105, 0),
(3066, 124, 4105, 0),
(3157, 124, 4105, 0),
(3173, 124, 4105, 0),
(3344, 124, 4105, 0),
(3403, 124, 4105, 0),
(4991, 124, 4105, 0),
(5965, 124, 4105, 0),
(5971, 124, 4105, 0),
(13417, 124, 4105, 0),
(16661, 124, 4105, 0),
(17089, 124, 4105, 0),
(17204, 124, 4105, 0),
(17212, 124, 4105, 0),
(17219, 124, 4105, 0),
(17519, 124, 4105, 0),
(17520, 124, 4105, 0),
(18270, 124, 4105, 0),
(20407, 124, 4105, 0),
(23127, 124, 4105, 0),
(34695, 124, 4105, 0),
(35786, 124, 4105, 0),
(36521, 124, 4105, 0),
(36700, 124, 4105, 0),
(37115, 124, 4105, 0),
(38242, 124, 4105, 0),
(38515, 124, 4105, 0),
(43464, 124, 4105, 0),
(44393, 124, 4105, 0),
(44394, 124, 4105, 0),
(44740, 124, 4105, 0),
(45029, 124, 4105, 0),
(45718, 124, 4105, 0),
(49808, 124, 4105, 0),
(49900, 124, 4105, 0),
(49964, 124, 4105, 0),
(50011, 124, 4105, 0),
(50019, 124, 4105, 0),
(50022, 124, 4105, 0),
(50130, 124, 4105, 0),
(50153, 124, 4105, 0),
(50174, 124, 4105, 0),
(51637, 124, 4105, 0),
(51638, 124, 4105, 0),
(51639, 124, 4105, 0),
(51640, 124, 4105, 0),
(52290, 124, 4105, 0),
(52292, 124, 4105, 0),
(52299, 124, 4105, 0),
(52317, 124, 4105, 0),
(53405, 124, 4105, 0);

