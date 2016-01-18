-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: inventorymanagerdb
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
CREATE DATABASE IF NOT EXISTS InventoryManagerDB;
USE InventoryManagerDB
--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (2,'Main Branch','San Salvador','25585456');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `BirthDate` datetime NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `Phone` varchar(25) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `ClientSince` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (2,'Guillermo Ernesto','Canales Mancia','1988-10-01 00:00:00','M','','El Trebol, Santa Ana','2015-12-03 00:00:00'),(3,'Kenny Guadalupe','Marroquin de Canales','1987-12-01 00:00:00','F','','El Trebol,Santa Ana','2015-12-03 00:00:00');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Branch_Id` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `BirthDate` date NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Position` varchar(45) NOT NULL,
  `BeginDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `UserName` varchar(25) NOT NULL,
  `Password` varchar(36) NOT NULL,
  `Status_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Employee_Branch_idx` (`Branch_Id`),
  KEY `Employee_Status_idx` (`Status_Id`),
  CONSTRAINT `Employee_Branch` FOREIGN KEY (`Branch_Id`) REFERENCES `branch` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Employee_Status` FOREIGN KEY (`Status_Id`) REFERENCES `employeestatus` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,2,'Arturo Ernesto','Salinas Rodriguez','1988-03-23','75118244','prico.team@gmail.com','CEO','2015-08-01',NULL,'Atiquizaya','pcperico','MTIzNDU2',1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeerole`
--

DROP TABLE IF EXISTS `employeerole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeerole` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeId` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL,
  `CreationDate` date DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ER_Employee_idx` (`EmployeeId`),
  KEY `ER_Role_idx` (`RoleId`),
  CONSTRAINT `ER_Employee` FOREIGN KEY (`EmployeeId`) REFERENCES `employee` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ER_Role` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeerole`
--

LOCK TABLES `employeerole` WRITE;
/*!40000 ALTER TABLE `employeerole` DISABLE KEYS */;
INSERT INTO `employeerole` VALUES (1,1,5,'2015-12-01','');
/*!40000 ALTER TABLE `employeerole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeestatus`
--

DROP TABLE IF EXISTS `employeestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeestatus` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeestatus`
--

LOCK TABLES `employeestatus` WRITE;
/*!40000 ALTER TABLE `employeestatus` DISABLE KEYS */;
INSERT INTO `employeestatus` VALUES (1,'Active'),(2,'On Hollydays'),(3,'Inactive'),(4,'Suspend'),(5,'Deleted');
/*!40000 ALTER TABLE `employeestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `initialinventory`
--

DROP TABLE IF EXISTS `initialinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `initialinventory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Product_Id` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `CreationDate` datetime NOT NULL,
  `Stock` double NOT NULL,
  `PriceCost` double NOT NULL,
  `Movement_Id` int(11) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `initialinventory`
--

LOCK TABLES `initialinventory` WRITE;
/*!40000 ALTER TABLE `initialinventory` DISABLE KEYS */;
INSERT INTO `initialinventory` VALUES (9,8,2016,'2016-01-18 00:00:00',13,173.99,0),(10,9,2016,'2016-01-18 00:00:00',12,275.65,0),(11,10,2016,'2016-01-18 00:00:00',0,0,0),(12,11,2016,'2016-01-18 00:00:00',15,30.32,0);
/*!40000 ALTER TABLE `initialinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurementunit`
--

DROP TABLE IF EXISTS `measurementunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurementunit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Abbreviation` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurementunit`
--

LOCK TABLES `measurementunit` WRITE;
/*!40000 ALTER TABLE `measurementunit` DISABLE KEYS */;
INSERT INTO `measurementunit` VALUES (7,'Libra','lb'),(8,'Unidad','U'),(9,'Litro','lt');
/*!40000 ALTER TABLE `measurementunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movement`
--

DROP TABLE IF EXISTS `movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movement` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `NumRef` varchar(100) NOT NULL,
  `Provider_Id` int(11) DEFAULT NULL,
  `Client_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movement`
--

LOCK TABLES `movement` WRITE;
/*!40000 ALTER TABLE `movement` DISABLE KEYS */;
INSERT INTO `movement` VALUES (5,'2015-01-01','4545',6,NULL),(6,'2015-01-05','45454',6,NULL),(7,'2015-01-06','1212',NULL,2),(8,'2016-01-01','4542121',6,NULL);
/*!40000 ALTER TABLE `movement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movementdetail`
--

DROP TABLE IF EXISTS `movementdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movementdetail` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Movement_Id` int(11) NOT NULL,
  `Product_Id` int(11) NOT NULL,
  `Quantity` double NOT NULL DEFAULT '0',
  `PriceCost` double NOT NULL DEFAULT '0',
  `PriceSale` double DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movementdetail`
--

LOCK TABLES `movementdetail` WRITE;
/*!40000 ALTER TABLE `movementdetail` DISABLE KEYS */;
INSERT INTO `movementdetail` VALUES (1,5,8,10,175.85,0),(2,5,9,12,275.65,0),(3,5,11,15,30.32,0),(4,6,8,5,170.26,0),(5,7,8,2,173.99,225.26),(6,8,8,5,170.25,0);
/*!40000 ALTER TABLE `movementdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricesalehistory`
--

DROP TABLE IF EXISTS `pricesalehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricesalehistory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Product_Id` int(11) NOT NULL,
  `PriceSale` double NOT NULL,
  `BeginDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `priceSale_Product_idx` (`Product_Id`),
  CONSTRAINT `priceSale_Product` FOREIGN KEY (`Product_Id`) REFERENCES `product` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricesalehistory`
--

LOCK TABLES `pricesalehistory` WRITE;
/*!40000 ALTER TABLE `pricesalehistory` DISABLE KEYS */;
INSERT INTO `pricesalehistory` VALUES (1,8,225.26,'2016-01-13 00:00:00',NULL),(2,9,325.67,'2016-01-13 00:00:00',NULL),(3,10,525.33,'2016-01-13 00:00:00',NULL),(4,11,40.35,'2016-01-13 00:00:00',NULL);
/*!40000 ALTER TABLE `pricesalehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `ProductCategory_Id` int(11) NOT NULL,
  `Provider_Id` int(11) NOT NULL,
  `MeasurementUnit_Id` int(11) NOT NULL,
  `Brand` varchar(150) DEFAULT NULL,
  `Model` varchar(200) DEFAULT NULL,
  `PriceCost` double DEFAULT '0',
  `Stock` double DEFAULT '0',
  `PriceSale` double DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `Product_Category_idx` (`ProductCategory_Id`),
  KEY `Product_Provider_idx` (`Provider_Id`),
  KEY `Product_Unit_idx` (`MeasurementUnit_Id`),
  CONSTRAINT `Product_Category` FOREIGN KEY (`ProductCategory_Id`) REFERENCES `productcategory` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Product_Provider` FOREIGN KEY (`Provider_Id`) REFERENCES `provider` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Product_Unit` FOREIGN KEY (`MeasurementUnit_Id`) REFERENCES `measurementunit` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (8,'Laptop Asus 10.1\'\'','Procesador intel celeron dual core 1.1 GHz, Ram 2 GB, Hd 320GB, Windows 8 de 64 Bits',5,6,8,'Asus','1015E',172.95,18,225.26),(9,'Laptop Lenovo  11.6\'\'','Procesador Intel Celeron N2840 2.16 GHz, RAm 4 GB, HD 500 GB, Windows 8.1',5,6,8,'Lenovo','3-1120 Touch',275.65,12,325.67),(10,'Equipo de escritorio Dell Optiplex','Procesador Intel Core 2 Duo 1.8 GHz, Ram 1GB, HD 80Gb, Win7',6,7,8,'Dell','Optiplex 745',0,0,525.33),(11,'Bolson para notebook','Boloson para notebook',7,6,8,'Xpert','XEL104R',30.32,15,40.35);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productcategory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategory`
--

LOCK TABLES `productcategory` WRITE;
/*!40000 ALTER TABLE `productcategory` DISABLE KEYS */;
INSERT INTO `productcategory` VALUES (5,'Laptops, Netbooks y Tablets','Equipos portatiles de alto rendimiento y uso de hogar y oficina'),(6,'Computadoras de Escritorio','Equipo informatico de escritorio'),(7,'Accesorios y repuestos','Accesorios para equipo informatico portatiles y de escritorio');
/*!40000 ALTER TABLE `productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `ContactName` varchar(200) NOT NULL,
  `Phone` varchar(25) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `Nit` varchar(17) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (6,'Digital Solutions','Roberto Garcia','22256532','Chalchuapa','EL SALVADOR','0103-230388-101-0'),(7,'Tecno Express','Mario Jose Cristales','24184145','Turin','El Salvador','0103-220887-101-0'),(8,'Tecno Avance','Juan Perez','22565857','San Salvador','El Salvador','0103-121005-102-1');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `Status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (5,'Administrator','Administrator of the system, full access',''),(6,'Seller','Access only sales module',''),(7,'Queality Assurance (Q.A)','Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocidod','');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-18 16:24:33
