CREATE DATABASE  IF NOT EXISTS `kwitterdb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kwitterdb`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: kwitterdb
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `kweet_username` varchar(20) NOT NULL,
  `kweet_post_time` datetime NOT NULL,
  `favorite_username` varchar(20) NOT NULL,
  PRIMARY KEY (`kweet_username`,`kweet_post_time`,`favorite_username`),
  KEY `fk_kweet_has_User_User1_idx` (`favorite_username`),
  KEY `fk_kweet_has_User_kweet1_idx` (`kweet_username`,`kweet_post_time`),
  CONSTRAINT `fk_kweet_has_User_kweet1` FOREIGN KEY (`kweet_username`, `kweet_post_time`) REFERENCES `kweet` (`username`, `post_time`),
  CONSTRAINT `fk_kweet_has_User_User1` FOREIGN KEY (`favorite_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES ('frank','2022-07-11 10:00:00','frank'),('frank','2022-07-11 10:00:00','humphrey_dumpty'),('cat_god','2022-07-23 02:30:03','me_wang'),('frank','2022-07-11 10:00:00','me_wang'),('frank','2022-07-11 10:00:00','mw'),('tut_the_gut','2022-07-14 04:00:34','mw'),('frank','2022-07-11 10:00:00','tut_the_gut');
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `following` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  PRIMARY KEY (`following`,`follower`),
  KEY `fk_table1_User1_idx` (`follower`),
  CONSTRAINT `fk_table1_User` FOREIGN KEY (`following`) REFERENCES `user` (`username`),
  CONSTRAINT `fk_table1_User1` FOREIGN KEY (`follower`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES ('cat_god','humphrey_dumpty'),('frank','me_wang'),('frank','mw'),('tut_the_gut','mw'),('cat_god','tut_the_gut');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kweet`
--

DROP TABLE IF EXISTS `kweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kweet` (
  `username` varchar(20) NOT NULL,
  `post_time` datetime NOT NULL,
  `message` varchar(280) NOT NULL,
  PRIMARY KEY (`username`,`post_time`),
  KEY `fk_kweet_User1_idx` (`username`),
  CONSTRAINT `fk_kweet_User1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kweet`
--

LOCK TABLES `kweet` WRITE;
/*!40000 ALTER TABLE `kweet` DISABLE KEYS */;
INSERT INTO `kweet` VALUES ('cat_god','2022-07-10 08:45:00','Cat church need more donations to purchase a betafish tank for entertainment, Amen'),('cat_god','2022-07-23 02:30:03','Has anyone seen brother Humphrey?'),('frank','2022-07-11 10:00:00','Graham, WHERE ARE YOU???!!!'),('humphrey_dumpty','2022-07-22 18:02:34','My brother is an annoying narcissist'),('me_wang','2022-07-23 12:48:00','We all know who did it #lockhimup'),('mw','2022-07-23 11:34:34','#freetut'),('tut_the_gut','2022-07-12 05:12:20','What is your philisophical argument on the simplecomplexities of philogeny?'),('tut_the_gut','2022-07-14 04:00:34','Gosh I am pretty!'),('tut_the_gut','2022-07-22 18:20:34','How can I get rid of a dead cat?'),('tut_the_gut','2022-07-23 05:45:59','On my way to prison #noregrets');
/*!40000 ALTER TABLE `kweet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rekweet`
--

DROP TABLE IF EXISTS `rekweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rekweet` (
  `rekweet_username` varchar(20) NOT NULL,
  `kweet_username` varchar(20) NOT NULL,
  `kweet_post_time` datetime NOT NULL,
  `rekweet_time` datetime NOT NULL,
  PRIMARY KEY (`rekweet_username`,`kweet_username`,`kweet_post_time`,`rekweet_time`),
  KEY `fk_User_has_kweet_kweet1_idx` (`kweet_username`,`kweet_post_time`),
  KEY `fk_User_has_kweet_User1_idx` (`rekweet_username`),
  CONSTRAINT `fk_User_has_kweet_kweet1` FOREIGN KEY (`kweet_username`, `kweet_post_time`) REFERENCES `kweet` (`username`, `post_time`),
  CONSTRAINT `fk_User_has_kweet_User1` FOREIGN KEY (`rekweet_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rekweet`
--

LOCK TABLES `rekweet` WRITE;
/*!40000 ALTER TABLE `rekweet` DISABLE KEYS */;
INSERT INTO `rekweet` VALUES ('frank','frank','2022-07-11 10:00:00','2022-07-11 11:00:00'),('frank','frank','2022-07-11 10:00:00','2022-07-11 12:00:00'),('frank','frank','2022-07-11 10:00:00','2022-07-11 13:00:00'),('frank','frank','2022-07-11 10:00:00','2022-07-11 14:00:00'),('frank','frank','2022-07-11 10:00:00','2022-07-11 15:00:00'),('frank','frank','2022-07-11 10:00:00','2022-07-11 16:00:00'),('humphrey_dumpty','cat_god','2022-07-10 08:45:00','2022-07-10 08:45:10'),('mw','tut_the_gut','2022-07-22 18:20:34','2022-07-22 20:10:03'),('tut_the_gut','cat_god','2022-07-10 08:45:00','2022-07-10 08:45:05');
/*!40000 ALTER TABLE `rekweet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(45) NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('cat_god','catRulesTheWorld','glowing cat picture'),('frank','123456','frank hates null'),('humphrey_dumpty','drowssap','filled with data'),('me_wang','vesper','\"NULL\"'),('mw','murphy','real picture'),('tut_the_gut','password','definitely no nul');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-24 14:55:10
