-- MySQL dump 10.10
--
-- Host: localhost    Database: snwd
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt

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
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hint` varchar(255) default NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(255) default NULL,
  `website` varchar(255) default NULL,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `credentials_expired` bit(1) NOT NULL,
  `city` varchar(50) NOT NULL,
  `province` varchar(100) default NULL,
  `postal_code` varchar(15) NOT NULL,
  `address` varchar(150) default NULL,
  `country` varchar(100) default NULL,
  `account_enabled` bit(1) default NULL,
  `version` int(11) default NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_user`
--


/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
LOCK TABLES `app_user` WRITE;
INSERT INTO `app_user` VALUES (-2,'admin','matt@raibledesigns.com','Not a female kitty.','Matt','Raible','','http://raibledesigns.com','\0','\0','\0','Denver','CO','80210','','US','',1,'d033e22ae348aeb5660fc2140aec35850c4da997'),(-1,'user','matt_raible@yahoo.com','A male kitty.','Tomcat','User','','http://tomcat.apache.org','\0','\0','\0','Denver','CO','80210','','US','',1,'12dea96fec20593566ab75692c9949596833adc9');
UNLOCK TABLES;
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `channelCode` bigint(20) NOT NULL auto_increment,
  `channelName` varchar(50) default NULL,
  `superCode` varchar(50) default NULL,
  `lookNum` varchar(50) default NULL,
  `invitationNum` varchar(50) default NULL,
  `isDelete` varchar(20) default NULL,
  `level` varchar(20) default NULL,
  PRIMARY KEY  (`channelCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `channel`
--


/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
LOCK TABLES `channel` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;

--
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
CREATE TABLE `invitation` (
  `invitationCode` int(11) NOT NULL auto_increment,
  `invitationTitle` varchar(50) default NULL,
  `invitationContent` varchar(3000) default NULL,
  `viewTimes` varchar(20) default '0',
  `respondTimes` varchar(20) default '0',
  `sendName` varchar(50) default NULL,
  `modifier` varchar(50) default NULL,
  `modifyTime` varchar(50) default NULL,
  `isTop` varchar(50) default NULL,
  `isEssence` varchar(50) default NULL,
  `channelCode` varchar(20) default NULL,
  `sendEr` varchar(20) default NULL,
  `zdTime` varchar(20) default NULL,
  PRIMARY KEY  (`invitationCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invitation`
--


/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
LOCK TABLES `invitation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;

--
-- Table structure for table `replydetail`
--

DROP TABLE IF EXISTS `replydetail`;
CREATE TABLE `replydetail` (
  `replyCode` bigint(20) NOT NULL auto_increment,
  `invitationCode` varchar(50) default NULL,
  `replyer` varchar(50) default NULL,
  `replyTime` varchar(50) default NULL,
  `replyContent` varchar(3000) default NULL,
  PRIMARY KEY  (`replyCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `replydetail`
--


/*!40000 ALTER TABLE `replydetail` DISABLE KEYS */;
LOCK TABLES `replydetail` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `replydetail` ENABLE KEYS */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `description` varchar(64) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--


/*!40000 ALTER TABLE `role` DISABLE KEYS */;
LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES (-2,'ROLE_USER','Default role for all Users'),(-1,'ROLE_ADMIN','Administrator role (can edit Users)');
UNLOCK TABLES;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`user_id`,`role_id`),
  KEY `FK143BF46A4B1992E2` (`user_id`),
  KEY `FK143BF46AA5EECF02` (`role_id`),
  CONSTRAINT `FK143BF46A4B1992E2` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  CONSTRAINT `FK143BF46AA5EECF02` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--


/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
LOCK TABLES `user_role` WRITE;
INSERT INTO `user_role` VALUES (-2,-1),(-1,-2);
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

