-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: inventorymanagerdb
-- ------------------------------------------------------
-- Server version	5.6.25-log
CREATE DATABASE IF NOT EXISTS InventoryManagerDB;
USE InventoryManagerDB
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
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buy` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Provider_Id` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `NumRef` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `buy_Provider_idx` (`Provider_Id`),
  CONSTRAINT `buy_Provider` FOREIGN KEY (`Provider_Id`) REFERENCES `provider` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `buydetail`
--

DROP TABLE IF EXISTS `buydetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buydetail` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Buy_Id` int(11) NOT NULL,
  `Product_Id` int(11) NOT NULL,
  `Quantity` double NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `buy_buydetail_idx` (`Buy_Id`),
  KEY `buy_product_idx` (`Product_Id`),
  CONSTRAINT `buy_buydetail` FOREIGN KEY (`Buy_Id`) REFERENCES `buy` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `buy_product` FOREIGN KEY (`Product_Id`) REFERENCES `product` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `Email` varchar(100) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `Price` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `ProductCategory_Id` int(11) NOT NULL,
  `Provider_Id` int(11) NOT NULL,
  `MeasurementUnit_Id` int(11) NOT NULL,
  `Brand` varchar(150) DEFAULT NULL,
  `Model` varchar(200) DEFAULT NULL,
  `PriceCost` double DEFAULT '0',
  `Stock` double DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `Product_Category_idx` (`ProductCategory_Id`),
  KEY `Product_Provider_idx` (`Provider_Id`),
  KEY `Product_Unit_idx` (`MeasurementUnit_Id`),
  CONSTRAINT `Product_Category` FOREIGN KEY (`ProductCategory_Id`) REFERENCES `productcategory` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Product_Provider` FOREIGN KEY (`Provider_Id`) REFERENCES `provider` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Product_Unit` FOREIGN KEY (`MeasurementUnit_Id`) REFERENCES `measurementunit` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `Status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NumRef` varchar(100) NOT NULL,
  `Date` datetime NOT NULL,
  `Client_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `sale_client_idx` (`Client_Id`),
  CONSTRAINT `sale_client` FOREIGN KEY (`Client_Id`) REFERENCES `client` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saledetail`
--

DROP TABLE IF EXISTS `saledetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saledetail` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Sale_Id` int(11) NOT NULL,
  `Product_Id` int(11) NOT NULL,
  `Quantity` double NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `saledetail_product_idx` (`Product_Id`),
  KEY `saledetail_sale_idx` (`Sale_Id`),
  CONSTRAINT `saledetail_product` FOREIGN KEY (`Product_Id`) REFERENCES `product` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `saledetail_sale` FOREIGN KEY (`Sale_Id`) REFERENCES `sale` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-01 15:45:30
