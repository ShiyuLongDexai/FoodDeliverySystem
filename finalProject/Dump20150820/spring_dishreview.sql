CREATE DATABASE  IF NOT EXISTS `spring` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `spring`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: spring
-- ------------------------------------------------------
-- Server version	5.6.15

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
-- Table structure for table `dishreview`
--

DROP TABLE IF EXISTS `dishreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dishreview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) DEFAULT NULL,
  `customer_Id` int(11) DEFAULT NULL,
  `dish_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5n879qj2ccqjk9w51gnfv2ued` (`customer_Id`),
  KEY `FK_716v5qexg8pnxf9nkmf17pqt9` (`dish_Id`),
  CONSTRAINT `FK_716v5qexg8pnxf9nkmf17pqt9` FOREIGN KEY (`dish_Id`) REFERENCES `dish` (`id`),
  CONSTRAINT `FK_5n879qj2ccqjk9w51gnfv2ued` FOREIGN KEY (`customer_Id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishreview`
--

LOCK TABLES `dishreview` WRITE;
/*!40000 ALTER TABLE `dishreview` DISABLE KEYS */;
/*!40000 ALTER TABLE `dishreview` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-20 12:05:26
