-- MySQL dump 10.13  Distrib 5.7.12, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ionize200
-- ------------------------------------------------------
-- Server version	5.7.12-0ubuntu1.1

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
  `id_category` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `id_parent` int(11) unsigned DEFAULT NULL,
  `parent` varchar(20) DEFAULT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `color_primary` varchar(20) DEFAULT NULL,
  `color_secondary` varchar(20) DEFAULT NULL,
  `color_text` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_category`,`code`),
  KEY `id_parent` (`id_parent`,`parent`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`id_parent`, `parent`) REFERENCES `categories` (`id_category`, `code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_translations` (
  `id_translation` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_category` int(11) unsigned NOT NULL,
  `id_language` int(11) unsigned NOT NULL,
  `language` varchar(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `short_url` varchar(100) DEFAULT NULL,
  `long_url` varchar(300) DEFAULT NULL,
  `preview` varchar(300) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `keywords` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_translation`),
  KEY `id_category` (`id_category`),
  KEY `id_language` (`id_language`,`language`),
  CONSTRAINT `categories_translations_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `categories_translations_ibfk_2` FOREIGN KEY (`id_language`, `language`) REFERENCES `languages` (`id_language`, `code`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `content`
--

DROP TABLE IF EXISTS `content`;
/*!50001 DROP VIEW IF EXISTS `content`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `content` AS SELECT 
 1 AS `id_content`,
 1 AS `name`,
 1 AS `id_type`,
 1 AS `type`,
 1 AS `ordering`,
 1 AS `publish_on`,
 1 AS `publish_on_unix`,
 1 AS `publish_off`,
 1 AS `publish_off_unix`,
 1 AS `logical_date`,
 1 AS `logical_date_unix`,
 1 AS `extends_data`,
 1 AS `default_list_view`,
 1 AS `default_single_view`,
 1 AS `default_item_view`,
 1 AS `list_view`,
 1 AS `single_view`,
 1 AS `item_view`,
 1 AS `view`,
 1 AS `id_language`,
 1 AS `language`,
 1 AS `title`,
 1 AS `subtitle`,
 1 AS `preview`,
 1 AS `window`,
 1 AS `short_url`,
 1 AS `long_url`,
 1 AS `content`,
 1 AS `keywords`,
 1 AS `description`,
 1 AS `extends_data_lang`,
 1 AS `indexed`,
 1 AS `has_url`,
 1 AS `has_children`,
 1 AS `flag`,
 1 AS `priority`,
 1 AS `children`,
 1 AS `id_author`,
 1 AS `created`,
 1 AS `created_unix`,
 1 AS `author_login`,
 1 AS `author_name`,
 1 AS `author_forname`,
 1 AS `author_lastname`,
 1 AS `author_email`,
 1 AS `author_extends_data`,
 1 AS `id_updater`,
 1 AS `updated`,
 1 AS `updated_unix`,
 1 AS `updater_login`,
 1 AS `updater_name`,
 1 AS `updater_forname`,
 1 AS `updater_lastname`,
 1 AS `updater_email`,
 1 AS `updater_extends_data`,
 1 AS `default_language`,
 1 AS `homepage`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents` (
  `id_content` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `id_type` int(11) unsigned NOT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `id_author` int(11) unsigned NOT NULL,
  `author` varchar(100) DEFAULT NULL COMMENT 'email',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_updater` int(11) unsigned DEFAULT NULL,
  `updater` varchar(100) DEFAULT NULL COMMENT 'email',
  `updated` datetime DEFAULT NULL,
  `publish_on` datetime DEFAULT NULL,
  `publish_off` datetime DEFAULT NULL,
  `logical_date` datetime DEFAULT NULL,
  `indexed` tinyint(1) unsigned DEFAULT '0',
  `has_url` tinyint(1) DEFAULT NULL,
  `has_child` tinyint(1) unsigned DEFAULT '0',
  `flag` varchar(30) DEFAULT NULL,
  `priority` int(3) unsigned DEFAULT '5',
  `default_language` int(1) unsigned DEFAULT NULL,
  `site_root` tinyint(11) unsigned DEFAULT NULL,
  `extends_data` text COMMENT 'json',
  `list_view` varchar(100) DEFAULT NULL,
  `item_view` varchar(100) DEFAULT NULL,
  `single_view` varchar(100) DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id_content`),
  UNIQUE KEY `id_content` (`id_content`,`code`) USING BTREE,
  KEY `content_type` (`id_type`),
  KEY `content_author` (`id_author`,`author`),
  KEY `content_updater` (`id_updater`,`updater`),
  KEY `has_child` (`has_child`),
  KEY `publish_on` (`publish_on`),
  KEY `publish_off` (`publish_off`),
  KEY `deleted` (`deleted`),
  KEY `logical_date` (`logical_date`),
  KEY `site_root` (`site_root`),
  CONSTRAINT `content_author` FOREIGN KEY (`id_author`, `author`) REFERENCES `users` (`id_user`, `email`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `content_type` FOREIGN KEY (`id_type`) REFERENCES `contents_types` (`id_type`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `content_updater` FOREIGN KEY (`id_updater`, `updater`) REFERENCES `users` (`id_user`, `email`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,'homepage',1,0,1,'admin@ionizecms.com','2015-08-12 15:09:28',NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,NULL,5,1,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents_categories`
--

DROP TABLE IF EXISTS `contents_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents_categories` (
  `id_con` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_content` int(11) unsigned NOT NULL,
  `id_category` int(11) unsigned NOT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_creator` int(11) unsigned DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_con`),
  KEY `id_content` (`id_content`),
  KEY `id_category` (`id_category`),
  KEY `id_creator` (`id_creator`,`creator`),
  CONSTRAINT `contents_categories_ibfk_1` FOREIGN KEY (`id_content`) REFERENCES `contents` (`id_content`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contents_categories_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contents_categories_ibfk_3` FOREIGN KEY (`id_creator`, `creator`) REFERENCES `users` (`id_user`, `email`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents_categories`
--

LOCK TABLES `contents_categories` WRITE;
/*!40000 ALTER TABLE `contents_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `contents_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents_medias`
--

DROP TABLE IF EXISTS `contents_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents_medias` (
  `id_con` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_content` int(11) unsigned NOT NULL,
  `id_media` int(11) unsigned NOT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_creator` int(11) unsigned DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_con`),
  KEY `id_content` (`id_content`),
  KEY `id_media` (`id_media`),
  KEY `id_creator` (`id_creator`,`creator`),
  CONSTRAINT `contents_medias_ibfk_1` FOREIGN KEY (`id_content`) REFERENCES `contents` (`id_content`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contents_medias_ibfk_2` FOREIGN KEY (`id_media`) REFERENCES `medias` (`id_media`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contents_medias_ibfk_3` FOREIGN KEY (`id_creator`, `creator`) REFERENCES `users` (`id_user`, `email`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents_medias`
--

LOCK TABLES `contents_medias` WRITE;
/*!40000 ALTER TABLE `contents_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `contents_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents_relations`
--

DROP TABLE IF EXISTS `contents_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents_relations` (
  `id_con` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) unsigned NOT NULL,
  `id_child` int(11) unsigned NOT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `primary` tinyint(1) unsigned DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_creator` int(11) unsigned DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_con`),
  KEY `id_parent` (`id_parent`),
  KEY `id_child` (`id_child`),
  KEY `id_creator` (`id_creator`,`creator`),
  CONSTRAINT `contents_relations_ibfk_1` FOREIGN KEY (`id_parent`) REFERENCES `contents` (`id_content`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contents_relations_ibfk_2` FOREIGN KEY (`id_child`) REFERENCES `contents` (`id_content`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contents_relations_ibfk_3` FOREIGN KEY (`id_creator`, `creator`) REFERENCES `users` (`id_user`, `email`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents_relations`
--

LOCK TABLES `contents_relations` WRITE;
/*!40000 ALTER TABLE `contents_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contents_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents_translations`
--

DROP TABLE IF EXISTS `contents_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents_translations` (
  `id_translation` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_content` int(11) unsigned DEFAULT NULL,
  `id_language` int(11) unsigned DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `revision` int(11) DEFAULT '0',
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `window` varchar(100) DEFAULT NULL,
  `navigation` varchar(100) DEFAULT NULL,
  `short_url` varchar(30) DEFAULT NULL,
  `long_url` varchar(100) DEFAULT NULL,
  `preview` text,
  `content` text,
  `extends_data` text COMMENT 'json',
  `keywords` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `active` int(11) DEFAULT '0',
  PRIMARY KEY (`id_translation`),
  UNIQUE KEY `unique_translation` (`id_content`,`id_language`) USING BTREE,
  KEY `translations_language` (`id_language`,`language`),
  CONSTRAINT `contents_translation` FOREIGN KEY (`id_content`) REFERENCES `contents` (`id_content`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `translations_language` FOREIGN KEY (`id_language`, `language`) REFERENCES `languages` (`id_language`, `code`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents_translations`
--

LOCK TABLES `contents_translations` WRITE;
/*!40000 ALTER TABLE `contents_translations` DISABLE KEYS */;
INSERT INTO `contents_translations` VALUES (1,1,1,'en',0,'Welcome to Ionize 2.0','Welcome!',NULL,NULL,'/','/welcome',NULL,NULL,NULL,NULL,NULL,0),(2,1,2,'hu',0,'Üdvözli az Ionize 2.0','Üdvözöljük!',NULL,NULL,'/','/nyitolap',NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `contents_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents_types`
--

DROP TABLE IF EXISTS `contents_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contents_types` (
  `id_type` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `ordering` int(11) unsigned DEFAULT NULL,
  `default_list_view` varchar(100) DEFAULT NULL,
  `default_item_view` varchar(100) DEFAULT NULL,
  `default_single_view` varchar(100) DEFAULT NULL,
  `default` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id_type`,`code`),
  KEY `id_type` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents_types`
--

LOCK TABLES `contents_types` WRITE;
/*!40000 ALTER TABLE `contents_types` DISABLE KEYS */;
INSERT INTO `contents_types` VALUES (1,'page',0,'page','page_article','article',1),(2,'article',1,'page','page_article','article',0),(3,'media',2,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `contents_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `definitions`
--

DROP TABLE IF EXISTS `definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `definitions` (
  `id_definition` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `id_content` int(11) unsigned DEFAULT NULL,
  `id_media` int(11) unsigned DEFAULT NULL,
  `id_type` int(11) unsigned DEFAULT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `categories` varchar(200) DEFAULT NULL,
  `title` varchar(600) DEFAULT NULL COMMENT 'json',
  `description` varchar(600) DEFAULT NULL COMMENT 'json',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_creator` int(11) unsigned DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_definition`,`code`),
  KEY `id_definition` (`id_definition`),
  KEY `id_content` (`id_content`),
  KEY `id_media` (`id_media`),
  KEY `id_type` (`id_type`),
  CONSTRAINT `definitions_ibfk_1` FOREIGN KEY (`id_content`) REFERENCES `contents` (`id_content`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `definitions_ibfk_2` FOREIGN KEY (`id_media`) REFERENCES `medias` (`id_media`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `definitions_ibfk_3` FOREIGN KEY (`id_type`) REFERENCES `contents_types` (`id_type`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `definitions`
--

LOCK TABLES `definitions` WRITE;
/*!40000 ALTER TABLE `definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extends`
--

DROP TABLE IF EXISTS `extends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extends` (
  `id_extend` int(11) unsigned NOT NULL,
  `code` varchar(20) NOT NULL,
  `id_definition` int(11) unsigned NOT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `label` varchar(600) DEFAULT NULL COMMENT 'json',
  `descripition` varchar(600) DEFAULT NULL COMMENT 'json',
  `type` enum('text','link','content','textarea','editor','url','number','date','datetime','time','checkbox','radiobox','select','multiselect','media') NOT NULL DEFAULT 'text',
  `translatable` tinyint(1) unsigned DEFAULT '0',
  `values` text,
  `default` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_extend`),
  UNIQUE KEY `unique_field` (`id_definition`,`code`) USING BTREE,
  CONSTRAINT `extends_ibfk_1` FOREIGN KEY (`id_definition`) REFERENCES `definitions` (`id_definition`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extends`
--

LOCK TABLES `extends` WRITE;
/*!40000 ALTER TABLE `extends` DISABLE KEYS */;
/*!40000 ALTER TABLE `extends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id_language` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `url` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `default` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id_language`,`code`,`url`),
  KEY `id_language` (`id_language`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'en','en','English',0,1),(2,'hu','hu','Magyar',1,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medias`
--

DROP TABLE IF EXISTS `medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medias` (
  `id_media` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('picture','video','file') DEFAULT NULL,
  `provider` varchar(200) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `thumbnail` varchar(200) DEFAULT NULL,
  `extends_data` text COMMENT 'json',
  `uploaded` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logical_date` datetime DEFAULT NULL,
  `geolocation` point DEFAULT NULL,
  `id_uploader` int(11) unsigned DEFAULT NULL,
  `uploader` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_media`),
  KEY `id_uploader` (`id_uploader`,`uploader`),
  CONSTRAINT `medias_ibfk_1` FOREIGN KEY (`id_uploader`, `uploader`) REFERENCES `users` (`id_user`, `email`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medias`
--

LOCK TABLES `medias` WRITE;
/*!40000 ALTER TABLE `medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medias_translations`
--

DROP TABLE IF EXISTS `medias_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medias_translations` (
  `id_translation` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_media` int(11) unsigned NOT NULL,
  `id_language` int(11) unsigned NOT NULL,
  `language` varchar(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `extends_data` text COMMENT 'json',
  `keywords` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_translation`),
  UNIQUE KEY `unique_translation` (`id_language`,`id_media`) USING BTREE,
  KEY `id_media` (`id_media`),
  KEY `id_language` (`id_language`,`language`),
  CONSTRAINT `medias_translations_ibfk_1` FOREIGN KEY (`id_media`) REFERENCES `medias` (`id_media`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `medias_translations_ibfk_2` FOREIGN KEY (`id_language`, `language`) REFERENCES `languages` (`id_language`, `code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medias_translations`
--

LOCK TABLES `medias_translations` WRITE;
/*!40000 ALTER TABLE `medias_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `medias_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations`
--

DROP TABLE IF EXISTS `navigations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigations` (
  `id_navigation` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `subdomain` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_navigation`,`code`),
  KEY `id_navigation` (`id_navigation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations`
--

LOCK TABLES `navigations` WRITE;
/*!40000 ALTER TABLE `navigations` DISABLE KEYS */;
INSERT INTO `navigations` VALUES (1,'main',0,'Main',NULL,NULL);
/*!40000 ALTER TABLE `navigations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations_contents`
--

DROP TABLE IF EXISTS `navigations_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigations_contents` (
  `id_con` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_navigation` int(11) unsigned NOT NULL,
  `id_content` int(11) unsigned NOT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_creator` int(11) unsigned DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_con`),
  KEY `id_navigation` (`id_navigation`),
  KEY `id_content` (`id_content`),
  KEY `id_creator` (`id_creator`,`creator`),
  CONSTRAINT `navigations_contents_ibfk_1` FOREIGN KEY (`id_navigation`) REFERENCES `navigations` (`id_navigation`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `navigations_contents_ibfk_2` FOREIGN KEY (`id_content`) REFERENCES `contents` (`id_content`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `navigations_contents_ibfk_3` FOREIGN KEY (`id_creator`, `creator`) REFERENCES `users` (`id_user`, `email`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations_contents`
--

LOCK TABLES `navigations_contents` WRITE;
/*!40000 ALTER TABLE `navigations_contents` DISABLE KEYS */;
INSERT INTO `navigations_contents` VALUES (1,1,1,0,'2015-08-16 18:39:20',1,'admin@ionizecms.com');
/*!40000 ALTER TABLE `navigations_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id_role` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `level` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_role`,`code`),
  KEY `id_role` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'super',0,10000,'Super Administrator',NULL),(2,'admin',1,5000,'Administrator',NULL),(3,'moderator',2,2500,'Moderator',NULL),(4,'user',3,1000,'User',NULL),(5,'guest',4,100,'Guest',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id_settings` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_language` int(11) unsigned DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id_settings`),
  KEY `id_langauge` (`id_language`,`language`),
  CONSTRAINT `settings_ibfk_1` FOREIGN KEY (`id_language`, `language`) REFERENCES `languages` (`id_language`, `code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,NULL,NULL,'language','en_US'),(2,NULL,NULL,'theme','Default_Native');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urls`
--

DROP TABLE IF EXISTS `urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `urls` (
  `id_url` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_language` int(11) unsigned DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_content` int(11) unsigned DEFAULT NULL,
  `domain` varchar(100) DEFAULT '*',
  `subdomain` varchar(100) DEFAULT '*',
  `url` varchar(500) DEFAULT NULL,
  `pattern` varchar(500) DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `forwarded` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_url`),
  UNIQUE KEY `unique_url` (`id_content`,`id_language`) USING BTREE,
  KEY `id_language` (`id_language`,`language`),
  CONSTRAINT `urls_ibfk_1` FOREIGN KEY (`id_language`, `language`) REFERENCES `languages` (`id_language`, `code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `urls_ibfk_2` FOREIGN KEY (`id_content`) REFERENCES `contents` (`id_content`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urls`
--

LOCK TABLES `urls` WRITE;
/*!40000 ALTER TABLE `urls` DISABLE KEYS */;
INSERT INTO `urls` VALUES (1,1,'en','2015-08-12 15:13:15',1,'*','*','/home',NULL,NULL,NULL),(2,2,'hu','2015-08-12 15:13:25',1,'*','*','/nyitolap',NULL,NULL,NULL);
/*!40000 ALTER TABLE `urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `encryption` enum('text','md5','sha') DEFAULT 'text',
  `hash` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `forname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `gender` enum('w','m') DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `activated` datetime DEFAULT NULL,
  `registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_role` int(11) unsigned DEFAULT NULL,
  `id_language` int(11) unsigned DEFAULT NULL,
  `language` varchar(30) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_ip` varchar(20) DEFAULT NULL,
  `login_try` int(2) unsigned DEFAULT '0',
  `extends_data` text COMMENT 'json',
  `deactivated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id_user`,`login`,`email`),
  KEY `id_user` (`id_user`,`email`),
  KEY `user_language` (`id_language`,`language`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `user_language` FOREIGN KEY (`id_language`, `language`) REFERENCES `languages` (`id_language`, `code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','text',NULL,'admin','Admin User','admin@ionizecms.com','Admin','User',NULL,NULL,'2015-08-12 17:07:10','2015-08-12 14:41:58',1,1,'en',NULL,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `content`
--

/*!50001 DROP VIEW IF EXISTS `content`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `content` AS select `cnt`.`id_content` AS `id_content`,`cnt`.`code` AS `name`,`cnt`.`id_type` AS `id_type`,`ctp`.`code` AS `type`,`cnt`.`ordering` AS `ordering`,`cnt`.`publish_on` AS `publish_on`,unix_timestamp(`cnt`.`publish_on`) AS `publish_on_unix`,`cnt`.`publish_off` AS `publish_off`,unix_timestamp(`cnt`.`publish_off`) AS `publish_off_unix`,coalesce(`cnt`.`logical_date`,`cnt`.`created`) AS `logical_date`,unix_timestamp(coalesce(`cnt`.`logical_date`,`cnt`.`created`)) AS `logical_date_unix`,coalesce(`cnt`.`extends_data`,'[]') AS `extends_data`,`ctp`.`default_list_view` AS `default_list_view`,`ctp`.`default_single_view` AS `default_single_view`,`ctp`.`default_item_view` AS `default_item_view`,`cnt`.`list_view` AS `list_view`,`cnt`.`single_view` AS `single_view`,`cnt`.`item_view` AS `item_view`,(case when ((`cnt`.`has_child` = 1) and (`cnt`.`site_root` = 0)) then coalesce(`cnt`.`list_view`,`ctp`.`default_list_view`) when ((`cnt`.`has_child` = 0) and (`cnt`.`site_root` = 0)) then coalesce(`cnt`.`single_view`,`ctp`.`default_single_view`) when (`cnt`.`site_root` = 1) then 'page_home' else NULL end) AS `view`,`lng`.`id_language` AS `id_language`,`lng`.`code` AS `language`,`ctr`.`title` AS `title`,`ctr`.`subtitle` AS `subtitle`,`ctr`.`preview` AS `preview`,`ctr`.`window` AS `window`,`ctr`.`short_url` AS `short_url`,`ctr`.`long_url` AS `long_url`,`ctr`.`content` AS `content`,`ctr`.`keywords` AS `keywords`,`ctr`.`description` AS `description`,coalesce(`ctr`.`extends_data`,'[]') AS `extends_data_lang`,`cnt`.`indexed` AS `indexed`,coalesce(`cnt`.`has_url`,0) AS `has_url`,coalesce(`cnt`.`has_child`,0) AS `has_children`,`cnt`.`flag` AS `flag`,`cnt`.`priority` AS `priority`,(select group_concat(`ctr`.`id_child` separator ',') from `contents_relations` `ctr` where (`ctr`.`id_parent` = `cnt`.`id_content`)) AS `children`,`ath`.`id_user` AS `id_author`,`cnt`.`created` AS `created`,unix_timestamp(`cnt`.`created`) AS `created_unix`,`ath`.`login` AS `author_login`,`ath`.`name` AS `author_name`,`ath`.`forname` AS `author_forname`,`ath`.`lastname` AS `author_lastname`,`ath`.`email` AS `author_email`,coalesce(`ath`.`extends_data`,'[]') AS `author_extends_data`,`upd`.`id_user` AS `id_updater`,`cnt`.`updated` AS `updated`,unix_timestamp(`cnt`.`updated`) AS `updated_unix`,`upd`.`login` AS `updater_login`,`upd`.`name` AS `updater_name`,`upd`.`forname` AS `updater_forname`,`upd`.`lastname` AS `updater_lastname`,`upd`.`email` AS `updater_email`,coalesce(`upd`.`extends_data`,'[]') AS `updater_extends_data`,`cnt`.`default_language` AS `default_language`,`cnt`.`site_root` AS `homepage` from (((((`contents_translations` `ctr` left join `languages` `lng` on((`ctr`.`id_language` = `lng`.`id_language`))) left join `contents` `cnt` on((`ctr`.`id_content` = `cnt`.`id_content`))) left join `contents_types` `ctp` on((`cnt`.`id_type` = `ctp`.`id_type`))) left join `users` `ath` on((`cnt`.`id_author` = `ath`.`id_user`))) left join `users` `upd` on((`cnt`.`id_updater` = `upd`.`id_user`))) where isnull(`cnt`.`deleted`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-10 23:10:01
