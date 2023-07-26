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
-- Table structure for table `guardian`
--

DROP TABLE IF EXISTS `guardian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardian` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `original_price` int DEFAULT NULL,
  `crawl_time` datetime DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian`
--

LOCK TABLES `guardian` WRITE;
/*!40000 ALTER TABLE `guardian` DISABLE KEYS */;
INSERT INTO `guardian` VALUES (1,'Sữa Dưỡng Thể Hỗ Trợ Sáng Da Chuyên Sâu Vaseline Healthy Bright Gluta-Hya Dewy Radiance 330Ml',120000,'Còn hàng',150000,'2023-06-28 12:46:51',NULL),(2,'Sữa Tắm Tươi Mát Guardian Essential Lavender Refreshing Body Wash Chiết Xuất Hoa Oải Hương 1000Ml',49000,'Còn hàng',65000,'2023-06-28 12:46:52',NULL),(3,'Sữa Rửa Mặt Kiềm Dầu Hỗ Trợ Ngừa Mụn Simple Purifying Gel Wash 150Ml',92000,'Còn hàng',132000,'2023-06-28 12:46:52',NULL),(4,'Sữa Chống Nắng Dưỡng Da Trắng Mịn Sunplay Skin Aqua Clear White Spf50+ Pa++++  55Gr',177000,'Còn hàng',208000,'2023-06-28 12:46:52',NULL),(5,'Sữa Dưỡng Thể Hỗ Trợ Sáng Da Chống Nắng Vaseline Healthy Bright Gluta-Hya Serum Brust Uv Lotion 330Ml',120000,'Còn hàng',150000,'2023-06-28 12:46:53',NULL),(6,'Sữa Rửa Mặt Dịu Nhẹ Cho Da Nhạy Cảm Simple Kind To Skin Refreshing Facial Wash 150Ml',103000,'Còn hàng',132000,'2023-06-28 12:46:53',NULL),(7,'Sữa Dưỡng Thể Giúp Hỗ Trợ Sáng Da Chống Nắng Vaseline Healthy Bright Bảo Vệ Da Hàng Ngày Daily Protection & Brightening Serum Spf50+ Pa++++ 300Ml',152000,'Còn hàng',190000,'2023-06-28 12:46:53',NULL),(8,'Sữa Tắm Dạng Kem Dưỡng Ẩm Guardian Essential Cherry Blossom Moisturising Shower Cream Chiết Xuất Anh Đào 1000Ml',49000,'Còn hàng',65000,'2023-06-28 12:46:53',NULL),(9,'Sữa Tắm Dạng Kem Dưỡng Ẩm Guardian Essential Goat\'S Milk Moisturising Shower Cream Sữa Dê 1000Ml',49000,'Còn hàng',65000,'2023-06-28 12:46:54',NULL),(10,'Cục Dũa Móng Nf 33 Thái Bình An',25000,'Còn hàng',25000,'2023-06-28 12:46:54',NULL),(11,'Kem Che Khuyết Điểm The Saem Cover Perfection Tip Concealer 1.5 Natural Beige Da Trung Bình 6,5Gr',159000,'Còn hàng',200000,'2023-06-28 12:46:55',NULL),(12,'Sữa Tắm Charming Enchanteur 6Gr',1500,'Còn hàng',1500,'2023-06-28 12:46:55',NULL),(13,'Miếng Rửa Mặt Vàng Cs6 Thái Bình An',33000,'Còn hàng',33000,'2023-06-28 12:46:55',NULL),(14,'Bông Phấn Ướt Ls6 Thái Bình An 8 Miếng',30000,'Còn hàng',30000,'2023-06-28 12:46:56',NULL),(15,'Bông Phấn Khô Và Ướt Pp6-Cp1 Thái Bình An',30000,'Còn hàng',30000,'2023-06-28 12:46:56',NULL),(16,'Sữa Rửa Mặt Cấp Ẩm Cho Da Khô Da Nhạy Cảm Simple Moisturing Facial Wash 150Ml',102000,'Còn hàng',132000,'2023-06-28 12:46:56',NULL),(17,'Bình Xịt Phòng Tinh Dầu Đuổi Muỗi Và Côn Trùng Bạc Hà Macaland 50Ml',79000,'Còn hàng',79000,'2023-06-28 12:46:56',NULL),(18,'Phấn Mịn Lì Tự Nhiên Maybelline Fit Me Matte + Poreless Tông 230 Natural Buff Da Trung Bình 8,5Gr',198000,'Còn hàng',198000,'2023-06-28 12:46:57',NULL),(19,'Bình Xịt Phòng Tinh Dầu Đuổi Muỗi Và Côn Trùng Hương Hoa Macaland 50Ml',79000,'Còn hàng',79000,'2023-06-28 12:46:57',NULL),(20,'Kem Nền Loreal Infallible 24H Matte Cover Spf16 Pa+++ #147 Neutral Beige Da Trung Bình 35Ml',289000,'Còn hàng',289000,'2023-06-28 12:46:58',NULL),(21,'Phấn Nước Lemonade Supermeow Cushion A02 Medium Light Màu Trung Bình 15Gr',261000,'Còn hàng',349000,'2023-06-28 12:46:58',NULL),(22,'Bông Phấn Ướt Hình Trụ Nb28 Thái Bình An',28000,'Còn hàng',28000,'2023-06-28 12:46:58',NULL),(23,'Dụng Cụ Rửa Mặt Vacosi Boover Cleanser Màu Bất Kì 30Gr',73000,'Còn hàng',73000,'2023-06-28 12:46:58',NULL),(24,'Cục Đánh Bóng Móng Nf13 Thái Bình An',29000,'Hết hàng',29000,'2023-06-28 12:46:59',NULL),(25,'Blender Hồ Lô Vacosi',47000,'Còn hàng',47000,'2023-06-28 12:46:59',NULL),(26,'Miếng Mút Rửa Mặt Facial Cleansing Sponge Guardian 2 Cái',39000,'Còn hàng',39000,'2023-06-28 12:46:59',NULL),(27,'Miếng Mút Rửa Mặt Facial Cleansing Sponge Guardian',29000,'Còn hàng',29000,'2023-06-28 12:47:00',NULL),(28,'Cây Lăn Lạnh Đa Năng Face Và Body Ice Cooler Emmié',398000,'Còn hàng',398000,'2023-06-28 12:47:00',NULL),(29,'Bông Mút Trang Điểm Tròn Cosmetic Rounds Guardian 20 Cái',79000,'Còn hàng',79000,'2023-06-28 12:47:00',NULL),(30,'Bông Mút Trang Điểm 3D Beauty Blending Sponge Guardian',49000,'Còn hàng',49000,'2023-06-28 12:47:00',NULL),(31,'Bông Mút Trang Điểm Trái Tim Cosmetic Hearts Guardian 4 Cái',39000,'Còn hàng',39000,'2023-06-28 12:47:01',NULL),(32,'Bông Mút Tròn Round Foundation Sponges Guardian 2 Cái',39000,'Còn hàng',39000,'2023-06-28 12:47:01',NULL),(33,'Miếng Rửa Mặt Cleansing PAd Guardian',59000,'Còn hàng',59000,'2023-06-28 12:47:01',NULL),(34,'Giấy Thấm Dầu R.E.D Blemish Oil Control Paper Dr.G 70 Miếng',64000,'Còn hàng',81000,'2023-06-28 12:47:02',NULL),(35,'Máy Xông Mặt Cấp Ẩm Sâu Nano Ion Màu Trắng Emmié',1180000,'Còn hàng',1180000,'2023-06-28 12:47:02',NULL),(36,'Máy Đẩy Tinh Chất Giúp Dưỡng Sáng Nóng Lạnh Màu San Hô Ion Hot And Cool Beauty Device Coral Limited Edition Halio',2500000,'Còn hàng',2500000,'2023-06-28 12:47:03',NULL),(37,'Bông Phấn Hồng Khổ Nhỏ Pp6 Thái Bình An',33000,'Còn hàng',33000,'2023-06-28 12:47:03',NULL),(38,'Dụng Cụ Lăn Kiểm Soát Dầu Oil Absorbing Roller Revlon',350000,'Còn hàng',350000,'2023-06-28 12:47:03',NULL),(39,'Máy Rửa Mặt Màu Hồng Facial Cleansing And Massaging Device Hot Pink Limited Edition Halio',620000,'Còn hàng',620000,'2023-06-28 12:47:04',NULL),(40,'Mặt Nạ Giúp Dưỡng Sáng Vita Genic Whitening Bnbg 30Ml',19000,'Còn hàng',29000,'2023-06-28 12:47:04',NULL),(41,'Mặt Nạ Giúp Phục Hồi Da Vita Genic Relaxing Bnbg 30Ml',19000,'Còn hàng',29000,'2023-06-28 12:47:04',NULL),(42,'Mặt Nạ Dưỡng Ẩm Cho Da Hydrating Vita Genic Bnbg 30Ml',19000,'Còn hàng',29000,'2023-06-28 12:47:05',NULL),(43,'MặT Nạ Giúp Dưỡng Sáng Và Cấp Ẩm Vita Genic Jelly Mask Whitening And Moisture Banobagi 30Gr',15000,'Còn hàng',25000,'2023-06-28 12:47:05',NULL),(44,'Mặt Nạ Green Tea Trà Xanh Ngừa Mụn Benew 22Ml',15000,'Còn hàng',15000,'2023-06-28 12:47:06',NULL),(45,'Mặt Nạ Collagen Giúp Ngừa Lão Hoá Foodaholic 23Gr',9000,'Còn hàng',15000,'2023-06-28 12:47:06',NULL),(46,'Mặt Nạ Giúp Nâng Cơ Và Săn Chắc Da Vita Genic Lifting Bnbg 30Ml',19000,'Còn hàng',29000,'2023-06-28 12:47:07',NULL),(47,'Mặt Nạ Giấy Dưỡng Giúp Hỗ Trợ Sáng Da Nha Đam Vedette 22Ml',9000,'Còn hàng',13000,'2023-06-28 12:47:07',NULL),(48,'Mặt Nạ Tràm Trà Làm Dịu Da Some By Mi Tea Tree Calming Sheet Mask 25Gr',27000,'Còn hàng',39000,'2023-06-28 12:47:08',NULL),(49,'Mặt Nạ Chứa Tinh Chất Trà Xanh Ngăn Ngừa Mụn Teatree Care Solution Essential Mask Ex Mediheal 24Ml',42000,'Còn hàng',42000,'2023-06-28 12:47:08',NULL),(50,'Mặt Nạ Ngọc Trai Đen Dưỡng Ẩm Foodaholic 23Gr',9000,'Còn hàng',15000,'2023-06-28 12:47:09',NULL),(51,'Mặt Nạ Collagen Giúp Ngừa Lão Hoá Benew 22Ml',15000,'Còn hàng',15000,'2023-06-28 12:47:09',NULL),(52,'Mặt Nạ Honey Mật Ong Giúp Phục Hồi Da Benew 22Ml',15000,'Còn hàng',15000,'2023-06-28 12:47:09',NULL),(53,'Mặt Nạ Giấy Dưỡng Sáng Da Ngọc Trai Vedette 22Ml',9000,'Còn hàng',13000,'2023-06-28 12:47:09',NULL),(54,'Mặt Nạ Giấy Trắng Da Trà Xanh Vedette 22Ml',9000,'Còn hàng',13000,'2023-06-28 12:47:10',NULL),(55,'Mặt Nạ Kim Cương Dưỡng Hỗ Trợ Sáng Da Foodaholic 23Gr',9000,'Còn hàng',15000,'2023-06-28 12:47:10',NULL),(56,'Kem Chống Nắng Kiểm Soát Nhờn Không Màu La Roche-Posay Anthelios Xl Spf50+ Uvb & Uva 50Ml',399000,'Còn hàng',535000,'2023-06-28 12:47:10',NULL),(57,'Sữa Chống Nắng Dịu Nhẹ Dành Cho Da Nhạy Cảm & Trẻ Em Anessa Perfect Uv Sunscreen Mild Milk Spf50+ Pa++++ 60Ml',449000,'Còn hàng',715000,'2023-06-28 12:47:11',NULL),(58,'Sữa Chống Nắng Hiệu Chỉnh Sắc Da Sunplay Skin Aqua Tone Up Uv Milk Lavender Spf50+ Pa++++50Gr',185000,'Còn hàng',185000,'2023-06-28 12:47:12',NULL),(59,'Kem Chống Nắng Bí Đao Quang Phổ Rộng Dành Cho Da Dầu, Nhạy Cảm Cocoon Winter Melon Sunscreen 50Ml',395000,'Còn hàng',395000,'2023-06-28 12:47:12',NULL),(60,'Tinh Chất Chống Nắng Hiệu Chỉnh Sắc Da Sunplay Skin Aqua Tone Up Uv Essence Lavender Spf50+ Pa++++ 50Gr',185000,'Còn hàng',185000,'2023-06-28 12:47:12',NULL),(61,'Sữa Chống Nắng Dưỡng Da Trắng Mịn Sunplay Skin Aqua Clear White Spf50 Pa+++ 25Gr',119000,'Còn hàng',119000,'2023-06-28 12:47:12',NULL),(62,'Sữa Chống Nắng Dưỡng Da Ngừa Mụn Sunplay Skin Aqua Acne Clear Milk Spf50 Pa++++ 25Gr',104000,'Còn hàng',117000,'2023-06-28 12:47:13',NULL),(63,'Sữa Chống Nắng Dưỡng Da Tạo Nền Trắng Mịn Sunplay Skin Aqua Clear White Cc Milk Spf50 Pa++++25Gr',135000,'Còn hàng',135000,'2023-06-28 12:47:13',NULL),(64,'Kem Chống Nắng Cho Da Nhạy Cảm Skin1004 Madagascar Centella Air-Fit Suncream Plus Spf50+ Pa++++ 50Ml',276000,'Còn hàng',425000,'2023-06-28 12:47:14',NULL),(65,'Kem Chống Nắng Không Gây Nhờn Rít Vichy Capital Soleil Mattifying Dry Touch Face Fluid 50Ml',399000,'Còn hàng',535000,'2023-06-28 12:47:14',NULL),(66,'Sữa Chống Nắng Cực Mạnh Sunplay Super Block SPF81 PA++++ 30Gr',96000,'Còn hàng',96000,'2023-06-28 12:47:15',NULL),(67,'Khăn Lau Mặt Khô Đa Năng Guardian Face Towel 80 Tờ',59000,'Còn hàng',85000,'2023-06-28 12:47:15',NULL),(68,'Sữa Chống Nắng Cực Mạnh Sunplay Super Block Spf81 Pa++++ 70Gr',149000,'Còn hàng',175000,'2023-06-28 12:47:15',NULL),(69,'Sữa Dưỡng Thể Chống Nắng Bảo Vệ Da Tới 4H Vaseline Spf24 Pa++ Sun + Polluion Protection 350Ml',120000,'Còn hàng',150000,'2023-06-28 12:47:16',NULL),(70,'Bộ Giảm Mụn Chống Nắng Toner + Uv + Duo La Roche-Posay',221000,'Còn hàng',225000,'2023-06-28 12:47:16',NULL),(71,'Tinh Chất Chống Nắng Nâng Tông Trắng Mượt Senka Perfect Uv Essence Spf50+ Pa++++ 50Gr',152000,'Còn hàng',190000,'2023-06-28 12:47:16',NULL),(72,'Nước Tẩy Trang L\'Oréal Paris 3 In 1 Micellar Water Làm Tươi Mát Da 400Ml',169000,'Còn hàng',219000,'2023-06-28 12:47:17',NULL),(73,'Nước Hoa Hồng Không Mùi Dưỡng Ẩm Và Làm Mềm Da Dear Klairs Supple Preparation Unscented Toner 180Ml',259000,'Còn hàng',399000,'2023-06-28 12:47:18',NULL),(74,'Dầu Gội Giảm Gàu, Làm Sạch Gàu Anti-Dandruff Shampoo Selsun 100Ml',79000,'Còn hàng',93000,'2023-06-28 12:47:18',NULL),(75,'Cà Phê Đắk Lắk Làm Sạch Da Chết Cơ Thể Cocoon Dak Lak Coffee Body Polish 200Ml',112000,'Còn hàng',125000,'2023-06-28 12:47:18',NULL),(76,'Nước Tẩy Trang Dưỡng Ẩm Cho Da Thường, Khô L\'Oreal Paris Micellar Water 3-In-1 Moisturizing Even For Sensitive Skin 400Ml',159000,'Còn hàng',219000,'2023-06-28 12:47:19',NULL),(77,'Cà Phê Đắk Lắk Làm Sạch Da Chết Mặt Dak Lak Coffee Face Polish Cocoon 150Ml',165000,'Còn hàng',165000,'2023-06-28 12:47:19',NULL),(78,'Nước Rửa Tay Bảo Vệ Vượt Trội Dạng Túi Lifebuoy 450Gr',50000,'Còn hàng',59000,'2023-06-28 12:47:19',NULL),(79,'Băng Vệ Sinh Diana Ban Đêm Dạng Quần Size M-L 2 Miếng',38000,'Còn hàng',38000,'2023-06-28 12:47:20',NULL),(80,'Dầu Gội Giúp Phục Hồi, Giảm Xơ Rối, Giúp Giảm Rụng Tóc Tsubaki Premium Repair 490Ml',139000,'Còn hàng',215000,'2023-06-28 12:47:20',NULL),(81,'Khẩu Trang Vải 3 Lớp Làm Sạch Và Giúp Kháng Khuẩn Anh Khoa Ktx0520-0017',1000,'Còn hàng',10000,'2023-06-28 12:47:21',NULL),(82,'Mascara Làm Dài Và Cong Mi, Không Lem, Không Trôi Maybelline Hyper Curl 9.2Ml',129000,'Còn hàng',168000,'2023-06-28 12:47:21',NULL),(83,'Kem Rửa Mặt Dưỡng Ẩm Hada Labo Advanced Nourish Hyaluronic Acid Cleanser  80Gr',67000,'Còn hàng',79000,'2023-06-28 12:47:21',NULL),(84,'Tăm Nha Khoa Tiện Dụng 2 Trong 1 Guardian 2-In-1 Brush Pick 150 Cây',19000,'Còn hàng',27000,'2023-06-28 12:47:21',NULL),(85,'Kem Dưỡng Da Trắng Mịn Và Giảm Thâm Nám Ban Đêm White Perfect Clinical L\'Oreal Paris 50Ml',269000,'Còn hàng',269000,'2023-06-28 12:47:22',NULL),(86,'Tẩy Tế Bào Chết Môi Cocoon Dak Lak Coffee Cà Phê Đắk Lắk 5Gr',75000,'Còn hàng',75000,'2023-06-28 12:47:22',NULL),(87,'Nước Tẩy Trang 3 In 1 Micellar Làm Sạch Sâu L\'Oréal Paris 400Ml',169000,'Còn hàng',219000,'2023-06-28 12:47:22',NULL),(88,'Muối Tắm Spa Cà Phê Mori 700Gr/24',89000,'Còn hàng',89000,'2023-06-28 12:47:23',NULL),(89,'Kem Tẩy Tế Bào Da Felina Body Scrub Cream Hạt Cà Phê Và Tinh Dầu Dừa 220G',129000,'Còn hàng',129000,'2023-06-28 12:47:23',NULL),(90,'Muối Tẩy Tế Bào Chết Cà Phê Gold Yoko 240Gr/24',79000,'Còn hàng',79000,'2023-06-28 12:47:23',NULL),(91,'Cà Phê Đắk Lắk Làm Sạch Da Chết Cơ Thể Cocoon Dak Lak Coffee Body Polish Túi 600Ml',292000,'Còn hàng',325000,'2023-06-28 12:47:23',NULL),(92,'Kem Nhuộm Tóc Bigen Silk Touch 6N Màu Nâu Cà Phê 80Gr',157000,'Còn hàng',196000,'2023-06-28 12:47:24',NULL),(93,'Bơ Dưỡng Thể Cà Phê Đắk Lắk Dak Lak Coffee Body Butter Cocoon 200Ml',215000,'Còn hàng',215000,'2023-06-28 12:47:24',NULL),(94,'Gel Rửa Mặt Cà Phê Đắk Lắk Cocoon 140Ml',195000,'Còn hàng',195000,'2023-06-28 12:47:24',NULL),(95,'Chì Kẻ Mày Cathy Doll Siêu Mảnh Skinny Brow Pencil 06 Coffee Brown Nâu Cà Phê 0,05Gr',50000,'Còn hàng',99000,'2023-06-28 12:47:25',NULL),(96,'Mật Ong Hoa Cà Phê Honeyland 500Gr',135000,'Còn hàng',169000,'2023-06-28 12:47:25',NULL),(97,'Kem Ủ Tóc Ellips Vitamin Hair Mask Pro-Keratin Hair Repair Giúp Phục Hồi 18G',12000,'Còn hàng',12000,'2023-06-28 12:47:25',NULL),(98,'Thực Phẩm Bảo Vệ Sức Khỏe Viên Sủi Bổ Sung Multivitamin Plusssz 10 Viên',44000,'Còn hàng',44000,'2023-06-28 12:47:25',NULL),(99,'Kem Ủ Tóc Ellips Vitamin Hair Mask Pro-Keratin Smooth & Silky Mềm Mượt Óng Ả 18G',12000,'Còn hàng',12000,'2023-06-28 12:47:26',NULL),(100,'Thực Phẩm Bảo Vệ Sức Khỏe Viên Uống Bổ Sung Vitamin C Hard Capsule 30 Days Supply Dhc 60 Viên',85000,'Còn hàng',105000,'2023-06-28 12:47:26',NULL),(101,'Serum Dưỡng Tóc Mềm Mượt Óng Ả Hair Vitamin With Pro-Keratin Complex Smooth & Silky Ellips 6 Viên',25000,'Còn hàng',25000,'2023-06-28 12:47:27',NULL),(102,'Serum Hỗ Trợ Giúp Phục Hồi Tóc Khô Và Hư Tổn Hair Vitamin With Pro-Keratin Complex Hair Repair Ellips 6 Viên',25000,'Còn hàng',25000,'2023-06-28 12:47:27',NULL),(103,'Serum Vitamin C Giảm Thâm Hỗ Trợ Sáng Da Brightening Serum Balance Active Formula 30Ml',119000,'Còn hàng',180000,'2023-06-28 12:47:27',NULL),(104,'Kem Ủ Tóc Đen Mượt Vitamin Hair Mask With Pro-Keratin Complex Silky Black Ellips 18Gr',12000,'Còn hàng',12000,'2023-06-28 12:47:27',NULL),(105,'Mặt Nạ Vitamin A Nâng Cơ Foodaholic 23Gr',9000,'Còn hàng',15000,'2023-06-28 12:47:28',NULL),(106,'Tinh Chất Dưỡng Sáng Và Làm Đều Màu Da Freshly Juiced Vitamin Drop Dear Klairs 35Ml',366000,'Còn hàng',430000,'2023-06-28 12:47:28',NULL),(107,'[Hàng Tặng Không Bán] Nước Tẩy Trang Simple 200Ml',0,'Còn hàng',50000,'2023-06-28 12:47:28',NULL),(108,'Kem Khử Mùi Dưỡng Da Sáng Mịn Dove Collagen & Vitamin B3 50Ml',97000,'Còn hàng',97000,'2023-06-28 12:47:29',NULL),(109,'Tinh Chất Dưỡng Tóc Đen Mượt Hair Vitamin With Pro-Keratin Complex Silky Black Ellips 6 Viên',25000,'Còn hàng',25000,'2023-06-28 12:47:29',NULL),(110,'Bông Tẩy Trang Cao Cấp Silcot Hộp 66 Miếng',47000,'Còn hàng',47000,'2023-06-28 12:47:29',NULL),(111,'Bông Tẩy Trang Jomi 120',28000,'Còn hàng',37000,'2023-06-28 12:47:30',NULL),(112,'Dầu Gội Làm Sạch Gàu Hương Táo Thơm Mát Anti-Dandruff Apple Fresh Head & Shoulders 625Ml',134000,'Còn hàng',179000,'2023-06-28 12:47:30',NULL),(113,'Bông Tẩy Trang Hộp Vuông Guardian 100 Miếng',19000,'Còn hàng',29000,'2023-06-28 12:47:31',NULL),(114,'Nước Tẩy Trang Simple Cấp Ẩm  Nhẹ Nhàng Làm Sạch Trang Điểm Micellar Cleasing Water 400Ml',132000,'Còn hàng',189000,'2023-06-28 12:47:31',NULL),(115,'Mặt Nạ Hyaluronic Acid Dưỡng Ấm Da Hyaluronic Acid Moisturizing Mask My Beauty Diary 23Ml',26000,'Còn hàng',35000,'2023-06-28 12:47:32',NULL),(116,'Kem Ủ Tóc Cho Mái Tóc Bồng Bềnh Hair Mask Volume Miracle Ellips 20Gr',12000,'Còn hàng',12000,'2023-06-28 12:47:32',NULL),(117,'Băng Vệ Sinh Belle Flora Ban Ngày Mặt Lưới 10 Miếng',30000,'Còn hàng',30000,'2023-06-28 12:47:33',NULL),(118,'Kem Đánh Răng Khoáng Đất Sét Và Acai Berry Closeup 230Gr',35000,'Còn hàng',51000,'2023-06-28 12:47:33',NULL),(119,'Mặt Nạ Aloe Lô Hội Giúp Sạch Nhờn Cho Da Benew 22Ml',15000,'Còn hàng',15000,'2023-06-28 12:47:33',NULL),(120,'Mặt Nạ Charcoal Than Hoạt Tính Se Lỗ Chân Lông Benew 22Ml',15000,'Còn hàng',15000,'2023-06-28 12:47:34',NULL),(121,'Mặt Nạ Ngọc Trai Đen Làm Hỗ Trợ Sáng Da Black Pearl Brightening Mask My Beauty Diary 23Ml',26000,'Còn hàng',35000,'2023-06-28 12:47:34',NULL),(122,'Sữa Tắm Bearglove Old Spice 473Ml',113000,'Còn hàng',161000,'2023-06-28 12:47:34',NULL),(123,'Sữa Tắm Dưỡng Ẩm Hỗ Trợ Sáng Da Love Beauty And Planet 400Ml',189000,'Còn hàng',189000,'2023-06-28 12:47:35',NULL),(124,'Gel Rửa Mặt Bí Đao Giảm Dầu Và Mụn Winter Melon Cleanser Balance Oil And Reduce Pimples Cocoon 140Ml',195000,'Còn hàng',195000,'2023-06-28 12:47:35',NULL),(125,'Kem Vàng Giảm Thâm Mắt Balance Active Formula Gold Collagen Rejuvenating Eye Serum 15Ml',160000,'Còn hàng',160000,'2023-06-28 12:47:35',NULL),(126,'Serum Cấp Nước Dưỡng Ẩm Balance Active Formula 30Ml',180000,'Còn hàng',180000,'2023-06-28 12:47:36',NULL),(127,'Mặt Nạ Bí Đao Giảm Dầu Và Mụn Winter Melon Face Mask Balance Oil And Reduce Pimples Cocoon 100Ml',345000,'Còn hàng',345000,'2023-06-28 12:47:36',NULL),(128,'Serum Balance Active Formula Niacinamide 15% Blemish Recovery Hỗ Trợ Ngừa Mụn Mờ Thâm 30Ml',133000,'Còn hàng',190000,'2023-06-28 12:47:37',NULL),(129,'Tinh Chất Giúp Ngừa Lão Hoá Balance Active Formula Gold Collagen Rejuvenating Serum 30Ml',200000,'Còn hàng',200000,'2023-06-28 12:47:37',NULL),(130,'Tinh Chất Balance Active Formula Dưỡng Ẩm 2% Hyaluronic + 3% Ceramides Double Booster 30Ml',320000,'Còn hàng',320000,'2023-06-28 12:47:37',NULL),(131,'Tinh Chất Balance Active Formula Làm Hỗ Trợ Sáng Da Vitamin C Serum 60Ml',280000,'Còn hàng',350000,'2023-06-28 12:47:38',NULL),(132,'Sữa Bột Dinh Dưỡng Cho Người Đái Tháo Đường Hương Vani Abbott Glucerna 800G',885000,'Còn hàng',885000,'2023-06-28 12:47:38',NULL),(133,'Sữa Rửa Mặt Quinoa One-Step Balanced Gel Cleanser Axis-Y 180Ml',268000,'Còn hàng',335000,'2023-06-28 12:47:38',NULL),(134,'Kem Dưỡng Ẩm Chuyển Sâu Cho Da Khô Eucerin Lipo Balance 50Ml',269000,'Còn hàng',269000,'2023-06-28 12:47:39',NULL),(135,'Sữa Bột Dinh Dưỡng Cho Người Đái Tháo Đường Hương Vani Abbott Glucerna 400G',299000,'Còn hàng',299000,'2023-06-28 12:47:39',NULL),(136,'Miếng Dán Mũi Lột Mụn Than Hoạt Tính Biore Hộp 4 Miếng',25000,'Còn hàng',25000,'2023-06-28 12:47:40',NULL),(137,'Xịt Khoáng Cho Da Nhạy Cảm Bio Essence 100Ml',180000,'Còn hàng',180000,'2023-06-28 12:47:40',NULL),(138,'Combo Serum Balance Active Formula The Mighty Three (Gold 30Ml + Vitamin C 30Ml + Hyaluronic 30Ml)',450000,'Còn hàng',450000,'2023-06-28 12:47:40',NULL),(139,'Mặt Nạ Dưỡng Da Ẩm Mượt Skin Water Full Mask Chiết Xuất Tảo Biển Jeju Bio Essence 20Ml',21000,'Còn hàng',30000,'2023-06-28 12:47:41',NULL),(140,'Xà Phòng Rửa Mặt Acne Aid Kiểm Soát Dầu Dành Cho Da Dầu & Mụn 50Ml',76000,'Còn hàng',96000,'2023-06-28 12:47:41',NULL),(141,'Dầu Gội Biotin & Collagen Hỗ Trợ Giúp Tóc Trông Dày Hơn Ogx 385Ml',191000,'Còn hàng',295000,'2023-06-28 12:47:41',NULL),(142,'Nước Tẩy Trang Dành Cho Da Nhạy Cảm Bioderma Sensibio H2O 500Ml',393000,'Còn hàng',525000,'2023-06-28 12:47:41',NULL),(143,'Nước Tẩy Trang Bioderma Dành Cho Da Hỗn Hợp, Da Dầu & Da Mụn Sébium H2O 500Ml',525000,'Còn hàng',525000,'2023-06-28 12:47:41',NULL),(144,'Dầu Dưỡng Hỗ Trợ Mờ Sẹo & Giảm Rạn Da Bio Oil 60Ml',195000,'Còn hàng',195000,'2023-06-28 12:47:42',NULL),(145,'Mặt Nạ Dưỡng Da Giúp Tái Tạo Da Skin Soothing Mask Mẫu Đơn Hoàng Cung Bio Essence 20Ml',21000,'Còn hàng',30000,'2023-06-28 12:47:42',NULL),(146,'Mặt Nạ Giúp Dưỡng Sáng Chuyên Sâu Skin Brighten-Up Mask Chiết Xuất Quả Thanh Yên Yuzu Bio Essence 20Ml',21000,'Còn hàng',30000,'2023-06-28 12:47:42',NULL),(147,'Dầu Dưỡng Hỗ Trợ Giúp Mờ Sẹo & Giảm Rạn Da Bio Oil 125Ml',325000,'Còn hàng',325000,'2023-06-28 12:47:42',NULL),(148,'Dầu Xả Biotin & Collagen Giúp Tóc Trông Dày Hơn Ogx 385Ml',191000,'Còn hàng',295000,'2023-06-28 12:47:43',NULL),(149,'Tẩy Tế Bào Chết Bio Renew Chiết Xuất Sữa Ong Chúa Bio Essence 60Gr',199000,'Còn hàng',310000,'2023-06-28 12:47:43',NULL),(150,'Dầu Gội Garden Trio Oil Giúp Giảm Rụng Tóc Botaneco 500Ml',62500,'Còn hàng',125000,'2023-06-28 12:47:43',NULL);
/*!40000 ALTER TABLE `guardian` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-26 11:21:49