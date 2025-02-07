DROP TABLE IF EXISTS `area_poi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_poi` (
  `Name` text,
  `Description` text,
  `ID` int NOT NULL DEFAULT '0',
  `Pos1` float NOT NULL DEFAULT '0',
  `Pos2` float NOT NULL DEFAULT '0',
  `Pos3` float NOT NULL DEFAULT '0',
  `PortLocID` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `UiTextureAtlasMemberID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `WMOGroupID` int NOT NULL DEFAULT '0',
  `PoiDataType` int NOT NULL DEFAULT '0',
  `PoiData` int NOT NULL DEFAULT '0',
  `Field91038783011` int unsigned NOT NULL DEFAULT '0',
  `ContinentID` smallint unsigned NOT NULL DEFAULT '0',
  `AreaID` smallint NOT NULL DEFAULT '0',
  `WorldStateID` smallint unsigned NOT NULL DEFAULT '0',
  `Field100045141012` smallint NOT NULL DEFAULT '0',
  `UiWidgetSetID` smallint unsigned NOT NULL DEFAULT '0',
  `UiTextureKitID` smallint unsigned NOT NULL DEFAULT '0',
  `Field91038783017` smallint unsigned NOT NULL DEFAULT '0',
  `Importance` tinyint unsigned NOT NULL DEFAULT '0',
  `Icon` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_poi`
--

LOCK TABLES `area_poi` WRITE;
/*!40000 ALTER TABLE `area_poi` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_poi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_poi_locale`
--

DROP TABLE IF EXISTS `area_poi_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_poi_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `Description_lang` text,
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
-- Dumping data for table `area_poi_locale`
--

LOCK TABLES `area_poi_locale` WRITE;
/*!40000 ALTER TABLE `area_poi_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_poi_locale` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `area_poi_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_poi_state` (
  `ID` int NOT NULL DEFAULT '0',
  `Description` text,
  `WorldStateValue` tinyint unsigned NOT NULL DEFAULT '0',
  `IconEnumValue` tinyint unsigned NOT NULL DEFAULT '0',
  `UiTextureAtlasMemberID` int unsigned NOT NULL DEFAULT '0',
  `AreaPoiID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_poi_state`
--

LOCK TABLES `area_poi_state` WRITE;
/*!40000 ALTER TABLE `area_poi_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_poi_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_poi_state_locale`
--

DROP TABLE IF EXISTS `area_poi_state_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_poi_state_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Description_lang` text,
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
-- Dumping data for table `area_poi_state_locale`
--

LOCK TABLES `area_poi_state_locale` WRITE;
/*!40000 ALTER TABLE `area_poi_state_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_poi_state_locale` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `bounty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bounty` (
  `ID` int NOT NULL DEFAULT '0',
  `QuestID` int NOT NULL DEFAULT '0',
  `FactionID` smallint unsigned NOT NULL DEFAULT '0',
  `IconFileDataID` int unsigned NOT NULL DEFAULT '0',
  `TurninPlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `BountySetID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bounty`
--

LOCK TABLES `bounty` WRITE;
/*!40000 ALTER TABLE `bounty` DISABLE KEYS */;
/*!40000 ALTER TABLE `bounty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bounty_set`
--

DROP TABLE IF EXISTS `bounty_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bounty_set` (
  `ID` int NOT NULL DEFAULT '0',
  `VisiblePlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `LockedQuestID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bounty_set`
--

LOCK TABLES `bounty_set` WRITE;
/*!40000 ALTER TABLE `bounty_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `bounty_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign` (
  `ID` int NOT NULL DEFAULT '0',
  `Title` text,
  `Description` text,
  `UiTextureKitID` int NOT NULL DEFAULT '0',
  `RewardQuestID` int NOT NULL DEFAULT '0',
  `Prerequisite` int NOT NULL DEFAULT '0',
  `Field90135755007` int NOT NULL DEFAULT '0',
  `Completed` int NOT NULL DEFAULT '0',
  `OnlyStallIf` int NOT NULL DEFAULT '0',
  `UiQuestDetailsThemeID` int NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `DisplayPriority` int NOT NULL DEFAULT '0',
  `Field100245779012` int NOT NULL DEFAULT '0',
  `Field100246144013` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_locale`
--

DROP TABLE IF EXISTS `campaign_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Title_lang` text,
  `Description_lang` text,
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
-- Dumping data for table `campaign_locale`
--

LOCK TABLES `campaign_locale` WRITE;
/*!40000 ALTER TABLE `campaign_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_x_condition`
--

DROP TABLE IF EXISTS `campaign_x_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_x_condition` (
  `ID` int NOT NULL DEFAULT '0',
  `FailureReason` text,
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `OrderIndex` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `CampaignID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_x_condition`
--

LOCK TABLES `campaign_x_condition` WRITE;
/*!40000 ALTER TABLE `campaign_x_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_x_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_x_condition_locale`
--

DROP TABLE IF EXISTS `campaign_x_condition_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_x_condition_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `FailureReason_lang` text,
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
-- Dumping data for table `campaign_x_condition_locale`
--

LOCK TABLES `campaign_x_condition_locale` WRITE;
/*!40000 ALTER TABLE `campaign_x_condition_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_x_condition_locale` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `campaign_x_quest_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_x_quest_line` (
  `ID` int NOT NULL DEFAULT '0',
  `CampaignID` int unsigned NOT NULL DEFAULT '0',
  `QuestLineID` int unsigned NOT NULL DEFAULT '0',
  `OrderIndex` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_x_quest_line`
--

LOCK TABLES `campaign_x_quest_line` WRITE;
/*!40000 ALTER TABLE `campaign_x_quest_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_x_quest_line` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `group_finder_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_finder_activity` (
  `ID` int NOT NULL DEFAULT '0',
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
  `Field110757361013` int NOT NULL DEFAULT '0',
  `Field110757361014` int NOT NULL DEFAULT '0',
  `Field110757361015` int NOT NULL DEFAULT '0',
  `Field110757361016` int NOT NULL DEFAULT '0',
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

DROP TABLE IF EXISTS `group_finder_activity_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_finder_activity_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `FullName` text,
  `ShortName` text,
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

--
-- Table structure for table `group_finder_activity_grp`
--

DROP TABLE IF EXISTS `group_finder_activity_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_finder_activity_grp` (
  `ID` int NOT NULL DEFAULT '0',
  `Name` text,
  `OrderIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_finder_activity_grp`
--

LOCK TABLES `group_finder_activity_grp` WRITE;
/*!40000 ALTER TABLE `group_finder_activity_grp` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_finder_activity_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_finder_activity_grp_locale`
--

DROP TABLE IF EXISTS `group_finder_activity_grp_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_finder_activity_grp_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name` text,
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
-- Dumping data for table `group_finder_activity_grp_locale`
--

LOCK TABLES `group_finder_activity_grp_locale` WRITE;
/*!40000 ALTER TABLE `group_finder_activity_grp_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_finder_activity_grp_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_finder_category`
--

DROP TABLE IF EXISTS `group_finder_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_finder_category` (
  `ID` int NOT NULL DEFAULT '0',
  `Name` text,
  `Description` text,
  `OrderIndex` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_finder_category`
--

LOCK TABLES `group_finder_category` WRITE;
/*!40000 ALTER TABLE `group_finder_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_finder_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_finder_category_locale`
--

DROP TABLE IF EXISTS `group_finder_category_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_finder_category_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `Description_lang` text,
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
-- Dumping data for table `group_finder_category_locale`
--

LOCK TABLES `group_finder_category_locale` WRITE;
/*!40000 ALTER TABLE `group_finder_category_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_finder_category_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_finder_activity_x_pvp_bracket`
--

DROP TABLE IF EXISTS `group_finder_activity_x_pvp_bracket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_finder_activity_x_pvp_bracket` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `GroupFinderActivityID` int unsigned NOT NULL DEFAULT '0',
  `PVPBracketTypeID` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_finder_activity_x_pvp_bracket`
--

LOCK TABLES `group_finder_activity_x_pvp_bracket` WRITE;
/*!40000 ALTER TABLE `group_finder_activity_x_pvp_bracket` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_finder_activity_x_pvp_bracket` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `journal_encounter_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journal_encounter_item` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `JournalEncounterID` smallint unsigned NOT NULL DEFAULT '0',
  `ItemID` int unsigned NOT NULL DEFAULT '0',
  `FactionMask` tinyint NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `DifficultyMask` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_encounter_item`
--

LOCK TABLES `journal_encounter_item` WRITE;
/*!40000 ALTER TABLE `journal_encounter_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal_encounter_item` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `world_boss_lockout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `world_boss_lockout` (
  `ID` int NOT NULL DEFAULT '0',
  `Name` text,
  `TrackingQuestID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `world_boss_lockout`
--

LOCK TABLES `world_boss_lockout` WRITE;
/*!40000 ALTER TABLE `world_boss_lockout` DISABLE KEYS */;
/*!40000 ALTER TABLE `world_boss_lockout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `world_boss_lockout_locale`
--

DROP TABLE IF EXISTS `world_boss_lockout_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `world_boss_lockout_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
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
-- Dumping data for table `world_boss_lockout_locale`
--

LOCK TABLES `world_boss_lockout_locale` WRITE;
/*!40000 ALTER TABLE `world_boss_lockout_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `world_boss_lockout_locale` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `zone_story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone_story` (
  `ID` int NOT NULL DEFAULT '0',
  `PlayerFactionGroupID` tinyint unsigned NOT NULL DEFAULT '0',
  `DisplayAchievementID` int unsigned NOT NULL DEFAULT '0',
  `DisplayUIMapID` int unsigned NOT NULL DEFAULT '0',
  `PlayerUIMapID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_story`
--

LOCK TABLES `zone_story` WRITE;
/*!40000 ALTER TABLE `zone_story` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone_story` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `quest_poi_blob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_poi_blob` (
  `ID` int NOT NULL DEFAULT '0',
  `MapID` smallint unsigned NOT NULL DEFAULT '0',
  `UiMapID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `NumPoints` tinyint unsigned NOT NULL DEFAULT '0',
  `QuestID` int unsigned NOT NULL DEFAULT '0',
  `ObjectiveIndex` int NOT NULL DEFAULT '0',
  `ObjectiveID` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `NavigationPlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest_poi_blob`
--

LOCK TABLES `quest_poi_blob` WRITE;
/*!40000 ALTER TABLE `quest_poi_blob` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_poi_blob` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `quest_v2_cli_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_v2_cli_task` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `FiltRaces` bigint NOT NULL DEFAULT '0',
  `QuestTitle` text,
  `BulletText` text,
  `UniqueBitFlag` smallint unsigned NOT NULL DEFAULT '0',
  `ConditionID` int unsigned NOT NULL DEFAULT '0',
  `FiltActiveQuest` int unsigned NOT NULL DEFAULT '0',
  `FiltClasses` smallint NOT NULL DEFAULT '0',
  `FiltCompletedQuestLogic` int unsigned NOT NULL DEFAULT '0',
  `FiltMaxFactionID` int unsigned NOT NULL DEFAULT '0',
  `FiltMaxFactionValue` int unsigned NOT NULL DEFAULT '0',
  `FiltMinFactionID` int unsigned NOT NULL DEFAULT '0',
  `FiltMinFactionValue` int unsigned NOT NULL DEFAULT '0',
  `FiltMinSkillID` int unsigned NOT NULL DEFAULT '0',
  `FiltMinSkillValue` int unsigned NOT NULL DEFAULT '0',
  `FiltNonActiveQuest` int unsigned NOT NULL DEFAULT '0',
  `BreadCrumbID` int unsigned NOT NULL DEFAULT '0',
  `StartItem` int NOT NULL DEFAULT '0',
  `WorldStateExpressionID` int NOT NULL DEFAULT '0',
  `QuestInfoID` int unsigned NOT NULL DEFAULT '0',
  `ContentTuningID` int NOT NULL DEFAULT '0',
  `CovenantID` int NOT NULL DEFAULT '0',
  `Unk022` int NOT NULL DEFAULT '0',
  `Flags1` int NOT NULL DEFAULT '0',
  `Flags2` int NOT NULL DEFAULT '0',
  `Flags3` int NOT NULL DEFAULT '0',
  `FiltCompletedQuest1` int unsigned NOT NULL DEFAULT '0',
  `FiltCompletedQuest2` int unsigned NOT NULL DEFAULT '0',
  `FiltCompletedQuest3` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest_v2_cli_task`
--

LOCK TABLES `quest_v2_cli_task` WRITE;
/*!40000 ALTER TABLE `quest_v2_cli_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_v2_cli_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest_v2_cli_task_locale`
--

DROP TABLE IF EXISTS `quest_v2_cli_task_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_v2_cli_task_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `QuestTitle_lang` text,
  `BulletText_lang` text,
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
-- Dumping data for table `quest_v2_cli_task_locale`
--

LOCK TABLES `quest_v2_cli_task_locale` WRITE;
/*!40000 ALTER TABLE `quest_v2_cli_task_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_v2_cli_task_locale` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `quest_x_group_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest_x_group_activity` (
  `ID` int NOT NULL DEFAULT '0',
  `QuestID` int unsigned NOT NULL DEFAULT '0',
  `GroupFinderActivityID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest_x_group_activity`
--

LOCK TABLES `quest_x_group_activity` WRITE;
/*!40000 ALTER TABLE `quest_x_group_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_x_group_activity` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `ui_chromie_time_expansion_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ui_chromie_time_expansion_info` (
  `ID` int NOT NULL DEFAULT '0',
  `Name` text,
  `Description` text,
  `AllianceOverrideDesc` text,
  `HordeOverrideDesc` text,
  `SpellID` int NOT NULL DEFAULT '0',
  `MapAtlasElement` int NOT NULL DEFAULT '0',
  `PreviewAtlasElement` int NOT NULL DEFAULT '0',
  `ShowPlayerConditionID` int NOT NULL DEFAULT '0',
  `ExpansionMask` int NOT NULL DEFAULT '0',
  `ContentTuningID` int NOT NULL DEFAULT '0',
  `CompletedPlayerConditionID` int NOT NULL DEFAULT '0',
  `SortPriority` int NOT NULL DEFAULT '0',
  `RecommendPlayerConditionID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ui_chromie_time_expansion_info`
--

LOCK TABLES `ui_chromie_time_expansion_info` WRITE;
/*!40000 ALTER TABLE `ui_chromie_time_expansion_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ui_chromie_time_expansion_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ui_chromie_time_expansion_info_locale`
--

DROP TABLE IF EXISTS `ui_chromie_time_expansion_info_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ui_chromie_time_expansion_info_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name_lang` text,
  `Description_lang` text,
  `AllianceOverrideDesc_lang` text,
  `HordeOverrideDesc_lang` text,
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
-- Dumping data for table `ui_chromie_time_expansion_info_locale`
--

LOCK TABLES `ui_chromie_time_expansion_info_locale` WRITE;
/*!40000 ALTER TABLE `ui_chromie_time_expansion_info_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `ui_chromie_time_expansion_info_locale` ENABLE KEYS */;
UNLOCK TABLES;
