-- MySQL dump 10.13  Distrib 5.5.16, for Win64 (x86)
--
-- Host: localhost    Database: university
-- ------------------------------------------------------
-- Server version	5.5.16

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
-- Current Database: `university`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `university` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `university`;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `Course_ID` int(11) NOT NULL,
  `Course_Name` varchar(50) DEFAULT NULL,
  `Credits` varchar(50) DEFAULT NULL,
  `Course_Description` varchar(200) DEFAULT NULL,
  `Instructor_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Course_ID`),
  KEY `Instructor_ID` (`Instructor_ID`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`Instructor_ID`) REFERENCES `instructors` (`Instructor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (200,'English','5 ECTS','Introduction to basic grammar,essay writing and reading.',303),(201,'Maths','3 ECTS','Basic Algebra and Functions.',300),(202,'General Science','2 ECTS','Fundamentals in Physics, Chemistry and Biology.',301),(203,'History','3 ECTS','Overview of major world events in the past.',304),(204,'Business','4 ECTS','Deep dive into marketing and management.',302);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment` (
  `Student_ID` int(11) NOT NULL DEFAULT '0',
  `Course_ID` int(11) NOT NULL DEFAULT '0',
  `Semester` varchar(50) DEFAULT NULL,
  `Campus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`,`Course_ID`),
  KEY `Course_ID` (`Course_ID`),
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `courses` (`Course_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (100,201,'Fall 2026','North Campus'),(101,203,'Summer 2026','Main Campus'),(102,202,'Summer 2026','Online'),(103,201,'Fall 2026','Main Campus'),(104,200,'Winter 2026','Online');
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructors` (
  `Instructor_ID` int(11) NOT NULL,
  `Title` varchar(10) DEFAULT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Office_Hours` varchar(50) DEFAULT NULL,
  `Phone_Number` varchar(50) DEFAULT NULL,
  `Instructor_Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Instructor_ID`),
  UNIQUE KEY `Instructor_Email` (`Instructor_Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructors`
--

LOCK TABLES `instructors` WRITE;
/*!40000 ALTER TABLE `instructors` DISABLE KEYS */;
INSERT INTO `instructors` VALUES (300,'Dr.','Ben','Watt','Monday 10:00-12:00','4973484389','Ben.Watt@uniedu.com'),(301,'Prof.','Rika','Wong','Tuesday 15:00-18:00','4957002784','Rika.Wong@uniedu.com'),(302,'Dr.','Alice','Jackson','Wednesday 12:00-14:00','4929728651','Alice.Jackson@uniedu.com'),(303,'Prof.','Grace','Summer','Monday 14:00-16:00','4925725824','Grace.Summer@uniedu.com'),(304,'Prof.','Ada','Dong','Thursday 16:00-18:00','4937465366','Ada.Dong@uniedu.com');
/*!40000 ALTER TABLE `instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `Student_ID` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `Student_Email` varchar(50) NOT NULL,
  `Phone_Number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`),
  UNIQUE KEY `Student_Email` (`Student_Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (100,'Jane','Doe','2004-04-27','Jane.Doe@uni.com','4934875062'),(101,'Ava','Johnson','2006-05-14','Ava.Johnson@uni.com','4923985690'),(102,'Charles','Owen','2005-08-01','Charles.Owen@uni.com','2704792654'),(103,'Alan','Smith','2008-02-29','Alan.Smith@uni.com','3319849568'),(104,'Alex','Klein','2007-01-26','Alex.Klein@uni.com','4925634195');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-19 15:15:07
