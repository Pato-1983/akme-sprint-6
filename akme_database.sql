CREATE DATABASE  IF NOT EXISTS `akmedb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `akmedb`;
-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: akmedb
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Detectores de gases','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'EPP indumentaria','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Protectores respiratorios','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'Protectores auditivos','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'Azul','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Naranja','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Negro','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'Amarillo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'Verde','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'Transparente','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'Rojo','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'img-auditivo.jpg',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'img-detector-tubes-ph350.jpg',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'img-filtro-201b2.jpg',3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'product-img-1664743324590.jpg',NULL,'2022-10-02 20:42:04','2022-10-02 20:42:04'),(6,'product-img-1664743564786.jpg',NULL,'2022-10-02 20:46:04','2022-10-02 20:46:04'),(7,'product-img-1664743705994.jpg',NULL,'2022-10-02 20:48:26','2022-10-02 20:48:26'),(8,'product-img-1664744034803.jpg',NULL,'2022-10-02 20:53:54','2022-10-02 20:53:54'),(9,'product-img-1664744636927.jpg',NULL,'2022-10-02 21:03:56','2022-10-02 21:03:56'),(10,'product-img-1664745469164.jpg',NULL,'2022-10-02 21:17:49','2022-10-02 21:17:49'),(11,'product-img-1664745698920.jpg',NULL,'2022-10-02 21:21:38','2022-10-02 21:21:38'),(12,'product-img-1664745871297.jpg',NULL,'2022-10-02 21:24:31','2022-10-02 21:24:31'),(13,'product-img-1664752042419.jpg',NULL,'2022-10-02 23:07:22','2022-10-02 23:07:22'),(14,'product-img-1664752587300.jpg',30,'2022-10-02 23:16:27','2022-10-02 23:16:27'),(15,'product-img-1664758325249.jpg',31,'2022-10-03 00:52:05','2022-10-03 00:52:05'),(16,'product-img-1664758383522.jpg',32,'2022-10-03 00:53:03','2022-10-03 00:53:03'),(17,'product-img-1664767314664.jpg',34,'2022-10-03 03:21:54','2022-10-03 03:21:54'),(18,'product-img-1665175975870.jpg',35,'2022-10-07 20:52:55','2022-10-07 20:52:55'),(19,'product-img-1665324682335.jpg',36,'2022-10-09 14:11:22','2022-10-09 14:11:22'),(20,'product-img-1665328473706.jpg',37,'2022-10-09 15:14:33','2022-10-09 15:14:33'),(21,'product-img-1665328705640.jpg',38,'2022-10-09 15:18:25','2022-10-09 15:18:25'),(22,'product-img-1665329043688.jpg',39,'2022-10-09 15:24:03','2022-10-09 15:24:03'),(23,'product-img-1665329563470.jpg',40,'2022-10-09 15:32:43','2022-10-09 15:32:43'),(24,'product-img-1665329814048.jpg',41,'2022-10-09 15:36:54','2022-10-09 15:36:54'),(25,'product-img-1665329816837.jpg',42,'2022-10-09 15:36:56','2022-10-09 15:36:56'),(26,'product-img-1665334315926.jpg',43,'2022-10-09 16:51:55','2022-10-09 16:51:55'),(27,'product-img-1665340497533.jpg',44,'2022-10-09 18:34:57','2022-10-09 18:34:57'),(28,'product-img-1665340752410.jpg',45,'2022-10-09 18:39:12','2022-10-09 18:39:12'),(32,'product-img-1665343555222.jpg',49,'2022-10-09 19:25:55','2022-10-09 19:25:55'),(33,'product-img-1665352246869.jpg',50,'2022-10-09 21:50:46','2022-10-09 21:50:46'),(34,'product-img-1665444804741.PNG',47,'2022-10-10 23:33:24','2022-10-10 23:33:24'),(35,'product-img-1665446232544.PNG',48,'2022-10-10 23:57:12','2022-10-10 23:57:12'),(36,'product-img-1665850546845.jpg',51,'2022-10-15 16:15:46','2022-10-15 16:15:46'),(37,'product-img-1665850627903.jpg',52,'2022-10-15 16:17:07','2022-10-15 16:17:07'),(39,'product-img-1665850826166.jpg',54,'2022-10-15 16:20:26','2022-10-15 16:20:26'),(40,'product-img-1665850952348.jpg',55,'2022-10-15 16:22:32','2022-10-15 16:22:32'),(41,'product-img-1665851023165.jpg',56,'2022-10-15 16:23:43','2022-10-15 16:23:43'),(42,'product-img-1665851080635.jpg',57,'2022-10-15 16:24:40','2022-10-15 16:24:40'),(43,'product-img-1665851236734.jpg',58,'2022-10-15 16:27:16','2022-10-15 16:27:16'),(44,'product-img-1665851286667.jpg',53,'2022-10-15 16:28:06','2022-10-15 16:28:06');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (51,'Protector Auditivo','Los protectores auditivos  Akme están diseñados para entornos muy ruidosos y atenúan al máximo, incluso a frecuencias muy bajas. Los anillos aislantes tienen un relleno combinado de líquido y espuma. El resultado es un aislamiento óptimo y una presión de contacto baja, con un agradable confort incluso en uso prolongado. Los anillos aislantes tienen canales de ventilación y están revestidos con una lámina suave. Los protectores Akme son adecuados para entornos con ruido industrial muy fuerte o para trabajar con maquinaria de construcción, en aeropuertos y en la agricultura.',3000,4,2,'2022-10-15 16:15:46','2022-10-15 16:15:46'),(52,'Tubos detectores PH3-50','Los Tubos Detectores se usan para la determinación de fosfina (PH3) en aire. Los mismos permiten un rápido, práctico y económico sistema de control de seguridad y/o eficiencia en los tratamientos de fumigación con fosfina (PH3).',2500,1,6,'2022-10-15 16:17:07','2022-10-15 16:17:07'),(53,'Filtros 201-B2','Filtro antigás a rosca unificada EN 148-1 para gas y vapores inorgánicos, halógenos y ácidos halogenados. El filtro puede ser utilizado con máscaras y semimáscaras dotadas de rosca EN 148-1.s.',2000,1,1,'2022-10-15 16:18:15','2022-10-15 16:28:06'),(54,'Guantes Acrilonitrilo','Guante Bil Vex 39 cm ofrece un modelo de Acrilo-Nitrilo sin soporte textil Interior liso. Exterior antideslizante. Interior flocado, pesado. Desteridad: 5. Color: Verde. Modelo: 39 cm. Talle disponible: M(8) / L(9) / XL(10). Según Norma Europa CE. Cumple con Resolución 896, Sello S IRAM.',1500,2,5,'2022-10-15 16:20:26','2022-10-15 16:20:26'),(55,'Máscara FullFace','Protege de vapores, sustancias nocivas y gases. Práctica y eficaz. Ideal para todo tipo de industria y trabajos en contacto con sustancias contaminantes o tóxicas. Liviana y de fácil colocación. Liviana y de fácil colocación.',3500,3,1,'2022-10-15 16:22:32','2022-10-15 16:22:32'),(56,'Semi-máscara Kit DUO','Semimáscara compuesta por un Elastómero termoplástico atoxico (TPE), libre de FTALATOS, lo que permite un óptimo uso en las distintas circunstancias climáticas ya que el material a bajas o altas temperaturas conserva sus características sin permitir que el respirador se endurezca o se ablande. Ofrece uno de los más confortables adaptadores faciales disponibles actualmente, con excelente factor de calce y suave sellado. Fácil higienización y desinfección.',2000,3,1,'2022-10-15 16:23:43','2022-10-15 16:23:43'),(57,'Mameluco Tyvek','Mameluco: Se trata de un material único y versátil, resistente y con una textura muy ligera y suave... TYVEK® ha sido inventado y es fabricado exclusivamente por DuPont. TYVEK® es permeable al aire y al vapor de agua y, además, repele aerosoles líquidos y líquidos acuosos. Actúa como una barrera excelente contra partículas y fibras. Suelta poca pelusa y está tratado antiestáticamente.',3200,2,4,'2022-10-15 16:24:40','2022-10-15 16:24:40'),(58,'Detector WatchGas ','El detector monogas PDM es el monitor de uso diario perfecto para entornos peligrosos  gracias a su alta fiabilidad y facilidad de uso. PDM ofrece la forma más rentable de garantizar la seguridad. Funciona hasta dos años sin necesidad de mantenimiento,  sencillamente encienda el dispositivo y este funcionará ininterrumpidamente: no será necesario cambiar baterías o sustituir los sensores o baterías. Esto supone una gran fiabilidad sin periodos de inactividad.',5000,1,2,'2022-10-15 16:27:16','2022-10-15 16:27:16');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Usuario','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequelizemeta`
--

LOCK TABLES `sequelizemeta` WRITE;
/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */;
INSERT INTO `sequelizemeta` VALUES ('20221011235948-create-roles.js'),('20221012001020-create-users.js');
/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `celular` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `roles_Id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'Patricio','Constantino','patricioconstantino@hotmail.com','$2a$10$p0F4jBcJqic9gM5T6Tn7JexdQ1UvQ72NY0rdFW730nx4HMwuNqY9W','5491133998875','user-img-1665849718865.PNG',1,'2022-10-13 00:45:01','2022-10-15 16:01:58'),(6,'Bruno','Grieco','brunogrieco@gmail.com','$2a$10$yHjUMFuyTKewJRCTz3Wm1./js5ZyALwNJEwbmFkRYjl0ab5R6zBYG','5491122549107','user-img-1665849747954.PNG',2,'2022-10-15 15:33:51','2022-10-15 16:02:27'),(7,'Rodrigo','Fuenzalida','rodrigofuenzalida@gmail.com','$2a$10$mFA4FWM.Gdj3w702IfYI4eBsECCUaKeA9H4LjM1cLZ6BohCIPbTeK','5493874409463','user-img-1665849781282.PNG',2,'2022-10-15 15:35:06','2022-10-15 16:03:01'),(9,'Lucas','Rivas','lucasrivas@gmail.com','$2a$10$MS7aGckdzBOnPeeONdh79./VW7mGEHQPySIz4XUAmIZEBuKqOvg7u','5493543692845','user-img-1665849803384.PNG',2,'2022-10-15 15:42:25','2022-10-15 16:03:23');
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

-- Dump completed on 2022-10-15 15:26:28
