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
-- Table structure for table `restaurantreview`
--

DROP TABLE IF EXISTS `restaurantreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurantreview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_74gm5s5604o1nx0cfuks1qyf6` (`customer_id`),
  KEY `FK_r118bxgirl63skypphp4nuvct` (`restaurant_id`),
  CONSTRAINT `FK_r118bxgirl63skypphp4nuvct` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`),
  CONSTRAINT `FK_74gm5s5604o1nx0cfuks1qyf6` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantreview`
--

LOCK TABLES `restaurantreview` WRITE;
/*!40000 ALTER TABLE `restaurantreview` DISABLE KEYS */;
INSERT INTO `restaurantreview` VALUES (3,'23423','2015-08-16 21:20:01',3,1,1),(4,'23423','2015-08-16 21:20:33',3,1,1),(6,'asd','2015-08-16 21:57:21',3,1,1),(7,'ggg','2015-08-16 21:57:28',3,1,1),(11,'hello','2015-08-16 23:19:15',3,1,1),(12,'gasdqweyy','2015-08-19 21:54:03',10,1,1),(13,'6','2015-08-19 22:02:05',6,1,1),(14,'8','2015-08-19 22:07:22',4,1,1),(15,'6','2015-08-19 22:19:10',3,1,1),(16,'3','2015-08-19 23:35:14',10,1,1);
/*!40000 ALTER TABLE `restaurantreview` ENABLE KEYS */;
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
