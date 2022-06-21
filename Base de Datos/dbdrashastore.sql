CREATE DATABASE  IF NOT EXISTS `dbdrashastore` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbdrashastore`;
-- MySQL dump 10.13  Distrib 5.7.33, for Win64 (x86_64)
--
-- Host: localhost    Database: dbdrashastore
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Table structure for table `tbcargo`
--

DROP TABLE IF EXISTS `tbcargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbcargo` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id_cargo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcargo`
--

LOCK TABLES `tbcargo` WRITE;
/*!40000 ALTER TABLE `tbcargo` DISABLE KEYS */;
INSERT INTO `tbcargo` VALUES (1,'Administrador');
/*!40000 ALTER TABLE `tbcargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcategoria`
--

DROP TABLE IF EXISTS `tbcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbcategoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `AK_tbCategoria_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcategoria`
--

LOCK TABLES `tbcategoria` WRITE;
/*!40000 ALTER TABLE `tbcategoria` DISABLE KEYS */;
INSERT INTO `tbcategoria` VALUES (1,'Entretenimiento');
/*!40000 ALTER TABLE `tbcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcliente`
--

DROP TABLE IF EXISTS `tbcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbcliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `dni` char(8) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcliente`
--

LOCK TABLES `tbcliente` WRITE;
/*!40000 ALTER TABLE `tbcliente` DISABLE KEYS */;
INSERT INTO `tbcliente` VALUES (1,'55555555','Daniel');
/*!40000 ALTER TABLE `tbcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcuentacliente`
--

DROP TABLE IF EXISTS `tbcuentacliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbcuentacliente` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `clave` varchar(256) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `AK_tbUsuario_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcuentacliente`
--

LOCK TABLES `tbcuentacliente` WRITE;
/*!40000 ALTER TABLE `tbcuentacliente` DISABLE KEYS */;
INSERT INTO `tbcuentacliente` VALUES (1,'daniel1@gmail.com','12345',NULL,NULL,_binary '');
/*!40000 ALTER TABLE `tbcuentacliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbdetallepedido`
--

DROP TABLE IF EXISTS `tbdetallepedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbdetallepedido` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `precio` double NOT NULL,
  `subtotal` double NOT NULL DEFAULT '0',
  `nombre` varchar(45) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `descuento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `FK_tbDetallePedido_tbPedido` (`id_pedido`),
  KEY `FK_tbDetallePedido_tbProducto` (`id_producto`),
  CONSTRAINT `FK_tbDetallePedido_tbPedido` FOREIGN KEY (`id_pedido`) REFERENCES `tbpedido` (`id_pedido`),
  CONSTRAINT `FK_tbDetallePedido_tbProducto` FOREIGN KEY (`id_producto`) REFERENCES `tbproducto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbdetallepedido`
--

LOCK TABLES `tbdetallepedido` WRITE;
/*!40000 ALTER TABLE `tbdetallepedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbdetallepedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbdetalleventa`
--

DROP TABLE IF EXISTS `tbdetalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbdetalleventa` (
  `id_detalleventa` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `nombre_producto` varchar(45) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  PRIMARY KEY (`id_detalleventa`),
  KEY `FK__tbventa` (`id_venta`),
  KEY `FK_tbdetalleventa_tbproducto` (`id_producto`),
  CONSTRAINT `FK__tbventa` FOREIGN KEY (`id_venta`) REFERENCES `tbventa` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tbdetalleventa_tbproducto` FOREIGN KEY (`id_producto`) REFERENCES `tbproducto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbdetalleventa`
--

LOCK TABLES `tbdetalleventa` WRITE;
/*!40000 ALTER TABLE `tbdetalleventa` DISABLE KEYS */;
INSERT INTO `tbdetalleventa` VALUES (2,2,1550.00,3100.00,'televisor',12,7),(3,13,1550.00,20150.00,'televisor',13,7);
/*!40000 ALTER TABLE `tbdetalleventa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbdetalleventa_after_insert` AFTER INSERT ON `tbdetalleventa` FOR EACH ROW BEGIN
	UPDATE tbproducto P
	SET P.cantidad = P.cantidad - NEW.cantidad
	WHERE P.id_producto = NEW.id_producto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbempleado`
--

DROP TABLE IF EXISTS `tbempleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbempleado` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `dni` char(8) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` char(9) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `estado` bit(1) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `FK_tbempleado_tbcargo` (`id_cargo`),
  CONSTRAINT `FK_tbempleado_tbcargo` FOREIGN KEY (`id_cargo`) REFERENCES `tbcargo` (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbempleado`
--

LOCK TABLES `tbempleado` WRITE;
/*!40000 ALTER TABLE `tbempleado` DISABLE KEYS */;
INSERT INTO `tbempleado` VALUES (1,'44444444','Rene','Lopez','Femenino','2000-02-25','Calle Arica','111111111','2020-02-11','admin','admin',_binary '',1);
/*!40000 ALTER TABLE `tbempleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbmarca`
--

DROP TABLE IF EXISTS `tbmarca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbmarca` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_marca`),
  UNIQUE KEY `AK_tbMarca_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbmarca`
--

LOCK TABLES `tbmarca` WRITE;
/*!40000 ALTER TABLE `tbmarca` DISABLE KEYS */;
INSERT INTO `tbmarca` VALUES (1,'Samsung');
/*!40000 ALTER TABLE `tbmarca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbpedido`
--

DROP TABLE IF EXISTS `tbpedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbpedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) NOT NULL DEFAULT 'PENDIENTE DE PAGO',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_entrega` date DEFAULT NULL,
  `id_sistemapago` int(11) DEFAULT NULL,
  `id_cuentacliente` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `nro_celular` char(9) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_pedido`),
  KEY `FK_tbpedido_tbsistemapago` (`id_sistemapago`),
  KEY `FK_tbpedido_tbcuentacliente` (`id_cuentacliente`),
  CONSTRAINT `FK_tbpedido_tbcuentacliente` FOREIGN KEY (`id_cuentacliente`) REFERENCES `tbcuentacliente` (`id_usuario`),
  CONSTRAINT `FK_tbpedido_tbsistemapago` FOREIGN KEY (`id_sistemapago`) REFERENCES `tbsistemapago` (`id_sistemapago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbpedido`
--

LOCK TABLES `tbpedido` WRITE;
/*!40000 ALTER TABLE `tbpedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbpedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbproducto`
--

DROP TABLE IF EXISTS `tbproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbproducto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `descripcion` mediumtext,
  `precio_unitario` decimal(19,4) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` int(11) NOT NULL DEFAULT '0',
  `video` varchar(100) DEFAULT NULL,
  `id_marca` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `codigo` char(5) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `FK_tbProducto_tbCategoria` (`id_categoria`),
  KEY `FK_tbProducto_tbMarca` (`id_marca`),
  CONSTRAINT `FK_tbProducto_tbCategoria` FOREIGN KEY (`id_categoria`) REFERENCES `tbcategoria` (`id_categoria`),
  CONSTRAINT `FK_tbProducto_tbMarca` FOREIGN KEY (`id_marca`) REFERENCES `tbmarca` (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbproducto`
--

LOCK TABLES `tbproducto` WRITE;
/*!40000 ALTER TABLE `tbproducto` DISABLE KEYS */;
INSERT INTO `tbproducto` VALUES (6,'celular','a',NULL,700.0000,25,0,NULL,1,1,'P0001',_binary ''),(7,'televisor','b',NULL,1550.0000,0,0,NULL,1,1,'P0002',_binary '');
/*!40000 ALTER TABLE `tbproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbproveedor`
--

DROP TABLE IF EXISTS `tbproveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbproveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` char(9) NOT NULL DEFAULT '',
  `razon_social` varchar(30) NOT NULL DEFAULT '',
  `dni` char(8) NOT NULL DEFAULT '',
  `direccion` varchar(30) DEFAULT '',
  `telefono` char(9) NOT NULL DEFAULT '',
  `email` varchar(30) DEFAULT NULL,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `ruc` (`ruc`),
  UNIQUE KEY `razon_social` (`razon_social`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbproveedor`
--

LOCK TABLES `tbproveedor` WRITE;
/*!40000 ALTER TABLE `tbproveedor` DISABLE KEYS */;
INSERT INTO `tbproveedor` VALUES (1,'666666666','A','12345678',NULL,'333333333',NULL,_binary '');
/*!40000 ALTER TABLE `tbproveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbsistemapago`
--

DROP TABLE IF EXISTS `tbsistemapago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbsistemapago` (
  `id_sistemapago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_sistemapago`),
  UNIQUE KEY `AK_tbSistemaPago_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbsistemapago`
--

LOCK TABLES `tbsistemapago` WRITE;
/*!40000 ALTER TABLE `tbsistemapago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbsistemapago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbventa`
--

DROP TABLE IF EXISTS `tbventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbventa` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `total` decimal(10,2) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` bit(1) NOT NULL DEFAULT b'1',
  `id_empleado` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `FK_tbventa_tbempleado` (`id_empleado`),
  KEY `FK_tbventa_tbcliente` (`id_cliente`),
  CONSTRAINT `FK_tbventa_tbcliente` FOREIGN KEY (`id_cliente`) REFERENCES `tbcliente` (`id_cliente`),
  CONSTRAINT `FK_tbventa_tbempleado` FOREIGN KEY (`id_empleado`) REFERENCES `tbempleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbventa`
--

LOCK TABLES `tbventa` WRITE;
/*!40000 ALTER TABLE `tbventa` DISABLE KEYS */;
INSERT INTO `tbventa` VALUES (12,3100.00,'2022-06-21 11:35:08',_binary '',1,1),(13,20150.00,'2022-06-21 11:35:35',_binary '',1,1);
/*!40000 ALTER TABLE `tbventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dbdrashastore'
--
/*!50003 DROP PROCEDURE IF EXISTS `USP_B_BuscarCargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_B_BuscarCargo`(

	IN `Id` INT

)
BEGIN

	SELECT * FROM tbcargo C

	WHERE C.id_cargo = Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_B_BuscarCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_B_BuscarCategoria`(

	IN `Id` INT

)
BEGIN

	SELECT * FROM tbcategoria C

	WHERE C.id_categoria = Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_B_BuscarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_B_BuscarCliente`(

	IN `Id` INT

)
BEGIN

	SELECT * FROM tbcliente C

	WHERE C.id_cliente = Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_B_BuscarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_B_BuscarEmpleado`(

	IN `Id` INT

)
BEGIN

	SELECT * FROM tbempleado E

	WHERE E.id_empleado = Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_B_BuscarMarca` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_B_BuscarMarca`(

	IN `Id` INT

)
BEGIN

	SELECT * FROM tbmarca M

	WHERE M.id_marca = Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_B_BuscarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_B_BuscarProducto`(

	IN `Id` INT

)
BEGIN

	SELECT * FROM tbproducto P

	WHERE P.id_producto = Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_B_BuscarProductoPorCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_B_BuscarProductoPorCodigo`(
	IN `Codigo` VARCHAR(40)
)
BEGIN

	SELECT * FROM tbproducto P

	WHERE P.codigo = Codigo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_B_BuscarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_B_BuscarProveedor`(

	IN `Id` INT

)
BEGIN

	SELECT * FROM tbproveedor P

	WHERE P.id_proveedor = Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_B_BuscarUltimaVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_B_BuscarUltimaVenta`()
BEGIN
	SELECT V.id_venta FROM tbventa V 
	ORDER BY V.id_venta DESC LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_I_AgregarDetalleVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_I_AgregarDetalleVenta`(
	IN `Pcantidad` INT,
	IN `Pprecio_unitario` DECIMAL(10,2),
	IN `Psubtotal` DECIMAL(10,2),
	IN `Pnombre_producto` VARCHAR(40),
	IN `Pid_venta` INT,
	IN `Pid_producto` INT
)
BEGIN
	INSERT INTO tbdetalleventa (cantidad,precio_unitario,subtotal,nombre_producto,id_venta,id_producto) 
	VALUES (Pcantidad,Pprecio_unitario,Psubtotal,Pnombre_producto,Pid_venta,Pid_producto);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_I_AgregarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_I_AgregarEmpleado`(

	IN `Pnombre` VARCHAR(20),

	IN `Papellidos` VARCHAR(20),

	IN `Pfecha_nacimiento` DATE,

	IN `Psexo` VARCHAR(10),

	IN `Pdireccion` VARCHAR(30),

	IN `Ptelefono` CHAR(9),

	IN `Pdni` CHAR(8),

	IN `Pfecha_ingreso` DATE,

	IN `Pestado` BIT,

	IN `Pusuario` VARCHAR(20),

	IN `Pclave` VARCHAR(20),

	IN `Pid_cargo` INT

)
BEGIN

	INSERT INTO tbempleado (nombre,apellidos,fecha_nacimiento,sexo,direccion,telefono,dni,fecha_ingreso,estado,usuario,clave,id_cargo) 

	VALUES (Pnombre,Papellidos,Pfecha_nacimiento,Psexo,Pdireccion,Ptelefono,Pdni,Pfecha_ingreso,Pestado,Pusuario,Pclave,Pid_cargo);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_I_AgregarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_I_AgregarProveedor`(

	IN `Pnombre` VARCHAR(30),

	IN `Prazon_social` VARCHAR(30),

	IN `Pdni` CHAR(8),

	IN `Pdireccion` VARCHAR(30),

	IN `Ptelefono` CHAR(9),

	IN `Pemail` VARCHAR(30),

	IN `Pestado` BIT

)
BEGIN

	INSERT INTO tbproveedor (nombre,razon_social,dni,direccion,telefono,email,estado) 

	VALUES (Pnombre,Prazon_social,Pdni,Pdireccion,Ptelefono,Pemail,Pestado);	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_I_AgregarVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_I_AgregarVenta`(
	IN `Ptotal` DECIMAL(10,2),
	IN `Pid_empleado` INT,
	IN `Pid_cliente` INT
)
BEGIN

	INSERT INTO tbventa (total,id_empleado,id_cliente)

 	VALUES (Ptotal,Pid_empleado,Pid_cliente);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_S_ListarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_S_ListarCliente`()
BEGIN

	SELECT * FROM tbcliente C

	ORDER BY C.id_cliente;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_S_ListarEmpleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_S_ListarEmpleados`()
BEGIN

	SELECT * FROM tbempleado E

	ORDER BY E.id_empleado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_S_ListarProductos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_S_ListarProductos`()
BEGIN

	SELECT * FROM tbproducto P

	ORDER BY P.id_producto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_S_ListarProveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_S_ListarProveedores`()
BEGIN

	SELECT * FROM tbproveedor P

	ORDER BY P.id_proveedor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_S_Loguear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_S_Loguear`(

	IN `Usuario` VARCHAR(20)

)
BEGIN

	SELECT E.*, C.nombre

	FROM tbempleado E

	JOIN tbcargo C ON E.id_cargo = C.id_cargo

	WHERE E.usuario = Usuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_U_ActualizarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_U_ActualizarEmpleado`(
	IN `Pid_empleado` INT,
	IN `Pdni` CHAR(8),
	IN `Pnombre` VARCHAR(20),
	IN `Papellidos` VARCHAR(20),
	IN `Psexo` VARCHAR(10),
	IN `Pfecha_nacimiento` DATE,
	IN `Pfecha_ingreso` DATE,
	IN `Pdireccion` VARCHAR(30),
	IN `Ptelefono` CHAR(9),
	IN `Pid_cargo` INT,
	IN `Pusuario` VARCHAR(20),
	IN `Pclave` VARCHAR(20),
	IN `Pestado` BIT
)
BEGIN

	UPDATE tbempleado

	SET

	dni = Pdni,

	nombre = Pnombre,

	apellidos = Papellidos,

	sexo = Psexo,

	fecha_nacimiento = Pfecha_nacimiento,

	fecha_ingreso = Pfecha_ingreso,

	direccion = Pdireccion,

	telefono = Ptelefono,

	id_cargo = Pid_cargo,

	usuario = Pusuario,

	clave = Pclave,

	estado = Pestado

	WHERE (id_empleado = Pid_empleado);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `USP_U_ActualizarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `USP_U_ActualizarProveedor`(

	IN `Pid_proveedor` INT,

	IN `Pruc` CHAR(9),

	IN `Prazon_social` VARCHAR(30),

	IN `Pdni` CHAR(8),

	IN `Pdireccion` VARCHAR(30),

	IN `Ptelefono` CHAR(9),

	IN `Pemail` VARCHAR(30),

	IN `Pestado` BIT

)
BEGIN

	UPDATE tbproveedor

	SET

	ruc = Pruc,

	razon_social = Prazon_social,

	dni = Pdni,

	direccion = Pdireccion,

	telefono = Ptelefono,

	email = Pemail,

	estado = Pestado

	WHERE (id_proveedor = Pid_proveedor);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-21 11:42:51
