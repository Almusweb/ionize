/*
Navicat MySQL Data Transfer

Source Server         : root@localhost
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : ionize_200

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-08-18 23:21:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
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

-- ----------------------------
-- Records of categories
-- ----------------------------

-- ----------------------------
-- Table structure for categories_translations
-- ----------------------------
DROP TABLE IF EXISTS `categories_translations`;
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

-- ----------------------------
-- Records of categories_translations
-- ----------------------------

-- ----------------------------
-- Table structure for contents
-- ----------------------------
DROP TABLE IF EXISTS `contents`;
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

-- ----------------------------
-- Records of contents
-- ----------------------------
INSERT INTO `contents` VALUES ('1', 'homepage', '1', '0', '1', 'contact@liszkaiadam.hu', '2015-08-12 17:09:28', null, null, null, null, null, null, '0', '1', '0', null, '5', '1', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for contents_categories
-- ----------------------------
DROP TABLE IF EXISTS `contents_categories`;
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

-- ----------------------------
-- Records of contents_categories
-- ----------------------------

-- ----------------------------
-- Table structure for contents_medias
-- ----------------------------
DROP TABLE IF EXISTS `contents_medias`;
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

-- ----------------------------
-- Records of contents_medias
-- ----------------------------

-- ----------------------------
-- Table structure for contents_relations
-- ----------------------------
DROP TABLE IF EXISTS `contents_relations`;
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

-- ----------------------------
-- Records of contents_relations
-- ----------------------------

-- ----------------------------
-- Table structure for contents_translations
-- ----------------------------
DROP TABLE IF EXISTS `contents_translations`;
CREATE TABLE `contents_translations` (
  `id_translation` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_content` int(11) unsigned DEFAULT NULL,
  `id_language` int(11) unsigned DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
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
  PRIMARY KEY (`id_translation`),
  UNIQUE KEY `unique_translation` (`id_content`,`id_language`) USING BTREE,
  KEY `translations_language` (`id_language`,`language`),
  CONSTRAINT `contents_translation` FOREIGN KEY (`id_content`) REFERENCES `contents` (`id_content`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `translations_language` FOREIGN KEY (`id_language`, `language`) REFERENCES `languages` (`id_language`, `code`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contents_translations
-- ----------------------------
INSERT INTO `contents_translations` VALUES ('1', '1', '1', 'en_US', 'Welcome to Ionize 2.0', 'Welcome!', null, null, '', 'welcome', null, null, null, null, null);
INSERT INTO `contents_translations` VALUES ('2', '1', '2', 'hu_HU', 'Üdvözli az Ionize 2.0', 'Üdvözöljük!', null, null, '', 'nyitolap', null, null, null, null, null);

-- ----------------------------
-- Table structure for contents_types
-- ----------------------------
DROP TABLE IF EXISTS `contents_types`;
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

-- ----------------------------
-- Records of contents_types
-- ----------------------------
INSERT INTO `contents_types` VALUES ('1', 'page', '0', 'page', 'page_article', 'article', '1');
INSERT INTO `contents_types` VALUES ('2', 'article', '1', 'page', 'page_article', 'article', '0');
INSERT INTO `contents_types` VALUES ('3', 'media', '2', null, null, null, '0');

-- ----------------------------
-- Table structure for definitions
-- ----------------------------
DROP TABLE IF EXISTS `definitions`;
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

-- ----------------------------
-- Records of definitions
-- ----------------------------

-- ----------------------------
-- Table structure for extends
-- ----------------------------
DROP TABLE IF EXISTS `extends`;
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

-- ----------------------------
-- Records of extends
-- ----------------------------

-- ----------------------------
-- Table structure for languages
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `id_language` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `url` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `default` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id_language`,`code`,`url`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of languages
-- ----------------------------
INSERT INTO `languages` VALUES ('1', 'en_US', 'en', 'English', '0', '1');
INSERT INTO `languages` VALUES ('2', 'hu_HU', 'hu', 'Magyar', '1', '0');

-- ----------------------------
-- Table structure for medias
-- ----------------------------
DROP TABLE IF EXISTS `medias`;
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

-- ----------------------------
-- Records of medias
-- ----------------------------

-- ----------------------------
-- Table structure for medias_translations
-- ----------------------------
DROP TABLE IF EXISTS `medias_translations`;
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

-- ----------------------------
-- Records of medias_translations
-- ----------------------------

-- ----------------------------
-- Table structure for navigations
-- ----------------------------
DROP TABLE IF EXISTS `navigations`;
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

-- ----------------------------
-- Records of navigations
-- ----------------------------
INSERT INTO `navigations` VALUES ('1', 'main', '0', 'Main', null, null);

-- ----------------------------
-- Table structure for navigations_contents
-- ----------------------------
DROP TABLE IF EXISTS `navigations_contents`;
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

-- ----------------------------
-- Records of navigations_contents
-- ----------------------------
INSERT INTO `navigations_contents` VALUES ('1', '1', '1', '0', '2015-08-16 20:39:20', '1', 'contact@liszkaiadam.hu');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
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

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'super', '0', '10000', 'Super Administrator', null);
INSERT INTO `roles` VALUES ('2', 'admin', '1', '5000', 'Administrator', null);
INSERT INTO `roles` VALUES ('3', 'moderator', '2', '2500', 'Moderator', null);
INSERT INTO `roles` VALUES ('4', 'user', '3', '1000', 'User', null);
INSERT INTO `roles` VALUES ('5', 'guest', '4', '100', 'Guest', null);

-- ----------------------------
-- Table structure for urls
-- ----------------------------
DROP TABLE IF EXISTS `urls`;
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

-- ----------------------------
-- Records of urls
-- ----------------------------
INSERT INTO `urls` VALUES ('1', '1', 'en_US', '2015-08-12 17:13:15', '1', '*', '*', '/home', null, null, null);
INSERT INTO `urls` VALUES ('2', '2', 'hu_HU', '2015-08-12 17:13:25', '1', '*', '*', '/nyitolap', null, null, null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
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

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'adam.liszkai', 'text', null, 'Ind3pender', 'Adam Liszkai', 'contact@liszkaiadam.hu', 'Adam', 'Liszkai', null, null, '2015-08-12 17:07:10', '2015-08-12 16:41:58', '1', '2', 'hu_HU', null, null, '0', null, null, null);

-- ----------------------------
-- View structure for content
-- ----------------------------
DROP VIEW IF EXISTS `content`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `content` AS select `cnt`.`id_content` AS `id_content`,`cnt`.`code` AS `name`,`cnt`.`id_type` AS `id_type`,`ctp`.`code` AS `type`,`cnt`.`ordering` AS `ordering`,`cnt`.`publish_on` AS `publish_on`,unix_timestamp(`cnt`.`publish_on`) AS `publish_on_unix`,`cnt`.`publish_off` AS `publish_off`,unix_timestamp(`cnt`.`publish_off`) AS `publish_off_unix`,coalesce(`cnt`.`logical_date`,`cnt`.`created`) AS `logical_date`,unix_timestamp(coalesce(`cnt`.`logical_date`,`cnt`.`created`)) AS `logical_date_unix`,coalesce(`cnt`.`extends_data`,'[]') AS `extends_data`,`ctp`.`default_list_view` AS `default_list_view`,`ctp`.`default_single_view` AS `default_single_view`,`ctp`.`default_item_view` AS `default_item_view`,`cnt`.`list_view` AS `list_view`,`cnt`.`single_view` AS `single_view`,`cnt`.`item_view` AS `item_view`,(case when ((`cnt`.`has_child` = 1) and (`cnt`.`site_root` = 0)) then coalesce(`cnt`.`list_view`,`ctp`.`default_list_view`) when ((`cnt`.`has_child` = 0) and (`cnt`.`site_root` = 0)) then coalesce(`cnt`.`single_view`,`ctp`.`default_single_view`) when (`cnt`.`site_root` = 1) then 'page_home' else NULL end) AS `view`,`lng`.`id_language` AS `id_language`,`lng`.`code` AS `language`,`ctr`.`title` AS `title`,`ctr`.`subtitle` AS `subtitle`,`ctr`.`preview` AS `preview`,`ctr`.`window` AS `window`,`ctr`.`short_url` AS `short_url`,`ctr`.`long_url` AS `long_url`,`ctr`.`content` AS `content`,`ctr`.`keywords` AS `keywords`,`ctr`.`description` AS `description`,coalesce(`ctr`.`extends_data`,'[]') AS `extends_data_lang`,`cnt`.`indexed` AS `indexed`,coalesce(`cnt`.`has_url`,0) AS `has_url`,coalesce(`cnt`.`has_child`,0) AS `has_children`,`cnt`.`flag` AS `flag`,`cnt`.`priority` AS `priority`,(select group_concat(`ctr`.`id_child` separator ',') from `contents_relations` `ctr` where (`ctr`.`id_parent` = `cnt`.`id_content`)) AS `children`,`ath`.`id_user` AS `id_author`,`cnt`.`created` AS `created`,unix_timestamp(`cnt`.`created`) AS `created_unix`,`ath`.`login` AS `author_login`,`ath`.`name` AS `author_name`,`ath`.`forname` AS `author_forname`,`ath`.`lastname` AS `author_lastname`,`ath`.`email` AS `author_email`,coalesce(`ath`.`extends_data`,'[]') AS `author_extends_data`,`upd`.`id_user` AS `id_updater`,`cnt`.`updated` AS `updated`,unix_timestamp(`cnt`.`updated`) AS `updated_unix`,`upd`.`login` AS `updater_login`,`upd`.`name` AS `updater_name`,`upd`.`forname` AS `updater_forname`,`upd`.`lastname` AS `updater_lastname`,`upd`.`email` AS `updater_email`,coalesce(`upd`.`extends_data`,'[]') AS `updater_extends_data`,`cnt`.`default_language` AS `default_language`,`cnt`.`site_root` AS `homepage` from (((((`contents_translations` `ctr` left join `languages` `lng` on((`ctr`.`id_language` = `lng`.`id_language`))) left join `contents` `cnt` on((`ctr`.`id_content` = `cnt`.`id_content`))) left join `contents_types` `ctp` on((`cnt`.`id_type` = `ctp`.`id_type`))) left join `users` `ath` on((`cnt`.`id_author` = `ath`.`id_user`))) left join `users` `upd` on((`cnt`.`id_updater` = `upd`.`id_user`))) where isnull(`cnt`.`deleted`) ;
