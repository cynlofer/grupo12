CREATE DATABASE  IF NOT EXISTS `lscrdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lscrdb`;
-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: lscrdb
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Kuretake',NULL),(2,'Alba',NULL),(3,'Fabriano',NULL),(4,'Liquitex',NULL),(5,'Sharpie',NULL),(6,'Seurat',NULL),(7,'Staedler',NULL),(8,'Faber Castell',NULL),(9,'Winsor & Newton',NULL);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Escolar',NULL),(2,'Artistica',NULL),(3,'Tecnico',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_products`
--

DROP TABLE IF EXISTS `categories_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(1) NULL DEFAULT NULL,
  `updated_at` timestamp(1) NULL DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_products`
--

LOCK TABLES `categories_products` WRITE;
/*!40000 ALTER TABLE `categories_products` DISABLE KEYS */;
INSERT INTO `categories_products` VALUES (1,NULL,NULL,1,1),(2,NULL,NULL,1,2),(15,'2021-01-09 19:59:23.0','2021-01-09 19:59:23.0',7,3),(27,'2021-01-10 15:38:44.0','2021-01-10 15:38:44.0',5,2),(29,'2021-01-10 15:44:00.0','2021-01-10 15:44:00.0',9,2),(49,'2021-01-10 16:14:36.0','2021-01-10 16:14:36.0',4,2),(50,'2021-01-10 18:58:04.0','2021-01-10 18:58:04.0',3,2),(51,'2021-01-10 19:18:37.0','2021-01-10 19:18:37.0',11,2),(53,'2021-01-10 19:26:33.0','2021-01-10 19:26:33.0',6,2),(54,'2021-01-10 19:48:47.0','2021-01-10 19:48:47.0',12,2),(57,'2021-01-10 20:08:14.0','2021-01-10 20:08:14.0',13,3);
/*!40000 ALTER TABLE `categories_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color_products`
--

DROP TABLE IF EXISTS `color_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `color_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp(1) NULL DEFAULT NULL,
  `updated_at` timestamp(1) NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Color_has_Products_Products_idx` (`product_id`),
  KEY `fk_Color_has_Products_Color_idx` (`color_id`),
  CONSTRAINT `fk_Color_has_Products_Color` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Color_has_Products_Products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color_products`
--

LOCK TABLES `color_products` WRITE;
/*!40000 ALTER TABLE `color_products` DISABLE KEYS */;
INSERT INTO `color_products` VALUES (31,2,7,'2021-01-09 19:59:23.0','2021-01-09 19:59:23.0',NULL),(39,1,5,'2021-01-10 15:38:44.0','2021-01-10 15:38:44.0',NULL),(41,5,9,'2021-01-10 15:44:00.0','2021-01-10 15:44:00.0',NULL),(61,1,4,'2021-01-10 16:14:35.0','2021-01-10 16:14:35.0',NULL),(62,1,3,'2021-01-10 18:58:04.0','2021-01-10 18:58:04.0',NULL),(64,2,6,'2021-01-10 19:26:33.0','2021-01-10 19:26:33.0',NULL),(65,3,13,'2021-01-10 20:08:14.0','2021-01-10 20:08:14.0',NULL);
/*!40000 ALTER TABLE `color_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'amarillo'),(2,'rojo'),(3,'azul'),(4,'marron'),(5,'celeste');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES (1,'correo argentino',NULL),(2,'andreani',NULL),(3,'oca',NULL),(4,'cruz del sur',NULL),(5,'retiro',NULL),(6,'delivery',NULL);
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries_products`
--

DROP TABLE IF EXISTS `deliveries_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveries_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(1) NULL DEFAULT NULL,
  `updated_at` timestamp(1) NULL DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `deliverie_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries_products`
--

LOCK TABLES `deliveries_products` WRITE;
/*!40000 ALTER TABLE `deliveries_products` DISABLE KEYS */;
INSERT INTO `deliveries_products` VALUES (31,'2021-01-09 19:59:23.0','2021-01-09 19:59:23.0',7,5),(39,'2021-01-10 15:38:44.0','2021-01-10 15:38:44.0',5,1),(41,'2021-01-10 15:44:00.0','2021-01-10 15:44:00.0',9,1),(61,'2021-01-10 16:14:36.0','2021-01-10 16:14:36.0',4,1),(62,'2021-01-10 18:58:04.0','2021-01-10 18:58:04.0',3,1),(64,'2021-01-10 19:26:33.0','2021-01-10 19:26:33.0',6,1);
/*!40000 ALTER TABLE `deliveries_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'efectivo',NULL),(2,'tarjeta visa',NULL),(3,'debito',NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_products`
--

DROP TABLE IF EXISTS `payments_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(1) NULL DEFAULT NULL,
  `updated_at` timestamp(1) NULL DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `payment_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_products`
--

LOCK TABLES `payments_products` WRITE;
/*!40000 ALTER TABLE `payments_products` DISABLE KEYS */;
INSERT INTO `payments_products` VALUES (35,'2021-01-09 19:59:23.0','2021-01-09 19:59:23.0',7,1),(43,'2021-01-10 15:38:44.0','2021-01-10 15:38:44.0',5,1),(45,'2021-01-10 15:44:00.0','2021-01-10 15:44:00.0',9,1),(65,'2021-01-10 16:14:36.0','2021-01-10 16:14:36.0',4,1),(66,'2021-01-10 18:58:04.0','2021-01-10 18:58:04.0',3,1),(67,'2021-01-10 18:58:04.0','2021-01-10 18:58:04.0',3,2),(69,'2021-01-10 19:26:33.0','2021-01-10 19:26:33.0',6,3);
/*!40000 ALTER TABLE `payments_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(10,0) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `images` varchar(45) DEFAULT NULL,
  `images1` varchar(45) DEFAULT NULL,
  `images2` varchar(45) DEFAULT NULL,
  `images3` varchar(45) DEFAULT NULL,
  `brand_id` int(10) unsigned NOT NULL,
  `price` int(10) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `promocion` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`brand_id`),
  KEY `fk_Products_Brands_idx` (`brand_id`),
  KEY `fk_Products_Price_idx` (`price`),
  CONSTRAINT `fk_brandid` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'Acrilicos Decoralba X 6 Unidades 60 Ml ','Acrilicos Decoralba X 6 Unidades 60 Ml especial para tela, madera y papel','image-1610224795184.png','image1-1610224795189.png','image2-1610224795192.jpg','image3-1610224795192.png',2,540,1120,19,500,NULL),(3,'Bastidor Seurat 50 x 50 cm','Bastidor Seurat 50 X 50 CM TELA ESTUDIO GRANO FINO M-2','image-1610305084296.jpg','image1-1610305084299.png','image2-1610305084302.png','image3-1610305084322.png',6,980,1342,7,0,NULL),(4,'Lapices Polychromos Faber-Castell x60','Lápices de colores para artistas, pigmentos de calidad superior de colores brillantes y con alta resistencia a la luz, trazos suaves e intensos.\r\nResistente al roce y el agua, de mina gruesa de 3.8 mm.\r\n\r\n','image-1610294776976.png','image1-1610294777011.jpg','image2-1610294777013.png','image3-1610294777027.png',8,14000,1234,13,11900,NULL),(5,'Set 24 Acuarelas Cotman Winsor & Newton','Set 24 Acuarelas Cotman Winsor & Newton - Contiene 24 pastillas de acuarela Cotman\r\n- Una paleta integrada en su estuche\r\n- Una paleta desmontable','image-1610293124742.png','image1-1610293124756.png','image3-1610293124765.png','image3-1610283803183.png',9,8340,2315,100,8000,NULL),(6,'Block Fabriano Black Negro 300 Grs','Block Fabriano Black Negro 300 Grs 24x32 20 Hojas, papel ilustracion','image-1610306793221.png','image1-1610306793223.png','image2-1610306793226.png','image3-1610306793230.png',3,1450,1236,11,1399,NULL),(7,'Marcadores Sharpie Fino X16 Colores Cosmicos','Marcador Sharpie de tinta permanente y punta fina.Escribe en la mayoría de las superficies sobre las que es difícil escribir y no se borra.Su tinta no se decolora y es resistente al agua.Punta de microfibras entrelazadas que evitan que se deshilache.','image-1610222363496.png','image1-1610222363503.png','image2-1610222363505.png','image3-1610222363517.png',5,1930,1321,5,0,NULL),(8,'Caja Liquitex Basic Acrílicos+Pinceles','9 pomos de acrílico Liquitex Basics X 75 ML.Colores:rojo primario,azul primario,amarillo primario,verde hookers,sombra tostada,amarillo óxido,negro de marte y blanco de titanio(x2).6 pinceles de nylon mango corto.1 caja plástica con manija','image-1610222622191.png','image1-1610222622199.png','image2-1610222622208.png','image3-1610222622213.png',4,4300,1532,10,3900,NULL),(9,'Marcador Kuretake pincel x12','Los colores son fácilmente mezclables\r\ncon agua y otros tonos para conseguir\r\nuna amplia gama de tonos.\r\n\r\nPunta de pincel\r\nGrosor de puntas: 0.5 mm\r\nAcuarelables','image-1610293440497.jpg','image1-1610293440497.png','image2-1610293402678.png','image3-1610293402679.png',1,6400,1512,12,5000,NULL),(10,'Lata 12 Lapices Staedtler Tradition','Son lapices de alta calidad para escribir, dibujar y esbozar.Increíble resistencia a la rotura.Madera procedente de bosques de gestión sostenible.graduaciones:6B,5B,4B,3B,2B,B,HB,F,H,2H,3H y 4H.','image-1610303976641.png','image1-1610303976648.png','image2-1610303976651.png','image3-1610303976655.png',7,1270,1324,10,0,NULL),(11,'Acuarela Cotman Winsor&newton x1','Acuarelas Cotman Windsor & Newton, Acuarelas en pomo x 8ml serie Studio','image-1610306317634.png','image1-1610306317651.png','image2-1610306317661.png','image3-1610306317667.png',9,440,1423,10,0,NULL),(12,'Pitt Grafito Set X 26 Elementos','Set de 26 piezas en una caja metálica en calidad profesional','image-1610308127044.png','image1-1610308127099.png','image2-1610308127109.png','image3-1610308127115.png',8,13900,1543,10,0,NULL),(13,'Staedtler Multi Function Avant Grade','Staedtler Multi Function Pen Avant Garade Titanium azul, Black, Blue, Red Ink Ballpoint Pen + 0.5mm Mechanical Pencil','image-1610309268232.png','image1-1610309268246.png','image2-1610309268252.png','image3-1610309268257.png',7,11500,1390,10,0,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_types`
--

DROP TABLE IF EXISTS `sale_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_types`
--

LOCK TABLES `sale_types` WRITE;
/*!40000 ALTER TABLE `sale_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_details`
--

DROP TABLE IF EXISTS `sales_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `promo_code` int(11) DEFAULT NULL,
  `Products_productID` int(10) unsigned NOT NULL,
  `Price_priceID` int(10) unsigned NOT NULL,
  `Deliveries_deliveryID` int(10) unsigned NOT NULL,
  `Users_userID` int(10) unsigned NOT NULL,
  `Payments_paymentID` int(10) unsigned NOT NULL,
  `Sale_types_saleID` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Sales_detail_Products_idx` (`Products_productID`),
  KEY `fk_Sales_detail_Price_idx` (`Price_priceID`),
  KEY `fk_Sales_detail_Deliveries_idx` (`Deliveries_deliveryID`),
  KEY `fk_Sales_detail_Users_idx` (`Users_userID`),
  KEY `fk_Sales_detail_Payments_idx` (`Payments_paymentID`),
  KEY `fk_Sales_detail_Sale_types_idx` (`Sale_types_saleID`),
  CONSTRAINT `fk_Sales_detail_Deliveries` FOREIGN KEY (`Deliveries_deliveryID`) REFERENCES `deliveries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_detail_Payments` FOREIGN KEY (`Payments_paymentID`) REFERENCES `payments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_detail_Price` FOREIGN KEY (`Price_priceID`) REFERENCES `price` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_detail_Products` FOREIGN KEY (`Products_productID`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_detail_Sale_types` FOREIGN KEY (`Sale_types_saleID`) REFERENCES `sale_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_detail_Users` FOREIGN KEY (`Users_userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_details`
--

LOCK TABLES `sales_details` WRITE;
/*!40000 ALTER TABLE `sales_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `e-mail_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'asd','dsa','asd@asd.com','asdf','Null',NULL),(2,'test','user2','email2@email.com','veamos','Null',NULL),(4,'test1','user21','email3@email.com','$2a$08$FoCsDfdRBZUG.Kz0tcm1Du5Esnf4rdIqfTuKC3','Null',NULL),(5,'otro','nombre','lalala@lalal.com','anda','Null',NULL),(6,'test','account','123@123.com','3','Null',NULL),(7,'usuario','amano','usuario@mano.com','usuarioamano','Null',NULL),(8,'ruben','simon','ginoca30@gmail.com','$2a$10$Zerylo0Z0p7qTQI/NbHk6OCcIYz54msZrS1JOMEr1kVBD3pZLKTvS','Null',NULL),(9,'simon','simon','ginoca27@hotmail.com','123','Null',NULL),(10,'ruben','simon','rnorambuena@cruzdelsur.com','12345','Null',NULL),(11,'ruben','w','sqwww@sss','123456','Null',NULL),(12,'ruben','simon','qsq@123.com','1234','Null',NULL),(15,'ruben','simon','qsq1@ddssd.com','123456',NULL,NULL),(16,'111','111','sqwww@sss.com','11111',NULL,NULL),(17,'111','111','qsq1@dddss.com','11111',NULL,NULL),(18,'1111','111','qsq1@dddsss.com','123456',NULL,NULL),(19,'ruben','simon','ginoca30q@gmail.com','$2a$08$76jvjEC/x1CI5c/2g4Fre.oZtumSmI6JSXjRSn',NULL,NULL),(20,'ruben','simon','sqwww@ssqqqs.com','$2a$08$dN/a/.FAmBjoDKYVgtPtO.OWa2PxpMv.Z1W6i5','imagen-1608640856474.jpg',NULL),(21,'ruben','norambuena','sqwww@ssaaas.com','123456','imagen-1608640961524.jpg',NULL),(22,'ruben','simon','sqwwaaaaw@sss.com','123456','imagen-1608642030961.png',NULL),(23,'ruben','simon','sqwwww@sss.com','123456','imagen-1608645050072.svg',NULL),(24,'loena','varas','lorisepu@hotmail.com','$2a$10$P2zmZ5dUajSg0Arunbydcu0AEMpqLl62pNzadBLF52BAse9wS2s0u','imagen-1608689850273.jpg',NULL),(25,'ruben','simon','ginoca30@yahoo.com.ar','$2a$10$cNc.BI.eses7ksQwOFoClOiiC//e6F5TBbNLN0VlBBrb.Pl0xP2JK','imagen-1608695912878.jpg',NULL),(26,'guest','guest','guest@gmail.com','$2a$10$wS1RjD3X4DWgyN./h/diW.GIH84S4EwH4bdrnRiFilGQr6fJ5YITW','imagen-1610285213714.jpg',NULL),(27,'Cynthia','Lofer','cynlofer@gmail.com','$2a$10$E0Z27XQpdrGRZ9iOBI/VFevbvLW06Svx2rVG3nml3IB81.vvcryym','imagen-1610292568773.png',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-11 10:41:06
