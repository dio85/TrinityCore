DELETE FROM `creature_loot_template` WHERE `Entry`=50039 AND `Item` IN (117, 159, 769, 805, 828, 1468, 2589, 3300, 4496, 5523, 5571, 5572, 50438, 56147, 62328);
INSERT INTO `creature_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(50039, 0, 117, 47.087, 0, 1, 0, 1, 1, ''),
(50039, 0, 159, 49.036, 0, 1, 0, 1, 1, ''),
(50039, 0, 769, 53.0, 0, 1, 0, 1, 1, ''),
(50039, 0, 805, 23.0, 0, 1, 0, 1, 1, ''),
(50039, 0, 828, 21.0, 0, 1, 0, 1, 1, ''),
(50039, 0, 1468, 10.34, 0, 1, 0, 1, 1, ''),
(50039, 0, 2589, 0.2826, 0, 1, 0, 1, 1, ''),
(50039, 0, 3300, 0.3297, 0, 1, 0, 1, 1, ''),
(50039, 0, 4496, 1.0951, 0, 1, 0, 1, 1, ''),
(50039, 0, 5523, 0.0353, 0, 1, 0, 1, 1, ''),
(50039, 0, 5571, 0.9774, 0, 1, 0, 1, 1, ''),
(50039, 0, 5572, 0.9126, 0, 1, 0, 1, 1, ''),
(50039, 0, 50438, 0.0059, 0, 1, 0, 1, 1, ''),
(50039, 0, 56147, 0.0353, 0, 1, 0, 1, 1, ''),
(50039, 0, 62328, 0.1236, 0, 1, 0, 1, 1, '');

UPDATE `creature_template_difficulty` SET `MinLevel` = 3, `MaxLevel` = 3, `HealthScalingExpansion` = 0, `HealthModifier` = 1, `ManaModifier` = 1, `ArmorModifier` = 1, `DamageModifier` = 1, `CreatureDifficultyID` = 0, `TypeFlags` = 0, `TypeFlags2` = 0, `LootID` = 50039, `PickPocketLootID` = 0, `SkinLootID` = 0, `GoldMin` = 1, `GoldMax` = 5, `StaticFlags1` = 0, `StaticFlags2` = 0, `StaticFlags3` = 0, `StaticFlags4` = 0, `StaticFlags5` = 0, `StaticFlags6` = 0, `StaticFlags7` = 0, `StaticFlags8` = 0, `VerifiedBuild` = 57564 WHERE `Entry` = 50039 AND `DifficultyID` = 0;
