-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: bai2_bai_tap_2
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderNumber` int NOT NULL,
  `OrderDate` date NOT NULL,
  `RequiredDate` date NOT NULL,
  `ShippedDate` date DEFAULT NULL,
  `Status` varchar(15) NOT NULL,
  `Comments` text,
  `QuantityOrdered` int NOT NULL,
  `PriceEach` float NOT NULL,
  `CustomerNumber` int NOT NULL,
  PRIMARY KEY (`OrderNumber`),
  KEY `CustomerNumber` (`CustomerNumber`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerNumber`) REFERENCES `customers` (`CustomerNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (10020,'2015-08-25','2015-09-15',NULL,'Bảo hành 2 năm','Giao hàng thành công',1,230000000,1),(10021,'2015-05-31','2015-06-20','2015-06-25','Bảo hành 2 năm','Giao hàng thành công',1,98000000,2),(10022,'2015-01-12','2015-01-30',NULL,'Bảo hành 2 năm','Giao hàng thành công',1,150000000,3),(10023,'2015-03-21','2015-04-12',NULL,'Bảo hành 2 năm','Giao hàng thành công',1,300000000,4),(10024,'2015-03-11','2015-03-31',NULL,'Bảo hành 2 năm','Giao hàng thành công',1,140000000,5),(10025,'2015-04-08','2015-04-25','2015-04-27','Bảo hành 2 năm','Giao hàng thành công',1,160000000,6),(10026,'2015-04-19','2015-05-05',NULL,'Bảo hành 2 năm','Giao hàng thành công',1,100000000,7),(10027,'2015-09-12','2015-09-30',NULL,'Bảo hành 1 năm','Giao hàng thành công',1,250000000,8),(10028,'2015-12-06','2015-12-20',NULL,'Bảo hành 2 năm','Giao hàng thành công',1,123000000,9),(10029,'2015-10-05','2015-10-20','2015-10-23','Bảo hành 3 năm','Giao hàng thành công',1,250000000,10);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-08 17:12:59
