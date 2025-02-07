DROP TABLE IF EXISTS `world_quest`;
CREATE TABLE IF NOT EXISTS `world_quest` (
  `id` int(10) unsigned NOT NULL,
  `rewardid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `character_world_quest`;
CREATE TABLE IF NOT EXISTS `character_world_quest` (
  `guid` bigint(20) unsigned NOT NULL,
  `questId` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `timer` int(10) unsigned NOT NULL,
  `variableID` int(10) unsigned NOT NULL,
  `value` int(10) NOT NULL,
  PRIMARY KEY (`guid`,`questId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `character_queststatus_world`;
CREATE TABLE IF NOT EXISTS `character_queststatus_world` (
  `guid` int(10) unsigned NOT NULL DEFAULT 0,
  `account` int(10) unsigned NOT NULL DEFAULT 0,
  `quest` int(10) unsigned NOT NULL DEFAULT 0,
  `resetTime` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`,`quest`) USING BTREE,
  KEY `resetTime` (`resetTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- Tábla adatainak mentése bfa_characters.character_queststatus_world: ~0 rows (hozzávetőleg)
DELETE FROM `character_queststatus_world`;

DROP TABLE IF EXISTS `challenge`;
CREATE TABLE IF NOT EXISTS `challenge` (
  `ID` int(11) NOT NULL,
  `GuildID` bigint(20) NOT NULL DEFAULT 0,
  `MapID` mediumint(9) NOT NULL DEFAULT 0,
  `ChallengeID` mediumint(6) NOT NULL DEFAULT 0,
  `RecordTime` int(11) NOT NULL DEFAULT 0,
  `Date` int(11) NOT NULL DEFAULT 0,
  `ChallengeLevel` smallint(6) NOT NULL DEFAULT 0,
  `TimerLevel` smallint(6) NOT NULL DEFAULT 0,
  `Affixes` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ChestID` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `mapID` (`MapID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- Tábla adatainak mentése bfa_characters.challenge: ~0 rows (hozzávetőleg)
DELETE FROM `challenge`;

-- Struktúra mentése tábla bfa_characters. challenge_key
DROP TABLE IF EXISTS `challenge_key`;
CREATE TABLE IF NOT EXISTS `challenge_key` (
  `guid` int(10) NOT NULL DEFAULT 0,
  `ID` mediumint(6) unsigned NOT NULL DEFAULT 0,
  `Level` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `Affix` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `Affix1` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `Affix2` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `Affix3` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `KeyIsCharded` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `timeReset` int(10) unsigned NOT NULL DEFAULT 0,
  `InstanceID` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE,
  KEY `guid` (`guid`) USING BTREE,
  KEY `timeReset` (`timeReset`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- Tábla adatainak mentése bfa_characters.challenge_key: ~0 rows (hozzávetőleg)
DELETE FROM `challenge_key`;

-- Struktúra mentése tábla bfa_characters. challenge_member
DROP TABLE IF EXISTS `challenge_member`;
CREATE TABLE IF NOT EXISTS `challenge_member` (
  `id` int(11) NOT NULL,
  `member` bigint(20) NOT NULL DEFAULT 0,
  `specID` mediumint(6) NOT NULL DEFAULT 0,
  `ChallengeLevel` smallint(6) NOT NULL DEFAULT 0,
  `Date` int(10) NOT NULL DEFAULT 0,
  `ChestID` int(10) NOT NULL DEFAULT 0,
  KEY `id` (`id`,`member`) USING BTREE,
  KEY `member` (`member`) USING BTREE,
  KEY `Date` (`Date`) USING BTREE,
  KEY `ChallengeLevel` (`ChallengeLevel`) USING BTREE,
  KEY `ChestID` (`ChestID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Tábla adatainak mentése bfa_characters.challenge_member: ~0 rows (hozzávetőleg)
DELETE FROM `challenge_member`;

-- Struktúra mentése tábla bfa_characters. challenge_oplote_loot
DROP TABLE IF EXISTS `challenge_oplote_loot`;
CREATE TABLE IF NOT EXISTS `challenge_oplote_loot` (
  `guid` int(10) NOT NULL DEFAULT 0,
  `chestListID` varchar(150) NOT NULL DEFAULT '',
  `date` int(10) NOT NULL DEFAULT 0,
  `ChallengeLevel` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- Tábla adatainak mentése bfa_characters.challenge_oplote_loot: ~0 rows (hozzávetőleg)
DELETE FROM `challenge_oplote_loot`;

-- Struktúra mentése tábla bfa_characters. character_completed_challenges
DROP TABLE IF EXISTS `character_completed_challenges`;
CREATE TABLE IF NOT EXISTS `character_completed_challenges` (
  `guid` bigint(20) unsigned NOT NULL,
  `KeyId` int(10) unsigned NOT NULL DEFAULT 0,
  `MapId` int(10) unsigned NOT NULL DEFAULT 0,
  `BestCompletion` int(12) unsigned DEFAULT 0,
  `LastCompletion` int(12) unsigned DEFAULT 0,
  `Medal` int(10) unsigned DEFAULT 0,
  `MedalDate` int(12) unsigned DEFAULT 0,
  PRIMARY KEY (`guid`,`KeyId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

-- Tábla adatainak mentése bfa_characters.character_completed_challenges: ~0 rows (hozzávetőleg)
DELETE FROM `character_completed_challenges`;