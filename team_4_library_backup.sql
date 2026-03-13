-- MySQL dump 10.13  Distrib 5.7.24, for osx11.1 (x86_64)
--
-- Host: localhost    Database: MontgomeryCounty
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Crime_against`
--

DROP TABLE IF EXISTS `Crime_against`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Crime_against` (
  `Crime_against_id` int NOT NULL,
  `crime_description` varchar(45) NOT NULL,
  PRIMARY KEY (`Crime_against_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Crime_against`
--

LOCK TABLES `Crime_against` WRITE;
/*!40000 ALTER TABLE `Crime_against` DISABLE KEYS */;
INSERT INTO `Crime_against` VALUES (1,'Crime Against Property'),(2,'Crime Against Society'),(3,'Crime Against Person');
/*!40000 ALTER TABLE `Crime_against` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `earliestincidentperdistrict`
--

DROP TABLE IF EXISTS `earliestincidentperdistrict`;
/*!50001 DROP VIEW IF EXISTS `earliestincidentperdistrict`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `earliestincidentperdistrict` AS SELECT 
 1 AS `police_district_name`,
 1 AS `EarliestIncidentTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Incidents`
--

DROP TABLE IF EXISTS `Incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Incidents` (
  `Incidents_id` int NOT NULL,
  `CR_number` int NOT NULL,
  `Dispatch_date_time` varchar(45) DEFAULT NULL,
  `Location_id` int NOT NULL,
  PRIMARY KEY (`Incidents_id`),
  KEY `fk_Incidents_Locations1_idx1` (`Location_id`),
  CONSTRAINT `fk_Incidents_Locations1` FOREIGN KEY (`Location_id`) REFERENCES `Locations` (`Location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Incidents`
--

LOCK TABLES `Incidents` WRITE;
/*!40000 ALTER TABLE `Incidents` DISABLE KEYS */;
INSERT INTO `Incidents` VALUES (201094549,16042425,'',10),(201097525,16045923,'',2),(201107484,16057593,'',15),(201116513,17002399,'',18),(201119758,17006665,'',23),(201121598,17008766,'',3),(201126129,17014489,'',7),(201127507,17016023,'',22),(201134743,170508374,'05/17/2017 7:06:26 PM',27),(201139376,170514170,'06/17/2017 12:37:57 AM',14),(201153071,170531057,'09/17/2017 2:09:17 AM',24),(201159664,170539771,'10/30/2017 11:55:24 AM',16),(201160863,170541355,'11/06/2017 7:32:12 PM',21),(201184998,180018882,'04/18/2018 8:52:41 AM',9),(201201786,180040707,'08/15/2018 11:39:58 PM',28),(201233480,190015364,'04/03/2019 12:46:54 AM',17),(201304123,200038559,'09/30/2020 11:25:26 PM',30),(201307874,200043152,'11/01/2020 9:25:40 PM',5),(201315263,210000460,'01/04/2021 8:46:19 PM',6),(201343111,210033405,'08/26/2021 10:15:23 PM',29),(201344057,210034606,'09/03/2021 4:37:15 PM',13),(201353618,210046723,'11/17/2021 6:32:05 PM',11),(201357930,210032440,'08/20/2021 11:04:26 AM',25),(201362256,220003951,'01/29/2022 7:18:55 PM',19),(201375442,220019746,'05/09/2022 6:54:27 PM',26),(201379933,220025064,'06/11/2022 8:53:35 AM',20),(201384051,220030056,'07/13/2022 10:38:38 AM',8),(201390139,220037009,'08/27/2022 5:26:26 AM',1),(201397608,220046614,'10/24/2022 11:55:22 AM',12),(201406680,220057665,'12/29/2022 10:50:15 AM',4);
/*!40000 ALTER TABLE `Incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `incidentspercity`
--

DROP TABLE IF EXISTS `incidentspercity`;
/*!50001 DROP VIEW IF EXISTS `incidentspercity`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `incidentspercity` AS SELECT 
 1 AS `City`,
 1 AS `NumberOfIncidents`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `incidentsperdistrict`
--

DROP TABLE IF EXISTS `incidentsperdistrict`;
/*!50001 DROP VIEW IF EXISTS `incidentsperdistrict`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `incidentsperdistrict` AS SELECT 
 1 AS `police_district_name`,
 1 AS `TotalIncidents`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Locations`
--

DROP TABLE IF EXISTS `Locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Locations` (
  `Location_id` int NOT NULL,
  `Block_address` varchar(45) DEFAULT NULL,
  `State` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `Zip` varchar(45) NOT NULL,
  `Police_district_id` int NOT NULL,
  PRIMARY KEY (`Location_id`),
  KEY `fk_Locations_Police1_idx` (`Police_district_id`),
  CONSTRAINT `fk_Locations_Police1` FOREIGN KEY (`Police_district_id`) REFERENCES `Police` (`Police_district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locations`
--

LOCK TABLES `Locations` WRITE;
/*!40000 ALTER TABLE `Locations` DISABLE KEYS */;
INSERT INTO `Locations` VALUES (1,'1  BLK  ACCORD CT','MD','POTOMAC','20854',1),(2,'1  BLK  ALLISTON HOLLOW CT','MD','GAITHERSBURG','20879',2),(3,'1  BLK  ALSACE LA','MD','ROCKVILLE','20850',3),(4,'1  BLK  AMARILLO CT','MD','GERMANTOWN','20874',6),(5,'1  BLK  ANNA CT','MD','GAITHERSBURG','20877',2),(6,'1  BLK  APEX CT','MD','GAITHERSBURG','20878',2),(7,'1  BLK  APPLEGRATH CT','MD','GERMANTOWN','20874',6),(8,'1  BLK  AQUARIUS CT','MD','SILVER SPRING','20906',7),(9,'1  BLK  ARDMORE CT','MD','BETHESDA','20816',1),(10,'1  BLK  ASHTON RD','MD','ASHTON','20861',7),(11,'1  BLK  AUSTIN PL','MD','TAKOMA PARK','20912',4),(12,'1  BLK  AUTUMN HILL WAY','MD','GAITHERSBURG','20877',2),(13,'1  BLK  BAILEYS CT','MD','SILVER SPRING','20906',7),(14,'1  BLK  BALLINGER CT','MD','BURTONSVILLE','20866',5),(15,'1  BLK  BALTIMORE RD','MD','ROCKVILLE','20850',3),(16,'1  BLK  BANK ST','MD','GAITHERSBURG','20878',2),(17,'1  BLK  BEALL AVE','MD','ROCKVILLE','20850',3),(18,'1  BLK  BELLE HOLLOW CT','MD','GAITHERSBURG','20876',2),(19,'4800 BLK  RUGBY AVE','MD','BETHESDA','20814',1),(20,'4800 BLK  SUNDOWN RD','MD','GAITHERSBURG','20882',2),(21,'4800 BLK  SWEETBIRCH DR','MD','ROCKVILLE','20853',7),(22,'4800 BLK  TOPPING RD','MD','ROCKVILLE','20852',7),(23,'4800 BLK  TOTHILL DR','MD','OLNEY','20832',7),(24,'4800 BLK  WALBRIDGE ST','MD','ROCKVILLE','20853',7),(25,'4900 BLK  ARCTIC TER','MD','ROCKVILLE','20853',7),(26,'4900 BLK  ASPEN HILL RD','MD','ROCKVILLE','20853',7),(27,'4900 BLK  AUBURN AVE','MD','BETHESDA','20814',1),(28,'4900 BLK  BAFFIN BAY LA','MD','ROCKVILLE','20853',7),(29,'4900 BLK  BATTERY LA','MD','BETHESDA','20814',1),(30,'3600 BLK  TURBRIDGE DR','MD','BURTONSVILLE','20866',5);
/*!40000 ALTER TABLE `Locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `mostcommoncrimeagainst`
--

DROP TABLE IF EXISTS `mostcommoncrimeagainst`;
/*!50001 DROP VIEW IF EXISTS `mostcommoncrimeagainst`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mostcommoncrimeagainst` AS SELECT 
 1 AS `crime_description`,
 1 AS `Frequency`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `NIBRS`
--

DROP TABLE IF EXISTS `NIBRS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NIBRS` (
  `NIBRS_code` varchar(45) NOT NULL,
  `NIBRS_description` varchar(45) NOT NULL,
  `Crime_against_id` int NOT NULL,
  PRIMARY KEY (`NIBRS_code`),
  KEY `fk_NIBRS_Crime Against1_idx` (`Crime_against_id`),
  CONSTRAINT `fk_NIBRS_Crime Against1` FOREIGN KEY (`Crime_against_id`) REFERENCES `Crime_against` (`Crime_against_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NIBRS`
--

LOCK TABLES `NIBRS` WRITE;
/*!40000 ALTER TABLE `NIBRS` DISABLE KEYS */;
INSERT INTO `NIBRS` VALUES ('09A','Murder and Nonnegligent Manslaughter',3),('11A','Forcible Rape',3),('11D','Fondling',3),('120','Robbery',1),('13A','Aggravated Assault',3),('13B','Simple Assault',3),('200','Arson',1),('210','Extortion/Blackmail',2),('220','Burglary/Breaking and Entering',1),('23B','Purse-snatching',1),('23F','Theft From Motor Vehicle',1),('23H','All other Larceny',1),('240','Motor Vehicle Theft',1),('250','Counterfeiting/Forgery',2),('26A','False Pretenses/Swindle/Confidence Game',2),('26B','Credit Card/Automatic Teller Machine Fraud',1),('26C','Impersonation',2),('26F','Identity Theft',1),('270','Embezzlement',1),('280','Stolen Property Offenses',1),('290','Destruction/Damage/Vandalism of Property',1),('35A','Drug/Narcotic Violations',2),('370','Pornography/Obscene Material',2),('40A','Prostitution',2),('520','Weapon Law Violations',2),('90A','Bad Checks',2),('90F','Family Offenses, NonViolent',2),('90G','Liquor Law Violations',2),('90H','Peeping Tom',2),('90Z','All Other Offenses',2);
/*!40000 ALTER TABLE `NIBRS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Offenses`
--

DROP TABLE IF EXISTS `Offenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Offenses` (
  `Offense_Code` int NOT NULL,
  `Offense_code_description` varchar(100) NOT NULL,
  `NIBRS_code` varchar(45) NOT NULL,
  PRIMARY KEY (`Offense_Code`),
  KEY `fk_Offenses_NIBRS1_idx` (`NIBRS_code`),
  CONSTRAINT `fk_Offenses_NIBRS1` FOREIGN KEY (`NIBRS_code`) REFERENCES `NIBRS` (`NIBRS_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Offenses`
--

LOCK TABLES `Offenses` WRITE;
/*!40000 ALTER TABLE `Offenses` DISABLE KEYS */;
INSERT INTO `Offenses` VALUES (911,'HOMICIDE - WILLFUL KILL-GUN','13B'),(1103,'RAPE - STRONG-ARM','11A'),(1199,'SEX ASSAULT - FONDLING','23F'),(1207,'ROBBERY - RESIDENTIAL-GUN','120'),(1302,'ASSAULT - AGGRAVATED - FAMILY-OTHER WEAPON','13A'),(1399,'ASSAULT - 2ND DEGREE','26C'),(2007,'ARSON - BURNING OF - (IDENTIFY OBJECT)','200'),(2103,'EXTORT - THREAT INJURE REPUTATION','23B'),(2202,'BURGLARY - FORCED ENTRY-RESIDENTIAL','220'),(2302,'LARCENY - PURSE SNATCHING - NO FORCE','520'),(2305,'LARCENY - FROM AUTO','90Z'),(2399,'LARCENY (DESCRIBE OFFENSE)','23H'),(2404,'AUTO THEFT - VEHICLE THEFT','90A'),(2408,'AUTO THEFT - POSSESS STOLEN VEHICLE','280'),(2411,'UNAUTHORIZED USE OF VEHICLE (INCLUDES JOY RIDING)','09A'),(2599,'COUNTERFEITING (DESCRIBE OFFENSE)','250'),(2601,'FRAUD - CONFIDENCE GAME','26A'),(2604,'FRAUD - IMPERSONATION','240'),(2605,'FRAUD - ILLEGAL USE CREDIT CARDS','26B'),(2606,'FRAUD - INSUFFICIENT FUNDS CHECK','210'),(2610,'IDENTITY THEFT','11D'),(2799,'EMBEZZLE (DESCRIBE OFFENSE)','270'),(2999,'DAMAGE PROPERTY (DESCRIBE OFFENSE)','26F'),(3562,'DRUGS - MARIJUANA - POSSESS','35A'),(3611,'SEX OFFENSE - PEEPING TOM','90H'),(3700,'OBSCENE MATERIAL','370'),(3802,'FAMILY OFFENSE - CRUELTY TOWARD CHILD','90F'),(4004,'COMM SEX OFF - PROSTITUTION','40A'),(4104,'LIQUOR - POSSESS','90G'),(5212,'WEAPON - POSSESSION','290');
/*!40000 ALTER TABLE `Offenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Offenses_has_Incidents`
--

DROP TABLE IF EXISTS `Offenses_has_Incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Offenses_has_Incidents` (
  `Offense_Code` int NOT NULL,
  `Incidents_id` int NOT NULL,
  PRIMARY KEY (`Offense_Code`,`Incidents_id`),
  KEY `fk_Offenses_has_Incidents_Incidents1_idx` (`Incidents_id`),
  KEY `fk_Offenses_has_Incidents_Offenses1_idx` (`Offense_Code`),
  CONSTRAINT `fk_Offenses_has_Incidents_Incidents1` FOREIGN KEY (`Incidents_id`) REFERENCES `Incidents` (`Incidents_id`),
  CONSTRAINT `fk_Offenses_has_Incidents_Offenses1` FOREIGN KEY (`Offense_Code`) REFERENCES `Offenses` (`Offense_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Offenses_has_Incidents`
--

LOCK TABLES `Offenses_has_Incidents` WRITE;
/*!40000 ALTER TABLE `Offenses_has_Incidents` DISABLE KEYS */;
INSERT INTO `Offenses_has_Incidents` VALUES (2404,201094549),(2305,201097525),(4004,201107484),(4104,201116513),(3562,201119758),(1199,201121598),(2302,201126129),(2408,201127507),(2799,201134743),(2411,201139376),(2399,201153071),(2599,201159664),(2202,201160863),(2606,201184998),(1103,201201786),(1302,201233480),(1207,201304123),(2999,201307874),(5212,201315263),(3611,201343111),(911,201344057),(2604,201353618),(3700,201357930),(2605,201362256),(3802,201375442),(2007,201379933),(2103,201384051),(2601,201390139),(1399,201397608),(2610,201406680);
/*!40000 ALTER TABLE `Offenses_has_Incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Police`
--

DROP TABLE IF EXISTS `Police`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Police` (
  `Police_district_id` int NOT NULL,
  `police_district_name` varchar(45) NOT NULL,
  `District_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Police_district_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Police`
--

LOCK TABLES `Police` WRITE;
/*!40000 ALTER TABLE `Police` DISABLE KEYS */;
INSERT INTO `Police` VALUES (1,'BETHESDA','2D'),(2,'MONTGOMERY VILLAGE','6D'),(3,'ROCKVILLE','1D'),(4,'TAKOMA PARK','TPPD'),(5,'SILVER SPRING','3D'),(6,'GERMANTOWN','5D'),(7,'WHEATON','4D');
/*!40000 ALTER TABLE `Police` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `top3frequentcrimes`
--

DROP TABLE IF EXISTS `top3frequentcrimes`;
/*!50001 DROP VIEW IF EXISTS `top3frequentcrimes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `top3frequentcrimes` AS SELECT 
 1 AS `NIBRS_description`,
 1 AS `Frequency`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `earliestincidentperdistrict`
--

/*!50001 DROP VIEW IF EXISTS `earliestincidentperdistrict`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `earliestincidentperdistrict` AS select `p`.`police_district_name` AS `police_district_name`,min(`i`.`Dispatch_date_time`) AS `EarliestIncidentTime` from ((`police` `p` join `locations` `l` on((`p`.`Police_district_id` = `l`.`Police_district_id`))) join `incidents` `i` on((`l`.`Location_id` = `i`.`Location_id`))) group by `p`.`police_district_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `incidentspercity`
--

/*!50001 DROP VIEW IF EXISTS `incidentspercity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `incidentspercity` AS select `l`.`City` AS `City`,count(`i`.`Incidents_id`) AS `NumberOfIncidents` from (`locations` `l` join `incidents` `i` on((`l`.`Location_id` = `i`.`Location_id`))) group by `l`.`City` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `incidentsperdistrict`
--

/*!50001 DROP VIEW IF EXISTS `incidentsperdistrict`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `incidentsperdistrict` AS select `p`.`police_district_name` AS `police_district_name`,count(`i`.`Incidents_id`) AS `TotalIncidents` from ((`police` `p` join `locations` `l` on((`p`.`Police_district_id` = `l`.`Police_district_id`))) join `incidents` `i` on((`l`.`Location_id` = `i`.`Location_id`))) group by `p`.`police_district_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostcommoncrimeagainst`
--

/*!50001 DROP VIEW IF EXISTS `mostcommoncrimeagainst`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostcommoncrimeagainst` AS select `ca`.`crime_description` AS `crime_description`,count(`n`.`NIBRS_code`) AS `Frequency` from (((`crime_against` `ca` join `nibrs` `n` on((`ca`.`Crime_against_id` = `n`.`Crime_against_id`))) join `offenses` `o` on((`n`.`NIBRS_code` = `o`.`NIBRS_code`))) join `offenses_has_incidents` `ohi` on((`o`.`Offense_Code` = `ohi`.`Offense_Code`))) group by `ca`.`crime_description` order by `Frequency` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top3frequentcrimes`
--

/*!50001 DROP VIEW IF EXISTS `top3frequentcrimes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top3frequentcrimes` AS select `n`.`NIBRS_description` AS `NIBRS_description`,count(`ohi`.`Incidents_id`) AS `Frequency` from ((`nibrs` `n` join `offenses` `o` on((`n`.`NIBRS_code` = `o`.`NIBRS_code`))) join `offenses_has_incidents` `ohi` on((`o`.`Offense_Code` = `ohi`.`Offense_Code`))) group by `n`.`NIBRS_description` order by `Frequency` desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-15 22:27:39
