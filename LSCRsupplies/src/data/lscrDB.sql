CREATE DATABASE  IF NOT EXISTS `lscrdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lscrdb`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: lscrdb
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `Brands`
--

DROP TABLE IF EXISTS `Brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Brands` (
  `brandID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`brandID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brands`
--

LOCK TABLES `Brands` WRITE;
/*!40000 ALTER TABLE `Brands` DISABLE KEYS */;
INSERT INTO `Brands` VALUES (1,'Kuretake'),(2,'Alba'),(3,'Fabriano'),(4,'Liquitex'),(5,'Sharpie'),(6,'Seurat'),(7,'Staedler'),(8,'Faber Castell'),(9,'Winsor & Newton');
/*!40000 ALTER TABLE `Brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categories` (
  `clasificationID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`clasificationID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES (1,'Escolar'),(2,'Artistica');
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Color`
--

DROP TABLE IF EXISTS `Color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Color` (
  `colorID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`colorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Color`
--

LOCK TABLES `Color` WRITE;
/*!40000 ALTER TABLE `Color` DISABLE KEYS */;
/*!40000 ALTER TABLE `Color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Color_Products`
--

DROP TABLE IF EXISTS `Color_Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Color_Products` (
  `Color_colorID` int(10) unsigned NOT NULL,
  `Products_productID` int(10) unsigned NOT NULL,
  KEY `fk_Color_has_Products_Products_idx` (`Products_productID`),
  KEY `fk_Color_has_Products_Color_idx` (`Color_colorID`),
  CONSTRAINT `fk_Color_has_Products_Color` FOREIGN KEY (`Color_colorID`) REFERENCES `Color` (`colorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Color_has_Products_Products` FOREIGN KEY (`Products_productID`) REFERENCES `Products` (`productID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Color_Products`
--

LOCK TABLES `Color_Products` WRITE;
/*!40000 ALTER TABLE `Color_Products` DISABLE KEYS */;
/*!40000 ALTER TABLE `Color_Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Deliveries`
--

DROP TABLE IF EXISTS `Deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Deliveries` (
  `deliveryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`deliveryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deliveries`
--

LOCK TABLES `Deliveries` WRITE;
/*!40000 ALTER TABLE `Deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `Deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payments` (
  `paymentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`paymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payments`
--

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Price`
--

DROP TABLE IF EXISTS `Price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Price` (
  `priceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`priceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Price`
--

LOCK TABLES `Price` WRITE;
/*!40000 ALTER TABLE `Price` DISABLE KEYS */;
/*!40000 ALTER TABLE `Price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `productID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `images` varchar(45) DEFAULT NULL,
  `Brands_brandID` int(10) unsigned NOT NULL,
  `Clasifications_clasificationID` int(10) unsigned NOT NULL,
  `Price_priceID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`productID`),
  KEY `fk_Products_Brands_idx` (`Brands_brandID`),
  KEY `fk_Products_Clasifications_idx` (`Clasifications_clasificationID`),
  KEY `fk_Products_Price_idx` (`Price_priceID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,'Marcadores Kuretake Clean Colour x24','Marcadores de Tinta Acuarelable con punta pincel flexible \"real brush\" (de pelo).\n','',1,2,13190),(2,'Acrilicos Decoralba X 6 Unidades 60 Ml ','Acrilicos Decoralba X 6 Unidades 60 Ml especial para tela, madera y papel','',2,2,540),(3,'Lapices Faber Castell X24','Lapices Escolares Faber Castell Ecolapices x24 + 2 grafito','',8,1,810),(4,'Lapices Acuarelables Faber Castell X12','\n12 EcoLápices de color acuarelables\n\nLápiz de color clásico de forma hexagonal con mina protegida contra la rotura. Crea efectos fantásticos gracias a los pigmentos acuarelables de la mina.\n','',8,1,740),(5,'Set 24 Acuarelas Cotman Winsor & Newton','Set 24 Acuarelas Cotman Winsor & Newton - Contiene 24 pastillas de acuarela Cotman\n- Una paleta integrada en su estuche\n- Una paleta desmontable','',9,2,8340),(6,'Block Fabriano Black Negro 300 Grs','Block Fabriano Black Negro 300 Grs 24x32 20 Hojas, papel ilustracion','',3,2,1450),(7,'Marcadores Sharpie Fino X16 Colores Cosmicos','Marcador Sharpie de tinta permanente y punta fina.Escribe en la mayoría de las superficies sobre las que es difícil escribir y no se borra.Su tinta no se decolora y es resistente al agua.Punta de microfibras entrelazadas que evitan que se deshilache.','',5,1,1930),(8,'Caja Liquitex Basic Acrílicos+Pinceles','9 pomos de acrílico Liquitex Basics X 75 ML.Colores:rojo primario,azul primario,amarillo primario,verde hookers,sombra tostada,amarillo óxido,negro de marte y blanco de titanio(x2).6 pinceles de nylon mango corto.1 caja plástica con manija','',4,2,4300),(9,'Bastidor Seurat 50x60','Bastidor Seurat 50x60 CM Tela estudio grano fino','',6,2,660),(10,'Lata 12 Lapices Staedtler Tradition','Son lapices de alta calidad para escribir, dibujar y esbozar.Increíble resistencia a la rotura.Madera procedente de bosques de gestión sostenible.graduaciones:6B,5B,4B,3B,2B,B,HB,F,H,2H,3H y 4H.','',7,2,1270);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sale_types`
--

DROP TABLE IF EXISTS `Sale_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sale_types` (
  `saleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`saleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sale_types`
--

LOCK TABLES `Sale_types` WRITE;
/*!40000 ALTER TABLE `Sale_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sale_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales_detail`
--

DROP TABLE IF EXISTS `Sales_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sales_detail` (
  `salesID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `promotonial_code` int(11) DEFAULT NULL,
  `Products_productID` int(10) unsigned NOT NULL,
  `Price_priceID` int(10) unsigned NOT NULL,
  `Deliveries_deliveryID` int(10) unsigned NOT NULL,
  `Users_userID` int(10) unsigned NOT NULL,
  `Payments_paymentID` int(10) unsigned NOT NULL,
  `Sale_types_saleID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`salesID`),
  KEY `fk_Sales_detail_Products_idx` (`Products_productID`),
  KEY `fk_Sales_detail_Price_idx` (`Price_priceID`),
  KEY `fk_Sales_detail_Deliveries_idx` (`Deliveries_deliveryID`),
  KEY `fk_Sales_detail_Users_idx` (`Users_userID`),
  KEY `fk_Sales_detail_Payments_idx` (`Payments_paymentID`),
  KEY `fk_Sales_detail_Sale_types_idx` (`Sale_types_saleID`),
  CONSTRAINT `fk_Sales_detail_Deliveries` FOREIGN KEY (`Deliveries_deliveryID`) REFERENCES `Deliveries` (`deliveryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_detail_Payments` FOREIGN KEY (`Payments_paymentID`) REFERENCES `Payments` (`paymentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_detail_Price` FOREIGN KEY (`Price_priceID`) REFERENCES `Price` (`priceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_detail_Products` FOREIGN KEY (`Products_productID`) REFERENCES `Products` (`productID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_detail_Sale_types` FOREIGN KEY (`Sale_types_saleID`) REFERENCES `Sale_types` (`saleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_detail_Users` FOREIGN KEY (`Users_userID`) REFERENCES `Users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales_detail`
--

LOCK TABLES `Sales_detail` WRITE;
/*!40000 ALTER TABLE `Sales_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sales_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `e-mail_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-02 20:59:45
