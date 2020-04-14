-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: chms
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `login_id` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication`
--

DROP TABLE IF EXISTS `authentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentication` (
  `doc_reg_id` varchar(10) NOT NULL,
  `auth_key` varchar(30) NOT NULL,
  PRIMARY KEY (`doc_reg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication`
--

LOCK TABLES `authentication` WRITE;
/*!40000 ALTER TABLE `authentication` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `aadhar` char(12) DEFAULT NULL,
  `doc_reg_id` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `city` varchar(25) NOT NULL,
  `degrees` varchar(30) NOT NULL,
  PRIMARY KEY (`doc_reg_id`),
  UNIQUE KEY `unique_aadhar_doc` (`aadhar`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`aadhar`) REFERENCES `person` (`aadhar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine` (
  `medicineID` int(11) NOT NULL,
  `common_name` varchar(50) DEFAULT NULL,
  `basic_drug` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`medicineID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `patient_aadhar` char(12) NOT NULL,
  `notableDiseases` varchar(500) DEFAULT NULL,
  KEY `patient_aadhar` (`patient_aadhar`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`patient_aadhar`) REFERENCES `person` (`aadhar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `aadhar` char(12) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `mname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` char(10) DEFAULT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `date_of_birth` date NOT NULL,
  PRIMARY KEY (`aadhar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revoked`
--

DROP TABLE IF EXISTS `revoked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revoked` (
  `doc_reg_id` varchar(10) DEFAULT NULL,
  KEY `doc_reg_id` (`doc_reg_id`),
  CONSTRAINT `revoked_ibfk_1` FOREIGN KEY (`doc_reg_id`) REFERENCES `doctor` (`doc_reg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revoked`
--

LOCK TABLES `revoked` WRITE;
/*!40000 ALTER TABLE `revoked` DISABLE KEYS */;
/*!40000 ALTER TABLE `revoked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatment` (
  `treatmentID` int(11) NOT NULL AUTO_INCREMENT,
  `doc_reg_id` varchar(10) NOT NULL,
  `patient_aadhar` char(12) NOT NULL,
  `date_of_treatment` date DEFAULT NULL,
  `diagnosis` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`treatmentID`),
  KEY `fk_patient_aadhar` (`patient_aadhar`),
  CONSTRAINT `fk_patient_aadhar` FOREIGN KEY (`patient_aadhar`) REFERENCES `person` (`aadhar`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatmentmedicinelist`
--

DROP TABLE IF EXISTS `treatmentmedicinelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatmentmedicinelist` (
  `treatmentID` int(11) DEFAULT NULL,
  `medicineID` int(11) DEFAULT NULL,
  KEY `treatmentID` (`treatmentID`),
  KEY `medicineID` (`medicineID`),
  CONSTRAINT `treatmentMedicineList_ibfk_1` FOREIGN KEY (`treatmentID`) REFERENCES `treatment` (`treatmentID`),
  CONSTRAINT `treatmentMedicineList_ibfk_2` FOREIGN KEY (`medicineID`) REFERENCES `medicine` (`medicineID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatmentmedicinelist`
--

LOCK TABLES `treatmentmedicinelist` WRITE;
/*!40000 ALTER TABLE `treatmentmedicinelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `treatmentmedicinelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view1`
--

DROP TABLE IF EXISTS `view1`;
/*!50001 DROP VIEW IF EXISTS `view1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view1` AS SELECT 
 1 AS `treatmentID`,
 1 AS `doctor_name`,
 1 AS `degree`,
 1 AS `patient_name`,
 1 AS `date_of_treatment`,
 1 AS `patient_age`,
 1 AS `patient_gender`,
 1 AS `city`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view1`
--

/*!50001 DROP VIEW IF EXISTS `view1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view1` AS select `t`.`treatmentID` AS `treatmentID`,concat(`p`.`fname`,' ',`p`.`lname`) AS `doctor_name`,`d`.`degrees` AS `degree`,concat(`p1`.`fname`,' ',`p1`.`mname`,' ',`p1`.`lname`) AS `patient_name`,`t`.`date_of_treatment` AS `date_of_treatment`,floor(((to_days(sysdate()) - to_days(`p1`.`date_of_birth`)) / 365.25)) AS `patient_age`,`p1`.`gender` AS `patient_gender`,`d`.`city` AS `city` from (((`treatment` `t` join `doctor` `d` on((`t`.`doc_reg_id` = `d`.`doc_reg_id`))) join `person` `p` on((`d`.`aadhar` = `p`.`aadhar`))) join `person` `p1` on((`t`.`patient_aadhar` = `p1`.`aadhar`))) */;
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

-- Dump completed on 2020-04-14 18:56:46
