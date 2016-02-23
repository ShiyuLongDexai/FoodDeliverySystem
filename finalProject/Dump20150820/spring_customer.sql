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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `creditCard_id` int(11) DEFAULT NULL,
  `user_USER_NAME` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_i7f12t1rqxjnufl1k69g1887v` (`address_id`),
  KEY `FK_2c2mhcwiahfypfbl0gy9fx6r4` (`creditCard_id`),
  KEY `FK_q8rvuvg7gucj30bvswuagdb48` (`user_USER_NAME`),
  CONSTRAINT `FK_q8rvuvg7gucj30bvswuagdb48` FOREIGN KEY (`user_USER_NAME`) REFERENCES `user` (`USER_NAME`),
  CONSTRAINT `FK_2c2mhcwiahfypfbl0gy9fx6r4` FOREIGN KEY (`creditCard_id`) REFERENCES `creditcard` (`id`),
  CONSTRAINT `FK_i7f12t1rqxjnufl1k69g1887v` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'u55',1,NULL,'u1@gmail.com'),(2,'asdasd',6,NULL,'asd@asd.com'),(3,'asdasd',7,NULL,'asd@asd.com'),(4,'asdasd',8,NULL,'asd@asd.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
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
