-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: recontool
-- ------------------------------------------------------
-- Server version	5.7.23-log

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
-- Table structure for table `breakactions`
--

DROP TABLE IF EXISTS `breakactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `breakactions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `action1` varchar(100) DEFAULT NULL,
  `action2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breakactions`
--

LOCK TABLES `breakactions` WRITE;
/*!40000 ALTER TABLE `breakactions` DISABLE KEYS */;
INSERT INTO `breakactions` VALUES (1,'StatusMismatch','ActivateFO','InactivateRD');
/*!40000 ALTER TABLE `breakactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reconfiles`
--

DROP TABLE IF EXISTS `reconfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reconfiles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `runschedule` varchar(100) DEFAULT NULL,
  `information` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reconfiles`
--

LOCK TABLES `reconfiles` WRITE;
/*!40000 ALTER TABLE `reconfiles` DISABLE KEYS */;
INSERT INTO `reconfiles` VALUES (1,'testName','testDesc','testSchedule','testInfo');
/*!40000 ALTER TABLE `reconfiles` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `filerowdata`
--

DROP TABLE IF EXISTS `filerowdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filerowdata` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `reconfiles_id` int(10) DEFAULT NULL,
  `jsonrowdata` varchar(500) DEFAULT NULL,
  `breakactions_id` int(10) DEFAULT NULL,
  `actiontaken` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reconfiles_id` (`reconfiles_id`),
  CONSTRAINT `filerowdata_ibfk_1` FOREIGN KEY (`reconfiles_id`) REFERENCES `reconfiles` (`id`),
  KEY `breakactions_id` (`breakactions_id`),
  CONSTRAINT `filerowdata_ibfk_2` FOREIGN KEY (`breakactions_id`) REFERENCES `breakactions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filerowdata`
--

LOCK TABLES `filerowdata` WRITE;
/*!40000 ALTER TABLE `filerowdata` DISABLE KEYS */;
INSERT INTO `filerowdata` VALUES (1,1,'[{\"Side\":\"FO\",\"BuySell\":\"Buy\",\"TradeId\":\"12345\",\"Counterparty ID\":\"1234\",\"Counterparty name\":\"ABC DEF\",\"FO Code\":\"VIP\",\"Status\":null,\"Attribute\":null,\"Category\":\"Singleton\",\"Value\":null}]',1,'testaction'),(2,1,'[{\"Side\":\"RD\",\"BuySell\":\"Buy\",\"TradeId\":\"12345\",\"Counterparty ID\":\"1234\",\"Counterparty name\":\"ABC DEF\",\"FO Code\":\"VIP\",\"Status\":\"Active\",\"Attribute\":null,\"Category\":null,\"Value\":null}]',1,'testaction'),(3,1,'[{\"Side\":\"FO\",\"BuySell\":\"Sell\",\"TradeId\":\"76545\",\"Counterparty ID\":\"6586\",\"Counterparty name\":\"MNO LMN\",\"FO Code\":\"DIP\",\"Status\":\"Inactive\",\"Attribute\":null,\"Category\":\"Status Mismatch\",\"Value\":null}]',1,'testaction'),(4,1,'[{\"Side\":\"RD\",\"BuySell\":\"Sell\",\"TradeId\":\"76545\",\"Counterparty ID\":\"6586\",\"Counterparty name\":\"MNO LMN\",\"FO Code\":\"DIP\",\"Status\":\"Active\",\"Attribute\":null,\"Category\":null,\"Value\":null}]',1,'testaction');
/*!40000 ALTER TABLE `filerowdata` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `reconusers`
--

DROP TABLE IF EXISTS `reconusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reconusers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `application` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reconusers`
--

LOCK TABLES `reconusers` WRITE;
/*!40000 ALTER TABLE `reconusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `reconusers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

