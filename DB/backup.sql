-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: lallyzeada
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `carrito_de_compra`
--

DROP TABLE IF EXISTS `carrito_de_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_de_compra` (
  `id_Carrito` int(11) NOT NULL AUTO_INCREMENT,
  `id_Usuario` int(11) NOT NULL,
  `id_Prod` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` int(11) NOT NULL,
  PRIMARY KEY (`id_Carrito`),
  KEY `id_Usuario` (`id_Usuario`),
  KEY `id_Prod` (`id_Prod`),
  CONSTRAINT `carrito_de_compra_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`),
  CONSTRAINT `carrito_de_compra_ibfk_2` FOREIGN KEY (`id_Prod`) REFERENCES `producto` (`id_Prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_de_compra`
--

LOCK TABLES `carrito_de_compra` WRITE;
/*!40000 ALTER TABLE `carrito_de_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito_de_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_Categoria` int(11) NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id_Comentario` int(11) NOT NULL AUTO_INCREMENT,
  `id_Usuario` int(11) DEFAULT NULL,
  `id_Prod` int(11) DEFAULT NULL,
  `Cometario` text,
  `Fecha_hr` datetime DEFAULT NULL,
  PRIMARY KEY (`id_Comentario`),
  KEY `id_Usuario` (`id_Usuario`),
  KEY `id_Prod` (`id_Prod`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_Prod`) REFERENCES `producto` (`id_Prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_det`
--

DROP TABLE IF EXISTS `factura_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_det` (
  `id_Detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_Factura` int(11) NOT NULL,
  `id_Prod` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio_Unitario` decimal(18,2) NOT NULL,
  `Subtotal` decimal(18,2) NOT NULL,
  PRIMARY KEY (`id_Detalle`),
  KEY `id_Factura` (`id_Factura`),
  KEY `id_Prod` (`id_Prod`),
  CONSTRAINT `factura_det_ibfk_1` FOREIGN KEY (`id_Factura`) REFERENCES `factura_enc` (`id_Factura`),
  CONSTRAINT `factura_det_ibfk_2` FOREIGN KEY (`id_Prod`) REFERENCES `producto` (`id_Prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_det`
--

LOCK TABLES `factura_det` WRITE;
/*!40000 ALTER TABLE `factura_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_enc`
--

DROP TABLE IF EXISTS `factura_enc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_enc` (
  `id_Factura` int(11) NOT NULL AUTO_INCREMENT,
  `id_Usuario` int(11) NOT NULL,
  `id_Pago` int(11) NOT NULL,
  `Total` decimal(18,2) NOT NULL,
  `Fecha` datetime NOT NULL,
  PRIMARY KEY (`id_Factura`),
  KEY `id_Usuario` (`id_Usuario`),
  KEY `id_Pago` (`id_Pago`),
  CONSTRAINT `factura_enc_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`),
  CONSTRAINT `factura_enc_ibfk_2` FOREIGN KEY (`id_Pago`) REFERENCES `tipo_de_pago` (`id_Pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_enc`
--

LOCK TABLES `factura_enc` WRITE;
/*!40000 ALTER TABLE `factura_enc` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_enc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presupuesto`
--

DROP TABLE IF EXISTS `presupuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presupuesto` (
  `id_Presupuesto` int(11) NOT NULL AUTO_INCREMENT,
  `id_Usuario` int(11) NOT NULL,
  `id_Prod` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Presupuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presupuesto`
--

LOCK TABLES `presupuesto` WRITE;
/*!40000 ALTER TABLE `presupuesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `presupuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_Prod` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Prod` varchar(50) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `Precio` decimal(18,2) NOT NULL,
  `Unid_Exits` int(11) NOT NULL,
  `img1` varchar(250) DEFAULT NULL,
  `img2` varchar(250) DEFAULT NULL,
  `img3` varchar(250) DEFAULT NULL,
  `video` varchar(250) DEFAULT NULL,
  `id_Categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Prod`),
  KEY `id_Categoria` (`id_Categoria`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_Categoria`) REFERENCES `categoria` (`id_Categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_pago`
--

DROP TABLE IF EXISTS `tipo_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_de_pago` (
  `id_Pago` int(11) NOT NULL AUTO_INCREMENT,
  `Pago` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_Pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_pago`
--

LOCK TABLES `tipo_de_pago` WRITE;
/*!40000 ALTER TABLE `tipo_de_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `ap_Paterno` varchar(50) NOT NULL,
  `ap_Materno` varchar(50) NOT NULL,
  `Contrasena` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Avatar` blob,
  `Telefono` varchar(15) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `EsAdmin` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-25 15:22:01
