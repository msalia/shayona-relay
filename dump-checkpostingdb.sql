-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: checkpostingdb
-- ------------------------------------------------------
-- Server version	8.0.36-commercial

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `active_kds_theme`
--

DROP TABLE IF EXISTS `active_kds_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_kds_theme` (
  `ActiveKdsThemeID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `KdsThemeID` bigint DEFAULT NULL,
  `KdsThemePeriodID` bigint DEFAULT NULL,
  `LastChangeTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ActiveKdsThemeID`),
  KEY `IX_ACTIVE_KDS_THEME2` (`HierStrucID`),
  KEY `IX_ACTIVE_KDS_THEME3` (`KdsThemeID`),
  KEY `IX_ACTIVE_KDS_THEME4` (`KdsThemePeriodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `add_transfer_revenue_center`
--

DROP TABLE IF EXISTS `add_transfer_revenue_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `add_transfer_revenue_center` (
  `AddTransRevCtrID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `XferIndex` int NOT NULL,
  `RevCtrID` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`AddTransRevCtrID`),
  KEY `IX_ADD_TRANSFER_REVENUE_CENTER` (`HierStrucID`),
  KEY `IX_ADD_TRANSFER_RVC_CTR_m1` (`RevCtrID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `allergen`
--

DROP TABLE IF EXISTS `allergen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergen` (
  `AllergenID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `AllergenIndex` int NOT NULL,
  `AllergenCode` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `LastPostingTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`AllergenID`),
  UNIQUE KEY `UC_ALGNCODE` (`HierStrucID`,`AllergenCode`),
  KEY `IX_ALRGN_ALGID` (`AllergenIndex`,`AllergenID`),
  KEY `IX_ALRGN_HIERSTRCID` (`HierStrucID`),
  KEY `IX_ALRGN_NAMEID` (`NameID`),
  KEY `IX_ALRGN_PSTNGTIME` (`LastPostingTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_ALLERGEN_LastPostingTime` BEFORE INSERT ON `allergen` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `allergen_class`
--

DROP TABLE IF EXISTS `allergen_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergen_class` (
  `AllergenClassID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `NameID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `AllergenData` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`AllergenClassID`),
  KEY `IX_ALLERGEN_CLASS2` (`HierStrucID`),
  KEY `IX_ALLERGEN_CLASS3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alphanumeric_keyboard`
--

DROP TABLE IF EXISTS `alphanumeric_keyboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alphanumeric_keyboard` (
  `AlphanumericKeyboardID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `PopupNameID` bigint NOT NULL,
  `ContentDataID` bigint NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `LangID` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'1',
  `InternalTemplate` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'AlphaNumericRegular',
  PRIMARY KEY (`AlphanumericKeyboardID`),
  KEY `IX_ALPHANUM_KYBD2` (`HierStrucID`),
  KEY `IX_ALPHANUM_KYBD3` (`ContentDataID`),
  KEY `IX_ALPHANUM_KYBD4` (`LangID`),
  KEY `IX_ALPHANUM_KYBD5` (`NameID`),
  KEY `IX_ALPHANUM_KYBD6` (`PopupNameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `application_text`
--

DROP TABLE IF EXISTS `application_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_text` (
  `ApplicationTextID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `TextID` bigint NOT NULL,
  `ApplicationKey` tinyint unsigned NOT NULL,
  `TextKey` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ApplicationTextID`),
  KEY `AK_APPLICATION_TEXT` (`ApplicationKey`,`TextKey`),
  KEY `IX_APPLICATION_TEXT_2` (`HierStrucID`),
  KEY `IX_APPLICATION_TEXT_3` (`TextID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assembly_config`
--

DROP TABLE IF EXISTS `assembly_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assembly_config` (
  `AssemblyConfigID` bigint NOT NULL,
  `HierStrucID` bigint DEFAULT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `ContentDataID` bigint DEFAULT NULL,
  `ModuleType` int NOT NULL,
  `AssemblyName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `MinimumCompatibility` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MaximumCompatibility` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`AssemblyConfigID`),
  KEY `IX_ASSEMBLY_CONFIG2` (`HierStrucID`),
  KEY `IX_ASSEMBLY_CONFIG3` (`ContentDataID`),
  KEY `IX_ASSEMBLY_CONFIG4` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auto_menu_level`
--

DROP TABLE IF EXISTS `auto_menu_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_menu_level` (
  `AutoMenuLvlID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `AutoMenuLvlIndex` int NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `StartTime` int DEFAULT NULL,
  `EndTime` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `MainLevelIndex` int DEFAULT NULL,
  `SubLevelIndex` int DEFAULT NULL,
  PRIMARY KEY (`AutoMenuLvlID`),
  KEY `IX_AUTO_MENU_LEVEL` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `autofire_parameter`
--

DROP TABLE IF EXISTS `autofire_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autofire_parameter` (
  `AutofireParamID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `WorkstationID` int DEFAULT NULL,
  `MaxChecks` int DEFAULT NULL,
  `TendMedID` int DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `MaxDays` smallint DEFAULT NULL,
  `EmployeeID` bigint DEFAULT NULL,
  `BackupDelay` int DEFAULT NULL,
  PRIMARY KEY (`AutofireParamID`),
  UNIQUE KEY `AK_AUTOFIRE_PARAMETER` (`HierStrucID`),
  KEY `IX_AUTOFIRE_PARAMETER_2` (`WorkstationID`),
  KEY `IX_AUTOFIRE_PARAMETER_3` (`TendMedID`),
  KEY `IX_AUTOFIRE_PARAMETER_4` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `barcode`
--

DROP TABLE IF EXISTS `barcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barcode` (
  `BarcodeID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `Code` bigint NOT NULL,
  `Price` decimal(21,4) DEFAULT NULL,
  `PrepCost` decimal(21,4) DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `MiMasterObjNum` int DEFAULT NULL,
  `MiDefSeqNum` int DEFAULT NULL,
  `MiPriceSeqNum` int DEFAULT NULL,
  `LeadNumZeros` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`BarcodeID`),
  UNIQUE KEY `AK_BARCODE` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_BARCODE_2001` (`HierStrucID`,`BarcodeID`,`ObjectNumber`,`Code`,`Price`,`PrepCost`,`IsVisible`,`IsDeleted`,`MiMasterObjNum`,`MiDefSeqNum`,`MiPriceSeqNum`),
  KEY `IX_BARCODE_2301` (`ObjectNumber`,`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `barcode_format`
--

DROP TABLE IF EXISTS `barcode_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barcode_format` (
  `BarcodeFormatID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `NameID` bigint DEFAULT NULL,
  `BarcodeFormatSetID` int NOT NULL,
  `BarcodeFormatIndex` smallint NOT NULL,
  `Length` int NOT NULL,
  `StartPosition` int NOT NULL,
  `ReturnedLength` int NOT NULL,
  `Custom` bit(1) NOT NULL,
  PRIMARY KEY (`BarcodeFormatID`),
  KEY `IX_BARCODE_FORMAT_2` (`HierStrucID`),
  KEY `IX_BARCODE_FORMAT_3` (`BarcodeFormatSetID`),
  KEY `IX_BARCODE_FORMAT_4` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `barcode_format_set`
--

DROP TABLE IF EXISTS `barcode_format_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barcode_format_set` (
  `BarcodeFormatSetID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `NameID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  PRIMARY KEY (`BarcodeFormatSetID`),
  KEY `IX_BARCODE_FORMAT_SET_2` (`HierStrucID`),
  KEY `IX_BARCODE_FORMAT_SET_3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `browser_allowed_url`
--

DROP TABLE IF EXISTS `browser_allowed_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `browser_allowed_url` (
  `BrowserAllowedUrlId` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `UrlAddress` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `DescriptionId` bigint DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `OrganizationId` bigint DEFAULT NULL,
  PRIMARY KEY (`BrowserAllowedUrlId`),
  KEY `IX_BROWSER_ALLOWED_URL_HIERSTRUCID` (`HierStrucID`),
  KEY `IX_BROWSER_ALLOWED_URL_ORGANIZATIONID` (`OrganizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `canadian_gst`
--

DROP TABLE IF EXISTS `canadian_gst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canadian_gst` (
  `GstID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `OptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Threshold1` decimal(21,4) DEFAULT NULL,
  `Threshold2` decimal(21,4) DEFAULT NULL,
  `PstNameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `TaxIndex` smallint DEFAULT NULL,
  PRIMARY KEY (`GstID`),
  KEY `IX_CANADIAN_GST` (`HierStrucID`),
  KEY `IX_CANADIAN_GST_m1` (`PstNameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `canadian_pst`
--

DROP TABLE IF EXISTS `canadian_pst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canadian_pst` (
  `PstID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `RateIndex` int NOT NULL,
  `OptionBits1` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Threshold1` decimal(21,4) DEFAULT NULL,
  `OptionBits2` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Threshold2` decimal(21,4) DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `TaxIndex` smallint DEFAULT NULL,
  PRIMARY KEY (`PstID`),
  UNIQUE KEY `AK_CANADIAN_PST_1` (`HierStrucID`,`RateIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashier`
--

DROP TABLE IF EXISTS `cashier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashier` (
  `CashierID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `TrkGrpID` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `LastPostingTime` datetime(3) DEFAULT NULL,
  `ShiftNumber` int DEFAULT NULL,
  PRIMARY KEY (`CashierID`),
  UNIQUE KEY `AK_CASHIER` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_CASHIER` (`NameID`),
  KEY `IX_CASHIER_1000` (`LastPostingTime`),
  KEY `IX_CASHIER_2` (`TrkGrpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_CASHIER_LastPostingTime` BEFORE INSERT ON `cashier` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `change_set`
--

DROP TABLE IF EXISTS `change_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `change_set` (
  `ChangeSetID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `AllowLocalControl` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ChangeSetID`),
  UNIQUE KEY `AK_CHANGE_SET` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_CHANGE_SET_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `change_set_timetable`
--

DROP TABLE IF EXISTS `change_set_timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `change_set_timetable` (
  `ChangeSetTimetableID` bigint NOT NULL,
  `StartTime` datetime(3) DEFAULT NULL,
  `EndTime` datetime(3) DEFAULT NULL,
  `TimeIsLocal` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `MinLeadTime` datetime(3) DEFAULT NULL,
  `MaxLeadTime` datetime(3) DEFAULT NULL,
  `ChangeSetID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `RequireLocalControl` bit(1) DEFAULT b'0',
  `MustActivateBy` datetime(3) DEFAULT NULL,
  `OverrideStatus` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ChangeSetTimetableID`),
  KEY `IX_CHANGE_SET_TIMETABLE_CS` (`ChangeSetID`),
  KEY `IX_CHANGE_SET_TIMETABLE_HS` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changeset_eff_status`
--

DROP TABLE IF EXISTS `changeset_eff_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changeset_eff_status` (
  `ChangesetEffStatusID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ChangesetID` int NOT NULL,
  `ChangesetObjNum` int DEFAULT NULL,
  `OverrideStatus` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ChangesetEffStatusID`),
  KEY `IX_CHANGESETEFF_HSID` (`HierStrucID`),
  KEY `IX_CHANGESETEFF_ID` (`ChangesetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel_mgmt_post_data`
--

DROP TABLE IF EXISTS `channel_mgmt_post_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_mgmt_post_data` (
  `ChannelMgmtPostDataId` bigint NOT NULL AUTO_INCREMENT,
  `CheckGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CurrentStatus` int NOT NULL DEFAULT '0',
  `CurrentJsonVal` longtext NOT NULL,
  `LastReqDateTime` datetime(3) NOT NULL,
  `CheckFireTime` datetime(3) DEFAULT NULL,
  `CheckNumber` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChannelMgmtPostDataId`),
  KEY `ChannelMgmtPostDataId` (`ChannelMgmtPostDataId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `charge_tender_parameter`
--

DROP TABLE IF EXISTS `charge_tender_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge_tender_parameter` (
  `ChgTendParamID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `CashTenderObjNum` int DEFAULT NULL,
  `BankTenderObjNum` int DEFAULT NULL,
  `CashDeclareTenderObjNum` int DEFAULT NULL,
  `AutoSvcObjNum` int DEFAULT NULL,
  `CoverChgObjNum` int DEFAULT NULL,
  `ReprintTenderObjNum` int DEFAULT NULL,
  `SuspendOrderTenderObjNum` int DEFAULT NULL,
  `CreditCardTenderObjNum` int DEFAULT NULL,
  `KdsGuestCheckTenderObjNum` int DEFAULT NULL,
  `ServiceTenderObjNum` int DEFAULT NULL,
  `PrintTenderObjNum` int DEFAULT NULL,
  `GiftCardActivateObjNum` int DEFAULT NULL,
  `GiftCardIssueObjNum` int DEFAULT NULL,
  `GiftCardReloadObjNum` int DEFAULT NULL,
  `GiftCardRedeemObjNum` int DEFAULT NULL,
  `GiftCardCashOutObjNum` int DEFAULT NULL,
  `CreditCardAuthPaymentObjNum` int DEFAULT NULL,
  `CreditCardCashbackObjNum` int DEFAULT NULL,
  `RoomChargeTenderObjNum` int DEFAULT NULL,
  `AmountAdjustmentObjNum` int DEFAULT NULL,
  `DonationObjNum` int DEFAULT NULL,
  `CCSurchargeObjNum` int DEFAULT NULL,
  `PackageObjNum` int DEFAULT NULL,
  PRIMARY KEY (`ChgTendParamID`),
  UNIQUE KEY `AK_CHARGE_TENDER_PARAMETER` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `check_detail`
--

DROP TABLE IF EXISTS `check_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_detail` (
  `CheckID` bigint NOT NULL,
  `DetailIndex` int NOT NULL,
  `DetailType` int NOT NULL,
  `Status` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Seat` int DEFAULT NULL,
  `RevCtrID` int DEFAULT NULL,
  `EmployeeID` bigint DEFAULT NULL,
  `SalesCount` int DEFAULT NULL,
  `Total` decimal(21,4) DEFAULT NULL,
  `VoidLink` int DEFAULT NULL,
  `Numerator` int DEFAULT NULL,
  `Denominator` int DEFAULT NULL,
  `StoredValueCardID` int DEFAULT NULL,
  `StoredValueCardType` int DEFAULT NULL,
  `DetailPostingTime` datetime(3) DEFAULT NULL,
  `DetailLink` int DEFAULT NULL,
  `TaxForgivenTotal` decimal(21,4) DEFAULT NULL,
  `ParentDetailLink` int DEFAULT NULL,
  `RoundNumber` smallint DEFAULT NULL,
  `CheckDetailID` bigint NOT NULL,
  `KdsDetailLink` int DEFAULT NULL,
  `KdsOrderID` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GuestCount` int DEFAULT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `OwnerDetailLink` int DEFAULT NULL,
  `OrdChannelID` bigint DEFAULT NULL,
  `AuthEmployeeID` bigint DEFAULT NULL,
  PRIMARY KEY (`CheckDetailID`),
  UNIQUE KEY `AK_CHECK_DETAIL` (`CheckID`,`DetailIndex`),
  KEY `IX_CHECK_DETAIL_3` (`KdsOrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_CHECK_DETAIL_DetailPostingTime` BEFORE INSERT ON `check_detail` FOR EACH ROW BEGIN
IF new.DetailPostingTime IS NULL THEN
SET new.DetailPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `check_detail_order_device`
--

DROP TABLE IF EXISTS `check_detail_order_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_detail_order_device` (
  `CheckDetailOrdDvcID` bigint NOT NULL AUTO_INCREMENT,
  `CheckDetailID` bigint NOT NULL,
  `OrdDvcIndex` int NOT NULL,
  KEY `CheckDetailOrdDvcID` (`CheckDetailOrdDvcID`),
  KEY `IX_CHECK_DETAIL_ORDER_DEVICE` (`CheckDetailID`,`OrdDvcIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `check_detail_tax`
--

DROP TABLE IF EXISTS `check_detail_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_detail_tax` (
  `CheckDetailTaxID` bigint NOT NULL AUTO_INCREMENT,
  `CheckDetailID` bigint NOT NULL,
  `TaxID` int NOT NULL,
  KEY `CheckDetailTaxID` (`CheckDetailTaxID`),
  KEY `IX_CHECK_DETAIL_TAX` (`CheckDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `check_number_parameter`
--

DROP TABLE IF EXISTS `check_number_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_number_parameter` (
  `ChkNumParamID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `MinCheck` int NOT NULL,
  `MaxCheck` int NOT NULL,
  `NextCheck` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ChkNumParamID`),
  UNIQUE KEY `AK_CHECK_NUMBER_PARAMETER` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checks`
--

DROP TABLE IF EXISTS `checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checks` (
  `CheckID` bigint NOT NULL AUTO_INCREMENT,
  `RevCtrID` int NOT NULL,
  `CheckNumber` int NOT NULL,
  `Guid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Covers` int DEFAULT NULL,
  `DiningTableID` int DEFAULT NULL,
  `EmployeeID` bigint DEFAULT NULL,
  `CashierID` int DEFAULT NULL,
  `WorkstationID` int DEFAULT NULL,
  `AutofireWorkstationID` int DEFAULT NULL,
  `CheckOpen` datetime(3) NOT NULL,
  `TableOpen` datetime(3) DEFAULT NULL,
  `CheckClose` datetime(3) DEFAULT NULL,
  `FirstPrint` datetime(3) DEFAULT NULL,
  `Fire` datetime(3) DEFAULT NULL,
  `AutofireRevCtrID` int DEFAULT NULL,
  `AutofireTendMedID` int DEFAULT NULL,
  `AutofirePrinterMask` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `AddedToRevCtrID` int DEFAULT NULL,
  `SplitFromRevCtrID` int DEFAULT NULL,
  `AddedToCheckNum` int DEFAULT NULL,
  `SplitFromCheckNum` int DEFAULT NULL,
  `ReopenedFromCheckNum` int DEFAULT NULL,
  `ReopenedToCheckNum` int DEFAULT NULL,
  `Status` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ClosedSeat` varchar(104) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PrintedSeat` varchar(104) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ServingPeriodID` int DEFAULT NULL,
  `ServingPeriodTaxMask` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `GroupNum` int DEFAULT NULL,
  `OrdTypeID` int DEFAULT NULL,
  `AddedIn` int DEFAULT NULL,
  `SplitOut` int DEFAULT NULL,
  `LineFind` int DEFAULT NULL,
  `PageNumber` int DEFAULT NULL,
  `PrintCount` int DEFAULT NULL,
  `AlternateID` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SubTotal` decimal(21,4) DEFAULT NULL,
  `Tax` decimal(21,4) DEFAULT NULL,
  `AutoGratuity` decimal(21,4) DEFAULT NULL,
  `Other` decimal(21,4) DEFAULT NULL,
  `Payment` decimal(21,4) DEFAULT NULL,
  `Due` decimal(21,4) DEFAULT NULL,
  `Deposit` decimal(21,4) DEFAULT NULL,
  `MaxTotal` decimal(21,4) DEFAULT NULL,
  `LastWorkstationID` int DEFAULT NULL,
  `LangID` int NOT NULL,
  `CloseStatus` tinyint unsigned NOT NULL DEFAULT '0',
  `UserCustomData` smallint DEFAULT NULL,
  `CheckPostingTime` datetime(3) DEFAULT NULL,
  `Version` smallint DEFAULT NULL,
  `KdsOrderID` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '',
  `BarcodeEditCount` int DEFAULT NULL,
  `GiftReceiptCount` int DEFAULT NULL,
  `TaxByCheck` decimal(21,4) DEFAULT NULL,
  `TaxCollected` decimal(21,4) DEFAULT NULL,
  `RoundNumber` smallint NOT NULL DEFAULT '0',
  `RoundGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000000000000000000000000000',
  `PostingServingPeriodID` int DEFAULT NULL,
  `ReopenedToCheckGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ReopenedFromCheckGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `AddedToCheckGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SplitFromCheckGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PendingAutoDiscount` decimal(21,4) DEFAULT NULL,
  `TransferToEmployeeID` bigint DEFAULT NULL,
  `LastEmployeeID` bigint DEFAULT NULL,
  `DetailCount` int DEFAULT NULL,
  `CheckDetailData` longblob,
  `PrintedRoundNumber` smallint NOT NULL DEFAULT '0',
  `ItemInclusiveTax` decimal(21,4) DEFAULT NULL,
  `TeamID` int DEFAULT NULL,
  `PickupTime` datetime(3) DEFAULT NULL,
  `GroupEventDefDtlID` bigint DEFAULT NULL,
  `OrdStatusId` int DEFAULT NULL,
  `OrderMethodObjNum` int DEFAULT NULL,
  `IntendedPaymentMethod` tinyint unsigned DEFAULT NULL,
  `RequestedPickupDateTimeUtc` datetime(3) DEFAULT NULL,
  `QuotedPickupDateTimeUtc` datetime(3) DEFAULT NULL,
  `ActualPickupDateTimeUtc` datetime(3) DEFAULT NULL,
  `PickupQuoteTime` int DEFAULT NULL,
  `PickupQuoteType` tinyint unsigned DEFAULT NULL,
  `RequestedDeliveryDateTimeUtc` datetime(3) DEFAULT NULL,
  `QuotedDeliveryDateTimeUtc` datetime(3) DEFAULT NULL,
  `ActualDeliveryDateTimeUtc` datetime(3) DEFAULT NULL,
  `DeliveryQuoteTime` int DEFAULT NULL,
  `DeliveryQuoteType` tinyint unsigned DEFAULT NULL,
  `PickupPersonArrivalDateTimeUtc` datetime(3) DEFAULT NULL,
  `OrderConfirmedDateTimeUtc` datetime(3) DEFAULT NULL,
  `DeliveryEmployeeID` bigint DEFAULT NULL,
  `OrdChannelID` bigint DEFAULT NULL,
  PRIMARY KEY (`CheckID`),
  UNIQUE KEY `AK_CHECKS` (`Guid`),
  KEY `CheckID` (`CheckID`),
  KEY `IX_CHECK_KDS` (`KdsOrderID`),
  KEY `IX_CHECKS` (`CheckClose`),
  KEY `IX_CHECKS_1000` (`CloseStatus`,`RevCtrID`,`CheckClose`,`CheckID`,`ReopenedToCheckNum`,`Status`),
  KEY `IX_CHECKS_2` (`RevCtrID`,`CheckNumber`,`CheckClose`),
  KEY `IX_CHECKS_3` (`RevCtrID`,`CheckClose`,`AlternateID`),
  KEY `IX_CHECKS_4` (`RevCtrID`,`DiningTableID`,`CheckClose`),
  KEY `IX_CHECKS_5` (`RevCtrID`,`CloseStatus`),
  KEY `IX_CHECKS_6` (`TransferToEmployeeID`),
  KEY `IX_CHECKS_9` (`OrdTypeID`),
  KEY `IX_CHECKS_KDSORDER` (`KdsOrderID`,`RoundNumber`),
  KEY `IX_CHECKS_m1` (`RevCtrID`)
) ENGINE=InnoDB AUTO_INCREMENT=69601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_CHECKS_CheckPostingTime` BEFORE INSERT ON `checks` FOR EACH ROW BEGIN
IF new.CheckPostingTime IS NULL THEN
SET new.CheckPostingTime = utc_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clear_totals`
--

DROP TABLE IF EXISTS `clear_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clear_totals` (
  `ClearTotalsID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ClearAsOfBusinessDate` datetime(3) NOT NULL,
  `ClearAsOfDateTime` datetime(3) NOT NULL,
  `IsCleared` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ClearTotalsID`),
  KEY `IX_CLEAR_TOTALS2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_account`
--

DROP TABLE IF EXISTS `cm_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_account` (
  `CmAccountID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `ReferenceCode` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`CmAccountID`),
  KEY `IX_CM_ACCOUNT2` (`HierStrucID`),
  KEY `IX_CM_ACCOUNT3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_cash_count_threshold`
--

DROP TABLE IF EXISTS `cm_cash_count_threshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_cash_count_threshold` (
  `CmCashCountThresholdID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `MinThreshold` decimal(21,4) DEFAULT NULL,
  `MaxThreshold` decimal(21,4) DEFAULT NULL,
  `MaxCountAttempts` int NOT NULL DEFAULT '0',
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`CmCashCountThresholdID`),
  KEY `CmCashCountThresholdID` (`CmCashCountThresholdID`),
  KEY `IX_CM_CASH_COUNT_THLD_HIERID` (`HierStrucID`),
  KEY `IX_CM_CASH_COUNT_THLD_TEXT2` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_cash_count_thrshld_cls`
--

DROP TABLE IF EXISTS `cm_cash_count_thrshld_cls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_cash_count_thrshld_cls` (
  `CmCashCountThresholdClassID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `CmCashCountThresholdID` bigint NOT NULL,
  `CmItemObjNum` int NOT NULL,
  `MinThreshold` decimal(21,4) DEFAULT NULL,
  `MaxThreshold` decimal(21,4) DEFAULT NULL,
  PRIMARY KEY (`CmCashCountThresholdClassID`),
  UNIQUE KEY `IX_CMCASHCOUNTTHRSHLDCLS2` (`HierStrucID`,`CmCashCountThresholdID`,`CmItemObjNum`),
  KEY `CmCashCountThresholdClassID` (`CmCashCountThresholdClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_cash_pull_threshold`
--

DROP TABLE IF EXISTS `cm_cash_pull_threshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_cash_pull_threshold` (
  `CmCashPullThresholdID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `ChitQuantity` smallint DEFAULT NULL,
  PRIMARY KEY (`CmCashPullThresholdID`),
  KEY `IX_CM_CP_THRESHOLD2` (`HierStrucID`),
  KEY `IX_CM_CP_THRESHOLD3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_cash_pull_threshold_level`
--

DROP TABLE IF EXISTS `cm_cash_pull_threshold_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_cash_pull_threshold_level` (
  `CmCashPullThresholdLevelID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `CmCashPullThresholdID` bigint NOT NULL,
  `Amount` decimal(21,4) DEFAULT NULL,
  PRIMARY KEY (`CmCashPullThresholdLevelID`),
  KEY `IX_CM_CP_THRESHOLD_LEVEL2` (`HierStrucID`),
  KEY `IX_CM_CP_THRESHOLD_LEVEL3` (`CmCashPullThresholdID`),
  KEY `IX_CM_CP_THRESHOLD_LEVEL4` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_change_order`
--

DROP TABLE IF EXISTS `cm_change_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_change_order` (
  `CmChangeOrderID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `CMReceptacleDetailID` bigint NOT NULL,
  `ChangeOrderStatus` smallint NOT NULL,
  `ChangeOrderMethod` smallint NOT NULL,
  `CMBankReceptacleDetailID` bigint DEFAULT NULL,
  `ReferenceChangeOrder` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DayOfWeek` int NOT NULL,
  `TransTime` datetime(3) NOT NULL,
  `CmItemID` bigint NOT NULL,
  `CmChangeReceptacleDetailID` bigint DEFAULT NULL,
  PRIMARY KEY (`CmChangeOrderID`),
  KEY `CmChangeOrderID` (`CmChangeOrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_change_order_items`
--

DROP TABLE IF EXISTS `cm_change_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_change_order_items` (
  `CmChangeOrderItemID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `CmChangeOrderID` bigint NOT NULL,
  `CmItemUnitID` bigint DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Amount` decimal(21,4) DEFAULT NULL,
  PRIMARY KEY (`CmChangeOrderItemID`),
  KEY `CmChangeOrderItemID` (`CmChangeOrderItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_count_detail`
--

DROP TABLE IF EXISTS `cm_count_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_count_detail` (
  `CmCountDetailID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `CmCountsheetID` bigint NOT NULL,
  `CmReceptacleDetailID` bigint DEFAULT NULL,
  `Reference` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TransTime` datetime(3) NOT NULL,
  `CountState` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`CmCountDetailID`),
  KEY `CmCountDetailID` (`CmCountDetailID`),
  KEY `IX_CM_COUNT_DETAIL2` (`HierStrucID`),
  KEY `IX_CM_COUNT_DETAIL3` (`CmCountsheetID`),
  KEY `IX_CM_COUNT_DETAIL4` (`CmReceptacleDetailID`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_count_detail_classes`
--

DROP TABLE IF EXISTS `cm_count_detail_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_count_detail_classes` (
  `CmCountClassItemID` bigint NOT NULL AUTO_INCREMENT,
  `CmCountDetailID` bigint NOT NULL,
  `CmItemID` bigint NOT NULL,
  `Amount` decimal(21,4) DEFAULT NULL,
  `ExpectedAmount` decimal(21,4) DEFAULT NULL,
  `Variance` decimal(21,4) DEFAULT NULL,
  `Adjustment` decimal(21,4) DEFAULT NULL,
  `AdjustReasonID` int DEFAULT NULL,
  PRIMARY KEY (`CmCountClassItemID`),
  KEY `CmCountClassItemID` (`CmCountClassItemID`),
  KEY `IX_CM_COUNT_DETAIL_CLASSES2` (`CmCountDetailID`),
  KEY `IX_CM_COUNT_DETAIL_CLASSES3` (`AdjustReasonID`),
  KEY `IX_CM_COUNT_DETAIL_CLASSES4` (`CmItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_count_detail_items`
--

DROP TABLE IF EXISTS `cm_count_detail_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_count_detail_items` (
  `CmCountDetailItemID` bigint NOT NULL AUTO_INCREMENT,
  `CmCountDetailID` bigint NOT NULL,
  `CmItemUnitID` bigint DEFAULT NULL,
  `CmCountsheetGroupID` bigint DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Amount` decimal(21,4) DEFAULT NULL,
  `Reference` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`CmCountDetailItemID`),
  KEY `CmCountDetailItemID` (`CmCountDetailItemID`),
  KEY `IX_CM_COUNT_DETAIL_ITEMS2` (`CmCountDetailID`),
  KEY `IX_CM_COUNT_DETAIL_ITEMS3` (`CmCountsheetGroupID`),
  KEY `IX_CM_COUNT_DETAIL_ITEMS4` (`CmItemUnitID`)
) ENGINE=InnoDB AUTO_INCREMENT=2741 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_countsheet`
--

DROP TABLE IF EXISTS `cm_countsheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_countsheet` (
  `CmCountSheetID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  PRIMARY KEY (`CmCountSheetID`),
  KEY `IX_CM_COUNTSHEET2` (`HierStrucID`),
  KEY `IX_CM_COUNTSHEET3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_countsheet_group`
--

DROP TABLE IF EXISTS `cm_countsheet_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_countsheet_group` (
  `CmCountsheetGroupID` bigint NOT NULL,
  `CmCountsheetID` bigint DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  `CmItemID` bigint DEFAULT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint DEFAULT NULL,
  `CmCountsheetPageID` bigint NOT NULL,
  `SortOrder` int NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  PRIMARY KEY (`CmCountsheetGroupID`),
  KEY `IX_CM_COUNTSHEET_GROUP_6` (`CmCountsheetPageID`),
  KEY `IX_CM_COUNTSHEET_GROUP2` (`HierStrucID`),
  KEY `IX_CM_COUNTSHEET_GROUP3` (`CmItemID`),
  KEY `IX_CM_COUNTSHEET_GROUP4` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_countsheet_group_detail`
--

DROP TABLE IF EXISTS `cm_countsheet_group_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_countsheet_group_detail` (
  `CmCountsheetGroupDetailID` bigint NOT NULL,
  `CmCountsheetGroupID` bigint NOT NULL,
  `CmItemUnitID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `SortOrder` int NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  PRIMARY KEY (`CmCountsheetGroupDetailID`),
  KEY `IX_CM_COUNTSHEET_GROUP_DETAIL2` (`HierStrucID`),
  KEY `IX_CM_COUNTSHEET_GROUP_DETAIL3` (`CmItemUnitID`),
  KEY `IX_CM_COUNTSHEET_GROUP_DETAIL4` (`CmCountsheetGroupID`),
  KEY `IX_CM_COUNTSHEET_GROUP_DETAIL5` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_countsheet_page`
--

DROP TABLE IF EXISTS `cm_countsheet_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_countsheet_page` (
  `CmCountsheetPageID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `CmCountsheetID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `SortOrder` int NOT NULL,
  PRIMARY KEY (`CmCountsheetPageID`),
  KEY `IX_CM_COUNTSHEET_PAGE2` (`HierStrucID`),
  KEY `IX_CM_COUNTSHEET_PAGE3` (`NameID`),
  KEY `IX_CM_COUNTSHEET_PAGE4` (`CmCountsheetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_employee_till_assignment`
--

DROP TABLE IF EXISTS `cm_employee_till_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_employee_till_assignment` (
  `CmEmployeeTillAssignmentID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` bigint NOT NULL,
  `ReceptacleGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `StartTime` datetime(3) NOT NULL,
  PRIMARY KEY (`CmEmployeeTillAssignmentID`),
  KEY `CmEmployeeTillAssignmentID` (`CmEmployeeTillAssignmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_item`
--

DROP TABLE IF EXISTS `cm_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_item` (
  `CmItemID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `CurrencyObjNum` int DEFAULT NULL,
  PRIMARY KEY (`CmItemID`),
  KEY `IX_CM_ITEM2` (`HierStrucID`),
  KEY `IX_CM_ITEM3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_item_behavior`
--

DROP TABLE IF EXISTS `cm_item_behavior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_item_behavior` (
  `CmItemBehaviorID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `CmItemID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  PRIMARY KEY (`CmItemBehaviorID`),
  UNIQUE KEY `IX_CM_ITEM_BEHAVIOR1` (`HierStrucID`,`CmItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_item_pos_items`
--

DROP TABLE IF EXISTS `cm_item_pos_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_item_pos_items` (
  `CmItemItemsID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `CmItemID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `POSObjNum` int NOT NULL,
  `POSObjType` tinyint unsigned NOT NULL,
  `CmItemBehaviorID` bigint NOT NULL,
  PRIMARY KEY (`CmItemItemsID`),
  KEY `IX_CM_ITEM_POS_ITEMS2` (`HierStrucID`),
  KEY `IX_CM_ITEM_POS_ITEMS3` (`CmItemID`),
  KEY `IX_CM_ITEM_POS_ITEMS4` (`CmItemBehaviorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_item_units`
--

DROP TABLE IF EXISTS `cm_item_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_item_units` (
  `CmItemUnitID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `CmItemID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `Denominator` int NOT NULL DEFAULT '1',
  `Numerator` int NOT NULL DEFAULT '1',
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  PRIMARY KEY (`CmItemUnitID`),
  KEY `IX_CM_ITEM_UNITS2` (`HierStrucID`),
  KEY `IX_CM_ITEM_UNITS3` (`CmItemID`),
  KEY `IX_CM_ITEM_UNITS4` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_par_level`
--

DROP TABLE IF EXISTS `cm_par_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_par_level` (
  `CmParLevelID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `CmItemObjNum` int DEFAULT NULL,
  PRIMARY KEY (`CmParLevelID`),
  KEY `IX_CM_PAR_LEVEL2` (`HierStrucID`),
  KEY `IX_CM_PAR_LEVEL3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_par_level_item`
--

DROP TABLE IF EXISTS `cm_par_level_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_par_level_item` (
  `CmParLeveItemID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `CmParLevelID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `CmItemUnitObjNum` int NOT NULL,
  `Value` int DEFAULT NULL,
  `DayOfWeek` int NOT NULL,
  PRIMARY KEY (`CmParLeveItemID`),
  KEY `IX_CM_PAR_LEVEL_ITEM2` (`HierStrucID`),
  KEY `IX_CM_PAR_LEVEL_ITEM3` (`CmParLevelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_parameter`
--

DROP TABLE IF EXISTS `cm_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_parameter` (
  `CMParameterID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `ChangeOrderReportsCount` int NOT NULL DEFAULT '1',
  `OptionBits` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000',
  `ReceptacleBalancingItemObjNum` int DEFAULT NULL,
  `CashPullWarningFrequencyID` int DEFAULT NULL,
  `PaidInPaidOutChitCount` int NOT NULL DEFAULT '2',
  `CountingMethod` int NOT NULL DEFAULT '1',
  `ServerBankingTemplateObjNum` int DEFAULT NULL,
  PRIMARY KEY (`CMParameterID`),
  KEY `IX_CM_PARAMETER2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_receptacle`
--

DROP TABLE IF EXISTS `cm_receptacle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_receptacle` (
  `CmReceptacleID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `CmReceptacleType` tinyint unsigned DEFAULT NULL,
  `CmReceptacleTemplateObjNum` int DEFAULT NULL,
  `Location` tinyint unsigned DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `StartAmount` decimal(21,4) DEFAULT NULL,
  PRIMARY KEY (`CmReceptacleID`),
  KEY `IX_CM_RECEPTACLE2` (`HierStrucID`),
  KEY `IX_CM_RECEPTACLE4` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_receptacle_detail`
--

DROP TABLE IF EXISTS `cm_receptacle_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_receptacle_detail` (
  `CmReceptacleDetailID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `CmReceptacleID` bigint DEFAULT NULL,
  `Guid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ReceptacleType` tinyint unsigned NOT NULL,
  `State` tinyint unsigned NOT NULL,
  `StartAmount` decimal(21,4) DEFAULT NULL,
  `StartTime` datetime(3) NOT NULL,
  `CloseTime` datetime(3) DEFAULT NULL,
  `CashPullAmount` decimal(21,4) DEFAULT NULL,
  `CmCountsheetID` bigint DEFAULT NULL,
  `CmParLevelID` bigint DEFAULT NULL,
  `SessionId` bigint DEFAULT NULL,
  `Reference` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OperatorID` bigint DEFAULT NULL,
  `FailedCount` tinyint unsigned DEFAULT NULL,
  `CashPullReceptacleID` bigint DEFAULT NULL,
  `SourceReceptacleID` bigint DEFAULT NULL,
  `ReceptacleStatus` int NOT NULL DEFAULT '0',
  `BusinessDate` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`CmReceptacleDetailID`),
  KEY `CmReceptacleDetailID` (`CmReceptacleDetailID`),
  KEY `IX_CM_RECEPTACLE_DTL2` (`HierStrucID`),
  KEY `IX_CM_RECEPTACLE_DTL3` (`CmReceptacleID`),
  KEY `IX_CM_RECEPTACLE_DTL4` (`CmCountsheetID`),
  KEY `IX_CM_RECEPTACLE_DTL5` (`CmParLevelID`),
  KEY `IX_CM_RECEPTACLE_DTL6` (`Guid`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_receptacle_template`
--

DROP TABLE IF EXISTS `cm_receptacle_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_receptacle_template` (
  `CmReceptacleTemplateID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `DescriptionID` bigint DEFAULT NULL,
  `TemplateType` tinyint unsigned NOT NULL,
  `StartAmount` decimal(21,4) DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `Minimum` decimal(21,4) DEFAULT NULL,
  `Maximum` decimal(21,4) DEFAULT NULL,
  `CmCountSheetObjNum` int DEFAULT NULL,
  `CmParLevelObjNum` int DEFAULT NULL,
  `CmCashPullThresholdObjNum` int DEFAULT NULL,
  `Location` tinyint unsigned DEFAULT NULL,
  `StartAmtSourceReceptacleObjNum` int DEFAULT NULL,
  `DesignatedCashPullReceptObjNum` int DEFAULT NULL,
  `CashCountThresholdObjNum` int DEFAULT NULL,
  `CashDepositRoutingObjNum` int DEFAULT NULL,
  PRIMARY KEY (`CmReceptacleTemplateID`),
  KEY `IX_CM_RECEPTACLE_TEMPLATE2` (`HierStrucID`),
  KEY `IX_CM_RECEPTACLE_TEMPLATE5` (`NameID`),
  KEY `IX_CM_RECEPTACLE_TEMPLATE6` (`DescriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_template_class`
--

DROP TABLE IF EXISTS `cm_template_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_template_class` (
  `CmTemplateClassID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `CmReceptacleTemplateID` bigint NOT NULL,
  `CmItemObjNum` int NOT NULL,
  `StartAmount` decimal(21,4) DEFAULT NULL,
  `StartAmtSourceReceptacleObjNum` int DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CmCashPullThresholdObjNum` int DEFAULT NULL,
  `DesignatedCashPullReceptObjNum` int DEFAULT NULL,
  `Minimum` decimal(21,4) DEFAULT NULL,
  `Maximum` decimal(21,4) DEFAULT NULL,
  `CashDepositRoutingObjNum` int DEFAULT NULL,
  PRIMARY KEY (`CmTemplateClassID`),
  UNIQUE KEY `IX_CM_TEMPLATE_CLASS2` (`HierStrucID`,`CmReceptacleTemplateID`,`CmItemObjNum`),
  KEY `CmTemplateClassID` (`CmTemplateClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=3422 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_template_class_exclude`
--

DROP TABLE IF EXISTS `cm_template_class_exclude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_template_class_exclude` (
  `CmTemplateClassExclusionID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `CmReceptacleTemplateID` bigint NOT NULL,
  `CmItemObjNum` int NOT NULL,
  PRIMARY KEY (`CmTemplateClassExclusionID`),
  UNIQUE KEY `IX_CMTEMPLATECLASSEXCLUDE2` (`HierStrucID`,`CmReceptacleTemplateID`,`CmItemObjNum`),
  KEY `CmTemplateClassExclusionID` (`CmTemplateClassExclusionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_template_par_level`
--

DROP TABLE IF EXISTS `cm_template_par_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_template_par_level` (
  `CmTemplatePARLevelID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `CmReceptacleTemplateID` bigint NOT NULL,
  `CmParLevelObjNum` int NOT NULL,
  PRIMARY KEY (`CmTemplatePARLevelID`),
  UNIQUE KEY `IX_CM_TEMPLATE_PAR_LEVEL2` (`HierStrucID`,`CmReceptacleTemplateID`,`CmParLevelObjNum`),
  KEY `CmTemplatePARLevelID` (`CmTemplatePARLevelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_till_session`
--

DROP TABLE IF EXISTS `cm_till_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_till_session` (
  `CMTillSessionID` int NOT NULL,
  `EmployeeID` bigint NOT NULL,
  `WorkstationID` int NOT NULL,
  `DrawerID` int NOT NULL,
  `BusinessDate` datetime(3) NOT NULL,
  `CreatedDate` datetime(3) NOT NULL,
  `Status` smallint DEFAULT NULL,
  PRIMARY KEY (`CMTillSessionID`),
  KEY `IX_CM_TILL_SESSION2` (`BusinessDate`,`Status`),
  KEY `IX_CM_TILL_SESSION3` (`EmployeeID`,`WorkstationID`,`DrawerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_transaction_detail`
--

DROP TABLE IF EXISTS `cm_transaction_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_transaction_detail` (
  `CmTransactionDetailID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `CmReceptacleDetailID` bigint NOT NULL,
  `EmployeeID` bigint NOT NULL,
  `WorkstationID` bigint DEFAULT NULL,
  `TransactionTime` datetime(3) NOT NULL,
  `TransactionType` tinyint unsigned NOT NULL,
  `DrawerNumber` int DEFAULT NULL,
  `PosType` tinyint unsigned DEFAULT NULL,
  `PosItemID` bigint DEFAULT NULL,
  `Amount` decimal(21,4) DEFAULT NULL,
  `ForeignAmount` decimal(21,4) DEFAULT NULL,
  `CmTargetReceptacleDetailID` bigint DEFAULT NULL,
  `TargetEmployeeID` bigint DEFAULT NULL,
  `CmVendorID` bigint DEFAULT NULL,
  `CmAccountID` bigint DEFAULT NULL,
  `PosTransactionID` bigint DEFAULT NULL,
  `CmItemID` bigint DEFAULT NULL,
  `Balance` decimal(21,4) DEFAULT NULL,
  `ReasonID` int DEFAULT NULL,
  `Reference` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CashBalance` decimal(21,4) DEFAULT NULL,
  `InvoiceNumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `InvoiceDate` datetime(3) DEFAULT NULL,
  `Description` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `StartAmount` decimal(21,4) DEFAULT NULL,
  `CashPullAmount` decimal(21,4) DEFAULT NULL,
  `OtherCmReceptacleDetailID` bigint DEFAULT NULL,
  PRIMARY KEY (`CmTransactionDetailID`),
  KEY `CmTransactionDetailID` (`CmTransactionDetailID`),
  KEY `IX_CM_TRANS_DTL2` (`HierStrucID`),
  KEY `IX_CM_TRANS_DTL3` (`CmReceptacleDetailID`),
  KEY `IX_CM_TRANS_DTL4` (`CmItemID`),
  KEY `IX_CM_TRANS_DTL5` (`ReasonID`)
) ENGINE=InnoDB AUTO_INCREMENT=17536 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cm_vendor`
--

DROP TABLE IF EXISTS `cm_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_vendor` (
  `CmVendorID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `CmAccObjNum` int DEFAULT NULL,
  `ReferenceCode` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`CmVendorID`),
  KEY `IX_CM_VENDOR2` (`HierStrucID`),
  KEY `IX_CM_VENDOR3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `combo`
--

DROP TABLE IF EXISTS `combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo` (
  `ComboID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Priority` int DEFAULT NULL,
  `MenuItemMasterObjNum` int DEFAULT NULL,
  `MainItemComboGroupObjNum` int DEFAULT NULL,
  `AutoComboAlgorithm` smallint DEFAULT NULL,
  PRIMARY KEY (`ComboID`),
  UNIQUE KEY `AK_COMBO` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_COMBO_2` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `combo_group`
--

DROP TABLE IF EXISTS `combo_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_group` (
  `ComboGroupID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SluIndex` int DEFAULT NULL,
  `HhtSluIndex` int DEFAULT NULL,
  PRIMARY KEY (`ComboGroupID`),
  UNIQUE KEY `AK_COMBO_GROUP` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_COMBO_GROUP_2` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `combo_group_detail`
--

DROP TABLE IF EXISTS `combo_group_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_group_detail` (
  `ComboGroupDetailID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ComboGroupID` int NOT NULL,
  `Size1ComboGroupDetailID` int DEFAULT NULL,
  `Size2ComboGroupDetailID` int DEFAULT NULL,
  `Size3ComboGroupDetailID` int DEFAULT NULL,
  `Size4ComboGroupDetailID` int DEFAULT NULL,
  `OptionBits` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Quantity` int NOT NULL,
  `Size1MenuLvlIndex` int DEFAULT NULL,
  `Size2MenuLvlIndex` int DEFAULT NULL,
  `Size3MenuLvlIndex` int DEFAULT NULL,
  `Size4MenuLvlIndex` int DEFAULT NULL,
  `MenuItemMasterObjNum` int DEFAULT NULL,
  `ChangeSetObjNum` int DEFAULT NULL,
  PRIMARY KEY (`ComboGroupDetailID`),
  KEY `IX_COMBO_GROUP_DETAIL_2` (`ComboGroupID`),
  KEY `IX_COMBO_GROUP_DETAIL_3` (`Size1ComboGroupDetailID`),
  KEY `IX_COMBO_GROUP_DETAIL_4` (`Size2ComboGroupDetailID`),
  KEY `IX_COMBO_GROUP_DETAIL_5` (`Size3ComboGroupDetailID`),
  KEY `IX_COMBO_GROUP_DETAIL_6` (`Size4ComboGroupDetailID`),
  KEY `IX_COMBO_GROUP_DETAIL_7` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `combo_group_detail_price`
--

DROP TABLE IF EXISTS `combo_group_detail_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_group_detail_price` (
  `ComboGroupDetailPriceID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ComboGroupDetailID` int NOT NULL,
  `SequenceNum` int NOT NULL,
  `MenuLvlIndex` int DEFAULT NULL,
  `Price` decimal(21,4) DEFAULT NULL,
  `ChangeSetObjNum` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `PrepCost` decimal(21,4) DEFAULT NULL,
  PRIMARY KEY (`ComboGroupDetailPriceID`),
  KEY `IX_COMBO_GROUP_DETAIL_PRICE_2` (`HierStrucID`),
  KEY `IX_COMBO_GROUP_DETAIL_PRICE_3` (`ComboGroupDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `combo_group_price`
--

DROP TABLE IF EXISTS `combo_group_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_group_price` (
  `ComboGroupPriceID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ComboSideID` int NOT NULL,
  `SequenceNum` int NOT NULL,
  `MenuLvlIndex` int DEFAULT NULL,
  `Price` decimal(21,4) DEFAULT NULL,
  `PrepCost` decimal(21,4) DEFAULT NULL,
  PRIMARY KEY (`ComboGroupPriceID`),
  KEY `IX_COMBO_GROUP_PRICE2` (`HierStrucID`),
  KEY `IX_COMBO_GROUP_PRICE3` (`ComboSideID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `combo_group_substitutions`
--

DROP TABLE IF EXISTS `combo_group_substitutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_group_substitutions` (
  `ComboGroupSubstitutionId` bigint NOT NULL,
  `ComboGroup` int NOT NULL,
  `AlternateComboGroup` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  PRIMARY KEY (`ComboGroupSubstitutionId`),
  KEY `IX_COMBO_GROUP_SUBSTITUTIONS_4` (`HierStrucID`),
  KEY `IX_COMBO_GRP_SUBSTITUTIONS2` (`ComboGroup`),
  KEY `IX_COMBO_GRP_SUBSTITUTIONS3` (`AlternateComboGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `combo_side`
--

DROP TABLE IF EXISTS `combo_side`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_side` (
  `ComboSideID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ComboID` int NOT NULL,
  `SideNumber` smallint NOT NULL,
  `ComboGroupObjNum` int DEFAULT NULL,
  `SideCount` smallint DEFAULT NULL,
  `DefaultMenuLvlIndex` smallint DEFAULT NULL,
  `MenuLvls` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  PRIMARY KEY (`ComboSideID`),
  KEY `IX_COMBO_SIDE_2` (`HierStrucID`),
  KEY `IX_COMBO_SIDE_3` (`ComboID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `ComponentID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` bigint DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `PrepTime` int DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `PrintClassObjNum` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `DisplayName` bigint DEFAULT NULL,
  `CapacityUsage` int NOT NULL DEFAULT '0',
  `PreProdCourseOffset` smallint DEFAULT NULL,
  PRIMARY KEY (`ComponentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `component_condiment`
--

DROP TABLE IF EXISTS `component_condiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component_condiment` (
  `ComponentCondimentID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `ComponentObjNum` bigint NOT NULL,
  `MenuItemObjNum` int NOT NULL,
  `MenuItemDefSeqNum` int NOT NULL DEFAULT '0',
  `MenuItemDefID` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ComponentCondimentID`),
  KEY `ComponentCondimentID` (`ComponentCondimentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `condiment_set`
--

DROP TABLE IF EXISTS `condiment_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condiment_set` (
  `CondimentSetID` bigint NOT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `TempConfiguration` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `HierStrucID` bigint NOT NULL,
  `NameID` bigint DEFAULT NULL,
  PRIMARY KEY (`CondimentSetID`),
  UNIQUE KEY `AK_CONDIMENT_SET_1` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_CONDIMENT_SET_3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `condiment_set_condiment`
--

DROP TABLE IF EXISTS `condiment_set_condiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condiment_set_condiment` (
  `CondimentSetCondID` bigint NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0',
  `DefaultCount` int DEFAULT '1',
  `PriceLevel` smallint DEFAULT NULL,
  `SortOrder` smallint DEFAULT NULL,
  `TempConfiguration` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `HierStrucID` bigint DEFAULT NULL,
  `CondimentSetID` bigint NOT NULL,
  `DefLevel` smallint DEFAULT NULL,
  `MenuItemMasterObjNum` int DEFAULT NULL,
  PRIMARY KEY (`CondimentSetCondID`),
  KEY `IX_CONDIMENT_SET_CONDMNT_2` (`HierStrucID`),
  KEY `IX_CONDIMENT_SET_CONDMNT_3` (`CondimentSetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `confirm_parameter`
--

DROP TABLE IF EXISTS `confirm_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confirm_parameter` (
  `ConfirmParamID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `OptionBits` varchar(96) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `MaxGuest` int DEFAULT NULL,
  `MaxCheckPrint` int DEFAULT NULL,
  `PopUpTimeout` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `DaysAdjustClsdChk` int DEFAULT NULL,
  `DaysReopenClsdChk` int DEFAULT NULL,
  `EmpLockDuration` int DEFAULT NULL,
  `EmpLockSchStartTime` int DEFAULT NULL,
  `WorkstationReportsDefaultView` varchar(96) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  `HoldFireWarningTime` int DEFAULT NULL,
  `DaysReprintClsdChk` int DEFAULT NULL,
  PRIMARY KEY (`ConfirmParamID`),
  UNIQUE KEY `AK_CONFIRM_PARAMETER` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consent_definition`
--

DROP TABLE IF EXISTS `consent_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consent_definition` (
  `ConsentID` int NOT NULL AUTO_INCREMENT,
  `Description` longtext NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `KeepPIIData` int DEFAULT NULL,
  `LangID` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`ConsentID`),
  KEY `ConsentID` (`ConsentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consent_detail`
--

DROP TABLE IF EXISTS `consent_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consent_detail` (
  `ConsentID` int NOT NULL,
  `EmployeeID` bigint NOT NULL,
  `ConsentFlag` bit(1) NOT NULL,
  `LastUpdatedDateTime` datetime(3) NOT NULL,
  `AnonymizedDateTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `ContentID` bigint NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `ContentDataID` bigint DEFAULT NULL,
  `DescriptionID` bigint DEFAULT NULL,
  `HierStrucID` bigint DEFAULT NULL,
  PRIMARY KEY (`ContentID`),
  KEY `IX_CNTNT_CONTNTDATA` (`ContentDataID`),
  KEY `IX_CNTNT_DESCRIPTION` (`DescriptionID`),
  KEY `IX_CONTNT_HIERSTRUC` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_data`
--

DROP TABLE IF EXISTS `content_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_data` (
  `ContentDataID` bigint NOT NULL,
  `DataBlob` longblob,
  `Source` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FileNameOrigin` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ContentTypeID` int DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  `WriteToDiskFileName` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Configuration` longtext,
  `Target` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '11111111111111111111111111111111',
  `DataText` longtext,
  `EncConfiguration` longblob,
  `EncryptionKeyID` int DEFAULT NULL,
  `Signature` longblob,
  PRIMARY KEY (`ContentDataID`),
  KEY `IX_CNTNTDTA_HIERSTRUCID` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_group`
--

DROP TABLE IF EXISTS `content_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_group` (
  `ContentGroupID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `GroupType` int NOT NULL,
  `Description` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OwnerServiceID` int DEFAULT NULL,
  `Data` longtext,
  `Options` int DEFAULT NULL,
  PRIMARY KEY (`ContentGroupID`),
  KEY `IX_CONTENT_GROUP_2` (`HierStrucID`),
  KEY `IX_CONTENT_GROUP_3` (`OwnerServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_group_data`
--

DROP TABLE IF EXISTS `content_group_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_group_data` (
  `ContentGroupDataID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ContentGroupID` int NOT NULL,
  `ContentDataID` bigint NOT NULL,
  PRIMARY KEY (`ContentGroupDataID`),
  KEY `IX_CONTENT_GROUP_DATA_2` (`HierStrucID`),
  KEY `IX_CONTENT_GROUP_DATA_3` (`ContentGroupID`),
  KEY `IX_CONTENT_GROUP_DATA_4` (`ContentDataID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_type`
--

DROP TABLE IF EXISTS `content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_type` (
  `ContentTypeID` int NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ConfigurationType` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LoadType` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Comments` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Source` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NameID` bigint NOT NULL,
  PRIMARY KEY (`ContentTypeID`),
  KEY `IX_CONTENTTYPE_STRINGNUMBERS` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credit_driver_instance`
--

DROP TABLE IF EXISTS `credit_driver_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_driver_instance` (
  `CredDrvInstID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `CredDrvID` int NOT NULL,
  `ConfigInfo` longtext,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `ServiceID` int DEFAULT NULL,
  PRIMARY KEY (`CredDrvInstID`),
  UNIQUE KEY `AK_CREDIT_DRIVER_INSTANCE` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_CREDIT_DRIVER_INSTANCE_2` (`ServiceID`),
  KEY `IX_CREDIT_DRIVER_INSTANCE_3` (`CredDrvID`),
  KEY `IX_CREDIT_DRIVER_INSTANCE_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credit_parameter`
--

DROP TABLE IF EXISTS `credit_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_parameter` (
  `CredParamID` int NOT NULL,
  `HierStrucID` bigint DEFAULT NULL,
  `OptionBits` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SavedBatches` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `MerchantConfigID` int DEFAULT NULL,
  `WorkstationID` int DEFAULT NULL,
  PRIMARY KEY (`CredParamID`),
  UNIQUE KEY `AK_CREDIT_PARAMETER` (`HierStrucID`,`WorkstationID`),
  KEY `IX_CREDIT_PARAMETER_2` (`WorkstationID`),
  KEY `IX_CREDIT_PARAMETER_3` (`MerchantConfigID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `CurrencyID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `NameID` bigint NOT NULL,
  `SymbolID` bigint DEFAULT NULL,
  `ScaleFactor` smallint NOT NULL,
  `OptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `ObjectNumber` int NOT NULL,
  `InsignificantDigits` smallint DEFAULT NULL,
  `SmallestAvailableBill` smallint DEFAULT NULL,
  `AbbreviationID` bigint DEFAULT NULL,
  PRIMARY KEY (`CurrencyID`),
  UNIQUE KEY `AK_CURRENCY` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_CURRENCY` (`HierStrucID`),
  KEY `IX_CURRENCY_m1` (`NameID`),
  KEY `IX_CURRENCY_m2` (`SymbolID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_conversion`
--

DROP TABLE IF EXISTS `currency_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_conversion` (
  `CurrConvID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `CurrencyID` int DEFAULT NULL,
  `DestCurrencyID` int DEFAULT NULL,
  `Rate` decimal(14,7) NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `ObjectNumber` int NOT NULL,
  PRIMARY KEY (`CurrConvID`),
  UNIQUE KEY `AK_CURRENCY_CONVERSION` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_CURRENCY_CONVERSION` (`HierStrucID`,`CurrencyID`),
  KEY `IX_CURRENCY_CONVERSION_2` (`CurrencyID`),
  KEY `IX_CURRENCY_CONVERSION_3` (`DestCurrencyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_instance`
--

DROP TABLE IF EXISTS `currency_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_instance` (
  `CurrInstID` int NOT NULL,
  `CurrInstIndex` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `OptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000',
  `CurrencyID` int DEFAULT NULL,
  PRIMARY KEY (`CurrInstID`),
  UNIQUE KEY `AK_CURRENCY_INSTANCE` (`HierStrucID`,`CurrInstIndex`),
  KEY `IX_CURRENCY_INSTANCE_2` (`CurrencyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_parameter`
--

DROP TABLE IF EXISTS `currency_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_parameter` (
  `CurrParamID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CurrencyID` int NOT NULL,
  `AlternateCurrencyID` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CurrParamID`),
  UNIQUE KEY `AK_CURRENCY_PARAMETER` (`HierStrucID`),
  KEY `IX_CURRENCY_PARAMETER_2` (`CurrencyID`),
  KEY `IX_CURRENCY_PARAMETER_3` (`AlternateCurrencyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_report`
--

DROP TABLE IF EXISTS `custom_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_report` (
  `CustomReportID` int NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `Definition` longtext,
  `Style` longtext,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `HierStrucID` bigint DEFAULT NULL,
  `NameID` bigint DEFAULT NULL,
  `ContentDataID` bigint DEFAULT NULL,
  PRIMARY KEY (`CustomReportID`),
  KEY `IX_CUSTOM_REPORT_2` (`HierStrucID`),
  KEY `IX_CUSTOM_REPORT_3` (`NameID`),
  KEY `IX_CUSTOM_REPORT_4` (`ContentDataID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_dist_local_revs`
--

DROP TABLE IF EXISTS `data_dist_local_revs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_dist_local_revs` (
  `LocalRevisionID` bigint NOT NULL AUTO_INCREMENT,
  `TransactionalDataType` int NOT NULL,
  `LocalRevisionNumber` bigint DEFAULT NULL,
  PRIMARY KEY (`LocalRevisionID`),
  KEY `LocalRevisionID` (`LocalRevisionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_dist_revs`
--

DROP TABLE IF EXISTS `data_dist_revs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_dist_revs` (
  `RevisionNumber` bigint NOT NULL AUTO_INCREMENT,
  `TransactionalDataType` int DEFAULT NULL,
  `NotificationType` int DEFAULT NULL,
  `LogicalRecordID` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OriginatingServiceID` int DEFAULT NULL,
  PRIMARY KEY (`RevisionNumber`),
  KEY `RevisionNumber` (`RevisionNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `db_schema`
--

DROP TABLE IF EXISTS `db_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_schema` (
  `DbTableID` int NOT NULL,
  `TblName` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `KeyName` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Version` int NOT NULL,
  PRIMARY KEY (`DbTableID`),
  UNIQUE KEY `AK_DB_SCHEMA` (`TblName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deposit_info_detail`
--

DROP TABLE IF EXISTS `deposit_info_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposit_info_detail` (
  `DepositDtlID` bigint NOT NULL AUTO_INCREMENT,
  `CheckDetailID` bigint NOT NULL,
  `Address` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DepositID` bigint NOT NULL,
  `Status` tinyint unsigned DEFAULT NULL,
  `DepositDateTime` datetime(3) DEFAULT NULL,
  `DepositAmount` decimal(21,4) DEFAULT NULL,
  `Description` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DepositNotes` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FirstName` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LastName` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PaymentIdentifier` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PaymentType` tinyint unsigned DEFAULT NULL,
  `PhoneNumber` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `AltPhoneNumber` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `RefundAmount` decimal(21,4) DEFAULT NULL,
  `ReturnDateTime` datetime(3) DEFAULT NULL,
  `ReturnNotes` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`DepositDtlID`),
  KEY `DepositDtlID` (`DepositDtlID`),
  KEY `IX_DEPOSIT_INFO_DETAIL2` (`CheckDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `descriptors`
--

DROP TABLE IF EXISTS `descriptors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descriptors` (
  `DescriptorID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `DescType` int NOT NULL,
  `LineNumber` int DEFAULT NULL,
  `StringNumberID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `OptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000',
  PRIMARY KEY (`DescriptorID`),
  KEY `IX_DESCRIPTORS` (`HierStrucID`,`DescType`),
  KEY `IX_DESCRIPTORS_m1` (`StringNumberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dining_course`
--

DROP TABLE IF EXISTS `dining_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dining_course` (
  `DiningCourseID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `MinPrepTime` int DEFAULT NULL,
  `MaxPrepTime` int DEFAULT NULL,
  `CourseColor` int DEFAULT NULL,
  `CourseIcon` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `CourseImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `InitialCourseMinPrepTime` int DEFAULT '0',
  PRIMARY KEY (`DiningCourseID`),
  KEY `IX_DINING_COURSE2` (`HierStrucID`),
  KEY `IX_DINING_COURSE3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dining_course_alerts`
--

DROP TABLE IF EXISTS `dining_course_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dining_course_alerts` (
  `DiningCourseAlertID` bigint NOT NULL AUTO_INCREMENT,
  `RVCHierStrucId` bigint DEFAULT NULL,
  `CheckGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DiningTableId` int DEFAULT NULL,
  `AlertTime` datetime(3) DEFAULT NULL,
  `DiningCourseObjectNumber` int DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  `AlertType` int DEFAULT NULL,
  `RequestGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`DiningCourseAlertID`),
  KEY `DiningCourseAlertID` (`DiningCourseAlertID`),
  KEY `IX_DINING_COURSE_ALERTS2` (`RVCHierStrucId`),
  KEY `IX_DINING_COURSE_ALERTS3` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dining_table`
--

DROP TABLE IF EXISTS `dining_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dining_table` (
  `DiningTableID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `DiningTableClassNum` int DEFAULT NULL,
  PRIMARY KEY (`DiningTableID`),
  UNIQUE KEY `AK_DINING_TABLE` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_DINING_TABLE_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dining_table_class`
--

DROP TABLE IF EXISTS `dining_table_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dining_table_class` (
  `DiningTableClassID` int NOT NULL,
  `NameID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  `MinimumCovers` smallint NOT NULL DEFAULT '0',
  `MaximumCovers` smallint NOT NULL DEFAULT '9999',
  `DefaultImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DefaultColor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `DefaultFgndColor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DiningTableStatusDefSetNum` int DEFAULT NULL,
  PRIMARY KEY (`DiningTableClassID`),
  KEY `IX_DINING_TBL_CLASS2` (`HierStrucID`),
  KEY `IX_DINING_TBL_CLASS3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dining_table_states`
--

DROP TABLE IF EXISTS `dining_table_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dining_table_states` (
  `DiningTableStatesID` bigint NOT NULL AUTO_INCREMENT,
  `DiningTableID` int NOT NULL,
  `State` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Priority` tinyint unsigned NOT NULL,
  PRIMARY KEY (`DiningTableStatesID`),
  KEY `DiningTableStatesID` (`DiningTableStatesID`),
  KEY `IX_DINING_TABLE_STATES2` (`DiningTableID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dining_table_status`
--

DROP TABLE IF EXISTS `dining_table_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dining_table_status` (
  `DiningTableStatusID` int NOT NULL AUTO_INCREMENT,
  `DiningTableID` int NOT NULL,
  `StatusDefSetNumber` int DEFAULT NULL,
  `StatusDefIndex` int DEFAULT NULL,
  `LastUpdateTime` datetime(3) DEFAULT NULL,
  `LastUpdateWorkstationID` int DEFAULT NULL,
  `LastUpdateEmployeeID` bigint DEFAULT NULL,
  `MergedWithDiningTableID` int DEFAULT NULL,
  `MergedByWorkstationID` int DEFAULT NULL,
  `MergedByEmployeeID` bigint DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  `SectionID` bigint DEFAULT NULL,
  `EmployeeID` bigint DEFAULT NULL,
  `State` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Progress` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `IsDirty` bit(1) DEFAULT b'0',
  `IsUserSuggested` bit(1) DEFAULT b'0',
  `DiningCourse` smallint DEFAULT NULL,
  `EstimatedAvailableTime` smallint DEFAULT NULL,
  `NumSeats` smallint DEFAULT NULL,
  `EstimatedTurnTime` smallint DEFAULT NULL,
  `NextAvailable` bit(1) DEFAULT b'0',
  `KdsCourseAlertLevel` smallint DEFAULT '0',
  `KdsCoursePeakAlertLevel` smallint DEFAULT '0',
  `LastServiceTime` datetime(3) DEFAULT NULL,
  `CheckOpenTime` datetime(3) DEFAULT NULL,
  `GMSAltMaximumCovers` smallint DEFAULT NULL,
  `MergeParentTableCount` int NOT NULL DEFAULT '0',
  `CurrentCoverCnt` int DEFAULT NULL,
  PRIMARY KEY (`DiningTableStatusID`),
  UNIQUE KEY `AK_DINING_TBL_STATUS2` (`DiningTableID`),
  KEY `DiningTableStatusID` (`DiningTableStatusID`),
  KEY `IX_DINING_TBL_STATUS10` (`SectionID`),
  KEY `IX_DINING_TBL_STATUS3` (`LastUpdateWorkstationID`),
  KEY `IX_DINING_TBL_STATUS4` (`LastUpdateEmployeeID`),
  KEY `IX_DINING_TBL_STATUS5` (`MergedWithDiningTableID`),
  KEY `IX_DINING_TBL_STATUS6` (`MergedByWorkstationID`),
  KEY `IX_DINING_TBL_STATUS7` (`MergedByEmployeeID`),
  KEY `IX_DINING_TBL_STATUS8` (`HierStrucID`),
  KEY `IX_DINING_TBL_STATUS9` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_DINING_TABLE_STATUS_LastUpdateTime` BEFORE INSERT ON `dining_table_status` FOR EACH ROW BEGIN
IF new.LastUpdateTime IS NULL THEN
SET new.LastUpdateTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dining_table_status_def`
--

DROP TABLE IF EXISTS `dining_table_status_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dining_table_status_def` (
  `DiningTableStatusDefID` int NOT NULL,
  `DiningTableStatusDefSetID` int NOT NULL,
  `NameID` bigint NOT NULL,
  `StatusDefIndex` int DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectKey` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OverrideImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OverrideColor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `OverrideFgndColor` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`DiningTableStatusDefID`),
  KEY `IX_DINING_TBL_STATUS_DEF2` (`HierStrucID`),
  KEY `IX_DINING_TBL_STATUS_DEF3` (`NameID`),
  KEY `IX_DINING_TBL_STATUS_DEF4` (`DiningTableStatusDefSetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dining_table_status_def_set`
--

DROP TABLE IF EXISTS `dining_table_status_def_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dining_table_status_def_set` (
  `DiningTableStatusDefSetID` int NOT NULL,
  `NameID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `DefaultIndex` int DEFAULT NULL,
  `DisabledIndex` int DEFAULT NULL,
  PRIMARY KEY (`DiningTableStatusDefSetID`),
  KEY `IX_DINING_TBL_STATUS_DEFSET2` (`HierStrucID`),
  KEY `IX_DINING_TBL_STATUS_DEFSET3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `DscntID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(56) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PrintOptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '00000000',
  `Nlu` bigint DEFAULT NULL,
  `TransDfltMain` bit(1) NOT NULL,
  `MainMenuLvlIndex` int DEFAULT NULL,
  `TransDfltSub` bit(1) NOT NULL,
  `SubMenuLvlIndex` int DEFAULT NULL,
  `Percentage` decimal(7,6) DEFAULT NULL,
  `Amount` decimal(21,4) DEFAULT NULL,
  `PrivilegeGrp` int DEFAULT NULL,
  `IconNumber` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `DiscountPostingTime` datetime(3) DEFAULT NULL,
  `TempConfiguration` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `EffectivityID` bigint DEFAULT NULL,
  `RvcGroupID` int DEFAULT NULL,
  `ActivationType` smallint DEFAULT NULL,
  `Priority` smallint DEFAULT NULL,
  `RuleType` smallint DEFAULT NULL,
  `TriggerQuantity` int DEFAULT NULL,
  `TriggerTotal` decimal(21,4) DEFAULT NULL,
  `AwardType` smallint DEFAULT NULL,
  `AwardCount` int DEFAULT NULL,
  `AwardMaxCount` int DEFAULT NULL,
  `ItemExclusivityMask` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '11111111111111111111111111111111',
  `TransactionExclusivityMask` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '11111111111111111111111111111111',
  `Imported` bit(1) NOT NULL DEFAULT b'0',
  `Locked` bit(1) NOT NULL DEFAULT b'0',
  `Enabled` bit(1) NOT NULL DEFAULT b'1',
  `CreationDateTime` datetime(3) DEFAULT NULL,
  `DiscountComment` longtext,
  `TriggerObjectNumber` int DEFAULT NULL,
  `AwardObjectNumber` int DEFAULT NULL,
  `MaxCountPerCheck` smallint DEFAULT NULL,
  `TaxClassObjNum` int DEFAULT NULL,
  `SluIndex` int DEFAULT NULL,
  `HhtSluIndex` int DEFAULT NULL,
  `TriggerMenuItemGroupObjNum` int DEFAULT NULL,
  `TriggerMenuItemGroupObjNum2` int DEFAULT NULL,
  `TriggerMenuItemGroupObjNum3` int DEFAULT NULL,
  `TriggerMenuItemGroupObjNum4` int DEFAULT NULL,
  `AwardMenuItemGroupObjNum` int DEFAULT NULL,
  `AwardingAlgorithm` smallint NOT NULL DEFAULT '1',
  `RvcGroupMask` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '11111111111111111111111111111111',
  `AwardAllocation` int DEFAULT NULL,
  `ChangeSetObjNum` int DEFAULT NULL,
  `SluGroupNum` int DEFAULT NULL,
  `RptGrpObjNum` int DEFAULT NULL,
  `TrggrCndmntMenuItmGrpObjNum` int DEFAULT NULL,
  `MinAmount` decimal(21,4) DEFAULT '0.0000',
  `PrintClassObjNum` int DEFAULT NULL,
  `ConstrainType` smallint DEFAULT NULL,
  `OrderTypeIndexes` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000000000000000000000000000',
  PRIMARY KEY (`DscntID`),
  UNIQUE KEY `AK_DISCOUNT` (`HierStrucID`,`ObjectNumber`,`ChangeSetObjNum`),
  KEY `IX_DISCOUNT_1` (`DiscountPostingTime`),
  KEY `IX_DISCOUNT_2` (`RvcGroupID`),
  KEY `IX_DISCOUNT_3` (`EffectivityID`),
  KEY `IX_DISCOUNT_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_DISCOUNT_DiscountPostingTime` BEFORE INSERT ON `discount` FOR EACH ROW BEGIN
IF new.DiscountPostingTime IS NULL THEN
SET new.DiscountPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_DISCOUNT_CreationDateTime` BEFORE INSERT ON `discount` FOR EACH ROW BEGIN
IF new.CreationDateTime IS NULL THEN
SET new.CreationDateTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `discount_alloc_detail`
--

DROP TABLE IF EXISTS `discount_alloc_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_alloc_detail` (
  `DscntAllocDtlID` bigint NOT NULL AUTO_INCREMENT,
  `CheckDetailID` bigint NOT NULL,
  `DscntDetailLink` int NOT NULL,
  `ItemDetailLink` int NOT NULL,
  `SubItem` smallint DEFAULT NULL,
  `IncludesMITax` bit(1) NOT NULL,
  `Amount` decimal(21,4) DEFAULT NULL,
  `InclusiveTax` decimal(21,4) DEFAULT NULL,
  KEY `DscntAllocDtlID` (`DscntAllocDtlID`),
  KEY `IX_DISCOUNT_ALLOC_DETAIL` (`CheckDetailID`)
) ENGINE=InnoDB AUTO_INCREMENT=16819 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_award_group`
--

DROP TABLE IF EXISTS `discount_award_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_award_group` (
  `DscntAwardGrpID` int NOT NULL,
  `DscntID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `MIGroupObjNum` int DEFAULT NULL,
  `AwardType` smallint DEFAULT NULL,
  `Percentage` decimal(7,6) DEFAULT NULL,
  `Amount` decimal(21,4) DEFAULT NULL,
  `Count` int DEFAULT NULL,
  `MaxCount` int DEFAULT NULL,
  `OrderNum` smallint NOT NULL,
  PRIMARY KEY (`DscntAwardGrpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_detail`
--

DROP TABLE IF EXISTS `discount_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_detail` (
  `DscntDtlID` bigint NOT NULL AUTO_INCREMENT,
  `CheckDetailID` bigint NOT NULL,
  `DscntID` int NOT NULL,
  `OptionBits` varchar(56) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `EmployeeID` bigint DEFAULT NULL,
  `Percentage` decimal(7,6) DEFAULT NULL,
  `PrintOptionBits` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PrivilegeLevel` int DEFAULT NULL,
  `TempAllocation` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TillDetailID` int DEFAULT NULL,
  `InclusiveTax` decimal(21,4) DEFAULT NULL,
  `TaxRates` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TillSessionID` int DEFAULT NULL,
  `CouponTotal` decimal(21,4) DEFAULT NULL,
  PRIMARY KEY (`DscntDtlID`),
  UNIQUE KEY `AK_DISCOUNT_DETAIL` (`CheckDetailID`),
  KEY `DscntDtlID` (`DscntDtlID`),
  KEY `IX_DISCOUNT_DETAIL_2` (`TillDetailID`)
) ENGINE=InnoDB AUTO_INCREMENT=16791 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_itemizer`
--

DROP TABLE IF EXISTS `discount_itemizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_itemizer` (
  `DscntItmzrID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `DscntItmzrIndex` smallint NOT NULL,
  `NameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`DscntItmzrID`),
  KEY `IX_DISCOUNT_ITEMIZER` (`HierStrucID`),
  KEY `IX_DISCOUNT_ITEMIZER_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_itemizer_discount`
--

DROP TABLE IF EXISTS `discount_itemizer_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_itemizer_discount` (
  `DscntItmzrDscntID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `DscntID` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `DscntItmzrIndex` smallint DEFAULT NULL,
  PRIMARY KEY (`DscntItmzrDscntID`),
  KEY `IX_DISCOUNT_ITEMIZER_DISCOUNT` (`HierStrucID`,`DscntID`),
  KEY `IX_DISCOUNT_ITEMIZR_DSCNT_2` (`DscntID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_main_menu_level`
--

DROP TABLE IF EXISTS `discount_main_menu_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_main_menu_level` (
  `DscntMainMenuLvlID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `DscntID` int NOT NULL,
  `MenuLvlIndex` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`DscntMainMenuLvlID`),
  KEY `IX_DISCOUNT_MAIN_MENU_LEVEL` (`HierStrucID`,`DscntID`),
  KEY `IX_DISCOUNT_MAIN_MENU_LEVEL_2` (`DscntID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_sub_menu_level`
--

DROP TABLE IF EXISTS `discount_sub_menu_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_sub_menu_level` (
  `DscntSubMenuLvlID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `DscntID` int NOT NULL,
  `MenuLvlIndex` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`DscntSubMenuLvlID`),
  KEY `IX_DISCOUNT_SUB_MENU_LEVEL` (`HierStrucID`,`DscntID`),
  KEY `IX_DISCOUNT_SUB_MENU_LEVEL_2` (`DscntID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_trigger_group`
--

DROP TABLE IF EXISTS `discount_trigger_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_trigger_group` (
  `DscntTrgGrpID` int NOT NULL,
  `DscntID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `MIGroupObjNum` int DEFAULT NULL,
  `CndmntMIGroupObjNum` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Total` decimal(21,4) DEFAULT NULL,
  `OrderNum` smallint NOT NULL,
  PRIMARY KEY (`DscntTrgGrpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `distribution_group`
--

DROP TABLE IF EXISTS `distribution_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distribution_group` (
  `DistributionGroupID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '10000000',
  PRIMARY KEY (`DistributionGroupID`),
  KEY `IX_DISTRIBUTION_GROUP2` (`HierStrucID`),
  KEY `IX_DISTRIBUTION_GROUP3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dscnt_itmzr_dscnt_dtl`
--

DROP TABLE IF EXISTS `dscnt_itmzr_dscnt_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dscnt_itmzr_dscnt_dtl` (
  `DscntItmzrDscntDtlID` bigint NOT NULL AUTO_INCREMENT,
  `DscntDtlID` bigint NOT NULL,
  `DscntItmzrID` int NOT NULL,
  KEY `DscntItmzrDscntDtlID` (`DscntItmzrDscntDtlID`),
  KEY `IX_DSCNT_ITMZR_DSCNT_DTL` (`DscntDtlID`),
  KEY `IX_DSCNT_ITMZR_DSCNT_DTL_2` (`DscntItmzrID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dto_order_method_setting`
--

DROP TABLE IF EXISTS `dto_order_method_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dto_order_method_setting` (
  `OrderMethodSettingID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `DTOParamID` int DEFAULT NULL,
  `OrderMethod` int NOT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `FutureOrderMinDays` smallint NOT NULL DEFAULT '0',
  `FutureOrderMaxDays` smallint NOT NULL DEFAULT '14',
  `OrderConfirmationType` int NOT NULL,
  `UnpickedOrderAlertTime` tinyint unsigned NOT NULL,
  `DeviceIndex` smallint DEFAULT NULL,
  `UnassignedAlertTime` tinyint unsigned NOT NULL DEFAULT '0',
  `DefaultDeliveryQuoteTime` smallint NOT NULL DEFAULT '0',
  `ServiceChargeObjNum` int DEFAULT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `ConfirmOrderTenderObjNum` int DEFAULT NULL,
  PRIMARY KEY (`OrderMethodSettingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dto_parameter`
--

DROP TABLE IF EXISTS `dto_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dto_parameter` (
  `DTOParamID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `OptionBits` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `DeliveryOrdTypeIndex` int DEFAULT NULL,
  `TakeoutOrdTypeIndex` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `CurbsideOrdTypeIndex` int DEFAULT NULL,
  PRIMARY KEY (`DTOParamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dto_quoting_rule`
--

DROP TABLE IF EXISTS `dto_quoting_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dto_quoting_rule` (
  `QuotingRuleID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `PeriodID` int NOT NULL,
  `ChangeSetObjNum` int DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `QuoteTime` int NOT NULL,
  PRIMARY KEY (`QuotingRuleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `effectivity`
--

DROP TABLE IF EXISTS `effectivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `effectivity` (
  `EffectivityID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `StartDateTime` datetime(3) DEFAULT NULL,
  `EndDateTime` datetime(3) DEFAULT NULL,
  `ActiveStartTime` int DEFAULT NULL,
  `ActiveEndTime` int DEFAULT NULL,
  `RecurrenceDayOfWeek` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1111111',
  `EffectivityComment` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`EffectivityID`),
  KEY `IX_EFFECTIVITY_2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `LastNameID` bigint DEFAULT NULL,
  `FirstNameID` bigint DEFAULT NULL,
  `IdNumber` bigint DEFAULT NULL,
  `CheckNameID` bigint DEFAULT NULL,
  `EmplGroup` int DEFAULT NULL,
  `EmpLevel` int DEFAULT NULL,
  `PcFuncID` bigint DEFAULT NULL,
  `Username` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PasswordChanged` datetime(3) DEFAULT NULL,
  `LangID` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `EmployeePostingTime` datetime(3) DEFAULT NULL,
  `Locked` bit(1) DEFAULT b'0',
  `NumFailedLogins` int DEFAULT NULL,
  `EMCPreferences` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LocaleInfoID` int DEFAULT NULL,
  `PIN` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OldPIN` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NewPIN` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PayrollID` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NewIdNumber` bigint DEFAULT NULL,
  `OldIdNumber` bigint DEFAULT NULL,
  `FirstName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LastName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CheckName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FingerPrintTemplate1` longblob,
  `FingerPrintTemplate2` longblob,
  `FingerPrintTemplate3` longblob,
  `TerminationDate` datetime(3) DEFAULT NULL,
  `EmployeeOptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `FingerPrintNewTemplate1` longblob,
  `FingerPrintNewTemplate2` longblob,
  `FingerPrintNewTemplate3` longblob,
  `EmailAddress` longblob,
  `EncryptionKeyID` bigint DEFAULT NULL,
  `EngageLangId` int DEFAULT NULL,
  `AvailableForDelivery` bit(1) NOT NULL DEFAULT b'0',
  `OPUserID` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LastUpdateDateTime` datetime(3) DEFAULT NULL,
  `empLevelUpdateDateTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `AK_EMPLOYEE` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_EMPLOYEE_1` (`EmployeePostingTime`),
  KEY `IX_EMPLOYEE_2` (`Username`,`IsDeleted`,`EmployeeID`,`ObjectNumber`),
  KEY `IX_EMPLOYEE_3` (`IdNumber`,`EmployeeID`,`ObjectNumber`),
  KEY `IX_EMPLOYEE_4` (`LocaleInfoID`),
  KEY `IX_EMPLOYEE_5` (`LangID`),
  KEY `IX_EMPLOYEE_m1` (`ObjectNumber`,`HierStrucID`),
  KEY `IX_EMPLOYEE_NAMES1` (`FirstName`,`LastName`,`CheckName`),
  KEY `XFK_E_ENGAGELANGID` (`EngageLangId`),
  KEY `IX_EMPLOYEE_OP` (`OPUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_EMPLOYEE_EmployeePostingTime` BEFORE INSERT ON `employee` FOR EACH ROW BEGIN
IF new.EmployeePostingTime IS NULL THEN
SET new.EmployeePostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee_class`
--

DROP TABLE IF EXISTS `employee_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_class` (
  `EmpClassID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `TransactionOptionBits` varchar(160) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IslOptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SupervisorOptionBits` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TimeclockOptionBits` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `RmcAccLvlID` int DEFAULT NULL,
  `RwAccLvlID` int DEFAULT NULL,
  `DayMinutesOvertime` int DEFAULT NULL,
  `PeriodMinutesOvertime` int DEFAULT NULL,
  `PickupTransferStyle` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `LastPostingTime` datetime(3) DEFAULT NULL,
  `CMAccountingMethodID` int DEFAULT NULL,
  `ServerBankingTemplateObjNum` int DEFAULT NULL,
  PRIMARY KEY (`EmpClassID`),
  UNIQUE KEY `AK_EMPLOYEE_CLASS` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_EMPLOYEE_CLASS_1000` (`LastPostingTime`),
  KEY `IX_EMPLOYEE_CLASS_2` (`RmcAccLvlID`),
  KEY `IX_EMPLOYEE_CLASS_3` (`RwAccLvlID`),
  KEY `IX_EMPLOYEE_CLASS_M1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_EMPLOYEE_CLASS_LastPostingTime` BEFORE INSERT ON `employee_class` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee_class_operator`
--

DROP TABLE IF EXISTS `employee_class_operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_class_operator` (
  `EmployeeClassOperatorID` int NOT NULL,
  `EmpClassID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `OptionBits` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`EmployeeClassOperatorID`),
  UNIQUE KEY `AK_EMPLOYEE_CLASS_OPERATOR` (`EmpClassID`,`HierStrucID`),
  KEY `IX_EMPLOYEE_CLASS_OPERATOR_2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_class_touchscreen`
--

DROP TABLE IF EXISTS `employee_class_touchscreen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_class_touchscreen` (
  `EmpClassTouchscrnID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `EmpClassID` int NOT NULL,
  `DeviceType` int NOT NULL,
  `DfltTouchscreen` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`EmpClassTouchscrnID`),
  KEY `IX_EMPLOYEE_CLASS_TOUCHSCREEN` (`HierStrucID`,`EmpClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_instance`
--

DROP TABLE IF EXISTS `employee_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_instance` (
  `EmployeeInstanceID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `EmployeeID` bigint NOT NULL,
  `EmpClassID` int DEFAULT NULL,
  `RevCtrID` int DEFAULT NULL,
  `OptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Training` bit(1) NOT NULL,
  `LdsID` int DEFAULT NULL,
  `PayrollID` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LateGrace` int DEFAULT NULL,
  `Status` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IsVisible` bit(1) NOT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `BankDeclared` bit(1) DEFAULT NULL,
  `MyLaborPrivilegeBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000',
  `WsID` int DEFAULT NULL,
  `ShiftNumber` int DEFAULT NULL,
  `AuthorizeClockInsPriv` int DEFAULT NULL,
  `PerformClockInPriv` int DEFAULT NULL,
  PRIMARY KEY (`EmployeeInstanceID`),
  UNIQUE KEY `AK_EMPLOYEE_INSTANCE` (`EmployeeID`,`HierStrucID`),
  KEY `IX_EMPLOYEE_INSTANCE_2` (`EmpClassID`),
  KEY `IX_EMPLOYEE_INSTANCE_2001` (`HierStrucID`,`EmployeeID`),
  KEY `IX_EMPLOYEE_INSTANCE_3` (`HierStrucID`,`Status`),
  KEY `IX_EMPLOYEE_INSTANCE_4` (`RevCtrID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enabled_by_order_channel`
--

DROP TABLE IF EXISTS `enabled_by_order_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enabled_by_order_channel` (
  `EnabledByOrderChannelId` int NOT NULL,
  `DbTableId` int NOT NULL,
  `DefId` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  PRIMARY KEY (`EnabledByOrderChannelId`),
  KEY `IX_ENABLE_ORD_CHAN_HSID` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_schedule`
--

DROP TABLE IF EXISTS `event_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_schedule` (
  `ScheduleID` int NOT NULL,
  `Guid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  `ServiceID` int DEFAULT NULL,
  `ServiceType` smallint NOT NULL,
  `EventName` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `EventData` longtext,
  `ChainScheduleFromScheduleID` int DEFAULT NULL,
  `event_duration_seconds` int DEFAULT NULL,
  `freq_type` int NOT NULL,
  `freq_interval` int NOT NULL,
  `freq_subday_type` int DEFAULT NULL,
  `freq_subday_interval` int DEFAULT NULL,
  `freq_relative_interval` int DEFAULT NULL,
  `freq_recurrence_factor` int DEFAULT NULL,
  `active_start_date` int DEFAULT NULL,
  `active_end_date` int DEFAULT NULL,
  `active_start_time` int DEFAULT NULL,
  `active_end_time` int DEFAULT NULL,
  `next_run_date` int DEFAULT NULL,
  `next_run_time` int DEFAULT NULL,
  `Enabled` int NOT NULL DEFAULT '1',
  `TZIndex` int DEFAULT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint DEFAULT NULL,
  PRIMARY KEY (`ScheduleID`),
  UNIQUE KEY `AK_EVENT_SCHEDULE` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_EVENT_SCHEDULE_2` (`HierStrucID`),
  KEY `IX_EVENT_SCHEDULE_3` (`ServiceID`),
  KEY `IX_EVENT_SCHEDULE_4` (`ChainScheduleFromScheduleID`),
  KEY `IX_EVENT_SCHEDULE_5` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_schedule_instance`
--

DROP TABLE IF EXISTS `event_schedule_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_schedule_instance` (
  `ScheduleInstanceID` int NOT NULL AUTO_INCREMENT,
  `Guid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  `ScheduleID` int NOT NULL,
  `ServiceID` int DEFAULT NULL,
  `ServiceType` smallint NOT NULL,
  `EventName` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `EventData` longtext,
  `RunStatus` int NOT NULL,
  `StartDateTime` datetime(3) NOT NULL,
  `EndDateTime` datetime(3) NOT NULL,
  PRIMARY KEY (`ScheduleInstanceID`),
  KEY `ScheduleInstanceID` (`ScheduleInstanceID`),
  KEY `IX_EVENT_SCHEDULE_INSTANCE_2` (`ServiceID`),
  KEY `IX_EVENT_SCHEDULE_INSTANCE_3` (`StartDateTime`),
  KEY `IX_EVENT_SCHEDULE_INSTANCE_4` (`EndDateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_application`
--

DROP TABLE IF EXISTS `extension_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_application` (
  `ExtensionApplicationID` bigint NOT NULL,
  `HierStrucID` bigint DEFAULT NULL,
  `Name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DescriptionID` bigint DEFAULT NULL,
  `ExtensionApplicationType` int NOT NULL,
  `InterfaceID` int DEFAULT NULL,
  `OptionBits` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `DataLevel` int NOT NULL DEFAULT '2',
  `MaxChars` int NOT NULL DEFAULT '200',
  `MaxItems` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`ExtensionApplicationID`),
  KEY `IX_EXTNSN_APP_INTERFACE` (`InterfaceID`),
  KEY `IX_EXTNSN_APP_STRNG_NUMBERS` (`DescriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_application_content`
--

DROP TABLE IF EXISTS `extension_application_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_application_content` (
  `ExtensionApplicationContentID` bigint NOT NULL,
  `HierStrucID` bigint DEFAULT NULL,
  `OptionBits` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `ContentDataID` bigint DEFAULT NULL,
  `ExtensionApplicationID` bigint NOT NULL,
  `DescriptionID` bigint DEFAULT NULL,
  `ZoneableKey` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'DEFAULT',
  `MinimumCompatibility` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MaximumCompatibility` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `HostType` smallint DEFAULT NULL,
  PRIMARY KEY (`ExtensionApplicationContentID`),
  KEY `IX_EXTNSN_AP_DTA_EXTNSN_APLCTN` (`ExtensionApplicationID`),
  KEY `IX_EXTNSN_AP_DTA_STRNG_NMBERS` (`DescriptionID`),
  KEY `IX_EXTNSN_APLCTN_DTA_CONTNTDTA` (`ContentDataID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_data_property`
--

DROP TABLE IF EXISTS `extension_data_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_data_property` (
  `ExtensionDataPropertyID` bigint NOT NULL,
  `Name` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `DbTableID` int NOT NULL,
  `ValueType` int DEFAULT NULL,
  `ValueLimits` longtext,
  `SortPriority` int DEFAULT NULL,
  `DisplayWidth` int DEFAULT NULL,
  `DisplayNameID` bigint DEFAULT NULL,
  `IsEditable` bit(1) NOT NULL DEFAULT b'1',
  `IsViewable` bit(1) NOT NULL DEFAULT b'1',
  `CommentID` bigint DEFAULT NULL,
  `IsDownloadable` bit(1) NOT NULL DEFAULT b'1',
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `APPLICATIONTYPE` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ExtensionDataPropertyID`),
  UNIQUE KEY `AX_EXTENSION_DATA_PROPERTY` (`DbTableID`,`Name`(255),`HierStrucID`),
  KEY `IX_EXTENSION_DATA_PROPERTY_2` (`CommentID`),
  KEY `IX_EXTENSION_DATA_PROPERTY_3` (`DisplayNameID`),
  KEY `IX_EXTENSION_DATA_PROPERTY_4` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extension_data_value`
--

DROP TABLE IF EXISTS `extension_data_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_data_value` (
  `ExtensionDataValueID` bigint NOT NULL,
  `DataElementID` bigint NOT NULL,
  `XMLProperties` longtext,
  `ExtensionDataPropertyID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `LANGID` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`ExtensionDataValueID`),
  UNIQUE KEY `AK_EXTENSION_DATA_VALUE` (`ExtensionDataPropertyID`,`DataElementID`,`LANGID`),
  KEY `IX_EXTENSION_DATA_VALUE_2001` (`DataElementID`,`ExtensionDataValueID`,`ExtensionDataPropertyID`,`XMLProperties`(255)),
  KEY `IX_EXTNSN_DTA_VALUE` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family_group`
--

DROP TABLE IF EXISTS `family_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family_group` (
  `FamGrpID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `MajGrpID` int DEFAULT NULL,
  `ReportGroup` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `FamilyGroupPostingTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`FamGrpID`),
  UNIQUE KEY `AK_FAMILY_GROUP` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_FAMILY_GROUP_1` (`FamilyGroupPostingTime`),
  KEY `IX_FAMILY_GROUP_2` (`MajGrpID`),
  KEY `IX_FAMILY_GROUP_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_FAMILY_GROUP_FamilyGroupPostingTime` BEFORE INSERT ON `family_group` FOR EACH ROW BEGIN
IF new.FamilyGroupPostingTime IS NULL THEN
SET new.FamilyGroupPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fcr_customer_data`
--

DROP TABLE IF EXISTS `fcr_customer_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fcr_customer_data` (
  `CustomerID` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CustomerType` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CustInfo1` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CustInfo2` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CustInfo3` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CustInfo4` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CustInfo5` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CustInfo6` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CustInfo7` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CustInfo8` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PropertyID` int NOT NULL,
  `CustInfo9` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CustInfo10` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CustInfo11` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CustInfo12` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PurgeStatus` tinyint unsigned NOT NULL DEFAULT '0',
  `HierStrucID` bigint DEFAULT NULL,
  `Guid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ReplicationDest` tinyint unsigned NOT NULL DEFAULT '0',
  `ReplicationStatus` tinyint unsigned NOT NULL DEFAULT '0',
  `ReplicationError` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CPPurgeDate` datetime(3) DEFAULT NULL,
  `RepPurgeDate` datetime(3) DEFAULT NULL,
  `UpdateTime` datetime(3) DEFAULT NULL,
  `CustInfo13` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CustInfo14` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRCustomerDataID` bigint NOT NULL AUTO_INCREMENT,
  `FCRJSONEXP` longtext,
  PRIMARY KEY (`FCRCustomerDataID`),
  KEY `FCRCustomerDataID` (`FCRCustomerDataID`),
  KEY `IX_FCR_CUSTOMER_DATA_3` (`CustomerID`),
  KEY `IX_FCR_CUSTOMER_DATA_4` (`PropertyID`),
  KEY `IX_FCR_CUSTOMER_DATA_5` (`CustomerType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_FCR_CUSTOMER_DATA_Guid` BEFORE INSERT ON `fcr_customer_data` FOR EACH ROW BEGIN
IF new.Guid IS NULL THEN
SET new.Guid = uuid();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_FCR_CUSTOMER_DATA_UpdateTime` BEFORE INSERT ON `fcr_customer_data` FOR EACH ROW BEGIN
IF new.UpdateTime IS NULL THEN
SET new.UpdateTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fcr_invoice_control`
--

DROP TABLE IF EXISTS `fcr_invoice_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fcr_invoice_control` (
  `PCWSID` int DEFAULT NULL,
  `InvoiceType` tinyint unsigned DEFAULT NULL,
  `Series` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `StartInvNum` bigint DEFAULT NULL,
  `EndInvNum` bigint DEFAULT NULL,
  `Status` tinyint unsigned DEFAULT NULL,
  `CurrInvNum` bigint DEFAULT NULL,
  `LockedBy` smallint DEFAULT NULL,
  `ResolutionDate` datetime(3) DEFAULT NULL,
  `ExtraField1` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField2` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField3` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField4` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PropertyID` int NOT NULL,
  `ExtraField5` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField6` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField7` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField8` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PurgeStatus` tinyint unsigned NOT NULL DEFAULT '0',
  `HierStrucID` bigint DEFAULT NULL,
  `RevenueCenterID` int DEFAULT NULL,
  `Guid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ReplicationDest` tinyint unsigned NOT NULL DEFAULT '0',
  `ReplicationStatus` tinyint unsigned NOT NULL DEFAULT '0',
  `ReplicationError` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CPPurgeDate` datetime(3) DEFAULT NULL,
  `RepPurgeDate` datetime(3) DEFAULT NULL,
  `UpdateTime` datetime(3) DEFAULT NULL,
  `ExtraField9` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField10` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField11` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField12` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `microsBsnzDate` datetime(3) DEFAULT NULL,
  `CtrlID` bigint NOT NULL DEFAULT '0',
  `FCRInvoiceControlID` bigint NOT NULL AUTO_INCREMENT,
  `FCRJSONEXP` longtext,
  PRIMARY KEY (`FCRInvoiceControlID`),
  KEY `FCRInvoiceControlID` (`FCRInvoiceControlID`),
  KEY `IX_FCR_INVOICE_CONTROL_3` (`PropertyID`),
  KEY `IX_FCR_INVOICE_CONTROL_4` (`CtrlID`),
  KEY `IX_FCR_INVOICE_CONTROL_5` (`ResolutionDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_FCR_INVOICE_CONTROL_Guid` BEFORE INSERT ON `fcr_invoice_control` FOR EACH ROW BEGIN
IF new.Guid IS NULL THEN
SET new.Guid = uuid();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_FCR_INVOICE_CONTROL_UpdateTime` BEFORE INSERT ON `fcr_invoice_control` FOR EACH ROW BEGIN
IF new.UpdateTime IS NULL THEN
SET new.UpdateTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fcr_invoice_data`
--

DROP TABLE IF EXISTS `fcr_invoice_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fcr_invoice_data` (
  `PCWSID` int DEFAULT NULL,
  `FCRInvNumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MicrosChkNum` bigint DEFAULT NULL,
  `InvoiceType` tinyint unsigned DEFAULT NULL,
  `InSARMode` tinyint unsigned NOT NULL,
  `CustomerID` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `InvoiceStatus` tinyint unsigned DEFAULT NULL,
  `MicrosBsnzDate` datetime(3) DEFAULT NULL,
  `FCRBsnzDate` datetime(3) DEFAULT NULL,
  `Subtotal1` decimal(23,6) DEFAULT NULL,
  `Subtotal2` decimal(23,6) DEFAULT NULL,
  `Subtotal3` decimal(23,6) DEFAULT NULL,
  `Subtotal4` decimal(23,6) DEFAULT NULL,
  `Subtotal5` decimal(23,6) DEFAULT NULL,
  `Subtotal6` decimal(23,6) DEFAULT NULL,
  `Subtotal7` decimal(23,6) DEFAULT NULL,
  `Subtotal8` decimal(23,6) DEFAULT NULL,
  `Subtotal9` decimal(23,6) DEFAULT NULL,
  `Subtotal10` decimal(23,6) DEFAULT NULL,
  `Subtotal11` decimal(23,6) DEFAULT NULL,
  `Subtotal12` decimal(23,6) DEFAULT NULL,
  `TaxTtl1` decimal(23,6) DEFAULT NULL,
  `TaxTtl2` decimal(23,6) DEFAULT NULL,
  `TaxTtl3` decimal(23,6) DEFAULT NULL,
  `TaxTtl4` decimal(23,6) DEFAULT NULL,
  `TaxTtl5` decimal(23,6) DEFAULT NULL,
  `TaxTtl6` decimal(23,6) DEFAULT NULL,
  `TaxTtl7` decimal(23,6) DEFAULT NULL,
  `TaxTtl8` decimal(23,6) DEFAULT NULL,
  `ExtraField1` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField2` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField3` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField4` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField5` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField6` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField7` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField8` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PropertyID` int NOT NULL,
  `FCRID` int DEFAULT NULL,
  `StoreID` int DEFAULT NULL,
  `SerialID` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DocumentType` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DataType` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SysDocID` decimal(20,4) DEFAULT NULL,
  `FiscalRef` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Subtotal13` decimal(23,6) DEFAULT NULL,
  `Subtotal14` decimal(23,6) DEFAULT NULL,
  `ExtraField9` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField10` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField11` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField12` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField13` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField14` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField15` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraField16` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExtraDate1` datetime(3) DEFAULT NULL,
  `ExtraDate2` datetime(3) DEFAULT NULL,
  `ExtraDate3` datetime(3) DEFAULT NULL,
  `ExtraDate4` datetime(3) DEFAULT NULL,
  `ExtraDate5` datetime(3) DEFAULT NULL,
  `PurgeStatus` tinyint unsigned NOT NULL DEFAULT '0',
  `HierStrucID` bigint DEFAULT NULL,
  `RevenueCenterID` int DEFAULT NULL,
  `Guid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ReplicationDest` tinyint unsigned NOT NULL DEFAULT '0',
  `ReplicationStatus` tinyint unsigned NOT NULL DEFAULT '0',
  `ReplicationError` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CPPurgeDate` datetime(3) DEFAULT NULL,
  `RepPurgeDate` datetime(3) DEFAULT NULL,
  `UpdateTime` datetime(3) DEFAULT NULL,
  `TaxTtl9` decimal(23,6) DEFAULT NULL,
  `TaxTtl10` decimal(23,6) DEFAULT NULL,
  `TaxTtl11` decimal(23,6) DEFAULT NULL,
  `TaxTtl12` decimal(23,6) DEFAULT NULL,
  `TaxTtl13` decimal(23,6) DEFAULT NULL,
  `TaxTtl14` decimal(23,6) DEFAULT NULL,
  `TaxTtl15` decimal(23,6) DEFAULT NULL,
  `TaxTtl16` decimal(23,6) DEFAULT NULL,
  `CheckGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRInvoiceDataID` bigint NOT NULL AUTO_INCREMENT,
  `FCRJSONEXP` longtext,
  PRIMARY KEY (`FCRInvoiceDataID`),
  KEY `FCRInvoiceDataID` (`FCRInvoiceDataID`),
  KEY `IX_FCR_INVOICE_DATA_3` (`PropertyID`),
  KEY `IX_FCR_INVOICE_DATA_4` (`MicrosBsnzDate`),
  KEY `IX_FCR_INVOICE_DATA_5` (`FCRBsnzDate`),
  KEY `IX_FCR_INVOICE_DATA_6` (`PCWSID`),
  KEY `IX_FCR_INVOICE_DATA_7` (`FCRInvNumber`),
  KEY `IX_FCR_INVOICE_DATA_8` (`MicrosChkNum`),
  KEY `IX_FCR_INVOICE_DATA_9` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_FCR_INVOICE_DATA_Guid` BEFORE INSERT ON `fcr_invoice_data` FOR EACH ROW BEGIN
IF new.Guid IS NULL THEN
SET new.Guid = uuid();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_FCR_INVOICE_DATA_UpdateTime` BEFORE INSERT ON `fcr_invoice_data` FOR EACH ROW BEGIN
IF new.UpdateTime IS NULL THEN
SET new.UpdateTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fcr_ttl_data`
--

DROP TABLE IF EXISTS `fcr_ttl_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fcr_ttl_data` (
  `FCRBsnzDate` datetime(3) DEFAULT NULL,
  `FCRID1` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRID2` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MicrosBsnzDate` datetime(3) DEFAULT NULL,
  `FCRInfo1` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRInfo2` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRInfo3` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRInfo4` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRInfo5` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRInfo6` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRInfo7` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRInfo8` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRInfo9` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRInfo10` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRInfo11` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRInfo12` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PropertyID` int NOT NULL,
  `FCRInfo13` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRInfo14` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRInfo15` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FCRInfo16` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PurgeStatus` tinyint unsigned NOT NULL DEFAULT '0',
  `PCWSID` int DEFAULT NULL,
  `HierStrucID` bigint DEFAULT NULL,
  `RevenueCenterID` int DEFAULT NULL,
  `Guid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ReplicationDest` tinyint unsigned NOT NULL DEFAULT '0',
  `ReplicationStatus` tinyint unsigned NOT NULL DEFAULT '0',
  `ReplicationError` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CPPurgeDate` datetime(3) DEFAULT NULL,
  `RepPurgeDate` datetime(3) DEFAULT NULL,
  `UpdateTime` datetime(3) DEFAULT NULL,
  `FCRTotalDataID` bigint NOT NULL AUTO_INCREMENT,
  `FCRJSONEXP` longtext,
  PRIMARY KEY (`FCRTotalDataID`),
  KEY `FCRTotalDataID` (`FCRTotalDataID`),
  KEY `IX_FCR_TTL_DATA_3` (`PropertyID`),
  KEY `IX_FCR_TTL_DATA_4` (`MicrosBsnzDate`),
  KEY `IX_FCR_TTL_DATA_5` (`FCRBsnzDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_FCR_TTL_DATA_Guid` BEFORE INSERT ON `fcr_ttl_data` FOR EACH ROW BEGIN
IF new.Guid IS NULL THEN
SET new.Guid = uuid();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_FCR_TTL_DATA_UpdateTime` BEFORE INSERT ON `fcr_ttl_data` FOR EACH ROW BEGIN
IF new.UpdateTime IS NULL THEN
SET new.UpdateTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `financial_calendar`
--

DROP TABLE IF EXISTS `financial_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_calendar` (
  `FinCalendarID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `EntryType` int NOT NULL,
  `EntryValue` int NOT NULL,
  `AseqID` int DEFAULT NULL,
  `PcAseqID` int DEFAULT NULL,
  `aseq_sched_id` int DEFAULT NULL,
  PRIMARY KEY (`FinCalendarID`),
  KEY `IX_FINANCIAL_CALENDAR_2` (`aseq_sched_id`),
  KEY `IX_FINANCIAL_CALENDAR_3` (`AseqID`),
  KEY `IX_FINANCIAL_CALENDAR_4` (`PcAseqID`),
  KEY `IX_FINANCIAL_CALENDAR_m1` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `financial_calendar_hist`
--

DROP TABLE IF EXISTS `financial_calendar_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_calendar_hist` (
  `FinCalendarHistID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `EndDate` datetime(3) NOT NULL,
  `EntryType` int NOT NULL,
  `EntryValue` int NOT NULL,
  PRIMARY KEY (`FinCalendarHistID`),
  KEY `IX_FINANCIAL_CALENDAR_HIST` (`HierStrucID`,`EntryType`),
  KEY `IX_FINANCIAL_CALENDAR_HIST_2` (`EndDate`,`FinCalendarHistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `financial_calendar_hist_off`
--

DROP TABLE IF EXISTS `financial_calendar_hist_off`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_calendar_hist_off` (
  `FinCalendarHistID` int NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `EndDate` datetime(3) NOT NULL,
  `EntryType` int NOT NULL,
  `EntryValue` bigint NOT NULL,
  PRIMARY KEY (`FinCalendarHistID`),
  KEY `FinCalendarHistID` (`FinCalendarHistID`),
  KEY `IX_FIN_CAL_HIST_OFF2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `format_parameter`
--

DROP TABLE IF EXISTS `format_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `format_parameter` (
  `FmtParamID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `LineFeedsBeforeOrder` int DEFAULT NULL,
  `LinesFirst` int DEFAULT NULL,
  `LineFeedsBeforeFirst` bigint DEFAULT NULL,
  `LinesOther` int DEFAULT NULL,
  `LineFeedsBeforeOther` int DEFAULT NULL,
  `MinimumLines` int DEFAULT NULL,
  `InformationLines` int DEFAULT NULL,
  `OptionBits` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ScreenSort` int DEFAULT NULL,
  `ReceiptSort` int DEFAULT NULL,
  `CheckSort` int DEFAULT NULL,
  `HelpSort` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `InvoiceThreshold` int DEFAULT NULL,
  `CustInfoThreshold` int DEFAULT NULL,
  `LabelID` bigint DEFAULT NULL,
  `CFDOptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000',
  `CFDContentImage` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CFDContentImage2` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`FmtParamID`),
  UNIQUE KEY `AK_FORMAT_PARAMETER` (`HierStrucID`),
  KEY `IX_FORMAT_PARAMETER_m1` (`LabelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `giftcard_provider`
--

DROP TABLE IF EXISTS `giftcard_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giftcard_provider` (
  `GiftCardProviderID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `ProviderReference` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ActivateType` smallint DEFAULT NULL,
  `ActivateObjNum` int DEFAULT NULL,
  `IssueType` smallint DEFAULT NULL,
  `IssueObjNum` int DEFAULT NULL,
  `ReloadType` smallint DEFAULT NULL,
  `ReloadObjNum` int DEFAULT NULL,
  `RedeemType` smallint DEFAULT NULL,
  `RedeemObjNum` int DEFAULT NULL,
  `CashOutType` smallint DEFAULT NULL,
  `CashOutObjNum` int DEFAULT NULL,
  PRIMARY KEY (`GiftCardProviderID`),
  KEY `IX_GIFTCARD_PROVIDER_REF` (`ProviderReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `global_parameter`
--

DROP TABLE IF EXISTS `global_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_parameter` (
  `ParamCode` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ParamType` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IntVal` bigint DEFAULT NULL,
  `NumberVal` decimal(19,4) DEFAULT NULL,
  `DateVal` datetime(3) DEFAULT NULL,
  `StringVal` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `UnicodeStrVal` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ParamCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_acceptance_limit`
--

DROP TABLE IF EXISTS `gms_acceptance_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_acceptance_limit` (
  `AcceptanceLimitID` bigint NOT NULL,
  `ReservationPeriodID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `TimeBegin` smallint DEFAULT NULL,
  `TimeEnd` smallint DEFAULT NULL,
  `RepeatCycle` smallint DEFAULT NULL,
  `MaxAcceptance` smallint DEFAULT NULL,
  PRIMARY KEY (`AcceptanceLimitID`),
  KEY `IX_GMS_ACCEPTANCE_LIMIT2` (`HierStrucID`),
  KEY `IX_GMS_ACCEPTANCE_LIMIT3` (`ReservationPeriodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_check_alert`
--

DROP TABLE IF EXISTS `gms_check_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_check_alert` (
  `CheckAlertID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `AlertTime` smallint DEFAULT NULL,
  `AlertColor` int DEFAULT NULL,
  PRIMARY KEY (`CheckAlertID`),
  KEY `IX_GMS_CHECK_ALERT2` (`HierStrucID`),
  KEY `IX_GMS_CHECK_ALERT3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_occupancy_limit`
--

DROP TABLE IF EXISTS `gms_occupancy_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_occupancy_limit` (
  `OccupancyLimitID` bigint NOT NULL,
  `ReservationPeriodID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `TimeBegin` smallint DEFAULT NULL,
  `TimeEnd` smallint DEFAULT NULL,
  `MaxOccupancy` smallint DEFAULT NULL,
  PRIMARY KEY (`OccupancyLimitID`),
  KEY `IX_GMS_OCCUPANCY_LIMIT2` (`HierStrucID`),
  KEY `IX_GMS_OCCUPANCY_LIMIT3` (`ReservationPeriodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_parameter`
--

DROP TABLE IF EXISTS `gms_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_parameter` (
  `GMSParamID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `IsEnabled` bit(1) NOT NULL DEFAULT b'0',
  `TableSelectImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TableDirtyImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TableSeatedImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TableOccupiedImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TablePrintedImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TablePaidImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TableParentImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TableChildImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TableClosedImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TableReservedImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TableUserSuggestedImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TableSysSuggestedImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `HostAreaImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LoyaltyModuleID` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OptionBits` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000',
  `AutoAbandonWaitlistDelay` smallint DEFAULT NULL,
  `ReservationToWaitlistDelay` smallint DEFAULT NULL,
  `MaxConfirmationNumber` bigint DEFAULT NULL,
  `MinConfirmationNumber` bigint DEFAULT NULL,
  `MaxReservationNotice` smallint DEFAULT NULL,
  `MinReservationNotice` smallint DEFAULT NULL,
  `HighLightedTableImageName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PerMinWaitingPastQuoteWgt` smallint DEFAULT NULL,
  `WaitQuoteInterval` int DEFAULT NULL,
  `AutoResetPaidStatus` smallint DEFAULT NULL,
  `ServerUnavailableMinutes` smallint DEFAULT NULL,
  PRIMARY KEY (`GMSParamID`),
  KEY `IX_GMS_PARAMETER2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_reason`
--

DROP TABLE IF EXISTS `gms_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_reason` (
  `GMSReasonDescID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `GMSReasonIndex` smallint NOT NULL,
  `NameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `LastPostingTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`GMSReasonDescID`),
  KEY `IX_GMS_REASON2` (`HierStrucID`),
  KEY `IX_GMS_REASON3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_reservation_period`
--

DROP TABLE IF EXISTS `gms_reservation_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_reservation_period` (
  `ReservationPeriodID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `EffectivityID` bigint DEFAULT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  PRIMARY KEY (`ReservationPeriodID`),
  KEY `IX_GMS_RESRV_PD2` (`HierStrucID`),
  KEY `IX_GMS_RESRV_PD3` (`EffectivityID`),
  KEY `IX_GMS_RESRV_PD4` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_seating_limit`
--

DROP TABLE IF EXISTS `gms_seating_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_seating_limit` (
  `SeatingLimitID` bigint NOT NULL,
  `ReservationPeriodID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `TimeBegin` smallint DEFAULT NULL,
  `TimeEnd` smallint DEFAULT NULL,
  `Capacity` smallint DEFAULT NULL,
  `Quantity` smallint DEFAULT NULL,
  PRIMARY KEY (`SeatingLimitID`),
  KEY `IX_GMS_SEATING_LIMIT2` (`HierStrucID`),
  KEY `IX_GMS_SEATING_LIMIT3` (`ReservationPeriodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_section`
--

DROP TABLE IF EXISTS `gms_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_section` (
  `SectionID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `SectionColor` int DEFAULT NULL,
  PRIMARY KEY (`SectionID`),
  KEY `IX_GMS_SECTION2` (`HierStrucID`),
  KEY `IX_GMS_SECTION3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_section_layout`
--

DROP TABLE IF EXISTS `gms_section_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_section_layout` (
  `LayoutID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint DEFAULT NULL,
  `LastAccessedDate` datetime(3) DEFAULT NULL,
  `RecordGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`LayoutID`),
  KEY `LayoutID` (`LayoutID`),
  KEY `IX_GMS_SECTION_LAYOUT2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_section_layout_tbl`
--

DROP TABLE IF EXISTS `gms_section_layout_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_section_layout_tbl` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `LayoutID` bigint DEFAULT NULL,
  `DiningTableID` int NOT NULL,
  `SectionID` bigint NOT NULL,
  `EmployeeID` bigint DEFAULT NULL,
  `RecordGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LayoutRecordGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`),
  KEY `IX_GMS_SECTION_LAYOUT_TBL2` (`HierStrucID`),
  KEY `IX_GMS_SECTION_LAYOUT_TBL3` (`SectionID`),
  KEY `IX_GMS_SECTION_LAYOUT_TBL4` (`EmployeeID`),
  KEY `IX_GMS_SECTION_LAYOUT_TBL6` (`DiningTableID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_section_template`
--

DROP TABLE IF EXISTS `gms_section_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_section_template` (
  `TemplateID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `LastAccessedDate` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`TemplateID`),
  KEY `IX_GMS_SECTION_TEMPLATE2` (`HierStrucID`),
  KEY `IX_GMS_SECTION_TEMPLATE3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_section_template_tbl`
--

DROP TABLE IF EXISTS `gms_section_template_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_section_template_tbl` (
  `ID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `TemplateID` bigint NOT NULL,
  `DiningTableID` int NOT NULL,
  `SectionID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_GMS_SECTION_TEMPLATE_TBL2` (`HierStrucID`),
  KEY `IX_GMS_SECTION_TEMPLATE_TBL3` (`DiningTableID`),
  KEY `IX_GMS_SECTION_TEMPLATE_TBL4` (`TemplateID`),
  KEY `IX_GMS_SECTION_TEMPLATE_TBL5` (`SectionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_service_alert`
--

DROP TABLE IF EXISTS `gms_service_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_service_alert` (
  `ServiceAlertID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `AlertTime` smallint DEFAULT NULL,
  `AlertColor` int DEFAULT NULL,
  PRIMARY KEY (`ServiceAlertID`),
  KEY `IX_GMS_SERVICE_ALERT2` (`HierStrucID`),
  KEY `IX_GMS_SERVICE_ALERT3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_suggestion_factor`
--

DROP TABLE IF EXISTS `gms_suggestion_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_suggestion_factor` (
  `GMSSuggestionFactorID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `SuggestionFactor` int DEFAULT NULL,
  `Rank` int DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  PRIMARY KEY (`GMSSuggestionFactorID`),
  KEY `IX_GMS_SUGGESTION_FACTOR2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_target_turn_time`
--

DROP TABLE IF EXISTS `gms_target_turn_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_target_turn_time` (
  `TargetTurnTimeID` bigint NOT NULL,
  `ReservationPeriodID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `TimeBegin` smallint DEFAULT NULL,
  `TimeEnd` smallint DEFAULT NULL,
  `CoverCnt` smallint DEFAULT NULL,
  `Minutes` smallint DEFAULT NULL,
  PRIMARY KEY (`TargetTurnTimeID`),
  KEY `IX_GMS_TARGET_TURN_TIME2` (`HierStrucID`),
  KEY `IX_GMS_TARGET_TURN_TIME3` (`ReservationPeriodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_tbl_mergeable_assign`
--

DROP TABLE IF EXISTS `gms_tbl_mergeable_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_tbl_mergeable_assign` (
  `MergeableAssignID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `DiningTableID` int NOT NULL,
  `MergeableTableObjNum` int DEFAULT NULL,
  PRIMARY KEY (`MergeableAssignID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_tbl_pref_assign`
--

DROP TABLE IF EXISTS `gms_tbl_pref_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_tbl_pref_assign` (
  `PreferenceAssignID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `DiningTableID` int NOT NULL,
  `PreferenceAttrDefID` bigint DEFAULT NULL,
  `PreferenceAttrObjNum` int DEFAULT NULL,
  PRIMARY KEY (`PreferenceAssignID`),
  KEY `IX_GMS_TBL_PREF_ASSIGN2` (`HierStrucID`),
  KEY `IX_GMS_TBL_PREF_ASSIGN4` (`DiningTableID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_tbl_pref_attr_def`
--

DROP TABLE IF EXISTS `gms_tbl_pref_attr_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_tbl_pref_attr_def` (
  `PreferenceAttrDefID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `PreferenceCatDefID` bigint DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `CodeID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `IsExclusive` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`PreferenceAttrDefID`),
  KEY `IX_GMS_TBL_PREF_ATTR_DEF2` (`HierStrucID`),
  KEY `IX_GMS_TBL_PREF_ATTR_DEF3` (`NameID`),
  KEY `IX_GMS_TBL_PREF_ATTR_DEF4` (`CodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_tbl_pref_cat_def`
--

DROP TABLE IF EXISTS `gms_tbl_pref_cat_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_tbl_pref_cat_def` (
  `PreferenceCatDefID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `IsExclusive` bit(1) NOT NULL,
  PRIMARY KEY (`PreferenceCatDefID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_tbl_pref_request`
--

DROP TABLE IF EXISTS `gms_tbl_pref_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_tbl_pref_request` (
  `PreferenceRequestID` bigint NOT NULL AUTO_INCREMENT,
  `TblRequestDtlID` bigint NOT NULL,
  `PreferenceAttrID` bigint DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  `PreferenceAttrObjNum` int DEFAULT NULL,
  PRIMARY KEY (`PreferenceRequestID`),
  KEY `PreferenceRequestID` (`PreferenceRequestID`),
  KEY `IX_GMS_TBL_PREF_REQUEST2` (`TblRequestDtlID`),
  KEY `IX_GMS_TBL_PREF_REQUEST3` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_tbl_request_detail`
--

DROP TABLE IF EXISTS `gms_tbl_request_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_tbl_request_detail` (
  `TblRequestDtlID` bigint NOT NULL AUTO_INCREMENT,
  `CreationDate` datetime(3) DEFAULT NULL,
  `EmployeeID` bigint DEFAULT NULL,
  `RevCtrID` int DEFAULT NULL,
  `ReservationCovCnt` smallint DEFAULT NULL,
  `IsPendingApproval` bit(1) DEFAULT b'0',
  `ApprovedBy` bigint DEFAULT NULL,
  `ApprovedDate` datetime(3) DEFAULT NULL,
  `ReservationDate` datetime(3) DEFAULT NULL,
  `CancelDate` datetime(3) DEFAULT NULL,
  `NoShowDate` datetime(3) DEFAULT NULL,
  `GreetedDate` datetime(3) DEFAULT NULL,
  `CoverCnt` smallint DEFAULT NULL,
  `GuestName` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PhoneNumber` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `IsVip` bit(1) DEFAULT b'0',
  `WaitQuote` smallint DEFAULT NULL,
  `PagerNumber` smallint DEFAULT NULL,
  `PageTime` smallint DEFAULT NULL,
  `AbandonTime` smallint DEFAULT NULL,
  `SeatedTime` smallint DEFAULT NULL,
  `CheckID` bigint DEFAULT NULL,
  `TextDetail` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `EstimatedWait` smallint DEFAULT NULL,
  `DiningTableID` int DEFAULT NULL,
  `ConfirmationNumber` bigint DEFAULT NULL,
  `ReferralNotes` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `RequestMethod` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `RequestMethodRef` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LockTime` datetime(3) DEFAULT NULL,
  `UserTblSuggest` bit(1) DEFAULT b'0',
  `SuggestPosition` smallint DEFAULT NULL,
  `CheckGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `RecordGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CRMRecordID` bigint DEFAULT NULL,
  `CRMAccountNumber` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GMSReasonDescID` int DEFAULT NULL,
  `CardEntryType` int NOT NULL DEFAULT '0',
  `EmailAddress` varchar(320) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LastEmployeeID` bigint DEFAULT NULL,
  `LastModifiedDate` datetime(3) DEFAULT NULL,
  `CancelEmployeeID` bigint DEFAULT NULL,
  `AbandonEmployeeID` bigint DEFAULT NULL,
  `NoShowEmployeeID` bigint DEFAULT NULL,
  `GreetedEmployeeID` bigint DEFAULT NULL,
  `SeatedEmployeeID` bigint DEFAULT NULL,
  `ActualTurnTime` smallint DEFAULT NULL,
  `PageEmployeeID` bigint DEFAULT NULL,
  `SectionID` bigint DEFAULT NULL,
  `LastSuggestedDiningTableID` int DEFAULT NULL,
  `HierStrucID` bigint DEFAULT NULL,
  `RevisionNumber` int DEFAULT NULL,
  PRIMARY KEY (`TblRequestDtlID`),
  KEY `TblRequestDtlID` (`TblRequestDtlID`),
  KEY `IX_GMS_TBL_REQUEST_DETAIL10` (`AbandonEmployeeID`),
  KEY `IX_GMS_TBL_REQUEST_DETAIL11` (`NoShowEmployeeID`),
  KEY `IX_GMS_TBL_REQUEST_DETAIL12` (`GreetedEmployeeID`),
  KEY `IX_GMS_TBL_REQUEST_DETAIL13` (`SeatedEmployeeID`),
  KEY `IX_GMS_TBL_REQUEST_DETAIL14` (`PageEmployeeID`),
  KEY `IX_GMS_TBL_REQUEST_DETAIL15` (`SectionID`),
  KEY `IX_GMS_TBL_REQUEST_DETAIL16` (`HierStrucID`),
  KEY `IX_GMS_TBL_REQUEST_DETAIL2` (`EmployeeID`),
  KEY `IX_GMS_TBL_REQUEST_DETAIL3` (`ApprovedBy`),
  KEY `IX_GMS_TBL_REQUEST_DETAIL4` (`CheckID`),
  KEY `IX_GMS_TBL_REQUEST_DETAIL5` (`DiningTableID`),
  KEY `IX_GMS_TBL_REQUEST_DETAIL6` (`RevCtrID`),
  KEY `IX_GMS_TBL_REQUEST_DETAIL7` (`GMSReasonDescID`),
  KEY `IX_GMS_TBL_REQUEST_DETAIL8` (`LastEmployeeID`),
  KEY `IX_GMS_TBL_REQUEST_DETAIL9` (`CancelEmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gms_wait_quote_time`
--

DROP TABLE IF EXISTS `gms_wait_quote_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gms_wait_quote_time` (
  `WaitQuoteInvervalId` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `WaitQuoteInterval` smallint DEFAULT NULL,
  `ObjectNumber` int NOT NULL DEFAULT '1',
  `NameId` bigint NOT NULL DEFAULT '1',
  PRIMARY KEY (`WaitQuoteInvervalId`),
  KEY `WaitQuoteInvervalId` (`WaitQuoteInvervalId`),
  KEY `IX_GMS_WAIT_QUOTE_TIME2` (`HierStrucID`),
  KEY `IX_GMS_WAIT_QUOTE_TIME3` (`NameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_event_area`
--

DROP TABLE IF EXISTS `group_event_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_event_area` (
  `GroupEventAreaID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`GroupEventAreaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_event_def`
--

DROP TABLE IF EXISTS `group_event_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_event_def` (
  `GroupEventDefID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `EventCode` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `GroupEventTypeID` bigint DEFAULT NULL,
  `GroupEventSubTypeID` bigint DEFAULT NULL,
  `StartDateTime` datetime(3) DEFAULT NULL,
  `StartAutoTrigger` bit(1) NOT NULL DEFAULT b'0',
  `EndDateTime` datetime(3) DEFAULT NULL,
  `EndAutoTrigger` bit(1) NOT NULL DEFAULT b'0',
  `NextGroupEventDefID` bigint DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `Attendance` bigint DEFAULT NULL,
  `PrevGroupEventDefID` bigint DEFAULT NULL,
  `CancelDateTime` datetime(3) DEFAULT NULL,
  `ExternalEventID` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`GroupEventDefID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_event_def_dtl`
--

DROP TABLE IF EXISTS `group_event_def_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_event_def_dtl` (
  `GroupEventDefDtlID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `GroupEventDefID` bigint DEFAULT NULL,
  `RevCtrID` int DEFAULT NULL,
  `GroupEventAreaID` bigint DEFAULT NULL,
  PRIMARY KEY (`GroupEventDefDtlID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_event_status`
--

DROP TABLE IF EXISTS `group_event_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_event_status` (
  `GroupEventStatusID` bigint NOT NULL,
  `GroupEventDefID` bigint NOT NULL,
  `Status` int NOT NULL DEFAULT '0',
  `ActualStartDateTime` datetime(3) DEFAULT NULL,
  `ActualEndDateTime` datetime(3) DEFAULT NULL,
  `LastChangeDateTime` datetime(3) DEFAULT NULL,
  `LastChangeEmployeeID` bigint DEFAULT NULL,
  `LastChangeRevCtrID` int DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  PRIMARY KEY (`GroupEventStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_GROUP_EVENT_STATUS_LastChangeDateTime` BEFORE INSERT ON `group_event_status` FOR EACH ROW BEGIN
IF new.LastChangeDateTime IS NULL THEN
SET new.LastChangeDateTime = utc_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `group_event_sub_type`
--

DROP TABLE IF EXISTS `group_event_sub_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_event_sub_type` (
  `GroupEventSubTypeID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `GroupEventTypeID` bigint DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`GroupEventSubTypeID`),
  KEY `IX_GROUP_EVENT_SUB_TYPE` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_event_type`
--

DROP TABLE IF EXISTS `group_event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_event_type` (
  `GroupEventTypeID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `MenuLvlIndex` int DEFAULT NULL,
  `SubMenuLvlIndex` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`GroupEventTypeID`),
  KEY `IX_GROUP_EVENT_TYPE` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guest_information_detail`
--

DROP TABLE IF EXISTS `guest_information_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_information_detail` (
  `GuestInfoDtlID` bigint NOT NULL AUTO_INCREMENT,
  `CheckDetailID` bigint NOT NULL,
  `GuestInfoID` bigint NOT NULL,
  KEY `GuestInfoDtlID` (`GuestInfoDtlID`),
  KEY `IX_GUEST_INFORMATION_DETAIL_2` (`GuestInfoID`),
  KEY `IX_GUEST_INFORMATION_DETAIL_m1` (`CheckDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_screen`
--

DROP TABLE IF EXISTS `help_screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_screen` (
  `HlpScrnID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `ScreenType` smallint DEFAULT NULL,
  `Address` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `HtmlID` bigint DEFAULT NULL,
  PRIMARY KEY (`HlpScrnID`),
  UNIQUE KEY `AK_HELP_SCREEN` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_HELP_SCREEN_m1` (`NameID`),
  KEY `IX_HELP_SCREEN_m2` (`HtmlID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hierarchy`
--

DROP TABLE IF EXISTS `hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hierarchy` (
  `HierID` int NOT NULL,
  `NameID` bigint NOT NULL,
  `HierType` int NOT NULL,
  PRIMARY KEY (`HierID`),
  KEY `IX_HIERARCHY_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hierarchy_parameter`
--

DROP TABLE IF EXISTS `hierarchy_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hierarchy_parameter` (
  `HierParamID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `OptionBits` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `HhtOptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TableCount` int DEFAULT NULL,
  `TrkGrpID` int DEFAULT NULL,
  `OrdTypeID` int DEFAULT NULL,
  `LdsNluGrp` int DEFAULT NULL,
  `ServingPeriodID` int DEFAULT NULL,
  `EncryptionKeyID` int DEFAULT NULL,
  `AseqEmployeeID` bigint DEFAULT NULL,
  `AseqPcPrtIndex` smallint DEFAULT NULL,
  `AseqUserName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `AseqPassword` longblob,
  `MaxIdleTime` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `EncryptionKeySig` longblob,
  `SIMServiceID` int DEFAULT NULL,
  `OCServiceID` int DEFAULT NULL,
  `DiscountCalcTimeLimit` int DEFAULT NULL,
  `DiscountAutoSLUGraceLimit` int DEFAULT NULL,
  `CheckDetailWatermarkID` int DEFAULT NULL,
  `MyMicrosURL` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DefaultTierScale` smallint NOT NULL DEFAULT '2',
  `NumBCEditsPerChk` int DEFAULT NULL,
  `NumBCEditsPerDay` int DEFAULT NULL,
  `NumChkRcptToPrnt` tinyint unsigned DEFAULT NULL,
  `DefaultMasterGroupID` bigint DEFAULT NULL,
  `MainMenuLvlIndex` int DEFAULT NULL,
  `SubMenuLvlIndex` int DEFAULT NULL,
  `BarcodeNluIndex` int DEFAULT NULL,
  `OrdTypeIndex` int DEFAULT NULL,
  `DiningTableStatusDefSetNum` int DEFAULT NULL,
  `MyLaborURL` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MyLaborUser` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MyLaborPass` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MyLaborUpdateInterval` int DEFAULT NULL,
  `MyLaborPlaybackInterval` int DEFAULT NULL,
  `InactiveOpenOrderThreshold` smallint DEFAULT NULL,
  `PurgeOrderThreshold` smallint DEFAULT NULL,
  `MyLaborURL_ext` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DepositMenuItemObjNum` int DEFAULT NULL,
  `EmailConfiguration` longtext,
  `EngageURL` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `EngageOrgCode` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PopupCondOrderPageObjNum` int DEFAULT NULL,
  `PopupCondEditPageObjNum` int DEFAULT NULL,
  `IEMaxBadRecords` bigint DEFAULT '100',
  `IEDaysBeforePurge` bigint DEFAULT '60',
  `IEDateFormatString` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PropertyMyLaborURL` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MyLaborPasEnc` longblob,
  `AutoServingPeriod` tinyint unsigned NOT NULL DEFAULT '1',
  `AMTTHRESHOLD` decimal(21,4) DEFAULT '0.0000',
  `FiscalLocation` smallint DEFAULT '0',
  `OPPConfigURL` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OrdChannelObjNum` int DEFAULT NULL,
  PRIMARY KEY (`HierParamID`),
  UNIQUE KEY `AK_HIERARCHY_PARAMETER` (`HierStrucID`),
  KEY `IX_HIERARCHY_PARAMETER_1` (`CheckDetailWatermarkID`),
  KEY `IX_HIERARCHY_PARAMETER_2` (`DefaultMasterGroupID`),
  KEY `IX_HIERARCHY_PARAMETER_3` (`SIMServiceID`),
  KEY `IX_HIERARCHY_PARAMETER_4` (`OCServiceID`),
  KEY `IX_HIERARCHY_PARAMETER_5` (`TrkGrpID`),
  KEY `IX_HIERARCHY_PARAMETER_6` (`ServingPeriodID`),
  KEY `IX_HIERARCHY_PARAMETER_7` (`OrdTypeID`),
  KEY `IX_HIERARCHY_PARAMETER_m1` (`AseqEmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hierarchy_structure`
--

DROP TABLE IF EXISTS `hierarchy_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hierarchy_structure` (
  `HierStrucID` bigint NOT NULL,
  `HierID` int NOT NULL,
  `HierUnitID` int NOT NULL,
  `ParentHierStrucID` bigint DEFAULT NULL,
  `CHANGETIME` datetime(3) DEFAULT NULL,
  `HierOptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000',
  `ZoneType` int DEFAULT NULL,
  `OrganizationID` int DEFAULT NULL,
  PRIMARY KEY (`HierStrucID`),
  KEY `IX_HIERARCHY_STRUCTURE_3` (`HierID`),
  KEY `IX_HIERSTRUCT_2` (`ParentHierStrucID`),
  KEY `IX_HIERSTRUCT_2001` (`HierUnitID`),
  KEY `IX_HIERSTRUCT_ORG` (`OrganizationID`,`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hierarchy_unit`
--

DROP TABLE IF EXISTS `hierarchy_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hierarchy_unit` (
  `HierUnitID` int NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `RevCtrID` int DEFAULT NULL,
  `PropertyID` int DEFAULT NULL,
  `ChangeTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`HierUnitID`),
  KEY `IX_HIERARCHY_UNIT_4` (`RevCtrID`),
  KEY `IX_HIERARCHY_UNIT_5` (`PropertyID`),
  KEY `IX_HIERARCHY_UNIT_m1` (`NameID`),
  KEY `IX_OBJNUM_HIERARCHY_UNIT` (`ObjectNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `interface`
--

DROP TABLE IF EXISTS `interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interface` (
  `InterfaceID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `PosPcID` int DEFAULT NULL,
  `BackupPosPcID` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `ServiceType` smallint DEFAULT NULL,
  `OptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ScriptName` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `HeapSize` int DEFAULT NULL,
  `Timeout` int DEFAULT NULL,
  `PingFrequency` int DEFAULT NULL,
  `BackupInterfaceNumber` int DEFAULT NULL,
  `OfflineInterfaceNumber` int DEFAULT NULL,
  `SimDbSync` int DEFAULT NULL,
  `SimDbDll` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SimDbInterfaceNumber` int DEFAULT NULL,
  `InterfaceType` smallint DEFAULT NULL,
  `TtyOptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TtyDevice` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TtyBaudRate` smallint NOT NULL,
  `TtyWordLength` smallint NOT NULL,
  `TcpHost` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TcpPort` int DEFAULT NULL,
  `SpxNetwork` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SpxNode` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SpxSocket` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `NameInternal` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ServiceID` int DEFAULT NULL,
  `EncodingType` smallint DEFAULT NULL,
  PRIMARY KEY (`InterfaceID`),
  UNIQUE KEY `AK_INTERFACE` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_INTERFACE_2` (`PosPcID`),
  KEY `IX_INTERFACE_3` (`BackupPosPcID`),
  KEY `IX_INTERFACE_4` (`ServiceID`),
  KEY `IX_INTERFACE_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `interface_link`
--

DROP TABLE IF EXISTS `interface_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interface_link` (
  `InterfaceLinkID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `LinkIndex` int NOT NULL,
  `InterfaceID` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`InterfaceLinkID`),
  KEY `IX_INTERFACE_LINK` (`HierStrucID`),
  KEY `IX_INTERFACE_LINK_2` (`InterfaceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_code`
--

DROP TABLE IF EXISTS `job_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_code` (
  `JobCodeID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `ReportGroup` int DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `AvailableHierStrucID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `JobCodePostingTime` datetime(3) DEFAULT NULL,
  `RoleID` bigint DEFAULT NULL,
  `EmpClassID` int DEFAULT NULL,
  `ClkInPrivLevel` int DEFAULT NULL,
  PRIMARY KEY (`JobCodeID`),
  UNIQUE KEY `AK_JOB_CODE` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_JOB_CODE_1` (`JobCodePostingTime`),
  KEY `IX_JOB_CODE_2` (`RoleID`),
  KEY `IX_JOB_CODE_3` (`EmpClassID`),
  KEY `IX_JOB_CODE_m1` (`AvailableHierStrucID`),
  KEY `IX_JOB_CODE_m2` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_JOB_CODE_JobCodePostingTime` BEFORE INSERT ON `job_code` FOR EACH ROW BEGIN
IF new.JobCodePostingTime IS NULL THEN
SET new.JobCodePostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kds_bumpbar_button`
--

DROP TABLE IF EXISTS `kds_bumpbar_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_bumpbar_button` (
  `KdsBumpbarButtonID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `KdsBumpbarStyleID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `ScancodeValue` int NOT NULL,
  `KdsFunction` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `Parameters` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`KdsBumpbarButtonID`),
  KEY `IX_KDS_BUMPBAR_BUTTON_2` (`KdsBumpbarStyleID`),
  KEY `IX_KDS_BUMPBAR_BUTTON_m1` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_bumpbar_style`
--

DROP TABLE IF EXISTS `kds_bumpbar_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_bumpbar_style` (
  `KdsBumpbarStyleID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `LangID` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `AutoBumpTime` bigint DEFAULT NULL,
  `AutoBumpCheckCount` bigint DEFAULT NULL,
  PRIMARY KEY (`KdsBumpbarStyleID`),
  KEY `IX_KDS_BUMPBAR_STYLE_2` (`LangID`),
  KEY `IX_KDS_BUMPBAR_STYLE_m1` (`NameID`),
  KEY `IX_KDS_BUMPBAR_STYLE_m2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_client`
--

DROP TABLE IF EXISTS `kds_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_client` (
  `KdsClientID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `DeviceID` bigint DEFAULT NULL,
  `KdsControllerID` bigint DEFAULT NULL,
  `KdsLayoutStyleID` bigint NOT NULL,
  `LangID` int NOT NULL,
  `PlatformType` int NOT NULL,
  `LicenseSeqNumber` int DEFAULT NULL,
  `OptionBits` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SelectionTimeOut` int DEFAULT NULL,
  `DisplayType` int NOT NULL,
  `NumberOfChitColumns` int NOT NULL,
  `NumberOfTableColumns` int NOT NULL,
  `NumberOfRows` int NOT NULL,
  `NumberOfPanels` int NOT NULL,
  `ToolbarPositionType` int NOT NULL,
  `PanelLayoutType` smallint NOT NULL,
  `SOSTableDetailTimeOut` int DEFAULT NULL,
  `ProdItemLocationType` smallint DEFAULT NULL,
  `ProdItemColumns` int DEFAULT NULL,
  `SerpentineModeType` smallint NOT NULL,
  `OrderTypeFontSize` int DEFAULT NULL,
  `MenuItemFontSize` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `HostAddress` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint DEFAULT NULL,
  `KdsToolbarStyleObjNum` int DEFAULT NULL,
  `KdsBumpbarStyleObjNum` int DEFAULT NULL,
  `CardID` smallint DEFAULT NULL,
  `VideoID` smallint DEFAULT NULL,
  `SosZoneFontSize` int DEFAULT NULL,
  `SortMethod` int DEFAULT NULL,
  `MinTableState` int DEFAULT NULL,
  `MaxTableState` int DEFAULT NULL,
  `RecallListCol1Type` int DEFAULT NULL,
  `RecallListCol1Width` int DEFAULT NULL,
  `RecallListCol2Type` int DEFAULT NULL,
  `RecallListCol2Width` int DEFAULT NULL,
  `RecallListCol3Type` int DEFAULT NULL,
  `RecallListCol3Width` int DEFAULT NULL,
  `RecallListCol4Type` int DEFAULT NULL,
  `RecallListCol4Width` int DEFAULT NULL,
  `RecallListCol5Type` int DEFAULT NULL,
  `RecallListCol5Width` int DEFAULT NULL,
  `RecallListCol6Type` int DEFAULT NULL,
  `RecallListCol6Width` int DEFAULT NULL,
  `OrientationType` int NOT NULL DEFAULT '0',
  `AutoBumpTime` bigint DEFAULT NULL,
  `AutoBumpCheckCount` bigint DEFAULT NULL,
  `TableDetailToolbar` int DEFAULT NULL,
  `ComboItemFontSize` int NOT NULL DEFAULT '8',
  `KdsWidth` int NOT NULL DEFAULT '0',
  `KdsHeight` int NOT NULL DEFAULT '0',
  `KdsFromTop` int NOT NULL DEFAULT '0',
  `KdsFromLeft` int NOT NULL DEFAULT '0',
  `PanelProportions` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PanelChitColumns` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PanelChitRows` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SecRecAuthKeyId` bigint DEFAULT NULL,
  `PanelCapacity` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`KdsClientID`),
  KEY `IX_KDS_CLIENT_2` (`NameID`),
  KEY `IX_KDS_CLIENT_3` (`KdsLayoutStyleID`),
  KEY `IX_KDS_CLIENT_4` (`KdsControllerID`),
  KEY `IX_KDS_CLIENT_5` (`LangID`),
  KEY `IX_KDS_CLIENT_m1` (`DeviceID`),
  KEY `IX_KDS_CLIENT_m2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_client_production_item`
--

DROP TABLE IF EXISTS `kds_client_production_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_client_production_item` (
  `KdsClientProdItemID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `KdsClientID` bigint NOT NULL,
  `ProductionItemObjNum` int NOT NULL,
  `PersistenceType` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`KdsClientProdItemID`),
  KEY `IX_KDS_CLIENT_PRODUCTION_ITEM2` (`HierStrucID`),
  KEY `IX_KDS_CLIENT_PRODUCTION_ITEM3` (`KdsClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_controller`
--

DROP TABLE IF EXISTS `kds_controller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_controller` (
  `KdsControllerID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `DeviceID` bigint DEFAULT NULL,
  `OptionBits` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PrepSuborderWait` int DEFAULT NULL,
  `ProductionCountIncType` smallint DEFAULT NULL,
  `ProductionCountDecType` smallint DEFAULT NULL,
  `ExpoRecallAction` smallint DEFAULT NULL,
  `NumberOfZones` int DEFAULT NULL,
  `MaxItemsPerZone` int DEFAULT NULL,
  `PostFileName1` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PostFileName2` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PostFileName3` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ItemStatusFiredColor` int DEFAULT NULL,
  `ItemStatusBumpedColor` int DEFAULT NULL,
  `ItemStatusSentColor` int DEFAULT NULL,
  `LayoutAlert1Color` int DEFAULT NULL,
  `LayoutAlert2Color` int DEFAULT NULL,
  `LayoutBackgroundColor` int DEFAULT NULL,
  `LayoutOrderSelectionColor` int DEFAULT NULL,
  `LayoutOrderBackgroundColor` int DEFAULT NULL,
  `LayoutVoidItemColor` int DEFAULT NULL,
  `LayoutCourse1ItemColor` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint DEFAULT NULL,
  `DbUpdateFrequency` int DEFAULT NULL,
  `ServiceID` int DEFAULT NULL,
  `ItemStatusStartedColor` int DEFAULT NULL,
  `ItemSelectColor` int DEFAULT NULL,
  `ItemMarkColor` int DEFAULT NULL,
  `ItemRecallColor` int DEFAULT NULL,
  `ItemRecallableColor` int DEFAULT NULL,
  `AutoBumpTime` bigint DEFAULT NULL,
  `AutoBumpCheckCount` bigint DEFAULT NULL,
  `BackupServiceID` int DEFAULT NULL,
  `BackupIsActive` bit(1) DEFAULT NULL,
  `ExternalPostFile1` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExternalPostFile2` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ExternalPostFile3` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LangISOCode` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ResetAllTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`KdsControllerID`),
  KEY `IX_KDS_CONTROLLER_2` (`ServiceID`),
  KEY `IX_KDS_CONTROLLER_3` (`NameID`),
  KEY `IX_KDS_CONTROLLER_4` (`BackupServiceID`),
  KEY `IX_KDS_CONTROLLER_m1` (`HierStrucID`),
  KEY `IX_KDS_CONTROLLER_m2` (`DeviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_detail`
--

DROP TABLE IF EXISTS `kds_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_detail` (
  `KdsDetailID` bigint NOT NULL AUTO_INCREMENT,
  `OrderID` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CheckID` bigint NOT NULL,
  `RevCtrID` int NOT NULL,
  `OrderDeviceIndex` smallint NOT NULL,
  `IsAppetizer` bit(1) NOT NULL,
  `IsHighPriority` bit(1) NOT NULL,
  `MenuItemCount` int NOT NULL,
  `CourseNumber` int NOT NULL,
  `SentTime` datetime(3) NOT NULL,
  `PrepTime` int NOT NULL,
  `RecallCount` smallint NOT NULL,
  `OrderAgingCategory1` tinyint unsigned NOT NULL,
  `OrderAgingCategory2` tinyint unsigned NOT NULL,
  `OrderAgingCategory3` tinyint unsigned NOT NULL,
  `OrderAgingCategory4` tinyint unsigned NOT NULL,
  `OrderAgingCategory5` tinyint unsigned NOT NULL,
  `OrderAgingCategory6` tinyint unsigned NOT NULL,
  `OrderAgingCategory7` tinyint unsigned NOT NULL,
  `PostingTime` datetime(3) NOT NULL,
  `PostingWeekday` tinyint unsigned NOT NULL,
  `PostingMinute` smallint NOT NULL,
  `ServingPeriodID` int NOT NULL,
  `AlertLevel1` tinyint unsigned NOT NULL,
  `AlertLevel2` tinyint unsigned NOT NULL,
  PRIMARY KEY (`KdsDetailID`),
  KEY `KdsDetailID` (`KdsDetailID`),
  KEY `IX_KDS_DETAIL_1000` (`RevCtrID`,`OrderID`,`OrderDeviceIndex`),
  KEY `IX_KDSDETAIL` (`PostingTime`)
) ENGINE=InnoDB AUTO_INCREMENT=42101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_detail_suborder`
--

DROP TABLE IF EXISTS `kds_detail_suborder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_detail_suborder` (
  `KdsDetailSuborderID` bigint NOT NULL AUTO_INCREMENT,
  `KdsDetailID` bigint NOT NULL,
  `SuborderID` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SIPSMenuItemObjectNumber` int DEFAULT NULL,
  `SIPSMenuItemDefSeq` int DEFAULT NULL,
  `SIPSMenuItemPrepTime` int DEFAULT NULL,
  `SIPSMenuItemModifiers` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PostingTime` datetime(3) NOT NULL,
  `ActualPrepTime` int DEFAULT NULL,
  PRIMARY KEY (`KdsDetailSuborderID`),
  KEY `KdsDetailSuborderID` (`KdsDetailSuborderID`),
  KEY `IX_KDS_DETAIL_SUBORDER_2` (`KdsDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_highlight_scheme`
--

DROP TABLE IF EXISTS `kds_highlight_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_highlight_scheme` (
  `KdsHighlightSchemeID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `BackgroundColor` int DEFAULT NULL,
  `ForegroundColor` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`KdsHighlightSchemeID`),
  KEY `IX_KDS_HIGHLIGHT_SCHEME_m1` (`NameID`),
  KEY `IX_KDS_HIGHLIGHT_SCHEME_m2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_layout_element`
--

DROP TABLE IF EXISTS `kds_layout_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_layout_element` (
  `KdsLayoutElementID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `KdsLayoutStyleID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `LayoutElementType` int NOT NULL,
  `AlternateLayoutElementType` int DEFAULT NULL,
  `RowNumber` int DEFAULT NULL,
  `ColumnNumber` int DEFAULT NULL,
  `Justification` int DEFAULT NULL,
  `Width` int DEFAULT NULL,
  `ColumnTitle` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FontName` int DEFAULT NULL,
  `FontSize` int DEFAULT NULL,
  `FontBold` bit(1) DEFAULT NULL,
  `ForeGroundColor` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`KdsLayoutElementID`),
  KEY `IX_KDS_LAYOUT_ELEMENT_2` (`KdsLayoutStyleID`),
  KEY `IX_KDS_LAYOUT_ELEMENT_m1` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_layout_style`
--

DROP TABLE IF EXISTS `kds_layout_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_layout_style` (
  `KdsLayoutStyleID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `StyleType` int NOT NULL,
  `PanelColor` int DEFAULT NULL,
  `SelectedColor` int DEFAULT NULL,
  `ActiveColor` int DEFAULT NULL,
  `Alert1Color` int DEFAULT NULL,
  `Alert2Color` int DEFAULT NULL,
  `TitleFontName` int DEFAULT NULL,
  `TitleFontSize` int DEFAULT NULL,
  `TitleFontBold` bit(1) DEFAULT NULL,
  `ElementFontName` int DEFAULT NULL,
  `ElementFontSize` int DEFAULT NULL,
  `ElementFontBold` bit(1) DEFAULT NULL,
  `GridColor` int DEFAULT NULL,
  `VoidColor` int DEFAULT NULL,
  `AppItemColor` int DEFAULT NULL,
  `OptionBits` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `LangID` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`KdsLayoutStyleID`),
  KEY `IX_KDS_LAYOUT_STYLE_2` (`LangID`),
  KEY `IX_KDS_LAYOUT_STYLE_m1` (`HierStrucID`),
  KEY `IX_KDS_LAYOUT_STYLE_m2` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_linked_order_devices`
--

DROP TABLE IF EXISTS `kds_linked_order_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_linked_order_devices` (
  `KdsLinkedOrderDeviceId` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `KdsOrderDeviceParamsID` bigint NOT NULL,
  `OrderDeviceID` int NOT NULL,
  PRIMARY KEY (`KdsLinkedOrderDeviceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_order_device_parameters`
--

DROP TABLE IF EXISTS `kds_order_device_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_order_device_parameters` (
  `KdsOrderDeviceParamsID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `KdsOrderDeviceOptionBits` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SendToPanel` int DEFAULT NULL,
  `BeepOnNewOrder` int DEFAULT NULL,
  `Course1FirstAlertTimeout` int NOT NULL,
  `Course1SecondAlertTimeout` int NOT NULL,
  `OtherCourse1stAlertTimeout` int NOT NULL,
  `OtherCourse2ndAlertTimeout` int NOT NULL,
  `PrimaryRunnerChitPrinterID` bigint DEFAULT NULL,
  `BackupRunnerChitPrinterID` bigint DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `PrimaryPrinterID` int DEFAULT NULL,
  `BackupPrinterID` int DEFAULT NULL,
  `AddSortRule` smallint DEFAULT NULL,
  `ModifySortRule` smallint DEFAULT NULL,
  `VoidSortRule` smallint DEFAULT NULL,
  `AddHighlightObjNum` int DEFAULT NULL,
  `ModifyHighlightObjNum` int DEFAULT NULL,
  `VoidHighlightObjNum` int DEFAULT NULL,
  `NewOrderTimeout` int DEFAULT NULL,
  `BeepOnPrioritizeOrder` int DEFAULT NULL,
  `BeepOnVIPOrder` int DEFAULT NULL,
  `BeepOnRushOrder` int DEFAULT NULL,
  `OrderAppearanceDelay` int NOT NULL DEFAULT '0',
  `Lane` smallint DEFAULT NULL,
  `Workflow` smallint DEFAULT NULL,
  `AssociatedOrderDevices` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`KdsOrderDeviceParamsID`),
  KEY `IX_KDS_ORD_DEVICE_PARAM_m1` (`HierStrucID`),
  KEY `IX_KDS_ORD_DEVICE_PARAM_m2` (`PrimaryRunnerChitPrinterID`),
  KEY `IX_KDS_ORD_DEVICE_PARAM_m3` (`BackupRunnerChitPrinterID`),
  KEY `IX_KDS_ORDER_DEVICE_PARAMS_2` (`PrimaryPrinterID`),
  KEY `IX_KDS_ORDER_DEVICE_PARAMS_3` (`BackupPrinterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_order_distribution_state`
--

DROP TABLE IF EXISTS `kds_order_distribution_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_order_distribution_state` (
  `KdsOrderDistributionStateID` bigint NOT NULL AUTO_INCREMENT,
  `OrderID` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CheckID` bigint NOT NULL,
  `RevCtrID` int NOT NULL,
  `DistributionState` int NOT NULL,
  `SetOnTime` datetime(3) NOT NULL,
  PRIMARY KEY (`KdsOrderDistributionStateID`),
  KEY `KdsOrderDistributionStateID` (`KdsOrderDistributionStateID`),
  KEY `IX_KDS_ORDER_DIST_STATE` (`CheckID`)
) ENGINE=InnoDB AUTO_INCREMENT=87140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_rvchier`
--

DROP TABLE IF EXISTS `kds_rvchier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_rvchier` (
  `KdsRvcID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `KdsControllerID` bigint NOT NULL,
  `RvcHierStrucID` bigint DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`KdsRvcID`),
  KEY `IX_KDS_RVCHIER_2` (`KdsControllerID`),
  KEY `IX_KDS_RVCHIER_m1` (`HierStrucID`),
  KEY `IX_KDS_RVCHIER_m2` (`RvcHierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_theme`
--

DROP TABLE IF EXISTS `kds_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_theme` (
  `KdsThemeID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `RvcGroupMask` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000000000000000000000000000',
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`KdsThemeID`),
  KEY `IX_KDS_THEME2` (`HierStrucID`),
  KEY `IX_KDS_THEME3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_theme_kds_client`
--

DROP TABLE IF EXISTS `kds_theme_kds_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_theme_kds_client` (
  `KdsThemeKdsClientID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `KdsThemeID` bigint NOT NULL,
  `KdsClientID` bigint NOT NULL,
  `KdsToolbarStyleObjNum` int NOT NULL,
  `KdsBumpbarStyleObjNum` int NOT NULL,
  `NumberOfPanels` int NOT NULL,
  `PanelLayoutType` smallint NOT NULL,
  `SerpentineModeType` smallint NOT NULL,
  `PanelProportions` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PanelChitColumns` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PanelChitRows` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PanelCapacity` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`KdsThemeKdsClientID`),
  KEY `IX_KDS_THEME_KDS_CLIENT2` (`HierStrucID`),
  KEY `IX_KDS_THEME_KDS_CLIENT3` (`KdsThemeID`),
  KEY `IX_KDS_THEME_KDS_CLIENT4` (`KdsClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_theme_order_device`
--

DROP TABLE IF EXISTS `kds_theme_order_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_theme_order_device` (
  `KdsThemeOrderDeviceID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `KdsThemeID` bigint NOT NULL,
  `OrdDvcIndex` smallint NOT NULL,
  `RedirectOrderDeviceID` int DEFAULT NULL,
  `KdsOrderDeviceParamsID` bigint DEFAULT NULL,
  `OrdDvcType` smallint NOT NULL,
  `PrimaryType` smallint DEFAULT NULL,
  `PrimaryID` bigint DEFAULT NULL,
  `BackupType` smallint DEFAULT NULL,
  `BackupID` bigint DEFAULT NULL,
  `DOMType` smallint DEFAULT NULL,
  `DistributionGroupID` int DEFAULT NULL,
  `SecondaryBackupID` bigint DEFAULT NULL,
  `CondimentSortType` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`KdsThemeOrderDeviceID`),
  KEY `IX_KDS_THEME_ORDER_DEVICE2` (`HierStrucID`),
  KEY `IX_KDS_THEME_ORDER_DEVICE3` (`KdsThemeID`),
  KEY `IX_KDS_THEME_ORDER_DEVICE6` (`KdsOrderDeviceParamsID`),
  KEY `IX_KDS_THEME_ORDER_DEVICE7` (`RedirectOrderDeviceID`),
  KEY `IX_KDS_THEME_ORDER_DEVICE8` (`DistributionGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_theme_order_type`
--

DROP TABLE IF EXISTS `kds_theme_order_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_theme_order_type` (
  `KdsThemeOrderTypeID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `OrdTypeIndex` int NOT NULL,
  `KdsThemeID` bigint NOT NULL,
  `OrderDeviceMask` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000000000000000000000000000',
  PRIMARY KEY (`KdsThemeOrderTypeID`),
  KEY `IX_KDS_THEME_ORDER_TYPE2` (`HierStrucID`),
  KEY `IX_KDS_THEME_ORDER_TYPE3` (`KdsThemeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_theme_period`
--

DROP TABLE IF EXISTS `kds_theme_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_theme_period` (
  `KdsThemePeriodID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `EffectivityID` bigint DEFAULT NULL,
  `KdsThemeID` bigint DEFAULT NULL,
  PRIMARY KEY (`KdsThemePeriodID`),
  KEY `IX_KDS_THEME_PERIOD2` (`HierStrucID`),
  KEY `IX_KDS_THEME_PERIOD3` (`EffectivityID`),
  KEY `IX_KDS_THEME_PERIOD4` (`KdsThemeID`),
  KEY `IX_KDS_THEME_PERIOD5` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_theme_ws_order_device`
--

DROP TABLE IF EXISTS `kds_theme_ws_order_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_theme_ws_order_device` (
  `KdsThemeWsOrderDeviceID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `WorkstationID` int NOT NULL,
  `KdsThemeID` bigint NOT NULL,
  `OrderDeviceMask` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000000000000000000000000000',
  PRIMARY KEY (`KdsThemeWsOrderDeviceID`),
  KEY `IX_KDS_THEME_WS_ORDER_DEVICE2` (`HierStrucID`),
  KEY `IX_KDS_THEME_WS_ORDER_DEVICE3` (`KdsThemeID`),
  KEY `IX_KDS_THEME_WS_ORDER_DEVICE4` (`WorkstationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_toolbar_button`
--

DROP TABLE IF EXISTS `kds_toolbar_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_toolbar_button` (
  `KdsToolbarButtonID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `KdsToolbarStyleID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `ButtonBackgroundColor` int DEFAULT NULL,
  `ButtonForegroundColor` int DEFAULT NULL,
  `ButtonFunction` int NOT NULL,
  `LegendID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `Parameters` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SortOrder` int DEFAULT NULL,
  PRIMARY KEY (`KdsToolbarButtonID`),
  KEY `IX_KDS_TOOLBAR_BUTTON_2` (`KdsToolbarStyleID`),
  KEY `IX_KDS_TOOLBAR_BUTTON_m1` (`LegendID`),
  KEY `IX_KDS_TOOLBAR_BUTTON_m2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kds_toolbar_style`
--

DROP TABLE IF EXISTS `kds_toolbar_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kds_toolbar_style` (
  `KdsToolbarStyleID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `ToolBarBackgroundColor` int NOT NULL,
  `ButtonHeight` int NOT NULL,
  `ButtonWidth` int NOT NULL,
  `LangID` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`KdsToolbarStyleID`),
  KEY `IX_KDS_TOOLBAR_STYLE_2` (`LangID`),
  KEY `IX_KDS_TOOLBAR_STYLE_m1` (`HierStrucID`),
  KEY `IX_KDS_TOOLBAR_STYLE_m2` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `key_db_info`
--

DROP TABLE IF EXISTS `key_db_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `key_db_info` (
  `KeyDBInfoID` int NOT NULL AUTO_INCREMENT,
  `KeyDBIdx` int NOT NULL,
  `KeyDBVer` int NOT NULL,
  PRIMARY KEY (`KeyDBInfoID`),
  KEY `KeyDBInfoID` (`KeyDBInfoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `labor_data`
--

DROP TABLE IF EXISTS `labor_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labor_data` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Type` smallint NOT NULL,
  `TypeExt` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `TypeID1` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `TypeID2` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `TypeID3` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `DateTime1` datetime(3) DEFAULT NULL,
  `DateTime2` datetime(3) DEFAULT NULL,
  `Data` longblob,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`),
  KEY `IX_LABOR_DATA_32001` (`Type`,`TypeExt`,`TypeID1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `labor_punches`
--

DROP TABLE IF EXISTS `labor_punches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labor_punches` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Type` smallint NOT NULL,
  `TypeExt` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `PayrollID` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `AuthPayrollID` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `ClockInOutStatus` smallint NOT NULL,
  `JobCode` int DEFAULT NULL,
  `RevenueCenter` int DEFAULT NULL,
  `CashTips` decimal(21,4) DEFAULT NULL,
  `IndirectTips` decimal(21,4) DEFAULT NULL,
  `Time` datetime(3) DEFAULT NULL,
  `ClockIn` bit(1) DEFAULT NULL,
  `SelectedBreak` longblob,
  `ShiftNumber` int DEFAULT NULL,
  `OtherStoresClockedIn` longblob,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`),
  KEY `IX_LABOR_PUNCHES_32001` (`Type`,`TypeExt`,`PayrollID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language_information`
--

DROP TABLE IF EXISTS `language_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_information` (
  `LangID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `DotChar` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CommaChar` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Digits` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TrnFile` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `OpsDisplayCfg` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `UserDisplayCfg` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PrintingFont` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `FontSize` int NOT NULL,
  `LineSpacing` int NOT NULL,
  `LeftMargin` int NOT NULL,
  `KeyboardLayout` int DEFAULT NULL,
  `LocaleString` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ImpactFontID1` int NOT NULL,
  `ImpactFontID2` int NOT NULL,
  `ThermalFontID1` int NOT NULL,
  `ThermalFontID2` int NOT NULL,
  `LocaleID` int NOT NULL,
  `CompareFlags` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `AltTrnFile` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `WsReportsLogonName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `WsReportsPassword` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `WsReportsLanguage` varchar(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LCDCustomerDisplayFont` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `POSAlphaNumericKeyboardNum` smallint DEFAULT NULL,
  PRIMARY KEY (`LangID`),
  UNIQUE KEY `AK_LANGUAGE_INFORMATION` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_LANGUAGE_INFORMATION_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language_information_text`
--

DROP TABLE IF EXISTS `language_information_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_information_text` (
  `LanguageInformationTextID` int NOT NULL,
  `HierStrucID` bigint DEFAULT NULL,
  `LangID` int DEFAULT NULL,
  `TextType` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TextFile` longblob,
  `Description` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `IsTranslation` bit(1) NOT NULL DEFAULT b'0',
  `Version` int NOT NULL DEFAULT '1',
  `LastUpdatedDateTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`LanguageInformationTextID`),
  KEY `IX_LANG_INFORMATION_TXT2` (`HierStrucID`),
  KEY `IX_LANG_INFORMATION_TXT3` (`LangID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_LANGUAGE_INFORMATION_TEXT_LastUpdatedDateTime` BEFORE INSERT ON `language_information_text` FOR EACH ROW BEGIN
IF new.LastUpdatedDateTime IS NULL THEN
SET new.LastUpdatedDateTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `language_property`
--

DROP TABLE IF EXISTS `language_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_property` (
  `LangPropertyID` int NOT NULL,
  `LangID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `LangIndex` int NOT NULL,
  `Is2ndPrintLang` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`LangPropertyID`),
  KEY `IX_LANGUAGE_PROPERTY_2` (`HierStrucID`),
  KEY `IX_LANGUAGE_PROPERTY_3` (`LangID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locale_information`
--

DROP TABLE IF EXISTS `locale_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locale_information` (
  `LocaleInfoID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `NameID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `DecimalSeparator` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ThousandsSeparator` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`LocaleInfoID`),
  UNIQUE KEY `AK_LOCALE_INFORMATION` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_LOCALE_INFORMATION_2` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loyalty_config`
--

DROP TABLE IF EXISTS `loyalty_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyalty_config` (
  `LoyaltyConfigID` bigint NOT NULL,
  `HierStrucID` bigint DEFAULT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000',
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`LoyaltyConfigID`),
  KEY `IX_LOYALTY_CONFIG2` (`HierStrucID`),
  KEY `IX_LOYALTY_CONFIG3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loyalty_provider`
--

DROP TABLE IF EXISTS `loyalty_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyalty_provider` (
  `LoyaltyProviderID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `ProviderReference` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `InterfaceType` smallint DEFAULT NULL,
  `InterfaceTypeObjNum` int DEFAULT NULL,
  `LoyaltyRecords` smallint DEFAULT NULL,
  `LoyaltyRecordsObjNum` int DEFAULT NULL,
  `ModuleType` smallint DEFAULT NULL,
  `ModuleTypeObjNum` int DEFAULT NULL,
  PRIMARY KEY (`LoyaltyProviderID`),
  KEY `IX_LOYALTY_PROVIDER_REF` (`ProviderReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `macro`
--

DROP TABLE IF EXISTS `macro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `macro` (
  `MacroID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`MacroID`),
  UNIQUE KEY `AK_MACRO` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_MACRO_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `macro_step`
--

DROP TABLE IF EXISTS `macro_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `macro_step` (
  `MacroStepID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `MacroID` int NOT NULL,
  `StepNumber` int NOT NULL,
  `KeyType` int DEFAULT NULL,
  `KeyNumber` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `MainLevelIndex` int DEFAULT NULL,
  `SubLevelIndex` int DEFAULT NULL,
  PRIMARY KEY (`MacroStepID`),
  KEY `IX_MACRO_STEP` (`HierStrucID`,`MacroID`,`StepNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `main_menu_level`
--

DROP TABLE IF EXISTS `main_menu_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_menu_level` (
  `MainMenuLvlID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `MenuLvlIndex` smallint NOT NULL,
  `PrefixID` bigint NOT NULL,
  `NameID` bigint NOT NULL,
  `SuffixID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `LastPostingTime` datetime(3) DEFAULT NULL,
  `EntryType` smallint DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`MainMenuLvlID`),
  KEY `IX_MAIN_MENU_LEVEL` (`HierStrucID`),
  KEY `IX_MAIN_MENU_LEVEL_1000` (`LastPostingTime`),
  KEY `IX_MAIN_MENU_LEVEL_m1` (`PrefixID`),
  KEY `IX_MAIN_MENU_LEVEL_m2` (`SuffixID`),
  KEY `IX_MAIN_MENU_LEVEL_m3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_MAIN_MENU_LEVEL_LastPostingTime` BEFORE INSERT ON `main_menu_level` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `major_group`
--

DROP TABLE IF EXISTS `major_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major_group` (
  `MajGrpID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `ReportGroup` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `MajorGroupPostingTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`MajGrpID`),
  UNIQUE KEY `AK_MAJOR_GROUP` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_MAJOR_GROUP_1` (`MajorGroupPostingTime`),
  KEY `IX_MAJOR_GROUP_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_MAJOR_GROUP_MajorGroupPostingTime` BEFORE INSERT ON `major_group` FOR EACH ROW BEGIN
IF new.MajorGroupPostingTime IS NULL THEN
SET new.MajorGroupPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `menu_item_class`
--

DROP TABLE IF EXISTS `menu_item_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_class` (
  `MenuItemClassID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(96) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TransDfltMain` bit(1) NOT NULL,
  `TransDfltSub` bit(1) NOT NULL,
  `PrintOptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '00000000',
  `PrintGroup` smallint NOT NULL,
  `PrivilegeGroup` smallint DEFAULT NULL,
  `DscntItmzrIndex` int DEFAULT NULL,
  `SvcChgItmzrIndex` int DEFAULT NULL,
  `Halo` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `LastPostingTime` datetime(3) DEFAULT NULL,
  `TempConfiguration` longtext,
  `CondimentOrderingType` smallint DEFAULT NULL,
  `TaxClassObjNum` int DEFAULT NULL,
  `SlsItmzrIndex` smallint DEFAULT NULL,
  `MainMenuLvlIndex` smallint DEFAULT NULL,
  `SubMenuLvlIndex` smallint DEFAULT NULL,
  `DefaultMasterGroupObjNum` int DEFAULT NULL,
  `CountEntryType` smallint DEFAULT NULL,
  `CountDisplayType` smallint DEFAULT NULL,
  `PricingCalculation` smallint DEFAULT NULL,
  `MemberOfCondiments` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  `RequiredCondiments` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  `AllowedCondiments` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  `RoutingGroupObjNum` int DEFAULT NULL,
  `KdsCourseNum` int DEFAULT NULL,
  `PrintClassObjNum` int DEFAULT NULL,
  `NextPage` int DEFAULT NULL,
  `NextPanel` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CondimentPrefixType` smallint DEFAULT NULL,
  `DefaultOrderTypeIndex` int DEFAULT NULL,
  `KdsHighlightSchemeObjNum` int DEFAULT NULL,
  `MaxRefillCount` int DEFAULT NULL,
  `RefillDescriptorID` bigint DEFAULT NULL,
  `PopupCondOrderPageObjNum` int DEFAULT NULL,
  `PopupCondEditPageObjNum` int DEFAULT NULL,
  `ServiceChargeGroupObjNum` int DEFAULT NULL,
  `PreProdChitPrintClassObjNum` int DEFAULT NULL,
  `AllergenClassObjNum` int DEFAULT NULL,
  `CondimentHandling` smallint DEFAULT NULL,
  PRIMARY KEY (`MenuItemClassID`),
  UNIQUE KEY `AK_MENU_ITEM_CLASS` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_MENU_ITEM_CLASS_1` (`NameID`),
  KEY `IX_MENU_ITEM_CLASS_1000` (`LastPostingTime`),
  KEY `IX_MENU_ITEM_CLASS_2` (`RefillDescriptorID`),
  KEY `IX_MENU_ITEM_CLASS_2001` (`TaxClassObjNum`),
  KEY `IX_MENU_ITEM_CLASS_m1` (`HierStrucID`,`MenuItemClassID`),
  KEY `IX_MENU_ITEM_CLASS_m2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_MENU_ITEM_CLASS_LastPostingTime` BEFORE INSERT ON `menu_item_class` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `menu_item_component`
--

DROP TABLE IF EXISTS `menu_item_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_component` (
  `MenuItemComponentID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `MenuItemDefID` bigint NOT NULL,
  `ObjectNumber` bigint NOT NULL,
  `MenuItemObjNum` int NOT NULL,
  `MenuItemDefSeqNum` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MenuItemComponentID`),
  KEY `MenuItemComponentID` (`MenuItemComponentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_item_default_condiment`
--

DROP TABLE IF EXISTS `menu_item_default_condiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_default_condiment` (
  `MenuItemDefaultCondID` bigint NOT NULL,
  `DefLevelOverride` smallint DEFAULT NULL,
  `SortGroup` smallint DEFAULT NULL,
  `PriceLevelOverride` smallint DEFAULT NULL,
  `TempConfiguration` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  `MenuItemDefID` bigint NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `CondimentSetObjNum` int DEFAULT NULL,
  PRIMARY KEY (`MenuItemDefaultCondID`),
  KEY `IX_MENU_ITEM_DEFAULT_CONDMNT_2` (`HierStrucID`),
  KEY `IX_MENU_ITEM_DEFAULT_CONDMNT_3` (`MenuItemDefID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_item_definition`
--

DROP TABLE IF EXISTS `menu_item_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_definition` (
  `MenuItemDefID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `MenuItemMasterID` int NOT NULL,
  `SequenceNum` int NOT NULL,
  `Name1ID` bigint NOT NULL,
  `Name2ID` bigint NOT NULL,
  `SluSort` int DEFAULT NULL,
  `NluNumber` bigint DEFAULT NULL,
  `Tare` decimal(15,8) DEFAULT NULL,
  `Surcharge` decimal(21,4) DEFAULT NULL,
  `IconNumber` int DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SpecialCount` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `PrepTime` int DEFAULT NULL,
  `MenuItemDefinitionPostingTime` datetime(3) DEFAULT NULL,
  `Name3ID` bigint DEFAULT NULL,
  `LongDescriptorID` bigint DEFAULT NULL,
  `TempConfiguration` longtext,
  `MenuItemClassObjNum` int DEFAULT NULL,
  `NluGroupIndex` int DEFAULT NULL,
  `SluIndex` int DEFAULT NULL,
  `HhtSluIndex` int DEFAULT NULL,
  `MainLvl` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `SubLvl` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `PosRef` bigint DEFAULT NULL,
  `SluGroupNum` int DEFAULT NULL,
  `PrintClassObjNum` int DEFAULT NULL,
  `PrefixLevelOverride` int NOT NULL DEFAULT '0',
  `GuestCount` int DEFAULT NULL,
  `Slu2` int DEFAULT NULL,
  `Slu3` int DEFAULT NULL,
  `Slu4` int DEFAULT NULL,
  `Slu5` int DEFAULT NULL,
  `Slu6` int DEFAULT NULL,
  `Slu7` int DEFAULT NULL,
  `Slu8` int DEFAULT NULL,
  `Quantity` int NOT NULL DEFAULT '1',
  `AllergenClassObjNum` int DEFAULT NULL,
  `ConsumerAdvisoryDesc` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CapacityUsage` int NOT NULL DEFAULT '0',
  `ConsumerAdvDescID` bigint DEFAULT NULL,
  PRIMARY KEY (`MenuItemDefID`),
  KEY `IX_MENU_ITEM_DEFINITION` (`HierStrucID`,`MenuItemMasterID`,`SequenceNum`),
  KEY `IX_MENU_ITEM_DEFINITION_01` (`MenuItemMasterID`),
  KEY `IX_MENU_ITEM_DEFINITION_2` (`MenuItemDefinitionPostingTime`),
  KEY `IX_MENU_ITEM_DEFINITION_2002` (`HierStrucID`,`PosRef`),
  KEY `IX_MENU_ITEM_DEFINITION_m1` (`SequenceNum`,`HierStrucID`,`MenuItemDefID`,`MenuItemMasterID`),
  KEY `IX_MENU_ITEM_DEFINITION_m4` (`Name1ID`),
  KEY `IX_MENU_ITEM_DEFINITION_m5` (`Name2ID`),
  KEY `IX_MENU_ITEM_DEFINITION_m6` (`LongDescriptorID`),
  KEY `IX_MENU_ITEM_DEFINITION_m7` (`Name3ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_MENU_ITEM_DEFINITION_MenuItemDefinitionPostingTime` BEFORE INSERT ON `menu_item_definition` FOR EACH ROW BEGIN
IF new.MenuItemDefinitionPostingTime IS NULL THEN
SET new.MenuItemDefinitionPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `menu_item_definition_tag`
--

DROP TABLE IF EXISTS `menu_item_definition_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_definition_tag` (
  `MenuItemDefTagID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `MenuItemDefID` bigint NOT NULL,
  `MenuItemTagObjNum` bigint NOT NULL,
  `MenuItemObjNum` bigint NOT NULL,
  `MenuItemDefSeqNum` int NOT NULL,
  PRIMARY KEY (`MenuItemDefTagID`),
  KEY `IDXFK_MENUITEMDEFID_TAG` (`MenuItemDefID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_item_detail`
--

DROP TABLE IF EXISTS `menu_item_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_detail` (
  `CheckDetailID` bigint NOT NULL,
  `MenuItemDefID` bigint NOT NULL,
  `MenuItemPriceID` bigint DEFAULT NULL,
  `EmployeeID` bigint DEFAULT NULL,
  `OptionBits` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `NluIndex` smallint DEFAULT NULL,
  `NluNumber` bigint DEFAULT NULL,
  `PrintOptionBits` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `MainMenuLvlIndex` smallint NOT NULL,
  `SubMenuLvlIndex` smallint NOT NULL,
  `DscntItmzrID` int DEFAULT NULL,
  `SvcChgItmzrID` int DEFAULT NULL,
  `SlsItmzrIndex` smallint NOT NULL,
  `PrintGroup` smallint NOT NULL,
  `PrivilegeLevel` int DEFAULT NULL,
  `RecipeNameID` int DEFAULT NULL,
  `SluIndex` int DEFAULT NULL,
  `VoidReasonID` int DEFAULT NULL,
  `PrepCost` decimal(21,4) DEFAULT NULL,
  `Surcharge` decimal(21,4) DEFAULT NULL,
  `Weight` decimal(15,8) DEFAULT NULL,
  `PrepTime` int DEFAULT NULL,
  `IsDefault` bit(1) NOT NULL DEFAULT b'0',
  `RelativeCount` decimal(20,10) DEFAULT NULL,
  `DefaultCount` int DEFAULT NULL,
  `TaxRates` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CustomLevelObjNum1` tinyint unsigned DEFAULT NULL,
  `CustomLevel1` tinyint unsigned DEFAULT NULL,
  `CustomLevelObjNum2` tinyint unsigned DEFAULT NULL,
  `CustomLevel2` tinyint unsigned DEFAULT NULL,
  `CustomLevelObjNum3` tinyint unsigned DEFAULT NULL,
  `CustomLevel3` tinyint unsigned DEFAULT NULL,
  `CustomLevelObjNum4` tinyint unsigned DEFAULT NULL,
  `CustomLevel4` tinyint unsigned DEFAULT NULL,
  `CustomLevelObjNum5` tinyint unsigned DEFAULT NULL,
  `CustomLevel5` tinyint unsigned DEFAULT NULL,
  `CustomLevelObjNum6` tinyint unsigned DEFAULT NULL,
  `CustomLevel6` tinyint unsigned DEFAULT NULL,
  `CustomLevelObjNum7` tinyint unsigned DEFAULT NULL,
  `CustomLevel7` tinyint unsigned DEFAULT NULL,
  `CustomLevelObjNum8` tinyint unsigned DEFAULT NULL,
  `CustomLevel8` tinyint unsigned DEFAULT NULL,
  `HasMoreCustomeLevels` tinyint unsigned DEFAULT '1',
  `MenuItemDtlID` bigint NOT NULL,
  `ComboGroupObjNum` int DEFAULT NULL,
  `ComboNum` smallint DEFAULT NULL,
  `ComboSideNum` smallint DEFAULT NULL,
  `ComboMealSize` smallint DEFAULT NULL,
  `ComboSideID` int DEFAULT NULL,
  `ComboGroupSideObjNum` int DEFAULT NULL,
  `CondimentPrefixType` smallint DEFAULT NULL,
  `OrderTypeId` int DEFAULT NULL,
  `TareWeight` decimal(15,8) DEFAULT NULL,
  `RefillDetailID` int DEFAULT NULL,
  `DefSequenceNum` int DEFAULT NULL,
  `AutoFireTime` datetime(3) DEFAULT NULL,
  `OrderDeviceSentTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`MenuItemDtlID`),
  UNIQUE KEY `AK_MENU_ITEM_DETAIL` (`CheckDetailID`),
  KEY `IX_MENU_ITEM_DETAIL_10` (`ComboSideID`),
  KEY `IX_MENU_ITEM_DETAIL_11` (`OrderTypeId`),
  KEY `IX_MENU_ITEM_DETAIL_12` (`SluIndex`),
  KEY `IX_MENU_ITEM_DETAIL_3` (`EmployeeID`),
  KEY `IX_MENU_ITEM_DETAIL_8` (`MenuItemDefID`),
  KEY `IX_MENU_ITEM_DETAIL_9` (`MenuItemPriceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_item_dtl_menu_level`
--

DROP TABLE IF EXISTS `menu_item_dtl_menu_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_dtl_menu_level` (
  `MenuItemDtlMenuLevelID` bigint NOT NULL AUTO_INCREMENT,
  `MenuLvlNumber` smallint NOT NULL,
  `MenuLvlIndex` smallint NOT NULL,
  `MenuItemDtlID` bigint NOT NULL,
  KEY `MenuItemDtlMenuLevelID` (`MenuItemDtlMenuLevelID`),
  KEY `IX_MENU_ITEM_DTL_MENU_LVL_2` (`MenuItemDtlID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_item_group`
--

DROP TABLE IF EXISTS `menu_item_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_group` (
  `MenuItemGroupID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `MenuItemGroupComment` longtext,
  `Threshold` int DEFAULT NULL,
  `TaxClassObjNum` int DEFAULT NULL,
  `GroupType` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`MenuItemGroupID`),
  UNIQUE KEY `AK_MENU_ITEM_GROUP` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_MENU_ITEM_GROUP_2` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_item_group_detail`
--

DROP TABLE IF EXISTS `menu_item_group_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_group_detail` (
  `MenuItemGroupDetailID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `MenuItemGroupID` int NOT NULL,
  `GroupType` int DEFAULT NULL,
  `Exclude` bit(1) NOT NULL DEFAULT b'0',
  `StartObjectNumber` int DEFAULT NULL,
  `EndObjectNumber` int DEFAULT NULL,
  `PromotionPrice` decimal(21,6) DEFAULT NULL,
  `SeqNo` smallint DEFAULT NULL,
  PRIMARY KEY (`MenuItemGroupDetailID`),
  KEY `IX_MENU_ITEM_GROUP_DETAIL_2` (`HierStrucID`),
  KEY `IX_MENU_ITEM_GROUP_DETAIL_3` (`MenuItemGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_item_master`
--

DROP TABLE IF EXISTS `menu_item_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_master` (
  `MenuItemMasterID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `ReportGroup` int DEFAULT '1',
  `Status` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `RecipeLinkID` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `MenuItemMasterPostingTime` datetime(3) DEFAULT NULL,
  `TempConfiguration` longtext,
  `FamGrpObjNum` int DEFAULT NULL,
  `MajGrpObjNum` int DEFAULT NULL,
  `MasterGrpObjNum` int DEFAULT NULL,
  `Name2ID` bigint DEFAULT NULL,
  PRIMARY KEY (`MenuItemMasterID`),
  UNIQUE KEY `AK_MENU_ITEM_MASTER` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_MENU_ITEM_MASTER_1` (`IsVisible`,`IsDeleted`,`MenuItemMasterID`,`ObjectNumber`),
  KEY `IX_MENU_ITEM_MASTER_1000` (`MenuItemMasterPostingTime`),
  KEY `IX_MENU_ITEM_MASTER_1200` (`ObjectNumber`),
  KEY `IX_MENU_ITEM_MASTER_2` (`RecipeLinkID`),
  KEY `IX_MENU_ITEM_MASTER_m1` (`ObjectNumber`,`HierStrucID`,`MenuItemMasterID`),
  KEY `IX_MENU_ITEM_MASTER_m2` (`HierStrucID`,`NameID`),
  KEY `IX_MENU_ITEM_MASTER_m3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_MENU_ITEM_MASTER_MenuItemMasterPostingTime` BEFORE INSERT ON `menu_item_master` FOR EACH ROW BEGIN
IF new.MenuItemMasterPostingTime IS NULL THEN
SET new.MenuItemMasterPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `menu_item_master_eff`
--

DROP TABLE IF EXISTS `menu_item_master_eff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_master_eff` (
  `MenuItemMasterEffID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `MenuItemMasterID` int NOT NULL,
  `MenuItemMasterObjNum` int DEFAULT NULL,
  `ChangeSetObjNum` int DEFAULT NULL,
  PRIMARY KEY (`MenuItemMasterEffID`),
  KEY `IX_MIMASTER_EFF_HSID` (`HierStrucID`),
  KEY `IX_MIMASTER_EFF_MASTER` (`MenuItemMasterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_item_master_group`
--

DROP TABLE IF EXISTS `menu_item_master_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_master_group` (
  `MenuItemMasterGroupID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `TempConfiguration` longtext,
  `NameID` bigint DEFAULT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  `SluIndex` int DEFAULT NULL,
  PRIMARY KEY (`MenuItemMasterGroupID`),
  UNIQUE KEY `AK_MENU_ITEM_MASTER_GROUP_1` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_MENU_ITEM_MASTER_GROUP_2` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_item_master_tag`
--

DROP TABLE IF EXISTS `menu_item_master_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_master_tag` (
  `MenuItemMasterTagId` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `MenuItemMasterId` int NOT NULL,
  `MenuItemObjNum` bigint NOT NULL,
  `MenuItemTagObjNum` bigint NOT NULL,
  PRIMARY KEY (`MenuItemMasterTagId`),
  KEY `IX_MI_MASTER_TAG_MIOBJNUM` (`MenuItemObjNum`),
  KEY `IX_MI_MASTER_TAG_MITAGOBJNUM` (`MenuItemTagObjNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_item_menu_level_entry`
--

DROP TABLE IF EXISTS `menu_item_menu_level_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_menu_level_entry` (
  `MenuItemMenuLevelEntryID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `HierStrucID` bigint NOT NULL,
  `MenuItemDefID` bigint NOT NULL,
  `MenuLvlEntryIndex` int NOT NULL DEFAULT '0',
  `MenuLevelObjNum` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MenuItemMenuLevelEntryID`),
  KEY `IX_MENU_ITEM_MENU_LVL_ENTRY_2` (`HierStrucID`),
  KEY `IX_MENU_ITEM_MENU_LVL_ENTRY_3` (`MenuItemDefID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_item_nutrient_set`
--

DROP TABLE IF EXISTS `menu_item_nutrient_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_nutrient_set` (
  `MenuItemNutrientSetId` bigint NOT NULL,
  `NutrientSetObjNum` int DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  `MenuItemDefId` bigint NOT NULL,
  PRIMARY KEY (`MenuItemNutrientSetId`),
  KEY `IDXFK_MENUITEMDEFID_NSET` (`MenuItemDefId`),
  KEY `IX_MI_NUTSET_HS` (`HierStrucID`),
  KEY `IX_NUTSTNUT_NTRSTID` (`NutrientSetObjNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_item_price`
--

DROP TABLE IF EXISTS `menu_item_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_price` (
  `MenuItemPriceID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `MenuItemDefID` bigint NOT NULL,
  `SequenceNum` int NOT NULL,
  `MenuLvlIndex` int DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Price` decimal(21,4) DEFAULT NULL,
  `PrepCost` decimal(21,4) DEFAULT NULL,
  `RecipeNameID` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `MenuItemPricePostingTime` datetime(3) DEFAULT NULL,
  `PriceGroupID` int DEFAULT NULL,
  `TempConfiguration` longtext,
  `TaxClassObjNum` int DEFAULT NULL,
  `ChangeSetObjNum` int DEFAULT NULL,
  `PosRef` bigint DEFAULT NULL,
  `ServiceChargeGroupObjNum` int DEFAULT NULL,
  `ParentTaxClassOvrdObjNmbr` int DEFAULT NULL,
  PRIMARY KEY (`MenuItemPriceID`),
  UNIQUE KEY `AK_MENU_ITEM_PRICE` (`HierStrucID`,`MenuItemDefID`,`SequenceNum`,`ChangeSetObjNum`),
  KEY `IX_MENU_ITEM_PRICE_01` (`MenuItemDefID`,`IsVisible`,`HierStrucID`,`SequenceNum`),
  KEY `IX_MENU_ITEM_PRICE_2` (`MenuItemPricePostingTime`),
  KEY `IX_MENU_ITEM_PRICE_2002` (`HierStrucID`,`PosRef`),
  KEY `IX_MENU_ITEM_PRICE_5` (`PriceGroupID`),
  KEY `IX_MENU_ITEM_PRICE_6` (`RecipeNameID`),
  KEY `IX_MENU_ITEM_PRICE_m1` (`HierStrucID`,`SequenceNum`,`MenuItemDefID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_MENU_ITEM_PRICE_MenuItemPricePostingTime` BEFORE INSERT ON `menu_item_price` FOR EACH ROW BEGIN
IF new.MenuItemPricePostingTime IS NULL THEN
SET new.MenuItemPricePostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `menu_item_production_item`
--

DROP TABLE IF EXISTS `menu_item_production_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_production_item` (
  `MenuItemProdItemID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `MenuItemDefID` bigint NOT NULL,
  `ProductionItemObjNum` int NOT NULL,
  `ProductionCount` decimal(5,2) DEFAULT NULL,
  `MenuItemObjNum` int NOT NULL,
  `MenuItemDefSeqNum` int NOT NULL,
  PRIMARY KEY (`MenuItemProdItemID`),
  KEY `IX_MENU_ITEM_PRODUCTION_ITEM2` (`HierStrucID`),
  KEY `IX_MENU_ITEM_PRODUCTION_ITEM3` (`MenuItemDefID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_level`
--

DROP TABLE IF EXISTS `menu_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_level` (
  `MenuLevelID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `MenuLevelType` smallint DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `HierStrucID` bigint NOT NULL,
  `NameID` bigint DEFAULT NULL,
  `TempConfiguration` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DefaultMasterGroupObjNum` int DEFAULT NULL,
  PRIMARY KEY (`MenuLevelID`),
  UNIQUE KEY `AK_MENU_LEVEL_1` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_MENU_LEVEL_3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_level_entry`
--

DROP TABLE IF EXISTS `menu_level_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_level_entry` (
  `MenuLevelEntryID` int NOT NULL,
  `MenuLvlIndex` int NOT NULL,
  `PrefixID` bigint DEFAULT NULL,
  `SuffixID` bigint DEFAULT NULL,
  `EntryType` smallint DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `HierStrucID` bigint NOT NULL,
  `MenuLevelID` bigint NOT NULL,
  `NameID` bigint DEFAULT NULL,
  `TempConfiguration` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`MenuLevelEntryID`),
  KEY `IX_MENU_LEVEL_ENTRY_2` (`HierStrucID`),
  KEY `IX_MENU_LEVEL_ENTRY_3` (`MenuLevelID`),
  KEY `IX_MENU_LEVEL_ENTRY_4` (`NameID`),
  KEY `IX_MENU_LEVEL_ENTRY_5` (`PrefixID`),
  KEY `IX_MENU_LEVEL_ENTRY_6` (`SuffixID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menuitmcondimntprptme`
--

DROP TABLE IF EXISTS `menuitmcondimntprptme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitmcondimntprptme` (
  `PrepTimeOverrideID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `MenuItemObjNum` int NOT NULL,
  `MenuItemDefSeqNum` int NOT NULL,
  `MenuItemDefID` bigint NOT NULL,
  `CondimentObjNum` int NOT NULL,
  `CondimentDefSeqNum` int NOT NULL,
  `CondimentDefID` bigint NOT NULL,
  `PrepTime` int NOT NULL,
  PRIMARY KEY (`PrepTimeOverrideID`),
  KEY `PrepTimeOverrideID` (`PrepTimeOverrideID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mrequest_data`
--

DROP TABLE IF EXISTS `mrequest_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mrequest_data` (
  `RID` varchar(64) NOT NULL,
  `ReqDataTime` datetime(3) DEFAULT NULL,
  `CheckID` bigint DEFAULT NULL,
  `Data1` bigint DEFAULT NULL,
  `ReqData` longblob,
  `DataGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
  `HierStrucId` bigint DEFAULT NULL,
  `OrganizationID` bigint DEFAULT NULL,
  `RecordType` int DEFAULT NULL,
  PRIMARY KEY (`RID`),
  KEY `IX_MREQUEST_DATA_ID` (`ID`),
  KEY `IX_MREQUESTDATA_2` (`ReqDataTime`),
  KEY `IX_MREQUESTDATA_3` (`DataGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_MREQUEST_DATA_ReqDataTime` BEFORE INSERT ON `mrequest_data` FOR EACH ROW BEGIN
IF new.ReqDataTime IS NULL THEN
SET new.ReqDataTime = utc_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mrequest_response`
--

DROP TABLE IF EXISTS `mrequest_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mrequest_response` (
  `RID` varchar(64) NOT NULL,
  `RespTime` datetime(3) DEFAULT NULL,
  `RespData` longblob,
  `ID` bigint DEFAULT NULL,
  PRIMARY KEY (`RID`),
  KEY `IX_MQREQUEST_RESPONSE_2` (`RespTime`),
  KEY `IX_MREQUEST_RESPONSE_ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_MREQUEST_RESPONSE_RespTime` BEFORE INSERT ON `mrequest_response` FOR EACH ROW BEGIN
IF new.RespTime IS NULL THEN
SET new.RespTime = utc_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mrequests`
--

DROP TABLE IF EXISTS `mrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mrequests` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `RID` varchar(64) NOT NULL,
  `ReqTime` datetime(3) NOT NULL,
  `ReqState` tinyint unsigned NOT NULL,
  `RecordType` int NOT NULL,
  `Data1` bigint DEFAULT NULL,
  `ServiceID` int DEFAULT NULL,
  `FirstRequestTime` datetime(3) DEFAULT NULL,
  `OfflinePosting` bit(1) DEFAULT NULL,
  `ServiceHostInfo` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TelemetryInfo` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PostedToChannelManagement` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_MREQUESTS_RID` (`RID`),
  KEY `ID` (`ID`),
  KEY `IX_MREQUESTS_2` (`ReqTime`,`ReqState`)
) ENGINE=InnoDB AUTO_INCREMENT=542305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mrequests_bak`
--

DROP TABLE IF EXISTS `mrequests_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mrequests_bak` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `RecordType` int NOT NULL,
  `RID` varchar(64) NOT NULL,
  `ReqTime` datetime(3) NOT NULL,
  `CheckID` bigint DEFAULT NULL,
  `Data1` bigint DEFAULT NULL,
  `DataGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ReqData` longblob,
  `ServiceID` int DEFAULT NULL,
  `FirstRequestTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_MREQUESTS_BAK` (`RID`),
  KEY `ID` (`ID`),
  KEY `IX_MREQUESTS_BAK` (`ReqTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mrequests_bak_send`
--

DROP TABLE IF EXISTS `mrequests_bak_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mrequests_bak_send` (
  `LastSentID` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `multimedia`
--

DROP TABLE IF EXISTS `multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multimedia` (
  `MediaID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `MediaType` smallint NOT NULL,
  PRIMARY KEY (`MediaID`),
  KEY `IX_MULTIMEDIA_2` (`NameID`),
  KEY `IX_MULTIMEDIA_3` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `multimedia_data`
--

DROP TABLE IF EXISTS `multimedia_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multimedia_data` (
  `MediaDataID` int NOT NULL,
  `MediaID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `LangID` int NOT NULL,
  `MediaData` longblob,
  PRIMARY KEY (`MediaDataID`),
  KEY `IX_MULTIMEDIA_DATA_1` (`MediaID`),
  KEY `IX_MULTIMEDIA_DATA_2` (`HierStrucID`),
  KEY `IX_MULTIMEDIA_DATA_3` (`LangID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `netvupoint_config`
--

DROP TABLE IF EXISTS `netvupoint_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `netvupoint_config` (
  `NetvupointConfigId` int NOT NULL,
  `HierStrucId` bigint NOT NULL,
  `MonthsToSaveData` int NOT NULL DEFAULT '0',
  `LocationId` int NOT NULL,
  `OrganizationId` int NOT NULL,
  `LanguageId` int NOT NULL,
  `NextTransNumber` bigint DEFAULT NULL,
  `MaxJournalRecords` int DEFAULT NULL,
  `LocRef` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`NetvupointConfigId`),
  UNIQUE KEY `AK_NETVUPOINT_CONFIG` (`HierStrucId`,`LocationId`,`OrganizationId`,`LanguageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `number_lookup`
--

DROP TABLE IF EXISTS `number_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `number_lookup` (
  `NluID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `NluIndex` smallint NOT NULL,
  `NameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `LastPostingTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`NluID`),
  KEY `IX_NUMBER_LOOKUP` (`HierStrucID`),
  KEY `IX_NUMBER_LOOKUP_1000` (`LastPostingTime`),
  KEY `IX_NUMBER_LOOKUP_m1` (`NluIndex`,`NluID`),
  KEY `IX_NUMBER_LOOKUP_m2` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_NUMBER_LOOKUP_LastPostingTime` BEFORE INSERT ON `number_lookup` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nutrient_set`
--

DROP TABLE IF EXISTS `nutrient_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutrient_set` (
  `NutrientSetId` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `NameID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`NutrientSetId`),
  KEY `IX_NUTRN_SET_HSID` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_NUTRN_SET_NAMEID` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nutrient_set_nutrient`
--

DROP TABLE IF EXISTS `nutrient_set_nutrient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutrient_set_nutrient` (
  `NutrientSetNutrientId` bigint NOT NULL,
  `NutrientSetId` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `NutritionObjNumber` bigint DEFAULT NULL,
  `UnitOfMeasure` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`NutrientSetNutrientId`),
  KEY `IX_NUTSETNUT_HSID` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nutrition`
--

DROP TABLE IF EXISTS `nutrition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutrition` (
  `NutritionID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `NutritionIndex` int NOT NULL,
  `NameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `LastPostingTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`NutritionID`),
  KEY `IX_NUTRN_HIERSTRCID` (`HierStrucID`),
  KEY `IX_NUTRN_NAMEID` (`NameID`),
  KEY `IX_NUTRN_NTRNID` (`NutritionIndex`,`NutritionID`),
  KEY `IX_NUTRN_PSTNGTIME` (`LastPostingTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_NUTRITION_LastPostingTime` BEFORE INSERT ON `nutrition` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `oidc_conf_client_info`
--

DROP TABLE IF EXISTS `oidc_conf_client_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oidc_conf_client_info` (
  `ConfClientID` int NOT NULL,
  `ClientName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ClientID` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ClientSecret` longblob NOT NULL,
  `ClientScope` int DEFAULT NULL,
  `IssuedOn` datetime(3) DEFAULT NULL,
  `ServiceHostID` int DEFAULT NULL,
  `HierStrucID` bigint DEFAULT NULL,
  `EncryptionKeyID` bigint DEFAULT NULL,
  `AuthZRole` int DEFAULT NULL,
  `RegistrationAccessToken` longblob,
  `LastRotatedOn` datetime(3) DEFAULT NULL,
  `ClientSecretExpiresAt` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ConfClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `open_client_access_detail`
--

DROP TABLE IF EXISTS `open_client_access_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `open_client_access_detail` (
  `AccessID` int NOT NULL,
  `OpenClientUID` int NOT NULL,
  `AccessType` int NOT NULL DEFAULT '0',
  `ReferenceID` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  `IsDisabled` bit(1) NOT NULL DEFAULT b'0',
  `CreatedOn` datetime(3) DEFAULT NULL,
  `UpdatedOn` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`AccessID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `open_client_user_info`
--

DROP TABLE IF EXISTS `open_client_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `open_client_user_info` (
  `OpenClientUID` int NOT NULL,
  `UserUID` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ClientName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ClientID` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ClientScope` int NOT NULL DEFAULT '0',
  `IsUserDisabled` bit(1) NOT NULL DEFAULT b'0',
  `IsClientDisabled` bit(1) NOT NULL DEFAULT b'0',
  `TenantID` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CreatedOn` datetime(3) DEFAULT NULL,
  `UpdatedOn` datetime(3) DEFAULT NULL,
  `OrgShortName` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `HierStrucID` bigint DEFAULT NULL,
  `AuthZRole` int DEFAULT NULL,
  `IsTerminated` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`OpenClientUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `operator`
--

DROP TABLE IF EXISTS `operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operator` (
  `OperatorID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `EmployeeID` bigint NOT NULL,
  `OptionBits` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CashierID` int DEFAULT NULL,
  `TrkGrpID` int DEFAULT NULL,
  `TableCount` int DEFAULT NULL,
  `CashDrawer` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `OverrideEmpClassOptions` bit(1) NOT NULL DEFAULT b'0',
  `EmployeeColor` int DEFAULT NULL,
  `CoverCount` int DEFAULT NULL,
  `CheckCount` int DEFAULT NULL,
  `LastPartyAssignment` datetime(3) DEFAULT NULL,
  `ServerEfficiency` int DEFAULT NULL,
  `ServerNextAvailableTime` datetime(3) DEFAULT NULL,
  `CMAccountingMethodID` int DEFAULT NULL,
  `ServerBankingTemplateObjNum` int DEFAULT NULL,
  `GroupEventDefDtlID` bigint DEFAULT NULL,
  PRIMARY KEY (`OperatorID`),
  UNIQUE KEY `AK_OPERATOR` (`HierStrucID`,`EmployeeID`),
  KEY `IX_OPERATOR` (`EmployeeID`),
  KEY `IX_OPERATOR_2` (`CashierID`),
  KEY `IX_OPERATOR_3` (`TrkGrpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `operator_touchscreen`
--

DROP TABLE IF EXISTS `operator_touchscreen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operator_touchscreen` (
  `OperTouchscrnID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `OperatorID` bigint NOT NULL,
  `DeviceType` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `TouchscreenObjNum` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`OperTouchscrnID`),
  KEY `IX_OPERATOR_TOUCHSCREEN` (`HierStrucID`,`OperatorID`),
  KEY `IX_OPERATOR_TOUCHSCREEN_m1` (`OperatorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_channel`
--

DROP TABLE IF EXISTS `order_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_channel` (
  `OrdChannelID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `LastPostingTime` datetime(3) DEFAULT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`OrdChannelID`),
  KEY `IX_ORDCHANNEL_HSID` (`HierStrucID`),
  KEY `IX_ORDCHANNEL_NAMEID` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_ORDER_CHANNEL_LastPostingTime` BEFORE INSERT ON `order_channel` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_channel_config`
--

DROP TABLE IF EXISTS `order_channel_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_channel_config` (
  `OrdChannelConfigID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `OrdChannelID` bigint NOT NULL,
  `OrderDeviceMask` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000000000000000000000000000',
  `KdsHighlightSchemeObjNum` int NOT NULL DEFAULT '0',
  `ServiceLevelTime` smallint DEFAULT NULL,
  `ServiceChargeObjNum` int NOT NULL DEFAULT '0',
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `OptionBits` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000000000000000000000000000',
  PRIMARY KEY (`OrdChannelConfigID`),
  KEY `IX_ORDCHANNELCONFIG_HSID` (`HierStrucID`),
  KEY `IX_ORDCHANNELCONFIG_OCHANNELID` (`OrdChannelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_device`
--

DROP TABLE IF EXISTS `order_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_device` (
  `OrderDeviceID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `OrdDvcIndex` smallint NOT NULL,
  `HeaderID` bigint NOT NULL,
  `OrdDvcType` smallint NOT NULL,
  `SortType` smallint DEFAULT NULL,
  `MaxChitLines` smallint DEFAULT NULL,
  `OptionBits` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `DeviceID` bigint DEFAULT NULL,
  `BackupDeviceID` bigint DEFAULT NULL,
  `RedirectOrderDeviceID` int DEFAULT NULL,
  `VduScreenConfig` smallint DEFAULT NULL,
  `VduOrderTimeout` int DEFAULT NULL,
  `VduOptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `LangID` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `KdsOrderDeviceParamsID` bigint DEFAULT NULL,
  `PrimaryType` smallint DEFAULT NULL,
  `PrimaryID` bigint DEFAULT NULL,
  `BackupType` smallint DEFAULT NULL,
  `BackupID` bigint DEFAULT NULL,
  `LastPostingTime` datetime(3) DEFAULT NULL,
  `LineFeedsBeforeOrder` int DEFAULT NULL,
  `LineFeedsAfterOrder` int DEFAULT NULL,
  `DOMType` smallint DEFAULT NULL,
  `CustomName` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PmcRedirectOrderDeviceID` int DEFAULT NULL,
  `PmcOptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `Lang2ID` int DEFAULT NULL,
  `Lang3ID` int DEFAULT NULL,
  `SecondaryBackupID` bigint DEFAULT NULL,
  `CondimentSortType` int NOT NULL DEFAULT '1',
  `MenuItemPrintingType` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`OrderDeviceID`),
  KEY `IX_ORDER_DEVICE` (`HierStrucID`),
  KEY `IX_ORDER_DEVICE_1000` (`LastPostingTime`),
  KEY `IX_ORDER_DEVICE_2` (`KdsOrderDeviceParamsID`),
  KEY `IX_ORDER_DEVICE_2005_L2` (`Lang2ID`),
  KEY `IX_ORDER_DEVICE_2005_L3` (`Lang3ID`),
  KEY `IX_ORDER_DEVICE_3` (`RedirectOrderDeviceID`),
  KEY `IX_ORDER_DEVICE_4` (`LangID`),
  KEY `IX_ORDER_DEVICE_m1` (`DeviceID`),
  KEY `IX_ORDER_DEVICE_m2` (`HeaderID`),
  KEY `IX_ORDER_DEVICE_m3` (`BackupDeviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_ORDER_DEVICE_LastPostingTime` BEFORE INSERT ON `order_device` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_type`
--

DROP TABLE IF EXISTS `order_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_type` (
  `OrdTypeID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `OrdTypeIndex` smallint NOT NULL,
  `NameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `OrderTypePostingTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`OrdTypeID`),
  KEY `IX_ORDER_TYPE` (`HierStrucID`),
  KEY `IX_ORDER_TYPE_2` (`OrderTypePostingTime`),
  KEY `IX_ORDER_TYPE_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_ORDER_TYPE_OrderTypePostingTime` BEFORE INSERT ON `order_type` FOR EACH ROW BEGIN
IF new.OrderTypePostingTime IS NULL THEN
SET new.OrderTypePostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_type_parameter`
--

DROP TABLE IF EXISTS `order_type_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_type_parameter` (
  `OrdTypParamID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `OptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `TaxMask` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000',
  `OrdTypeIndex` int NOT NULL,
  `OtIsActive` bit(1) NOT NULL DEFAULT b'0',
  `OrderDeviceMask` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000000000000000000000000000',
  `KdsHighlightSchemeID` int NOT NULL DEFAULT '0',
  `OrderMethodObjNum` int NOT NULL DEFAULT '0',
  `OverrideQuoteTime` int DEFAULT NULL,
  `ServiceLevelTime` smallint DEFAULT NULL,
  `TipPercent1` smallint NOT NULL DEFAULT '18',
  `TipPercent2` smallint NOT NULL DEFAULT '20',
  `TipPercent3` smallint NOT NULL DEFAULT '25',
  `TipAmount1` decimal(21,4) DEFAULT NULL,
  `TipAmount2` decimal(21,4) DEFAULT NULL,
  `TipAmount3` decimal(21,4) DEFAULT NULL,
  `OrdChannelObjNum` int DEFAULT NULL,
  PRIMARY KEY (`OrdTypParamID`),
  KEY `IX_ORDER_TYPE_PARAMETER` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `OrganizationID` bigint NOT NULL,
  `OrganizationName` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ReportingWSLogin` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ReportingWSPassword` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OrganizationShortName` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `LangID` int NOT NULL DEFAULT '1',
  `IsTemplate` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `HMCUserName` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `HMCPassword` longblob,
  `SuperOrganization` bit(1) DEFAULT b'0',
  `REPORTWSPASSENC` longblob,
  `EncryptionKeyID` bigint DEFAULT NULL,
  `IsDeleted` bit(1) DEFAULT NULL,
  `TenantID` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `IsSuperLite` bit(1) NOT NULL DEFAULT b'0',
  `EnableCnCAPI` bit(1) NOT NULL DEFAULT b'0',
  `IsGFInstance` bit(1) NOT NULL DEFAULT b'0',
  `EnablePMIntegration` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`OrganizationID`),
  UNIQUE KEY `UK_ORGANIZATION_TENANTID` (`TenantID`),
  KEY `IX_ORGANIZATION2` (`LangID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page` (
  `PageID` int NOT NULL,
  `ObjectNumber` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `HierStrucID` bigint DEFAULT NULL,
  `NameID` bigint DEFAULT NULL,
  `PageTemplateID` int DEFAULT NULL,
  `ChangeSetObjNum` int DEFAULT NULL,
  `TemplateType` int NOT NULL DEFAULT '1',
  `InternalTemplate` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TemplateConfiguration` longtext,
  `PageTemplateNum` int DEFAULT NULL,
  PRIMARY KEY (`PageID`),
  UNIQUE KEY `AK_PAGE` (`HierStrucID`,`ObjectNumber`,`ChangeSetObjNum`),
  KEY `IX_PAGE_NAME` (`NameID`),
  KEY `IX_PAGE_PAGETMPLTE` (`PageTemplateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_assignment`
--

DROP TABLE IF EXISTS `page_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_assignment` (
  `PageAssignmentID` int NOT NULL,
  `HierStrucID` bigint DEFAULT NULL,
  `DefaultSignInPageObjNum` int DEFAULT NULL,
  `DefaultTransactionPageObjNum` int DEFAULT NULL,
  `DefaultTrainingPageObjNum` int DEFAULT NULL,
  `DefaultInTransactionPageObjNum` int DEFAULT NULL,
  `DefaultWelcomePageObjNum` int DEFAULT NULL,
  `DefaultHubPageObjNum` int DEFAULT NULL,
  `DefaultTrainingTransPageObjNum` int DEFAULT NULL,
  PRIMARY KEY (`PageAssignmentID`),
  KEY `IX_PAGE_ASSIGNMENT_2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_assignment_condition`
--

DROP TABLE IF EXISTS `page_assignment_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_assignment_condition` (
  `PageAssignmentCondID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `StateType` int DEFAULT NULL,
  `SortingIndex` int NOT NULL,
  `ConditionField` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ConditionValue` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PageNum` int DEFAULT NULL,
  PRIMARY KEY (`PageAssignmentCondID`),
  KEY `IX_PAGE_ASSGNMNT_CNDITION2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_content_area`
--

DROP TABLE IF EXISTS `page_content_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_content_area` (
  `PageContentAreaID` int NOT NULL,
  `DynamicAreaKey` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ContentDataID` bigint DEFAULT NULL,
  `HierStrucID` bigint NOT NULL,
  `PageID` int DEFAULT NULL,
  `DescriptionID` bigint DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `ChangeSetObjNum` int DEFAULT NULL,
  PRIMARY KEY (`PageContentAreaID`),
  UNIQUE KEY `AK_PAGE_CONTENT_AREA` (`PageID`,`DynamicAreaKey`,`ChangeSetObjNum`,`HierStrucID`),
  KEY `IX_PGCNTNTAREA_CONTENTDTA` (`ContentDataID`),
  KEY `IX_PGCNTNTAREA_DESCRIPTION` (`DescriptionID`),
  KEY `IX_PGCNTNTAREA_HIERSTRUC` (`HierStrucID`),
  KEY `IX_PGCNTNTAREA_PAGE` (`PageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_template`
--

DROP TABLE IF EXISTS `page_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_template` (
  `PageTemplateID` int NOT NULL,
  `ObjectNumber` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `HierStrucID` bigint DEFAULT NULL,
  `ContentDataID` bigint DEFAULT NULL,
  `NameID` bigint DEFAULT NULL,
  `IsDefault` bit(1) NOT NULL DEFAULT b'0',
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  PRIMARY KEY (`PageTemplateID`),
  UNIQUE KEY `AK_PAGE_TEMPLATE_1` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_PGTMPLTE_CONTENTDATA` (`ContentDataID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pay_at_table_conf_payment`
--

DROP TABLE IF EXISTS `pay_at_table_conf_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_at_table_conf_payment` (
  `PayAtTableConfPaymentID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `PaymentType` tinyint unsigned NOT NULL DEFAULT '0',
  `PaymentCommand` longtext,
  PRIMARY KEY (`PayAtTableConfPaymentID`),
  KEY `IX_PAYCONFTABLE_HSID` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pay_at_table_config`
--

DROP TABLE IF EXISTS `pay_at_table_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_at_table_config` (
  `PayAtTableConfigID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `TipPercent1` smallint NOT NULL,
  `TipPercent2` smallint NOT NULL,
  `TipPercent3` smallint NOT NULL,
  PRIMARY KEY (`PayAtTableConfigID`),
  KEY `IX_PAYTABLE_HSID` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pay_rate`
--

DROP TABLE IF EXISTS `pay_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_rate` (
  `PayRateID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `EmployeeID` bigint NOT NULL,
  `RateIndex` int NOT NULL,
  `JobCodeID` int DEFAULT NULL,
  `RegularPay` decimal(21,4) DEFAULT NULL,
  `OvertimePay` decimal(21,4) DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `EffectiveFrom` datetime(3) DEFAULT NULL,
  `EffectiveTo` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`PayRateID`),
  UNIQUE KEY `AK_PAY_RATE_1` (`HierStrucID`,`EmployeeID`,`RateIndex`),
  KEY `IX_PAY_RATE_02` (`EmployeeID`),
  KEY `IX_PAY_RATE_03` (`JobCodeID`,`HierStrucID`,`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_tender`
--

DROP TABLE IF EXISTS `payment_tender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_tender` (
  `PaymentTenderID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `NameID` bigint NOT NULL,
  `TenderObjNum` int DEFAULT NULL,
  `Arguments` longtext,
  `SortPriority` int DEFAULT NULL,
  `SluIndex` int DEFAULT NULL,
  `IsPrimary` bit(1) NOT NULL DEFAULT b'0',
  `ObjectNumber` int DEFAULT NULL,
  PRIMARY KEY (`PaymentTenderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `period`
--

DROP TABLE IF EXISTS `period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `period` (
  `PeriodID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `NameID` bigint DEFAULT NULL,
  `PeriodType` int NOT NULL,
  `ScheduleData` longtext,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `LastPostingTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`PeriodID`),
  KEY `IX_PERIOD_1000` (`LastPostingTime`),
  KEY `IX_PERIOD_m1` (`NameID`),
  KEY `IX_PERIOD_m2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_PERIOD_LastPostingTime` BEFORE INSERT ON `period` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `period_instance`
--

DROP TABLE IF EXISTS `period_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `period_instance` (
  `PeriodInstID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `PeriodID` int NOT NULL,
  `StartTime` datetime(3) DEFAULT NULL,
  `EndTime` datetime(3) DEFAULT NULL,
  `BusinessDate` datetime(3) DEFAULT NULL,
  `LocalStartTime` datetime(3) DEFAULT NULL,
  `LocalEndTime` datetime(3) DEFAULT NULL,
  `PrevPeriodInstID` bigint DEFAULT NULL,
  PRIMARY KEY (`PeriodInstID`),
  UNIQUE KEY `AK_PERIOD_INSTANCE_2000` (`HierStrucID`,`PeriodID`,`EndTime`,`StartTime`),
  KEY `IX_PERIOD_INSTANCE_1000` (`EndTime`,`PeriodID`,`StartTime`,`HierStrucID`),
  KEY `IX_PERIOD_INSTANCE_3` (`BusinessDate`,`HierStrucID`,`PeriodID`,`EndTime`,`StartTime`),
  KEY `IX_PERIOD_INSTANCE_4` (`PeriodID`,`HierStrucID`,`StartTime`,`EndTime`,`BusinessDate`),
  KEY `IX_PERIOD_INSTANCE_5` (`HierStrucID`,`PeriodID`,`EndTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pms_total_detail`
--

DROP TABLE IF EXISTS `pms_total_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_total_detail` (
  `PmsTtlDtlID` bigint NOT NULL AUTO_INCREMENT,
  `CheckDetailID` bigint NOT NULL,
  `PmsTtlIndex` smallint NOT NULL,
  `Total` decimal(21,4) NOT NULL,
  KEY `PmsTtlDtlID` (`PmsTtlDtlID`),
  KEY `IX_PMS_TOTAL_DETAIL` (`CheckDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_journal_log`
--

DROP TABLE IF EXISTS `pos_journal_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_journal_log` (
  `posJournalLogId` bigint NOT NULL AUTO_INCREMENT,
  `journalId` int NOT NULL,
  `revenueCenter` int NOT NULL,
  `checkNum` int NOT NULL,
  `transDateTime` datetime(3) NOT NULL,
  `chkOpenDateTime` datetime(3) NOT NULL,
  `type` tinyint unsigned NOT NULL,
  `employee` bigint NOT NULL,
  `status` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `uws` int NOT NULL,
  `journalText` longtext NOT NULL,
  `guid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`posJournalLogId`),
  KEY `posJournalLogId` (`posJournalLogId`),
  KEY `IX_POS_JOURNAL_LOG_1000` (`transDateTime`),
  KEY `IX_POS_JRN_LOG_EMP` (`employee`),
  KEY `IX_POS_JRN_LOG_GUID` (`guid`),
  KEY `IX_POS_JRN_LOG_WS` (`uws`)
) ENGINE=InnoDB AUTO_INCREMENT=132041 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poskeyboard`
--

DROP TABLE IF EXISTS `poskeyboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poskeyboard` (
  `POSKeyboardID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  PRIMARY KEY (`POSKeyboardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `poskeyboard_assignment`
--

DROP TABLE IF EXISTS `poskeyboard_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poskeyboard_assignment` (
  `POSKeyboardAssignmentID` int NOT NULL,
  `POSAlphaNumKbdID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `SortOrder` int NOT NULL,
  PRIMARY KEY (`POSKeyboardAssignmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posting_parameter`
--

DROP TABLE IF EXISTS `posting_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posting_parameter` (
  `PostParamID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `OptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `AutoSvcChgGuests` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `CarryOverDays` int DEFAULT NULL,
  PRIMARY KEY (`PostParamID`),
  UNIQUE KEY `AK_POSTING_PARAMETER` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `print_class`
--

DROP TABLE IF EXISTS `print_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `print_class` (
  `PrintClassID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `NameID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `OrderDeviceOutput` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000000000000000000000000000',
  `RoutingGroupObjNum` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `OrderDeviceDisabled` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '00000000000000000000000000000000',
  PRIMARY KEY (`PrintClassID`),
  KEY `IX_PRINT_CLASS2` (`HierStrucID`),
  KEY `IX_PRINT_CLASS3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `printer`
--

DROP TABLE IF EXISTS `printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `printer` (
  `PrinterID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `ConnectionString` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ConfigurationString` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ServiceID` int DEFAULT NULL,
  `LineFeedsPerFormFeed` smallint DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `LocalOptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `KdsClientID` bigint DEFAULT NULL,
  `TrailingLinefeeds` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`PrinterID`),
  UNIQUE KEY `AK_PRINTER` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_PRINTER_2` (`ServiceID`),
  KEY `IX_PRINTER_3` (`KdsClientID`),
  KEY `IX_PRINTER_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `printer_group`
--

DROP TABLE IF EXISTS `printer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `printer_group` (
  `PrinterGroupID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  PRIMARY KEY (`PrinterGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `printer_group_detail`
--

DROP TABLE IF EXISTS `printer_group_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `printer_group_detail` (
  `PrinterGroupDetailID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `PrinterGroupID` bigint NOT NULL,
  `PrinterID` int NOT NULL,
  PRIMARY KEY (`PrinterGroupDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `production_item`
--

DROP TABLE IF EXISTS `production_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_item` (
  `ProductionItemID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `KdsHighlightSchemeObjNum` int DEFAULT NULL,
  `ShelfLife` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ProductionItemID`),
  KEY `IX_PRODUCTION_ITEM2` (`HierStrucID`),
  KEY `IX_PRODUCTION_ITEM3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `PropertyID` int NOT NULL,
  `TestProperty` bit(1) NOT NULL,
  `PropertyGuid` varchar(64) DEFAULT NULL,
  `TZIndex` int DEFAULT NULL,
  `PropertyComment` longtext,
  `LocaleInfoID` int DEFAULT NULL,
  `SimphonyPlatform` int NOT NULL,
  `ConsumerFacingName` bigint DEFAULT NULL,
  `PhoneNumber` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Address1` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Address2` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `City` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `StateOrRegion` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Country` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Latitude` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Longitude` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PostalCode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Address3` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CountryCode` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `StateOrRegionCode` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MerchantCategoryCode` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PendingDelete` int DEFAULT NULL,
  `MccLocked` bit(1) DEFAULT NULL,
  `PhoneCountryCode` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`PropertyID`),
  KEY `IX_PROPERTY_2` (`LocaleInfoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_PROPERTY_PropertyGuid` BEFORE INSERT ON `property` FOR EACH ROW BEGIN
IF new.PropertyGuid IS NULL THEN
SET new.PropertyGuid = uuid();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `qr_pay_config`
--

DROP TABLE IF EXISTS `qr_pay_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qr_pay_config` (
  `QrPayConfigId` bigint NOT NULL,
  `HierStrucId` bigint NOT NULL,
  `QrPayOrgShortCode` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `QrPayPaymentBaseUrl` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OrdsUrl` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `IdGuid` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `AdyenStoreId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MerchantAccountCode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `QrPayEnabledEmc` bit(1) DEFAULT NULL,
  `QrPayEnabledPaymentApp` bit(1) DEFAULT NULL,
  `QrPayEmcDateLastModified` datetime(3) DEFAULT NULL,
  `QrPayLastUpdateFromPaymentApp` datetime(3) DEFAULT NULL,
  `OrganizationId` bigint DEFAULT NULL,
  PRIMARY KEY (`QrPayConfigId`),
  UNIQUE KEY `AK_QR_PAY_CONFIG_HSID` (`HierStrucId`),
  KEY `IX_QR_PAY_CONFIG_ORGID` (`OrganizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quoting_rule_link`
--

DROP TABLE IF EXISTS `quoting_rule_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quoting_rule_link` (
  `QuotingRuleLinkID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `QuotingRuleID` bigint NOT NULL,
  `OrderMethodObjNum` int NOT NULL,
  PRIMARY KEY (`QuotingRuleLinkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recipe_name`
--

DROP TABLE IF EXISTS `recipe_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_name` (
  `RecipeNameID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `RecipeLinkID` int NOT NULL,
  `RecipeIndex` smallint NOT NULL,
  `NameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`RecipeNameID`),
  KEY `IX_RECIPE_NAME` (`HierStrucID`,`RecipeLinkID`),
  KEY `IX_RECIPE_NAME_2` (`RecipeLinkID`),
  KEY `IX_RECIPE_NAME_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_group`
--

DROP TABLE IF EXISTS `report_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_group` (
  `RptGrpID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `RptGrpType` smallint NOT NULL,
  `OptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `LastPostingTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`RptGrpID`),
  KEY `IX_REPORT_GROUP_1000` (`LastPostingTime`),
  KEY `IX_REPORT_GROUP_2` (`NameID`),
  KEY `IX_REPORT_GROUP_3` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_REPORT_GROUP_LastPostingTime` BEFORE INSERT ON `report_group` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `report_parameter`
--

DROP TABLE IF EXISTS `report_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_parameter` (
  `RptParamID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `OptionBits` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`RptParamID`),
  UNIQUE KEY `AK_REPORT_PARAMETER` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `required_condiment`
--

DROP TABLE IF EXISTS `required_condiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `required_condiment` (
  `ReqdCndmntID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `MenuItemClassID` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `SluIndex` int DEFAULT NULL,
  `Threshold1` smallint DEFAULT NULL,
  `Threshold1Level` smallint DEFAULT NULL,
  `Threshold2` smallint DEFAULT NULL,
  `Threshold2Level` smallint DEFAULT NULL,
  `Passthrough` bit(1) DEFAULT NULL,
  `MinimumValue` smallint NOT NULL DEFAULT '1',
  `MaximumValue` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ReqdCndmntID`),
  KEY `IX_REQUIRED_CONDIMENT` (`HierStrucID`,`MenuItemClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revenue_center`
--

DROP TABLE IF EXISTS `revenue_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revenue_center` (
  `RevCtrID` int NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  `IsLdsActive` bit(1) NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `RevenueCenterPostingTime` datetime(3) DEFAULT NULL,
  `RvcGroupMask` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '11111111111111111111111111111111',
  `IsTransLocked` datetime(3) DEFAULT NULL,
  `ConsumerFacingName` bigint DEFAULT NULL,
  `PhoneNumber` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Address1` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Address2` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Address3` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `City` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `StateOrRegion` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Country` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Latitude` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Longitude` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PostalCode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Floor` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CountryCode` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `StateOrRegionCode` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `UsePropertyAddress` bit(1) NOT NULL,
  `MerchantCategoryCode` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MccLocked` bit(1) DEFAULT NULL,
  `PhoneCountryCode` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`RevCtrID`),
  KEY `IX_REVENUE_CENTER_1` (`RevenueCenterPostingTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_REVENUE_CENTER_RevenueCenterPostingTime` BEFORE INSERT ON `revenue_center` FOR EACH ROW BEGIN
IF new.RevenueCenterPostingTime IS NULL THEN
SET new.RevenueCenterPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `revenue_center_group`
--

DROP TABLE IF EXISTS `revenue_center_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revenue_center_group` (
  `RvcGroupID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `RvcGroupComment` longtext,
  PRIMARY KEY (`RvcGroupID`),
  KEY `IX_REVENUE_CENTER_GROUP_2` (`HierStrucID`),
  KEY `IX_REVENUE_CENTER_GROUP_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revenue_center_group_rvc`
--

DROP TABLE IF EXISTS `revenue_center_group_rvc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revenue_center_group_rvc` (
  `RvcGroupRvcID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `RvcGroupID` int NOT NULL,
  `RevCtrID` int NOT NULL,
  PRIMARY KEY (`RvcGroupRvcID`),
  KEY `IX_REVENUE_CENTER_GROUP_RVC_2` (`HierStrucID`),
  KEY `IX_REVENUE_CENTER_GROUP_RVC_3` (`RevCtrID`),
  KEY `IX_REVENUE_CENTER_GROUP_RVC_4` (`RvcGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `RoleType` int NOT NULL,
  `RoleComment` longtext,
  `LastPostingTime` datetime(3) DEFAULT NULL,
  `RoleLevel` int DEFAULT NULL,
  PRIMARY KEY (`RoleID`),
  UNIQUE KEY `AK_ROLE` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_ROLE` (`LastPostingTime`),
  KEY `IX_ROLE_HSID` (`HierStrucID`),
  KEY `IX_ROLE_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_ROLE_LastPostingTime` BEFORE INSERT ON `role` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `role_employee`
--

DROP TABLE IF EXISTS `role_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_employee` (
  `RoleEmployeeID` bigint NOT NULL,
  `RoleID` bigint NOT NULL,
  `EmployeeID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  PRIMARY KEY (`RoleEmployeeID`),
  KEY `IX_ROLE_EMPLOYEE_2` (`RoleID`),
  KEY `IX_ROLE_EMPLOYEE_3` (`EmployeeID`),
  KEY `IX_ROLE_EMPLOYEE_4` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_privilege`
--

DROP TABLE IF EXISTS `role_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_privilege` (
  `RolePrivilegeID` bigint NOT NULL,
  `RoleID` bigint NOT NULL,
  `PrivilegeType` smallint NOT NULL,
  `PrivilegeNumber` smallint NOT NULL,
  `PrivilegeAccess` smallint NOT NULL,
  PRIMARY KEY (`RolePrivilegeID`),
  KEY `IX_ROLE_PRIVILEGE_2` (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_visibility`
--

DROP TABLE IF EXISTS `role_visibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_visibility` (
  `RoleVisibilityID` bigint NOT NULL,
  `RoleID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `VisibleForChildren` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`RoleVisibilityID`),
  KEY `IX_HRSTRUCID_RL_VISIBILITY` (`HierStrucID`),
  KEY `IX_ROLE_RV` (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `routing_group`
--

DROP TABLE IF EXISTS `routing_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routing_group` (
  `RoutingGroupID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint DEFAULT NULL,
  PRIMARY KEY (`RoutingGroupID`),
  UNIQUE KEY `AK_ROUTING_GROUP` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_ROUTING_GROUP_m2` (`HierStrucID`),
  KEY `IX_ROUTING_GROUP_m3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_itemizer`
--

DROP TABLE IF EXISTS `sales_itemizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_itemizer` (
  `SlsItmzrID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `SlsItmzrIndex` smallint NOT NULL,
  `NameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`SlsItmzrID`),
  KEY `IX_SALES_ITEMIZER` (`HierStrucID`),
  KEY `IX_SALES_ITEMIZER_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screen_lookup`
--

DROP TABLE IF EXISTS `screen_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screen_lookup` (
  `SluID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `SluType` int NOT NULL,
  `DeviceType` int NOT NULL,
  `SluIndex` int NOT NULL,
  `NameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `LastPostingTime` datetime(3) DEFAULT NULL,
  `PosRef` bigint DEFAULT NULL,
  PRIMARY KEY (`SluID`),
  KEY `IX_SCREEN_LOOKUP` (`HierStrucID`,`SluType`,`DeviceType`),
  KEY `IX_SCREEN_LOOKUP_1000` (`LastPostingTime`),
  KEY `IX_SCREEN_LOOKUP_1400` (`NameID`),
  KEY `IX_SCREEN_LOOKUP_2002` (`HierStrucID`,`PosRef`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_SCREEN_LOOKUP_LastPostingTime` BEFORE INSERT ON `screen_lookup` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sec_integrity_pub_keys`
--

DROP TABLE IF EXISTS `sec_integrity_pub_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sec_integrity_pub_keys` (
  `IntegrityKeyID` int NOT NULL AUTO_INCREMENT,
  `KeyData` longblob NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `LastUpdatedOn` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`IntegrityKeyID`),
  KEY `IntegrityKeyID` (`IntegrityKeyID`)
) ENGINE=InnoDB AUTO_INCREMENT=3105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `secure_detail`
--

DROP TABLE IF EXISTS `secure_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secure_detail` (
  `SecureDetailID` bigint NOT NULL AUTO_INCREMENT,
  `CheckDetailID` bigint NOT NULL,
  `PlainData` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SecureData` longblob NOT NULL,
  `EncryptionKeyID` int DEFAULT NULL,
  UNIQUE KEY `AK_SECURE_DETAIL` (`CheckDetailID`),
  KEY `SecureDetailID` (`SecureDetailID`),
  KEY `AK_encryptionkeyid` (`EncryptionKeyID`)
) ENGINE=InnoDB AUTO_INCREMENT=103369 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `serial_number`
--

DROP TABLE IF EXISTS `serial_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serial_number` (
  `SerNumID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `SerialIndex` int NOT NULL,
  `MinVal` bigint NOT NULL,
  `MaxVal` bigint NOT NULL,
  `CurVal` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`SerNumID`),
  UNIQUE KEY `AK_SERIAL_NUMBER` (`HierStrucID`,`SerialIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `ServiceID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ServiceHostID` int DEFAULT NULL,
  `Protocol` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Port` int DEFAULT NULL,
  `URL` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ServiceType` smallint NOT NULL,
  `Description` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SecAuthCurrentKeyID` bigint DEFAULT NULL,
  `SecAuthOldKeyID` bigint DEFAULT NULL,
  `ClearTotalsTime` datetime(3) DEFAULT NULL,
  `DbUpdateFrequency` int DEFAULT NULL,
  `IsPendingDbReload` bit(1) NOT NULL DEFAULT b'0',
  `SecurePort` int NOT NULL DEFAULT '8087',
  PRIMARY KEY (`ServiceID`),
  KEY `IX_SERVICE_2` (`HierStrucID`),
  KEY `IX_SERVICE_2001` (`ServiceHostID`,`ServiceType`,`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_charge`
--

DROP TABLE IF EXISTS `service_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_charge` (
  `SvcChgID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PrintOptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '00000000',
  `Nlu` int DEFAULT NULL,
  `TransDfltMain` bit(1) NOT NULL,
  `MainMenuLvlIndex` int DEFAULT NULL,
  `TransDfltSub` bit(1) NOT NULL,
  `SubMenuLvlIndex` int DEFAULT NULL,
  `Percentage` decimal(7,6) DEFAULT NULL,
  `Amount` decimal(21,4) DEFAULT NULL,
  `TipsPaidTendMedNumber` int DEFAULT NULL,
  `PercentTipsPaid` decimal(7,6) DEFAULT NULL,
  `PrivilegeGrp` int DEFAULT NULL,
  `IconNumber` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `ServiceChargePostingTime` datetime(3) DEFAULT NULL,
  `Halo` decimal(21,4) DEFAULT NULL,
  `TaxClassObjNum` int DEFAULT NULL,
  `SluIndex` int DEFAULT NULL,
  `HhtSluIndex` int DEFAULT NULL,
  `ChangeSetObjNum` int DEFAULT NULL,
  `SluGroupNum` int DEFAULT NULL,
  `EffectivityID` bigint DEFAULT NULL,
  `RptGrpObjNum` int DEFAULT NULL,
  `PrintClassObjNum` int DEFAULT NULL,
  PRIMARY KEY (`SvcChgID`),
  UNIQUE KEY `AK_SERVICE_CHARGE` (`HierStrucID`,`ObjectNumber`,`ChangeSetObjNum`),
  KEY `IX_SERVICE_CHARGE_1` (`ServiceChargePostingTime`),
  KEY `IX_SERVICE_CHARGE_2` (`EffectivityID`),
  KEY `IX_SERVICE_CHARGE_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_SERVICE_CHARGE_ServiceChargePostingTime` BEFORE INSERT ON `service_charge` FOR EACH ROW BEGIN
IF new.ServiceChargePostingTime IS NULL THEN
SET new.ServiceChargePostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `service_charge_detail`
--

DROP TABLE IF EXISTS `service_charge_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_charge_detail` (
  `SvcChgDtlID` bigint NOT NULL AUTO_INCREMENT,
  `CheckDetailID` bigint NOT NULL,
  `SvcChgID` int NOT NULL,
  `OptionBits` varchar(48) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Percentage` decimal(7,6) DEFAULT NULL,
  `EmployeeID` bigint DEFAULT NULL,
  `PrintOptionBits` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PrivilegeLevel` int DEFAULT NULL,
  `VoidReasonID` int DEFAULT NULL,
  `TillDetailID` int DEFAULT NULL,
  `TaxRates` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TillSessionID` int DEFAULT NULL,
  PRIMARY KEY (`SvcChgDtlID`),
  UNIQUE KEY `AK_SERVICE_CHARGE_DETAIL` (`CheckDetailID`),
  KEY `SvcChgDtlID` (`SvcChgDtlID`),
  KEY `IX_SERVICE_CHARGE_DETAIL_2` (`VoidReasonID`),
  KEY `IX_SERVICE_CHARGE_DETAIL_3` (`TillDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_charge_group`
--

DROP TABLE IF EXISTS `service_charge_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_charge_group` (
  `ServiceChargeGroupID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int NOT NULL,
  `NameID` bigint NOT NULL,
  PRIMARY KEY (`ServiceChargeGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_charge_group_detail`
--

DROP TABLE IF EXISTS `service_charge_group_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_charge_group_detail` (
  `ServiceChargeGroupDetailID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ServiceChargeGroupID` int NOT NULL,
  `ServiceChargeObjNum` int NOT NULL,
  PRIMARY KEY (`ServiceChargeGroupDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_charge_itemizer`
--

DROP TABLE IF EXISTS `service_charge_itemizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_charge_itemizer` (
  `SvcChgItmzrID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `SvcChgItmzrIndex` smallint NOT NULL,
  `NameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`SvcChgItmzrID`),
  KEY `IX_SERVICE_CHARGE_ITEMIZER` (`HierStrucID`),
  KEY `IX_SERVICE_CHARGE_ITEMIZER_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_charge_main_menu_level`
--

DROP TABLE IF EXISTS `service_charge_main_menu_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_charge_main_menu_level` (
  `SvcChgMainMenuLvlID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `SvcChgID` int NOT NULL,
  `MenuLvlIndex` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`SvcChgMainMenuLvlID`),
  KEY `IX_SERVICE_CHARGE_MAIN_MENU_LE` (`HierStrucID`,`SvcChgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_charge_sub_menu_level`
--

DROP TABLE IF EXISTS `service_charge_sub_menu_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_charge_sub_menu_level` (
  `SvcChgSubMenuLvlID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `SvcChgID` int NOT NULL,
  `MenuLvlIndex` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`SvcChgSubMenuLvlID`),
  KEY `IX_SERVICE_CHARGE_SUB_MENU_LEV` (`HierStrucID`,`SvcChgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_chg_itmzr_service_chg`
--

DROP TABLE IF EXISTS `service_chg_itmzr_service_chg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_chg_itmzr_service_chg` (
  `SvcChgItmzrSvcChgID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `SvcChgID` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `SvcChgItmzrIndex` smallint DEFAULT NULL,
  PRIMARY KEY (`SvcChgItmzrSvcChgID`),
  KEY `IX_SERVICE_CHG_ITMZR_SERVICE_C` (`HierStrucID`,`SvcChgID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_host`
--

DROP TABLE IF EXISTS `service_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_host` (
  `ServiceHostID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `NameID` bigint NOT NULL,
  `ServiceType` int NOT NULL,
  `IsConnectionless` int DEFAULT NULL,
  `DefaultGateway` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NetMask` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `HostName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000',
  `SimphonyPlatform` int NOT NULL,
  `Version` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SecRecAuthKeyId` bigint DEFAULT NULL,
  PRIMARY KEY (`ServiceHostID`),
  KEY `IX_SERVICE_HOST` (`HierStrucID`,`ServiceType`),
  KEY `IX_SERVICE_HOST_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `serving_period`
--

DROP TABLE IF EXISTS `serving_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serving_period` (
  `ServingPeriodID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `PeriodID` int NOT NULL,
  `TrkGrpID` int DEFAULT NULL,
  `TableCount` int DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `TaxMask` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000',
  `MainLevelIndex` int DEFAULT NULL,
  `SubLevelIndex` int DEFAULT NULL,
  PRIMARY KEY (`ServingPeriodID`),
  UNIQUE KEY `AK_SERVING_PERIOD` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_SERVING_PERIOD_2` (`TrkGrpID`),
  KEY `IX_SERVING_PERIOD_3` (`PeriodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `serving_period_touchscreen`
--

DROP TABLE IF EXISTS `serving_period_touchscreen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serving_period_touchscreen` (
  `SrvPerTouchscrnID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ServingPeriodID` int NOT NULL,
  `DeviceType` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `TouchscreenObjNum` int DEFAULT NULL,
  `OrderingTsObjNum` int DEFAULT NULL,
  PRIMARY KEY (`SrvPerTouchscrnID`),
  KEY `IX_SERVING_PERIOD_TOUCHSCREEN` (`HierStrucID`,`ServingPeriodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shift_status`
--

DROP TABLE IF EXISTS `shift_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_status` (
  `ShiftType` tinyint unsigned NOT NULL,
  `TypeID` bigint NOT NULL,
  `ShiftNumber` int DEFAULT NULL,
  `RevCtrID` int DEFAULT NULL,
  `JobID` int DEFAULT NULL,
  `LastIncUTC` datetime(3) DEFAULT NULL,
  `PrevIncUTC` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ShiftType`,`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_event`
--

DROP TABLE IF EXISTS `status_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_event` (
  `StatusEventId` bigint NOT NULL AUTO_INCREMENT,
  `EventType` int NOT NULL,
  `EventName` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Vendor` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CheckGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `EmployeeID` bigint DEFAULT NULL,
  `BinVal` longblob,
  `LongVal` bigint DEFAULT NULL,
  `StringVal` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Flags` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `UtcTimeStamp` datetime(3) NOT NULL,
  PRIMARY KEY (`StatusEventId`),
  KEY `StatusEventId` (`StatusEventId`)
) ENGINE=InnoDB AUTO_INCREMENT=102785 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stored_value_card`
--

DROP TABLE IF EXISTS `stored_value_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stored_value_card` (
  `StoredValueCardID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `OptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `InterfaceID` int DEFAULT NULL,
  `IssueType` smallint DEFAULT NULL,
  `IssueItem` bigint DEFAULT NULL,
  `IssuePointsType` smallint DEFAULT NULL,
  `IssuePointsItem` bigint DEFAULT NULL,
  `IssueReceipts` int NOT NULL,
  `ActivateType` smallint DEFAULT NULL,
  `ActivateItem` bigint DEFAULT NULL,
  `ActivateReceipts` int NOT NULL,
  `ReloadType` smallint DEFAULT NULL,
  `ReloadItem` bigint DEFAULT NULL,
  `ReloadReceipts` int NOT NULL,
  `RedeemItem` bigint DEFAULT NULL,
  `RedeemPointsItem` bigint DEFAULT NULL,
  `RedeemReceipts` int NOT NULL,
  `RedeemAuthReceipts` int NOT NULL,
  `CashOutItem` bigint DEFAULT NULL,
  `CouponType` smallint DEFAULT NULL,
  `CouponItem` bigint DEFAULT NULL,
  `OtherType` smallint DEFAULT NULL,
  `IssueOtherItem` bigint DEFAULT NULL,
  `ActivateOtherItem` bigint DEFAULT NULL,
  `ReloadOtherItem` bigint DEFAULT NULL,
  `OtherReceipts` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`StoredValueCardID`),
  UNIQUE KEY `AK_STORED_VALUE_CARD` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_STORED_VALUE_CARD_2` (`InterfaceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stored_value_card_descriptor`
--

DROP TABLE IF EXISTS `stored_value_card_descriptor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stored_value_card_descriptor` (
  `StoredValueCardDescID` bigint NOT NULL,
  `StoredValueCardID` int NOT NULL,
  `DescType` int NOT NULL,
  `LineNumber` int NOT NULL,
  `StringNumberID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`StoredValueCardDescID`),
  KEY `IX_STORED_VAL_CARD_DESC_m1` (`StringNumberID`),
  KEY `IX_STORED_VALUE_CARD_DESCRIPT` (`StoredValueCardID`,`DescType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stored_value_config`
--

DROP TABLE IF EXISTS `stored_value_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stored_value_config` (
  `StoredValueConfigID` bigint NOT NULL,
  `HierStrucID` bigint DEFAULT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `OptionBits` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000',
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`StoredValueConfigID`),
  KEY `IX_STORED_VALUE_CONFIG2` (`HierStrucID`),
  KEY `IX_STORED_VALUE_CONFIG3` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `string_table`
--

DROP TABLE IF EXISTS `string_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `string_table` (
  `StringID` bigint NOT NULL,
  `StringNumberID` bigint NOT NULL,
  `LangID` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `HierStrucID` bigint DEFAULT NULL,
  `PosRef` bigint DEFAULT NULL,
  `StringText` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`StringID`),
  UNIQUE KEY `AK_STRING_TABLE` (`StringNumberID`,`LangID`),
  KEY `IX_STRING_TABLE_2002` (`HierStrucID`,`PosRef`),
  KEY `IX_STRING_TABLE_2301` (`HierStrucID`,`StringID`,`StringNumberID`,`LangID`,`StringText`,`IsVisible`,`IsDeleted`,`PosRef`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_menu_level`
--

DROP TABLE IF EXISTS `sub_menu_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_menu_level` (
  `SubMenuLvlID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `MenuLvlIndex` smallint NOT NULL,
  `PrefixID` bigint NOT NULL,
  `NameID` bigint NOT NULL,
  `SuffixID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `LastPostingTime` datetime(3) DEFAULT NULL,
  `EntryType` smallint DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`SubMenuLvlID`),
  KEY `IX_SUB_MENU_LEVEL` (`HierStrucID`),
  KEY `IX_SUB_MENU_LEVEL_1000` (`LastPostingTime`),
  KEY `IX_SUB_MENU_LEVEL_m1` (`PrefixID`),
  KEY `IX_SUB_MENU_LEVEL_m2` (`NameID`),
  KEY `IX_SUB_MENU_LEVEL_m3` (`SuffixID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_SUB_MENU_LEVEL_LastPostingTime` BEFORE INSERT ON `sub_menu_level` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sync_anchors`
--

DROP TABLE IF EXISTS `sync_anchors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sync_anchors` (
  `FileName` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `HierStrucID` bigint DEFAULT NULL,
  `Anchor` binary(8) DEFAULT NULL,
  UNIQUE KEY `UK_SYNC_ANCHORS` (`FileName`,`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_template`
--

DROP TABLE IF EXISTS `system_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_template` (
  `SystemTemplateID` int NOT NULL,
  `Priority` int NOT NULL,
  `SystemTemplateType` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `HierStrucID` bigint DEFAULT NULL,
  `ContentDataID` bigint DEFAULT NULL,
  PRIMARY KEY (`SystemTemplateID`),
  KEY `IX_SYSTEM_TEMPLATE_2` (`HierStrucID`),
  KEY `IX_SYSTEM_TEMPLATE_3` (`ContentDataID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag_group`
--

DROP TABLE IF EXISTS `tag_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_group` (
  `TagGroupId` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `TagGroupKey` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SpecialUsage` smallint NOT NULL DEFAULT '0',
  `ObjectNumber` int DEFAULT NULL,
  PRIMARY KEY (`TagGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag_item`
--

DROP TABLE IF EXISTS `tag_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_item` (
  `TagItemID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` bigint DEFAULT NULL,
  `TagName` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `TagGroupId` bigint DEFAULT NULL,
  PRIMARY KEY (`TagItemID`),
  UNIQUE KEY `AX_TAG_ITEM` (`HierStrucID`,`ObjectNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taiwan_gui`
--

DROP TABLE IF EXISTS `taiwan_gui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taiwan_gui` (
  `TaiwanGuiID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `Prefix` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Threshold` smallint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`TaiwanGuiID`),
  UNIQUE KEY `AK_TAIWAN_GUI` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax` (
  `TaxID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `TaxIndex` smallint NOT NULL,
  `NameID` bigint NOT NULL,
  `TaxType` smallint NOT NULL,
  `Percentage` decimal(7,6) DEFAULT NULL,
  `Amount` decimal(21,4) DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `TaxPostingTime` datetime(3) DEFAULT NULL,
  `ChangeSetObjNum` int DEFAULT NULL,
  `ReportGroup` int DEFAULT NULL,
  `TaxCodes` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`TaxID`),
  UNIQUE KEY `AK_TAX` (`HierStrucID`,`TaxIndex`,`ChangeSetObjNum`),
  KEY `IX_TAX_2` (`TaxPostingTime`),
  KEY `IX_TAX_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_TAX_TaxPostingTime` BEFORE INSERT ON `tax` FOR EACH ROW BEGIN
IF new.TaxPostingTime IS NULL THEN
SET new.TaxPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tax_breakpoint`
--

DROP TABLE IF EXISTS `tax_breakpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_breakpoint` (
  `TaxBrkPtID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `TaxID` int NOT NULL,
  `BrkPtIndex` int NOT NULL,
  `Breakpoint` int NOT NULL,
  `RepeatTaxBrkPtID` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `LastPostingTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`TaxBrkPtID`),
  KEY `IX_TAX_BREAKPOINT` (`HierStrucID`),
  KEY `IX_TAX_BREAKPOINT_1000` (`LastPostingTime`),
  KEY `IX_TAX_BREAKPOINT_2001` (`HierStrucID`,`TaxBrkPtID`,`TaxID`,`BrkPtIndex`,`Breakpoint`,`RepeatTaxBrkPtID`,`IsVisible`,`IsDeleted`,`LastPostingTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_TAX_BREAKPOINT_LastPostingTime` BEFORE INSERT ON `tax_breakpoint` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_class` (
  `TaxClassID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `LastPostingTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`TaxClassID`),
  UNIQUE KEY `AK_TAX_CLASS` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_TAX_CLASS_1000` (`LastPostingTime`),
  KEY `IX_TAX_CLASS_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_TAX_CLASS_LastPostingTime` BEFORE INSERT ON `tax_class` FOR EACH ROW BEGIN
IF new.LastPostingTime IS NULL THEN
SET new.LastPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tax_class_tax`
--

DROP TABLE IF EXISTS `tax_class_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_class_tax` (
  `TaxClassTaxID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `TaxClassID` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `TaxIndex` smallint DEFAULT NULL,
  PRIMARY KEY (`TaxClassTaxID`),
  KEY `IX_TAX_CLASS_TAX` (`HierStrucID`,`TaxClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tax_parameter`
--

DROP TABLE IF EXISTS `tax_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_parameter` (
  `TaxParamID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `OptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000',
  `ForeignOptionBits` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000000000000000000000000000',
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `VatPrintOptionBits` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000',
  PRIMARY KEY (`TaxParamID`),
  UNIQUE KEY `AK_TAX_PARAMETER` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team_def`
--

DROP TABLE IF EXISTS `team_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_def` (
  `TeamID` int NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `TeamNumber` int NOT NULL,
  `TeamName` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ObjectNumber` int DEFAULT NULL,
  PRIMARY KEY (`TeamID`),
  KEY `TeamID` (`TeamID`),
  KEY `IX_TEAM_DEF2` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team_detail`
--

DROP TABLE IF EXISTS `team_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_detail` (
  `TeamDtlID` bigint NOT NULL AUTO_INCREMENT,
  `CheckDetailID` bigint NOT NULL,
  `TeamEmpIndex` smallint NOT NULL,
  `EmployeeID` bigint DEFAULT NULL,
  `RoleCode` int DEFAULT NULL,
  KEY `TeamDtlID` (`TeamDtlID`),
  KEY `IX_TEAM_DETAIL` (`CheckDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team_member_def`
--

DROP TABLE IF EXISTS `team_member_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_member_def` (
  `TeamID` int NOT NULL,
  `EmployeeID` bigint NOT NULL,
  `TipPercentage` decimal(5,2) NOT NULL,
  `TeamMemberDefID` int NOT NULL AUTO_INCREMENT,
  `ObjectNumber` int DEFAULT NULL,
  PRIMARY KEY (`TeamMemberDefID`),
  KEY `TeamMemberDefID` (`TeamMemberDefID`),
  KEY `IX_TEAM_MEMBER_DEF2` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tender_media`
--

DROP TABLE IF EXISTS `tender_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tender_media` (
  `TendMedID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint NOT NULL,
  `TendMedType` smallint NOT NULL,
  `Preamble` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OptionBits` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PrintOptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '00000000',
  `Nlu` int DEFAULT NULL,
  `TransDfltMain` bit(1) NOT NULL,
  `MainMenuLvlIndex` int DEFAULT NULL,
  `TransDfltSub` bit(1) NOT NULL,
  `SubMenuLvlIndex` int DEFAULT NULL,
  `ChargedTipSvcChgNumber` int DEFAULT NULL,
  `Halo` int DEFAULT NULL,
  `PrivilegeGrp` int DEFAULT NULL,
  `InterfaceIndex` int DEFAULT NULL,
  `EstimatedTip` decimal(7,6) DEFAULT NULL,
  `SecondaryFloorPcnt` decimal(7,6) DEFAULT NULL,
  `BaseFloor` decimal(21,4) DEFAULT NULL,
  `SecondaryFloor` decimal(21,4) DEFAULT NULL,
  `InitialAuth` decimal(21,4) DEFAULT NULL,
  `DefaultTipPcnt` smallint DEFAULT NULL,
  `IconNumber` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `QuickServiceLimit` decimal(21,4) DEFAULT NULL,
  `TenderMediaPostingTime` datetime(3) DEFAULT NULL,
  `OfflineEstimatedTip` decimal(7,6) DEFAULT NULL,
  `MaxUnauthAmount` decimal(21,4) DEFAULT NULL,
  `OfflineLimit` decimal(21,4) DEFAULT NULL,
  `AltVoucherTrailerLimit` decimal(21,4) DEFAULT NULL,
  `TrServicesServNameID` int DEFAULT NULL,
  `RptGrpObjNum` int DEFAULT NULL,
  `SluIndex` int DEFAULT NULL,
  `HhtSluIndex` int DEFAULT NULL,
  `ChangeSetObjNum` int DEFAULT NULL,
  `ExtensionApplicationKey` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SluGroupNum` int DEFAULT NULL,
  `SRMPayType` int DEFAULT NULL,
  `InsignificantDigits` smallint DEFAULT NULL,
  `PrintClassObjNum` int DEFAULT NULL,
  `AMTTHRESHOLDPRINTCLASSOBJNUM` int DEFAULT '0',
  `LIKEITEMPRINTCLASSOBJNUM` int DEFAULT '0',
  PRIMARY KEY (`TendMedID`),
  UNIQUE KEY `AK_TENDER_MEDIA` (`HierStrucID`,`ObjectNumber`,`ChangeSetObjNum`),
  KEY `IX_TENDER_MEDIA_1` (`TenderMediaPostingTime`),
  KEY `IX_TENDER_MEDIA_2` (`TrServicesServNameID`),
  KEY `IX_TENDER_MEDIA_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_TENDER_MEDIA_TenderMediaPostingTime` BEFORE INSERT ON `tender_media` FOR EACH ROW BEGIN
IF new.TenderMediaPostingTime IS NULL THEN
SET new.TenderMediaPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tender_media_detail`
--

DROP TABLE IF EXISTS `tender_media_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tender_media_detail` (
  `TendMedDtlID` bigint NOT NULL AUTO_INCREMENT,
  `CheckDetailID` bigint NOT NULL,
  `TendMedID` int NOT NULL,
  `EmployeeID` bigint DEFAULT NULL,
  `CashierID` int DEFAULT NULL,
  `ChargeTip` decimal(21,4) NOT NULL,
  `OptionBits` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PrintOptionBits` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CurrencyID` int DEFAULT NULL,
  `PrivilegeLevel` int DEFAULT NULL,
  `InterfaceIndex` int DEFAULT NULL,
  `SignatureGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Deposit` decimal(21,4) DEFAULT NULL,
  `ServingPeriodID` bigint DEFAULT NULL,
  `TillDetailID` int DEFAULT NULL,
  `TaxExemptRates` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CurrencyAmount` decimal(21,4) DEFAULT NULL,
  `TillSessionID` int DEFAULT NULL,
  `ChargeTipSvcChgNum` int DEFAULT NULL,
  PRIMARY KEY (`TendMedDtlID`),
  UNIQUE KEY `AK_TENDER_MEDIA_DETAIL` (`CheckDetailID`),
  KEY `TendMedDtlID` (`TendMedDtlID`),
  KEY `IX_TENDER_MEDIA_DETAIL_2` (`TillDetailID`)
) ENGINE=InnoDB AUTO_INCREMENT=61716 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tender_media_main_menu_level`
--

DROP TABLE IF EXISTS `tender_media_main_menu_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tender_media_main_menu_level` (
  `TendMedMainMenuLvlID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `TendMedID` int NOT NULL,
  `MenuLvlIndex` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`TendMedMainMenuLvlID`),
  KEY `IX_TENDER_MEDIA_MAIN_MENU_LEVE` (`HierStrucID`,`TendMedID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tender_media_preamble`
--

DROP TABLE IF EXISTS `tender_media_preamble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tender_media_preamble` (
  `TenderMediaPreambleID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `TendMedID` int NOT NULL,
  `StartPreamble` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `EndPreamble` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PreambleLength` int DEFAULT NULL,
  `AutoOnly` bit(1) DEFAULT b'0',
  PRIMARY KEY (`TenderMediaPreambleID`),
  KEY `IX_TENDER_MEDIA_PREAMBLE_2` (`TendMedID`),
  KEY `IX_TENDER_MEDIA_PREAMBLE_3` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tender_media_sub_menu_level`
--

DROP TABLE IF EXISTS `tender_media_sub_menu_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tender_media_sub_menu_level` (
  `TendMedSubMenuLvlID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `TendMedID` int NOT NULL,
  `MenuLvlIndex` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`TendMedSubMenuLvlID`),
  KEY `IX_TENDER_MEDIA_SUB_MENU_LEVEL` (`HierStrucID`,`TendMedID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tender_media_tax_exempt`
--

DROP TABLE IF EXISTS `tender_media_tax_exempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tender_media_tax_exempt` (
  `TendMedTaxExmptID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `TendMedID` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `TaxIndex` smallint DEFAULT NULL,
  PRIMARY KEY (`TendMedTaxExmptID`),
  KEY `IX_TENDER_MEDIA_TAX_EXEMPT` (`HierStrucID`,`TendMedID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `text_detail`
--

DROP TABLE IF EXISTS `text_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `text_detail` (
  `TextDtlID` bigint NOT NULL AUTO_INCREMENT,
  `CheckDetailID` bigint NOT NULL,
  `Text` varchar(88) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LangID` int NOT NULL,
  UNIQUE KEY `AK_TEXT_DETAIL` (`CheckDetailID`),
  KEY `TextDtlID` (`TextDtlID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_period`
--

DROP TABLE IF EXISTS `time_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_period` (
  `TimePeriodID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `PeriodID` int NOT NULL,
  `NoOverhead` bit(1) NOT NULL,
  `TrkGrpID` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`TimePeriodID`),
  UNIQUE KEY `AK_TIME_PERIOD` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_TIME_PERIOD_2` (`PeriodID`),
  KEY `IX_TIME_PERIOD_3` (`TrkGrpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zone` (
  `TzIndex` bigint NOT NULL,
  `TimeZone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `DisplayName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `MinuteDiff` smallint NOT NULL,
  PRIMARY KEY (`TzIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timecard`
--

DROP TABLE IF EXISTS `timecard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timecard` (
  `TimecardID` bigint NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `EmployeeID` bigint NOT NULL,
  `Status` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ActiveRate` int NOT NULL,
  `BreakClockOut` datetime(3) DEFAULT NULL,
  `PrintTime` datetime(3) DEFAULT NULL,
  `PrintVersion` int NOT NULL,
  `LineFind` int NOT NULL,
  `Page` int NOT NULL,
  `ClockStatus` int NOT NULL,
  `JobCodeID` int DEFAULT NULL,
  PRIMARY KEY (`TimecardID`),
  UNIQUE KEY `AK_TIMECARD` (`HierStrucID`,`EmployeeID`),
  KEY `IX_TIMECARD_1` (`EmployeeID`),
  KEY `IX_TIMECARD_2` (`JobCodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeclock_parameter`
--

DROP TABLE IF EXISTS `timeclock_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeclock_parameter` (
  `TmClkParmID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `TimeClockEnabled` bit(1) NOT NULL,
  `OptionBits` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `EarlyIn` smallint DEFAULT NULL,
  `LateIn` smallint DEFAULT NULL,
  `EarlyOut` smallint DEFAULT NULL,
  `LateOut` smallint DEFAULT NULL,
  `MinorUnpaidMin` smallint DEFAULT NULL,
  `MinorUnpaidMax` smallint DEFAULT NULL,
  `MinorPaidMin` smallint DEFAULT NULL,
  `MinorPaidMax` smallint DEFAULT NULL,
  `UnpaidMin` smallint DEFAULT NULL,
  `UnpaidMax` smallint DEFAULT NULL,
  `PaidMin` smallint DEFAULT NULL,
  `PaidMax` smallint DEFAULT NULL,
  `StartOfDay` smallint DEFAULT NULL,
  `StartOfWeek` tinyint unsigned DEFAULT NULL,
  `LinesPerCard` smallint DEFAULT NULL,
  `LineFeeds` smallint DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`TmClkParmID`),
  UNIQUE KEY `AK_TIMECLOCK_PARAMETER` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tms_parameter`
--

DROP TABLE IF EXISTS `tms_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tms_parameter` (
  `TmsParamID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `InterfaceID` int DEFAULT NULL,
  `OptionBits` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `OperatorID` bigint DEFAULT NULL,
  `WorkstationID` int DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`TmsParamID`),
  UNIQUE KEY `AK_TMS_PARAMETER` (`HierStrucID`),
  KEY `IX_TMS_PARAMETER_2` (`InterfaceID`),
  KEY `IX_TMS_PARAMETER_3` (`WorkstationID`),
  KEY `IX_TMS_PARAMETER_m1` (`OperatorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `totals`
--

DROP TABLE IF EXISTS `totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `totals` (
  `TransID` bigint NOT NULL AUTO_INCREMENT,
  `PostingTime` datetime(3) NOT NULL,
  `PostingWeekday` tinyint unsigned NOT NULL,
  `PostingMinute` smallint NOT NULL,
  `TransactionTime` datetime(3) NOT NULL,
  `TransactionWeekday` tinyint unsigned NOT NULL,
  `TransactionMinute` smallint NOT NULL,
  `TtlType` int NOT NULL,
  `RevCtrID` int NOT NULL,
  `OrdTypeID` int DEFAULT NULL,
  `DiningTableID` int DEFAULT NULL,
  `EmployeeID` bigint NOT NULL,
  `CashierID` int DEFAULT NULL,
  `JobCodeID` int DEFAULT NULL,
  `WorkstationID` int DEFAULT NULL,
  `ServingPeriodID` int DEFAULT NULL,
  `CheckID` bigint DEFAULT NULL,
  `Data1` bigint DEFAULT NULL,
  `Data2` bigint DEFAULT NULL,
  `Data3` bigint DEFAULT NULL,
  `Data4` bigint DEFAULT NULL,
  `Data5` bigint DEFAULT NULL,
  `Data6` bigint DEFAULT NULL,
  `Data7` bigint DEFAULT NULL,
  `Flags` int NOT NULL,
  `ItemCount` int NOT NULL,
  `Amount1` decimal(21,4) DEFAULT NULL,
  `Amount2` decimal(21,4) DEFAULT NULL,
  `Count1` smallint DEFAULT NULL,
  `Count2` smallint DEFAULT NULL,
  `RoundNumber` smallint DEFAULT NULL,
  `Amount3` decimal(21,6) DEFAULT NULL,
  `Amount4` decimal(21,6) DEFAULT NULL,
  `EmployeeShiftNumber` int DEFAULT NULL,
  `CashierShiftNumber` int DEFAULT NULL,
  `OrdChannelID` bigint DEFAULT NULL,
  PRIMARY KEY (`TransID`,`RevCtrID`),
  KEY `TransID` (`TransID`),
  KEY `IX_TOTALS_12` (`CheckID`),
  KEY `IX_TOTALS_2001` (`RevCtrID`,`TtlType`,`PostingTime`,`EmployeeID`,`Amount1`,`Amount2`,`Count1`,`Count2`),
  KEY `IX_TOTALS_2501` (`OrdTypeID`),
  KEY `IX_TOTALS_4` (`EmployeeID`),
  KEY `IX_TOTALS_6` (`PostingTime`)
) ENGINE=InnoDB AUTO_INCREMENT=816195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `totals_compact`
--

DROP TABLE IF EXISTS `totals_compact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `totals_compact` (
  `TransID` bigint NOT NULL AUTO_INCREMENT,
  `PostingTime` datetime(3) NOT NULL,
  `PostingWeekday` tinyint unsigned NOT NULL,
  `PostingMinute` smallint NOT NULL,
  `TransactionTime` datetime(3) NOT NULL,
  `TransactionWeekday` tinyint unsigned NOT NULL,
  `TransactionMinute` smallint NOT NULL,
  `TtlType` int NOT NULL,
  `RevCtrID` int NOT NULL,
  `OrdTypeID` int DEFAULT NULL,
  `DiningTableID` int DEFAULT NULL,
  `EmployeeID` bigint NOT NULL,
  `CashierID` int DEFAULT NULL,
  `JobCodeID` int DEFAULT NULL,
  `WorkstationID` int DEFAULT NULL,
  `ServingPeriodID` int DEFAULT NULL,
  `CheckID` bigint DEFAULT NULL,
  `Data1` bigint DEFAULT NULL,
  `Data2` bigint DEFAULT NULL,
  `Data3` bigint DEFAULT NULL,
  `Data4` bigint DEFAULT NULL,
  `Data5` bigint DEFAULT NULL,
  `Data6` bigint DEFAULT NULL,
  `Data7` bigint DEFAULT NULL,
  `Flags` int NOT NULL,
  `ItemCount` int NOT NULL,
  `Amount1` decimal(21,4) DEFAULT NULL,
  `Amount2` decimal(21,4) DEFAULT NULL,
  `Count1` smallint DEFAULT NULL,
  `Count2` smallint DEFAULT NULL,
  `RoundNumber` smallint DEFAULT NULL,
  `Amount3` decimal(21,6) DEFAULT NULL,
  `Amount4` decimal(21,6) DEFAULT NULL,
  `TotalsData` longblob,
  `EmployeeShiftNumber` int DEFAULT NULL,
  `CashierShiftNumber` int DEFAULT NULL,
  `OrdChannelID` bigint DEFAULT NULL,
  PRIMARY KEY (`TransID`,`RevCtrID`),
  KEY `TransID` (`TransID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `totals_compact_processed`
--

DROP TABLE IF EXISTS `totals_compact_processed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `totals_compact_processed` (
  `LastProcessedID` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_experience_assignment`
--

DROP TABLE IF EXISTS `user_experience_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_experience_assignment` (
  `UserExpAssignmentID` bigint NOT NULL AUTO_INCREMENT,
  `HierStrucID` bigint NOT NULL,
  `DefaultUserExpObjectNumber` int DEFAULT NULL,
  `DefaultKdsUserExpObjectNumber` int NOT NULL DEFAULT '2',
  PRIMARY KEY (`UserExpAssignmentID`),
  KEY `UserExpAssignmentID` (`UserExpAssignmentID`),
  KEY `IX_USER_EXP_ASSIGNMENT2` (`HierStrucID`)
) ENGINE=InnoDB AUTO_INCREMENT=5547 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_hier_alias`
--

DROP TABLE IF EXISTS `v_hier_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `v_hier_alias` (
  `HierStrucID` bigint NOT NULL,
  `HierUnitID` int DEFAULT NULL,
  `ChangeTime` datetime(3) DEFAULT NULL,
  `AliasHierStrucID` bigint NOT NULL,
  PRIMARY KEY (`HierStrucID`,`AliasHierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_hier_ancestors`
--

DROP TABLE IF EXISTS `v_hier_ancestors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `v_hier_ancestors` (
  `HierStrucID` bigint NOT NULL,
  `AncestorID` bigint NOT NULL,
  `ChangeTime` datetime(3) DEFAULT NULL,
  `lvl` int DEFAULT NULL,
  PRIMARY KEY (`HierStrucID`,`AncestorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_hier_definition_locations`
--

DROP TABLE IF EXISTS `v_hier_definition_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `v_hier_definition_locations` (
  `HierStrucID` bigint NOT NULL,
  `DefLocHierStrucID` bigint NOT NULL,
  `lvl` int DEFAULT NULL,
  PRIMARY KEY (`HierStrucID`,`DefLocHierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_hier_testators`
--

DROP TABLE IF EXISTS `v_hier_testators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `v_hier_testators` (
  `HierUnitID` int DEFAULT NULL,
  `PropertyID` int DEFAULT NULL,
  `RevCtrID` int DEFAULT NULL,
  `SystemHierStrucID` bigint NOT NULL,
  `TestatorHierStrucID` bigint NOT NULL,
  `AncestorLevel` int DEFAULT NULL,
  PRIMARY KEY (`TestatorHierStrucID`,`SystemHierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `v_hierarchy`
--

DROP TABLE IF EXISTS `v_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `v_hierarchy` (
  `HierStrucID` bigint NOT NULL,
  `Parent1` bigint DEFAULT NULL,
  `Parent2` bigint DEFAULT NULL,
  `Parent3` bigint DEFAULT NULL,
  `PropHierStrucID` bigint DEFAULT NULL,
  `PropertyID` int DEFAULT NULL,
  `RevCtrID` int DEFAULT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `NameID` bigint DEFAULT NULL,
  `HierName` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `void_reason`
--

DROP TABLE IF EXISTS `void_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `void_reason` (
  `VoidReasonID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `VoidReasonIndex` smallint NOT NULL,
  `NameID` bigint NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `VoidReasonPostingTime` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`VoidReasonID`),
  KEY `IX_VOID_REASON` (`HierStrucID`),
  KEY `IX_VOID_REASON_2` (`VoidReasonPostingTime`),
  KEY `IX_VOID_REASON_m1` (`NameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_VOID_REASON_VoidReasonPostingTime` BEFORE INSERT ON `void_reason` FOR EACH ROW BEGIN
IF new.VoidReasonPostingTime IS NULL THEN
SET new.VoidReasonPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `workstation`
--

DROP TABLE IF EXISTS `workstation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workstation` (
  `WorkstationID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `ObjectNumber` int DEFAULT NULL,
  `DeviceID` bigint DEFAULT NULL,
  `NameID` bigint DEFAULT NULL,
  `WkstaType` smallint NOT NULL,
  `WkstaSubType` smallint DEFAULT NULL,
  `MaxCheckDetail` int DEFAULT NULL,
  `NextTransNum` int NOT NULL,
  `ThaiTaxRdNum` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CashierNumber` int DEFAULT NULL,
  `NameInternal` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PhysicalID` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ErrorWorkstationNumber` int DEFAULT NULL,
  `HhtOptionBits` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ExtendedCharSet` bit(1) NOT NULL,
  `KeyboardNumber` int DEFAULT NULL,
  `KeyboardFile` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CashDrawers` int DEFAULT NULL,
  `CashDrwrEmpl1ID` bigint DEFAULT NULL,
  `CashDrwrEmpl2ID` bigint DEFAULT NULL,
  `UwsOptionBits` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PcwsAddress` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SarChkNumMin` int NOT NULL,
  `SarChkNumMax` int NOT NULL,
  `PosapiEmployeeID` bigint DEFAULT NULL,
  `LocationID` bigint DEFAULT NULL,
  `LangID` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `WorkstationPostingTime` datetime(3) DEFAULT NULL,
  `DbUpdateFrequency` int DEFAULT NULL,
  `OptionBits` varchar(72) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `WorkstationThemeID` int DEFAULT NULL,
  `WSPubKey` longblob,
  `WSPrivKey` longblob,
  `Configuration` longtext,
  `InactivityTimeout` int DEFAULT NULL,
  `InactivityDialogTimeout` int DEFAULT NULL,
  `AutoOnlineTransLimit` int DEFAULT NULL,
  `CashDrwrBeepTimeout` int DEFAULT NULL,
  `CashDrwrNotifyTimeout` int DEFAULT NULL,
  `LogVerbosity` int DEFAULT NULL,
  `LineFeedsBeforeFormFeed` int DEFAULT NULL,
  `ResolutionRows` int DEFAULT NULL,
  `ResolutionColumns` int DEFAULT NULL,
  `CharacterSet` int DEFAULT NULL,
  `DisplayMode` int DEFAULT NULL,
  `MacroLoopCount` int DEFAULT NULL,
  `ReportTimeout` int DEFAULT NULL,
  `Platform` int DEFAULT NULL,
  `SecAuthKeyID` bigint DEFAULT NULL,
  `ServiceID` int DEFAULT NULL,
  `DrawerOneTillID` int DEFAULT NULL,
  `DrawerTwoTillID` int DEFAULT NULL,
  `PcwsGateway` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PcwsNetmask` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OrdTypeIndex` int DEFAULT NULL,
  `SecAuthOldKeyID` bigint DEFAULT NULL,
  `BarcodeFormatSetObjNum` int DEFAULT NULL,
  `WorkstationClassNum` int DEFAULT NULL,
  `LogModules` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LogUrl` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `ArchiveLogs` bit(1) NOT NULL DEFAULT b'0',
  `PostMsgStats` bit(1) NOT NULL DEFAULT b'0',
  `PostMsgStatsFreq` int DEFAULT NULL,
  `MaxMsgStatsBakFileSize` int DEFAULT NULL,
  `LogMinDiskFreeSpace` int DEFAULT NULL,
  `OverrideDefaultRevCtrID` int DEFAULT NULL,
  `DrawerOneTillGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DrawerTwoTillGuid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `IsLocked` datetime(3) DEFAULT NULL,
  `IsTransLocked` datetime(3) DEFAULT NULL,
  `LocationFromTop` int DEFAULT NULL,
  `LocationFromLeft` int DEFAULT NULL,
  `AdyenSerialNumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `AdyenStoreName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `AppVersionName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `AndroidAppID` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OrdChannelObjNum` int DEFAULT NULL,
  PRIMARY KEY (`WorkstationID`),
  UNIQUE KEY `AK_WORKSTATION` (`HierStrucID`,`ObjectNumber`),
  KEY `IX_WORKSTATION_1` (`WorkstationPostingTime`),
  KEY `IX_WORKSTATION_2` (`DrawerOneTillID`),
  KEY `IX_WORKSTATION_2001` (`WorkstationID`,`ObjectNumber`),
  KEY `IX_WORKSTATION_2002` (`ServiceID`),
  KEY `IX_WORKSTATION_3` (`DrawerTwoTillID`),
  KEY `IX_WORKSTATION_4` (`SecAuthOldKeyID`),
  KEY `IX_WORKSTATION_5` (`SecAuthKeyID`),
  KEY `IX_WORKSTATION_6` (`WorkstationThemeID`),
  KEY `IX_WORKSTATION_7` (`LangID`),
  KEY `IX_WORKSTATION_m1` (`DeviceID`),
  KEY `IX_WORKSTATION_m2` (`NameID`),
  KEY `IX_WORKSTATION_m3` (`LocationID`),
  KEY `IX_WORKSTATION_m4` (`CashDrwrEmpl1ID`),
  KEY `IX_WORKSTATION_m5` (`CashDrwrEmpl2ID`),
  KEY `IX_WORKSTATION_m6` (`PosapiEmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`datauser`@`localhost`*/ /*!50003 TRIGGER `before_insert_WORKSTATION_WorkstationPostingTime` BEFORE INSERT ON `workstation` FOR EACH ROW BEGIN
IF new.WorkstationPostingTime IS NULL THEN
SET new.WorkstationPostingTime = current_timestamp();
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `workstation_device`
--

DROP TABLE IF EXISTS `workstation_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workstation_device` (
  `WorkstationDeviceID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `NameID` bigint DEFAULT NULL,
  `WorkstationID` int NOT NULL,
  `DeviceIndex` smallint NOT NULL,
  `DeviceType` int NOT NULL,
  `DeviceSource` int NOT NULL,
  `DeviceConnection` int NOT NULL,
  `ProgID` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Configuration` longtext NOT NULL,
  PRIMARY KEY (`WorkstationDeviceID`),
  KEY `IX_WORKSTATION_DEVICE_2` (`HierStrucID`),
  KEY `IX_WORKSTATION_DEVICE_3` (`NameID`),
  KEY `IX_WORKSTATION_DEVICE_4` (`WorkstationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workstation_notification`
--

DROP TABLE IF EXISTS `workstation_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workstation_notification` (
  `NotificationType` smallint NOT NULL,
  `ReceiveWksID` int NOT NULL,
  `SendWksID` int DEFAULT NULL,
  `RecID` bigint NOT NULL,
  `Date1` datetime(3) DEFAULT NULL,
  `Date2` datetime(3) DEFAULT NULL,
  `SentTime` datetime(3) NOT NULL,
  `AcceptTime` datetime(3) DEFAULT NULL,
  `RecLogicalID` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`NotificationType`,`ReceiveWksID`,`RecID`),
  KEY `IX_WORKSTATION_NOTIFICATION_2` (`AcceptTime`,`ReceiveWksID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workstation_order_device`
--

DROP TABLE IF EXISTS `workstation_order_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workstation_order_device` (
  `WkstaOrdDvcID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `WorkstationID` int NOT NULL,
  `OrdDvcIndex` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`WkstaOrdDvcID`),
  KEY `IX_WORKSTATION_ORDER_DEVICE` (`HierStrucID`,`WorkstationID`),
  KEY `IX_WORKSTATION_ORDER_DEVICE_2` (`WorkstationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workstation_parameter`
--

DROP TABLE IF EXISTS `workstation_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workstation_parameter` (
  `WkstaParamID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `MaxCheckDetail` int NOT NULL,
  `LinesPerPage` int DEFAULT NULL,
  `KeyboardFile` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `DbUpdateFrequency` int DEFAULT NULL,
  `AutoOnlineTransLimit` int DEFAULT NULL,
  `ReplayMode` smallint DEFAULT NULL,
  `DBUserName` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DbPassword` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `OnDemandReplayFrequencyCheck` int DEFAULT NULL,
  `StatisticsPeriodicUpdateFreq` int DEFAULT NULL,
  `StatisticsInitialUpdateDelay` int DEFAULT NULL,
  `SAPassword` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`WkstaParamID`),
  UNIQUE KEY `AK_WORKSTATION_PARAMETER` (`HierStrucID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workstation_printer`
--

DROP TABLE IF EXISTS `workstation_printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workstation_printer` (
  `WkstaPrtID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `WorkstationID` int NOT NULL,
  `PrinterType` int NOT NULL,
  `DeviceID` bigint DEFAULT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `PrinterID` int DEFAULT NULL,
  `PrinterGroupID` bigint DEFAULT NULL,
  PRIMARY KEY (`WkstaPrtID`),
  KEY `IX_WORKSTATION_PRINTER` (`HierStrucID`,`WorkstationID`),
  KEY `IX_WORKSTATION_PRINTER_2` (`PrinterID`),
  KEY `IX_WORKSTATION_PRINTER_m1` (`DeviceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workstation_rev_ctr_touchscrn`
--

DROP TABLE IF EXISTS `workstation_rev_ctr_touchscrn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workstation_rev_ctr_touchscrn` (
  `WkstaRvcTouchscrnID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `WorkstationID` int NOT NULL,
  `WkstaRvcTscrnIndex` smallint NOT NULL,
  `RevCtrID` int NOT NULL,
  `IsVisible` bit(1) NOT NULL DEFAULT b'1',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `TouchscreenObjNum` int DEFAULT NULL,
  PRIMARY KEY (`WkstaRvcTouchscrnID`),
  KEY `IX_WORKSTATION_REV_CTR_TCHSC_1` (`RevCtrID`),
  KEY `IX_WORKSTATION_REV_CTR_TCHSC_2` (`WorkstationID`),
  KEY `IX_WORKSTATION_REV_CTR_TOUCHSC` (`HierStrucID`,`WorkstationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workstation_routing_group`
--

DROP TABLE IF EXISTS `workstation_routing_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workstation_routing_group` (
  `WkstnRoutingGroupID` int NOT NULL,
  `WorkstationID` int NOT NULL,
  `HierStrucID` bigint NOT NULL,
  `RoutingGroupObjNum` int NOT NULL,
  `OrderDeviceBitMask` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '00000000000000000000000000000000',
  PRIMARY KEY (`WkstnRoutingGroupID`),
  UNIQUE KEY `AK_WORKSTATION_ROUTING_GROUP` (`WorkstationID`,`RoutingGroupObjNum`),
  KEY `IX_WKSTN_ROUTING_GROUP_m2` (`HierStrucID`),
  KEY `IX_WKSTN_ROUTING_GROUP_m3` (`WorkstationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ws_heu_alg_config`
--

DROP TABLE IF EXISTS `ws_heu_alg_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ws_heu_alg_config` (
  `ConfigID` int NOT NULL,
  `HierStrucID` int NOT NULL,
  `WorkstationID` int DEFAULT NULL,
  `ConfigName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ConfigValue` int NOT NULL,
  PRIMARY KEY (`ConfigID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'checkpostingdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-26 16:35:25
