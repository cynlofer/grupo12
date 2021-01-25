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
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `idpedido` varchar(10) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp(1) NULL DEFAULT NULL,
  `updated_at` timestamp(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (21,2,'Acrilicos Decoralba X 6 Unidades 60 Ml ',540,'image-1610224795184.png',1,2,'0000-00-00','nfI5ee2mf6',1,NULL,'2021-01-25 01:24:44.0','2021-01-25 05:10:37.0'),(22,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'2021-01-24','nfI5ee2mf6',1,NULL,'2021-01-25 01:24:44.0','2021-01-25 20:09:20.0'),(23,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'2021-01-24','k01HtgZCLB',1,NULL,'2021-01-25 01:25:24.0','2021-01-25 20:09:20.0'),(24,5,'Set 24 Acuarelas Cotman Winsor & Newton',8340,'image-1610293124742.png',1,0,'2021-01-24','k01HtgZCLB',1,NULL,'2021-01-25 01:25:24.0','2021-01-25 20:09:20.0'),(27,5,'Set 24 Acuarelas Cotman Winsor & Newton',8340,'image-1610293124742.png',1,0,'0000-00-00','8vQNbfjknG',1,NULL,'2021-01-25 01:26:23.0','2021-01-25 20:09:20.0'),(28,4,'Lapices Polychromos Faber-Castell x60',14000,'image-1610294776976.png',1,0,'0000-00-00','8vQNbfjknG',1,NULL,'2021-01-25 01:26:23.0','2021-01-25 20:09:20.0'),(29,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'2021-01-24','8vQNbfjknG',1,NULL,'2021-01-25 01:26:23.0','2021-01-25 20:09:20.0'),(30,4,'Lapices Polychromos Faber-Castell x60',14000,'image-1610294776976.png',1,0,'2021-01-24','t6RnwWkfyy',1,NULL,'2021-01-25 01:27:06.0','2021-01-25 20:09:20.0'),(31,8,'Caja Liquitex Basic Acrílicos+Pinceles',4300,'image-1610222622191.png',1,2,'2021-01-24','t6RnwWkfyy',1,NULL,'2021-01-25 01:27:06.0','2021-01-25 05:10:37.0'),(32,6,'Block Fabriano Black Negro 300 Grs',1450,'image-1610306793221.png',1,2,'2021-01-24','t6RnwWkfyy',1,NULL,'2021-01-25 01:27:06.0','2021-01-25 02:36:33.0'),(38,2,'Acrilicos Decoralba X 6 Unidades 60 Ml ',540,'image-1610224795184.png',1,2,'0000-00-00','86WNxNXQOC',1,NULL,'2021-01-25 01:30:09.0','2021-01-25 05:10:37.0'),(39,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'0000-00-00','86WNxNXQOC',1,NULL,'2021-01-25 01:30:09.0','2021-01-25 20:09:20.0'),(40,4,'Lapices Polychromos Faber-Castell x60',14000,'image-1610294776976.png',1,0,'0000-00-00','86WNxNXQOC',1,NULL,'2021-01-25 01:30:09.0','2021-01-25 20:09:20.0'),(41,5,'Set 24 Acuarelas Cotman Winsor & Newton',8340,'image-1610293124742.png',1,0,'0000-00-00','86WNxNXQOC',1,NULL,'2021-01-25 01:30:09.0','2021-01-25 20:09:20.0'),(42,6,'Block Fabriano Black Negro 300 Grs',1450,'image-1610306793221.png',1,2,'0000-00-00','86WNxNXQOC',1,NULL,'2021-01-25 01:30:09.0','2021-01-25 02:25:06.0'),(45,5,'Set 24 Acuarelas Cotman Winsor & Newton',8340,'image-1610293124742.png',1,0,'0000-00-00','Y6gb2dH5bV',1,NULL,'2021-01-25 01:36:08.0','2021-01-25 20:09:20.0'),(46,2,'Acrilicos Decoralba X 6 Unidades 60 Ml ',540,'image-1610224795184.png',1,2,'0000-00-00','Y6gb2dH5bV',1,NULL,'2021-01-25 01:36:08.0','2021-01-25 05:10:37.0'),(47,7,'Marcadores Sharpie Fino X16 Colores Cosmicos',1930,'image-1610222363496.png',1,2,'2021-01-24','Y6gb2dH5bV',1,NULL,'2021-01-25 01:36:08.0','2021-01-25 02:36:33.0'),(48,5,'Set 24 Acuarelas Cotman Winsor & Newton',8340,'image-1610293124742.png',1,0,'2021-01-24','ZNh749GR7G',1,NULL,'2021-01-25 01:37:41.0','2021-01-25 20:09:20.0'),(49,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'2021-01-24','Rs5eH13ms1',1,NULL,'2021-01-25 01:39:40.0','2021-01-25 20:09:20.0'),(50,5,'Set 24 Acuarelas Cotman Winsor & Newton',8340,'image-1610293124742.png',1,0,'2021-01-24','Rs5eH13ms1',1,NULL,'2021-01-25 01:39:40.0','2021-01-25 20:09:20.0'),(51,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'2021-01-24','gmuVUXLvWN',1,NULL,'2021-01-25 01:44:26.0','2021-01-25 20:09:20.0'),(52,8,'Caja Liquitex Basic Acrílicos+Pinceles',4300,'image-1610222622191.png',1,2,'2021-01-24','gmuVUXLvWN',1,NULL,'2021-01-25 01:44:26.0','2021-01-25 05:10:37.0'),(53,9,'Marcador Kuretake pincel x12',6400,'image-1610293440497.jpg',1,3,'2021-01-24','gmuVUXLvWN',1,NULL,'2021-01-25 01:44:26.0','2021-01-25 05:06:55.0'),(56,5,'Set 24 Acuarelas Cotman Winsor & Newton',8340,'image-1610293124742.png',1,0,'0000-00-00','wl5kKeMIkl',1,NULL,'2021-01-25 02:12:47.0','2021-01-25 20:09:20.0'),(57,2,'Acrilicos Decoralba X 6 Unidades 60 Ml ',540,'image-1610224795184.png',1,2,'0000-00-00','wl5kKeMIkl',1,NULL,'2021-01-25 02:12:47.0','2021-01-25 05:10:37.0'),(58,6,'Block Fabriano Black Negro 300 Grs',1450,'image-1610306793221.png',1,2,'2021-01-24','wl5kKeMIkl',1,NULL,'2021-01-25 02:12:47.0','2021-01-25 02:36:33.0'),(62,6,'Block Fabriano Black Negro 300 Grs',1450,'image-1610306793221.png',1,2,'0000-00-00','8JCxFqgJXx',1,NULL,'2021-01-25 02:14:15.0','2021-01-25 02:25:06.0'),(63,2,'Acrilicos Decoralba X 6 Unidades 60 Ml ',540,'image-1610224795184.png',1,2,'0000-00-00','8JCxFqgJXx',1,NULL,'2021-01-25 02:14:15.0','2021-01-25 05:10:37.0'),(64,4,'Lapices Polychromos Faber-Castell x60',14000,'image-1610294776976.png',1,0,'0000-00-00','8JCxFqgJXx',1,NULL,'2021-01-25 02:14:15.0','2021-01-25 20:09:20.0'),(68,5,'Set 24 Acuarelas Cotman Winsor & Newton',8340,'image-1610293124742.png',1,0,'0000-00-00','CE4lO3JhL4',1,NULL,'2021-01-25 02:16:48.0','2021-01-25 20:09:20.0'),(69,2,'Acrilicos Decoralba X 6 Unidades 60 Ml ',540,'image-1610224795184.png',1,2,'0000-00-00','CE4lO3JhL4',1,NULL,'2021-01-25 02:16:48.0','2021-01-25 05:10:37.0'),(70,9,'Marcador Kuretake pincel x12',6400,'image-1610293440497.jpg',1,3,'0000-00-00','CE4lO3JhL4',1,NULL,'2021-01-25 02:16:48.0','2021-01-25 05:06:55.0'),(71,6,'Block Fabriano Black Negro 300 Grs',1450,'image-1610306793221.png',1,2,'2021-01-24','CE4lO3JhL4',1,NULL,'2021-01-25 02:16:48.0','2021-01-25 02:36:33.0'),(75,2,'Acrilicos Decoralba X 6 Unidades 60 Ml ',540,'image-1610224795184.png',1,2,'0000-00-00','5au2S85PLr',1,NULL,'2021-01-25 02:23:36.0','2021-01-25 05:10:37.0'),(76,4,'Lapices Polychromos Faber-Castell x60',14000,'image-1610294776976.png',1,0,'0000-00-00','5au2S85PLr',1,NULL,'2021-01-25 02:23:36.0','2021-01-25 20:09:20.0'),(77,8,'Caja Liquitex Basic Acrílicos+Pinceles',4300,'image-1610222622191.png',1,2,'0000-00-00','5au2S85PLr',1,NULL,'2021-01-25 02:23:36.0','2021-01-25 05:10:37.0'),(78,5,'Set 24 Acuarelas Cotman Winsor & Newton',8340,'image-1610293124742.png',1,0,'2021-01-24','5au2S85PLr',1,NULL,'2021-01-25 02:23:36.0','2021-01-25 20:09:20.0'),(80,6,'Block Fabriano Black Negro 300 Grs',1450,'image-1610306793221.png',1,2,'0000-00-00','9mMlR0AWS4',1,NULL,'2021-01-25 02:25:00.0','2021-01-25 02:25:06.0'),(81,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'2021-01-24','9mMlR0AWS4',1,NULL,'2021-01-25 02:25:00.0','2021-01-25 20:09:20.0'),(86,2,'Acrilicos Decoralba X 6 Unidades 60 Ml ',540,'image-1610224795184.png',1,2,'0000-00-00','dmZD9Grnpk',1,NULL,'2021-01-25 02:32:47.0','2021-01-25 05:10:37.0'),(87,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'0000-00-00','dmZD9Grnpk',1,NULL,'2021-01-25 02:32:47.0','2021-01-25 20:09:20.0'),(88,4,'Lapices Polychromos Faber-Castell x60',14000,'image-1610294776976.png',1,0,'0000-00-00','dmZD9Grnpk',1,NULL,'2021-01-25 02:32:47.0','2021-01-25 20:09:20.0'),(89,5,'Set 24 Acuarelas Cotman Winsor & Newton',8340,'image-1610293124742.png',1,0,'0000-00-00','dmZD9Grnpk',1,NULL,'2021-01-25 02:32:47.0','2021-01-25 20:09:20.0'),(90,8,'Caja Liquitex Basic Acrílicos+Pinceles',4300,'image-1610222622191.png',1,2,'2021-01-24','dmZD9Grnpk',1,NULL,'2021-01-25 02:32:47.0','2021-01-25 05:10:37.0'),(91,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'2021-01-24','VJonuScUjh',1,NULL,'2021-01-25 02:33:15.0','2021-01-25 20:09:20.0'),(92,5,'Set 24 Acuarelas Cotman Winsor & Newton',8340,'image-1610293124742.png',1,0,'2021-01-24','VJonuScUjh',1,NULL,'2021-01-25 02:33:15.0','2021-01-25 20:09:20.0'),(93,8,'Caja Liquitex Basic Acrílicos+Pinceles',4300,'image-1610222622191.png',1,2,'2021-01-24','VJonuScUjh',1,NULL,'2021-01-25 02:33:15.0','2021-01-25 05:10:37.0'),(94,6,'Block Fabriano Black Negro 300 Grs',1450,'image-1610306793221.png',1,1,'2021-01-24','is0LHXRCgZ',1,NULL,'2021-01-25 02:36:28.0','2021-01-25 02:36:33.0'),(95,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'2021-01-24','is0LHXRCgZ',1,NULL,'2021-01-25 02:36:28.0','2021-01-25 20:09:20.0'),(96,8,'Caja Liquitex Basic Acrílicos+Pinceles',4300,'image-1610222622191.png',1,2,'2021-01-24','is0LHXRCgZ',1,NULL,'2021-01-25 02:36:28.0','2021-01-25 05:10:37.0'),(102,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'2021-01-25','bcBNbIbdFe',1,NULL,'2021-01-25 03:06:19.0','2021-01-25 20:09:20.0'),(103,5,'Set 24 Acuarelas Cotman Winsor & Newton',8340,'image-1610293124742.png',1,0,'2021-01-25','bcBNbIbdFe',1,NULL,'2021-01-25 03:06:19.0','2021-01-25 20:09:20.0'),(104,2,'Acrilicos Decoralba X 6 Unidades 60 Ml ',540,'image-1610224795184.png',1,2,'2021-01-25','BA8YIn2dEL',1,NULL,'2021-01-25 03:29:22.0','2021-01-25 05:10:37.0'),(105,4,'Lapices Polychromos Faber-Castell x60',14000,'image-1610294776976.png',1,0,'2021-01-25','BA8YIn2dEL',1,NULL,'2021-01-25 03:29:22.0','2021-01-25 20:09:20.0'),(106,8,'Caja Liquitex Basic Acrílicos+Pinceles',4300,'image-1610222622191.png',1,2,'2021-01-25','BA8YIn2dEL',1,NULL,'2021-01-25 03:29:22.0','2021-01-25 05:10:37.0'),(117,2,'Acrilicos Decoralba X 6 Unidades 60 Ml ',540,'image-1610224795184.png',1,2,'2021-01-25','H30M9HpoNl',1,NULL,'2021-01-25 04:02:38.0','2021-01-25 05:10:37.0'),(118,4,'Lapices Polychromos Faber-Castell x60',14000,'image-1610294776976.png',1,0,'2021-01-25','H30M9HpoNl',1,NULL,'2021-01-25 04:02:38.0','2021-01-25 20:09:20.0'),(121,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'2021-01-01','eZscOF8qTW',1,NULL,'2021-01-25 04:09:28.0','2021-01-25 20:09:20.0'),(124,5,'Set 24 Acuarelas Cotman Winsor & Newton',8340,'image-1610293124742.png',1,0,'2025-01-20','eqR4yeilCw',1,NULL,'2021-01-25 04:13:36.0','2021-01-25 20:09:20.0'),(133,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'0000-00-00','OkPo18CquP',1,NULL,'2021-01-25 04:40:48.0','2021-01-25 20:09:20.0'),(135,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'2021-01-25','OgmPzijESh',1,NULL,'2021-01-25 04:41:43.0','2021-01-25 20:09:20.0'),(144,5,'Set 24 Acuarelas Cotman Winsor & Newton',8340,'image-1610293124742.png',1,0,'2021-01-25','YVPkEvZO7n',1,NULL,'2021-01-25 05:00:42.0','2021-01-25 20:09:20.0'),(145,2,'Acrilicos Decoralba X 6 Unidades 60 Ml ',540,'image-1610224795184.png',1,2,'2021-01-25','MjWQ7FGyUa',1,NULL,'2021-01-25 05:06:36.0','2021-01-25 05:10:37.0'),(146,4,'Lapices Polychromos Faber-Castell x60',14000,'image-1610294776976.png',1,0,'2021-01-25','MjWQ7FGyUa',1,NULL,'2021-01-25 05:06:36.0','2021-01-25 20:09:20.0'),(147,9,'Marcador Kuretake pincel x12',6400,'image-1610293440497.jpg',1,3,'2021-01-25','MjWQ7FGyUa',1,NULL,'2021-01-25 05:06:36.0','2021-01-25 05:06:55.0'),(148,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'2021-01-25','VuSXxOsEuh',1,NULL,'2021-01-25 05:09:33.0','2021-01-25 20:09:20.0'),(150,2,'Acrilicos Decoralba X 6 Unidades 60 Ml ',540,'image-1610224795184.png',1,2,'2021-01-25','9Oy3INNUWh',1,NULL,'2021-01-25 05:10:29.0','2021-01-25 05:10:37.0'),(152,8,'Caja Liquitex Basic Acrílicos+Pinceles',4300,'image-1610222622191.png',1,2,'2021-01-25','9Oy3INNUWh',1,NULL,'2021-01-25 05:10:29.0','2021-01-25 05:10:37.0'),(153,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'2021-01-25','LMmHIzkZEv',1,NULL,'2021-01-25 05:12:04.0','2021-01-25 20:09:20.0'),(154,4,'Lapices Polychromos Faber-Castell x60',14000,'image-1610294776976.png',1,0,'2021-01-25','LMmHIzkZEv',1,NULL,'2021-01-25 05:12:04.0','2021-01-25 20:09:20.0'),(155,3,'Bastidor Seurat 50 x 50 cm',980,'image-1610305084296.jpg',1,0,'2021-01-25','9hv9ki1wv0',1,NULL,'2021-01-25 05:23:45.0','2021-01-25 20:09:20.0'),(156,4,'Lapices Polychromos Faber-Castell x60',14000,'image-1610294776976.png',1,0,'2021-01-25','9hv9ki1wv0',1,NULL,'2021-01-25 05:23:45.0','2021-01-25 20:09:20.0');
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(1) NULL DEFAULT NULL,
  `updated_at` timestamp(1) NULL DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_products`
--

LOCK TABLES `categories_products` WRITE;
/*!40000 ALTER TABLE `categories_products` DISABLE KEYS */;
INSERT INTO `categories_products` VALUES (1,'2021-01-13 01:19:44.0','2021-01-13 01:19:44.0',2,3),(2,'2021-01-13 01:20:07.0','2021-01-13 01:20:07.0',3,2),(3,'2021-01-13 01:20:16.0','2021-01-13 01:20:16.0',4,2),(4,'2021-01-13 01:20:26.0','2021-01-13 01:20:26.0',13,3);
/*!40000 ALTER TABLE `categories_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color_products`
--

DROP TABLE IF EXISTS `color_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color_products`
--

LOCK TABLES `color_products` WRITE;
/*!40000 ALTER TABLE `color_products` DISABLE KEYS */;
INSERT INTO `color_products` VALUES (41,5,9,'2021-01-10 15:44:00.0','2021-01-10 15:44:00.0',NULL),(64,2,6,'2021-01-10 19:26:33.0','2021-01-10 19:26:33.0',NULL),(67,1,12,'2021-01-13 01:14:27.0','2021-01-13 01:14:27.0',NULL),(68,1,2,'2021-01-13 01:19:44.0','2021-01-13 01:19:44.0',NULL),(69,1,3,'2021-01-13 01:20:07.0','2021-01-13 01:20:07.0',NULL),(70,1,4,'2021-01-13 01:20:16.0','2021-01-13 01:20:16.0',NULL),(71,3,13,'2021-01-13 01:20:26.0','2021-01-13 01:20:26.0',NULL),(72,2,7,'2021-01-14 21:43:56.0','2021-01-14 21:43:56.0',NULL),(74,1,5,'2021-01-18 12:12:47.0','2021-01-18 12:12:47.0',NULL);
/*!40000 ALTER TABLE `color_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliveries_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(1) NULL DEFAULT NULL,
  `updated_at` timestamp(1) NULL DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `deliverie_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries_products`
--

LOCK TABLES `deliveries_products` WRITE;
/*!40000 ALTER TABLE `deliveries_products` DISABLE KEYS */;
INSERT INTO `deliveries_products` VALUES (41,'2021-01-10 15:44:00.0','2021-01-10 15:44:00.0',9,1),(64,'2021-01-10 19:26:33.0','2021-01-10 19:26:33.0',6,1),(66,'2021-01-13 01:14:27.0','2021-01-13 01:14:27.0',12,1),(67,'2021-01-13 01:19:44.0','2021-01-13 01:19:44.0',2,1),(68,'2021-01-13 01:20:07.0','2021-01-13 01:20:07.0',3,1),(69,'2021-01-13 01:20:16.0','2021-01-13 01:20:16.0',4,1),(70,'2021-01-13 01:20:27.0','2021-01-13 01:20:27.0',13,2),(71,'2021-01-14 21:43:56.0','2021-01-14 21:43:56.0',7,5),(73,'2021-01-18 12:12:47.0','2021-01-18 12:12:47.0',5,1);
/*!40000 ALTER TABLE `deliveries_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(1) NULL DEFAULT NULL,
  `updated_at` timestamp(1) NULL DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `payment_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_products`
--

LOCK TABLES `payments_products` WRITE;
/*!40000 ALTER TABLE `payments_products` DISABLE KEYS */;
INSERT INTO `payments_products` VALUES (45,'2021-01-10 15:44:00.0','2021-01-10 15:44:00.0',9,1),(69,'2021-01-10 19:26:33.0','2021-01-10 19:26:33.0',6,3),(71,'2021-01-13 01:14:27.0','2021-01-13 01:14:27.0',12,1),(72,'2021-01-13 01:19:44.0','2021-01-13 01:19:44.0',2,2),(73,'2021-01-13 01:20:07.0','2021-01-13 01:20:07.0',3,1),(74,'2021-01-13 01:20:07.0','2021-01-13 01:20:07.0',3,2),(75,'2021-01-13 01:20:16.0','2021-01-13 01:20:16.0',4,1),(76,'2021-01-13 01:20:26.0','2021-01-13 01:20:26.0',13,1),(77,'2021-01-14 21:43:56.0','2021-01-14 21:43:56.0',7,1),(79,'2021-01-18 12:12:47.0','2021-01-18 12:12:47.0',5,1);
/*!40000 ALTER TABLE `payments_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'Acrilicos Decoralba X 6 Unidades 60 Ml ','Acrilicos Decoralba X 6 Unidades 60 Ml especial para tela, madera y papel','image-1610224795184.png','image1-1610224795189.png','image2-1610224795192.jpg','image3-1610224795192.png',2,540,1120,19,500,NULL),(3,'Bastidor Seurat 50 x 50 cm','Bastidor Seurat 50 X 50 CM TELA ESTUDIO GRANO FINO M-2','image-1610305084296.jpg','image1-1610305084299.png','image2-1610305084302.png','image3-1610305084322.png',6,980,1342,7,0,NULL),(4,'Lapices Polychromos Faber-Castell x60','Lápices de colores para artistas, pigmentos de calidad superior de colores brillantes y con alta resistencia a la luz, trazos suaves e intensos.\r\nResistente al roce y el agua, de mina gruesa de 3.8 mm.\r\n\r\n','image-1610294776976.png','image1-1610294777011.jpg','image2-1610294777013.png','image3-1610294777027.png',8,14000,1234,13,11900,NULL),(5,'Set 24 Acuarelas Cotman Winsor & Newton','Set 24 Acuarelas Cotman Winsor & Newton - Contiene 24 pastillas de acuarela Cotman\r\n- Una paleta integrada en su estuche\r\n- Una paleta desmontable','image-1610293124742.png','image1-1610293124756.png','image3-1610293124765.png','image3-1610283803183.png',9,8340,2315,100,7994,NULL),(6,'Block Fabriano Black Negro 300 Grs','Block Fabriano Black Negro 300 Grs 24x32 20 Hojas, papel ilustracion','image-1610306793221.png','image1-1610306793223.png','image2-1610306793226.png','image3-1610306793230.png',3,1450,1236,11,1399,NULL),(7,'Marcadores Sharpie Fino X16 Colores Cosmicos','Marcador Sharpie de tinta permanente y punta fina.Escribe en la mayoría de las superficies sobre las que es difícil escribir y no se borra.Su tinta no se decolora y es resistente al agua.Punta de microfibras entrelazadas que evitan que se deshilache.','image-1610222363496.png','image1-1610222363503.png','image2-1610222363505.png','image3-1610222363517.png',5,1930,1322,5,0,NULL),(8,'Caja Liquitex Basic Acrílicos+Pinceles','9 pomos de acrílico Liquitex Basics X 75 ML.Colores:rojo primario,azul primario,amarillo primario,verde hookers,sombra tostada,amarillo óxido,negro de marte y blanco de titanio(x2).6 pinceles de nylon mango corto.1 caja plástica con manija','image-1610222622191.png','image1-1610222622199.png','image2-1610222622208.png','image3-1610222622213.png',4,4300,1532,10,3900,NULL),(9,'Marcador Kuretake pincel x12','Los colores son fácilmente mezclables\r\ncon agua y otros tonos para conseguir\r\nuna amplia gama de tonos.\r\n\r\nPunta de pincel\r\nGrosor de puntas: 0.5 mm\r\nAcuarelables','image-1610293440497.jpg','image1-1610293440497.png','image2-1610293402678.png','image3-1610293402679.png',1,6400,1512,12,5000,NULL),(10,'Lata 12 Lapices Staedtler Tradition','Son lapices de alta calidad para escribir, dibujar y esbozar.Increíble resistencia a la rotura.Madera procedente de bosques de gestión sostenible.graduaciones:6B,5B,4B,3B,2B,B,HB,F,H,2H,3H y 4H.','image-1610303976641.png','image1-1610303976648.png','image2-1610303976651.png','image3-1610303976655.png',7,1270,1324,10,0,NULL),(11,'Acuarela Cotman Winsor&newton x1','Acuarelas Cotman Windsor & Newton, Acuarelas en pomo x 8ml serie Studio','image-1610306317634.png','image1-1610306317651.png','image2-1610306317661.png','image3-1610306317667.png',9,440,1423,10,0,NULL),(12,'Pitt Grafito Set X 26 Elementos','Set de 26 piezas en una caja metálica en calidad profesional','image-1610308127044.png','image1-1610308127099.png','image2-1610308127109.png','image3-1610308127115.png',8,13900,1543,10,0,NULL),(13,'Staedtler Multi Function Avant Grade','Staedtler Multi Function Pen Avant Garade Titanium azul, Black, Blue, Red Ink Ballpoint Pen + 0.5mm Mechanical Pencil','image-1610309268232.png','image1-1610309268246.png','image2-1610309268252.png','image3-1610309268257.png',7,11500,1390,10,0,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_types`
--

DROP TABLE IF EXISTS `sale_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ruben','norambuena','ginoca30@gmail.com','$2a$10$juK9rl0TuIG3g4llMO40DuuJKvpJnY./.jCVNzeyZL0o6nEeGDHb.','imagen-1611509310331.jpg',NULL);
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

-- Dump completed on 2021-01-25 17:24:33
