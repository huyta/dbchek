-- MySQL dump 10.13  Distrib 8.0.36-28, for Linux (x86_64)
--
-- Host: localhost    Database: lims-staging
-- ------------------------------------------------------
-- Server version	8.0.36-28.1

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
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acceptablevaluetypes`
--

DROP TABLE IF EXISTS `acceptablevaluetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acceptablevaluetypes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accessioncategories`
--

DROP TABLE IF EXISTS `accessioncategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessioncategories` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `DefaultSlides` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `CatalogSubCategoryId` int DEFAULT NULL,
  `CatalogItemId` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adequecysamples`
--

DROP TABLE IF EXISTS `adequecysamples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adequecysamples` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogSubCategoryID` int DEFAULT NULL,
  `Name` longtext,
  `ParentId` int NOT NULL,
  `Sequence` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analysers`
--

DROP TABLE IF EXISTS `analysers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analysers` (
  `AnalyserID` int NOT NULL AUTO_INCREMENT,
  `AnalyserName` varchar(45) NOT NULL,
  PRIMARY KEY (`AnalyserID`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anatomicalsites`
--

DROP TABLE IF EXISTS `anatomicalsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anatomicalsites` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1573 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anatomicsampleresults`
--

DROP TABLE IF EXISTS `anatomicsampleresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anatomicsampleresults` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SampleId` int NOT NULL,
  `CurrentResult` longtext,
  `OldResult` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `IsCritical` tinyint(1) DEFAULT '0',
  `CriticalFinding` longtext,
  `FSGrossingResult` longtext,
  `CatalogSubCategoryId` int DEFAULT NULL,
  `NationalCancerRegistry` tinyint DEFAULT '0',
  `FSGrossingReportCompleted` tinyint DEFAULT '0',
  `AmendmentReportJson` longtext,
  `VersionId` int DEFAULT '0',
  `VersionIdentifier` longtext,
  PRIMARY KEY (`Id`),
  KEY `idx_anatomicsampleresults__isDeleted` (`IsDeleted`),
  KEY `idx_anatomicsampleresults_sampleId` (`SampleId`)
) ENGINE=InnoDB AUTO_INCREMENT=276633 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ancillary_category`
--

DROP TABLE IF EXISTS `ancillary_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ancillary_category` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `Sequence` int NOT NULL DEFAULT '0',
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ancillary_test`
--

DROP TABLE IF EXISTS `ancillary_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ancillary_test` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Shortform` varchar(50) DEFAULT NULL,
  `AncillaryCategoryId` int NOT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Price` decimal(18,2) NOT NULL DEFAULT '0.00',
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ancillary_test_AncillaryCategoryId` (`AncillaryCategoryId`),
  CONSTRAINT `FK_ancillary_test_ancillary_category_AncillaryCategoryId` FOREIGN KEY (`AncillaryCategoryId`) REFERENCES `ancillary_category` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ancillarytestrequests`
--

DROP TABLE IF EXISTS `ancillarytestrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ancillarytestrequests` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CaseGrossingBlockId` int DEFAULT NULL,
  `GrossingBlockNumber` varchar(64) DEFAULT NULL,
  `StatusId` int NOT NULL,
  `StainMethodId` int NOT NULL,
  `StainId` int NOT NULL,
  `StainerId` int NOT NULL,
  `RequesterId` int NOT NULL,
  `RequestDateTime` datetime NOT NULL,
  `RequestNote` text,
  `SentByUserId` int NOT NULL,
  `SentDateTime` datetime DEFAULT NULL,
  `SentNote` text,
  `ReceivedByUserId` int NOT NULL,
  `ReceivedDateTime` datetime DEFAULT NULL,
  `ReceivedNote` text,
  `SectionedByUserId` int NOT NULL,
  `SectioningCompletedDateTime` datetime DEFAULT NULL,
  `SectioningNote` text,
  `StainedByUserId` int NOT NULL,
  `StainingCompletedDateTime` datetime DEFAULT NULL,
  `StainingNote` text,
  `QcDoneByUserId` int NOT NULL,
  `QcDateTime` datetime DEFAULT NULL,
  `QcNote` text,
  `DistributedByUserId` int NOT NULL,
  `DistributionDateTime` datetime DEFAULT NULL,
  `DistributionNote` text,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` varchar(255) NOT NULL,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `Testing` varchar(255) DEFAULT NULL,
  `LotNo` varchar(255) DEFAULT NULL,
  `KitName` varchar(255) DEFAULT NULL,
  `ReceiveDateTime` datetime DEFAULT NULL,
  `OpenDateTime` datetime DEFAULT NULL,
  `ExpiredDateTime` datetime DEFAULT NULL,
  `AncillaryTestId` int DEFAULT NULL,
  `AncillaryCategoryId` int DEFAULT NULL,
  `SpecimenType` varchar(100) DEFAULT NULL,
  `IsInsufficiented` tinyint(1) NOT NULL DEFAULT '0',
  `IsInsufficient` tinyint(1) NOT NULL DEFAULT '0',
  `OrderItemAccessionNumberId` int DEFAULT NULL,
  `AccessionNumber` varchar(255) DEFAULT NULL,
  `DistributedToUserId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ancillarytestrequests_AncillaryTestId` (`AncillaryTestId`),
  KEY `IX_ancillarytestrequests_AncillaryCategoryId` (`AncillaryCategoryId`),
  KEY `IX_AncillaryTestRequests_OrderItemAccessionNumberId` (`OrderItemAccessionNumberId`),
  KEY `ancillarytestrequests_CreatedTimestamp_IDX` (`CreatedTimestamp`) USING BTREE,
  KEY `ancillarytestrequests_CaseGrossingBlockId_IDX` (`CaseGrossingBlockId`) USING BTREE,
  KEY `ancillarytestrequests_StatusId_IDX` (`StatusId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=527 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ancillarytestrequeststatushistory`
--

DROP TABLE IF EXISTS `ancillarytestrequeststatushistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ancillarytestrequeststatushistory` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AncillaryTestRequestId` int NOT NULL,
  `OldStatusId` int NOT NULL,
  `NewStatusId` int NOT NULL,
  `ChangedByUserId` int NOT NULL,
  `ChangedDateTime` datetime(6) NOT NULL,
  `Note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreatedBy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `UpdatedBy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `Value` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `IX_AncillaryTestRequestStatusHistory_AncillaryTestRequestId` (`AncillaryTestRequestId`),
  CONSTRAINT `FK_ATRStatusHistory_AncillaryTestRequests_ATRId` FOREIGN KEY (`AncillaryTestRequestId`) REFERENCES `ancillarytestrequests` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ancillarytestslides`
--

DROP TABLE IF EXISTS `ancillarytestslides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ancillarytestslides` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` varchar(255) NOT NULL,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `AncillaryTestRequestId` int NOT NULL,
  `AncillaryTestSectionedBy` int NOT NULL,
  `AncillaryTestSectionedDateTime` datetime(6) NOT NULL,
  `AncillaryTestSectionedNotes` text,
  `AncillaryTestSlideNumber` varchar(255) DEFAULT NULL,
  `AncillaryTestSlideNotes` text,
  PRIMARY KEY (`Id`),
  KEY `IDX_AncillaryTestSlides_AncillaryTestRequestId` (`AncillaryTestRequestId`),
  KEY `IDX_AncillaryTestSlides_IsDeleted` (`IsDeleted`),
  CONSTRAINT `FK_AncillaryTestSlides_AncillaryTestRequests` FOREIGN KEY (`AncillaryTestRequestId`) REFERENCES `ancillarytestrequests` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=593 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ancillaryteststatuses`
--

DROP TABLE IF EXISTS `ancillaryteststatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ancillaryteststatuses` (
  `Id` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `antibioticandpanelmappings`
--

DROP TABLE IF EXISTS `antibioticandpanelmappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `antibioticandpanelmappings` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `AntibioticPanelId` int DEFAULT NULL,
  `AntibioticId` int DEFAULT NULL,
  `MICSensitive` varchar(11) DEFAULT NULL,
  `MICSDD` varchar(8) DEFAULT NULL,
  `MICIntermediate` varchar(10) DEFAULT NULL,
  `MICResistant` varchar(10) DEFAULT NULL,
  `DiskDiffusionSensitive` varchar(8) DEFAULT NULL,
  `DiskDiffusionSDD` varchar(5) DEFAULT NULL,
  `DiskDiffusionIntermediate` varchar(6) DEFAULT NULL,
  `DiskDiffusionResistant` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1551 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `antibioticpanels`
--

DROP TABLE IF EXISTS `antibioticpanels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `antibioticpanels` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `antibiotics`
--

DROP TABLE IF EXISTS `antibiotics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `antibiotics` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10017 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ConsumerId` int NOT NULL,
  `ProfessionalId` int NOT NULL,
  `ServiceId` int NOT NULL,
  `EntityId` int NOT NULL,
  `EntityType` longtext,
  `TenantId` bigint NOT NULL,
  `TimeSlotId` bigint NOT NULL,
  `IsCompleted` tinyint(1) NOT NULL,
  `AppointmentDate` datetime(6) NOT NULL,
  `SchedulingChannelId` int NOT NULL,
  `UniqueId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `availabilities`
--

DROP TABLE IF EXISTS `availabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `availabilities` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `WeekDay` int NOT NULL,
  `StartTime` time(6) NOT NULL,
  `EndTime` time(6) NOT NULL,
  `ProfessionalId` int NOT NULL,
  `ServiceId` int NOT NULL,
  `StartDate` datetime(6) NOT NULL,
  `EndDate` datetime(6) NOT NULL,
  `Priority` int NOT NULL,
  `Remarks` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `barcodeconfigsetting`
--

DROP TABLE IF EXISTS `barcodeconfigsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barcodeconfigsetting` (
  `Id` int NOT NULL,
  `OldBarcode` longtext,
  `NextBarcode` longtext,
  `ExternalOldBarcode` longtext,
  `ExternalNextBarcode` longtext,
  `CreatedBy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CreatedTimestamp` datetime NOT NULL,
  `IsDeleted` tinyint NOT NULL,
  `UpdatedBy` longtext,
  `UpdatedTimestamp` datetime DEFAULT NULL,
  `Value` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `barcodesharinggroups`
--

DROP TABLE IF EXISTS `barcodesharinggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barcodesharinggroups` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(100) NOT NULL,
  `Value` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `unique_group_name` (`GroupName`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `casecomplexities`
--

DROP TABLE IF EXISTS `casecomplexities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casecomplexities` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogSubCategoryID` int DEFAULT NULL,
  `Name` longtext,
  `Code` longtext,
  `Sequence` int DEFAULT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `casedistributionexperts`
--

DROP TABLE IF EXISTS `casedistributionexperts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casedistributionexperts` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` int NOT NULL,
  `UserId` int NOT NULL,
  `CaseDistributionId` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `idx_casedistributionexperts_caseDistributionId` (`CaseDistributionId`),
  KEY `idx_casedistributionexperts_roleId` (`RoleId`),
  KEY `idx_casedistributionexperts_userId` (`UserId`),
  KEY `idx_casedistributionexperts_isDeleted` (`IsDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2275657 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `casedistributions`
--

DROP TABLE IF EXISTS `casedistributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casedistributions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemAccessionNumberId` int NOT NULL,
  `AssignedDate` datetime(6) DEFAULT NULL,
  `DistributedDate` datetime(6) DEFAULT NULL,
  `ReassignedDate` datetime(6) DEFAULT NULL,
  `Note` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `casedistributions_unique` (`OrderItemAccessionNumberId`),
  KEY `idx_casedistributions_orderItemAccessionNumberId` (`OrderItemAccessionNumberId`),
  KEY `idx_casedistributions_isDeleted` (`IsDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=569503 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `casegrossingblockembeddings`
--

DROP TABLE IF EXISTS `casegrossingblockembeddings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casegrossingblockembeddings` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CaseGrossingBlockId` int NOT NULL,
  `CaseEmbeddedBy` int NOT NULL,
  `CaseEmbeddedDateTime` datetime(6) NOT NULL,
  `CaseEmbeddedNotes` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `idx_casegrossingblockembeddings_caseGrossingBlockId` (`CaseGrossingBlockId`),
  KEY `idx_casegrossingblockembeddings_caseEmbeddedBy` (`CaseEmbeddedBy`),
  KEY `idx_casegrossingblockembeddings_isDeleted` (`IsDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=665295 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `casegrossingblockprocessings`
--

DROP TABLE IF EXISTS `casegrossingblockprocessings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casegrossingblockprocessings` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CaseGrossingBlockId` int NOT NULL,
  `Processor` int NOT NULL,
  `ProcessingStartDateTime` datetime(6) DEFAULT NULL,
  `ProcessingEndDateTime` datetime(6) DEFAULT NULL,
  `ProcessedBy` int NOT NULL,
  `ProcessingComments` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `idx_casegrossingblockprocessings_caseGrossingBlockId` (`CaseGrossingBlockId`),
  KEY `idx_casegrossingblockprocessings_processedBy` (`ProcessedBy`),
  KEY `idx_casegrossingblockprocessings_isDeleted` (`IsDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=667752 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `casegrossingblocks`
--

DROP TABLE IF EXISTS `casegrossingblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casegrossingblocks` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `GrossingBlockNumber` longtext,
  `BlockComments` longtext,
  `GrossingBlockStatus` int DEFAULT NULL,
  `GrossingBlockProcessorID` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `IsBlockProcessed` tinyint(1) NOT NULL,
  `IsBlockEmbedded` tinyint(1) NOT NULL,
  `IsBlockStained` tinyint(1) NOT NULL,
  `IsBlockSectioned` tinyint(1) NOT NULL,
  `OrderItemAccessionNumberId` int NOT NULL,
  `FSGrossingBlockNumber` longtext,
  `FSGrossingBlockComment` longtext,
  `IsSemar` tinyint(1) NOT NULL DEFAULT '0',
  `StainId` int DEFAULT NULL,
  `GrossedBy` int DEFAULT '0',
  `GrossedDateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_casegrossingblocks_OrderItemAccessionNumberId` (`OrderItemAccessionNumberId`),
  KEY `idx_casegrossingblocks_GrossingBlockProcessorID` (`GrossingBlockProcessorID`),
  KEY `idx_casegrossingblocks_GrossedBy` (`GrossedBy`),
  KEY `idx_casegrossingblocks_IsBlockProcessed` (`IsBlockProcessed`),
  KEY `idx_casegrossingblocks_IsBlockEmbedded` (`IsBlockEmbedded`),
  KEY `idx_casegrossingblocks_IsBlockStained` (`IsBlockStained`),
  KEY `idx_casegrossingblocks_IsBlockSectioned` (`IsBlockSectioned`),
  KEY `idx_casegrossingblocks_IsSemar` (`IsSemar`),
  KEY `idx_casegrossingblocks_StainId` (`StainId`),
  KEY `idx_casegrossingblocks_isDeleted` (`IsDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=680653 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `casegrossingblocksections`
--

DROP TABLE IF EXISTS `casegrossingblocksections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casegrossingblocksections` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CaseGrossBlockId` int NOT NULL,
  `CaseSectionedBy` int NOT NULL,
  `CaseSectionedDateTime` datetime(6) NOT NULL,
  `CaseSectionedNotes` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `casegrossingblocksectionslides`
--

DROP TABLE IF EXISTS `casegrossingblocksectionslides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casegrossingblocksectionslides` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CaseSectioningSlideAutoStainerID` int NOT NULL,
  `CaseSectioningSlideNumber` longtext,
  `CaseSectioningSlideComments` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `CaseGrossBlockId` int NOT NULL,
  `CaseSectionedBy` int NOT NULL,
  `CaseSectionedDateTime` datetime(6) NOT NULL,
  `CaseSectionedNotes` longtext,
  `CaseStainedBy` int DEFAULT NULL,
  `CaseStainedDateTime` datetime(6) DEFAULT NULL,
  `CaseStainedNotes` longtext,
  `StainMethodId` int DEFAULT NULL,
  `StainId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_casegrossingblocksectionslides_CaseGrossBlockId` (`CaseGrossBlockId`),
  KEY `idx_casegrossingblocksectionslides_StainMethodId` (`StainMethodId`),
  KEY `idx_casegrossingblocksectionslides_StainId` (`StainId`),
  KEY `idx_casegrossingblocksectionslides_IsDeleted` (`IsDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=663674 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `casegrossingblockstatuschanges`
--

DROP TABLE IF EXISTS `casegrossingblockstatuschanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casegrossingblockstatuschanges` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CaseGrossingBlockId` int NOT NULL,
  `OldCaseGrossingBlocksStatusId` int DEFAULT NULL,
  `NewCaseGrossingBlocksStatusId` int DEFAULT NULL,
  `DateChanged` datetime(6) DEFAULT NULL,
  `ChangedBy` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` int NOT NULL,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` int NOT NULL,
  `Value` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=566144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `casegrossings`
--

DROP TABLE IF EXISTS `casegrossings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casegrossings` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemAccessionNumberId` int NOT NULL,
  `CaseGrossedAssistedByMLTUserID` int NOT NULL,
  `CaseGrossingNotes` longtext,
  `SampleCompletelyConsumed` tinyint(1) NOT NULL,
  `CaseGrossedDateTime` datetime(6) NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `caseprocessingdetails`
--

DROP TABLE IF EXISTS `caseprocessingdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caseprocessingdetails` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemAccessionNumberId` int NOT NULL,
  `CaseProcessingDateTime` datetime(6) DEFAULT NULL,
  `ProcessedBy` int NOT NULL,
  `ProcessingComments` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `CaseStainedDateTime` datetime(6) DEFAULT NULL,
  `StainedBy` int DEFAULT NULL,
  `StainingComments` longtext,
  `IsCoreLabSmear` tinyint(1) NOT NULL DEFAULT '0',
  `IsHospitalSmear` tinyint(1) NOT NULL DEFAULT '0',
  `ManualProcessingBy` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OrderItemAccessionNumberId` (`OrderItemAccessionNumberId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=302712 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `caseprocessingexpertdetails`
--

DROP TABLE IF EXISTS `caseprocessingexpertdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caseprocessingexpertdetails` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` int NOT NULL,
  `UserId` int NOT NULL,
  `CaseProcessingExpertID` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `caseprocessingexpertdetails_CaseProcessingExpertID_IDX` (`CaseProcessingExpertID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1152917 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `caseprocessingexperts`
--

DROP TABLE IF EXISTS `caseprocessingexperts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caseprocessingexperts` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemAccessionNumberId` int NOT NULL,
  `AssignedDate` datetime(6) DEFAULT NULL,
  `DistributedDate` datetime(6) DEFAULT NULL,
  `ReassignedDate` datetime(6) DEFAULT NULL,
  `Note` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `idx_caseprocessingexperts_Isdeleted` (`IsDeleted`),
  KEY `idx_caseprocessingexperts_OrderItemAccessionNumberId` (`OrderItemAccessionNumberId`)
) ENGINE=InnoDB AUTO_INCREMENT=288588 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `caseprocessingslides`
--

DROP TABLE IF EXISTS `caseprocessingslides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caseprocessingslides` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CaseProcessingDetailID` int NOT NULL,
  `SlideNumber` longtext,
  `MethodId` int DEFAULT NULL,
  `StainId` int DEFAULT NULL,
  `Comments` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `HemoStainId` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=357017 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cassettesprinted`
--

DROP TABLE IF EXISTS `cassettesprinted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cassettesprinted` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `colour` varchar(100) NOT NULL,
  `quantity` int NOT NULL,
  `createdtimestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `idx_createdtimestamp` (`createdtimestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=1030 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogcategories`
--

DROP TABLE IF EXISTS `catalogcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogcategories` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `TelNo` longtext,
  `ExtNo` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogitemaccessioncategories`
--

DROP TABLE IF EXISTS `catalogitemaccessioncategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogitemaccessioncategories` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogItemId` int NOT NULL,
  `AccessionCategoryId` int NOT NULL,
  `DefaultSlides` int NOT NULL,
  `IsDefault` tinyint(1) NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `CatalogItemId` (`CatalogItemId`) USING BTREE,
  KEY `AccessionCategoryId` (`AccessionCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogitemmachinemaps`
--

DROP TABLE IF EXISTS `catalogitemmachinemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogitemmachinemaps` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogItemId` int DEFAULT NULL,
  `MachineId` int DEFAULT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4320 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogitemmappings`
--

DROP TABLE IF EXISTS `catalogitemmappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogitemmappings` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ParentCatalogItemId` int NOT NULL,
  `ChildCatalogItemId` int DEFAULT NULL,
  `Sequence` int NOT NULL DEFAULT '1',
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `ParentCatalogitemId` (`ParentCatalogItemId`),
  KEY `ChildCatalogitemId` (`ChildCatalogItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=18130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogitempanels`
--

DROP TABLE IF EXISTS `catalogitempanels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogitempanels` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogItemId` int NOT NULL,
  `PanelId` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogitemparameters`
--

DROP TABLE IF EXISTS `catalogitemparameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogitemparameters` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogItemId` int NOT NULL,
  `ParameterId` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `DisplayOrder` int DEFAULT '0',
  `DisplayOnReport` tinyint(1) DEFAULT '0',
  `DisplayName` longtext,
  `DisplayAsBold` tinyint(1) DEFAULT '0',
  `WorkloadCount` tinyint(1) DEFAULT '1',
  `IsMandatory` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `CatalogitemId` (`CatalogItemId`),
  KEY `ParameterId` (`ParameterId`)
) ENGINE=InnoDB AUTO_INCREMENT=10099 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogitemparameters_2`
--

DROP TABLE IF EXISTS `catalogitemparameters_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogitemparameters_2` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogItemId` int NOT NULL,
  `ParameterId` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `DisplayOrder` int DEFAULT '0',
  `DisplayOnReport` tinyint(1) DEFAULT '0',
  `DisplayName` longtext,
  `DisplayAsBold` tinyint(1) DEFAULT '0',
  `WorkloadCount` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `CatalogitemId_2` (`CatalogItemId`),
  KEY `ParameterId_2` (`ParameterId`)
) ENGINE=InnoDB AUTO_INCREMENT=811 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogitemparameterstemp`
--

DROP TABLE IF EXISTS `catalogitemparameterstemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogitemparameterstemp` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogItemId` int NOT NULL,
  `ParameterId` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `DisplayOrder` int DEFAULT '0',
  `DisplayOnReport` tinyint(1) DEFAULT '0',
  `DisplayName` longtext,
  `DisplayAsBold` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7622 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogitemprocessors`
--

DROP TABLE IF EXISTS `catalogitemprocessors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogitemprocessors` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `CatalogItemId` int NOT NULL,
  `ProcessorId` int NOT NULL,
  `IsPreferred` tinyint(1) NOT NULL,
  `DisplayOrder` int NOT NULL,
  `Value` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_CatalogItemProcessors_CatalogItems_CatalogItemId` (`CatalogItemId`),
  KEY `FK_CatalogItemProcessors_Processors_ProcessorId` (`ProcessorId`),
  CONSTRAINT `FK_CatalogItemProcessors_CatalogItems_CatalogItemId` FOREIGN KEY (`CatalogItemId`) REFERENCES `catalogitems` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogitems`
--

DROP TABLE IF EXISTS `catalogitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogitems` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogSubCatagoryId` int NOT NULL,
  `ProcessorId` int NOT NULL,
  `Name` longtext,
  `ShortName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CatalogItemTypeId` int DEFAULT NULL,
  `AccessionNumber` tinyint(1) NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `RemarksToProcessor` longtext,
  `Section` longtext,
  `ValidationLevel` longtext,
  `SIUnit` longtext,
  `PackingOptionId` int DEFAULT NULL,
  `Method` longtext,
  `UrgentTAT` longtext,
  `LTAT` longtext,
  `TAT` longtext,
  `ReorderTime` int DEFAULT NULL,
  `SampleRetentionPeriod` longtext,
  `IsSensitive` tinyint(1) DEFAULT NULL,
  `IsISO` tinyint(1) DEFAULT NULL,
  `IsAllowedForLabUser` tinyint(1) DEFAULT NULL,
  `AllowAppointment` tinyint(1) DEFAULT NULL,
  `IsCnS` tinyint(1) NOT NULL,
  `IsSlitSmear` tinyint(1) NOT NULL,
  `IsOutsourced` tinyint(1) NOT NULL,
  `AnatomicalSiteId` int NOT NULL,
  `SectionId` int NOT NULL,
  `PrintName` longtext,
  `ApproverText` longtext,
  `FootNotes` longtext,
  `NotifyTAT` int NOT NULL,
  `MachineId` int NOT NULL,
  `AccessionCategoryId` int NOT NULL,
  `IsUniqueSampleNoRequired` tinyint(1) DEFAULT NULL,
  `IsBloodTest` tinyint(1) DEFAULT '0',
  `IsPapSmearTest` tinyint(1) DEFAULT '0',
  `ParentCatelogItemId` int DEFAULT NULL,
  `InvalidateAllowedTime` int DEFAULT NULL,
  `AllowInvalidateRejection` tinyint(1) NOT NULL DEFAULT '0',
  `IsAutoCompleteAllowed` tinyint(1) DEFAULT '0',
  `IsRoutineHema` bit(1) NOT NULL DEFAULT b'0',
  `Disclaimer` longtext,
  `IsInactive` tinyint(1) NOT NULL DEFAULT '0',
  `TubeId` int NOT NULL DEFAULT '1',
  `PrintGroup` longtext,
  `BarcodeQuantity` int NOT NULL DEFAULT '1',
  `ExternalBarcodeQuantity` int NOT NULL DEFAULT '1',
  `IsAutoCompleteNeedAllParametersFilled` tinyint(1) NOT NULL DEFAULT '0',
  `UrgentLTAT` longtext,
  `IsAutoGenPrelimaryReport` tinyint(1) NOT NULL DEFAULT '0',
  `IsShowPrelimaryReportButton` tinyint(1) NOT NULL DEFAULT '0',
  `TatLtatWeekendPhInclusion` tinyint NOT NULL DEFAULT '0',
  `IsUrgentNotAllowed` tinyint(1) NOT NULL DEFAULT '0',
  `IsAppointmentRequired` tinyint(1) NOT NULL DEFAULT '0',
  `IsMoreTubeRequired` tinyint(1) NOT NULL DEFAULT '0',
  `Information` longtext,
  `SharingGroupId` int DEFAULT NULL,
  `showPerPatForm` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `idx_catalogitems_catalogItemTypeId` (`CatalogItemTypeId`),
  KEY `idx_catalogitems_isOutsourced` (`IsOutsourced`),
  KEY `idx_catalogitems_catalogSubCatagoryId` (`CatalogSubCatagoryId`),
  KEY `idx_catalogitems_processorId` (`ProcessorId`),
  KEY `idx_catalogitems_isDeleted` (`IsDeleted`),
  KEY `idx_catalogitems_isSensitive` (`IsSensitive`),
  KEY `idx_catalogitems_isAutoCompleteNeedAllParametersFilled` (`IsAutoCompleteNeedAllParametersFilled`),
  KEY `idx_catalogitems_isAutoCompleteAllowed` (`IsAutoCompleteAllowed`),
  KEY `idx_catalogitems_sectionId` (`SectionId`),
  KEY `idx_catalogitems_isCnS` (`IsCnS`),
  KEY `idx_catalogitems_isBloodTest` (`IsBloodTest`),
  KEY `catalogitems_ShortName_IDX` (`ShortName`) USING BTREE,
  CONSTRAINT `FK_CatalogItems_CatalogItemTypes_CatalogItemTypeId` FOREIGN KEY (`CatalogItemTypeId`) REFERENCES `catalogitemtypes` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2408 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogitems_2`
--

DROP TABLE IF EXISTS `catalogitems_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogitems_2` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogSubCatagoryId` int NOT NULL,
  `ProcessorId` int NOT NULL,
  `Name` longtext,
  `ShortName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CatalogItemTypeId` int DEFAULT NULL,
  `AccessionNumber` tinyint(1) NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `RemarksToProcessor` longtext,
  `Section` longtext,
  `ValidationLevel` longtext,
  `SIUnit` longtext,
  `PackingOptionId` int DEFAULT NULL,
  `Method` longtext,
  `UrgentTAT` longtext,
  `LTAT` longtext,
  `TAT` longtext,
  `ReorderTime` int DEFAULT NULL,
  `SampleRetentionPeriod` longtext,
  `IsSensitive` tinyint(1) DEFAULT NULL,
  `IsISO` tinyint(1) DEFAULT NULL,
  `IsAllowedForLabUser` tinyint(1) DEFAULT NULL,
  `AllowAppointment` tinyint(1) DEFAULT NULL,
  `IsCnS` tinyint(1) NOT NULL,
  `IsSlitSmear` tinyint(1) NOT NULL,
  `IsOutsourced` tinyint(1) NOT NULL,
  `AnatomicalSiteId` int NOT NULL,
  `SectionId` int NOT NULL,
  `PrintName` longtext,
  `ApproverText` longtext,
  `FootNotes` longtext,
  `NotifyTAT` int NOT NULL,
  `MachineId` int NOT NULL,
  `AccessionCategoryId` int NOT NULL,
  `IsUniqueSampleNoRequired` tinyint(1) DEFAULT NULL,
  `IsBloodTest` tinyint(1) DEFAULT '0',
  `IsPapSmearTest` tinyint(1) DEFAULT '0',
  `ParentCatelogItemId` int DEFAULT NULL,
  `InvalidateAllowedTime` int DEFAULT NULL,
  `IsAutoCompleteAllowed` tinyint(1) DEFAULT '0',
  `IsRoutineHema` bit(1) NOT NULL DEFAULT b'0',
  `Disclaimer` longtext,
  `IsInactive` tinyint(1) NOT NULL DEFAULT '0',
  `TubeId` int NOT NULL DEFAULT '1',
  `PrintGroup` longtext,
  `BarcodeQuantity` int NOT NULL DEFAULT '1',
  `ExternalBarcodeQuantity` int NOT NULL DEFAULT '1',
  `IsAutoCompleteNeedAllParametersFilled` tinyint(1) NOT NULL DEFAULT '0',
  `UrgentLTAT` longtext,
  `IsAutoGenPrelimaryReport` tinyint(1) NOT NULL DEFAULT '0',
  `IsShowPrelimaryReportButton` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `idx_catalogitems_2_catalogItemTypeId` (`CatalogItemTypeId`),
  KEY `idx_catalogitems_2_isOutsourced` (`IsOutsourced`),
  KEY `idx_catalogitems_2_catalogSubCatagoryId` (`CatalogSubCatagoryId`),
  KEY `idx_catalogitems_2_processorId` (`ProcessorId`),
  KEY `idx_catalogitems_2_isDeleted` (`IsDeleted`),
  KEY `idx_catalogitems_2_isSensitive` (`IsSensitive`),
  KEY `idx_catalogitems_2_isAutoCompleteNeedAllParametersFilled` (`IsAutoCompleteNeedAllParametersFilled`),
  KEY `idx_catalogitems_2_isAutoCompleteAllowed` (`IsAutoCompleteAllowed`),
  KEY `idx_catalogitems_2_sectionId` (`SectionId`),
  KEY `idx_catalogitems_2_isCnS` (`IsCnS`),
  KEY `idx_catalogitems_2_isBloodTest` (`IsBloodTest`),
  KEY `catalogitems_2_ShortName_IDX` (`ShortName`) USING BTREE,
  CONSTRAINT `FK_CatalogItems_2_CatalogItemTypes_CatalogItemTypeId` FOREIGN KEY (`CatalogItemTypeId`) REFERENCES `catalogitemtypes` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogitemstemp`
--

DROP TABLE IF EXISTS `catalogitemstemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogitemstemp` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogSubCatagoryId` int NOT NULL,
  `ProcessorId` int NOT NULL,
  `Name` longtext,
  `ShortName` longtext,
  `CatalogItemTypeId` int DEFAULT NULL,
  `AccessionNumber` tinyint(1) NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `RemarksToProcessor` longtext,
  `Section` longtext,
  `ValidationLevel` longtext,
  `SIUnit` longtext,
  `PackingOptionId` int DEFAULT NULL,
  `Method` longtext,
  `UrgentLTAT` longtext,
  `LTAT` longtext,
  `TAT` longtext,
  `ReorderTime` int DEFAULT NULL,
  `SampleRetentionPeriod` longtext,
  `IsSensitive` tinyint(1) DEFAULT NULL,
  `IsISO` tinyint(1) DEFAULT NULL,
  `IsAllowedForLabUser` tinyint(1) DEFAULT NULL,
  `AllowAppointment` tinyint(1) DEFAULT NULL,
  `IsCnS` tinyint(1) NOT NULL,
  `IsSlitSmear` tinyint(1) NOT NULL,
  `IsOutsourced` tinyint(1) NOT NULL,
  `AnatomicalSiteId` int NOT NULL,
  `SectionId` int NOT NULL,
  `PrintName` longtext,
  `ApproverText` longtext,
  `FootNotes` longtext,
  `NotifyTAT` int NOT NULL,
  `MachineId` int NOT NULL,
  `AccessionCategoryId` int NOT NULL,
  `IsUniqueSampleNoRequired` tinyint(1) DEFAULT NULL,
  `IsBloodTest` tinyint(1) DEFAULT '0',
  `IsPapSmearTest` tinyint(1) DEFAULT '0',
  `ParentCatelogItemId` int DEFAULT NULL,
  `InvalidateAllowedTime` int DEFAULT NULL,
  `IsAutoCompleteAllowed` tinyint(1) DEFAULT '0',
  `IsRoutineHema` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`Id`),
  KEY `FK_CatalogItems_CatalogItemTypes_CatalogItemTypeId` (`CatalogItemTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=1783 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogitemtypes`
--

DROP TABLE IF EXISTS `catalogitemtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogitemtypes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catalogsubcategories`
--

DROP TABLE IF EXISTS `catalogsubcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogsubcategories` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Extensions` longtext,
  `CatalogCategoryId` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `idx_catalogsubcategories_catalogCategoryId` (`CatalogCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Code` varchar(64) NOT NULL,
  `Text` text,
  `Value` int DEFAULT '0',
  `IsDeleted` tinyint(1) DEFAULT '0',
  `CreatedTimestamp` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `UpdatedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Code` (`Code`),
  KEY `IX_IsDeleted` (`IsDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consumers`
--

DROP TABLE IF EXISTS `consumers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nric` longtext,
  `HonorificId` int NOT NULL,
  `Name` longtext,
  `Email` longtext,
  `MobileNo` longtext,
  `CountryCode` longtext,
  `BirthDate` datetime(6) DEFAULT NULL,
  `GenderId` int NOT NULL,
  `IsMalaysian` tinyint(1) NOT NULL,
  `EthnicityId` int NOT NULL,
  `ExternalMRN` longtext,
  `Address` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `LastName` longtext,
  `FirstName` longtext,
  `nric_type` varchar(50) DEFAULT 'nric',
  `nationality` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_consumers_isDeleted` (`IsDeleted`),
  KEY `idx_consumers_FirstName` (`FirstName`(200)) USING BTREE,
  KEY `idx_consumers_BirthDate` (`BirthDate`) USING BTREE,
  KEY `idx_consumers_nric` (`Nric`(255))
) ENGINE=InnoDB AUTO_INCREMENT=3525444 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consumers_2`
--

DROP TABLE IF EXISTS `consumers_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumers_2` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nric` longtext,
  `HonorificId` int NOT NULL,
  `Name` longtext,
  `Email` longtext,
  `MobileNo` longtext,
  `CountryCode` longtext,
  `BirthDate` datetime(6) NOT NULL,
  `GenderId` int NOT NULL,
  `IsMalaysian` tinyint(1) NOT NULL,
  `EthnicityId` int NOT NULL,
  `ExternalMRN` longtext,
  `Address` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `LastName` longtext,
  `FirstName` longtext,
  PRIMARY KEY (`Id`),
  KEY `idx_consumers_2_isDeleted` (`IsDeleted`),
  KEY `idx_consumers_2_FirstName` (`FirstName`(200)) USING BTREE,
  KEY `idx_consumers_2_BirthDate` (`BirthDate`) USING BTREE,
  KEY `idx_consumers_2_nric` (`Nric`(255))
) ENGINE=InnoDB AUTO_INCREMENT=47410 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consumers_bk`
--

DROP TABLE IF EXISTS `consumers_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumers_bk` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nric` longtext,
  `HonorificId` int NOT NULL,
  `Name` longtext,
  `Email` longtext,
  `MobileNo` longtext,
  `CountryCode` longtext,
  `BirthDate` datetime(6) NOT NULL,
  `GenderId` int NOT NULL,
  `IsMalaysian` tinyint(1) NOT NULL,
  `EthnicityId` int NOT NULL,
  `ExternalMRN` longtext,
  `Address` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `LastName` longtext,
  `FirstName` longtext,
  PRIMARY KEY (`Id`),
  KEY `idx_consumers_isDeleted` (`IsDeleted`),
  KEY `idx_consumers_FirstName` (`FirstName`(200)) USING BTREE,
  KEY `idx_consumers_BirthDate` (`BirthDate`) USING BTREE,
  KEY `idx_consumers_nric` (`Nric`(255))
) ENGINE=InnoDB AUTO_INCREMENT=3524524 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consumers_temp`
--

DROP TABLE IF EXISTS `consumers_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumers_temp` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nric` longtext,
  `HonorificId` int NOT NULL,
  `Name` longtext,
  `Email` longtext,
  `MobileNo` longtext,
  `CountryCode` longtext,
  `BirthDate` datetime(6) NOT NULL,
  `GenderId` int NOT NULL,
  `IsMalaysian` tinyint(1) NOT NULL,
  `EthnicityId` int NOT NULL,
  `ExternalMRN` longtext,
  `Address` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `LastName` longtext,
  `FirstName` longtext,
  PRIMARY KEY (`Id`),
  KEY `idx_consumers_nric` (`IsDeleted`,`Nric`(100)) /*!80000 INVISIBLE */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `containersizes`
--

DROP TABLE IF EXISTS `containersizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `containersizes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogSubCategoryID` int DEFAULT NULL,
  `ContainerID` int DEFAULT NULL,
  `Name` longtext,
  `ParentId` int NOT NULL,
  `Sequence` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `culturepanels`
--

DROP TABLE IF EXISTS `culturepanels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `culturepanels` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `culturepaneltestmappings`
--

DROP TABLE IF EXISTS `culturepaneltestmappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `culturepaneltestmappings` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `CulturePanelID` int DEFAULT NULL,
  `CultureTestID` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `culturetesthelpvalues`
--

DROP TABLE IF EXISTS `culturetesthelpvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `culturetesthelpvalues` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Sequence` int NOT NULL,
  `CultureTestID` int NOT NULL,
  `HelpValue` longtext,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=714 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `culturetests`
--

DROP TABLE IF EXISTS `culturetests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `culturetests` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datatypes`
--

DROP TABLE IF EXISTS `datatypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datatypes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datavalues`
--

DROP TABLE IF EXISTS `datavalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datavalues` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DataTypeId` int NOT NULL,
  `Name` longtext,
  `ParentId` int NOT NULL,
  `ShortCode` longtext,
  `Remarks` longtext,
  `Sequence` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `DataTypeId` (`DataTypeId`) USING BTREE,
  KEY `ParentId` (`ParentId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2028 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `designations`
--

DROP TABLE IF EXISTS `designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designations` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `code` longtext,
  `DesignationName` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `IsDeleted` (`IsDeleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diskdiffreferenceranges`
--

DROP TABLE IF EXISTS `diskdiffreferenceranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diskdiffreferenceranges` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Range` longtext,
  `RangeValue` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drugcomments`
--

DROP TABLE IF EXISTS `drugcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drugcomments` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `CreatedTimestamp` datetime(6) DEFAULT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `IsDeleted` (`IsDeleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `druglabsampleresults`
--

DROP TABLE IF EXISTS `druglabsampleresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `druglabsampleresults` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SampleId` int NOT NULL,
  `CurrentResult` longtext,
  `OldResult` longtext,
  `AmendmentReportJson` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `SampleId` (`SampleId`)
) ENGINE=InnoDB AUTO_INCREMENT=484388 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drugmethods`
--

DROP TABLE IF EXISTS `drugmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drugmethods` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `CreatedTimestamp` datetime(6) DEFAULT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `duplicated_casedistributions`
--

DROP TABLE IF EXISTS `duplicated_casedistributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `duplicated_casedistributions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `OrderItemAccessionNumberId` int DEFAULT NULL,
  `isdeleted` tinyint(1) DEFAULT NULL,
  `updateby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ethnicities`
--

DROP TABLE IF EXISTS `ethnicities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ethnicities` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extraslotpoolclinics`
--

DROP TABLE IF EXISTS `extraslotpoolclinics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extraslotpoolclinics` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ExtraSlotPoolId` int NOT NULL,
  `ClinicId` int NOT NULL,
  `Value` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `idx_extraslotpoolclinic_pool_clinic` (`ExtraSlotPoolId`,`ClinicId`),
  KEY `idx_extraslotpoolclinics_clinicid` (`ClinicId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `extraslotpools`
--

DROP TABLE IF EXISTS `extraslotpools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extraslotpools` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TimeSlotId` int NOT NULL,
  `Date` date NOT NULL,
  `ExtraSlotCount` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedTimestamp` datetime DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `UpdatedTimestamp` datetime DEFAULT NULL,
  `Value` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `idx_extraslotpool_timeslot_date` (`TimeSlotId`,`Date`),
  KEY `idx_extraslotpools_date` (`Date`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filestores`
--

DROP TABLE IF EXISTS `filestores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filestores` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EntityId` int NOT NULL,
  `EntityType` longtext NOT NULL,
  `FileName` longtext NOT NULL,
  `FilePath` longtext NOT NULL,
  `IsLocal` tinyint(1) NOT NULL,
  `Remarks` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `FileType` longtext NOT NULL,
  `UploadedDate` datetime(6) NOT NULL,
  `UploadedBy` longtext NOT NULL,
  `FileSubType` longtext,
  `IsApproved` tinyint(1) NOT NULL DEFAULT '0',
  `IsLabOnly` tinyint(1) NOT NULL DEFAULT '0',
  `BatchUploadId` bigint DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_filestores_EntityId_EntityType_Multi` (`EntityId`,`EntityType`(500)),
  KEY `idx_filestores_EntityId` (`EntityId`),
  KEY `idx_filestores_EntityType` (`EntityType`(500))
) ENGINE=InnoDB AUTO_INCREMENT=2630200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formtemplates`
--

DROP TABLE IF EXISTS `formtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formtemplates` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Value` int NOT NULL DEFAULT '0',
  `DocumentName` longtext NOT NULL,
  `DocumentPath` longtext NOT NULL,
  `Name` longtext NOT NULL,
  `Description` longtext NOT NULL,
  `CatalogCategoryId` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genders`
--

DROP TABLE IF EXISTS `genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genders` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `honorifics`
--

DROP TABLE IF EXISTS `honorifics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `honorifics` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hpvdnateststatuses`
--

DROP TABLE IF EXISTS `hpvdnateststatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hpvdnateststatuses` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogSubCategoryID` int DEFAULT NULL,
  `Name` longtext,
  `ParentId` int NOT NULL,
  `Sequence` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `incubationconditions`
--

DROP TABLE IF EXISTS `incubationconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incubationconditions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `laborganismantibioticpanels`
--

DROP TABLE IF EXISTS `laborganismantibioticpanels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laborganismantibioticpanels` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LabOrganismId` int NOT NULL,
  `AntibioticPanelID` int NOT NULL DEFAULT '0',
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2665 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `laborganisms`
--

DROP TABLE IF EXISTS `laborganisms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laborganisms` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Code` longtext,
  `Name` longtext,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `IsAtcc` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10702 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lbctypes`
--

DROP TABLE IF EXISTS `lbctypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lbctypes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogSubCategoryID` int DEFAULT NULL,
  `Name` longtext,
  `ParentId` int NOT NULL,
  `Sequence` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `linkstores`
--

DROP TABLE IF EXISTS `linkstores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `linkstores` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EntityId` int NOT NULL,
  `EntityType` varchar(100) DEFAULT NULL,
  `LinkName` varchar(500) DEFAULT NULL,
  `WebLink` varchar(2000) DEFAULT NULL,
  `Remarks` varchar(1000) DEFAULT NULL,
  `UploadedDate` datetime NOT NULL,
  `UploadedBy` varchar(255) DEFAULT NULL,
  `IsApproved` tinyint(1) NOT NULL DEFAULT '0',
  `IsLabOnly` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedTimestamp` datetime NOT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  `UpdatedTimestamp` datetime DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `Value` int NOT NULL,
  `BatchUploadId` bigint DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_LinkStores_EntityId_EntityType` (`EntityId`,`EntityType`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logs_audit`
--

DROP TABLE IF EXISTS `logs_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_audit` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `action_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `action_type` enum('INSERT','UPDATE','DELETE') DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `old_values` json DEFAULT NULL,
  `new_values` json DEFAULT NULL,
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2733958 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `machines`
--

DROP TABLE IF EXISTS `machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machines` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `Name` (`Name`(100)),
  KEY `IsDeleted` (`IsDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maillogs`
--

DROP TABLE IF EXISTS `maillogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maillogs` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Message` longtext,
  `IsSuccess` tinyint(1) NOT NULL,
  `Response` longtext,
  `SentDateTime` datetime(6) NOT NULL,
  `SentBy` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `EntityId` int NOT NULL,
  `EntityType` longtext,
  PRIMARY KEY (`Id`),
  KEY `EntityId` (`EntityId`),
  KEY `EntityType` (`EntityType`(500)),
  KEY `EntityType_EntityId_Multi` (`EntityId`,`EntityType`(500)),
  KEY `maillogs_IsSuccess_IDX` (`IsSuccess`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128461501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `maillogstemp2`
--

DROP TABLE IF EXISTS `maillogstemp2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maillogstemp2` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Message` longtext,
  `IsSuccess` tinyint(1) NOT NULL,
  `Response` longtext,
  `SentDateTime` datetime(6) NOT NULL,
  `SentBy` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `EntityId` int NOT NULL,
  `EntityType` longtext,
  PRIMARY KEY (`Id`),
  KEY `idx_maillogs` (`EntityId`,`EntityType`(100))
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `measurementunits`
--

DROP TABLE IF EXISTS `measurementunits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measurementunits` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `DisplayText` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CultureId` int DEFAULT NULL,
  `Date` longtext,
  `Time` longtext,
  `MediaTypeName` longtext,
  `MediaTypeId` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mediatypeincubationconditionmappings`
--

DROP TABLE IF EXISTS `mediatypeincubationconditionmappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mediatypeincubationconditionmappings` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `MediaTypeID` int DEFAULT NULL,
  `IncubationConditionId` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=612 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mediatypes`
--

DROP TABLE IF EXISTS `mediatypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mediatypes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `micreferenceranges`
--

DROP TABLE IF EXISTS `micreferenceranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `micreferenceranges` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Range` longtext,
  `RangeValue` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `morphologies`
--

DROP TABLE IF EXISTS `morphologies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `morphologies` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `CatalogSubCatagoryId` int NOT NULL,
  `Sequence` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `Code` longtext,
  PRIMARY KEY (`Id`),
  KEY `CatalogSubCategoryId` (`CatalogSubCatagoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=1425 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nonneoplasticfindings`
--

DROP TABLE IF EXISTS `nonneoplasticfindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nonneoplasticfindings` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogSubCategoryID` int DEFAULT NULL,
  `Name` longtext,
  `ParentId` int NOT NULL,
  `Sequence` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `onetimeexceptions`
--

DROP TABLE IF EXISTS `onetimeexceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `onetimeexceptions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ServiceProviderId` int NOT NULL,
  `ValidFrom` datetime(6) NOT NULL,
  `ValidThru` datetime(6) NOT NULL,
  `Reason` longtext,
  `DisplayText` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `onetimeexceptions_ValidFrom_IDX` (`ValidFrom`,`ValidThru`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitemaccessionnumbers`
--

DROP TABLE IF EXISTS `orderitemaccessionnumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemaccessionnumbers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemId` int NOT NULL,
  `AccessionNumber` longtext NOT NULL,
  `ContainerSizeID` int NOT NULL,
  `AnatomicalSite` longtext NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `AccessionNumberCreatedDate` datetime(6) DEFAULT NULL,
  `IsProcessed` tinyint(1) NOT NULL DEFAULT '0',
  `IsStained` tinyint(1) NOT NULL DEFAULT '0',
  `IsGrossed` tinyint(1) NOT NULL DEFAULT '0',
  `IsDistributed` tinyint(1) NOT NULL DEFAULT '0',
  `IsSectioned` tinyint(1) NOT NULL DEFAULT '0',
  `IsEmbedded` tinyint(1) NOT NULL DEFAULT '0',
  `IsCaseAssigned` tinyint(1) NOT NULL DEFAULT '0',
  `SampleCompletelyConsumed` tinyint(1) NOT NULL DEFAULT '0',
  `IsFsGrossed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `idx_orderitemaccessionnumbers_isDeleted` (`IsDeleted`),
  KEY `idx_orderitemaccessionnumbers_orderItemId` (`OrderItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=1107442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitembarcodeassignmentstatus`
--

DROP TABLE IF EXISTS `orderitembarcodeassignmentstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitembarcodeassignmentstatus` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemId` int NOT NULL,
  `Barcode` longtext COLLATE utf8mb4_general_ci,
  `IsBarcodeAssigned` tinyint(1) NOT NULL DEFAULT '0',
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext COLLATE utf8mb4_general_ci,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`Id`),
  KEY `idx_orderitembarcodeassignmentstatus_orderItemId` (`OrderItemId`),
  KEY `idx_orderitembarcodeassignmentstatus_isBarcodeAssignedd` (`IsBarcodeAssigned`),
  KEY `idx_orderitembarcodeassignmentstatus_isDeleted` (`IsDeleted`),
  KEY `idx_orderitembarcodeassignmentstatus_barcode` (`Barcode`(20)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2655697 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitemcriticalvalueinformeddetails`
--

DROP TABLE IF EXISTS `orderitemcriticalvalueinformeddetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemcriticalvalueinformeddetails` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemId` int NOT NULL,
  `InformedBy` int DEFAULT NULL,
  `InformedByDesignationId` int DEFAULT NULL,
  `InformedByDesignationName` longtext,
  `InformedInOfficeHour` tinyint DEFAULT '0',
  `InformedDateTime` datetime DEFAULT NULL,
  `InformedTo` longtext,
  `IsDroppedCall` tinyint(1) NOT NULL DEFAULT '0',
  `IsReadBack` tinyint(1) NOT NULL DEFAULT '0',
  `IsCNVC` tinyint(1) NOT NULL DEFAULT '0',
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `orderitemcriticalvalueinformeddetails_unique` (`OrderItemId`,`IsDeleted`),
  KEY `OrderItemId` (`OrderItemId`) USING BTREE,
  KEY `InformedByDesignationId` (`InformedByDesignationId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2502914 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitemcriticalvalues`
--

DROP TABLE IF EXISTS `orderitemcriticalvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemcriticalvalues` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemId` int NOT NULL,
  `ParameterId` int NOT NULL,
  `CriticalValue` longtext COLLATE utf8mb4_general_ci,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext COLLATE utf8mb4_general_ci,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `orderitemcriticalvalues_unique` (`OrderItemId`,`ParameterId`,`IsDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=411086 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitemdruglabdetails`
--

DROP TABLE IF EXISTS `orderitemdruglabdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemdruglabdetails` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemId` int NOT NULL,
  `BottleSeriesNo` longtext,
  `ReportNo` longtext,
  `RequestingOfficer` longtext,
  `SampleDeliveredBy` longtext,
  `SampleCollectionDate` datetime(6) DEFAULT NULL,
  `BatchNo` varchar(1024) DEFAULT NULL,
  `ReceivedDate` datetime(6) DEFAULT NULL,
  `ReportFormat` longtext,
  `ScreeningResult` longtext,
  `ScreenByUserId` int DEFAULT NULL,
  `ScreeningDateTime` datetime(6) DEFAULT NULL,
  `ResultReturnedDate` datetime(6) DEFAULT NULL,
  `FirstWorklistGeneratedDateTime` datetime DEFAULT NULL,
  `FirstWorklistGeneratedByUserId` int DEFAULT NULL,
  `FirstWorksheetGeneratedDateTime` datetime DEFAULT NULL,
  `FirstWorksheetGeneratedByUserId` int DEFAULT NULL,
  `ResultReturnedTo` longtext,
  `PlasticNumber` longtext,
  `SampleReturnedTo` longtext,
  `ReturnedDate` datetime(6) DEFAULT NULL,
  `SampleReturnNumber` longtext,
  `Value` int NOT NULL,
  `DiscardedDate` datetime(6) DEFAULT NULL,
  `NotifiedDateTime` datetime DEFAULT NULL,
  `SecondNotificationSent` tinyint(1) NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `idx_orderitemdruglabdetails_orderItemId` (`OrderItemId`),
  KEY `idx_batchno_notified` (`BatchNo`(256)),
  KEY `idx_orderitemdruglabdetails_second_notif` (`SecondNotificationSent`,`NotifiedDateTime`,`ResultReturnedDate`),
  KEY `IX_OrderItemDrugLabDetails_FirstWorklistGeneratedDateTime` (`FirstWorklistGeneratedDateTime`),
  KEY `IX_OrderItemDrugLabDetails_FirstWorklistGeneratedByUserId` (`FirstWorklistGeneratedByUserId`),
  KEY `IX_OrderItemDrugLabDetails_FirstWorksheetGeneratedDateTime` (`FirstWorksheetGeneratedDateTime`),
  KEY `IX_OrderItemDrugLabDetails_FirstWorksheetGeneratedByUserId` (`FirstWorksheetGeneratedByUserId`)
) ENGINE=InnoDB AUTO_INCREMENT=672382 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitemdruglabsubtestdetails`
--

DROP TABLE IF EXISTS `orderitemdruglabsubtestdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemdruglabsubtestdetails` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemDrugLabDetailId` int NOT NULL,
  `CatalogSubItemId` int NOT NULL,
  `ScreeningResult` longtext,
  `ScreenByUserId` int DEFAULT NULL,
  `ScreeningDateTime` datetime(6) DEFAULT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=944919 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitemevents`
--

DROP TABLE IF EXISTS `orderitemevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemevents` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemId` int NOT NULL,
  `OldStatusId` int DEFAULT NULL,
  `NewStatusId` int DEFAULT NULL,
  `Reasons` longtext,
  `Date` datetime(6) NOT NULL,
  `ChangedBy` int NOT NULL,
  `Remarks` longtext,
  `InformedTo` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `PackagingTemparature` longtext,
  `LpoReceiptName` longtext,
  PRIMARY KEY (`Id`),
  KEY `FK_OrderItemEvents_OrderItemStatus_NewStatusId` (`NewStatusId`),
  KEY `FK_OrderItemEvents_OrderItemStatus_OldStatusId` (`OldStatusId`),
  CONSTRAINT `FK_OrderItemEvents_OrderItemStatus_NewStatusId` FOREIGN KEY (`NewStatusId`) REFERENCES `orderitemstatus` (`Id`),
  CONSTRAINT `FK_OrderItemEvents_OrderItemStatus_OldStatusId` FOREIGN KEY (`OldStatusId`) REFERENCES `orderitemstatus` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitemgrossings`
--

DROP TABLE IF EXISTS `orderitemgrossings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemgrossings` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemId` int NOT NULL,
  `CaseGrossedAssistedByMLTUserID` int NOT NULL,
  `CaseGrossingNotes` longtext,
  `CaseGrossedDateTime` datetime(6) NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=178063 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitemmachinemaps`
--

DROP TABLE IF EXISTS `orderitemmachinemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemmachinemaps` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemId` int DEFAULT NULL,
  `MachineId` int DEFAULT NULL,
  `Barcode` longtext,
  `OrderItemMachineMapStatusId` int DEFAULT NULL,
  `CatalogItemId` int DEFAULT '0',
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `UnitId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `OrderitemMachineMapStatusIdMulti` (`OrderItemMachineMapStatusId`,`MachineId`),
  KEY `idx_orderitemmachinemaps_orderItemId` (`OrderItemId`),
  KEY `idx_orderitemmachinemaps_machineId` (`MachineId`),
  KEY `idx_orderitemmachinemaps_OrderItemMachineMapStatusId` (`OrderItemMachineMapStatusId`),
  KEY `idx_orderitemmachinemaps_CatalogItemId` (`CatalogItemId`),
  KEY `idx_orderitemmachinemaps_isDeleted` (`IsDeleted`),
  KEY `idx_orderitemmachinemaps_Barcode` (`Barcode`(20)),
  KEY `idx_orderitemmachinemaps_statusId_mahineId_Multi` (`OrderItemMachineMapStatusId`,`MachineId`)
) ENGINE=InnoDB AUTO_INCREMENT=33523408 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitemmachinemapstatus`
--

DROP TABLE IF EXISTS `orderitemmachinemapstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemmachinemapstatus` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitemprintermaps`
--

DROP TABLE IF EXISTS `orderitemprintermaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemprintermaps` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AccessionNumberId` int NOT NULL,
  `CaseGrossingBlockId` int NOT NULL,
  `AccessionNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Color` varchar(50) DEFAULT 'Pink',
  `PatientName` longtext,
  `Barcode` longtext,
  `OrderItemId` int NOT NULL,
  `MachineId` int DEFAULT '0',
  `CatalogItemId` int DEFAULT '0',
  `OrderItemMachineMapStatusId` int NOT NULL,
  `UnitId` int DEFAULT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `NumOfCassettes` int NOT NULL DEFAULT '1',
  `GrossingBlockNumber` longtext,
  `Prefix` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_orderitemprintermaps_orderItemId` (`OrderItemId`),
  KEY `idx_orderitemprintermaps_machineId` (`MachineId`),
  KEY `idx_orderitemprintermaps_CatalogItemId` (`CatalogItemId`),
  KEY `idx_orderitemprintermaps_statusId_machineId` (`OrderItemMachineMapStatusId`,`MachineId`),
  KEY `idx_orderitemprintermaps_isDeleted` (`IsDeleted`),
  KEY `idx_orderitemprintermaps_AccessionNumberId` (`AccessionNumberId`),
  KEY `idx_orderitemprintermaps_CaseGrossingBlockId` (`CaseGrossingBlockId`),
  KEY `orderitemprintermaps_AccessionNumber_IDX` (`AccessionNumber`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitemreasons`
--

DROP TABLE IF EXISTS `orderitemreasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemreasons` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemReasonTypeId` int NOT NULL,
  `Description` longtext,
  `Text` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitemreasontypes`
--

DROP TABLE IF EXISTS `orderitemreasontypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemreasontypes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderId` int NOT NULL,
  `ConsumerID` int NOT NULL,
  `UniqueId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `CatalogItemId` int NOT NULL,
  `Barcode` longtext,
  `Dispatch1Id` varchar(32) DEFAULT NULL,
  `Dispatch2Id` varchar(32) DEFAULT NULL,
  `DispatchId` int DEFAULT NULL,
  `PriorityId` int NOT NULL,
  `CatalogItemTypeId` int NOT NULL,
  `StatusId` int DEFAULT NULL,
  `Quantity` int NOT NULL,
  `ProcessorId` int NOT NULL,
  `AnatomicalSiteId` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `IsPrelimaryReportAvailable` tinyint(1) DEFAULT '0',
  `IsAccessionNumberGenerated` tinyint(1) DEFAULT '0',
  `OrderingSourceId` int NOT NULL,
  `StoreSectionId` int NOT NULL,
  `RequestingDoctor` longtext,
  `SpecialistIncharge` longtext,
  `Diagnosis` longtext,
  `History` longtext,
  `OrderSourceId` longtext,
  `IsAmendmentReportAvailable` tinyint(1) NOT NULL DEFAULT '0',
  `IsFinalReportGenerated` tinyint(1) NOT NULL DEFAULT '0',
  `IsConfidential` tinyint(1) NOT NULL DEFAULT '0',
  `IsSampleDiscarded` tinyint(1) NOT NULL DEFAULT '0',
  `DeleteReason` longtext,
  `DeletedDateTime` datetime DEFAULT NULL,
  `DeletedBy` int DEFAULT NULL,
  `IsInvalidated` tinyint(1) NOT NULL DEFAULT '0',
  `IsInAmendment` tinyint(1) NOT NULL DEFAULT '0',
  `RegistrationDateTime` datetime(6) DEFAULT NULL,
  `isEmailInQueue` tinyint(1) NOT NULL DEFAULT '0',
  `UnitId` int NOT NULL DEFAULT '0',
  `DiscardedBy` int DEFAULT NULL,
  `DiscardedDateTime` datetime DEFAULT NULL,
  `GroupId` int DEFAULT NULL,
  `AddOnBarcode` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `OrderDateSorting_ts` timestamp GENERATED ALWAYS AS (coalesce(`RegistrationDateTime`,`CreatedTimestamp`)) STORED NULL,
  `IsNoDate` tinyint(1) NOT NULL DEFAULT '0',
  `IsNoTime` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `StatusId` (`StatusId`),
  KEY `CatalogitemId` (`CatalogItemId`),
  KEY `RegistrationDate` (`RegistrationDateTime`),
  KEY `AnatomicasiteId` (`AnatomicalSiteId`),
  KEY `CatalogitemtypeId` (`CatalogItemTypeId`),
  KEY `ProcessorId` (`ProcessorId`),
  KEY `ConsumerId` (`ConsumerID`),
  KEY `PriorityId` (`PriorityId`),
  KEY `Barcode` (`Barcode`(10)),
  KEY `MultiIndex` (`Barcode`(10),`RegistrationDateTime`,`StatusId`,`CatalogItemTypeId`,`ConsumerID`),
  KEY `orderitems_IsDeleted_IDX` (`IsDeleted`) USING BTREE,
  KEY `orderitems_OrderId_IDX` (`OrderId`) USING BTREE,
  KEY `orderitems_CreatedTimestamp_IDX` (`CreatedTimestamp`) USING BTREE,
  KEY `orderitems_isEmailInQueue_IDX` (`isEmailInQueue`) USING BTREE,
  KEY `orderitems_AddOnBarcode_IDX` (`AddOnBarcode`),
  KEY `orderitems_UniqueId_IDX` (`UniqueId`) USING BTREE,
  KEY `idx_orderitems_regdt` (`IsDeleted`,`StatusId`,`RegistrationDateTime`,`OrderId`,`CatalogItemId`,`ConsumerID`) /*!80000 INVISIBLE */,
  KEY `idx_orderitems_created` (`IsDeleted`,`StatusId`,`CreatedTimestamp`,`OrderId`,`CatalogItemId`,`ConsumerID`) /*!80000 INVISIBLE */,
  KEY `idx_orderitems_orderdate` (`OrderDateSorting_ts`),
  KEY `idx_Dispatch1Id` (`Dispatch1Id`),
  KEY `idx_Dispatch2Id` (`Dispatch2Id`),
  KEY `orderitems_CreatedBy_IDX` (`CreatedBy`) USING BTREE,
  CONSTRAINT `FK_OrderItems_Catalogitems_CatalogItemId` FOREIGN KEY (`CatalogItemId`) REFERENCES `catalogitems` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_OrderItems_OrderItemStatus_StatusId` FOREIGN KEY (`StatusId`) REFERENCES `orderitemstatus` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26581126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`zcon`@`%`*/ /*!50003 TRIGGER `orderitems_after_update` AFTER UPDATE ON `orderitems` FOR EACH ROW BEGIN
    INSERT INTO orderitems_audit (ChangeType, OrderItemId, OldData, NewData, Barcode, ChangedBy)
    VALUES (
        'UPDATE', 
        OLD.Id, 
        JSON_OBJECT(
        'OrderId', OLD.OrderId,
        'ConsumerID', OLD.ConsumerID,
        'UniqueId', OLD.UniqueId,
        'CatalogItemId', OLD.CatalogItemId,
        'PriorityId', OLD.PriorityId,
        'CatalogItemTypeId', OLD.CatalogItemTypeId,
        'StatusId', OLD.StatusId,
        'Quantity', OLD.Quantity,
        'ProcessorId', OLD.ProcessorId,
        'AnatomicalSiteId', OLD.AnatomicalSiteId,
        'Value', OLD.Value,
        'IsDeleted', OLD.IsDeleted,
        'CreatedTimestamp', OLD.CreatedTimestamp,
        'CreatedBy', OLD.CreatedBy,
        'UpdatedTimestamp', OLD.UpdatedTimestamp,
        'UpdatedBy', OLD.UpdatedBy,
        'IsPrelimaryReportAvailable', OLD.IsPrelimaryReportAvailable,
        'IsAccessionNumberGenerated', OLD.IsAccessionNumberGenerated,
        'OrderingSourceId', OLD.OrderingSourceId,
        'StoreSectionId', OLD.StoreSectionId,
        'RequestingDoctor', OLD.RequestingDoctor,
        'SpecialistIncharge', OLD.SpecialistIncharge,
        'Diagnosis', OLD.Diagnosis,
        'History', OLD.History,
        'OrderSourceId', OLD.OrderSourceId,
        'IsAmendmentReportAvailable', OLD.IsAmendmentReportAvailable,
        'IsFinalReportGenerated', OLD.IsFinalReportGenerated,
        'IsConfidential', OLD.IsConfidential,
        'IsSampleDiscarded', OLD.IsSampleDiscarded,
        'DeleteReason', OLD.DeleteReason,
        'DeletedDateTime', OLD.DeletedDateTime,
        'DeletedBy', OLD.DeletedBy,
        'IsInvalidated', OLD.IsInvalidated,
        'IsInAmendment', OLD.IsInAmendment,
        'RegistrationDateTime', OLD.RegistrationDateTime,
        'isEmailInQueue', OLD.isEmailInQueue,
        'UnitId', OLD.UnitId,
        'Barcode', OLD.Barcode
    ),
    JSON_OBJECT(
        'OrderId', NEW.OrderId,
        'ConsumerID', NEW.ConsumerID,
        'UniqueId', NEW.UniqueId,
        'CatalogItemId', NEW.CatalogItemId,
        'PriorityId', NEW.PriorityId,
        'CatalogItemTypeId', NEW.CatalogItemTypeId,
        'StatusId', NEW.StatusId,
        'Quantity', NEW.Quantity,
        'ProcessorId', NEW.ProcessorId,
        'AnatomicalSiteId', NEW.AnatomicalSiteId,
        'Value', NEW.Value,
        'IsDeleted', NEW.IsDeleted,
        'CreatedTimestamp', NEW.CreatedTimestamp,
        'CreatedBy', NEW.CreatedBy,
        'UpdatedTimestamp', NEW.UpdatedTimestamp,
        'UpdatedBy', NEW.UpdatedBy,
        'IsPrelimaryReportAvailable', NEW.IsPrelimaryReportAvailable,
        'IsAccessionNumberGenerated', NEW.IsAccessionNumberGenerated,
        'OrderingSourceId', NEW.OrderingSourceId,
        'StoreSectionId', NEW.StoreSectionId,
        'RequestingDoctor', NEW.RequestingDoctor,
        'SpecialistIncharge', NEW.SpecialistIncharge,
        'Diagnosis', NEW.Diagnosis,
        'History', NEW.History,
        'OrderSourceId', NEW.OrderSourceId,
        'IsAmendmentReportAvailable', NEW.IsAmendmentReportAvailable,
        'IsFinalReportGenerated', NEW.IsFinalReportGenerated,
        'IsConfidential', NEW.IsConfidential,
        'IsSampleDiscarded', NEW.IsSampleDiscarded,
        'DeleteReason', NEW.DeleteReason,
        'DeletedDateTime', NEW.DeletedDateTime,
        'DeletedBy', NEW.DeletedBy,
        'IsInvalidated', NEW.IsInvalidated,
        'IsInAmendment', NEW.IsInAmendment,
        'RegistrationDateTime', NEW.RegistrationDateTime,
        'isEmailInQueue', NEW.isEmailInQueue,
        'UnitId', NEW.UnitId,
        'Barcode', NEW.Barcode
    ),
        NEW.Barcode, -- Only log the new Barcode field after an update
        NEW.UpdatedBy -- The user who performed the update
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orderitems_audit`
--

DROP TABLE IF EXISTS `orderitems_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems_audit` (
  `AuditId` int NOT NULL AUTO_INCREMENT,
  `ChangeType` enum('UPDATE') NOT NULL,
  `OrderItemId` int NOT NULL,
  `OldData` json DEFAULT NULL,
  `NewData` json DEFAULT NULL,
  `Barcode` longtext,
  `ChangeTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `ChangedBy` longtext,
  PRIMARY KEY (`AuditId`),
  KEY `OrderItemId` (`OrderItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=25394725 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitemstatus`
--

DROP TABLE IF EXISTS `orderitemstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemstatus` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitemstatuschanges`
--

DROP TABLE IF EXISTS `orderitemstatuschanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemstatuschanges` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemId` int NOT NULL,
  `OldStatusId` int DEFAULT NULL,
  `NewStatusId` int DEFAULT NULL,
  `Reasons` longtext,
  `Date` datetime(6) DEFAULT NULL,
  `ChangedBy` int NOT NULL,
  `Remarks` longtext,
  `InformedTo` longtext,
  `Value` int NOT NULL DEFAULT '0',
  `PackingTemparature` longtext,
  `LpoReceiptName` longtext,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `idx_orderitemstatuschanges_orderItemId` (`OrderItemId`),
  KEY `idx_orderitemstatuschanges_oldStatusId` (`OldStatusId`),
  KEY `idx_orderitemstatuschanges_newStatusId` (`NewStatusId`),
  KEY `idx_orderitemstatuschanges_isDeleted` (`IsDeleted`),
  KEY `idx_orderitemstatuschanges_changedBy` (`ChangedBy`),
  KEY `orderitemstatuschanges_Date_IDX` (`Date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=144164520 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`zcon`@`%`*/ /*!50003 TRIGGER `orderitemstatuschanges_after_insert` AFTER INSERT ON `orderitemstatuschanges` FOR EACH ROW BEGIN
    IF NEW.NewStatusId = 3000 OR NEW.NewStatusId = 3300 THEN
        UPDATE orderitems
        SET StatusId = NEW.NewStatusId
        WHERE Id = NEW.OrderItemId
        AND StatusId != NEW.NewStatusId;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orderitemstemp`
--

DROP TABLE IF EXISTS `orderitemstemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemstemp` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderId` int NOT NULL,
  `ConsumerID` int NOT NULL,
  `UniqueId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `CatalogItemId` int NOT NULL,
  `Barcode` longtext,
  `PriorityId` int NOT NULL,
  `CatalogItemTypeId` int NOT NULL,
  `StatusId` int DEFAULT NULL,
  `Quantity` int NOT NULL,
  `ProcessorId` int NOT NULL,
  `AnatomicalSiteId` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `IsPrelimaryReportAvailable` tinyint(1) DEFAULT '0',
  `IsAccessionNumberGenerated` tinyint(1) DEFAULT '0',
  `OrderingSourceId` int NOT NULL,
  `StoreSectionId` int NOT NULL,
  `RequestingDoctor` longtext,
  `SpecialistIncharge` longtext,
  `Diagnosis` longtext,
  `History` longtext,
  `OrderSourceId` longtext,
  `IsAmendmentReportAvailable` tinyint(1) NOT NULL DEFAULT '0',
  `IsFinalReportGenerated` tinyint(1) NOT NULL DEFAULT '0',
  `IsConfidential` tinyint(1) NOT NULL DEFAULT '0',
  `IsSampleDiscarded` tinyint(1) NOT NULL DEFAULT '0',
  `DeleteReason` longtext,
  `DeletedDateTime` datetime DEFAULT NULL,
  `DeletedBy` int DEFAULT NULL,
  `IsInvalidated` tinyint(1) NOT NULL DEFAULT '0',
  `IsInAmendment` tinyint(1) NOT NULL DEFAULT '0',
  `RegistrationDateTime` datetime(6) DEFAULT NULL,
  `isEmailInQueue` tinyint(1) NOT NULL DEFAULT '0',
  `UnitId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `Barcode` (`Barcode`(10)),
  KEY `ConsumerId` (`ConsumerID`),
  KEY `StatusId` (`StatusId`) USING BTREE,
  KEY `CatalogItemId` (`CatalogItemId`) USING BTREE,
  KEY `RegistrationDate` (`RegistrationDateTime`),
  KEY `AnatomicasiteId` (`AnatomicalSiteId`),
  KEY `CatalogitemtypeId` (`CatalogItemTypeId`),
  KEY `ProcessorId` (`ProcessorId`),
  KEY `PriorityId` (`PriorityId`),
  CONSTRAINT `FK_orderitemstemp_Catalogitems_CatalogItemId` FOREIGN KEY (`CatalogItemId`) REFERENCES `catalogitems` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_orderitemstemp_OrderItemStatus_StatusId` FOREIGN KEY (`StatusId`) REFERENCES `orderitemstatus` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9949979 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitemsupplementoryreports`
--

DROP TABLE IF EXISTS `orderitemsupplementoryreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitemsupplementoryreports` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrderItemId` int DEFAULT NULL,
  `SupplementoryReportJson` longtext,
  `IsValidated` tinyint DEFAULT '0',
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9049 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UniqueId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ConsumerId` int NOT NULL,
  `OrderingSourceId` int NOT NULL,
  `StoreSectionId` int NOT NULL,
  `RequestingDoctor` longtext,
  `SpecialistIncharge` longtext,
  `Diagnostic` longtext,
  `History` longtext,
  `Remark` longtext,
  `Date` datetime(6) NOT NULL,
  `OrderSourceId` longtext,
  `Diagnosis` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `ConsumerId` (`ConsumerId`),
  KEY `OrderingSourceId` (`OrderingSourceId`),
  KEY `Date` (`Date`),
  KEY `StoreSectionId` (`StoreSectionId`),
  KEY `UniqueId` (`UniqueId`),
  KEY `idx_orders_IsDeleted_Id` (`IsDeleted`,`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16766167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organismsusceptibilities`
--

DROP TABLE IF EXISTS `organismsusceptibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organismsusceptibilities` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OrganismName` longtext,
  `IsInfectionControl` tinyint(1) NOT NULL,
  `ResistanceMechanismId` int DEFAULT NULL,
  `ResistanceMechanismName` longtext,
  `OrganismPanelId` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `packagingoptions`
--

DROP TABLE IF EXISTS `packagingoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packagingoptions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `papsmearinterpretations`
--

DROP TABLE IF EXISTS `papsmearinterpretations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `papsmearinterpretations` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogSubCategoryID` int DEFAULT NULL,
  `Name` longtext,
  `ParentId` int NOT NULL,
  `Sequence` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `papsmearorganisms`
--

DROP TABLE IF EXISTS `papsmearorganisms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `papsmearorganisms` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogSubCategoryID` int DEFAULT NULL,
  `Name` longtext,
  `ParentId` int NOT NULL,
  `Sequence` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `papsmearsuggestions`
--

DROP TABLE IF EXISTS `papsmearsuggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `papsmearsuggestions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogSubCategoryID` int DEFAULT NULL,
  `Name` longtext,
  `ParentId` int NOT NULL,
  `Sequence` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parameterreferences`
--

DROP TABLE IF EXISTS `parameterreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameterreferences` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ParameterId` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `GenderId` int NOT NULL,
  `IsAgeApplicable` tinyint(1) DEFAULT NULL,
  `AgeFrom` longtext,
  `AgeTo` longtext,
  `AgeVal` longtext,
  `LowerValue` longtext,
  `UpperValue` longtext,
  `DefaultValue` longtext,
  `CriticalLow` longtext,
  `CriticalHigh` longtext,
  `AlertLow` longtext,
  `AlertHigh` longtext,
  `Remark` longtext,
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `LowerValSign` longtext,
  `UpperValSign` longtext,
  `CriticalLowSign` longtext,
  `CriticalHighSign` longtext,
  `FromAgePeriodId` int NOT NULL DEFAULT '0',
  `ToAgePeriodId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6468 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parameters`
--

DROP TABLE IF EXISTS `parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameters` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `AcceptableValueTypeId` int NOT NULL,
  `MeasurementUnitId` int NOT NULL,
  `ReferenceNotes` longtext,
  `PanicRangeNotes` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `Code` int NOT NULL,
  `PrintName` longtext,
  `Technique` longtext,
  `HasHelpValue` tinyint(1) NOT NULL,
  `IsHeader` tinyint(1) NOT NULL,
  `DefaultTextValue` longtext,
  `DecimalDigits` int NOT NULL,
  `HasFormula` tinyint(1) NOT NULL,
  `Formula` longtext,
  `TextRange` longtext,
  `IsAppend` tinyint(1) NOT NULL DEFAULT '0',
  `AllowSharing` tinyint(1) NOT NULL DEFAULT '0',
  `IsManual` tinyint(1) NOT NULL DEFAULT '0',
  `IsHidden` tinyint(1) NOT NULL DEFAULT '0',
  `ParameterDisplayName` longtext,
  `DisplayAsBold` tinyint(1) DEFAULT '0',
  `AllowedVariationPercent` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `ParameterName` (`Name`(100))
) ENGINE=InnoDB AUTO_INCREMENT=1834 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parameters_2`
--

DROP TABLE IF EXISTS `parameters_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameters_2` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `AcceptableValueTypeId` int NOT NULL,
  `MeasurementUnitId` int NOT NULL,
  `ReferenceNotes` longtext,
  `PanicRangeNotes` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `Code` varchar(16) NOT NULL,
  `PrintName` longtext,
  `Technique` longtext,
  `HasHelpValue` tinyint(1) NOT NULL,
  `IsHeader` tinyint(1) NOT NULL,
  `DefaultTextValue` longtext,
  `DecimalDigits` int NOT NULL,
  `HasFormula` tinyint(1) NOT NULL,
  `Formula` longtext,
  `TextRange` longtext,
  `IsAppend` tinyint(1) NOT NULL DEFAULT '0',
  `AllowSharing` tinyint(1) NOT NULL DEFAULT '0',
  `IsManual` tinyint(1) NOT NULL DEFAULT '0',
  `IsHidden` tinyint(1) NOT NULL DEFAULT '0',
  `ParameterDisplayName` longtext,
  `DisplayAsBold` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `ParameterName_2` (`Name`(100))
) ENGINE=InnoDB AUTO_INCREMENT=1129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parameterselectvalues`
--

DROP TABLE IF EXISTS `parameterselectvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameterselectvalues` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ParameterId` int NOT NULL,
  `Name` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `Code` longtext,
  `Sequence` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4419 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permittedhours`
--

DROP TABLE IF EXISTS `permittedhours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permittedhours` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `WeekDay` int NOT NULL,
  `StartTime` time(6) NOT NULL,
  `EndTime` time(6) NOT NULL,
  `ServiceProviderId` int NOT NULL,
  `StartDate` datetime(6) NOT NULL,
  `EndDate` datetime(6) NOT NULL,
  `Priority` int NOT NULL,
  `Remarks` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `priorities`
--

DROP TABLE IF EXISTS `priorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `priorities` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `processors`
--

DROP TABLE IF EXISTS `processors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processors` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Description` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `IsInternal` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `ProcessorName` (`Name`(100)),
  KEY `IsInternal` (`IsInternal`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `professionals`
--

DROP TABLE IF EXISTS `professionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professionals` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recurringexceptions`
--

DROP TABLE IF EXISTS `recurringexceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recurringexceptions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ServiceProviderId` int NOT NULL,
  `DayOfWeek` int NOT NULL,
  `DayOfMonth` int NOT NULL,
  `ValidFrom` datetime(6) NOT NULL,
  `ValidThru` datetime(6) NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resultentrytemplates`
--

DROP TABLE IF EXISTS `resultentrytemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultentrytemplates` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ResultEntryTemplateName` longtext,
  `ResultTemplateTypeId` int NOT NULL,
  `Template` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `CatalogSubCategoryID` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `ResultID` int NOT NULL AUTO_INCREMENT,
  `Analysers_AnalyserID` int NOT NULL,
  `Barcode` varchar(45) NOT NULL,
  `IsSuccessful` tinyint NOT NULL DEFAULT '2',
  `IsResent` tinyint NOT NULL DEFAULT '0',
  `Created` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `Completed` timestamp(3) NULL DEFAULT NULL,
  `Time_Taken` bigint GENERATED ALWAYS AS ((timestampdiff(MICROSECOND,`Created`,`Completed`) / 1000)) VIRTUAL,
  `API` varchar(200) DEFAULT NULL,
  `ResultData` text,
  `APIResponse` text,
  `ResponseStatusCode` smallint DEFAULT NULL,
  `Results_ResultID` int DEFAULT NULL,
  PRIMARY KEY (`ResultID`),
  KEY `fk_Results_Analysers1_idx` (`Analysers_AnalyserID`),
  KEY `fk_Results_Results1_idx` (`Results_ResultID`),
  CONSTRAINT `fk_Results_Analysers1` FOREIGN KEY (`Analysers_AnalyserID`) REFERENCES `analysers` (`AnalyserID`),
  CONSTRAINT `fk_Results_Results1` FOREIGN KEY (`Results_ResultID`) REFERENCES `results` (`ResultID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resulttemplatetypes`
--

DROP TABLE IF EXISTS `resulttemplatetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resulttemplatetypes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ResultTemplateName` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `robologs`
--

DROP TABLE IF EXISTS `robologs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `robologs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderItemId` int DEFAULT NULL,
  `isSent` tinyint(1) DEFAULT NULL,
  `errorWhileSent` longtext,
  `value` int DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdby` longtext,
  `createdTimestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedby` longtext,
  `updatedTimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=444499 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sampleresults`
--

DROP TABLE IF EXISTS `sampleresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sampleresults` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SampleId` int NOT NULL,
  `CurrentResult` longtext,
  `OldResult` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `InfectionControl` tinyint(1) DEFAULT '0',
  `AmendmentReportJSON` longtext,
  `ResistanceMechanism` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `sampleId_un` (`SampleId`),
  KEY `idx_sampleresults_IsDeleted` (`IsDeleted`),
  KEY `idx_sampleresults_SampleId` (`SampleId`),
  KEY `test_INDX` (`SampleId`) USING BTREE,
  KEY `sampleresults_UpdatedTimestamp_IDX` (`UpdatedTimestamp`) USING BTREE,
  KEY `sampleresults_CreatedTimestamp_IDX` (`CreatedTimestamp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20062723 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedulingchannels`
--

DROP TABLE IF EXISTS `schedulingchannels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedulingchannels` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT NULL,
  `CreatedTimestamp` datetime(6) DEFAULT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=609 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `serviceproviders`
--

DROP TABLE IF EXISTS `serviceproviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviceproviders` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `EntityType` longtext,
  `EntityId` int NOT NULL,
  `Service` longtext,
  `MaxAppointments` int NOT NULL,
  `ValidFrom` datetime(6) NOT NULL,
  `ValidUpto` datetime(6) NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `soft_delete_role_config`
--

DROP TABLE IF EXISTS `soft_delete_role_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soft_delete_role_config` (
  `UserRoleId` int NOT NULL,
  `orderitem_retention_minutes` int NOT NULL,
  `order_retention_minutes` int NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`UserRoleId`),
  CONSTRAINT `fk_sdrc_role` FOREIGN KEY (`UserRoleId`) REFERENCES `userroles` (`UserRoleId`),
  CONSTRAINT `soft_delete_role_config_chk_1` CHECK ((`orderitem_retention_minutes` >= 0)),
  CONSTRAINT `soft_delete_role_config_chk_2` CHECK ((`order_retention_minutes` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sources` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `Email` longtext,
  `Address` longtext,
  `State` longtext,
  `Email2` longtext,
  `ContactNo` longtext,
  PRIMARY KEY (`Id`),
  KEY `Name` (`Name`(100)),
  KEY `State` (`State`(100))
) ENGINE=InnoDB AUTO_INCREMENT=27765 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stainandstainermappings`
--

DROP TABLE IF EXISTS `stainandstainermappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stainandstainermappings` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `StainId` int NOT NULL,
  `StainerId` int NOT NULL,
  `IsDefault` tinyint(1) DEFAULT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=407 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stainers`
--

DROP TABLE IF EXISTS `stainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stainers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Code` longtext,
  `Name` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stainmethods`
--

DROP TABLE IF EXISTS `stainmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stainmethods` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogSubCategoryID` int DEFAULT NULL,
  `Name` longtext,
  `ParentId` int NOT NULL,
  `Sequence` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stains`
--

DROP TABLE IF EXISTS `stains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stains` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CatalogSubCategoryID` int DEFAULT NULL,
  `StainMethodId` int NOT NULL,
  `Name` longtext,
  `ShortCode` longtext,
  `ParentId` int NOT NULL,
  `Sequence` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockinventorycardantibiotics`
--

DROP TABLE IF EXISTS `stockinventorycardantibiotics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockinventorycardantibiotics` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `StockInventoryCardId` int NOT NULL,
  `AntibioticName` varchar(100) DEFAULT NULL,
  `ZoneDiameter` varchar(50) DEFAULT NULL,
  `ZoneMic` varchar(50) DEFAULT NULL,
  `DiameterInterpretation` varchar(50) DEFAULT NULL,
  `MicInterpretation` varchar(50) DEFAULT NULL,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_SICA_CardId` (`StockInventoryCardId`),
  CONSTRAINT `FK_SICA_SIC` FOREIGN KEY (`StockInventoryCardId`) REFERENCES `stockinventorycards` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockinventorycards`
--

DROP TABLE IF EXISTS `stockinventorycards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockinventorycards` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `LabOrganismId` int NOT NULL,
  `ATCCNumber` varchar(50) DEFAULT NULL,
  `StrainType` varchar(100) DEFAULT NULL,
  `LotNumber` varchar(100) DEFAULT NULL,
  `ExpiryDate` datetime(6) DEFAULT NULL,
  `PassageNumber` varchar(50) DEFAULT NULL,
  `DateOfReceipt` datetime(6) DEFAULT NULL,
  `DateOfRevival` datetime(6) DEFAULT NULL,
  `DateOfMasterStockPreparation` datetime(6) DEFAULT NULL,
  `PreparedByUserId` int NOT NULL,
  `VialId` varchar(50) DEFAULT NULL,
  `ColonyMorphology` varchar(500) DEFAULT NULL,
  `GramStain` varchar(100) DEFAULT NULL,
  `IsMotile` tinyint(1) NOT NULL,
  `Hemolysis` int DEFAULT NULL,
  `GrowthRequirement` varchar(500) DEFAULT NULL,
  `IncubationTempTime` varchar(500) DEFAULT NULL,
  `CatalasePositive` tinyint(1) NOT NULL,
  `OxidasePositive` tinyint(1) NOT NULL,
  `IndolePositive` tinyint(1) NOT NULL,
  `UreasePositive` tinyint(1) NOT NULL,
  `TsiSlant` varchar(100) DEFAULT NULL,
  `TsiButt` varchar(100) DEFAULT NULL,
  `TsiGas` varchar(100) DEFAULT NULL,
  `TsiH2S` varchar(100) DEFAULT NULL,
  `OtherTests` text,
  `StorageLocation` varchar(255) DEFAULT NULL,
  `Cryoprotectant` varchar(255) DEFAULT NULL,
  `StorageTemperature` varchar(255) DEFAULT NULL,
  `Supplement` varchar(255) DEFAULT NULL,
  `InitialSubQuantity` int NOT NULL DEFAULT '0',
  `AvailableSubQuantity` int NOT NULL DEFAULT '0',
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_SIC_LabOrganismId` (`LabOrganismId`),
  KEY `IX_SIC_PreparedByUserId` (`PreparedByUserId`),
  CONSTRAINT `FK_SIC_LabOrganism` FOREIGN KEY (`LabOrganismId`) REFERENCES `laborganisms` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_SIC_User_PreparedBy` FOREIGN KEY (`PreparedByUserId`) REFERENCES `users` (`UserId`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stockinventorysubcards`
--

DROP TABLE IF EXISTS `stockinventorysubcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockinventorysubcards` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `StockInventoryCardId` int NOT NULL,
  `VialId` varchar(50) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Passage` varchar(50) DEFAULT NULL,
  `Purpose` varchar(255) DEFAULT NULL,
  `Remark` varchar(500) DEFAULT NULL,
  `Quantity` int NOT NULL,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_SISC_CardId` (`StockInventoryCardId`),
  KEY `IX_SISC_VialId` (`VialId`),
  CONSTRAINT `FK_SISC_SIC` FOREIGN KEY (`StockInventoryCardId`) REFERENCES `stockinventorycards` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storesections`
--

DROP TABLE IF EXISTS `storesections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storesections` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `IsClinic` tinyint(1) DEFAULT '0',
  `IsActive` tinyint(1) DEFAULT '1',
  `StoreId` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `AppointmentQuota` int NOT NULL DEFAULT '0',
  `MedicalDepartment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_StoreSections_Stores_StoreId` (`StoreId`),
  KEY `IsClinic` (`IsClinic`),
  CONSTRAINT `FK_StoreSections_Stores_StoreId` FOREIGN KEY (`StoreId`) REFERENCES `stores` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9300 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_bk_orderitems`
--

DROP TABLE IF EXISTS `tbl_bk_orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bk_orderitems` (
  `Id` int NOT NULL,
  `Barcode` varchar(255) DEFAULT NULL,
  `isEmailInQueue` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templateentities`
--

DROP TABLE IF EXISTS `templateentities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templateentities` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TemplateId` int NOT NULL,
  `EntityId` int NOT NULL,
  `EntityType` longtext,
  `Priority` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templateinstances`
--

DROP TABLE IF EXISTS `templateinstances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templateinstances` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TemplateId` int NOT NULL,
  `OrderItemId` int NOT NULL,
  `Name` longtext,
  `Version` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templateinstancevalues`
--

DROP TABLE IF EXISTS `templateinstancevalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templateinstancevalues` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TemplateInstanceId` int NOT NULL,
  `TemplateParameterId` int NOT NULL,
  `Value` longtext,
  `Name` longtext,
  `Remarks` longtext,
  `ReferenceNotes` longtext,
  `Measurement` longtext,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templateparameters`
--

DROP TABLE IF EXISTS `templateparameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templateparameters` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TemplateId` int NOT NULL,
  `Serial` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `ParameterId` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templates` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Description` longtext,
  `Version` longtext,
  `IsRetired` tinyint(1) NOT NULL,
  `RetiredDate` datetime(6) NOT NULL,
  `InForceDate` datetime(6) NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenants` (
  `Id` bigint NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testhierarchysearch`
--

DROP TABLE IF EXISTS `testhierarchysearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testhierarchysearch` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DisciplineId` int NOT NULL,
  `PerformingLabId` int DEFAULT NULL,
  `SubDisciplineId` int DEFAULT NULL,
  `SectionId` int DEFAULT NULL,
  `CatalogItemId` int NOT NULL,
  `TestName` varchar(255) NOT NULL,
  `TestShortName` varchar(255) DEFAULT NULL,
  `IsOutsourced` tinyint(1) NOT NULL DEFAULT '0',
  `SearchText` longtext NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `idx_ths_hierarchy` (`DisciplineId`,`PerformingLabId`,`SubDisciplineId`,`SectionId`,`CatalogItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=1912 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timebookings`
--

DROP TABLE IF EXISTS `timebookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timebookings` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ServiceProviderId` int NOT NULL,
  `TimeSlotId` int NOT NULL,
  `IsCompleted` tinyint(1) NOT NULL,
  `Date` datetime(6) NOT NULL,
  `SchedulingChannelId` int NOT NULL,
  `UniqueId` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `ConsumerId` int NOT NULL,
  `EntityId` int NOT NULL,
  `EntityType` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `ClinicId` int NOT NULL DEFAULT '0',
  `IsQuotaBooking` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `idx_timebookings_date_slot_quota` (`Date`,`TimeSlotId`,`IsQuotaBooking`)
) ENGINE=InnoDB AUTO_INCREMENT=768987 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timeslots`
--

DROP TABLE IF EXISTS `timeslots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeslots` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `StartTime` time(6) NOT NULL,
  `EndTime` time(6) NOT NULL,
  `Version` double NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `topographies`
--

DROP TABLE IF EXISTS `topographies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topographies` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext,
  `CatalogSubCatagoryId` int NOT NULL,
  `Sequence` int NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `Code` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Code` longtext,
  `Name` longtext,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usagemonitoringcards`
--

DROP TABLE IF EXISTS `usagemonitoringcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usagemonitoringcards` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `StockInventorySubCardId` int NOT NULL,
  `Date` datetime(6) NOT NULL,
  `In` int NOT NULL,
  `Out` int NOT NULL,
  `Balance` int NOT NULL,
  `Purpose` varchar(255) DEFAULT NULL,
  `Remark` text,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_UMC_SubCardId` (`StockInventorySubCardId`),
  CONSTRAINT `FK_UMC_SISC` FOREIGN KEY (`StockInventorySubCardId`) REFERENCES `stockinventorysubcards` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `useractivities`
--

DROP TABLE IF EXISTS `useractivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useractivities` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `EntityId` int NOT NULL,
  `EntityType` longtext,
  `Activity` longtext,
  `TimeStamp` datetime(6) NOT NULL,
  `RequestJson` longtext,
  `ResponseJson` longtext,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11139088 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usercatalogsubcatagoriesmappings`
--

DROP TABLE IF EXISTS `usercatalogsubcatagoriesmappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercatalogsubcatagoriesmappings` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `CatalogSubCategoryId` int NOT NULL,
  `IsDefaultCategory` tinyint(1) NOT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1639 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userlocations`
--

DROP TABLE IF EXISTS `userlocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlocations` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `ClinicWardId` int DEFAULT NULL,
  `ExternalLocationId` int DEFAULT NULL,
  `Value` int NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  PRIMARY KEY (`Id`),
  KEY `idx_userlocations_UserId` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usermanuals`
--

DROP TABLE IF EXISTS `usermanuals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usermanuals` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Value` int NOT NULL DEFAULT '0',
  `DocumentName` longtext NOT NULL,
  `DocumentPath` longtext NOT NULL,
  `Description` longtext NOT NULL,
  `UploadedDate` datetime(6) NOT NULL,
  `UploadedBy` longtext NOT NULL,
  `IsApproved` tinyint(1) NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedTimestamp` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `CreatedBy` longtext,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` longtext,
  `IsClinicalOnly` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userroles` (
  `UserRoleId` int NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(25) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `AccessControl` longtext,
  `IsDefault` tinyint(1) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `CreatedDate` datetime(6) NOT NULL,
  `CreatedBy` int DEFAULT NULL,
  `UpdatedDate` datetime(6) DEFAULT NULL,
  `UpdatedBy` int DEFAULT NULL,
  PRIMARY KEY (`UserRoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserId` int NOT NULL AUTO_INCREMENT,
  `RoleId` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `MiddleName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `IsCurrentlyLoggedIn` tinyint(1) NOT NULL,
  `LastLoginTime` datetime(6) DEFAULT NULL,
  `LastLogoutTime` datetime(6) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedDate` datetime(6) NOT NULL,
  `CreatedBy` int DEFAULT NULL,
  `UpdatedDate` datetime(6) DEFAULT NULL,
  `UpdatedBy` int DEFAULT NULL,
  `MNC` longtext,
  `designationId` int DEFAULT NULL,
  `UnitId` int NOT NULL DEFAULT '0',
  `IsAnalyzerUser` tinyint(1) NOT NULL DEFAULT '0',
  `AccessControl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`UserId`),
  KEY `RoleId` (`RoleId`) USING BTREE,
  KEY `Password` (`Password`) USING BTREE,
  KEY `FirstName` (`FirstName`) USING BTREE,
  KEY `UserName` (`UserName`) USING BTREE,
  KEY `IsDeleted` (`IsDeleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2013 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_bk`
--

DROP TABLE IF EXISTS `users_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_bk` (
  `UserId` int NOT NULL AUTO_INCREMENT,
  `RoleId` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `MiddleName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `IsCurrentlyLoggedIn` tinyint(1) NOT NULL,
  `LastLoginTime` datetime(6) DEFAULT NULL,
  `LastLogoutTime` datetime(6) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `CreatedDate` datetime(6) NOT NULL,
  `CreatedBy` int DEFAULT NULL,
  `UpdatedDate` datetime(6) DEFAULT NULL,
  `UpdatedBy` int DEFAULT NULL,
  `MNC` longtext,
  `designationId` int DEFAULT NULL,
  `UnitId` int NOT NULL DEFAULT '0',
  `IsAnalyzerUser` tinyint(1) NOT NULL DEFAULT '0',
  `AccessControl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`UserId`),
  KEY `RoleId` (`RoleId`) USING BTREE,
  KEY `Password` (`Password`) USING BTREE,
  KEY `FirstName` (`FirstName`) USING BTREE,
  KEY `UserName` (`UserName`) USING BTREE,
  KEY `IsDeleted` (`IsDeleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1939 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `viabilitymonitoringcards`
--

DROP TABLE IF EXISTS `viabilitymonitoringcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viabilitymonitoringcards` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `StockInventoryCardId` int NOT NULL,
  `InitialBeadsOrVolume` varchar(100) DEFAULT NULL,
  `Date` datetime NOT NULL,
  `VialPreparationDate` datetime DEFAULT NULL,
  `BeadsOrVolumeIn` int NOT NULL DEFAULT '0',
  `BeadsOrVolumeOut` int NOT NULL DEFAULT '0',
  `Purpose` varchar(500) DEFAULT NULL,
  `ViabilityChecking` int NOT NULL COMMENT '0=OnePlus, 1=TwoPlus, 2=ThreePlus, 3=FourPlus, 4=NoGrowth',
  `CheckedByUserId` int NOT NULL,
  `Remarks` text,
  `Value` int NOT NULL DEFAULT '0',
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedTimestamp` datetime(6) NOT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `UpdatedTimestamp` datetime(6) DEFAULT NULL,
  `UpdatedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_VMC_CardId` (`StockInventoryCardId`),
  KEY `IX_VMC_CheckedBy` (`CheckedByUserId`),
  KEY `IX_VMC_Date` (`Date`),
  KEY `IX_VMC_IsDeleted` (`IsDeleted`),
  CONSTRAINT `FK_VMC_SIC` FOREIGN KEY (`StockInventoryCardId`) REFERENCES `stockinventorycards` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_VMC_User_CheckedBy` FOREIGN KEY (`CheckedByUserId`) REFERENCES `users` (`UserId`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-23  7:19:58
