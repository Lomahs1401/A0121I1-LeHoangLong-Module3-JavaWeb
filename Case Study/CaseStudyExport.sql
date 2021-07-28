-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: case_study_furama_resort
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
-- Table structure for table `bophan`
--

DROP TABLE IF EXISTS `bophan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bophan` (
  `IDBoPhan` int NOT NULL,
  `TenBoPhan` varchar(45) NOT NULL,
  PRIMARY KEY (`IDBoPhan`),
  UNIQUE KEY `IDBoPhan` (`IDBoPhan`),
  CONSTRAINT `bophan_chk_1` CHECK ((`TenBoPhan` in (_utf8mb4'Sale Marketing',_utf8mb4'Hành Chính',_utf8mb4'Phục Vụ',_utf8mb4'Quản Lý')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bophan`
--

LOCK TABLES `bophan` WRITE;
/*!40000 ALTER TABLE `bophan` DISABLE KEYS */;
INSERT INTO `bophan` VALUES (100,'Sale Marketing'),(101,'Phục Vụ'),(102,'Quản Lý'),(103,'Hành Chính');
/*!40000 ALTER TABLE `bophan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dichvu`
--

DROP TABLE IF EXISTS `dichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dichvu` (
  `IDDichVu` int NOT NULL,
  `TenDichVu` varchar(45) NOT NULL,
  `ChiPhiThue` varchar(45) NOT NULL,
  `SoNguoiToiDa` varchar(45) NOT NULL,
  `IDKieuThue` int NOT NULL,
  `DienTich` int DEFAULT NULL,
  `SoTang` int DEFAULT NULL,
  `IDLoaiDichVu` int NOT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDDichVu`),
  UNIQUE KEY `IDDichVu` (`IDDichVu`),
  KEY `IDKieuThue` (`IDKieuThue`),
  KEY `IDLoaiDichVu` (`IDLoaiDichVu`),
  CONSTRAINT `dichvu_ibfk_1` FOREIGN KEY (`IDKieuThue`) REFERENCES `kieuthue` (`IDKieuThue`),
  CONSTRAINT `dichvu_ibfk_2` FOREIGN KEY (`IDLoaiDichVu`) REFERENCES `loaidichvu` (`IDLoaiDichVu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dichvu`
--

LOCK TABLES `dichvu` WRITE;
/*!40000 ALTER TABLE `dichvu` DISABLE KEYS */;
INSERT INTO `dichvu` VALUES (1,'VillaVip','100000000','20',6213,748,5,214,'Còn suất'),(2,'VillaSpecial','10000000','14',6024,566,4,214,'Còn suất'),(3,'VillaParty','5000000','10',6849,420,4,214,'Còn suất'),(4,'HouseVip','5000000','2',6213,150,2,428,'Còn suất'),(5,'HouseSpecial','3000000','10',6024,400,4,428,'Còn suất'),(6,'HouseParty','1000000','6',6849,200,3,428,'Còn suất'),(7,'RoomVip','800000','8',6849,242,4,587,'Còn suất'),(8,'RoomSpecial','700000','5',6849,180,2,587,'Còn suất'),(9,'RoomParty','400000','3',6849,165,2,587,'Còn suất'),(10,'RoomStay','100000','3',6921,165,2,587,'Còn suất');
/*!40000 ALTER TABLE `dichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dichvudikem`
--

DROP TABLE IF EXISTS `dichvudikem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dichvudikem` (
  `IDDichVuDiKem` int NOT NULL,
  `TenDichVuDiKem` varchar(45) NOT NULL,
  `Gia` int NOT NULL,
  `DonVi` int NOT NULL,
  `TrangThaiKhaDung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDDichVuDiKem`),
  UNIQUE KEY `IDDichVuDiKem` (`IDDichVuDiKem`),
  CONSTRAINT `dichvudikem_chk_1` CHECK ((`TenDichVuDiKem` in (_utf8mb4'Massage',_utf8mb4'Karaoke',_utf8mb4'Food',_utf8mb4'Drink',_utf8mb4'Car')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dichvudikem`
--

LOCK TABLES `dichvudikem` WRITE;
/*!40000 ALTER TABLE `dichvudikem` DISABLE KEYS */;
INSERT INTO `dichvudikem` VALUES (1,'Food',20000,1,'Còn suất'),(2,'Karaoke',40000,1,'Còn suất'),(3,'Drink',20000,1,'Còn suất'),(4,'Car',100000,1,'Còn suất'),(5,'Massage',50000,1,'Còn suất');
/*!40000 ALTER TABLE `dichvudikem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopdong`
--

DROP TABLE IF EXISTS `hopdong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopdong` (
  `IDHopDong` int NOT NULL,
  `IDNhanVien` int NOT NULL,
  `IDKhachHang` int NOT NULL,
  `IDDichVu` int NOT NULL,
  `NgayLamHopDong` date DEFAULT NULL,
  `NgayKetThucHopDong` date DEFAULT NULL,
  `TienDatCocTruoc` int NOT NULL,
  `TongTienThanhToan` int NOT NULL,
  PRIMARY KEY (`IDHopDong`),
  UNIQUE KEY `IDHopDong` (`IDHopDong`),
  KEY `fk_nhanvien` (`IDNhanVien`),
  KEY `fk_khachhang` (`IDKhachHang`),
  KEY `fk_dichvu` (`IDDichVu`),
  CONSTRAINT `fk_dichvu` FOREIGN KEY (`IDDichVu`) REFERENCES `dichvu` (`IDDichVu`),
  CONSTRAINT `fk_khachhang` FOREIGN KEY (`IDKhachHang`) REFERENCES `khachhang` (`IDKhachHang`),
  CONSTRAINT `fk_nhanvien` FOREIGN KEY (`IDNhanVien`) REFERENCES `nhanvien` (`IDNhanVien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopdong`
--

LOCK TABLES `hopdong` WRITE;
/*!40000 ALTER TABLE `hopdong` DISABLE KEYS */;
INSERT INTO `hopdong` VALUES (11,6,100,1,'2019-08-20','2020-08-20',20000000,100040000),(12,9,101,2,'2019-12-12','2020-01-12',1000000,10040000),(13,2,102,6,'2019-02-12','2019-02-13',200000,1060000),(14,3,103,2,'2019-07-12','2019-08-12',5000000,10200000),(15,11,104,5,'2019-10-10','2019-10-11',500000,3050000),(16,30,105,3,'2017-03-04','2017-03-05',1000000,5080000),(17,35,106,2,'2017-06-24','2017-07-24',2500000,10020000),(18,21,107,6,'2018-10-15','2018-10-16',600000,1200000),(19,26,108,9,NULL,NULL,100000,420000),(20,3,109,4,'2019-04-21','2020-05-21',1000000,5060000),(21,34,110,1,'2016-07-13','2017-07-13',26500000,100100000),(22,31,111,5,'2015-08-24','2015-09-24',1420000,3060000),(23,14,112,8,NULL,NULL,320000,720000),(24,12,113,10,NULL,NULL,50000,140000),(25,10,114,2,'2017-01-12','2017-02-12',5240000,10020000),(26,9,115,7,NULL,NULL,500000,1000000),(27,28,116,3,'2016-10-05','2016-10-06',1000000,5240000),(28,21,117,10,NULL,NULL,200000,350000),(29,19,118,9,NULL,NULL,100000,440000),(30,14,119,5,'2019-06-27','2019-07-27',1200000,3200000),(31,2,120,8,NULL,NULL,400000,800000),(32,34,121,3,'2019-09-14','2019-09-15',3100000,5080000),(33,30,122,1,'2018-07-29','2019-08-29',23450000,100360000),(34,31,123,2,'2016-08-20','2016-09-20',5200000,10120000),(35,12,124,7,NULL,NULL,621000,960000),(36,11,125,6,'2018-11-23','2018-11-24',840000,1180000),(37,25,126,4,'2019-12-12','2020-12-12',1000000,5040000),(38,32,127,9,NULL,NULL,160000,420000),(39,30,128,10,NULL,NULL,150000,400000),(40,21,129,4,'2019-05-14','2020-05-14',340000,5400000),(41,20,130,10,NULL,NULL,100000,180000),(42,19,131,7,NULL,NULL,20000,940000),(43,14,132,3,'2019-11-24','2019-11-25',240000,5080000),(44,19,133,9,NULL,NULL,180000,440000),(45,35,134,7,NULL,NULL,270000,960000),(46,35,135,8,NULL,NULL,340000,820000),(47,34,136,1,'2018-06-22','2019-06-22',45000000,100200000),(48,2,137,10,NULL,NULL,170000,800000),(49,6,138,2,'2019-12-12','2020-01-12',6200000,10040000),(50,20,139,4,'2019-09-05','2020-09-05',2800000,5700000),(51,2,140,3,'2020-07-22','2020-07-23',1000000,5200000),(52,9,141,6,'2015-11-29','2015-11-30',600000,1450000),(53,3,142,2,'2020-10-19','2020-11-19',3210000,10040000),(54,14,143,6,'2016-12-01','2016-12-02',420000,1020000),(55,12,144,5,'2019-12-12','2019-12-13',200000,3160000),(56,21,145,1,'2019-10-30','2020-10-30',14600000,100400000),(57,20,146,10,NULL,NULL,92000,180000),(58,26,147,10,NULL,NULL,100000,600000),(59,28,148,10,NULL,NULL,200000,500000),(60,2,149,2,'2018-05-30','2018-06-30',2350000,10160000),(61,3,150,8,NULL,NULL,40000,800000),(62,20,151,4,'2019-01-23','2020-01-23',1050000,5280000),(63,30,152,7,NULL,NULL,420000,880000),(64,28,153,8,NULL,NULL,200000,1000000),(65,35,154,8,NULL,NULL,250000,800000);
/*!40000 ALTER TABLE `hopdong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopdongchitiet`
--

DROP TABLE IF EXISTS `hopdongchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopdongchitiet` (
  `IDHopDongChiTiet` int NOT NULL,
  `IDHopDong` int NOT NULL,
  `IDDichVuDiKem` int NOT NULL,
  `SoLuong` int NOT NULL,
  PRIMARY KEY (`IDHopDongChiTiet`),
  UNIQUE KEY `IDHopDongChiTiet` (`IDHopDongChiTiet`),
  KEY `fk_dichvudikem` (`IDDichVuDiKem`),
  CONSTRAINT `fk_dichvudikem` FOREIGN KEY (`IDDichVuDiKem`) REFERENCES `dichvudikem` (`IDDichVuDiKem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopdongchitiet`
--

LOCK TABLES `hopdongchitiet` WRITE;
/*!40000 ALTER TABLE `hopdongchitiet` DISABLE KEYS */;
INSERT INTO `hopdongchitiet` VALUES (200,11,1,2),(201,12,2,1),(202,13,3,3),(203,14,4,2),(204,15,5,1),(205,16,1,4),(206,17,3,1),(207,18,4,2),(208,19,3,1),(209,20,1,3),(210,21,5,2),(211,22,3,3),(212,23,1,1),(213,24,3,2),(214,25,1,1),(215,26,5,4),(216,27,2,6),(217,28,5,5),(218,29,3,2),(219,30,3,10),(220,31,1,5),(221,32,2,2),(222,33,2,9),(223,34,1,6),(224,35,2,4),(225,36,1,9),(226,37,1,2),(227,38,1,1),(228,39,5,6),(229,40,5,8),(230,41,3,4),(231,42,3,7),(232,43,1,4),(233,44,3,2),(234,45,2,4),(235,46,2,3),(236,47,2,5),(237,48,4,7),(238,49,2,1),(239,50,4,7),(240,51,5,4),(241,52,5,9),(242,53,1,2),(243,54,1,1),(244,55,2,4),(245,56,2,10),(246,57,2,2),(247,58,4,5),(248,59,5,8),(249,60,2,4),(250,61,5,2),(251,62,2,7),(252,63,1,4),(253,64,4,3),(254,65,3,5);
/*!40000 ALTER TABLE `hopdongchitiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `IDKhachHang` int NOT NULL,
  `IDLoaiKhach` int NOT NULL,
  `Ho` varchar(20) NOT NULL,
  `TenLot` varchar(50) DEFAULT NULL,
  `Ten` varchar(50) NOT NULL,
  `NgaySinh` date NOT NULL,
  `SoCMND` varchar(45) NOT NULL,
  `SDT` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `DiaChi` varchar(45) NOT NULL,
  PRIMARY KEY (`IDKhachHang`),
  UNIQUE KEY `IDKhachHang` (`IDKhachHang`),
  KEY `IDLoaiKhach` (`IDLoaiKhach`),
  KEY `IX_KHACHHANG` (`IDKhachHang`),
  KEY `IX_SoDT_DiaChi` (`SDT`,`DiaChi`),
  CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`IDLoaiKhach`) REFERENCES `loaikhach` (`IDLoaiKhach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (100,81038,'Lê','Trung','Kiên','2002-12-06','202184582','0935638245','letrungkien@gmail.com','Đà Nẵng'),(101,81038,'Lê','Thị','Hoàng Oanh','1995-10-22','201832959','0905742828','nale@gmail.com','Huế'),(102,85714,'Lê','Thị','Hoàng My','2000-12-29','201718924','0935438742','faithOfficial@gmail.com','Quảng Trị'),(103,81038,'Nguyễn ','Thị','Hoa','1995-10-05','234023488','0937835812','nakingruby@gmail.com','Đà Nẵng'),(104,89401,'Trần','Đình','Quốc Thịnh','1995-05-20','248329041','0933728125','beeapple@gmail.com','Quảng Nam'),(105,82091,'Hoàng','Vĩnh','Khánh Linh','2002-05-11','218543830','0337455823','khanhlinh@gmail.com','Huế'),(106,88284,'Nguyễn','Thị','Nga','1990-04-07','278189453','0287435892','jennynga@gmail.com','Đà Nẵng'),(107,81038,'Trần','Như','Quỳnh','1985-02-12','274103272','0345943591','nhuquynh@gmail.com','Hà Nội'),(108,82091,'Lê','Kim','Liên','1992-08-31','247034035','0327534985','lienkimle@gmail.com','Hồ Chí Minh'),(109,85714,'Trần','Thanh','Trí','1999-10-01','245739811','0674857821','tranthanhtri@gmail.com','Quảng Nam'),(110,89401,'Trần','','Duy','1997-09-29','294230801','0923473247','tranduy@gmail.com','Quảng Ngãi'),(111,85714,'Vũ ','Thanh','Tùng','1995-08-23','254305112','0932724821','vuthanhtung@gmail.com','Đà Nẵng'),(112,82091,'Trần','Tuấn','Kiệt','2000-06-02','254404923','0289471823','trantuankiet12345@gmail.com','Vinh'),(113,81038,'Nguyễn','Thị','Thảo Ly','1996-09-05','285430950','0992432457','thaolyhenry9911@gmail.com','Quảng Ngãi'),(114,89401,'Trương','Gia','Huy','1999-08-10','285340511','0905823471','giahuy@gmail.com','Đà Nẵng'),(115,82091,'Hoàng','Thanh','Phong','1995-03-13','254853450','0123837852','phongwind@gmail.com','Đà Nẵng'),(116,81038,'Đỗ','Mạnh','Quân','1994-11-20','257639845','0345783712','quando@gmail.com','Hà Tĩnh'),(117,81038,'Nguyễn','Phi','Hoàng','1982-12-20','284320940','0374327492','phihoang@gmail.com','Đà Nẵng'),(118,82091,'Phạm','Văn','Quốc Hiếu','1960-09-10','279238473','0326453928','quochieu@gmail.com','Quảng Ngãi'),(119,88284,'Huỳnh','Ngọc','Thịnh','1962-06-03','234504770','0218732374','ngocthinh@gmail.com','Quảng Trị'),(120,82091,'Lê','Tấn','Thịnh','1949-02-01','271024370','0473534992','tanthinh@gmail.com','Hồ Chí Minh'),(121,88284,'Dương','Xuân','Kết','1995-12-12','207675762','0356328431','duongxuanket@gmail.com','Quảng Trị'),(122,81038,'Phạm','Thị','Thùy Trang','1994-08-23','204231446','0437534592','thuytrangphamthi@gmail.com','Đà Nẵng'),(123,82091,'Nguyễn','Ngọc','Linh','1990-09-30','215754672','0327432919','ngoclinh@gmail.com','Bình Thuận'),(124,85714,'Nguyễn','Thị','Lan','1970-08-11','275676574','0347534952','nguyenthilan@gmail.com','Khánh Hòa'),(125,81038,'Trần','Hồ Yến','Yến Nhi','1995-05-25','265476788','045734i8561','tranhoyennhi@gmail.com','Quảng Trị'),(126,88284,'Trần','Lê','Khánh Phương','1965-06-04','267865451','0235734535','tranlekhanhphuong@gmail.com','Gia Lai'),(127,89401,'Đặng','Ngọc','Khánh','1959-09-25','254534213','0347239461','dangngockhanh@gmail.com','Đà Nẵng'),(128,88284,'Hồ','Tấn','Hiển','1953-05-13','253441234','0237754331','hotanhien@gmail.com','Quảng Trị'),(129,81038,'Lê','Khắc','Quốc Bảo','1980-09-30','215453542','0458965401','lekhacquocbao@gmail.com','Quảng Trị'),(130,89401,'Trần','Đình','Quốc Thịnh','1995-05-20','248329041','0933728125','beeapple@gmail.com','Quảng Nam'),(131,85714,'Trần','Thanh','Trí','1999-10-01','245739811','0674857821','tranthanhtri@gmail.com','Quảng Nam'),(132,81038,'Lê','Trung','Kiên','2002-12-06','202184582','0935638245','letrungkien@gmail.com','Đà Nẵng'),(133,89401,'Trần','','Duy','1997-09-29','294230801','0923473247','tranduy@gmail.com','Quảng Ngãi'),(134,88284,'Huỳnh','Ngọc','Thịnh','1962-06-03','234504770','0218732374','ngocthinh@gmail.com','Quảng Trị'),(135,85714,'Lê','Thị','Hoàng My','2000-12-29','201718924','0935438742','faithOfficial@gmail.com','Quảng Trị'),(136,89401,'Đặng','Ngọc','Khánh','1959-09-25','254534213','0347239461','dangngockhanh@gmail.com','Đà Nẵng'),(137,88284,'Dương','Xuân','Kết','1995-12-12','207675762','0356328431','duongxuanket@gmail.com','Quảng Trị'),(138,81038,'Đỗ','Mạnh','Quân','1994-11-20','257639845','0345783712','quando@gmail.com','Vinh'),(139,82091,'Nguyễn','Thị','Lan','1970-08-11','275676574','0347534952','nguyenthilan@gmail.com','Quảng Ngãi'),(140,81038,'Lê','Trung','Kiên','2002-12-06','202184582','0935638245','letrungkien@gmail.com','Đà Nẵng'),(141,89401,'Trần','Đình','Quốc Thịnh','1995-05-20','248329041','0933728125','beeapple@gmail.com','Quảng Nam'),(142,81038,'Trần','Như','Quỳnh','1985-02-12','274103272','0345943591','nhuquynh@gmail.com','Hà Nội'),(143,85714,'Lê','Thị','Hoàng My','2000-12-29','201718924','0935438742','faithOfficial@gmail.com','Quảng Trị'),(144,85714,'Lê','Thị','Hoàng My','2000-12-29','201718924','0935438742','faithOfficial@gmail.com','Quảng Trị'),(145,88284,'Huỳnh','Ngọc','Thịnh','1962-06-03','234504770','0218732374','ngocthinh@gmail.com','Quảng Trị'),(146,88284,'Nguyễn','Thị','Nga','1990-04-07','278189453','0287435892','jennynga@gmail.com','Đà Nẵng'),(147,81038,'Trần','Hồ Yến','Yến Nhi','1995-05-25','265476788','045734i8561','tranhoyennhi@gmail.com','Quảng Trị'),(148,81038,'Trần','Hồ Yến','Yến Nhi','1995-05-25','265476788','045734i8561','tranhoyennhi@gmail.com','Quảng Trị'),(149,85714,'Nguyễn','Thị','Lan','1970-08-11','275676574','0347534952','nguyenthilan@gmail.com','Vinh'),(150,88284,'Dương','Xuân','Kết','1995-12-12','207675762','0356328431','duongxuanket@gmail.com','Quảng Trị'),(151,81038,'Lê','Thị','Hoàng Oanh','1995-10-22','201832959','0905742828','nale@gmail.com','Huế'),(152,82091,'Lê','Kim','Liên','1992-08-31','247034035','0327534985','lienkimle@gmail.com','Hồ Chí Minh'),(153,82091,'Nguyễn','Ngọc','Linh','1990-09-30','215754672','0327432919','ngoclinh@gmail.com','Hà Tĩnh'),(154,81038,'Lê','Thị','Hoàng Oanh','1995-10-22','201832959','0905742828','nale@gmail.com','Huế');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kieuthue`
--

DROP TABLE IF EXISTS `kieuthue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kieuthue` (
  `IDKieuThue` int NOT NULL,
  `TenKieuThue` varchar(45) NOT NULL,
  `Gia` int NOT NULL,
  PRIMARY KEY (`IDKieuThue`),
  UNIQUE KEY `IDKieuThue` (`IDKieuThue`),
  CONSTRAINT `kieuthue_chk_1` CHECK ((`TenKieuThue` in (_utf8mb4'năm',_utf8mb4'tháng',_utf8mb4'ngày',_utf8mb4'giờ')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kieuthue`
--

LOCK TABLES `kieuthue` WRITE;
/*!40000 ALTER TABLE `kieuthue` DISABLE KEYS */;
INSERT INTO `kieuthue` VALUES (6024,'Tháng',20000000),(6213,'Năm',300000000),(6849,'Ngày',4000000),(6921,'Giờ',500000);
/*!40000 ALTER TABLE `kieuthue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaidichvu`
--

DROP TABLE IF EXISTS `loaidichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaidichvu` (
  `IDLoaiDichVu` int NOT NULL,
  `TenLoaiDichVu` varchar(45) NOT NULL,
  PRIMARY KEY (`IDLoaiDichVu`),
  UNIQUE KEY `IDLoaiDichVu` (`IDLoaiDichVu`),
  CONSTRAINT `loaidichvu_chk_1` CHECK ((`TenLoaiDichVu` in (_utf8mb4'Villa',_utf8mb4'House',_utf8mb4'Room')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaidichvu`
--

LOCK TABLES `loaidichvu` WRITE;
/*!40000 ALTER TABLE `loaidichvu` DISABLE KEYS */;
INSERT INTO `loaidichvu` VALUES (214,'Villa'),(428,'House'),(587,'Room');
/*!40000 ALTER TABLE `loaidichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaikhach`
--

DROP TABLE IF EXISTS `loaikhach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaikhach` (
  `IDLoaiKhach` int NOT NULL,
  `TenLoaiKhach` varchar(45) NOT NULL,
  PRIMARY KEY (`IDLoaiKhach`),
  CONSTRAINT `loaikhach_chk_1` CHECK ((`TenLoaiKhach` in (_utf8mb4'Diamond',_utf8mb4'Platinium',_utf8mb4'Gold',_utf8mb4'Silver',_utf8mb4'Member')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaikhach`
--

LOCK TABLES `loaikhach` WRITE;
/*!40000 ALTER TABLE `loaikhach` DISABLE KEYS */;
INSERT INTO `loaikhach` VALUES (81038,'Platinium'),(82091,'Diamond'),(85714,'Member'),(88284,'Silver'),(89401,'Gold');
/*!40000 ALTER TABLE `loaikhach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `IDNhanVien` int NOT NULL,
  `IDViTri` int NOT NULL,
  `IDTrinhDo` int NOT NULL,
  `IDBoPhan` int NOT NULL,
  `Ho` varchar(20) NOT NULL,
  `TenLot` varchar(50) DEFAULT NULL,
  `Ten` varchar(50) NOT NULL,
  `NgaySinh` date NOT NULL,
  `SoCMND` varchar(45) NOT NULL,
  `SDT` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `DiaChi` varchar(45) NOT NULL,
  `Luong` varchar(45) NOT NULL,
  PRIMARY KEY (`IDNhanVien`),
  UNIQUE KEY `IDNhanVien` (`IDNhanVien`),
  UNIQUE KEY `SoCMND` (`SoCMND`),
  UNIQUE KEY `SDT` (`SDT`),
  UNIQUE KEY `Email` (`Email`),
  KEY `fk_vitri` (`IDViTri`),
  KEY `fk_trinhdo` (`IDTrinhDo`),
  KEY `fk_bophan` (`IDBoPhan`),
  CONSTRAINT `fk_bophan` FOREIGN KEY (`IDBoPhan`) REFERENCES `bophan` (`IDBoPhan`),
  CONSTRAINT `fk_trinhdo` FOREIGN KEY (`IDTrinhDo`) REFERENCES `trinhdo` (`IDTrinhDo`),
  CONSTRAINT `fk_vitri` FOREIGN KEY (`IDViTri`) REFERENCES `vitri` (`IDViTri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,1,10,100,'Hồ','Lê','Quốc Tín','1997-06-24','201492042','0935829581','quoctin@gmail.com','Thanh Khê','9000000'),(2,3,12,101,'Nguyễn','Văn','Thiệu','2002-02-12','201859392','0837535509','cuthieu2k2@gmail.com	','Liên Chiểu','8000000'),(3,2,10,102,'Nguyễn','Khắc','Thái','2000-01-20','205918459','0852738596','zed999cz@gmail.com	','Hòa Vang','10000000'),(4,4,13,103,'Lê','Trọng','Hoàng Minh','1994-02-22','204578294','0943707317','letronghoangminh@gmail.com	','Sơn Trà','14000000'),(5,5,11,100,'Đào','Thủy','Trang','1999-06-24','205829291','0343969468','thuytrangdao240402@gmail.com	','Liên Chiểu','9000000'),(6,6,12,101,'Trương','Văn','Minh Hiếu','2002-10-29','201895494','0356704414','minhhieu.p3tz@gmail.com	','Hải Châu','8000000'),(7,3,12,103,'Lý','Văn','Tánh','2002-06-29','204819194','0372845918','lyvantanh@gmail.com','Hải Châu','9500000'),(8,2,12,103,'Lý','Nhật','Tiến','2002-09-03','201845845','0912910277','gaihuelnt@gmail.com	','Ngũ Hành Sơn','12000000'),(9,5,10,101,'Nguyễn','Thắng','Bảo','2002-04-30','205910920','0929289253	','kayce274@gmail.com	','Hải Châu','12000000'),(10,4,10,102,'Lê','Văn','Thành','1999-06-26','253458902','0919841201','levanthanh20052002@gmail.com	','Sơn Trà','9000000'),(11,3,10,101,'Nguyễn',NULL,'Quân','2000-07-21','274359080','0766678406','nguyenquan.212002@gmail.com	','Ngũ Hành Sơn','11600000'),(12,5,11,102,'Lê','Thành','Danh','2002-05-11','215492020','0935626907','danh05341@gmail.com	','Sơn Trà','20000000'),(13,5,10,100,'Ngô','Đức','Quốc Khánh','2001-09-02','274305843','0399120983','quockhanhlanglim@gmail.com	','Thanh Khê','11500000'),(14,5,12,102,'Trần','Huy','Tú','2000-08-12','231248323','0387573733','tranhuytu37@gmail.com	','Thanh Khê','7800000'),(15,4,13,103,'Ngô','Tấn','Dũng','1995-10-22','201922942','0933738242','ngotandung@gmail.com','Thanh Khê','6500000'),(16,3,13,100,'Phạm','Hoàng','Sơn','1995-04-29','290325483','0775098973','soonhoang14@gmail.com	','Thanh Khê','9000000'),(17,6,11,100,'Lê','Văn','Việt','2000-05-20','231239871','0913486705','baanhle35@gmail.com	','Hải Châu','1320000'),(18,4,13,100,'Nguyễn','Trọng ','Nghĩa','1994-11-20','243905378','0328441828','trongnghia161001','Hải Châu','10000000'),(19,1,12,102,'Nguyễn','Quang','Huy','1999-01-30','217492854','0385929122','quanghuyz1470@gmail.com	','Thanh Khê','7800000'),(20,4,10,101,'Nguyễn','Tấn','Dũng','2001-08-15','201292948','0904792997','10a2k57@gmail.com	','Hải Châu','6000000'),(21,2,12,102,'Nguyễn','Văn','Phước Thịnh','2000-09-09','253498589','0707362140','thinhwaggg@gmail.com	','Hòa Vang','9500000'),(22,5,10,100,'Nguyễn','Duy','Hậu','1998-02-28','281740281','0966443517','duyhau082002@gmail.com	','Thanh Khê','7200000'),(23,5,10,103,'Trần','Chính','Huy','2000-05-11','294512370','0399732804','huytrnchnh222@gmail.com	','Hải Châu','7200000'),(24,6,10,100,'Nguyễn','Quang','Khải','2000-05-19','281204743','0817010525','khai170102@gmail.com	','Sơn Trà','12000000'),(25,1,10,102,'Nguyễn','Trọng','Sang','1997-12-29','247545834','0974035452','nguyentrongsang1234@gmail.com	','Hải Châu','17500000'),(26,2,12,102,'Nguyễn','Văn','Thiện Nhân','2002-12-23','243856034','0359063161','thiennhan20082002@gmail.com	','Cẩm Lệ','14500000'),(27,6,12,103,'Lê','Hoàng','Long','2002-01-14','258430912','0905395346','lelong.ll32@gmail.com	','Hải Châu','10800000'),(28,3,12,102,'Nguyễn','Duy','Khoa','2001-07-30','274308509','0376647915','duykhoa24082002@gmail.com	','Hải Châu','11200000'),(29,4,11,103,'Đặng','Văn','Phước Nguyên','1998-12-31','243908539','0932572361','nguyen1522002@gmail.com	','Thanh Khê','14000000'),(30,6,10,101,'Lê','Nhân','Đức','2000-12-06','290189492','0333740569','lenhanductthue@gmail.com	','Hải Châu','7000000'),(31,1,11,102,'Võ','Trí','Phúc','2002-01-23','275340540','0387859264','phucvo140902@gmail.com	','Hòa Vang','15000000'),(32,3,10,102,'Huỳnh','Đức','Trường','2001-07-22','240389505','0349002395','khungking909@gmail.com	','Hải Châu','8900000'),(33,6,10,103,'Lê','Tứ','Quý','2001-06-01','258430958','0816688246','levantuquy@gmail.com	','Cẩm Lệ','19000000'),(34,1,12,101,'Hoàng','Tiến','Dũng','2001-03-01','201289498','0862124758','kaitok57a01@gmail.com	','Hòa Vang','7500000'),(35,6,11,101,'Mai','Xuân','Duy','1999-10-12','204858934','0926167624','maixuanduy0605@gmail.com	','Hải Châu','6800000');
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trinhdo`
--

DROP TABLE IF EXISTS `trinhdo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trinhdo` (
  `IDTrinhDo` int NOT NULL,
  `TrinhDo` varchar(45) NOT NULL,
  PRIMARY KEY (`IDTrinhDo`),
  UNIQUE KEY `IDTrinhDo` (`IDTrinhDo`),
  CONSTRAINT `trinhdo_chk_1` CHECK ((`TrinhDo` in (_utf8mb4'Trung Cấp',_utf8mb4'Cao Đẳng',_utf8mb4'Đại Học',_utf8mb4'Sau Đại Học')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trinhdo`
--

LOCK TABLES `trinhdo` WRITE;
/*!40000 ALTER TABLE `trinhdo` DISABLE KEYS */;
INSERT INTO `trinhdo` VALUES (10,'Đại Học'),(11,'Trung Cấp'),(12,'Cao Đẳng'),(13,'Sau Đại Học');
/*!40000 ALTER TABLE `trinhdo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_nhanvien`
--

DROP TABLE IF EXISTS `v_nhanvien`;
/*!50001 DROP VIEW IF EXISTS `v_nhanvien`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_nhanvien` AS SELECT 
 1 AS `IDNhanVien`,
 1 AS `Ho`,
 1 AS `TenLot`,
 1 AS `Ten`,
 1 AS `NgaySinh`,
 1 AS `SoCMND`,
 1 AS `SDT`,
 1 AS `Email`,
 1 AS `DiaChi`,
 1 AS `Luong`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vitri`
--

DROP TABLE IF EXISTS `vitri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vitri` (
  `IDViTri` int NOT NULL,
  `TenViTri` varchar(45) NOT NULL,
  PRIMARY KEY (`IDViTri`),
  UNIQUE KEY `IDViTri` (`IDViTri`),
  CONSTRAINT `vitri_chk_1` CHECK ((`TenViTri` in (_utf8mb4'Lễ Tân',_utf8mb4'Phục Vụ',_utf8mb4'Chuyên viên',_utf8mb4'Giám Sát',_utf8mb4'Quản lý',_utf8mb4'Giám Đốc')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vitri`
--

LOCK TABLES `vitri` WRITE;
/*!40000 ALTER TABLE `vitri` DISABLE KEYS */;
INSERT INTO `vitri` VALUES (1,'Lễ Tân'),(2,'Giám Đốc'),(3,'Quản Lý'),(4,'Phục Vụ'),(5,'Chuyên Viên'),(6,'Giám Sát');
/*!40000 ALTER TABLE `vitri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `v_nhanvien`
--

/*!50001 DROP VIEW IF EXISTS `v_nhanvien`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_nhanvien` AS select `nv`.`IDNhanVien` AS `IDNhanVien`,`nv`.`Ho` AS `Ho`,`nv`.`TenLot` AS `TenLot`,`nv`.`Ten` AS `Ten`,`nv`.`NgaySinh` AS `NgaySinh`,`nv`.`SoCMND` AS `SoCMND`,`nv`.`SDT` AS `SDT`,`nv`.`Email` AS `Email`,`nv`.`DiaChi` AS `DiaChi`,`nv`.`Luong` AS `Luong` from (`nhanvien` `nv` left join `hopdong` `hd` on((`nv`.`IDNhanVien` = `hd`.`IDNhanVien`))) where ((`nv`.`DiaChi` = 'Hải Châu') and (`hd`.`NgayLamHopDong` = '2019-12-12')) */;
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

-- Dump completed on 2021-07-28 11:18:09
