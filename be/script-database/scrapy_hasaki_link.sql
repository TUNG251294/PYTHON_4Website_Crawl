-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: scrapy
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hasaki_link`
--

DROP TABLE IF EXISTS `hasaki_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hasaki_link` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `link` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hasaki_link`
--

LOCK TABLES `hasaki_link` WRITE;
/*!40000 ALTER TABLE `hasaki_link` DISABLE KEYS */;
INSERT INTO `hasaki_link` VALUES (1,'https://hasaki.vn/san-pham/chi-ke-may-2-dau-lemonade-dark-brown-mau-nau-dam-2g-2ml-85431.html',NULL),(2,'https://hasaki.vn/san-pham/chi-may-vacosi-dinh-hinh-da-nang-03-nau-den-5ml-3833.html',NULL),(3,'https://hasaki.vn/san-pham/chi-ke-may-lemonade-2-dau-mau-nau-xam-gray-brown-2g-2ml-90295.html',NULL),(4,'https://hasaki.vn/san-pham/set-3-dao-cao-long-may-kai-luoi-don-than-nhua-cbm-3p-97015.html',NULL),(5,'https://hasaki.vn/san-pham/chi-ke-may-2-dau-lemonade-natural-brown-mau-nau-sang-2g-2ml-85429.html',NULL),(6,'https://hasaki.vn/san-pham/dao-cao-chan-may-vacosi-2-cay-89879.html',NULL),(7,'https://hasaki.vn/san-pham/chi-ke-may-xe-suri-102-brown-mau-nau-e271-65520.html',NULL),(8,'https://hasaki.vn/san-pham/chi-ke-chan-may-innisfree-mau-5-expresso-brown-0-3g-106577.html',NULL),(9,'https://hasaki.vn/san-pham/chi-ke-may-xe-suri-101-black-mau-den-e271-104255.html',NULL),(10,'https://hasaki.vn/san-pham/chi-may-vacosi-dinh-hinh-da-nang-02-nau-xam-5ml-3012.html',NULL);
/*!40000 ALTER TABLE `hasaki_link` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-26 11:21:50
