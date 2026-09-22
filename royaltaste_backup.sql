CREATE DATABASE  IF NOT EXISTS `royaltaste` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `royaltaste`;
-- MySQL dump 10.13  Distrib 8.0.45, for macos15 (arm64)
--
-- Host: localhost    Database: royaltaste
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '8559c352-2228-11f1-aeb5-ef920d8884fe:1-1007';

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(150) NOT NULL,
  `location` varchar(200) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'Royal Taste Chennai','Chennai','7339060316','Active','2026-05-16 11:06:15'),(2,'Royal Taste Coimbatore','Coimbatore','7339060316','Active','2026-05-16 11:06:15');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_ratings`
--

DROP TABLE IF EXISTS `food_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_ratings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `food_id` int NOT NULL,
  `rating` int NOT NULL,
  `review` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `food_ratings_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_ratings`
--

LOCK TABLES `food_ratings` WRITE;
/*!40000 ALTER TABLE `food_ratings` DISABLE KEYS */;
INSERT INTO `food_ratings` VALUES (1,10,4,'hguyfy','2026-05-21 05:48:43'),(2,19,4,'nice','2026-05-25 05:25:08');
/*!40000 ALTER TABLE `food_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `details` text,
  `price` double NOT NULL,
  `category` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `stock_qty` int DEFAULT '20',
  `food_status` varchar(30) DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,1,'Chicken Biryani','Royal spicy biryani with fresh chicken.','Royal spicy biryani cooked with fresh chicken, basmati rice and special masala.',220,'Main Course','images/Biryani.jpeg',20,'Active','2026-05-16 11:08:07'),(2,1,'Italian Pasta','Creamy pasta with cheese and herbs.','Creamy Italian pasta prepared with cheese, herbs and rich white sauce.',180,'Main Course','images/pasta.jpeg',0,'Active','2026-05-16 11:08:07'),(3,1,'Paneer Butter Masala','Soft paneer with rich butter gravy.','Soft paneer cubes cooked in rich butter tomato gravy with Indian spices.',160,'Main Course','images/paneer.jpg',20,'Active','2026-05-16 11:08:07'),(4,1,'Meals','Soft rice with multiple curries.','Traditional meals served with rice, curry, sambar, rasam and side dishes.',160,'Main Course','images/Veg Meals.jpeg',20,'Active','2026-05-16 11:08:07'),(5,1,'Chicken 65','Royal spicy with fresh chicken.','Crispy spicy Chicken 65 made with fresh chicken and special masala.',200,'Starters','images/chicken65.jpeg',20,'Active','2026-05-16 11:08:07'),(6,1,'Spring Roll','Crispy outside spicy and delicious chicken inside.','Crispy spring roll filled with spicy delicious stuffing.',180,'Starters','images/spring roll.jpeg',20,'Active','2026-05-16 11:08:07'),(7,1,'Fries','Crispy Fries.','Golden crispy fries served hot with seasoning.',100,'Starters','images/fries.jpeg',20,'Active','2026-05-16 11:08:07'),(8,1,'Paneer Tikka','Soft paneer inside crispy outside.','Paneer tikka grilled with spices and served with chutney.',160,'Starters','images/tika.jpeg',20,'Active','2026-05-16 11:08:07'),(9,1,'Chocolate Brownie','Soft brownie with chocolate syrup.','Soft chocolate brownie topped with rich chocolate syrup.',120,'Dessert','images/brownie.jpeg',20,'Active','2026-05-16 11:08:07'),(10,1,'Vanilla Ice Cream','Cool and creamy ice cream.','Cool creamy vanilla ice cream with smooth texture.',90,'Dessert','images/ice cream.jpeg',20,'Active','2026-05-16 11:08:07'),(11,1,'Gulab Jamun','Traditional Indian sweet dessert.','Soft gulab jamun soaked in sweet sugar syrup.',80,'Dessert','images/jamun.jpeg',20,'Active','2026-05-16 11:08:07'),(12,1,'Lemon Soda','Fresh lemon soda with ice.','Fresh lemon soda served chilled with ice and refreshing taste.',60,'Cold Drinks','images/lemon.jpeg',20,'Active','2026-05-16 11:08:07'),(13,1,'Cold Coffee','Chilled coffee with cream.','Chilled coffee blended with cream and rich coffee flavor.',110,'Cold Drinks','images/Cold Coffee.jpeg',20,'Active','2026-05-16 11:08:07'),(14,1,'Cocktails','Cool mocktail drink.','Refreshing colorful mocktail drink served chilled.',130,'Cold Drinks','images/cocktails.jpeg',20,'Active','2026-05-16 11:08:07'),(15,1,'Orange Juice','Fresh orange juice without chemicals.','Fresh orange juice prepared naturally without chemicals.',90,'Fresh Juice','images/orange.jpeg',20,'Active','2026-05-16 11:08:07'),(16,1,'Watermelon Juice','Cool summer special juice.','Fresh watermelon juice served chilled for summer refreshment.',70,'Fresh Juice','images/watermelon.jpeg',20,'Active','2026-05-16 11:08:07'),(17,1,'Mango Juice','Sweet mango juice with rich taste.','Sweet mango juice with fresh mango flavor and rich taste.',100,'Fresh Juice','images/mango.jpeg',20,'Active','2026-05-16 11:08:07'),(18,2,'Chicken Biryani','Royal spicy biryani with fresh chicken.','Royal spicy biryani cooked with fresh chicken, basmati rice and special masala.',220,'Main Course','images/Biryani.jpeg',0,'Active','2026-05-16 11:08:15'),(19,2,'Italian Pasta','Creamy pasta with cheese and herbs.','Creamy Italian pasta prepared with cheese, herbs and rich white sauce.',180,'Main Course','images/pasta.jpeg',18,'Active','2026-05-16 11:08:15'),(20,2,'Paneer Butter Masala','Soft paneer with rich butter gravy.','Soft paneer cubes cooked in rich butter tomato gravy with Indian spices.',160,'Main Course','images/paneer.jpg',20,'Active','2026-05-16 11:08:15'),(21,2,'Meals','Soft rice with multiple curries.','Traditional meals served with rice, curry, sambar, rasam and side dishes.',160,'Main Course','images/Veg Meals.jpeg',20,'Active','2026-05-16 11:08:15'),(22,2,'Chicken 65','Royal spicy with fresh chicken.','Crispy spicy Chicken 65 made with fresh chicken and special masala.',200,'Starters','images/chicken65.jpeg',20,'Active','2026-05-16 11:08:15'),(23,2,'Spring Roll','Crispy outside spicy and delicious chicken inside.','Crispy spring roll filled with spicy delicious stuffing.',180,'Starters','images/spring roll.jpeg',20,'Active','2026-05-16 11:08:15'),(24,2,'Fries','Crispy Fries.','Golden crispy fries served hot with seasoning.',100,'Starters','images/fries.jpeg',20,'Active','2026-05-16 11:08:15'),(25,2,'Paneer Tikka','Soft paneer inside crispy outside.','Paneer tikka grilled with spices and served with chutney.',160,'Starters','images/tika.jpeg',20,'Active','2026-05-16 11:08:15'),(26,2,'Chocolate Brownie','Soft brownie with chocolate syrup.','Soft chocolate brownie topped with rich chocolate syrup.',120,'Dessert','images/brownie.jpeg',20,'Active','2026-05-16 11:08:15'),(27,2,'Vanilla Ice Cream','Cool and creamy ice cream.','Cool creamy vanilla ice cream with smooth texture.',90,'Dessert','images/ice cream.jpeg',20,'Active','2026-05-16 11:08:15'),(28,2,'Gulab Jamun','Traditional Indian sweet dessert.','Soft gulab jamun soaked in sweet sugar syrup.',80,'Dessert','images/jamun.jpeg',19,'Active','2026-05-16 11:08:15'),(29,2,'Lemon Soda','Fresh lemon soda with ice.','Fresh lemon soda served chilled with ice and refreshing taste.',60,'Cold Drinks','images/lemon.jpeg',20,'Active','2026-05-16 11:08:15'),(30,2,'Cold Coffee','Chilled coffee with cream.','Chilled coffee blended with cream and rich coffee flavor.',110,'Cold Drinks','images/Cold Coffee.jpeg',20,'Active','2026-05-16 11:08:15'),(31,2,'Cocktails','Cool mocktail drink.','Refreshing colorful mocktail drink served chilled.',130,'Cold Drinks','images/cocktails.jpeg',20,'Active','2026-05-16 11:08:15'),(32,2,'Orange Juice','Fresh orange juice without chemicals.','Fresh orange juice prepared naturally without chemicals.',90,'Fresh Juice','images/orange.jpeg',20,'Active','2026-05-16 11:08:15'),(33,2,'Watermelon Juice','Cool summer special juice.','Fresh watermelon juice served chilled for summer refreshment.',70,'Fresh Juice','images/watermelon.jpeg',20,'Active','2026-05-16 11:08:15'),(34,2,'Mango Juice','Sweet mango juice with rich taste.','Sweet mango juice with fresh mango flavor and rich taste.',100,'Fresh Juice','images/mango.jpeg',20,'Active','2026-05-16 11:08:15'),(35,1,'Triple Chocolate Cheesecake','A decadent, unapologetically dense dessert for chocolate lovers','A decadent, unapologetically dense dessert for chocolate lovers',250,'Dessert','images/layered-chocolate-cheesecake-recipe-card.jpg',10,'Active','2026-05-25 13:45:37'),(36,1,'Dragon chicken','spicy','spicy',200,'Starters','images/1779735557576_dragon-chicken-1.jpg',10,'Active','2026-05-25 18:59:17');
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `managers_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES (4,2,'krishna','krishna','manager@1','768907468','Active','2026-05-28 09:39:59');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,2,'Chicken Biryani',220,20,4400),(2,4,'Italian Pasta',180,20,3600),(3,5,'Gulab Jamun',80,1,80),(4,6,'Italian Pasta',180,1,180),(5,7,'Italian Pasta',180,1,180);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `customer_name` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `payment_status` varchar(100) DEFAULT 'Paid',
  `order_status` varchar(100) DEFAULT 'Order Placed',
  `grand_total` double DEFAULT '0',
  `transaction_id` varchar(100) DEFAULT NULL,
  `card_last4` varchar(10) DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,2,'gowtham','6787654567','Cash','Paid','Order Placed',4400,NULL,NULL,'2026-05-16 12:57:11'),(4,1,'ram','3456786978','Cash','Paid','Accepted',3600,NULL,NULL,'2026-05-16 12:59:31'),(5,2,'karan','6786543678','Cash','Paid','Rejected',80,NULL,NULL,'2026-05-17 05:13:22'),(6,2,'patrick','7867890678','Cash','Paid','Order Placed',180,NULL,NULL,'2026-05-18 08:53:34'),(7,2,'aj','1234567890','Cash','Paid','Order Placed',180,NULL,NULL,'2026-05-25 05:26:13');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'admin','1234');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_logs`
--

DROP TABLE IF EXISTS `payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `paid_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payment_logs_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_logs`
--

LOCK TABLES `payment_logs` WRITE;
/*!40000 ALTER TABLE `payment_logs` DISABLE KEYS */;
INSERT INTO `payment_logs` VALUES (1,2,'Cash',NULL,'Paid',4400,'2026-05-16 12:57:11'),(2,4,'Cash',NULL,'Paid',3600,'2026-05-16 12:59:31'),(3,5,'Cash',NULL,'Paid',80,'2026-05-17 05:13:22'),(4,6,'Cash',NULL,'Paid',180,'2026-05-18 08:53:34'),(5,7,'Cash',NULL,'Paid',180,'2026-05-25 05:26:13');
/*!40000 ALTER TABLE `payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_settings`
--

DROP TABLE IF EXISTS `payment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_settings` (
  `id` int NOT NULL,
  `qr_image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_settings`
--

LOCK TABLES `payment_settings` WRITE;
/*!40000 ALTER TABLE `payment_settings` DISABLE KEYS */;
INSERT INTO `payment_settings` VALUES (1,'images/my-qr.png');
/*!40000 ALTER TABLE `payment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_settings`
--

DROP TABLE IF EXISTS `reservation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `status` varchar(20) DEFAULT 'Open',
  PRIMARY KEY (`id`),
  UNIQUE KEY `branch_id` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_settings`
--

LOCK TABLES `reservation_settings` WRITE;
/*!40000 ALTER TABLE `reservation_settings` DISABLE KEYS */;
INSERT INTO `reservation_settings` VALUES (1,1,'Closed'),(2,2,'Open');
/*!40000 ALTER TABLE `reservation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_tables`
--

DROP TABLE IF EXISTS `reservation_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_tables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `capacity` int NOT NULL,
  `status` varchar(20) DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `reservation_tables_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_tables`
--

LOCK TABLES `reservation_tables` WRITE;
/*!40000 ALTER TABLE `reservation_tables` DISABLE KEYS */;
INSERT INTO `reservation_tables` VALUES (1,1,'Couple Table',2,'Active','2026-05-17 08:24:16'),(2,1,'Family Table',6,'Active','2026-05-17 08:24:16'),(3,1,'Birthday Party',10,'Active','2026-05-17 08:24:16'),(6,2,'Private Dining',8,'Active','2026-05-17 08:24:16'),(9,1,'catering',2000,'Active','2026-05-22 21:17:08');
/*!40000 ALTER TABLE `reservation_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `reservation_time` time DEFAULT NULL,
  `guests` int DEFAULT NULL,
  `message` text,
  `table_no` int DEFAULT NULL,
  `status` varchar(30) DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  KEY `table_no` (`table_no`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`table_no`) REFERENCES `reservation_tables` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,1,'krishna','3456789076','2026-05-17','12:30:00',2,'couple table',1,'Rejected','2026-05-17 08:24:16'),(2,2,'pandi','7676768787','2026-05-18','12:30:00',5,'Birthday celebration',NULL,'Accepted','2026-05-17 08:24:16');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_services`
--

DROP TABLE IF EXISTS `restaurant_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `button_text` varchar(100) DEFAULT 'Book Now',
  `button_link` varchar(100) DEFAULT 'reservation.jsp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_services`
--

LOCK TABLES `restaurant_services` WRITE;
/*!40000 ALTER TABLE `restaurant_services` DISABLE KEYS */;
INSERT INTO `restaurant_services` VALUES (1,'Fine Dining','Enjoy a luxury dining experience with delicious dishes and elegant service.','images/fine-dining.jpg','Book Now','reservation.jsp'),(2,'Fresh Food','Fresh and tasty food prepared daily with high quality ingredients.','images/fresh-food.jpg','Order Now','main-course.jsp'),(3,'Family Table','Comfortable family table service for lunch, dinner and celebrations.','images/family-table.jpg','Reserve Now','reservation.jsp'),(4,'Birthday Party','Special birthday table decoration and food service for memorable parties.','images/birthday-party.jpg','Book Party','reservation.jsp'),(5,'Catering Service','Royal catering service for weddings, meetings, functions and events.','images/catering.jpg','Book Service','reservation.jsp');
/*!40000 ALTER TABLE `restaurant_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings` (
  `id` int NOT NULL,
  `restaurant_name` varchar(150) NOT NULL,
  `logo_image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'Royal Taste ','images/logo.png');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `branch_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Active',
  `access_food` int DEFAULT '0',
  `access_orders` int DEFAULT '0',
  `access_reservations` int DEFAULT '0',
  `access_services` int DEFAULT '0',
  `access_payment` int DEFAULT '0',
  `access_reviews` int DEFAULT '0',
  `access_stock` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (3,2,'raja','raja','staff@1','5678903648','Active',1,1,1,0,1,1,1,'2026-05-16 11:53:25'),(4,1,'ravi','ravi','staff@1','5656565676','Active',1,1,1,0,0,1,1,'2026-05-16 13:01:54');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-22 11:42:35
