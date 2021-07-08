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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductCode` varchar(15) NOT NULL,
  `ProductName` varchar(70) NOT NULL,
  `ProductSale` varchar(10) NOT NULL,
  `ProductVendor` varchar(50) NOT NULL,
  `ProductDescription` text NOT NULL,
  `QuantityInStock` int NOT NULL,
  `BuyPrice` float NOT NULL,
  `MSRP` float NOT NULL,
  `ProductLines` varchar(50) NOT NULL,
  PRIMARY KEY (`ProductCode`),
  KEY `ProductLines` (`ProductLines`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`ProductLines`) REFERENCES `productlines` (`ProductLines`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('27DSJ13','HondaA819','A','Honda','Tốt',10,250000000,230000000,'SXY629NM2K'),('28HQW21','MazdaUH82','C','Mazda','Xuất Sắc',10,100000000,98000000,'SXY629NM2K'),('29SBF41','FordKLO20','H','Ford','Tốt',10,160000000,150000000,'OTE291RJ8K'),('30MCJ90','Lexus LIO19','J','Lexus','Tốt',10,300000000,300000000,'SXY629NM2K'),('51BME71','Chevrolet12','G','Chevrolet','Xuất Sắc',2,140250000,140000000,'SXY629NM2K'),('67BIE92','Mercedes Benz 3MBN','I','Mercedes Benz','Xuất Sắc',7,175251000,160000000,'SXY629NM2K'),('74GBA12','KiaNMX51','D','Kia','Tốt',9,110000000,100000000,'OTE291RJ8K'),('85NBC12','Suzuki22BA','E','Suzuki','Tốt',4,275900000,250000000,'LKV213BC4V'),('87JJE41','HuyndaiXH81','B','Huyndai','Tốt',5,125000000,123000000,'OTE291RJ8K'),('92ZHQ41','Audi82FJS','F','Audi','Xuất Sắc',3,285000000,250000000,'LKV213BC4V');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-08 17:13:00
