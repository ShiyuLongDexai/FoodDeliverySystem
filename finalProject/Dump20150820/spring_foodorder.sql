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
-- Table structure for table `foodorder`
--

DROP TABLE IF EXISTS `foodorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foodorder` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `deliveryTime` datetime DEFAULT NULL,
  `payment` varchar(30) DEFAULT NULL,
  `resName` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `totalPrice` double NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `creditCard_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FK_24hj8ihfjcfcpq82j7gjv4y7c` (`address_id`),
  KEY `FK_ljw9q8j76u0dg4a2vjk731kt` (`creditCard_id`),
  KEY `FK_3mdh3xwqfkkgak3jatkb2gayi` (`customer_id`),
  CONSTRAINT `FK_3mdh3xwqfkkgak3jatkb2gayi` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_24hj8ihfjcfcpq82j7gjv4y7c` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FK_ljw9q8j76u0dg4a2vjk731kt` FOREIGN KEY (`creditCard_id`) REFERENCES `creditcard` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodorder`
--

LOCK TABLES `foodorder` WRITE;
/*!40000 ALTER TABLE `foodorder` DISABLE KEYS */;
INSERT INTO `foodorder` VALUES (1,'2015-08-19 23:52:15','2015-08-20 00:22:15','paid','r1','delivered',12.75,5,1,1);
/*!40000 ALTER TABLE `foodorder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-20 12:05:27
