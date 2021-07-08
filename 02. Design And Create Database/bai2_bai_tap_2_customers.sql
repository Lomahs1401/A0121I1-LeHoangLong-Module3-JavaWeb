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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerNumber` int NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `ContactLastName` varchar(50) NOT NULL,
  `ContactFirstName` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `AddressLine1` varchar(50) NOT NULL,
  `AddressLine2` varchar(50) DEFAULT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `PostalCode` varchar(15) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `CreditLimit` float DEFAULT NULL,
  `SalesRepEmployeeNumber` int NOT NULL,
  PRIMARY KEY (`CustomerNumber`),
  KEY `SalesRepEmployeeNumber` (`SalesRepEmployeeNumber`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`SalesRepEmployeeNumber`) REFERENCES `employees` (`EmployeeNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Lê Hoàng Long','Lê','Hoàng Long','0905395436','Phan Thanh',NULL,'Đà Nẵng','Thanh Khê','550000','Việt Nam',NULL,1),(2,'Lê Trung Kiên','Lê','Trung Kiên','0935658482','Trường Chinh',NULL,'Đà Nẵng','Hòa Vangemployees','550000','Việt Nam',NULL,2),(3,'Lê Thị Hoàng Oanh','Lê','Thị Hoàng Oanh','0905742828','Phan Thanh',NULL,'Đà Nẵng','Thanh Khê','550000','Việt Nam',NULL,3),(4,'Nguyễn Thị Hoa','Nguyễn','Thị Hoa','0933738242','Phan Thanh',NULL,'Đà Nẵng','Thanh Khe','550000','Việt Nam',NULL,4),(5,'Ngô Đức Quốc Khánh','Ngô','Đức Quốc Khánh','0382404892','Lý Thái Tổ',NULL,'Nghệ An','Diễn Châu','460000','Việt Nam',NULL,5),(6,'Nguyễn Văn Thiệu','Nguyễn','Văn Thiệu','0935481235','Ngô Quyền',NULL,'Quảng Nam','Tam Kỳ','560000','Việt Nam',NULL,6),(7,'Nguyễn Quân','Nguyễn','Quân','0935395824','Nguyễn Hoàng',NULL,'Quảng Nam','Hội An','560000','Việt Nam',NULL,7),(8,'Trần Đức Hiếu','Trần','Đức Hiếu','0905395402','Hoàng Diệu',NULL,'Đà Nẵng','Thanh Khê','550000','Việt Nam',NULL,8),(9,'Lý Nhật Tiến','Lý','Nhật Tiến','0937295401','Bạch Đằng',NULL,'Đà Nẵng','Hải Châu','550000','Việt Nam',NULL,9),(10,'Nguyễn Khắc Thái','Nguyễn','Khắc Thái','0905978214','Hoàng Hoa Thám',NULL,'Đà Nẵng','Hòa Vang','550000','Việt Nam',NULL,10);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
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
