-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_cafeteria
-- ------------------------------------------------------
-- Server version	11.2.0-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `consumo y gasto`
--

DROP TABLE IF EXISTS `consumo y gasto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumo y gasto` (
  `ID_Consumo` int(11) NOT NULL AUTO_INCREMENT,
  `ID_User` int(11) NOT NULL,
  `ID_Transaccion` int(11) NOT NULL,
  `Tipo_Transaccion` tinyint(1) NOT NULL,
  `Monto` decimal(10,0) NOT NULL,
  `Saldo_Restante` decimal(10,0) NOT NULL,
  `Fecha_Consumo` timestamp NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  PRIMARY KEY (`ID_Consumo`),
  KEY `consumo_y_gasto_FK` (`ID_User`),
  KEY `consumo_y_gasto_FK_1` (`ID_Transaccion`),
  KEY `consumo_y_gasto_FK_2` (`ID_Producto`),
  CONSTRAINT `consumo_y_gasto_FK` FOREIGN KEY (`ID_User`) REFERENCES `usuarios` (`ID_User`),
  CONSTRAINT `consumo_y_gasto_FK_1` FOREIGN KEY (`ID_Transaccion`) REFERENCES `transacciones` (`ID_Transaccion`),
  CONSTRAINT `consumo_y_gasto_FK_2` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Aqui se almacena la informacion del consumo y gasto de los estudiantes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumo y gasto`
--

LOCK TABLES `consumo y gasto` WRITE;
/*!40000 ALTER TABLE `consumo y gasto` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumo y gasto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas` (
  `ID_Cuenta` int(11) NOT NULL AUTO_INCREMENT,
  `ID_User` int(11) NOT NULL,
  `Saldo` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID_Cuenta`),
  KEY `cuentas_FK` (`ID_User`),
  CONSTRAINT `cuentas_FK` FOREIGN KEY (`ID_User`) REFERENCES `usuarios` (`ID_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Aqui se registraran las cuenta de los estudiantes lo cual permetira cargar dinero o realizar compras.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventarios`
--

DROP TABLE IF EXISTS `inventarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventarios` (
  `ID_Inventario` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Producto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`ID_Inventario`),
  KEY `inventarios_FK` (`ID_Producto`),
  CONSTRAINT `inventarios_FK` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Registro de la cantidad de los productos en inventarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventarios`
--

LOCK TABLES `inventarios` WRITE;
/*!40000 ALTER TABLE `inventarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasarela de pagos`
--

DROP TABLE IF EXISTS `pasarela de pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasarela de pagos` (
  `ID_Pasarela` int(11) NOT NULL AUTO_INCREMENT,
  `ID_User` int(11) NOT NULL,
  `ID_Transaccion` int(11) NOT NULL,
  `Monto` decimal(10,0) NOT NULL,
  `Fecha_Pago` timestamp NOT NULL,
  PRIMARY KEY (`ID_Pasarela`),
  KEY `pasarela_de_pagos_FK` (`ID_User`),
  KEY `pasarela_de_pagos_FK_1` (`ID_Transaccion`),
  CONSTRAINT `pasarela_de_pagos_FK` FOREIGN KEY (`ID_User`) REFERENCES `usuarios` (`ID_User`),
  CONSTRAINT `pasarela_de_pagos_FK_1` FOREIGN KEY (`ID_Transaccion`) REFERENCES `transacciones` (`ID_Transaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Almacena la informacion relacionada con los pagos realizados a travez de este.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasarela de pagos`
--

LOCK TABLES `pasarela de pagos` WRITE;
/*!40000 ALTER TABLE `pasarela de pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasarela de pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `ID_Producto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Producto` varchar(100) NOT NULL,
  `Precio_Producto` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Informacion de los productos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciones` (
  `ID_Transaccion` int(11) NOT NULL AUTO_INCREMENT,
  `ID_User` int(11) NOT NULL,
  `Tipo_Transaccion` tinyint(1) NOT NULL,
  `Monto` decimal(10,0) NOT NULL,
  `Fecha_Transaccion` timestamp NOT NULL,
  PRIMARY KEY (`ID_Transaccion`),
  KEY `transacciones_FK` (`ID_User`),
  CONSTRAINT `transacciones_FK` FOREIGN KEY (`ID_User`) REFERENCES `usuarios` (`ID_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Registro de transacciones ya sean recargas o compras.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID_User` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Tipo de usuario` tinyint(1) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Contraseña` varchar(100) NOT NULL,
  `Telefono` varchar(100) NOT NULL,
  `Curso` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Registro de los usuarios del sistema, estudiantes y/o padres.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_cafeteria'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-30 17:16:43
