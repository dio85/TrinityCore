DROP TABLE IF EXISTS `group_finder_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_finder_activity` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `FullName` text,
  `ShortName` text,
  `GroupFinderCategoryID` tinyint unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint NOT NULL DEFAULT '0',
  `GroupFinderActivityGrpID` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `MinGearLevelSuggestion` smallint unsigned NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `MapID` smallint unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `AreaID` smallint unsigned NOT NULL DEFAULT '0',
  `MaxPlayers` tinyint unsigned NOT NULL DEFAULT '0',
  `DisplayType` tinyint unsigned NOT NULL DEFAULT '0',
  `MinLevel` int NOT NULL DEFAULT '0',
  `MaxLevel` int NOT NULL DEFAULT '0',
  `MinLevelSuggestion` int NOT NULL DEFAULT '0',
  `MaxLevelSuggestion` int NOT NULL DEFAULT '0',
  `OverrideContentTuningID` int NOT NULL DEFAULT '0',
  `MapChallengeModeID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_finder_activity`
--

LOCK TABLES `group_finder_activity` WRITE;
/*!40000 ALTER TABLE `group_finder_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_finder_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_finder_activity_locale`
--

--
-- Table structure for table `group_finder_activity_locale`
--

DROP TABLE IF EXISTS `group_finder_activity_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_finder_activity_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `FullName_lang` text,
  `ShortName_lang` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_finder_activity_locale`
--

LOCK TABLES `group_finder_activity_locale` WRITE;
/*!40000 ALTER TABLE `group_finder_activity_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_finder_activity_locale` ENABLE KEYS */;
UNLOCK TABLES;