DELETE FROM `creature_template_gossip` WHERE `CreatureID` IN (542, 1409, 2217, 3033, 3034, 3036, 3060, 3064, 3597, 3602, 4217,4218, 4219, 4985, 5504, 5505, 5506, 5963, 5972, 8142, 9465, 12042, 13476, 16655, 16721, 35873, 36628, 36703, 38243, 38799, 44380, 44395, 44396, 44459, 44726, 44978, 49915, 49942, 49997, 50034, 50136, 50137, 50152, 50171, 50492, 50505, 50506, 50507, 
52318, 52319, 52335);
INSERT INTO `creature_template_gossip` (`CreatureID`, `MenuID`, `VerifiedBuild`) VALUES
(542, 11877, 57359),
(1409, 11877, 57359),
(2217, 11877, 57359),
(3033, 11877, 57359),
(3034, 11877, 57359),
(3036, 11877, 57359),
(3060, 11877, 57359),
(3064, 11877, 57359),
(3597, 11877, 57359),
(3602, 11877, 57359),
(4217, 11877, 57359),
(4218, 11877, 57359),
(4219, 11877, 57359),
(4985, 11877, 57359),
(5504, 11877, 57359),
(5505, 11877, 57359),
(5506, 11877, 57359),
(5963, 11877, 57359),
(5972, 11877, 57359),
(8142, 11877, 57359),
(9465, 11877, 57359),
(12042, 11877, 57359),
(13476, 11877, 57359),
(16655, 11877, 57359),
(16721, 11877, 57359),
(35873, 11877, 57359),
(36628, 11877, 57359),
(36703, 11877, 57359),
(38243, 11877, 57359),
(38799, 11877, 57359),
(44380, 11877, 57359),
(44395, 11877, 57359),
(44396, 11877, 57359),
(44459, 11877, 57359),
(44726, 11877, 57359),
(44978, 11877, 57359),
(49915, 11877, 57359),
(49942, 11877, 57359),
(49997, 11877, 57359),
(50034, 11877, 57359),
(50136, 11877, 57359),
(50137, 11877, 57359),
(50152, 11877, 57359),
(50171, 11877, 57359),
(50492, 11877, 57359),
(50505, 11877, 57359),
(50506, 11877, 57359),
(50507, 11877, 57359),
(52318, 11877, 57359),
(52319, 11877, 57359),
(52335, 11877, 57359);

DELETE FROM `trainer` WHERE `Id`=39;
INSERT INTO `trainer` (`Id`, `Type`, `Greeting`, `VerifiedBuild`) VALUES
(39, 0, 'Hello, druid!  Ready for some training?', 57359);


DELETE FROM `trainer_spell` WHERE (`TrainerId`=39 AND `SpellId` IN (774,467,8921,450759,5185,88751,88747,33950,87491,87505,16864,52610,20719,20484,16689,18960,1066,62078,40120,80965,80964,6807,5487,50769,29166,2637,16914,62600,99,770,8936,339,2912,1822,22842,22812,22568,768,779,1082,740,1126,5225,5221,5217,5215,5211,5209,783,1079,5229,9005,8998,1850,2782,2908,6785,22570,33786,33763,33745,6795,5570,50464,16857,77758,77764,77761));
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`, `VerifiedBuild`) VALUES
(39, 774, 54, 0, 0, 0, 0, 0, 3, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 467, 128, 0, 0, 0, 0, 0, 5, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 8921, 88, 0, 0, 0, 0, 0, 4, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 450759, 17550, 0, 0, 0, 0, 0, 44, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 5185, 180360, 0, 0, 0, 0, 0, 78, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 88751, 0, 0, 0, 0, 0, 0, 85, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 88747, 126900, 0, 0, 0, 0, 0, 85, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 33950, 24300, 0, 0, 0, 0, 0, 60, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 87491, 199800, 0, 0, 0, 0, 0, 80, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 87505, 20250, 0, 0, 0, 0, 0, 50, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 16864, 3240, 0, 0, 0, 0, 0, 20, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 52610, 167400, 0, 0, 768, 0, 0, 76, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 20719, 5400, 0, 0, 768, 0, 0, 26, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 20484, 3240, 0, 0, 0, 0, 0, 20, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 16689, 20250, 0, 0, 339, 0, 0, 52, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 18960, 1556, 0, 0, 0, 0, 0, 15, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 1066, 1854, 0, 0, 0, 0, 0, 16, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 62078, 5400, 0, 0, 768, 0, 0, 36, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 40120, 126900, 0, 0, 34091, 33943, 0, 70, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 80965, 1890, 0, 0, 768, 0, 0, 22, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 80964, 1890, 0, 0, 5487, 0, 0, 22, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 6807, 1556, 0, 0, 5487, 0, 0, 15, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 5487, 1556, 0, 0, 0, 0, 0, 15, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 50769, 969, 0, 0, 0, 0, 0, 12, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 29166, 6750, 0, 0, 0, 0, 0, 28, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 2637, 18900, 0, 0, 0, 0, 0, 48, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 16914, 17550, 0, 0, 0, 0, 0, 44, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 62600, 13500, 0, 0, 5487, 0, 0, 40, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 99, 1556, 0, 0, 5487, 0, 0, 15, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 770, 2295, 0, 0, 0, 0, 0, 24, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 8936, 969, 0, 0, 0, 0, 0, 12, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 339, 256, 0, 0, 0, 0, 0, 7, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 2912, 351, 0, 0, 0, 0, 0, 8, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 1822, 351, 0, 0, 768, 0, 0, 8, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 22842, 20250, 0, 0, 5487, 0, 0, 52, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 22812, 24300, 0, 0, 0, 0, 0, 58, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 22568, 351, 0, 0, 768, 0, 0, 10, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 768, 351, 0, 0, 0, 0, 0, 8, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 779, 2506, 0, 0, 5487, 0, 0, 18, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 1082, 351, 0, 0, 768, 0, 0, 8, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 740, 105300, 0, 0, 0, 0, 0, 68, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 1126, 6750, 0, 0, 0, 0, 0, 30, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 5225, 8100, 0, 0, 768, 0, 0, 32, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 5221, 17550, 0, 0, 768, 0, 0, 46, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 5217, 4590, 0, 0, 768, 0, 0, 24, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 5215, 612, 0, 0, 768, 0, 0, 10, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 5211, 8100, 0, 0, 5487, 0, 0, 32, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 5209, 6750, 0, 0, 5487, 0, 0, 28, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 783, 1854, 0, 0, 0, 0, 0, 16, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 1079, 21600, 0, 0, 768, 0, 0, 54, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 5229, 3780, 0, 0, 5487, 0, 0, 22, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 9005, 8100, 0, 0, 768, 0, 0, 32, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 8998, 5400, 0, 0, 768, 0, 0, 26, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 1850, 5400, 0, 0, 768, 0, 0, 26, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 2782, 4590, 0, 0, 0, 0, 0, 24, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 2908, 6750, 0, 0, 0, 0, 0, 28, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 6785, 3780, 0, 0, 768, 0, 0, 22, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 22570, 72900, 0, 0, 768, 0, 0, 62, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 33786, 151200, 0, 0, 0, 0, 0, 74, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 33763, 83700, 0, 0, 0, 0, 0, 64, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 33745, 94500, 0, 0, 5487, 0, 0, 66, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 6795, 1556, 0, 0, 5487, 0, 0, 15, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 5570, 3240, 0, 0, 0, 0, 0, 20, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 50464, 351, 0, 0, 0, 0, 0, 8, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 16857, 2295, 0, 0, 0, 0, 0, 24, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 77758, 210600, 0, 0, 5487, 0, 0, 81, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 77764, 116100, 0, 0, 768, 0, 0, 83, 57359), -- No Faction found! MoneyCost not recalculated!
(39, 77761, 116100, 0, 0, 5487, 0, 0, 83, 57359); -- No Faction found! MoneyCost not recalculated!


DELETE FROM `creature_trainer` WHERE `CreatureID` IN (542, 1409, 2217, 3033, 3034, 3036, 3060, 3064, 3597, 3602, 4217,4218, 4219, 4985, 5504, 5505, 5506, 5963, 5972, 8142, 9465, 12042, 13476, 16655, 16721, 35873, 36628, 36703, 38243, 38799, 44380, 44395, 44396, 44459, 44726, 44978, 49915, 49942, 49997, 50034, 50136, 50137, 50152, 50171, 50492, 50505, 50506, 50507, 
52318, 52319, 52335);
INSERT INTO `creature_trainer` (`CreatureID`, `TrainerID`, `MenuID`, `OptionID`) VALUES
(542, 39, 11877, 0),
(1409, 39, 11877, 0),
(2217, 39, 11877, 0),
(3033, 39, 11877, 0),
(3034, 39, 11877, 0),
(3036, 39, 11877, 0),
(3060, 39, 11877, 0),
(3064, 39, 11877, 0),
(3597, 39, 11877, 0),
(3602, 39, 11877, 0),
(4217, 39, 11877, 0),
(4218, 39, 11877, 0),
(4219, 39, 11877, 0),
(4985, 39, 11877, 0),
(5504, 39, 11877, 0),
(5505, 39, 11877, 0),
(5506, 39, 11877, 0),
(5963, 39, 11877, 0),
(5972, 39, 11877, 0),
(8142, 39, 11877, 0),
(9465, 39, 11877, 0),
(12042, 39, 11877, 0),
(13476, 39, 11877, 0),
(16655, 39, 11877, 0),
(16721, 39, 11877, 0),
(35873, 39, 11877, 0),
(36628, 39, 11877, 0),
(36703, 39, 11877, 0),
(38243, 39, 11877, 0),
(38799, 39, 11877, 0),
(44380, 39, 11877, 0),
(44395, 39, 11877, 0),
(44396, 39, 11877, 0),
(44459, 39, 11877, 0),
(44726, 39, 11877, 0),
(44978, 39, 11877, 0),
(49915, 39, 11877, 0),
(49942, 39, 11877, 0),
(49997, 39, 11877, 0),
(50034, 39, 11877, 0),
(50136, 39, 11877, 0),
(50137, 39, 11877, 0),
(50152, 39, 11877, 0),
(50171, 39, 11877, 0),
(50492, 39, 11877, 0),
(50505, 39, 11877, 0),
(50506, 39, 11877, 0),
(50507, 39, 11877, 0),
(52318, 39, 11877, 0),
(52319, 39, 11877, 0),
(52335, 39, 11877, 0);