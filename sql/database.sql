-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Hoszt: localhost
-- Létrehozás ideje: 2015. Aug 23. 14:00
-- Szerver verzió: 5.6.25-0ubuntu0.15.04.1
-- PHP verzió: 5.6.4-4ubuntu6.2

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Adatbázis: `ionize_200`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
`id_category` int(11) unsigned NOT NULL,
  `code` varchar(20) NOT NULL,
  `id_parent` int(11) unsigned DEFAULT NULL,
  `parent` varchar(20) DEFAULT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `color_primary` varchar(20) DEFAULT NULL,
  `color_secondary` varchar(20) DEFAULT NULL,
  `color_text` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
CREATE TABLE IF NOT EXISTS `categories_translations` (
`id_translation` int(11) unsigned NOT NULL,
  `id_category` int(11) unsigned NOT NULL,
  `id_language` int(11) unsigned NOT NULL,
  `language` varchar(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `short_url` varchar(100) DEFAULT NULL,
  `long_url` varchar(300) DEFAULT NULL,
  `preview` varchar(300) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `keywords` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- TÁBLA KAPCSOLATAI `categories_translations`:
--   `id_category`
--       `categories` -> `id_category`
--

-- --------------------------------------------------------

--
-- A nézet helyettes szerkezete `content`
--
DROP VIEW IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
`id_content` int(11) unsigned
,`name` varchar(30)
,`id_parents` text
,`ordering` int(11) unsigned
,`id_childrens` text
,`id_type` int(11) unsigned
,`type` varchar(30)
,`publish_on` datetime
,`publish_on_unix` bigint(11)
,`publish_off` datetime
,`publish_off_unix` bigint(11)
,`logical_date` datetime
,`logical_date_unix` bigint(11)
,`extends_data` text
,`default_list_view` varchar(100)
,`default_single_view` varchar(100)
,`default_item_view` varchar(100)
,`list_view` varchar(100)
,`single_view` varchar(100)
,`item_view` varchar(100)
,`view` varchar(100)
,`id_language` int(11) unsigned
,`language` varchar(20)
,`title` varchar(100)
,`subtitle` varchar(100)
,`preview` text
,`window` varchar(100)
,`short_url` varchar(30)
,`long_url` varchar(100)
,`url` varchar(400)
,`content` text
,`keywords` varchar(100)
,`description` varchar(200)
,`extends_data_lang` text
,`indexed` tinyint(1) unsigned
,`has_url` int(4)
,`has_children` decimal(11,0)
,`flag` varchar(30)
,`priority` int(3) unsigned
,`id_author` int(11) unsigned
,`created` timestamp
,`created_unix` bigint(11)
,`author_login` varchar(50)
,`author_name` varchar(100)
,`author_forname` varchar(50)
,`author_lastname` varchar(50)
,`author_email` varchar(100)
,`author_extends_data` text
,`id_updater` int(11) unsigned
,`updated` datetime
,`updated_unix` bigint(11)
,`updater_login` varchar(50)
,`updater_name` varchar(100)
,`updater_forname` varchar(50)
,`updater_lastname` varchar(50)
,`updater_email` varchar(100)
,`updater_extends_data` text
,`default_language` int(1) unsigned
,`homepage` tinyint(11) unsigned
);
-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `contents`
--

DROP TABLE IF EXISTS `contents`;
CREATE TABLE IF NOT EXISTS `contents` (
`id_content` int(11) unsigned NOT NULL,
  `code` varchar(30) NOT NULL,
  `id_type` int(11) unsigned NOT NULL,
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
  `flag` varchar(30) DEFAULT NULL,
  `priority` int(3) unsigned DEFAULT '5',
  `default_language` int(1) unsigned DEFAULT NULL,
  `site_root` tinyint(11) unsigned DEFAULT NULL,
  `extends_data` text COMMENT 'json',
  `list_view` varchar(100) DEFAULT NULL,
  `item_view` varchar(100) DEFAULT NULL,
  `single_view` varchar(100) DEFAULT NULL,
  `deleted` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- TÁBLA KAPCSOLATAI `contents`:
--   `id_type`
--       `contents_types` -> `id_type`
--

--
-- A tábla adatainak kiíratása `contents`
--

INSERT INTO `contents` (`id_content`, `code`, `id_type`, `id_author`, `author`, `created`, `id_updater`, `updater`, `updated`, `publish_on`, `publish_off`, `logical_date`, `indexed`, `has_url`, `flag`, `priority`, `default_language`, `site_root`, `extends_data`, `list_view`, `item_view`, `single_view`, `deleted`) VALUES
(1, 'ionize2', 1, 1, 'admin@ionizecms.com', '2015-08-12 15:09:28', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(2, 'whats_new', 1, 1, 'admin@ionizecms.com', '2015-08-20 23:34:07', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 5, 1, 0, NULL, 'page', NULL, NULL, NULL),
(3, 'codeigniter3', 2, 1, 'admin@ionizecms.com', '2015-08-21 00:10:31', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 5, 1, 0, NULL, NULL, NULL, 'page', NULL),
(4, 'database', 2, 1, 'admin@ionizecms.com', '2015-08-21 08:20:55', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 5, 1, 0, NULL, NULL, NULL, 'page', NULL),
(5, 'template-engine', 2, 1, 'admin@ionizecms.com', '2015-08-22 19:03:13', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 5, 1, 0, NULL, NULL, NULL, 'page', NULL);

--
-- Eseményindítók `contents`
--
DROP TRIGGER IF EXISTS `contents_after_insert`;
DELIMITER //
CREATE TRIGGER `contents_after_insert` AFTER INSERT ON `contents`
 FOR EACH ROW BEGIN

	DECLARE $id_content, $id_language INTEGER;
	DECLARE $language VARCHAR(30);
	DECLARE $done BOOLEAN DEFAULT FALSE;

	DECLARE LANGUAGES_CURSOR CURSOR FOR SELECT `id_language`, `code` FROM `languages`;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET $done = TRUE;

	OPEN LANGUAGES_CURSOR; CURSOR_LOOP: LOOP
		-- Fetch data from the languages
		FETCH LANGUAGES_CURSOR INTO $id_language, $language;
		-- If done with the fetch
		IF $done = TRUE THEN LEAVE CURSOR_LOOP; END IF;
		
		-- Create translations for all language
		INSERT INTO `contents_translations`(`id_content`,`id_language`,`language`) VALUES(NEW.`id_content`, $id_language, $language);

	END LOOP CURSOR_LOOP; CLOSE LANGUAGES_CURSOR;

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `contents_categories`
--

DROP TABLE IF EXISTS `contents_categories`;
CREATE TABLE IF NOT EXISTS `contents_categories` (
`id_con` int(11) unsigned NOT NULL,
  `id_content` int(11) unsigned NOT NULL,
  `id_category` int(11) unsigned NOT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_creator` int(11) unsigned DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- TÁBLA KAPCSOLATAI `contents_categories`:
--   `id_content`
--       `contents` -> `id_content`
--   `id_category`
--       `categories` -> `id_category`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `contents_medias`
--

DROP TABLE IF EXISTS `contents_medias`;
CREATE TABLE IF NOT EXISTS `contents_medias` (
`id_con` int(11) unsigned NOT NULL,
  `id_content` int(11) unsigned NOT NULL,
  `id_media` int(11) unsigned NOT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_creator` int(11) unsigned DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- TÁBLA KAPCSOLATAI `contents_medias`:
--   `id_content`
--       `contents` -> `id_content`
--   `id_media`
--       `medias` -> `id_media`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `contents_relations`
--

DROP TABLE IF EXISTS `contents_relations`;
CREATE TABLE IF NOT EXISTS `contents_relations` (
`id_relation` int(11) unsigned NOT NULL,
  `id_parent` int(11) unsigned DEFAULT NULL,
  `id_content` int(11) unsigned DEFAULT NULL,
  `ordering` int(11) unsigned DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- TÁBLA KAPCSOLATAI `contents_relations`:
--   `id_parent`
--       `contents` -> `id_content`
--   `id_content`
--       `contents` -> `id_content`
--

--
-- A tábla adatainak kiíratása `contents_relations`
--

INSERT INTO `contents_relations` (`id_relation`, `id_parent`, `id_content`, `ordering`) VALUES
(1, 2, 3, 0),
(2, 2, 4, 1),
(3, 2, 5, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `contents_translations`
--

DROP TABLE IF EXISTS `contents_translations`;
CREATE TABLE IF NOT EXISTS `contents_translations` (
`id_translation` int(11) unsigned NOT NULL,
  `id_content` int(11) unsigned DEFAULT NULL,
  `id_language` int(11) unsigned DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `window` varchar(100) DEFAULT NULL,
  `navigation` varchar(100) DEFAULT NULL,
  `short_url` varchar(30) DEFAULT NULL,
  `long_url` varchar(100) DEFAULT NULL,
  `full_url` varchar(400) DEFAULT NULL,
  `preview` text,
  `content` text,
  `extends_data` text COMMENT 'json',
  `keywords` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- TÁBLA KAPCSOLATAI `contents_translations`:
--   `id_content`
--       `contents` -> `id_content`
--

--
-- A tábla adatainak kiíratása `contents_translations`
--

INSERT INTO `contents_translations` (`id_translation`, `id_content`, `id_language`, `language`, `title`, `subtitle`, `window`, `navigation`, `short_url`, `long_url`, `full_url`, `preview`, `content`, `extends_data`, `keywords`, `description`) VALUES
(1, 1, 1, 'en', 'Welcome to ionize 2.0', 'Welcome!', NULL, NULL, NULL, 'welcome', '/welcome', NULL, '<p>For more information about building a website with Ionize, you can:</p> <ul><li>Download &amp; read <a href="http://www.ionizecms.com">the Documentation</a></li><li>Visit <a href="http://www.ionizecms.com/forum">the Community Forum</a></li></ul><p>Have fun !</p>', NULL, NULL, NULL),
(3, 2, 1, 'en', 'What''s new?', NULL, NULL, NULL, NULL, 'whats-new', '/whats-new', '<p class="justify">The new Ionize 2.0 comming with huge features, the core was completley rewritten, the performace was boosted up to 4000 request per second (with full cache), cache now has levels, the dataclasses can cached seperate, the database has rewritten, and from now Ionize will support other template engines and Ionize core template engine has been rewritten for performance.</p>', '<p class="justify">The new Ionize 2.0 comming with huge features, the core was completley rewritten, the performace was boosted up to 4000 request per second (with full cache), cache now has levels, the dataclasses can cached seperate, the database has rewritten, and from now Ionize will support other template engines and Ionize core template engine has been rewritten for performance.</p>', NULL, NULL, NULL),
(4, 3, 1, 'en', 'CodeIgniter 3.0', NULL, NULL, NULL, NULL, 'codeigniter3', '/whats-new/codeigniter3', '<p class="justify">The CodeIgniter framework was replaced to 3.0, the core files was rewritten completely, now the database models and the content objects has seperate classes with namespaces. The core now functioning as a real HMVC (Hierarchical Model–View-Controller) structure with ViewModels where the data from database stored, and relations between objects handled.</p>', '<p class="justify"> <img src="/static/hmvc.png" alt="hmvc" style="width: 340px; margin: 0 10px 10px 20px; float: right;" /> The CodeIgniter framework was replaced to 3.0, the core files was rewritten completely, now the database models and the content objects has seperate classes with namespaces. The core now functioning as a real HMVC (Hierarchical Model–View-Controller) structure with ViewModels where the data from database stored, and relations between objects handled.</p>\r\n<p class="justify"> The website data are in ViewModels, where the stored data can be handle and in view files the <i>Model\\Database</i> namespace is forbidden for security reasons. The view files can access to the ViewModels and the Libraries, where you can use the Ionize styled PHP libraries or use the ViewModels in native PHP.</p>\r\n<p class="justify">The Models, Views, ViewModels can be cached seperatley: you can reduce the database usage to zero and parse the views alive. You can use also the Ionize tags but it will be compiled to PHP like in other Template Engines, also Smarty and Dwoo has been implemented.</p>\r\n<p class="justify">Themes from Ionzie 1.0.x full supported, modules need a little migration, because the FTL and the Admin was changed, follow the migration guide to migrate it.</p>', NULL, NULL, NULL),
(5, 4, 1, 'en', 'Database', NULL, NULL, NULL, NULL, 'database', '/whats-new/database', '<p class="justify">New remaked Database structure with Views, Triggers, Procedures and Functions. The Database now generating and cleaning itself and contents generator functions can be use for developments. The seperate Pages and Articles now are in a central Contents table, where the Content type determinated by usage.</p>', '<p class="justify">New remaked Database structure with Views, Triggers, Procedures and Functions. The Database now generating and cleaning itself and contents generator functions can be use for developments. The seperate Pages and Articles now are in a central Contents table, where the Content type determinated by usage.</p>', NULL, NULL, NULL),
(6, 5, 1, 'en', 'Template Parser', NULL, NULL, NULL, NULL, 'template-parser', '/whats-new/template-parser', '<p class="justify"> Ionize tag now will be compiled to native PHP like other Template Engines, this will make a huge performace boost, because the previous Template Engine processed every single tag alive. You can use all of the tags from the version 1.0.x and but the page and article(s) tags using a global content tag. You can make your themes with native PHP using Ionize tag styled libraries or using the ViewModels. If you like Smarty or Dwoo, you can use them for your theme too! </p>', '<p class="justify"> Ionize tag now will be compiled to native PHP like other Template Engines, this will make a huge performace boost, because the previous Template Engine processed every single tag alive. You can use all of the tags from the version 1.0.x and but the page and article(s) tags using a global content tag. You can make your themes with native PHP using Ionize tag styled libraries or using the ViewModels. If you like Smarty or Dwoo, you can use them for your theme too! </p>', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `contents_types`
--

DROP TABLE IF EXISTS `contents_types`;
CREATE TABLE IF NOT EXISTS `contents_types` (
`id_type` int(11) unsigned NOT NULL,
  `code` varchar(30) NOT NULL,
  `ordering` int(11) unsigned DEFAULT NULL,
  `default_list_view` varchar(100) DEFAULT NULL,
  `default_item_view` varchar(100) DEFAULT NULL,
  `default_single_view` varchar(100) DEFAULT NULL,
  `default` tinyint(1) unsigned DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `contents_types`
--

INSERT INTO `contents_types` (`id_type`, `code`, `ordering`, `default_list_view`, `default_item_view`, `default_single_view`, `default`) VALUES
(1, 'page', 0, 'page', 'page_article', 'article', 1),
(2, 'article', 1, 'page', 'page_article', 'article', 0),
(3, 'media', 2, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `definitions`
--

DROP TABLE IF EXISTS `definitions`;
CREATE TABLE IF NOT EXISTS `definitions` (
`id_definition` int(11) unsigned NOT NULL,
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
  `creator` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- TÁBLA KAPCSOLATAI `definitions`:
--   `id_content`
--       `contents` -> `id_content`
--   `id_media`
--       `medias` -> `id_media`
--   `id_type`
--       `contents_types` -> `id_type`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `extends`
--

DROP TABLE IF EXISTS `extends`;
CREATE TABLE IF NOT EXISTS `extends` (
  `id_extend` int(11) unsigned NOT NULL,
  `code` varchar(20) NOT NULL,
  `id_definition` int(11) unsigned NOT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `label` varchar(600) DEFAULT NULL COMMENT 'json',
  `descripition` varchar(600) DEFAULT NULL COMMENT 'json',
  `type` enum('text','link','content','textarea','editor','url','number','date','datetime','time','checkbox','radiobox','select','multiselect','media') NOT NULL DEFAULT 'text',
  `translatable` tinyint(1) unsigned DEFAULT '0',
  `values` text,
  `default` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- TÁBLA KAPCSOLATAI `extends`:
--   `id_definition`
--       `definitions` -> `id_definition`
--

-- --------------------------------------------------------

--
-- A nézet helyettes szerkezete `language`
--
DROP VIEW IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
`id_language` int(11) unsigned
,`language` varchar(20)
,`ordering` int(11) unsigned
,`code` varchar(10)
,`name` varchar(50)
,`default` tinyint(1) unsigned
);
-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
`id_language` int(11) unsigned NOT NULL,
  `code` varchar(20) NOT NULL,
  `url` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `default` tinyint(1) unsigned DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `languages`
--

INSERT INTO `languages` (`id_language`, `code`, `url`, `name`, `ordering`, `default`) VALUES
(1, 'en', 'en', 'English', 0, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `medias`
--

DROP TABLE IF EXISTS `medias`;
CREATE TABLE IF NOT EXISTS `medias` (
`id_media` int(11) unsigned NOT NULL,
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
  `uploader` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `medias`
--

INSERT INTO `medias` (`id_media`, `type`, `provider`, `path`, `filename`, `thumbnail`, `extends_data`, `uploaded`, `logical_date`, `geolocation`, `id_uploader`, `uploader`) VALUES
(1, 'picture', NULL, 'static/', 'codeigniter.jpg', NULL, NULL, '2015-08-22 16:50:15', NULL, NULL, 1, 'admin@ionizecms.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `medias_translations`
--

DROP TABLE IF EXISTS `medias_translations`;
CREATE TABLE IF NOT EXISTS `medias_translations` (
`id_translation` int(11) unsigned NOT NULL,
  `id_media` int(11) unsigned NOT NULL,
  `id_language` int(11) unsigned NOT NULL,
  `language` varchar(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `extends_data` text COMMENT 'json',
  `keywords` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- TÁBLA KAPCSOLATAI `medias_translations`:
--   `id_media`
--       `medias` -> `id_media`
--

-- --------------------------------------------------------

--
-- A nézet helyettes szerkezete `navigation`
--
DROP VIEW IF EXISTS `navigation`;
CREATE TABLE IF NOT EXISTS `navigation` (
`id_navigation` int(11) unsigned
,`navigation_ordering` int(11) unsigned
,`code` varchar(20)
,`name` varchar(100)
,`id_item` int(11) unsigned
,`level` int(3) unsigned
,`ordering` int(11) unsigned
,`id_url` int(11) unsigned
,`id_content` int(11) unsigned
,`id_parent` int(11) unsigned
,`parent_item` int(11) unsigned
,`parent_level` int(3) unsigned
,`parent_ordering` int(11) unsigned
,`parent_content` int(11) unsigned
,`parent_link` int(11) unsigned
);
-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `navigations`
--

DROP TABLE IF EXISTS `navigations`;
CREATE TABLE IF NOT EXISTS `navigations` (
`id_navigation` int(11) unsigned NOT NULL,
  `code` varchar(20) NOT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `subdomain` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `navigations`
--

INSERT INTO `navigations` (`id_navigation`, `code`, `ordering`, `name`, `domain`, `subdomain`) VALUES
(1, 'main', 0, 'Main', NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `navigations_contents`
--

DROP TABLE IF EXISTS `navigations_contents`;
CREATE TABLE IF NOT EXISTS `navigations_contents` (
`id_item` int(11) unsigned NOT NULL,
  `id_navigation` int(11) unsigned NOT NULL,
  `id_parent` int(11) unsigned DEFAULT NULL,
  `id_content` int(11) unsigned NOT NULL,
  `id_url` int(11) unsigned DEFAULT NULL,
  `level` int(3) unsigned DEFAULT '0',
  `ordering` int(11) unsigned DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_creator` int(11) unsigned DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- TÁBLA KAPCSOLATAI `navigations_contents`:
--   `id_navigation`
--       `navigations` -> `id_navigation`
--   `id_content`
--       `contents` -> `id_content`
--   `id_parent`
--       `navigations_contents` -> `id_item`
--

--
-- A tábla adatainak kiíratása `navigations_contents`
--

INSERT INTO `navigations_contents` (`id_item`, `id_navigation`, `id_parent`, `id_content`, `id_url`, `level`, `ordering`, `created`, `id_creator`, `creator`) VALUES
(1, 1, NULL, 1, NULL, 0, 0, '2015-08-16 18:39:20', 1, 'admin@ionizecms.com'),
(2, 1, NULL, 2, NULL, 0, 1, '2015-08-20 23:37:34', 1, 'admin@ionizecms.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
`id_role` int(11) unsigned NOT NULL,
  `code` varchar(20) NOT NULL,
  `ordering` int(11) unsigned DEFAULT '0',
  `level` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`id_role`, `code`, `ordering`, `level`, `name`, `description`) VALUES
(1, 'super', 0, 10000, 'Super Administrator', NULL),
(2, 'admin', 1, 5000, 'Administrator', NULL),
(3, 'moderator', 2, 2500, 'Moderator', NULL),
(4, 'user', 3, 1000, 'User', NULL),
(5, 'guest', 4, 100, 'Guest', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `sessions`
--

INSERT INTO `sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0034c472a054c1d03f304d63f761ec8864966dce', '127.0.0.1', 1440319254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303331393235343b6c616e67756167657c733a323a22656e223b),
('003746c762088403bf70aeea1a841074aa3a6ac8', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('00426290752af2618c5bdc45452fb1f02193c66b', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('004a41b12db5d401d2010b8b5c555a48cf06c689', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('005da085783c6c7e4b9e8d3a0155bd1bb3e2b52c', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('007914c3a834059a7b91926937869319f8541c12', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('00b1384744dc4a900d00071aec0eb68b175b5f55', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('00cd4dc1da4aae814be83b966a3b9ce16c5eb5e6', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('00d7c38293cf18d0c97f39d83169230aee0c4fe6', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('00db3a06efd27c1865fc4b9170a9293e394e74c1', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('00deb6bd2cc417ccbf1aec5b4f441772869aca52', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('00fc77c02e943c1f2afe8109713229bfa3aecb60', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('00ff3d4168ccd9ec47325e26f6a685ec14ebcb0c', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('0101b9b519e9dc8e5d974a9cc624bd53f41d130e', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('01089f8e47591b56df83934efa1b3810d4a78e99', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('010ffdde148c004453dd5857d6cf822e9ab0844b', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('01240ab2fedf380fc9889d876ba201d5c7a9c06a', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('012c506d2db2a09caceec8e15d29d5e4d7e0006b', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('017d58e7cdd0d3a88c7085b3f330599b404aaf31', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('01a3a337e7c233b6a53123f13ca3d341c97ed761', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('01c6c113151dbf923fa791bcf271e829b97f78f4', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('01cf96ac94b161309e636fc2fe1b44ed37100f33', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('01da135bbcc90a83be196a38f6f1ce08260bbe65', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('0240688e72812f949b1f7fe373f09755173ad59e', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('0245b2fd6704f9e984cedb1e7ab4921e13deeaa8', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('025e3e735ecab1677a65206492e78359056c544a', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('026050b963b16e3098cc54be6e72d7b315b8819d', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('026e08a6f5a7d47f1643ea063edeb8b544c35d50', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('027a7b1f92a30ef2bab7110a75288db500fc5032', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('028415c211e19e6553b1d9d79346ac3d8f361977', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('0289d92ad6bda52804d51a24772a0905bff76a22', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('029a54c54b4b2c7d90a0a7ef25903d839559e67a', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('02d950640dd53c84caa43f7491012c7237604770', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('02f7c1aa312cf019b2fc8acb66824eb65dd457cc', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('0337d728e21261b35013ecae95b053a8c8905025', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('033e4319cc94032f12d79615d8a7a68f7083ad19', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('034347342c2cda70a81af395b8ed249b5e784c6c', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('0357d0f9f80da4f201d9b4bdada2960f8c5f2762', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('039dccac1cde6549aeed9ce3703f586f9dd390e3', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('03ae3fed5b9a8f586a2072c6ac54d0d8bcc082d4', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('03decbbb078e202760910d1559d9b6bb0b818965', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('03fb0ed42a9dd1ddaf30e48e088eb553202c2569', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('047d02ae4cd715db63e3941a26ccd29d30ef20b0', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('049ec7d4b02e6fe38f57c6be9d6899b097e8154f', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('04b033130d3230a375e9e53ea3e1b5927004b98c', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('04b19eef721574da7dab764fc395eb28e3f6cd56', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('04b9b0427a1e2a7779512f18ef346ab12c737a45', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('04febefe945cc366726aab46bb50629b736b3b33', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('05203bbe716a476ececaeaace3be20e7913655f7', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('0529e8dc94e6adbdc50b628877ca89a22587b78e', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('053af2f28773b377779833acef5b3f5cc8f07543', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('055ae60742702897e1865a05521aedd71aa63821', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('06068c279551980c53cbfaf1ce5baa9fcea043c7', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('0608ec23debea75533fdea4fb72622ef11117ddb', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('0621050a087854cca9c2b8f0492123e201df803f', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('0623f1a59370cc801b4ad407e3f0af6b9b159209', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('0657997bdf62083b3984b8828d88eaa1171a8338', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('0673475a51b6503d47c663a86aad4ab85686d087', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('06899ee5672ecfde9735fa163ac387a71e20a481', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('06a3e2cb128d6998ba2b50e02e3b961061e6306a', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('06ade0fb8fc7887c836a00f7cfe6df87ec9628c8', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('06b08c6cf96bc4cbbbe18ea4ed7ec521a7356eb9', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('06cc85c2a7d5ab6a3c3b39790bfc8850a04baf41', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('06ce2c7b196352eb9e03e3d6c9604fab58e2f263', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('06e1871ed246aba8d92013935e5b8b9242f665bf', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('06e2f1f79ab29ce6d979bdc9d0721d19472b24f7', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('07007163ea7ac2f6608370463cdc967840c03a5c', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('074f1a02ecbeaccce3f5c54cc74502e8377049f2', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('076af34c6ef909ab66b15fd4f66c939a16f6fc1f', '127.0.0.1', 1440270309, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237303033333b6c616e67756167657c733a323a22656e223b),
('076cc25bd60290217000b86c54217934f97b0018', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('07815cca24bf8eec47826f6cca06aa1491563a2c', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('07a0832b4ddf678537d015ec9cfa835a5c3b5956', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('07c48b96b5fdf98405661866d7074f28613aa5d0', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('0814c62e36ce8adac69af2950dd7bcc74f1719a0', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('084fdd7b1395ae402b25c12968b376513375a18f', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('08529091a439b5e824a3801e8a34589fac54e12c', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('085f85579f14490e9022f5150eb4e513e0a162f1', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('086cc2b14c587847234c578601495dbfbeccd7d0', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('08856cbce633fdeeebded89b7f4b2c699bea892f', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('08aa16a9ca37018e1d2dd88dca56b4f6bcc23172', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('09116d2cda40d67758b97270f5f805d90d5a1688', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('091e0f1baa3a8e91f8daa40a025a6c5df5878ec6', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('09630a73053915acf9545adccdc32a9517990473', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('097fb1eb411311bd9a197c7c7139e9efe26f9b20', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('09df3870b26f76aa9fb71a1b91d4a4f89227c453', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('09e97023dc8e4dd2fcb6805db6f0f2c77220e28d', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('09f1807c4929c24e887121a6f87ddf7ad36a75af', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('09f945d43a50a8020a3d0a773f7d2fde44fd8f68', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('0a5b389b3cdae0f323473f22a8139bc606a0812e', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('0a66ba3aa4e83d313b88fb889b580bf9a1095054', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('0a7f23472120489cf970066c1d9942b7e4ff3964', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('0ae60bda794a96a33a97448c2a030215b6c6894b', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('0af3fde996373ad81101bb0961a4df14fff55888', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('0afbf80d71b1ce68c899c88f35f4b78f9700bf53', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('0b14592472e1128ee9da4604230a34a2fe5cfb6e', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('0b46f24ce7ccba6d72bc0e8d7096d6712c45b50f', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('0b7cdd5e480221d9c43aac50184e5a3f78d436f0', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('0bf0bd545251618a82aa4c3b302d07083a7afcd8', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('0bfa92e2fc46d606deb6346bf754b2e05df79ee0', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('0c2bf2838c2b1c8fd3ab633b75080ae3d96b2cbb', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('0c2d3216fc960dbba1c9106d9343e5ad8163b79e', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('0c37924a8eae974362d81a93e70a2d676afaa439', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('0c3904a2981e98d75f3b200ee488f0717fef8bb3', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('0c39bc3129986962ad4d0ab672c8182c99fdbaaa', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('0c8c69868cf62ef4b0073b81502c385a3b0f543d', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('0c8e7a9bc215339f2361048612c1667e0a1ad11a', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('0cbc052f7f62e3a3bfa164f5ed90ef0ac9ffed62', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('0cc3b138bde5a7ffbf1b761bc563c3befb117d61', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('0cc58b5530f0b81a1711452043643b6d9d25ae94', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('0cd37d402a2f33ff3d52c8fb2a1d2657ff823ff2', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('0cf3421b13982cac373b474f35fae9e959a772b0', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('0d239ff0d99e8c52d617ad2dd5a7a5d7e0beed1f', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('0d3c09f6288e287e95beb485f04c1ff330387691', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('0da8b202476bac9bb4f47e6513ac1aea3363b066', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('0db0c9c62953ad4cc14cffb6f75f7e08f127ea58', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('0e0f35445f4939cacf844ed85bed56e2fa697f34', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('0e44ffc7e9b5fdc2577d09416baaf63ecd3ef7e4', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('0e51acc8172d3ec5e6b13349b02d2ae1b6c0cf53', '127.0.0.1', 1440265356, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236353038383b6c616e67756167657c733a323a22656e223b),
('0e563ed16de3ac56a1c8788121e2ed98294d974d', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('0e8461bbeb61f8750a0e52f3ca56df2e4a5dfa73', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('0e8d2993788915e4504b2dec7c2a42a0992c0808', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('0eaaa2d980dc51c473f03b7de5056ec94bb86eb3', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('0eb66fe3243fa9585e76bf4e7bfe4573770ed2c1', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('0ec09bba3d8cdb01c6601b9ca8d74f9cede265de', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('0f041ff3792570f9c165df480fa4f297316b86d6', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('0f80c59cd6aaf2ce8dffd0052ec907048e38ca21', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('0fcb0521feff85179a72cc173b85b9d50982425a', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('0fe9ac1eb2b77165d82c4e6f27b0c9384c52b76b', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('0fea3a798d9542980e68c495bdea04cab81650ac', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('1022e7567684cc2622576a54a1f2dedca79a9c5a', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('1038ebfff31a88892162f717affaa33712c2257a', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('104bd489de0377dcad52e2d5753a2b80a5ac1def', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('10a031616a2d2517713d86b0ac2fb124e3f4f840', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('10ce2389c2a53f42f96364396131fb9b98b5468c', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('10db2801409fa65ba4954eb429c2613250abf5be', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('10e0903fd15de6b278e5388372a5d29638ea2efc', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('11278f685abc830a4699e8bda78812cf4cbb84ae', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('114f228fd0b8a0a5a4cef9bb1414123a384e2164', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('114fba5bfe0686541628d07ab2f92d4977a60fb3', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('1174044c7f3598bc47058e46651d38c3e9a9704e', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('118774470ce3ca1f64e9eec0bceaad2610a6f576', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('1191d63be76baa5f570201a398bb9e149314c278', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('119c1f3068bdc8e11a88ca091f7fa8a76937fefc', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('119f2af45e8868dc7d072414f654a567b61de4db', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('11d47ae839f7e0c008e6a8d07f403d67fc39c729', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('12385ddb4e92c3af437c09e10635f95a93f30731', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('124174ca38032d1d5a0ab19d8b07c5e48181928b', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('12702f0a41a3e4cc8ce639a159c6d3c3dc4dfeb8', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('1286dd6fec8e0b4d45c39aed38e16cb7ed565674', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('129a43e5c7f7ce333d9d621cdada361db2a087f9', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('12ad900ab28cb4f610f972105c27fece7db8be3c', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('12cd603fecbed3f217a68375e488c4d9609765d3', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('12cf81f942a8f74297f133af5c9ac76506aed41b', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('12d3135b65140df74f42b3292bcc0d67e7104f2e', '127.0.0.1', 1440281082, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303238313036323b6c616e67756167657c733a323a22656e223b),
('12f3da5a4907ed362942dd25f6bd08af18c0dd55', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('13217ad3d12211755efe5e7f1252c9615fdc3c0f', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('1341977a13250cb20268f1576a6b63f654d82d56', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('134af1b24af93c634b9d2613aa3450e8a60934d6', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('134bc682c8da44aab4a420b8262c10c03c80a437', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('13d63bdcd1cddf7cf7e9712bb05d25675ce73744', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('1488e24a66cec58f070e5ffa61b4cb05fea5639c', '127.0.0.1', 1440271103, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237303838393b6c616e67756167657c733a323a22656e223b),
('14b57239e967b1b731ff8f9d1bac31680d081164', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('14e1d584749581424af0674d4a3e447efd7dcef0', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('14e1ff6f2bfdabef60cc6e67c383b06e9b684e54', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('15254458aa98ac322cef0310889351909b2fea9b', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('15447c5276c1abc64f3ef5b4774385fd486ed424', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('154e159b86a68e94e2a2ffd3e2252aa076ff5133', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('1556454f9f92aa3d98c40f11a4668a46d59b0d58', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('1571065467794b3942ec74cae0e2b85a20b53f6e', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('1589cc9c94aa8d5709395bad32cbdd38c3568107', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('158ee065c43b6c527b8c4bbef8dd8d26eabbfe49', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('15c81710b0767f386c4ea97b2d7efa239fe747fb', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('15d7b5adf77b985c45335e5beef4ff1b8e2ed9c1', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('15d8f58d7266325d60f1e0337520bca43e9f115b', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('15dc3f0afd95cc3f896c69404470cbc58804e492', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('15eba7a8eac0c7977318978a373debce3eb03b73', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('161ba4d3775a070827f1449d76a16273add231c6', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('16229c4db3a35e04733d1bc5da1e801a1d0f653c', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('1675b6d0a00b785b1ba7879e9f17c00913aba670', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('16d302d13cfee2e3b53a268f016eb8f68bec9f80', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('170dd4bb9aecb3848c9e7893a5cb55ec2c1d6de0', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('1751b100b3199d138d03e4f3db0744b3370d90a4', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('17565ddd7fa8e7e1d5dbcde6fdd299eb49d5f5f0', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('178571615215e331a0353f99737596d50bcc0dc4', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('17a5304b70d17daddf5cc25272c9a0a4a550fc48', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('17cdf70ed2afda45de2dbc46903f5570c53ddc11', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('17d079c6acd54fcfd51e2e455e7e298ddb75b716', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('1805f53c0f1a64777ff1bfe12f8956a91ffd8d5b', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('183065a5ca8575fe7d2d10f5d17e0cedf235e11b', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('1854c75ed3fe2d2f8b1bea5250d2363f89efca5b', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('18551a1d209ee6369859a4c14c269474160c5684', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('188ca62bca0eafb65e8adc14fe7ad877a2357846', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('18ab9077129d1d4e378c7a93e51156e1de0d2af8', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('18b398705e43fd6b9b28943acc5ca0f00bfd6735', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('18b4afb1241466e9701d15b63521e46d98ec674e', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('18c35c7c2dd980e9112a725c9db916dea8cba5ba', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('18caf59c1f1c672627194f60017c99e8fc7f22c7', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('190022448d5b3251151d435d722b9d73ab83f252', '127.0.0.1', 1440269497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236393430303b6c616e67756167657c733a323a22656e223b),
('19015e0e08d93ccfad3fce67611656977c2de794', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('1902c17dd4f0dc7f4e7b222ffd69c305c854f42f', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('19419aeeaa8b195ec412b7521d37b147c36c6b8d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('19583a9f9f130b84a2eaf0370ba077e00e6b3885', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('1987d9a767c410430792947074f7bf227aa6d316', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('19895773fade8cd89490920d9e2a781a4a95adee', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('19925c0b204d7b80cb2419ba90e0bbb3e9441bec', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('19a76ee3d64efa6dced4c1385add07536a13b153', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('1a05538f400a912ded8f29c18177704ee4a92277', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('1a100c4a662422993f517d6d40996a313ccfbf65', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('1a2846ef4769a392cbb93a558c74010bcf67b9ad', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('1a6396a7b27c014d6c69233346fb4d085af240b0', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('1af623826e9647b710a0a9ead26d1b00e8556da8', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('1b0abd6f96bc271e66cd116cee8e890636e58c33', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('1b0d34932d6d858228484e7ac8407d88e5e1a352', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('1b2aeba56ca0db159475427550df6a20122dfdd1', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('1b2e5d7a6510a93960201724e97bbb7bf5ce4d5a', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('1b32defdc11e6f138a6aed629d2c18f5c6145d18', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('1b5fa9e4215139498772ef2814defb13857dff31', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('1bc96dab256c9299259c8614c564feac1e061fbb', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('1bfe6cc21d5fb03c10ffa87f641250e90247223e', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('1c020d29f4470a6fffd1ba49643b7f6c31836821', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('1c3476ad69c030700506de936d28ac560f03465d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('1c6f29a391c0e5d52bcb85672d9084549c18ba6c', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('1c7139d1792d3b140a340c737b47e6ecf31601f4', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('1c7345ba9f71c7c55313dd399fb9e7bb70f5a2da', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('1c982c7c5acdc58da1670af1c5295a2f5da2f845', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('1ca42995584464acdd1c4a5af23ad700e4092949', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('1cabdf2f0fa17d366343ae6d1007397265ad7bb4', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('1cc9ff4c3ec0882ea1d3d7372169b31f69fe1e8d', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('1cd7a1e2bcd7d6bf0304d0970c2b47d7fe3cd033', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('1ceacbe1c2233757e3d9c1b60f00182f0e47db20', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('1cef5ef217d20e914e4501852e7afb619e657389', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('1d0091a3ee387dd657ce838e743d1cbd71570d4c', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('1d2ac56c7a9dd325c28cef75dc023feb5e84d0da', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('1db9410dc79cfd5f55cd321890819c6893649346', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('1dbdb5d94fd22d1cf0918fbf5e145226dd12f7e1', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('1de2bf7daca8c4983851acde19d473b9f5f47d63', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('1df5df7b809640f6e23f8d2b810ee0257b662b1e', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('1e23ee02d88a8f321766aed38a1ef4dc67154f89', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('1e4f9695ee25028153063b1d1759b6e084880be9', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('1e88f528e249875be302ff8996e01ef124583237', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('1ea44158eb35fbd8b570a912bbdc78cde985e93e', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('1eb7621ee3b5cdbb4f3a2074bf7e3947f1f46669', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('1ee2a886cb3312eece1b7e96acafdc614e85ea48', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('1f576f30d3fadc0a803a7e56a8c4f558a5090099', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('1f583731cc83e973d26e0b8ae8dc8ee9fb8ef1ee', '127.0.0.1', 1440323581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303332333537323b6c616e67756167657c733a323a22656e223b),
('1f66ea82664a14898fde0737afa8a3eb59999a29', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('1f6f76ec9fad3767f7a699c25bd50a94e5599ea5', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('1f76b0cfc7c0d70f7115e2ebd7379e14eac5d53c', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('1f7fed34b321821a7f5c84d7f237562e39602bd3', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('1f90f6539e80f44996e5dedad221cfeca9f01eb4', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('1f98f48290dfa34c1654a77b0e906b507d06c264', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('1fea9d1d4d42c9ab9aef040f3dae4d6e65d94a8b', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('202dfbdad297203917d5ff5ff35e0217d40bee25', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('204a0695f6ffda4468d9f60c0de79a9c19796eac', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('20660178688e4548c6e50a69d612280517edd895', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('2081c69e3b9f53092205f7e72934ffe427edaeb7', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('208f61ba4402869e1729cf9403f206fc79d0ff2a', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('20ae63cce8676411468ce1d6d6d9b2103438fcb3', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('20cba28ec48ea3aff5ccf487dfd1f53fe6bc853a', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('20d60d2e2d6f33aa6a9b42bdd4746f049911ec49', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('21181a1bb99a91f88b5a42e62ff4ece6a902a53f', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('212055183d33f0e4e5a556d1cb309da1b34a01cb', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('213de089d3425d11a564523bcea14ab1408e02bc', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('214ae011b5ff9ed3cd0b5db87e204f8ed85964e3', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('214bc244ae3c72fbb133a38015794ad9e231b3da', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('215ee90fb692a7d090ed17c18e0e6796af01f3b4', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('217a5d0ea42162bbea50bc2dd4e2e579f63d2cbb', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('218f21977d26c74a3d6f79b4024d1cd975bfc619', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('21ae9ba49cd4974a9593f7c9787986d6b120472c', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('21b0cf4c5eeb7fc7d2ef74a3a074f3611e3c23bf', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('21f8b27db2c1a40da90118c4263dcaa3ea912365', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('22307e09c0ccf92ced2331ddb189720d21498edf', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('2242168c42cf15281ead802215e02cf0756f8ce3', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('2246a2089ac152afc79082ca820d70490f7067e6', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('228b36a53dc9d2d0b02821cfb922e22c00cd523e', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('2291c1f07617758bf3dbe3f5a5ca3d865ace2d69', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('2292b4bf9293ca311782439c33ea68bf2814517a', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('22c4b3943f006fb501c305d27ee1fb9b479079d2', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('22c5abe5ecbc0dca0f00e2dbd2242c666d7436db', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('22c74820ad9b1a51e2e5d76672c220f457da4fe9', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('22e8895a1cccba8f7c96f37f44d87dca89cfd43e', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('22f05aa98222e4a27e07f41c8b93e17b8f590432', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b);
INSERT INTO `sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('2330baaf788009a01da9cdc807b5923ad7d2d288', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('2355dffe3bec09d2434605d5211979f061dfa697', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('23884d4e8759a39c9303fa27b1a523b5c7fd9d1f', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('2388fa08a32dd7022f0b011620eb5eac59776a99', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('23b0ab0ef31a085e1d50c8508a830bf58dab9e3d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('24058fcdcddd681f0224a254cae9b12f9e0137c6', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('240af8fa96859706f63a0c2601d7364f1f99b19c', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('240e699b604b0d66d72a66b13f65c50aac4f2570', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('241199664f00eee3d5a2a2df35a0a5146bbb5514', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('241c120a7de657ec7c5010d1f0ffc042c228a2b0', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('24321c710ab23194d58969db4c1cf41c70b35cd8', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('24a6d752e234a09b312311c33ed0af8ba3c451f6', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('24d052f8dea4073674106fc4b80c67c591ed3b9c', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('24f284a849c372b0fece6e4b8a609d7e8b14c5c8', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('253d8eb954a8e5b6f4f1c59a375db30c8f84d6cd', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('255248686c6d738e9ff921000b1f342a64a2b9d6', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('255d9b00d0e06e66e777a44e575ec59d20c397fb', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('257a83ac2146e4021c5d6fc59f7c4f862aa48ff9', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('2597d76a58f883a527ccd83a797b8612f0b2cf60', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('25aa3b1dfab24ed9584e1753b3e453b5227e1608', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('25bb94a9c0004a540fb4c19c07418ac20a1c31d8', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('25e02768467653cc9be89bcff8100e28f975be77', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('25eabb96888444642d9aac6c89a3a59e687880f5', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('26144868ff2f26c4cdf4b591e0998e058be147ff', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('262dd26c6573dc98358a92329937382d2278acb0', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('26474aa6825bb7bc5277f033b7bbf454e53cd3ad', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('2656acc36455d8a0ff1cc2e9799e5609e7bde44f', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('266183052046de2f5283c4205e764aaa6502bb56', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('269dbcf89e6a279fe8afd98df1a4822a9232f893', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('26c0079e26d487e62d0efca1b5d6c3b3ea2eb224', '127.0.0.1', 1440269950, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236393730333b6c616e67756167657c733a323a22656e223b),
('26d2fd46485f4bf20d74215be046abc2ec0079f7', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('26d80498f51768a9819b999ec5a92902eea1af9f', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('26e411b00a399a18fa65a8fc28076bd32044cf5b', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('27248204882bec495d28a3e9480945cadefdfca1', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('2729de11d96c48c5b319bbe71a74ed236cf67954', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('2756b007443713157fccf3540f0d49b90a0890b2', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('27646d37173dcc4f16103776d673d9aa2d6e406b', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('2775f19f8821dcffd0746c9e286cc7320cc21663', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('27822d4adeaf091bf31f6b57cdeebaae4a32a1c4', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('279926ed78200452bb081207318bbedfeaec6978', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('27e7d7048d090bb7b1b4df45fc2265ef7b566487', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('27eb9724e46a7bc65ad29059a003453f77c57fd1', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('28038a186c289620d33fa5d5d01085305c051ae1', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('280cfe95472d036bd2e72fecc8a284626af0ef5a', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('280d837593544ce4208d8a0b3fa9c7284d1d0550', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('285d119fc27720bc13e42637ef51b7d7897b4fd4', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('28636b353691f05d996d12c9d9c50aca21ad5baa', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('2898abe7d51abb686478ac29db5cd048b58c649d', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('28ce8d80e125ede87d6131144a38e406356d8f2e', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('28d4ae4aed4cd895be15bc24820d4b818fb5ee94', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('28e10a38477fabb90f0a449d4a318ba9e5e90e83', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('28e34606b91e83db1fd2d0919c11942593c76689', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('28e4bf57639262cc4bf655155c2d9b0cc881f416', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('291d4fdffcfaadb819ce4b93ca4fbe01e40da267', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('292afe2f5ba6e6d05a10b559b584119cd8cc2915', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('292baf6a45ba82f8126e4217374645011262de55', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('2936b59b1d183c68e8b6d5e3c8f73cf375d6b3b0', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('294d4dbe5ffb86167dc04a1dc4b42f3beadf00bf', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('295693e07baa7dfc3f36dc4e93a93af1cd451e0b', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('298a380d765d3761779f6d71ffa518b23a0b4da9', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('298c5e6b24e9c6903f1f7b98c353ec40447f1f20', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('2997e694a1e1a9351eb3855dbc440b36901d71fe', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('29a052b6d40a26b4418789cd976c3e92ea549dec', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('29b29715090c0ae1b11bcc2b27df8a110c9ab081', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('2a0feb6776d8f3015f8834467a22f668b046888a', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('2a403db29637d86180adf0b40798922a82aa9e4e', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('2a686303bed26a006bcf17fea29a08cc878c0128', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('2a6936714031e2eb06ca6c2d0ed88a957cc635e4', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('2a7c5b54dd120cbd3780dc1547b8f79027068628', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('2a811e5366b29d34c41117bd0f32bd73c5840807', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('2ab999a05c46aabff9f7ddf7fcbaf5b675771fbe', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('2ad449b8fd79ee5559c8c8080a8095216e8881dd', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('2ae22f9ff87d7b2a986c1ee253cf1012fedc61e5', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('2ae4e3da5538bacdfeabc06a2109ee224db9a071', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('2b035fd14681e104ddfebfd661537e9c619c4fad', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('2b3e606e858e0e8266cef2c1ce2f0748b5144609', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('2b446012e7b5811562f055c44c7e5fe2aa58f405', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('2baa1078fcbad4e743f5dab6f9af6cb6148477bb', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('2bc514731a4981f73dd931f9c907db1225268826', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('2bd6950aaae93f03bee3b992ecf5518d265d1372', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('2bff78d1c31bf53adcd635fef5bace604ac9381b', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('2c0b7f1e8ab9d238fb96c7a422c912806a2bced2', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('2c770eaf7b76f3c74b17ccda78db3a258fb743be', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('2c913a2cd34de153845f2cdd679cd08c970b087e', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('2cba62af6e4012144cf1b1feb03d281bbc749a07', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('2cca240b1ee5a627aac65c35501db1f5613620af', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('2d1503297c1e3e6d1184b707fb311866718cb7f8', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('2d268f1e606c5202ea16e070bdfacfd0b4263645', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('2d475ffb5b44481eb909e866107e75cf7ffee998', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('2d6db34fede72727c4ffd22644e3e7cb90602d24', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('2d70646a2929114f75074945e02d34854214ba1a', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('2d74ee366b6f9ca19e74da9a0d1db2bc29a08a9d', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('2db43bdc30db3855eae9e70616b745c3f9ed6027', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('2dbf513882fee3f099e6c4b89bef2b6aa2f5fa26', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('2dda2bdc7c7871eca0a12f5145b6da2b28df2ddf', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('2de31a3b0d6d35b4f27a0080a968c4fd45c7f96d', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('2df1bfd5688c5a39d111f7086250b2e6cefcf09f', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('2e1fc96d212dc27120984e2950faa7d567b5cfbb', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('2e544f54909cfd0ea32311378ce4d8fa36f68923', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('2e5b3e3c7089717eb117ba85cc67b278f7552650', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('2e7794f69859fc25d13ede6c4f8f33a52a0f98d5', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('2eaf45c955e021fef53937db3ee9a4e9c77e1e20', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('2ec19bebb00b26a525cff062c6415c1127550e21', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('2efbd0dbb5b51a65e5a651c3c61cc24989ee26d0', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('2f176eaeb16c329274c473089c718e1fef718da2', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('2f2b4ffbd4f3e9e9374a78294d432c649769c01a', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('2f40796a61ee31ced1f6883e226d6e47cf66a918', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('2f68bc765e978ff0ede0ae9e00b304cb645be900', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('2f78e90675e9d2fccebacfbc34c6b60528b1c07f', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('2f7d8c1ba9e03b356ec129e56623dd624f42bdd3', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('2f802a1ea319f1e399edfb2cd32b716d29eb5771', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('2f91580c9174f296c14d716bac983e0eb1cb78f7', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('2fa3773f9b9d23c6872164f0cb12360156b831f0', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('2fc280e58e5edb30cd387023ae8efc9f75f500f7', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('2fca8342628c0a8e8b09d8bc369182938be3b257', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('30014b655351ca6cdeca72235e8dfe6791f42542', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('30b4f27e77380f46271bec0e57825eb2a27b5fe2', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('30bfaef530b55d67df4f253a37449679f8b2798d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('30c5e1297f49ef97e88b5bc6de60786cd0b34377', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('30c7012a76547acfdf17981028102d575c25201d', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('30d6f3a59556d4692d931281f2961bddee776e0e', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('30f464109d026b299753ed104ffe708b59c28b99', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('3101b778832d5ae589dd6e74837e86fa487bbba1', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('31510abdb47144b7b39a895246a73afee0c85e99', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('31af20f4eb9bccbba41a0c825e4d3a891ec62597', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('31c8d9ff042dfd55652f1e4a6f3a8fec43d5d683', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('31f86b5a4f7421f5f446833098421cee05116498', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('323b89623e46983fe68c793bb61eaa5ff86e6dce', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('3247b84d4bf8395ca953ba96c729cf09c798b1b0', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('32b7070997cd2ae83a1182b73bafdd2c7c1a1ea9', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('32c2f4b3ecf3c960048b04533830b1c8d3701247', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('32d7f7b6830b75451f3b29c5b3c5555581807b97', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('333bdab3a905434475e78ba3d9ccf31e8ac31623', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('334188d44ce304ac5b96bbe149e423492a7a1ade', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('334d6341c081d638e395bffe67ab12dc1289fe34', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('335318506881af20dced527517ee1fa8b949b56b', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('3379de3ab3aabfa25dd69ca3bb3c2506ee91d795', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('33b9b49fee36f2eed16a966c5f5ae659198902e0', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('33f5bf9282fcb5e643169d43efa0f78bf2ea9475', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('34201a6f9a489047a73e09c1eda52b69a8b5dada', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('343ee9c9b6816620ce47b65c4b690dd4fcfb0ba5', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('3443715b4fc1b6ca23483775ae8cd22e0ca588f6', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('344504f3d50cc53e9d69008f6aa13fe16ee55cd2', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('3457c5b2e841d40a8797c969c81ed79f655f4117', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('346853d6dfcea2b9b5ae2a4ad74b20a2d5a8c802', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('346c846a6a37efa5b8baddd918966d0d76a76e63', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('34936e8b135a2f2128af6b1ae90c6d44e2ad409d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('34c282d8fdcda34d095b2a27d9d17680b420c45b', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('34d1eee9e8ad09a74983d37a0e19ccda19210285', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('3501521dbd4d5f105f766a6d8d7fa5855786ab46', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('3553591c7877b0950eb5254843982a017b9b0c3c', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('356f7fce76dc59145ae907e98badf9a6bd577eef', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('35b093100e83b97408a8e7dfa5b8bdce75271e47', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('35c0ebf21258e36bd1398f811747fcca6612accb', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('35d7064b7ff06ddd0c070ce0e960475d0ea110a7', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('35d851f047f2b61306215c443aa78b6752c7bd35', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('35e0f72654a907c2043bb12f25147e2b6effb5c2', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('35e7ac9805b54a0a1d6bf1fa0511991e7c1815e6', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('3602e2266cb749de3db274a9b8dfe5f61e2276fa', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('360de7badef2caf6656bcddf969cdea628316ad8', '127.0.0.1', 1440272038, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237323033373b6c616e67756167657c733a323a22656e223b),
('361f305bd05410d96ebd746f97caffe2cdaa3b77', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('3626939e099bf10562ea482a2dfbb6f61228f952', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('36385628d08f531e02eb032453e0a293700854b0', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('3691ca0bc4e9a13c1a6c11c6d7dcd20592b77859', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('36ac7c15a54b120a967fe3c8b6c7f09064d81dbd', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('36c4b49fcd5154159a64ec579bd96dd4db7a7472', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('36d63089b62cf531fdd4d8ae5c5b520195a9121c', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('36ddf20f3355a3d746cdef23a3c9f06bba9a758a', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('36fca25ed76504dc4b0aaa1127cead9996d1d81f', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('376cbe8e3e7dd6cd1e7b6dfcd1efe58485c0b4d6', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('376dd2021cf9f3a5e89d189983ec4b46ea730203', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('37be855d683925323afc79e3aa850513933c371f', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('37d914a690dca3ee72bf3c34efdaed9ab846b309', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('3807b38baf87d1337726fbcd08d8bde95ff70cd0', '127.0.0.1', 1440273555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237333535303b6c616e67756167657c733a323a22656e223b),
('382bbce0fd359365803eccaa9aa8b922593bf8b5', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('38487118583dc4a426b0e7b8b92762d68aaab986', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('3886a63bf2e92b528b5348db727d58f1bde378e5', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('38b75f01fce7b19e80b3b64bb518d7009a07f248', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('38e9e1382be63dc1f486cf91da41c8b41920ea35', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('390656297e13b583e8a9b146243975d76f6c0511', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('39421f38bcb54e012e80114aabeaaa4ef1bb0d2c', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('3946c5218a35e092f54e84a0f047b1cf72b1445a', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('395a5f198d90b06e4bbec31fd42d06b4ed1f3a46', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('39673c9bfa5c7877e0d4d50bed452865210f0f8e', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('39691bb97c36dc6154a61fcbea93febb016cbc43', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('396c4d907c6efe74e9a769affb51493ff84ee66d', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('39848d006d7eb853e2c16c92faf1580735ebe85a', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('39a8fd75073fe5be14f82c94ae17b78b46b28ea6', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('39ec0ff00c96b6a2c0652d435334560020aacf16', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('39ee7d42958b9df94d635eb1dd7b20f95b443fea', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('3a0db4b076d69112dec3afe5b37f93b14ba4d827', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('3a3081e6498758ef448cd0393bdf771f252672a1', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('3a3276b2feb203f0669478472137d882bc2f9925', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('3a9fd554eefc9f75acb25690600f42060190a7d5', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('3aa27ead9c085b0cd6566a5774c98f7342e185be', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('3aa751b1fd794a163d7522c128c5af93c0096783', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('3ac074517793c68dd76565cf1fe45c7d761df8d5', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('3ad7ae16351e13807285549622bb1d06a6213896', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('3adb1c6accd915e01e639c038f7237f07f33e279', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('3ae302238599415054e173c4d67060d0846b26c4', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('3ae4cf928e39b950464c49c4b6ee995f7a8fac3b', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('3af503cd37f06e0282d3bb90fe597181333c6f88', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('3b1094ec8270c6a02cc8eb7dbfe2fa4143a219aa', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('3b823bf885cb38a0989978ef9ac6ceb4a9162005', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('3bc733256d3afbc71ed30a63c83db99b01978246', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('3bd7db6d76869746b6690483b9bcfb3c209e76c0', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('3c185c7f54bb8774f3c3d9c16ea259c8536dcfe5', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('3c22c5ce1c0c340188dcfe88fe7b8cff640282af', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('3c36323b97f07079a843d61ec4b4b02b6926b878', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('3c6084f350767fd2a56c33e6e5cdf367d6824489', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('3c8784dc0ceefc819dabe32da6057a916b0e53a0', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('3ca8660f28bed562221a042a3d59a133a55b309d', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('3d7647e3dfc94dcd4ae5b2d824956fec3a97440b', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('3daf90c1e6ac40a7ea983e189d40834b5b3ed26c', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('3dbac85ee3052179404cd2a985b06d3f32ddab2c', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('3de445cf9b1164cfd8ba069430802b64f45b826b', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('3e056cb9c71450ca88007c3381a14c7b8dd66d7a', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('3e0e74e2353b6d71a6f970e438e0b16a66fb2696', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('3e1bf5a73bc97b0646d4f2e98ff9b9e75cb18e9f', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('3e1d9d6a28e8d0622fcf98c9d095b8e8f45e5dde', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('3e2b001ae969adedeb86cb7b39f013e500cebdcd', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('3e3adf9f17d915de732cc8ed547e36a6a5c69f11', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('3e3c9ac5be43249faac2171502ac921e0e659bfa', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('3e461a28da878807cddf7e658f381c23ec7aca94', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('3e604a96a8289b45c6740aff5ed5a7aac6d0eaac', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('3ea48c05dd0b40d3df69e661ff976c2cd47baf59', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('3eaa666d57c24aee59c359ff16953e4c014bac1a', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('3eaefc157aa46afd27011bc8a0ed365065a06f48', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('3ebd9701ecd6a4dda3760d82f6fc0427450674db', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('3ef86c1c43ae35dadb81f918806def8ac8e9324f', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('3f334c8cba5bc529650b6e643578bf674c28863c', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('3f33b1dd2ccd372559f528de28bd28666e6aadeb', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('3f3ea8e283b162b1a66a785c41a299093e00095d', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('3f74017140bb80e4e5a27513dee726f2307040e2', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('3f813c718460f251c42bcf92251aed0a7712fb8f', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('3f9cea4ed56478dceaca01c783f99c5a43e1f833', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('3fba9f5c9848c45a805cf939433a691db1637149', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('3ff710b59e5a546378f62dae4f2fce0ff9be88f2', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('400b6555b905f162945af3c11d3ae6afbc377085', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('4015282770ef26172faab249c48926332c883c3f', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('40310ed501d5a524d3b6f710a3b50653808719a9', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('405d710c7e2d2bd366a36ba70746aa85bb7e6117', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('406c0efa252b9cf58d39e2ba2af48eaddd6085a4', '127.0.0.1', 1440277010, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237363831333b6c616e67756167657c733a323a22656e223b),
('40951a1ae317f49558255f8d0f25f8edf00d3623', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('40a1217566f6fc5634de22ef4d5bf4fb66524982', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('40b5ee6a0ae0a87894317cdb2ebe98fa53ef28e1', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('410bfb2cb416cc2baab8ed9c651db4bf17c88733', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('41156fdb325a3c6170602444362bb972f5765852', '127.0.0.1', 1440265641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236353430393b6c616e67756167657c733a323a22656e223b),
('4169096119f49112987f0dd543b798bc446e5f47', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('41e5b06d88e1fc59d0b5725d05e48205b5b9ae93', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('41f8907729f3b37c399f0eaac9be31bcfc3967ef', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('4277889337286f30500f03ff33199eea46f41781', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('4293360ba87f015ce3a630efef42b39bf34370f8', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('42b4337ac80e6ebc0ae5100de948734088407e79', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('42d0c2a1b4da02a0dc46c2562006a07d790de06f', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('42f09703602261fb3419c3c66b40ff8521f2d7e2', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('43113e35d3e93bfe953e6df7e7ed00a4301c9f39', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('4328f75a09748710b8fd0cc0d00cdca23302b0cf', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('4335cd9d354e62ffb3e1063989cbb709ad6453a9', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('43385f10fc2945805cb2fccbd826e17a035132c1', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('4348dfbd9d7a15bf739f22535baa8374e6228a9d', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('434a52686736ad616437039ede610dde14a578c3', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('4361cbe21fd7ec151c78335c9ff6ad12d984fb8f', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('43a86221350d49b735758e7035d9540d9cc5b491', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('43b4d7e433185aa46d65b6713c833a4b37e105a6', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('43c8ac06b597896a9b8e779b7c9944e8291bf8bb', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('43cf5126b7eebf110bd2e757f388cc790351efef', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('43f0b80b93ca84075d88acbdfa70f6c48433df00', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('4419929c1ed96fe8f33b538866e770b802c5cd05', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('44477be4c95af90bc402486f226680c58451fcbf', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('4471f362d823285e7721baf29cb7ba072d5dfbd0', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('44b4ae9c60f5fd3bac5dab0a7fafae62651f11c0', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('453301b8f80034c38b03f7454e2ef97cd76fa1e0', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('4543e4b3d7b3c03b83142449e89921c0ff8eca3a', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('458fb34249dba2abbd3c1b63deb1df0486db673f', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('459d3cecf433593e1b1b9b6090ec2dd699e15976', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('45c5cd213a7293a3a5a74f5bd97abb7639b5f22d', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('460eb8dd3f701b0bec657da13fe0ffb5fcae759c', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('4636cb4c82c6c1fca88016d6390f78250960a67b', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('466edcf7118b7c457394adf72d028a34c455b1b5', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('46766ec61fe75800c9a4072cde9c182257102f74', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('46b816b3b72e636faf75144ab1a5cba4a9984aac', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b);
INSERT INTO `sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('46bfb7c5abe1f2357d8ba63230b204b6f7b0ba77', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('46cd3d6d0bacfb7460a67bc93e31eed4db939b8f', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('46d5f4bb7a869f467200a2271e1f67ef937144aa', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('46d768f2795272804402dcba39bef3ce309aba62', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('46ec1620b850657e39a2698d9b550aa3a6ae02ca', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('46f2333b189210cdca5a2170325d03bb0eefffb9', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('46fb1a9e661c54ef410214cf0934af157f64ac9a', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('479172a57c610d92e0d71c7e63c24e67f2f519e3', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('47c29d6bab8695dbaef10141e561874e9395497c', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('47cfff8efabab0728a7b38714e785f159d7dab91', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('47e083ebb8d7a00013417268041bad0c2d2c71e8', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('47fb690c9c6c2ca10248f1cb8ebf2d53a8e175fe', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('48311eac09cf4a2a7f7d9925d66935a7ee200f04', '127.0.0.1', 1440254169, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303235333933353b6c616e67756167657c733a353a22656e5f5553223b),
('4834cb74a9cf7316e9586880ef3856b4432675a3', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('4853165bd6e2a514a0d6802a263165ca8beb8388', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('48705a72ac77a5545a0288ab3b9df07dee575357', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('487d4647f082ac1469fe02b730a629d9b460bb86', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('48834fe70b2bf66ee48a49dbc4eb4a609d7d4667', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('489b1f04940a915f6fa45d4fb37eb7fd4001632e', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('48a543253135ab9058df0278f29355d73c4e7f95', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('48ce3fc3bba7b5da4caf64015423a61721e54590', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('48dc1b5893b598e35bd3b75601cef9dfcfc9b0a3', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('48e63c805a0b616bd0f7824c4e6d8a1a5f0ab4ef', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('48ebc143327d79c6f063672c1e7801860ca1ba6f', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('48f40b20c584555f35c8e254d1e2a5bef9523026', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('490e80a39540e5e911c78a33b63e275d48971e4c', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('493c82d0de2c1ef29106f4bc0f6c901ea6052fca', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('49869e9eb5e78b632b45bb97d71e2c9c22c13ac2', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('4986c7ec105b4c30c6808ed06daa1f80eb3578e0', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('49a81a74744378ab80be6782199805e39f850be1', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('49b2b936fa7b80c2c127864772c1ac11889b8bbc', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('49c694920139e3ab06c05d9645aca343acc0fcb0', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('49d901ba8803ef834128691a23fdf73db579e56f', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('49dc0407138a50226d4c7d8c69c6878dc5785b46', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('4a1489a6ec5eae96675d3db0178623f24e9ea4e6', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('4a27966a8a949c21ea07357c15feb1a5b7c224b3', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('4a482d76c6f02daf8cd4ed00c159704a0d1c3059', '127.0.0.1', 1440258944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303235383931373b6c616e67756167657c733a353a22656e5f5553223b),
('4a68a3b61326caa6f1e8e932327d2946b0f25213', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('4a744ea060dfdd9d353095f71739b28596d71ee1', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('4aa101bce2911f6ed030d9c81a2ace484ad4da37', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('4b0714ccff4e2d3d664e766a337279600ed81739', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('4b1f95d86a285584526f2f55e0ea4069de150113', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('4b50eb94129f031924b61d79cf78c925db83bd8f', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('4b567c8c8b263392a8c72b1d5aa8e36b3b517828', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('4b683a194c67a5da643fcd7ed5725a8199eae72c', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('4b94780275de28b9a35d916d06f21c53fdd4d7ed', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('4bb1660e3da94ad909059feb6b20e21c63b12b16', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('4bc2ac77b1aaa0e0a5553510f67bdaa4a187926e', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('4bca09a5396451db7a91752dece8a4589553321e', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('4c255914ae629217a49c412eb005c891f281556c', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('4c44d309b469924454c10c315af6f9b2e1668776', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('4c56aeb6ee016e26848b9b5a6693e79845a61fb6', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('4c995f1a818d0b6e0bfb0367560c4c7f3ceb5fee', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('4c9ce9d81dbcd357ea9bf829a63914c8b8a4c2cf', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('4ca9adcfc3954701fa4b3340c37a528b7b9d57a3', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('4d027187edb4faacd4d74116b081341e278c9f8f', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('4d262af48f1d8b6d5107854f47bf76f6eeac2346', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('4d27ae4487a9e18ee7b22f2306fb08c3c3ecac12', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('4d5f5eee8b650d5eb09233c2d3469f8a316559c4', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('4d74344152b8c1e52e78cb581731925f5efabcde', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('4d89f132bfc3ead80dcb6b387bb6992df0142570', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('4de8ce1746d0e1760270040bb8026cf6159ca26e', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('4e068eeae1e7d6b2633683f43a95c8650d85be1e', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('4e21d605ad3079853c12fb207a853fa243b1b48e', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('4e3cf05d23e53813196d2bd3d3a07c8752230a4e', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('4e5c03b98431d1026847000adcd155cef57f5f42', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('4e93bfd7b7254f00a2f1bf1b4bf7f13d1b8bab15', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('4e9a980cc9ac8336ceaaa658d4c959f5a23b082b', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('4ee3026c17f6588567903dd4e1a631ffd8692b0b', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('4ef4edbc63b4b6a5ad9ea492c268084f20e48f4e', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('4f170b84ece64c52768c73042abc42ff656c53fc', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('4f2c8da0f3f4fd4f836b6814382a83b7cd4132c3', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('4f5795a1916ee4fc912049d74fdce45e49ffb815', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('4f6e0078f2dfe204e0b1d1d5b6d2b1ee335ea488', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('4f81bd4f1fdfa00f7056ea9a7458cac3bb7bf929', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('4f87a0c3227692cca03818aa0f15f41075ff57f5', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('4fa10dd1ab5a3d4567108ae63a946b63d1bd83d0', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('503aa12e5a0c67d12572fe7613f36816b8c4dfbc', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('504af204c1857a4c9be4df1ed519e56bf13b6bec', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('50608969f1796d230c3391157567f3b849beba9c', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('506c146694123551159fe700a882d1e7a4aa5a3b', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('5090e603b490c312add01082d9b3d6b69a813b9e', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('50945ff0029f7196ce7709987b8d8b6461d70742', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('5098429b10c297fee7b6dbea3f95e5f5f88f3ac1', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('50a266e85b95364cab80fe37199dd362223fe801', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('50ab6f7863128e7b69e3c35146e6c2cbcdc0e405', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('50f2c1371b17ce8079641d86e07fd7ee5e715d5f', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('510e20a9c05a1b6fd11c2be23d81771e09b95f5d', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('511141dbfe1b415a4d4a813cf697b48e8d619025', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('5138c80eba25c1a417512d66f3f0ed30cc74d4da', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('51b4fdb986d7c7fd6a7aa30caa7b4364e34d137b', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('51f2ad1b9d84f24b32809bc010cee749dd5477d2', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('521a78b61d830554d7ca547c3c151c51b2276bee', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('522f9d9ca4e2cf8d392db7caba6c06537ba83946', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('5268da4486e158b68b599407f6d1a844d8807e5f', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('52749fddc80700d3051c51c10e44b09bc2ef6346', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('529e3ea3c931d17b826abd425442ae56172d36ab', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('529eea7b6a31498ed83728f662fd561876519b60', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('52acfbc49220dbe9a893c268aacf5eeaa5eb462e', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('52c18feb28dff53821be00461af7b6ae90eb35cc', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('530b26e673e2105bc3435a935eee8bca75ad0fad', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('5387692ac8c080b4ff52ab849de2e8f3f1efedad', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('538cee64054d9f10ab1c2a52feaa8ee25f0d9c6a', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('53aa9680620b6f6b396c9c862e375e83203fb959', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('53bcb5dc39675af0759b5580822afb78b0f89c86', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('53d0e321e5dcb543b5bd85e45a7fc1d6ddb91f19', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('53f528fd224ef9c9e1865fe0f8105e8267486a0f', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('5440a029e82e8b4903bead4b62b6d3df5302d8b2', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('5448f2949e624e7e533d475b9679f0de24ceb329', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('5488142f8b2b9d17754883dfe5be829d34001796', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('5494a6ce563d10bab975c90513933e41654d6fe8', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('54a9ee87b5bc0de8ec9e5d6e1589656a69e262b4', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('55150850667a19e11b12cbf08914be104d7ff370', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('55574d80f88f7aa21f750e8cec3cd2b39fdbaf99', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('555d11776eb35d6965f63b33df72363156db98b0', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('556942f891837e23e9cd39c1f9dc234a36274779', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('556ccdbbe56d67bd80808c13e8c71fd4c3bcf2bf', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('556f348d5c02e867094573beb12135c7ffde5603', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('5574ccf60b5a368d9ae11a1df321f84d62246758', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('55a04debf4cff1bef1e332871b770c8f445d6a61', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('55b8b8ff04ff8f1d902fc4feb08c3d396f430f6c', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('5634cf3b85f07a7524d631c9f60809c2c24f27a9', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('5649e8b35b645fd46ee71e987849e6239ff5c8f9', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('5669ab46a9cb619024d3edfd0cddcf114085fe50', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('5689a4c0f38b0932d723089b77bf0dcc053a4edd', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('569e81350aa20f5cd11b233b62458e2083ac6cd7', '127.0.0.1', 1440263997, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236333730353b6c616e67756167657c733a323a22656e223b),
('56b916ad45dfb04daf1e293e9b8aed68cecbfa74', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('56d06f43ae331f98e7d98d4e450aab171df033d3', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('5703248fc6e45d282cf07d25392285acdd5a6734', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('57114bf54245ebe892127bddb3c8e016866c3276', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('57637fa3f8f33d83a3bb77f621cd734c4aa954e5', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('57879e0bec8a1f083bc4d31c3eab14c80b7edba9', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('5791ca0101766e8ccb47eb3849c7aef81299a4b1', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('57a0f47e12302e787ad7556df60141d7cb25b844', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('57bdeedbb6f75bfc887ec3268b01475c35677a6f', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('57da70d5e6ba1273c0ba43a9abafcd8ae6a92769', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('57fee55d333d74f573ad9d687de98b387fb43ae3', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('58195945a5d86f3fbde092fc595a68b53e807eaa', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('58204bd25f780ac372e859d847c632ffa32e6187', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('58268da925d18c09c8a1e897d5c292c6561800bc', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('584b78b7c11e8230099ffba0840a49810363212b', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('585cb6ab52d1076866333889522cad4849c53e83', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('587ceb0a77c1a43ca661d652f933c7a849d20d59', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('588288ac4a58d226525973e6356990e61365746c', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('5884ac70a7207ffc9e84473fc04f77627fea3346', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('58b3de155b694729e6ca136c2585d5e219ff1ae5', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('58d3a1d39a57e031fa1872d5e3a53b91d0a23c60', '127.0.0.1', 1440320421, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303332303432313b6c616e67756167657c733a323a22656e223b),
('58f49db3f1a84244978b43219c65b427b2345a69', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('58f9b8c9008e889f294d610ca27bbfd8c6177d3f', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('59050b38ae72a6bdfd6b6dfbaea2ab2d2ea06350', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('5929b4a249c0ce3de64d908060bb24de0f90569f', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('594cc8db6e7e507649980d2300b17d38256e5770', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('596361209d98fe9de4295508f9f8220e4a3247e6', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('599cb4930c89b964c047e75f85b9e67dad45ff48', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('59bd591f8b5531d99bff9f863975f5d3407a682f', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('59c6bee970475838855f3cbfe2bd5d7425767387', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('59e431338f15ed4c95f1bbd727cc8a9bd7c378ff', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('59efd2eb4cf636023af58443edd858bd6b551345', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('5a06486868e7b2139e6c4ebf6154bed419f3f0d3', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('5a2f25a916b11ceeff2f3c66f133b93b3488b320', '127.0.0.1', 1440267899, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236373839323b6c616e67756167657c733a323a22656e223b),
('5a4e05db712cfb1b895a68ac431df19a05989469', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('5a50fa529623267acb62161a36839c50af058434', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('5a6bd278d1dcf7330be1d6175c7383c503e37ef9', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('5a994bf2d052527ee8835c9cb2813b13edcac91a', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('5ac73420675e6fc6a4c0a813cf08a96cd715349e', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('5acc9696a5e00101f5b50c23319d144bede7751b', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('5acd096289972ff41c8ddcce42c81b972537c7bf', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('5ad2aa05a7da3881c178969187496d63585688b0', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('5ae581b5bc97f2c7de28c8cae2d162addbccd4b8', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('5b16021faa6066720af8656f156d6691e9575cf9', '127.0.0.1', 1440269030, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236393030323b6c616e67756167657c733a323a22656e223b),
('5b528cba05bd5431e2f5a27ead3f41a71d41de84', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('5ba8192165ae28f03e217f650426358eea6165b6', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('5bb8704832ec42d51359c680460ea4569968db3e', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('5bbe4436fc5559bc7eb5760f1616f885a83d5765', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('5c2b65462bd191573736521a28f5cf0daffb68d3', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('5c47210ffa0bf0a11b269bef5697abf9c036575d', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('5c62d17522edddc86d2f0da2ee5d7a2eeea0ee38', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('5c66b0b57bc0c189f07787539fcfb6570e8572e5', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('5c800c048d056dd73504b4a07f4cd308c1d85dbb', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('5c8e5121f5eb8f382b37fefc9e282621ff4f97da', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('5c9d5d6bbb1c997c023506e5692f81de4162283b', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('5d088eb77cb50f99d5210bbcb74a875dc78c8a1c', '127.0.0.1', 1440328870, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303332383736323b6c616e67756167657c733a323a22656e223b),
('5d0fd8f2909e0f0375d1fc983d78b91433d0aa69', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('5d47785941a58af037f9d727b926eacacb69b8c4', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('5d48e7e851d339e99e75c1ac83ff36cab74ec35b', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('5d81bd87faf2de9a270cec66f9d05269defdcefe', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('5e00b89cb8351ef3002b0469940e31149fd398ed', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('5e2c0963220e05b7e46a619c997622890d1005a3', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('5e69fc4a66f246414084a9854bd2cbf614bc3d30', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('5e6fbbdd240671efbbc242a665916ca66f45f473', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('5e79727ea508c9da0f0da7e5b315dfaeb3bb9612', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('5e8fb7965c5470aa2cd42d914f7319467e1a5b35', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('5e8fe5a71f2c82d761f513284898a2a4bc2938c3', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('5e9e829e2a3c5e8a05e633c1dc1e9ebe04da548a', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('5ea7d7ab26319b8b670c65477f93bde6c59cf754', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('5eb4fee78b6306284d55df3d19c8aa808249c964', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('5eb7ed6f398c953d5bb3fd29d3d4e77bf9c6d77a', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('5ec541ab65bbce0626e9705c175d18c7c11a3b47', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('5ed31fab70c44c94e456783f1c5a8002ea098268', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('5eefeefd699ff7d005ced5f790ef51c7da58910a', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('5f0855dc34252112b78e0691d6d780dafbf6a7d3', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('5fa39e429d875fa9af0b678071649096b3c80f45', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('5fb09c24ed175a6b41a535e75b655e0dc786311f', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('5fb9dba52621cade3c64e9175797497d97deb3a7', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('5fc171795e9e34a4b2732d730660b80e9ec9dad5', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('5fceb1b08634b1935cefcd8f9d62c96891ab326a', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('5fd907fce4b73d2169ed0a094dfe2f2146f4a89d', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('60202e0a217f76a96b7f511f2a75b532818fb0ac', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('602d8963b2b57f57a63237cff807fa0d2f3c16c5', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('605bcd0c55ba4f86d595e2eb02fcd23691e3daf4', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('60796e3810726bf893a918b60965dcfbd27cced6', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('607bc1f8b033b0eecc559dc9bf50b41732490ba5', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('609d6bda48a2c4893221fbfb3ca194884a50c8df', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('60a5ef5277610cf713443fac2b69755ea13f7614', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('60abac1d2a5d8d00666825f1c45f1c34ccccd1d3', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('60bf8fbf9fcaeb36cb0754438c01164cbda6690b', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('6133d4f5c6d95cd919d73c4456d376f390ed1640', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('613d7e2dc84104128f273bc8ae0a2a7bc6e3af33', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('617e2db9dac802c350a416f3dbfba3abdd68dc3f', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('6193f3f69126a6e15d7e022f7203182f6131a34c', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('619a561ad90d954b337a18edaa8a03d55cfafa34', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('61d7a7a81c778f6e073f5067c481e196bae73fd6', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('61e02e52022c82f0ed4bce746c0def208c8d1d7e', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('61e0db1eb95117ff82a780b615256172771b4fea', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('62196a2f67d8c9864360307c842729a52e27a6b4', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('6232ae39c0bbbfd01fdf554aca6a5e6d715ba847', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('624c8e4adb9083b4ae09435f5be14d7836f51c3b', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('62638254f8cb45223172ce2b9227b4b7475ab3ab', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('6289dfefb427b49784041f03432488696642d18b', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('628df767288cf7ce18d04c4f885eeda690de90af', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('62b14e1e7fd58393e9a72df6698f8631d2b47a5f', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('62e427bb69d253e32b22d9933095985bf2124bcc', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('62e6ec162868adf2cf1647a44544bfa1ff2d6f9a', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('6343496b1379ebb7545ec3faf7b4562dff01547f', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('63a1f84f84a40fe1ee5d7a82025b1e9f79e5067d', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('63aa065ca73a9f0c211f33cbd6ceec015bff5afd', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('63e14e5f604a766d889c56bbee8fd0fbba06c68e', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('63e90f347ce7dd0a383c769d107ffce0956b4c12', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('63f70832655b56b106e4eac848437088b2b96dd0', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('63fa75dbd6ad833bee6653bea8e3d083ee25b12d', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('64007cacccdaf093ff26fe7655b6ec6874496f87', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('64035e202bd5c6a8050b58a171c09539002730ae', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('642ccaf4891f7144765c7fe24ac6302e1334b5ea', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('6449508dc0a18723970ef52abb0ef407b33c40ba', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('6455d6587edf60d305984aa8dca501049df24b0a', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('646c7860c551c8485189e81c845b32963fc4ca3f', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('64d8e7eb220994734c5eb85789e19f36d891446a', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('6537a0a74abd267cf6edaaf592b068e0cb67ed57', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('65394428808049db51ca70c7b669a10da444979a', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('653cd2cb26311c2c9b81d7ac87d19a077cac40b2', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('653ea4463390c0344bc318dd4b0aa25ce50671a3', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('658205cf3422fa05378bff115a16566fc4d0ff0c', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('65c4c0e4a03d2c53b7184c4dddfcc5a0e44e5cb6', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('660620a0ba5a7e0e6b360d0f6506517714f30443', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('664fec758cc4fda8ce1d9e29bfc27c740b4733f7', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('6657ad3d455e7d4b4539a2c433c0413c5b14c4ca', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('669417e414591da22b52c4515c520c365de0a0bc', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('6696bfb4db8e4315d7944f51c873d546b56d3177', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('669d4d806ce1e90804ad1a454c94a7a4ee323d2a', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('66daffa152ed3159ad3ea309299a1dfe693fdfb3', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('66f60c4b62c25f23c9f6e234d1e25eb7c2067ea2', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('67061102952e4cb2e3018ce03e8941d72fed5328', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('67364f9028bea5e1162e9220d37809e69db483d4', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('677e51e4d8d4e2bfd7ab010497f10994d009dafc', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('678cec74b437385650753f1a554fd02deacaae9e', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('67a5aec352f02fe2905f051f7befc6e4344b8ab9', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('67bbc79cddeabb89c45079ce19d590922dce7a0c', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('67cb05c1617cc53776bb3c9c277c66d5e4a1bbac', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('67d321ff0b6de20d72f0ebc8a36ba54f7bce6430', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('67f05b44d76ebc38f85e35d61c1d4dbbb243ea40', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('683b3fdec7e64096b97d37024c632cb255350caa', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('68531724434d37db6731c6b810865d8a4bbac03b', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('6869afbc8432ef3dca9fb5f7e175c798685a981a', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('68b70df8dd54cfd149ba86b8520e9e9f7075f1f5', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('68f7991f0e1e7f2862a7bd3662b007ef0a35b6a9', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('69bec3783eeb97852847b01db34b0cd34d993812', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('69c1f9c84c6e932966dfe42356d5213da3cca10f', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('6a004e2ad1a38807a8d4f6a990caca70d476f38e', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('6a1f0d2d383f3541dad9b0f6037d744efee32793', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('6a259d475c10381cc514443b8c8f170426d5bdb4', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('6a3fe794340cb3d619ad51a400051539c7d206de', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('6a916460890a8dc1ff16e8cb99a5bb0584b66e37', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b);
INSERT INTO `sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('6add7ddf977a841ca974b1b0ff657fb87cd545e8', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('6b048620de9dc75956b058e7d59c85f0c870c527', '127.0.0.1', 1440267089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236363935303b6c616e67756167657c733a323a22656e223b),
('6b1779c33385a86a69143ccccc2070f5aced7560', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('6b50b0ea193168003867d6fd2338d899227bafb9', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('6b587602fb8af2b6cb9df33e3436ed4835f119c7', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('6b7cc8f6ff85f4020215db160aa9bdc74733fc76', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('6b8948f8f75f7006a897cd7a32e545ab5483c366', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('6ba806fd01f593c231e608c24eff06484382ac05', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('6ba934595cb29f9e45fa6799a461b9ace5f6e592', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('6babca0c3f407a587b95779fa29e4a64a3a12a04', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('6bb2495e5ac1f96e201cc7488c8395054aaa6eb4', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('6bfed8654a33a09e45cf44348950f6f3910ce7ea', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('6c1cd724f6849bda4fa94838070166477ac54450', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('6c217a052061b7b282f8dc1d3c2fa408696e9457', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('6c26021013bad1543515c5d1b89f847a866620ec', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('6c82e5791b0663cdb7a7250e8c0bffd413a05da8', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('6cc4b76a18824a076bee7d4796c8250d63f5f39e', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('6ce644e28a44fdfe51aeba05533ad8fb6f883b0a', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('6cea62188a3eda691d4b10b0793a30e9aaaffd33', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('6d3c004576e80bb3b44b08e5564cd6c73fe15518', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('6d7262f0b3bfca045b49b5b51d905b148983ba0c', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('6d7f7f944f11f340273b631cdb7a9e354fcb938b', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('6da2bf62ceca783ddef1131a405402123655f9e3', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('6db1c35628fdb7c96f763f3779a4d3802ccd6ea1', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('6dca2cf32d86a51e1d540fb3c55359211f5b1f65', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('6de0268ab7c105deb7a1e37904a1d7d66250998d', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('6e3d72bbdfaf32c228e96a509011bf6d21514476', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('6e53a076c837a5398cbb497f109aad27d42085f8', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('6e83fa0fcead5d36ba241a194f4d2625d1b169f6', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('6e8b6a7a2411225b6238b73f5052a2091e563957', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('6eac1c5a3f87643b2623b1d848b88d9017162f83', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('6ec9b64bf337ba2cdc2429fc6de926fe369cb756', '127.0.0.1', 1440254246, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303235343233363b6c616e67756167657c733a353a22656e5f5553223b),
('6ee4f9dbea08b44c2311fa9e59b87d49c9af13a2', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('6f0be50fec83dd42d15a87b81e7af0edb0d0619a', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('6f25187e6425476a27fa39bb5a411dfb1130e042', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('6f478e730ed51b15988644656815b5fbe990fdc0', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('6f590a8be9dbdbe7571cdb709ee835c4ed44214e', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('6f6e2376e74b04633162031bb924e5448c0c7bef', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('6f8f56941b785cad63f7450d66cc237a124b0b49', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('6f9c36491796d9b41180e1748d68858152d4fe38', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('6faa0c27b8b2effed1f545feaf4357abf4936093', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('6fbbf87fd704a3f11d54d909266c4064269a092d', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('70001f42eae99df7003732d16db8d111ce2553bc', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('7007eab98f47c74eb3a0174384ff4a136853e2e5', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('702bf0af5d3880f028144067096a20220d8e6159', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('7056e3d1e4ee04be9b9c6fc84fbdacb88a31387e', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('707ab4eb49f89ca4a6626d9d75c519dc5738bd41', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('7084a738fdcb434402d5450a1a80c2ffcab6076f', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('708dbdc78d65fcfb425e3f2a2173516fd27c71e1', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('710a0906f73ebd0027f5a6f236b27df44af35b91', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('7143278fa2951229d8bfe72d79594cd9f33ce98d', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('71785c77a1bc9ebe42376329061b14a87101b169', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('71a9d488d4d7317a6d253cba653c832c1972e8ad', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('71ab25e871e56eba2d7c013479f215661657da03', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('71dd2cab3b04eb2ba41801003236ff1914855052', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('72796273822ac02ab77c337b535f8f77120dcf63', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('727fe9e82be51c18f51abed1a7ca34f7515d5de2', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('72aeb1688d4dc1b9defa62b800e776a69e45072d', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('72c198585bc1b3bf317cca4c420dc05466a0d393', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('7315d49d1d7c7309992ae64465d9405094170248', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('73246857852b00c40bf74dd1c5d0dfc7057445d9', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('7325e1b40d927c3fbc4cc7973090f766005c8d52', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('733d970b9d3091da5ac49764a5bc0a180e37b4bc', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('7342990d939e5fb6fd219a7260bcf5f417610c64', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('736a07af427473d89254a585c53edb4ccc8efcac', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('738871ac47c6aad34e97dd195207ad32c711652f', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('7453f18ac4fab278a1eac35d5a225cd68ea61187', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('74540337fc238612306ea401c8975a12626f1f4c', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('74859ddfd4c502ca93c100cbea145206a9e7b1aa', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('74c0ccb89a4ff71e437c68019cc255763d59ea51', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('74c9e1fa4825162db8fa508288584628dfbff856', '127.0.0.1', 1440263492, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236333230343b6c616e67756167657c733a323a22656e223b),
('74d611e3186fa30c521b9d101002e5f8b980250a', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('74dd2f779a90a0ff200bf9922bf7c75e62023ff0', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('74ed47b60a53b1038e0acda932827e9edf53455d', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('74f5d99ede1a22e99761e36f0d6857ef3656a051', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('74fbe4cc4c2451f608e753d65b606ce02d02e5fc', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('75272534b2f5ecadc68a7dbce66b8bff2a75dbee', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('75385d5b2f75197231119de8871d24663b375d0e', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('753d2df2f2758c9f437f89ad1e96af9890e44842', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('75968da49af6aac7445ebc54452cf88dc02ab635', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('759dd3586d8d93a5c255ef3f3eeb4dedd91a256e', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('75c4ecb25feb5de8f5d810300e2e29e3b7cb1d1e', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('75d064bec6693a6072cf8470e1649ae89cb1d60e', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('75e89c653c1c63762b379e2d48fb5c2a46114c36', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('764fd984a23dcb051b650e21d8447106f36c8077', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('767743d07c01bf832bf63fc120992e10cbe35504', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('7683d9fde9e3a436629b57ccdba69be4f4bf48fe', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('768d342327df88ebc24b92dd14730eca03b45896', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('76a3f177efb0f53419c064244ccf68d2d18058d5', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('76b5b9484256e166b7e2f114e7742cbea4e7bac0', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('76d358f6d136a63b78a86f468e98f2be3b0e2f75', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('76fa0b6936cdb01a4558509cf6d220b04a125d23', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('771e023dc2b621cdd6130746f68e75d933784218', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('7721f0573451db208f032a8aff41574e45f51e76', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('7758124d8714ca735d58f8204fb88cee4577300e', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('776aa917cfa2893cc7f0b294b589f080b3e75e46', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('77832bc24b0b457168151731d92d3e36234cc23a', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('7794fa3b136546638ededc9d3e0020ffbdd2120d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('77b5a6471cf19fcefe57f2b0077e0dc3f05cf6bd', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('780c1dbc324ec10b9bf9abcf11ff97bcbd68bce2', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('781bb7524840942a02d9ce9822087ff4e4f21d5c', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('784fee3a6ccccf546b0cba7a7db7dfc78d91d736', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('78797bd353e605dddc920b8f3f292f872f6ca565', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('78987f1fd8253700f5d47591abe688ba489339e4', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('78bfe1f35528897a0c0d436558e3429263cc6330', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('78c3b28876573e251d720d4a75b3ee56c8912d55', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('78da0dfa66eb552b5aad465d72ee0a126487a87b', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('790791a2ecd7511f27af19890f93391f843ace9c', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('7907a9778eec14ba436960e1deb82aa0e0fffb01', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('7914763035f302472efe3127e33fa07df234f368', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('79441022b4c3dbad219a2d4631f54e480db2ccb3', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('7963a2430d1697a917d6f753cf539a9ced2d39f3', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('7991b1a145cb0742d42da3fde5d9e7365709c1cf', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('799586fef49f01427203010459dd7ccb4390ce50', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('79fa269fe233727ea72ea240d3ffd4e2e4fd6124', '127.0.0.1', 1440261705, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236313639343b6c616e67756167657c733a323a22656e223b),
('7a057e18ecbe76840f5a909b158f3c75251bd858', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('7a14ee3d10a2bbf05c0e0e263b23616af4f1d170', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('7a156405df8d8ec22bf0c31acca3b8ab06b7fcd8', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('7a36298b9119f8b86341eafe67d64b73be22dcc5', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('7a482c1f4b67373ec3242b744517fdfb6e10b55d', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('7a59b807bbed379b29b49da2206a352764ba4853', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('7a783dd0944647a7649df04bf8fc77b79938ba52', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('7ad1be09dba8306a0f0d7dc37ac3d78e5460c2ea', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('7b01a0b3903e9ccf3cfc9f7061781bace1a70348', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('7b0febf3b1b86e7c9380d38a3828127d83b0ce42', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('7b10aa8c995b5e7c6fa9b87eacc7bba9e06e6a00', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('7b14c08d403de894cd4f16a3c243bdbefb4dd8c0', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('7b2a1b6fa752f2156e5adf39a6407051a6169609', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('7b64ff3ec476da5990d064566d506f8ba40ed618', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('7b8556caa41d8f7b3e56b44550144f75f1b677a3', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('7bbfa06c06ad969ddaa535d82cb9034f053b535a', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('7bd00462684c183858bf7336b36a17d313c59d63', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('7bd8afed351fa8b96c2c9571bcbb7aa586dfc707', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('7bf9cb9ae86149b9e2e56f532553f6bd67ea54b5', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('7c6341bfa835133e5f67fde6f2873db9311bf713', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('7c8c0e71f1409baab76abc16e41742029989b4fc', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('7c97eae43c351eec251d140d1399d4f96fadf506', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('7c9eada4aa06c659b4320f30aa71675c0d419261', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('7cafbb2853c29a408eecb43843e87df857944b56', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('7d3290a12ebbc1c2bb2323b8314faea0bf55503a', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('7d50e7f7996966a8f0a82366e6dbea4861e34a7a', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('7d6faf775e08d4a5d75c1c266c1119f193282365', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('7d7cb8537301215d118626e1d776c7a21d6b57ba', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('7d948d1598d356713104fc4bbc9fbfa6efd3ee5d', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('7da65cb00b5312b010b1611cf974c20182b4ab20', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('7da9eb32899fafd333f297f2b89c45697fbe7bf7', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('7dc9faa690a5d98a8a404a8cef14042997286ce1', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('7dd5484b90d296d9a6069d286f48d2af753d84ef', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('7df9c240000fc938f29f5e98ee8ad4a8e7b6c752', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('7e422a3d87f98bbcca9bb98ad9b27d0a846c65a0', '127.0.0.1', 1440252380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303235323038333b6c616e67756167657c733a353a22656e5f5553223b),
('7e6f6ceff34fa1778f056f3f01f2cd0187fc8e77', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('7e7198d423ed3defe5b8d3581f02a11fb9eeebbd', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('7e8560e3f462f153edb5a30469a99a7a9b2f0c25', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('7e903340ed3516ab36f72a87db3468ee4a04f7a2', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('7e93244ca21448eddcbaf83b507aa8cda2cbe6a6', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('7ea7881e33e90b226b6bb5a180e9197b35e274c1', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('7ea90831c0204f885c742e573738af952962e56d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('7ecccfe83649f205bdab3c3d3f53dfbd7bae1419', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('7eeb6c1392201b79180107ec81a8ae4760b4dac6', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('7ef46c910ae37e61770f7e7a0e0971c6d3416270', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('7f1412cbaa5098bbf169670fdfc13c08220f880b', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('7f3c748af0fa2e1af31d6daef22cc49f1b2721f5', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('7f51268b47accdb9bdfdd592033defe3cbfcc9df', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('7f58a9d155240c3207e5cf1b5d3c370db143a033', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('7f89929841ec56c80a9ee354134dc836ab2c1ca2', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('7f8a2a9394769e20d667bc7e68419a08b174c0c5', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('7f9fbc11344d6edac3c9b6e4fb071f4e53fb1e41', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('7fa16be8dfe7f21016ed5d027fa368c94af5a864', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('7fba204c9a20de5f9ada0d7b253db41fa9509fc1', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('7fc7a2d39bc17fb77e57777d55cb5872f49995ee', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('7fc8714255fa1947921b8b9e6797bfbcf17ef153', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('7feb46bedfe2fa341719d19adbe91afe1d352853', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('80179bd959bdb82ccc23086c7108285ba8ac4799', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('801bcdff5888320c9ee05f910c3cc0346ddc7b2e', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('8030eff1ac46726caeff64e4dfc7530483cdf9b0', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('8041e129c63d1cc567ea8b8b1b27362420e7b954', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('8082ed509abe69bf80aaa6d882e72bc323ece840', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('80ce0d0c13fa1e23d65e67b2754e36094af9e069', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('80ce6d17bb8d2d12347622d8384e7974300d66d4', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('80ea25af0bf818428c05eec0b7165dc5bbdd81eb', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('80ebc5c4fab7e332156cf45c3b5c998853544991', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('811fb73a2f2c864ed12fd2a3cf430f8fc32695ad', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('8120a971afc7ab2bcc2e774125777793a5836946', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('81539f5e4e0d584206e6dcaf6f8b889d665818dd', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('815ede588bbb7a2d449f2657dbbf83bbb4b3587c', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('816babcc7646b639c53ab26919f42b6950fae1d5', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('81782e59b8a834045a6294ab74d251251fff4392', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('81888a013567842a6227a8820f4f7b6fc4e29e16', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('81afea6bf237efed8b15c024fbff38d62545206a', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('81be94807e902acf29b9345540b4475f8123b827', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('81fc3a9aa9640cf55cbf083182e56793cdebf303', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('8202314441c1a067b4235e52bfd2fca9bc169101', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('8245bb4dfe55829abae70be0565127b92d45996c', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('825387f9484badc04efd4ca3cca571fb5cf66833', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('82845f35bf8be023c77d37bccfbbb3041623aa33', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('829bbf4f7509972a8231015eee29328e71269dfd', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('82bedf831ede411432367610d4276d912728eddb', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('8357d200557ecda21a86ca8d964cfcae0aee3586', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('8362a785fe797aa851b018e2e399e6456d107953', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('83977ac1ec12294458b759693a700794e788a516', '127.0.0.1', 1440254589, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303235343538373b6c616e67756167657c733a353a22656e5f5553223b),
('839d50ff26d981a027f4f11c23eba83fefb6cffb', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('83aadb925fbb343a2f9a9a90347e660ee7aa6885', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('83ca364c09148c905e6ba323310872684f5c414d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('83cd4a5442357a0bd08d2c9bfb93a01b5ba09083', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('83eaaa269ab28c09bccb0131124b3e91efce86ff', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('83f8e789a244ea1494c896edd5ae6270a299c5b2', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('842e8dba3e913b45908dc8280fa1d5dfd166d794', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('8440fd64bd65824976c62744668430f2cd8e0f20', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('844c8992391dc6e14951818274489e999b2b232d', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('846fc357d55379fa6e7ffe6365c2dac856cca537', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('8484db8e545a91fa1b73c39db2db8254fcf5a1ae', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('8488bff8b8a4062df244700f656c451da1e7cba0', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('84c0f1d49afff6a2140883d11434c7a21c2dd795', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('84cecb5b49789aadf390192fa181228ef008ebc1', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('84d82dc47111c8d57ef966da443e21685c359bf3', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('84e1bc6c4b305f243850bcaf05f49e2b05aae1f8', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('8506da6b61300c4ccc5b454a4563c5c2247c84d1', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('85161e42e50c9ae94b1ad8f5cc110e61438e951f', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('8522c25e6c64b4e55ef0c5feb4062bbe4004487a', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('85355e4301320dae707891f6d042c1ae48651a70', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('8539f2a7e8dcacb365882c39057fe6ac811c038a', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('8598fcdb792812fd1d21906168bbb0cd8b2351bc', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('85b1bc201b30213909a4866504f757e3e1f8f806', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('85dfee4cbb21e46729c696811bde9055302045bf', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('85f6a823e381f56a38f5395ab62fa722c915e694', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('863d197f72858c96353ad548dbed0d1341e343bc', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('8649d5310d992125507c08867366dfbbe86cc961', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('8675af08214b07ba4370032b285e6de5b9c8f3d8', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('867a01cf429fea1eaa48e62b30e16723953047a7', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('86bbd56a5339a6075ca7df7caa491d317fdedcc6', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('86f05d4b9e03b7c126ecab58064a25359881d0f0', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('86f19d7ee7e39ff3cd5f1ea6aa2c84487ed8ab9c', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('86fd662f200983d6f20e83943861fac95eb352db', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('8712c1c1e561e8ee9941014a555c8da4f55d1c35', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('87701e16ddd17aa5378e4c357d7990c39051cc82', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('87775abb1326df431dc3388f4766d43bdbc609c8', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('8788cbe932fa87f64f022455ad142ab75f0a891d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('87a1f33fc756bf566e7534e2ecd823787393be5e', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('87b351b6ef2c82663f73ebbaaff4f94728333677', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('87b7c2b6c43a0ff9a9640e1ff6de52437c9afc4b', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('87c200998d3736c18e5436f11b1ea9bdc15d3c2b', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('87f97fd7ad43a2648246b76dc44c7ff2a6152f0b', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('88246c51687b378196f1621d8bc698ab0601962d', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('88283ec7caa31f899cd668a1d3b5e100dcfda53c', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('8836d9432b38e71a0cb065a204f1c816420c1917', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('885b270183a8b5cf31d7200bc7d7795254549d9e', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('8890591405d5ea9de7fcb8eb88c1df2c111a78ce', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('88a2ee0716fc464802afc5b759b89149743b77ba', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('88a30cf90b0db0df7727fda08b32e6dbc14de0c8', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('88ac0ec0338ebbea711f3763b6505f038a17298e', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('88b78ba8a409967442d90c6f75f7d6a09a65e149', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('892b3cba088e3a1b2acf7baeb489f1cf61cce918', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('8959f2c5838ba644b47f33ef2059cdf8a4778602', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('89b31d50e4819fc958058c75bde6b1bb77f91892', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('89f4eda0dbbe3cbfd77ce5fb0d139ccce73211e4', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('8a003d04ee2dfa4b091e8b4ff00dbaf5a69b0c36', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('8a04df525143580445b7f7a96989f07037593de0', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('8a0753beeeac9687bdc35152082f930426e6b4a9', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('8a099c57358dee08ba47a6fdcff15e2512ecbf8e', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('8a1cbbeb4357c5805f74f4acaa72c1caab2c6f59', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('8a1ce2ef204fe51d296d9093c19e2202e009fd4f', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('8a2d9c9b999dfeab3221752f6437ee01db5f1f0f', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('8a2e9767158b43c5169291695c592507064343aa', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('8a39e69dbb9e809dbe2db805b5255af6b84c529e', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('8a5dcdb8edde16b4455744d5ba5a7ba2449cf6bb', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('8a5f9e64775943a537f9746714cde20a271a5c1c', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('8abd0738ccedb178051791cbfbbbd3cb83e7c3bf', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('8ac49d9a881f4ae6e223440812f480e3d714f9ab', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('8acd6b97d3ec90cec54668c823c1d6982c77cd1a', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('8ade8ed6517a419f237012e1a54b6a00c8e5d867', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('8b09198e0caeef2343e56c546547e526d9c4b63c', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('8b28f465009868088e023b2791f4f41ced38ca58', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('8b70c387bfdcf8e449714532563470c5177ecfe4', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('8bed64a6e7cba3862d1de66f4664d89b624a1d59', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('8c0407809faa101619cca23de2ab7dfc3f26701d', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('8c0fedafca5f5b3a60d313eb052214311008fe8a', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('8c156b823f73648b23e452550d0cd0ae24811ea7', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('8c257c9ae751957b577b151f6e39b39e088972ef', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('8c3f382ffc3ab64c676fca4e5db3c16401e11b53', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('8c73825c93e3bd9cea7badeea931b16ae90d3411', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('8c774ca8a6ec04d8f976ca008a6283a6631daf7c', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b);
INSERT INTO `sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('8c790ec716c836f3ef7c5fddba20efdc127a1f56', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('8c7cdb0dada37da910fce73bb5a0f3931792ee8d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('8cc5c92d67865fc7b7a107bf97a722b98072bbb2', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('8ce8a5f179650a074a06ff08534085a84e8c135a', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('8cfb4e18845306133615c423527f8c7ab04c8bd4', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('8d070a269835537c5051c6f3b03ddccd522b9824', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('8d21ab148264b77f7b6b8b83a2d8f3ca01447f0b', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('8d5f64416b1f7d7a266536aad5bf51f8b38a1d61', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('8dbafd764881a909f1c89f1c98cd8f5719f30945', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('8dd25b5fab537dce49dbb43d3a6657712053fce3', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('8ddef737083ae30458856c6509d02e4023572ae6', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('8e06eae160b39a8a351f971041fd52c315c40e42', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('8e07895e3f79c8d07f12c8c6e6237ab5bf5591fc', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('8e1cd58bdc0bcf15ed4077be33a4d98ac1e155da', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('8e89b8bb9b753f9857e5d2a28c1746cef95fcc74', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('8e9d00e1be7c747555eb509801fbabcb6695fc9c', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('8eabd909ed86df487467fafdd88b9e1eb44094a3', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('8eb8d266a373c9321a5f9de23d4dd8fad9416495', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('8ebe979b78c901d89ebba370e94a4880c23f1c5e', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('8ec6fdf3dadfb76331ca5a702c7e66d73d35622a', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('8ee495add2e85aa0d0988df8d7ad633e91c10947', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('8efe3707337deaf241d2b71d11c811dc5a006e96', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('8f173763b40ee082b3e479359db68b00a3fce411', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('8f36461826d8753d4c0c77b97041194c5d1638dc', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('8f432b892d139f56e06c253d6986661c783f5086', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('8f7bef7e49c60c976e6d3761ed252e20f7741b4e', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('8f7f1c9081a581d66de45cdd014346e28e1b83a2', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('8fb8af8dab163f7f14b9ee6db75f4c56e0b923cb', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('8fbfe28461299c6290c53e878209849f03614509', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('8fbfec896ddb84a88ae7af418be6c21eb8def8df', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('8fc4305566233a01aea163cff922416286170b85', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('8fc928c56d2483010d3ef021bd4c59fdd586f0e8', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('9006704269308cd92f8f08019807f13473d0e127', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('900fa2464cd790bbf5dcdb5ee729000e407ad754', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('905fd9eb99ea1f855c0407e3078f4edb9e649add', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('90600ceb2d2e00425ec46474b267b073df08b29e', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('9064ed6869eb19fe9c317eed42ac1de53bab1aa2', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('908507ea257d52b0bfacbc664383995067ea0694', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('9086d1d78f5c65ebcb35f6967fc034050ddf924b', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('90b7dfbc80af26a11c323859f836f83bb76448d4', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('90b9cf5cff8c54f308eb2d497492e3537cb86ef6', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('90d3583ba8b9a6df472f6fdf3f55be680c15bb7a', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('90d5a4b13f8e9919e58eeecc4c3c94fac69e10bf', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('90f2ef888e091d4474c60e232c38170bcfc472e7', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('90fd7bc069de130de9bfd2c0055a96fe86a7ed37', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('910368136903731649c683af98a9660af38db882', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('914d8edb832adede3559bce070a80d469ad523d7', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('919972b0ebe28856db2ee94331ab5b6b0660ed5e', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('91b8e553c1ec2ae81a64c5c6bebbf13bd36ebc53', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('91c909b8e235a209b7548cbd1140533b0ef2fa83', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('91cfbe372f67c4f0947c51c0401543cda6c11a3f', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('91ed79b67ff09d815ac801574445f4b7749b782e', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('91ed93bf2a016ca36869cee1d2587d195894a7fa', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('91eff6e33a0351018fd6e576492d54c9f89941b7', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('92070cd8ee1ea165f8433a3f561802ac565ee229', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('924113bf7735d770cfc1d57ca420cddd43d4ac94', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('924f9c4574111b43bdd19fa311133db88b596e57', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('927a57e2d69653a59bb8cadf92bcfd2fd2c484c0', '127.0.0.1', 1440282560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303238323338373b6c616e67756167657c733a323a22656e223b),
('9284633070ad8d3d42379d06ec8bdd5b0c31ba00', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('928f48bb5f819661cdf6ce5cab337241d692c877', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('92ac3fd9048c034f7d1fe2e2363ae8d29e29926a', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('92ce8713e5f7134399362440f0f287350bb3b849', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('9322832fbc681e8c91c1ce3c7863387d3d5c2b03', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('9360931fbfbeace6aa52b38ebf13ebb5a26da40e', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('93867e101ab753df7c200498d21a37971c43b393', '127.0.0.1', 1440265724, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236353732343b6c616e67756167657c733a323a22656e223b),
('93c6aad9dfb57149c4bdb0249c8cc8d75f8bb944', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('93d19bcdf8e08d70371e949b52df40bdba5d51dd', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('93fb4c81911d97e94e3deb91b2398510579eac02', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('9403ed3078e08a16cbc2a7d952ca628a45af5363', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('949678012f5bff346999172ccd7cd7856fa12529', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('94b1298ccfcae7e51de8f48fc993047f3a91f767', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('9530ce049bcf9542432774de03ce38fa0250702e', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('954069ac14e0c798d48fb1586f5ea1566407e688', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('954293625d722316d89abd5b7b8bdc64277675c4', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('954565608466c5ed654833a2ace9a9e368ce5b00', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('955a95ad90107fcbeb61d9944765f649ce28ce28', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('95c0bf3671a8863aa936f3c9cd78b550f9eba45a', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('95c1171ba570ebf0b76670209493111a39262d53', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('95c242e539117859595fde5dd8b2d4b7fa46dcfc', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('95f841f706a48d5d5b9bacdc6e8ca2584bdf0278', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('962a24aef3d0d4db5fcbe670ff551654b8ac9eaf', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('9659f79b4d27f95aed36b2f3e6a59f3646c9c867', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('966118a357c22d76ab256bd57229be24b7756aaa', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('96b310ac1dabf1241a52bb7553622691e0394c3c', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('96cd8884f8004f09a4ee723faf893a64cf1b86ee', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('96e18779a1a267319365ac975b56984703004886', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('96e43dc39b6eaab354b5b7f4be4e34fedce79613', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('97129d9fb88458334a3aa08ccff826bbe873dfe0', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('97622fd36955ecfd3673080fcaed15594fd72995', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('976c056f15c34679e2cc19a2cbd1b1105feb5783', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('977353e5e31ce1d47849223ad1abad1354975c90', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('97f2cf3f1c61d0b2f9f5be87c9da07b9bb8fe5b1', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('97ff665aaee68dff91ac151dafe220eb49a0e1f8', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('98175b145e830db46a9992ee2caa7c6bc2dfddef', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('98236d18efb14a1df52e77dc256a0ac5ea44d7dd', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('98271f829d123932699f5e193ea8a05c002703e1', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('982f7573662a3dcda88c0a4b8da88931f167473f', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('983b6fe8c716b6b10f6baea03e2b9c467c4943ac', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('986011c10c5ba39a41a3e4ceb1964952b54f0b2a', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('9877d8a50e1b8f89f6c1dab748f238de65d72077', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('9881c3984464cd7efe5326fd1024a31ed79f6b31', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('98cfa6d8709e5b88887fc3f4ddc9e526afa32c97', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('98efb49397ede7ecb67d640647bcb245bcec9312', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('98f2be515555972ae3ec51f71599cd791969689b', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('98f3c5a0f3ceacf0e9dd8deea63159fefcb7bab1', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('9921259c944fe9906c40d4971ea9ee3bd6dc0e28', '127.0.0.1', 1440331201, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303333313230313b6c616e67756167657c733a323a22656e223b),
('9939256403accb5c7cdd4fdb8135262f6c957b95', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('99606e06de02cc6c15c9f19b0d18e3e37a14a8e8', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('99961b1fba583f880063ba3284bc8ab301411b85', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('99bb5576dfd9e4fc886e2d018a09dbb1e6369b69', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('9a24ae99a85548616ba65df4deea3dab492b103d', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('9a44ad023df601dd44b2a5aa387fc1ed97af16b6', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('9a4c07840bc54ae3c967971b9a35df494e1cc9bb', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('9a50878e55bbf38f9730720c68ec20c09cb61be0', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('9a8587af4de3c85ed0f7d1be099462458754a8c1', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('9aa64a09d3f1799c9fa9d1ea31b60524c4a1b0f7', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('9abf2fdbae907d0ebf97334167705a53496bb238', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('9b2a3690bbe5ec9babae8003cb605920cfaea171', '127.0.0.1', 1440259803, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303235393739373b6c616e67756167657c733a353a22656e5f5553223b),
('9b2cf5cbe740b6e776450ca1bd3db79fede4b4b0', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('9b43bd0a16a3ef0ae8980faf0f7190b0b42f10ef', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('9b7ade3e3f35bb959d78ebf33561b02c01b0960a', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('9b7db86b527970ccb71023d4a13ca691907f485f', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('9b7f0cdf831d79266b50add0d2ce9af8a47b3f41', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('9b95fd1eea54e765cd54cd5328aac31d146d62c8', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('9ba233c1467770ebcb63c548c454fb4919866d10', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('9bc5944e1c847e6d1629b48deb17d1b53f9da8a5', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('9bd49d886d58306bb9e754fa79904e7cf180edd5', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('9caf3b45f383b7690e9e0f7a0cbb7642fc311ff1', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('9cb9477f3641164c2e66c10e1f18d1ce62e623c0', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('9cdb7a754b1c27a911bafc51e5d6fb7e1de3ddb1', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('9cdc012137ef729f0e9bb625983f763c01cab989', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('9cddc4166c1ef2ca8bf5aead3741bb9f47e4e791', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('9ce0223a4a94d023e6c2520d3db64bbb77fe1e7a', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('9d2fb20af13dfd487b25595f251215c208be2ecb', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('9d6ac3ea1b0fc8d13501b25ba33dec1ee4d6d1c9', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('9d81c454dddcc802f4542521c868524082327188', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('9dc5e62a401fe6da984a552546106fee1905f238', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('9dd50e076d867d0044e8f21bbf0c79389cdffaaf', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('9de5e6ad250186fce8e7f82a0b5029709e3b73fb', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('9de7b740e84e26a2ef014a0f9a2b29b7aeff8ad0', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('9e2e860f9ffbfd3721296b288aeef302fa2031ab', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('9e7033223867a27c9a68e2a23affff9fb955b757', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('9e7957b469cfd2a3f5ce42f384656a681e674e0b', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('9e8f71e67517b87e473436fe9e7b2bb403e7d96a', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('9e9bd52e545d59fd0eed1311082ed59e6fa491f5', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('9ec112de26b919d563a1cd65d2bca4818c664857', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('9ee4e9159f99ee5b26aa2857ff3716c49233827e', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('9ef0873c93d19d9cf9828564a26644b14631512d', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('9efcab24e6b6e23d605ee2be97588e6354133442', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('9f17159694193fe28fdb89961b62725f14fab5e2', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('9f6bd98387f618dbce7fee8e565ea3eaaed048a0', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('9f6c9473fe310d4214081609be0e3f2ec8c8cdc4', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('9f81348d931f25d2f0087fb5cfb5f2914930b102', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('9f8486fce701f05db4c4caaac6a5e953beee8545', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('9fd076de26d753f3243a21d86969ce3e62086cb1', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('a016c4a945c82d4b7478776bf91e40809ca46364', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('a02e086bbed8afc7b4bd0d26d5bb3b9634226ba0', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('a07b523a39196ff85cea4431f8ef69c5e3845486', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('a09ae52f861e95c150cfab7ed17959937875e923', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('a0d88af07613b5c7eff8c7f319b0a2cee5493d2a', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('a0e13733db270a3cfc1a9353388654a1eb472072', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('a1038bba5baf0bd60d4c0c8ab4f09a63f36fd019', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('a10f44c3896236e8d4550850a1fbe27920709d58', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('a1385cee478380dd54a14c6432e2ab670c6f0289', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('a1ba0970b969c49293ec557e5a505c499a70c32a', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('a1ba7fab19c06924228c71ae4318a507619f1f9d', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('a1e8f9b52ee68c188669568ed4e4d8a07aa805f5', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('a2197c75811a2f52fcc1530ea5350d7fabf5a81d', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('a222fa63d0fe7fbba921c83e5ff153aae5169b4d', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('a22c199c2c9aa5d59905f2f9b831fc6dee8fb18f', '127.0.0.1', 1440264968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236343732383b6c616e67756167657c733a323a22656e223b),
('a2661cb66fbc81e784a0c6d4d52716b7f1472426', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('a27e240b17ed89e02ce05e4b097a5341e0692ca9', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('a295952ff1e5b9ae1eac00c1602e684f3cabed6a', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('a2a824f6d2fe7f86a2f1eb2e096e003cc2b0450c', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('a2c2ebcc319fddd374db85d09954871250ac25db', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('a2eb695c7c91bea2a4895feb9f27e05beb88729c', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('a31dd05a7c816c02997612081d5f4c1ae5d98930', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('a32d73f51719e98b5f59b2cc75a15b9ce54b6eee', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('a37278c3e7bf451b5f4ac92a21dd4314edc61b63', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('a37341c7e385331b003fc89873fc6a9bef8d75e7', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('a389326c6c963ceb9e4f1a00853e6ed62a8e4498', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('a3b3ca2e0b25aade389174ebda99316e6ce0a4ea', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('a3c3659733df8011246ff55e6dd0a54d20b700bc', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('a3f260099908209a63e7741ff5e7a4345ebb737d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('a410ffa8566eae41d121fcfbf5b5e30dbd63cef8', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('a43cfc62ca7d1cee9498058212a122c83ba28784', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('a488d091c7f9e903c4c24ac212beb6d3c82a4aa8', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('a49c8e0a8c5b5f3042d077f4e8d1b3570c7c664d', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('a4a388221a1045897273f19053a2cd7b2540b809', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('a4ab3201807c60ae05309a2cce8feaa0468a8a35', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('a4ea5d77be3937fcf1c65110851018ef558d0816', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('a4fbf3a4b454c7160c219a4d5ac2cd6f0438ec17', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('a522834c6443d21628ca6bf5329ecacb769e3891', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('a53101133d187ec0365e6a710faa0ab59cdb1ef4', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('a54a0397bd481a8a3dd5b9917066adae2f17d8cf', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('a54cd45cb0a87139cfdb3dd955abff680e3cb000', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('a57f59c2193cde4ef9f358bb23a5164c4bd95828', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('a584feb1fe286ce67797e226394cd3800e4488f0', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('a5942250c6ee81c96dec9fa8d5f3cd387c70ffe0', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('a5963007bc5534b44153ddc4ded1804cf324eb7f', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('a5b48216cee2d7d318d158466881c7d8256cfd1b', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('a5b8352d7e0524e61c9f7f2cda5639e48c87e617', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('a5cbe0ffc43ec6a0c35eea6d8ec96ea4c6865bf0', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('a5dc13b1773aaf1a0db11c1ebc804da08e1ad5c3', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('a5e24900edf696708c59577899a89f998f9b9976', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('a60948f570bcd357e22e7401adc7e4ded7578848', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('a60a6590940e36b639f3af28e43209bc0df6f3c9', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('a619b792a0595fd35328029dd8abce3bedc840a2', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('a6206ffd1490e7b1901146902eadcedc30eb161b', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('a620a62db78e3e5752d1ec82d2cfd956103e4ea5', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('a65e6ce2302847ce4c25a2801daf4baa7d7fed46', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('a666a9bd3d70a99ad166f0f06fb00b1bddd267ef', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('a66af00090823ef21697dc494762e59334725a97', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('a6dea76833ae255f1beacf7808a11ff439ccccde', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('a6f234fa831531bf31ca214c5669d84c81b99bd9', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('a70af4db98a6e30779eff8b89e5717628b8bb23c', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('a72d1648875fa79c03fddd28013fea36f37cc039', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('a73ddca49f4a89c1dd2b0bdf759fb5697cec27f1', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('a746272021e564e674febb5e2f3fb58644004708', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('a752c60783746b350490ecdc0643cee55f3842a2', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('a797e9c4a8f00ec804f7c14a16f181ca1f435fe3', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('a7d5dd287a09cc643a65bda19a02926e85383c0b', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('a7dbed55061097b2474c757446b6376b40feb291', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('a7e4583fd66002e522d42a36a80d0242ed3c4fdf', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('a81807a5fbd4138ba50a81d880634a99e80a758a', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('a82ce23b9ce323a54fde992fe48f62dadf7f125a', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('a84880f611406e66f1ac66eee98271c6c7d20116', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('a8617f9c2af16dfb07f6b490f08224e6fb4b867b', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('a8743c6d8e25263beb43bb9bc18a9af48631a02e', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('a888537884051cb18975fbfa43da15fd92d16e8a', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('a8a742a5d34e190716173e52d97de5bc5c63fbd5', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('a8b54f4617ee03131480ef45dcc51ca362831978', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('a8e5548266c9d4423193665cd0eccd85e2250cb4', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('a8fed9b5087062b4729f70217fae210912c376f4', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('a93f92078b81df23e464a529c9f14a2d329a29de', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('a94f1df0d2f38e82017f5be16df7d2a93d1cc6c2', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('a958a51e20f7fa33d090bf315f7b39acbbd7df94', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('a95b7c08f87958a78aaac9f5dd26c994350480eb', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('a972a48df83010ec64b43b3f63e035a1e283785e', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('a9cf0ba6a4722117c6a9dc949b998d3a27a910e5', '127.0.0.1', 1440270875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237303538383b6c616e67756167657c733a323a22656e223b),
('aa1e7dc3a2a7b09aef8e2591c3350e775a13b637', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('aa4f9db3b4faf20fbe9c87626dbc52a421326d59', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('aaaa3fa5681fdf57fbec2561ef37ac6db52c8377', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('aad6e8dd212cc13a7cb71b50676988890ba76076', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('aae2d72946269aea0031d2bea359bc20f4fa9e53', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('ab13f5987c9a6785cf6f8073d6ce14ed34619610', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('ab14ff9eba8eb24de7e0918eab26e3865d4ffb33', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('ab2d12f9b7fdb85d6e4647161c363d3e076beae6', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('ab4dce5a356d73b7848b763ea2ef03c1e888b24d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('ab6704095c59cc12199545421d1e67642cb658f2', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('abb44f798c89763abe332e69c1655fc74c592f4c', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('abd882f9480560ba46062f7e74336821c934539b', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('abfb6e2c3f9bc7171e7690d6f5068d7a26dbb78f', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('ac328feb8fc53cc68661a77c3e3c1115642bf49c', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('ac75ae77162ec67ae26d639b0bd34f9f6b041000', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('ac8b3c914fd626326be339b64c34b37f72bc9f30', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('ac9e5cb23f9fc33994c62b7acdbd9e30e24744b9', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('acd0eca5a7ef1b7f7e735d2958f5925c131d68c6', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('acdfe0acb42fba9e104b91f3f34a21552e5a5601', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('ad2c4194825ad4d8a3e4d785342a50fe55b09b16', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('adc6d7f0a47a793e2124abb1f1e973f1b4cf246c', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('adc7b41fd04ecfd40b8d297dd33b4d586f59fa19', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('add35c5c07e9e74692cf5af4f7efa40d0afa9d00', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('adfe0ebaf87d2d717bfc105b82054fdccea4f327', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('ae14201f0bbb07f7593375d808138b962b986839', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('ae2ee435c54c0b52fc2b0ec4834dbab756497a12', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('ae33a96739c661139abaac7480a5a81ffd44fda5', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('ae41dc2e42cdcf2647cd937ca496ff9d88797cbb', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('ae7d0e9690b7226b79ce4b430374a9e89fff5871', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('af13c576896477d2b91166aaebf724cc3ebcee5e', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('af1b51194697b9a579ac4e2fe8232915e8a68dbf', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('af4c28519df70db21c7a1368abc3b9ceb0036eb4', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('af69699712363fb61480d59f2b2a5fe17b2c060b', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('af8b8228da571db32e295d5b0acad2d3ce7ed928', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('af916ef2e85121987e6a793bb22c056d87ecafff', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('afbcb3251dadd425a2a2bdf5931284cc0013b9a6', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('afbe36cffee235dda8010e19bf82d7de8fd97ec3', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('afe408e34a5fd32a1461d64b67e587f9f6beec52', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('b000bffd1bc8f229c0dd5aca83b8447cfbd4e99c', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('b00349e31ddf88aaf8b14a1b5814bed2caf98335', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('b0a5bfd50a69ca5229f77d8f986b07cef08b2cc6', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('b0b3ca68b814bb508dabaea5ef77b1b4dcf9e998', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b);
INSERT INTO `sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('b0cc2b89d86338103e6af5d5ab712a4d951e37f6', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('b0f2772756fedec71c147deee43ebe6b35d03b04', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('b15b1f36c05092d2aec363153855a7057e45e2ae', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('b16ae055f8e077bd898190cee7815b3c8f876d48', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('b16e32b706099e6611c0160193aeae3b7e53908f', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('b1781c1e4e4e1f2a84cb6080b8b8926d2965bd8a', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('b1a7df30a69e5b325223d6309ce1531051555cfa', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('b233ccaa520f520a5b9ba6490904f11fd416d295', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('b2eeb1cd5ce8559fbac47140cc446a416538a4e2', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('b2f1d465d5df9dec95017d77632bc8f3565a6d11', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('b327298cdd36e26253d1761858f9af88a14a1e9b', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('b331900920751247ab4eb512ae9a695df6726b3f', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('b374cf1869003e91fde54d760d8c708b233ae4dc', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('b37b1447ca63260615bb1d054084d12e19d67213', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('b387249c6296dd9748bf4ecd50531d6fdf691e47', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('b38b647bc6e4bccf07946b36f2167911956f6cfb', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('b3afe636ba21e6717eee57fd06df4a86e5f92c8e', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('b3bc46038d25fe4610e420ec61e5b6f6f1783a04', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('b414a5f4fde90caf6ef05698836e4bbf5a9768c2', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('b4497224d3e66155f57e7b2d5657726d1a0ea544', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('b46e946a4846b441aec99b89e0bee9c893b8211f', '127.0.0.1', 1440261315, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236313237393b6c616e67756167657c733a353a22656e5f5553223b),
('b4b83939a01521eec9f63e9002450eb5df0ff6e8', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('b4ba66de48e4cf3014ad761c9bf175a8be7f87d9', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('b4c6754c4233b60777215af41588aa20aa8f1e5f', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('b4cd7fde98f75cab91fe0ee7843c6eb6aa547e13', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('b4f235ebd7b578c08e7170d0db46a0171f24a5f1', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('b506189dfe8d1469d8b071b2fbee716363cb56ce', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('b511b7fed2194323aacc93e2afc8e21f75786118', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('b5699b2cdf1105dd38f5b4ac7235aa103c138e8c', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('b5720895eafc2077bc2e374083c1ce3dedf5a1bd', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('b5ab7abd7aeaf6d2aa4352a9422723a51b31a417', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('b5cc4ec1246554af30e7acfe69745f6c778a3119', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('b5e0503143e61730bb3fc8e92590d1dbdbdaae61', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('b5fbfd5b3e97e9ddd019b84e367ff04ebd6b631b', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('b6296d42a92b43c7d9de47b18670a8a86a70ada3', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('b6543b6cb9b7037814f84c29392abf80be7ad5fd', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('b692b3816c25599fb1482b543368ea975ae24c02', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('b6ab7c4f70bdebaba7ce56a7982373d9297a7562', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('b6bb182075ae61e9a0a5d35430d0fa7b67ca290e', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('b7054b94339c55c161d527d1a763c9ac8a9fb225', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('b70a7c22f3054eb25634658cc487280e8f1ba940', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('b724a9c4761c64ed7a12e32e3d4b592740604551', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('b73777eb9b4a78e31964925ccd4e8608935eba22', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('b74daeada75b4a0c98706be28ba69f30e6357cb9', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('b795342799618e435014d2116b4aac43b45addd4', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('b7c8a2fadf410b546c755a22d40cd2d8752a3cfb', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('b7e39810fa5d0b35826194e52405a62a072f5d4c', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('b82829f91d7cbdab559b071c6eaaa4ce2d19393f', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('b841279ccd36871b74bfbba4756ac20751e2d345', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('b883236676d2499569422b49235b6fcf37b0e275', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('b8a61733c864c020b3af8ae4cf0e9a4b8ab8d362', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('b8aac6facf784d9a0994c611f128821b56dedfcf', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('b8e41d702cceeef6cd07057bb2b3553d64f00066', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('b91204eb168ee54d79b0cb0dff2846fbca81a015', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('b9285e5070cc5e21c3f380b6834e3320300aa04d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('b942a65247ca368a1e127fb8f4203d1f60dec8b8', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('b973f61ec2acf0df1e3229497674de97c86e6a68', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('b98234a4f203070034c5b304d446593000d34cf1', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('b98f2accb5f458f8f60f7b841b8a3e501ee989e0', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('b99477538cb2f4113a04f5af9af267c09e44c400', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('b9a41b1e5091645cd7a26ccad1a3564adfc81834', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('b9bcc84dcd3a22fea224821409f6bed9153c56d1', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('b9ff5b4cc6f4e8587d0a611f0ab1a6570142924a', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('ba0ce0b8ff1afd252c3d5b24a5f5c482cdfeebe1', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('ba6198d66e5c2a496bde473d96c92c54858537a4', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('ba71a65024489764935205ae381d105ad5c77e60', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('ba8ce50c3dd963d57011900a19a411b5aa865fd6', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('bab72d982e42c9ef40cc12bf947dd3cae58dc5b4', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('bac81edb770a40689d4033dc428230b784e6e947', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('bae742e40b7c6644d612436fd48930560d4112dd', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('bb005bb71a27829dc40e7f0b5f01506ee05ada39', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('bb043c2d3c90c54bed8b597cb558a5508b21d1a7', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('bb16daa82336a1dd51abc3ec1bfdae919388fa9d', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('bb5a9283334c591d12b1c32b19128d16bd0eb4a5', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('bb70c313294f657e8888de6b39288d14f907828d', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('bb7daeb97734235ddb11ac9e5c7f4e98e4e9890b', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('bb91ea1f58f80baf83be7c3266d44ac6ede304cc', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('bb9a589d7a3efd630a12008e05e7f5f663e33375', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('bba555e2ccac42893c6c65ece86820b9decc71bc', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('bbebf04b98ed03b380ad143011040f7f8c261fb2', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('bbf86a26538be1db7b067c6dcee28edd952ce422', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('bc301cfcb5b51c2909475a985ecebf78c941abff', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('bc366e23d4b4b414f3252d98234e031c8471c178', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('bc58d2c58a5e55fceb3786d6aabfd1ff0c6f51b4', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('bc6d1ba86c81be4ff1a73f4faceeb2da871bc68f', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('bc7e4d1121c8762708835507c84b57c109bbf5b8', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('bc80e61e61102daa5270d84aae0f396f33d14dc3', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('bc988d1b0d72a765480917452d521e187ea0341c', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('bc9b97a405a5e554ba2aa9fd96f37eedc3207a83', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('bce704e7dda41738c954b6d2850bc011caad196e', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('bce72d6ff41bcbb8a3c3deb6b7defba168323515', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('bcee5d4ace30699c3a852478665c76bd966382e8', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('bceeb880b4336601f2dadf42f8b3ac00a8d1cc14', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('bd6c0b1f061614c4e145d54afd35441b4f09d575', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('bd8c77f60ae0bac6c4b7a5881dc05bc50fbc1158', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('bda2a71cdcfd2b00185bfd0b2445eee944edfbb4', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('bdcbc1c98ce5eb9a026c573106e08609f177a733', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('bdcce55134367b7358dd9bfd9bd0a0e81f1d4152', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('bdde10b84249d77176ac01d4993880c77afcbe83', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('bdfd63d80b85703fb56e630d463b119e23a5746c', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('be0239e136f5bdcf07030a62e2b6e0e8fcfa1ee0', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('be05024704ab2c8dcb05b9ae9e16ac66c4e37298', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('be0c479cc0139813cd614cb041a640050ca14475', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('be88917b5027497508a7adfcd538d6a3fc428bbd', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('be981d341136486418779dfd5d51abda220c661f', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('beec1e10922beb681638a1044b87ce1b45ca63cc', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('beff4cfa1ad8f465d9cac242ad5b38f86c4c14cd', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('bf038fc087aa68bfbe77f71e4fe749e37d4adf6f', '127.0.0.1', 1440262763, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236323438373b6c616e67756167657c733a323a22656e223b),
('bf0f7c38ecfde36a159dea1968b8dcb96cd69d5c', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('bfad8351ec7f0049cabfcd91be73b603dfe75ff4', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('bfbeba45619f6ae6095a56cda89b59050ab1ac20', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('bfe7b0d59c6c00d5aeeca5944e9d697af7766189', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('bff2fc370de1b601dda38fb62cf6ab90fec11319', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('c07e1e00afc7b8859020de424888320510b61942', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('c08c859f12fbda734a94356c61a41e362359a538', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('c09a9940e41c078c2e4723c252ac5d3e603fa132', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('c0c4862fbc2c2ba59829963465a7daab671bcb29', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('c0dfcb5717ca99def10e186f51ae03ba8e9ad511', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('c0e8720e0f746ef55caebe3ac8de7c54836c1ee5', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('c105cde35ddada75cbf15d552a17b625af47d2b5', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('c11638884a9b1e8796ab4f4d95afcecc20ed1f6a', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('c13144eee2dd6b286b2fbff7bd8ce73867aa4e3b', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('c1426b487bb5b57240b60530aadb37a078a37f4e', '127.0.0.1', 1440253127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303235333131363b6c616e67756167657c733a353a22656e5f5553223b),
('c14e03898eb24d88a10fc13c7e98d3d4d6652708', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('c1a86c337abfa841215943feb6952fa1607c5de2', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('c1cf1ab3ee59738dc78a62d8ec390b707d58e794', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('c1d9f33abcf6d6635b7506801b9fe1436faf3c63', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('c1eafc77cb0cc8386442237fb59bdcfb17734bb5', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('c1f00bcd705da3973db673119e29443002545bcf', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('c1f824ac8502a093729292aff2a91448c38621e8', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('c1fd8dc3bcc759288192cb95b0ffaf2c6cd5b51d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('c215b0d91abf505adff8c077b6ef5d77a087208f', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('c222cee0fc454e2da102f691d84e888590656a17', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('c242acadaac3691087b9db2ac90adfd48796e4e8', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('c25b22d9c215db8db85f734bf476657492c1f515', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('c286224b59a7cc3b24807cad407bca99c11bda6a', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('c28e2b511c406f4357fe29ca278859147e7d06c5', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('c2973570437df1f5bed00bb7dba94d1de309d500', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('c31c3dcfeadedad89e8ae5b2a296a77b7e4982af', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('c3249cc8545ec67fe922a235e95e84c2c371bcd5', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('c34a92cc755c5d5129dd4c7485bd1bca9c05712a', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('c3511279a2b27ed6f9beee4f7dc2d7c406a795ae', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('c361c5fd134c04d6e5bf11fa519c0102e6d59991', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('c3c19eb2665337a944f931e324bd57d764696ca3', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('c3e003cc706835f5d0d405b48cca8885785c7e78', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('c3e8159dab6e69411e58f931f64cf246b29951dd', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('c418b4960153aa49d8041fdbc48308762596c035', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('c49856204a08d5e082a0c4cf6c2997fcbe3e21cf', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('c4ceb22ed94c9b52cbe32de802168b66e503e2f8', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('c4d098256d425a6e89382a2f2a8d9594556b19a0', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('c4dd3e482efb775bf939442b7c4f94dfd6d9fad7', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('c51610b8183edb5a87ca0179ec27d520ed6844d9', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('c53796135ef123895787da1715fe6b319ba8c751', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('c5a1d546d532a202703ab180ce1104de4bf38381', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('c5a860f7b9856cd4b282520ef1f8be2b8e0b5c09', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('c623455e2abf77d9e2c46b223e13c6921b6c47d9', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('c650d93005f7350a349042148677a433f1c96305', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('c6685070ac7abb6ebb6a0101dab54e95c6694e82', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('c677f279bfd8c11a3e66a7a29c9e2ec5258fd801', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('c692477577b41534e9ae9743457ed2b88dc1bbcf', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('c6addbd40faccb6102ea140dbe7886fd8d1c7851', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('c6c385506de24623ac0e2d69ce12216722367e7a', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('c6fe11fa371b76e47e6becbd73a166972dd97bfa', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('c72bbb0b252b04ff5e61948c1339ff2e1d547d7c', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('c73948274492c27a3b3d08d3c487e245a475482a', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('c75034a104f60b88dbae0162e5a06ca792061baf', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('c774e5618cfb985566e38823ddf53a922c51e609', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('c7e5d4a28e6be733ebe8b6d34cf42380686a1532', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('c800094fd09b74557f4b417bff3daf4084daa033', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('c8321e9125db7cb04de1888d4a8b379a089419fb', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('c83a424fb9c0c90b4fabf8d7606ef0be32648d39', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('c859e94acabfab1491a7ae389e327e67c9195f92', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('c878b8a46212d3d44841e21997d929f3d47f64f2', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('c89ba7770889a89db901dc8b066ef1797519a380', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('c8c45d7c31e3fb0e28fc9fce550fde7c84d2a3ee', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('c8cb65f33dc1e534fe0eccf9ecd5dd735bc91335', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('c8e70c31abd42faaff163c133fc3051bb8fb4eaa', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('c8f852b2810bec2ac66356ada163d6f08a8866b5', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('c9114ba113e74029aed55498993c3a6392547be0', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('c927dea4cc57de8e7c366e1484eef333f2594710', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('c92b810b24921d0d5087b748072f777c495ca7b2', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('c9456b1f8492a0b02f2525e82c9ead9112c199ae', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('c97c56dad87264317255de7fb4ec1c768ccaab9e', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('c99130b11dcfb7d349c768aed0d1e9d154367645', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('c99e56fbc053109db5957016a5d4076d40bb2185', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('c9bcc5f2095c62c264ddb10333974a65f4b23f73', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('c9be335b69c90ef8dc0b4a211951c59b77d9bd8b', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('c9ee83f06c059197d047e83681c84ad6beb6c2c1', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('ca11fdd7ffb8f3b2eba6c4439f46dffc6ae3075d', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('ca12a2ac512bbe64b355a1c4568065c870aaf9f1', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('ca1c8adb86f646a18e2e9a8678860b7cae9ade82', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('ca25770403e2dbf1492e7b397805a84acb2753c1', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('ca26b6b6ebefcc544775e0fe8a86148310c33a89', '127.0.0.1', 1440256130, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303235363034363b6c616e67756167657c733a353a22656e5f5553223b),
('ca311c051a16ff997dd62587e043c8d9ea7137c4', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('ca58baf11c6c679e0fa856ff9c590509bf1fbcd4', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('caa892b817f43dd187ee19260ce390dae7052c0b', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('cae2adea63d2b11159628952618f6676698b6bc8', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('cafa7014eee9c45ebbef2f66934adeb6c552bf3b', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('cb1e1be7d897bed99063e2dcc99c1d0130c102b0', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('cb22e54fde9e1500df63786b3c40c07c274a71fe', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('cb299457c913cd53d0b093d95d6bb21d6652ad25', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('cba2b91b0dc8bd0b1b25a8f0876fe26b46386d99', '127.0.0.1', 1440271817, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313537393b6c616e67756167657c733a323a22656e223b),
('cbf0dd0ee5a2e61e23bd3697cb1e2d1725e032b1', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('cc088ed8e5086352cfa65f493362095dc3129286', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('cc169a77ad630ee79047e67bb1e5e4e228e34922', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('cc483e82ff5d4a600e4f0fc45a1a8b5d2c3e407a', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('cc7cdf223f5ea16e7f35700c76b8f4484c1b1d25', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('cc8fd8f57959fa24a1d95cddaa223502532a3503', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('ccf8f15654f3bf0202d06fc0001f5ece5ceda3d3', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('cd06844a88c8b4a72305c2c5336859ff31f9a91b', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('cd2974f3e034f9f8497057ba9caf28d69aa44d68', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('cd341e7f10a4d8052c480234e0df93e735fff27d', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('cd6ff7ac873962efb1e01eaf330c142254542796', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('cd87ab9acd083e1d3546db8ab1c6fa6836921356', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('cda19b74ec6b4ff894d9e63e83d06009b5316037', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('cddd96983d458ee8c7fdec5375ff17f740da4ead', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('cdf11d6f08910c57243dddc073b01fff003d9b31', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('ce1711d859b25c05ca7928e99a6181f5f4417c21', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('ce1f93ab1788bdcbade70b0280e7925150feb0c6', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('ce6bf517ad37305d4d37f7cb4722acb7ef504b92', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('ce6f24fe493d271633180670b3079540a40dbaef', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('ce909b24f4aed81cb8354694afffcf78d6190ed2', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('ce99b18e0b5b21f69247dec7f37c8463d159249c', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('cef30fc3381b4d26452ece15d9130b57aedeae4f', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('cefee1acb053d0d0aa0d4397f39512bdc0d868e7', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('cf9642bd553939c05c6495d14b02a5a46cba7b5c', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('cfb8535efb645bc77ea2a14810e57d29dd63e58f', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('cfcf94b9b56e6b6135c515c40820d3b8108a1b0e', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('cff6768b9860fe7831a873e33a0648e7606c0d18', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('cffa6c01dc88c4628f678d71ec44ed06ca1e95ba', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('d0376ea461b96843c9930c916eba62843c6e8049', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('d05108a1961f27cf84bcee1906ddeb2f4e91de85', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('d0673758cb7f3834f07418f207e0cda79adbf940', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('d06fe581bdd33546a9482ed574f7633b67a65b83', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('d074446d6340c3369f34c914feb3582c5d839df8', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('d0889147d50f150404a887183fbfd197ac739d98', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('d08f7d559f18e09aa64468f325787e10243d3728', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('d0a4b5fe447bfa88c11b7653893417c40d3b700b', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('d0ac5e6437282e0d64e6a5984495ca36294bf5eb', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('d0ed271fb17f2413780b52ef71b56b6d32728fd3', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('d1414c003c513b31b34f265cb306da9e78f61627', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('d14858d242ce21ffddd9e48edba89bda0fa2ecc6', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('d15079033e251043b8e7820c939d8b99734a8a53', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('d1a52752666aa4aa1dda66ef8815434de332823c', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('d1af064dfbe4f1e30ea3d1c92ada33b4e30828d0', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('d1afec3209e29355c66cfce57bf17595ba51202f', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('d23cc8b895ebb2897163cf51442d705201f3d028', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('d26ac4aede8fa815894fda06734905f322e88ce6', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('d27b2016cd9061590ee50f26b77055e527f7a54d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('d27bf1f36652293659d50b7f5b2812c29776f253', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('d2b766fd9588ead7d8cdca83a46d40b51379e3ea', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('d2bab351b504e3a2b5c27da7a43160a09dbc99a9', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('d2bddfb99ff902315ae9e7a4c3acf7073af97611', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('d2e44a550a78b732554e00a2095bde0f054a81fb', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('d2f039ad85aef952130872ad8b8cd153c981196b', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('d32ad93386d7054297a2e094f47d1910e6533378', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('d332eab6dd2de38615790b7a079fa57d8701ae84', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('d338e227db8b52e10d8fb8a5243d5eb261be88ff', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('d3522962804d6210be0d5aba244a62cc04d9c909', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('d353a357b100858b42123bed95e0762c2d369155', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('d3b4b7ad592b9e55ac96f1858ed17c05655ca6de', '127.0.0.1', 1440264656, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236343338303b6c616e67756167657c733a323a22656e223b),
('d3beb87ccc66846b951fd538ddda6efe9f5fdca4', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('d46a5534a7f024857eafe4cb65d8d025020d4d89', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('d46c6bb02156fc845ef8dde5b0ce654ad0b93ac3', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('d46e3f6b390b0e64d88b258094a100a92cff7161', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('d477c103c10720b6190bbc4153103ffc2f394a1a', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('d49f4e4e735619eb043a397a0fb9e7b1b73b3537', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('d4fbf429f1ef6208c4748daa661d69405e542b6f', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('d5061fc99bc24719d545eb2355361190affbcf9e', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('d53c40f928a2520d9b546040029436c375d955a8', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('d5403f7276951295b3649d00a4ec1090da4e1338', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('d546115fefc901bbbc56f3f6f0b11f1e591ac201', '127.0.0.1', 1440261617, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236313631323b6c616e67756167657c733a353a22656e5f5553223b),
('d54a4c9482af0d74ad4f0ed211f82b9c53b46c86', '127.0.0.1', 1440326867, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303332363836363b6c616e67756167657c733a323a22656e223b),
('d54fab82e9485c0d7837ab0ef18a43eb0a8506ef', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('d55ffb6f6ace6f5cb5b85ab785d327de56abc29a', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('d58d989bf2028dce3f9cb3236c342ebed294189a', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('d5a76ff8aa0519f0c9750a1a705d20232bf0ea68', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('d5c48acf3db4f0053794829a18bef4f04be6bd8b', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('d5e1a9981e94250df2149f0fe557d260b46cc559', '127.0.0.1', 1440252465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303235323431363b6c616e67756167657c733a353a22656e5f5553223b),
('d5ea85c7980324598e0f435375e1821c62ee53bd', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('d6098be9c96f00c027e9351e64e0bce27d2d9a96', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b);
INSERT INTO `sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('d634bd277f4cc49109750628e89f7ad8a495eae6', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('d64908c51df56315cd2719ab398bf1462a7d20dc', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('d6581ff7e3d87aae0b653116d698bc82c7eb9477', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('d65889853910c33d42be1692a7e8fee2f507c1f0', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('d6588d31307b64e3f9674262bc9be19a60e6340f', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('d6726831ea8ff0991d08c18a844f55ef78ea215d', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('d6eeda975ffdab81b02938a2d9d1622c71cc8407', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('d742d3019ce9cece8b84c57099dc34fb2076825d', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('d788e56e249dcffc04bce0557e3818d89007d6ba', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('d7a1d70a8a75e0ce6d8380ed84cfef6db9353922', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('d7afcc91e05f39ce3e4a53bba927cc42f7c2ef4d', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('d7b26d5ed6da44cd61832ed172a8febba50ff422', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('d7bd66620f06e133111d2b5c6f83b1cb9cb3f5e2', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('d7e2f8da00d5c4330b6c798ac0a5c7be8eace88d', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('d8264853a1db535fe299e2f55d3d62d467f1f1b1', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('d84d82738cb93f4612737eb6e233a3fdbed1b327', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('d855eeece4756de8da95d10efe947e50ad4b2a06', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('d86fdc529c4dea5c824693c5139a234b4a13725f', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('d89345be7eb1c96b8c1fe5730d4f750496bc54ad', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('d8a5c52e229393cc71e033f2b177e95b4ffce055', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('d8ae19d4e6c6dff47f793d31a18d94941ddf26c0', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('d8b70c336c5140234cb4847ac440020dfa1eef08', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('d8bd5ee8594afca9aa86e8bd3377735f19636910', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('d8d852c59214ef38b61a8ba2a0c819984ea1785c', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('d8d91978799b995e347a9f26a5b9c874c3916ed4', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('d8f84cfa4dfed50b654255e093349f2fc1fbd8cd', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('d903d9ad7d08efde05eb9a3f34df1da06a34bb7b', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('d9379ea77174d33ee3c8406d255271a044fcd468', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('d9582a68728f59bf6665e25c49155bd342f5b860', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('d9b3d097e9902879389f949e6ac4af41ee3b771c', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('d9bdbfba63fb8171675d04020e00498baa716095', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('d9efb671628bb4d32d47b4086a38f1a20c217132', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('da3c69b139e06031426bf38a6b465374f67039bd', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('da6b11678fec7d7798dd3ae8f715c9eb0716eee6', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('da6fc51cb0fca639c49997b13aaeba55d39647cc', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('da825a42e3c1eee70ac0cf13477a86bfafdfd4d5', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('da839d1822d2fd30e35ea44cd0b5c15cfad0ba83', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('dab3aac2b0b08cc26d444a1b0b3dd454a64a5305', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('dac44799145fd9923031cfb60a381131d5a2bc40', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('db1437868e0e030db091c36c01787c7b34d874e5', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('db1f8f2444972eae954a6d6819530a5392becad3', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('db22196e4c92bf836d899519c8aef35f13877ead', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('db3a4bbca957a05862f5f3a137873717c9fc2b2d', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('db5a3c799192bf9389c502d8a365b2538bd6e88a', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('dba85bb4492df9d2e211628dc2b9d39542795dfe', '127.0.0.1', 1440322375, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303332323337333b6c616e67756167657c733a323a22656e223b),
('dbab63da1a9f76fcce914df267597c0d23305a4b', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('dbaefad02d30bcc2946c4f5ce28fcf121eddf380', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('dbf5b25f7a529ec6e8045ac8754d1ff77161f600', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('dc05d8bb36bc15e64e8e8cf702220210f7fc1000', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('dc0a0b4999c960a0f8dd62d277f384bea29de9a5', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('dc39f86b23a80189295e1584880e590e0f161d52', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('dc7a0471167fa93bdf052c0f06956c7f402f80f1', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('dca3b8b6cf80a8722f475f7be90d1270cca7809c', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('dcb23368345e3aa8b4c2909cc578d284ae6a6412', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('dcb636e95d3225ce2127a3d9663ce70fe788ee2b', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('dccfbb99f301ea7079774dd3e4de13ca5c3b70b2', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('dce45790fb787112730b1986443eac334591a1c4', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('dd26f34c11bbe9b32c63542c25444161b9df83ad', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('dd425b00f8beef6692ceecc664da50f93d170325', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('dd58f9eea78230791a28057d3be58cd23057d197', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('dd5d15e21d5511658d2c5d569557ecdf224469e2', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('dd666155476b35987518916caf20bcf572b3f6ce', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('dd9d97f658e21c70d231c76ada4c2c9c45aa149c', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('dda09cbdec59e8c3b6e7f533c546eedeb43022c1', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('ddc4c9a08f1abbc7ef7ccd46c8d80b0c73d243c2', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('ddcc2716a33e77e7ec10d973257942b03509bca3', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('dddd1daab6cc0a326734ea7a99cf4b21d3dad0df', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('ddf354a2152ce17f34e0a8d174df7f34ee3843f7', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('de0285296e6f9311872b865090e06f5c6992edaf', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('de1d5e6ebf744c977eda2a4f0ca4d5943b57349a', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('de3f7511d9991c77b6a6bb944c0ecf567c649381', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('de4153c10c176fb92ca54ca5ffed6bfd13ff63e8', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('de4880f65cbe9893f0dd19440b91a111c1653e81', '127.0.0.1', 1440264305, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236343031313b6c616e67756167657c733a323a22656e223b),
('de6800892cc8d9120729a92c8927ebf6f4ee0866', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('de8192652359e4c6ee4a1ee0527f3e6428ccebc9', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('de863a635482d525650c6a6059780f7a6d300b45', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('de8a23d3397f3fbf408c05b0090444bf660ae447', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('de8a70de78aa3cb9980f6d6feb758d7fa76a844d', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('de9c11a5de0dc001e833f333dd16676768a4d7cf', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('deafb73aa066c6684d3979477a78cd9ca1398364', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('dec25c0b10c83d4d67f5e4822593d5d880fd9dd2', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('dee12e9b32253fba0124735d1e8b042b240a3fee', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('def3b06471ee906c754b8e5b325efcae69cb60a0', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('df13d6d11a6d71019db52b7daeeb2853e80f56f1', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('df5194dd6696542045782f8ad6a31fead334533f', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('df5d4e4f301d5354da510e6ae4cd02b415329bf6', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('df84d2070e51c33304e475e0e1e9fb9a8d5d1043', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('df9ea4e690c17f723c0b38825038e83dadf530be', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('dff9a5ee0bb3e3548861752be4da924b4faf4b8a', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('e036920f5a1fe71759a319b09b7abcc6f6925bfd', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('e0371db083e23e6f21669eb2682467fe133923a3', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('e088d2d894ad4da74ee6c8c6575d941bf77d50b0', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('e10855bf75246e698ba063931a8f708980024ebe', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('e113ede6fd52bedc74875ac64493aa74042ac022', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('e114222bf3978fa0aab6665227d48a5d36c2ac2b', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('e13525f0d7f56025fe4f15962f17dc20878247db', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('e14f3932239d6f127b4f0d8f2cec617694edcbed', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('e193075618e67a3547d4659351ba825b32a75d9d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('e204ad231eefa717a50e202776d6c1fb2173a70d', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('e220f82d42d0e3d07a982de79df36bc0630198a2', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('e22a754b3f7def6e586e765a0cbfe28aa76cc9a7', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('e23d224b42f12ae6ef0fa3cd8d51aba2f4f75604', '127.0.0.1', 1440319817, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303331393735393b6c616e67756167657c733a323a22656e223b),
('e256205ab6ee0a7694c154eee685ae8982a9bb47', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('e2ac2e939793ded7c4373c74ab22ab13f6507b1c', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('e2b218c9531f851867de4f4d7e5bae1216992c5b', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('e2c36154963401f24f8f0a77fc2456179910c050', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('e305c17f0abda4333771b34e0e5f9928eeff06be', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('e3091adfcb36c7ef0dda0bceb616f513e62d0a32', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('e31711a8af3d8820b6803ab47cff0104654b820f', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('e32144f232281744ac86b53d750f5b6f031ebeaa', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('e3271dd54dd29a86052a3f57f94948b8ba5b6afe', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('e3481640ce0da238a854e373e653a7d7b94203e6', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('e3b45a59145f7ec844ad3235470754616821d4e1', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('e3b4f4d5dce144614e8ddfadc7dff01c9145602c', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('e3d8669490f4cd4efc634334fad30c1bcd4954e2', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('e3fa1d364c18330d2c9234caacf97ff98e3b6642', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('e3fae1df72b0dcbf30b39471f25f116696a1736f', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('e42c01755c998a03d9b6ddc66d21a5304246039a', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('e455b9363da6cfd76f3150cd8e945340143ca344', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('e46c1e19e5bfd6b8d12668be7529374d03fadca9', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('e4b7d3f7751ca633881c77fbe8da07cd5d52fd50', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('e4bc42a2ebf237e6df1da30f6395f79e0f46d285', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('e4d5866cac7532e3f90735fa88d3d213a8365ffe', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('e4e1cf4cedc6ae6da12a4d2de903dc2e1cecb194', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('e4f4d5e52d23ab58ac65bea2a475902eab2dd4c0', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('e517066d6bdd13f4332608c3af987b17e181d535', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('e52567d38191922ca0252a4b35488e5d26476830', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('e53ff7523dca298720f4412d81eebed38803f144', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('e5432d63a575cb2f9dec98a7ee8eef13fa46428a', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('e5435cca07de0abccff0704bb2a7157a3d1f9687', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('e54ca522d63b6d15b2f3e41dcba22ae3f437d382', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('e55721554aa19cc8049384efb23f65d9df9ad9f2', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('e57cce027b0b3276c8d23fb3b42d5dc96252b2f7', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('e5953201ea7328cc0d3291bd7a83c1a2dfdabb35', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('e600309bbf2352e1b35251dbfa7916d228f4ce67', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('e62bd10c7d3c96a8615d9a20866aee179c836a77', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('e6441bf611e3242fa79b3178c845962d5e7b95c9', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('e65a3da1a6401c74aea350a3b7245fd709017d23', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('e6ade3aa1d0123d185fc3fb5cb51166e780205d2', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('e72c4f5bd67746b13e14af8933336eff459559c5', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('e74eafd3d481aea4ab7058363df016a5645f4ab2', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('e763d94241fe6e7d9d3e05cb9af5995bdabf2f22', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('e764ce679ded09ce10578d1ad0b5729f36f7fc84', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('e799018dbc1db2d94316cf13a20241816ff495a4', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('e7ae80adc204bc77870e7228a5930597f5ec875a', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('e7b36bf3269645ae72d9b931e1c5137f60bfdb55', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('e7be7567f9454628993360cd603626bd467b066e', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('e7e772e6a59e673e1fb4119b2640596bd31ed053', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('e7f68dcc6287be63d3b88692bf514fc60526b125', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('e83651eb1b9a27bfde8a5aed2ab1ec6e24ca97e9', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('e863dd1c91668342106f46330556baaa24bddff5', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('e886c1e7dce198e3dd2dbf151fe5e4fb274c18ba', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('e8982f94d75427869e3628504a44310f56dae232', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('e8c9561e3af8cf45b755d02be1b611bc4ea00f13', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('e9338ce26a1d61af8ad1f89b64f20a986284f6aa', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('e978eaa01b138b9a38112d5e5fe71ad8b2455a3f', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('e99404a51f176596abbe035b3e87d0343d15a91c', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('e9e07eaa1ad72437673f32840da39d2e782aa75a', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('e9e58d4a205cb26ed433cbca343d521566be7cbc', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('e9f5b6ec4191e545ca19392f77892a2c00fb0e9a', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('ea00c4936a0913d07bbc3dc1d30790f9921c6da3', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('ea0b4a0956310aebee3704bd5f30f84acb0b687f', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('ea0f0724c2331f8f9857b124247a3426bebca904', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('ea18539dee807349fdb3824dc9735657d22cf5ef', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('ea2b3d444c92e575d34ff7bcd3d17dda5c12d4d3', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('ea39432be4bd3717eef941f94ddd0aa57f4a0b8e', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('ea471c7da512caa29be7562639a3b3a874cf2344', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('ea575cddc7eea432f2e9828da0b957bfd83cfaa3', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('ea67e49c68a98078ac95e969a3cc64dbcbc7e55a', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('ea68e08275709f413ce8be3ef05982aecf6e8b08', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('eac1cf03504444fb8f26d8bad4b70b95ce0248e3', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('eac5710f6ae690fe7d0c83d47de450a2be7d8dd1', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('eac67e768ec672783e76e86d3a8eedab66bc170e', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('ead92f913de6cee564e667ddee1cd5c03235992f', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('eaecfc1f20fb5e279a383772a336b795f943ed3c', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('eb492150bc918a7a756876b9a3e2cd2ebdfb4aea', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('eb4d45d3a279f6a796b929fac9f3f212f259e204', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('eb4e950076c05493ba9e0c4bcb4c7c6517fa1d95', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('eb7546547c8a30f2577bf1140077c9e940a01d93', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('eb82c363b39690456386487a9f0351c957ce0e57', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('ebd711237cd963ab07037f3569a73b598f0911e2', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('ebe964e69b456065201f35ab2fb3d439510c1b1c', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('ebef63b0eca724b9bb738b6812bdc73d7ff565e6', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('ec010fdbda0683f514c49069bbdee96d1694b617', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('ec10404b51ae8b120b7a41cbdd90183a1f90bb4b', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('ec16db4d18be3f850a30136f00e3d99bb5917056', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('ec5f8c82867224c0eb6225885442387f88fe964a', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('ec6a841f12e71372abb99a38e8e4c27c554cf800', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('ec70d3f40f4cfffa5e2d4dc6761012cc9698ec73', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('ec8e47212d30f8f42b56c8fe5fc660282a81b997', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('ecc5359bfebcb9d12d2ad88a493a807c6d685eb6', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('eccebf031ce4b0356eb6f4433bfe2e2d24183feb', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('ecd8d2971036ca8ebdfb9688ebf992fb107f289a', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('ed23a84620e924380cc1168a62c6467b8b865ff4', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('eda8ad2b87a0bb367afb046033ca7595db750416', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('edab0a663d1f337a4c04ead95c022baf10de17bc', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('edc4b29ae72471e8203bec5d17500326f3b24c32', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('edd74d61bdfbc9ac0fda8db8dec5979e66a5d968', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('edf6be0ce3067b546d73632be632417a535bb100', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('ee025b67b5ab909a961a5a3307ab70c5c2c82bfc', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('eead6119439a4acdc69b8b2705f72d6f27866727', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('ef013b05f04816ec74477942046217d323daf260', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('ef40d0df55242e14f020c465bc25c53e4a51cfa7', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('ef64bfdb871591220cffeb78a84391617a4aef16', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('ef6cff7effaad1d55dbe9b0d4b8f1aac200d5d0c', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('ef77a07f5aca71c451b484f1080d65fee498cca9', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('efccaf6253fe22954054f90a8292b63fdc722e96', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('f0209de9f489d46613ceec45e85c4b623c7478cf', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('f02ce2af6dabc288a58629a9281bbf66df026aaf', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('f069135e5ac1cf9427ef26e411008180d1516e50', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('f07fd77af8aaa2328edd7a831a16ece1b568f106', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('f08c083f3679cae4925250ac03f8cab888a9586c', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('f09a4ff924a30cfc211f8eb66408e2bea755b5eb', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('f09c0a9d4efd3ca8d0cc491e613c13caa16012a8', '127.0.0.1', 1440261688, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236313635323b6c616e67756167657c733a353a22656e5f5553223b),
('f09d8f7e61a596bb5d00db2235c9c2d3b7179af9', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('f0d532352bed4d1057d33bcc407750382ca1e5be', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('f0ea31f8eb2da417bfcff398d356396ea6c600bc', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('f0edb7a0a807a38b28ec13e7b7fee0e4399db631', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('f0f4ccb39a3a824d2c9e754b4a33cef0c026c7db', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('f108ee71947f4df4298774dc8d86218dc910d975', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('f14819c171d81843ad8de8d69afba384f4a3434a', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('f15f9152cd0ad9cb04f2f590d334603d0bd1aeda', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('f16a727b0f4821b9da6598f4f64aa0ba30c34dda', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('f173ca05a69a6b650b0d904d339a541873dddea2', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('f184ebd87b62abf057ce3941ece5ec273a10c1d8', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('f1bb29b6e7508f2278757a99967cb94fe716a91a', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('f1e41184ee42481ad534180815d79a9f65ecc6f9', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('f1f5b6343206acc76b4af376538f199918879f79', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('f20d3966708cb81ee773109229063a36e247bb69', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('f28543756762f799020f25e7d95307dbd8ba561d', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('f2ae18254b48b6c24c9db0c5e95a21a93e63145d', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('f2b8632318f7261fb134923cfa931954c260a64b', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('f2cc2c9ff9296be2156968278ee5d8d00a7f00f4', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('f2ee92fba7926e01a729e1ec4e689e956a2729bb', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('f2f73be149a1afedb241dfa489fa5a310b767e35', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('f329023a6963553c4b111c05e64a1a99edb359f9', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('f361a42fb190c0dbda390f0addfb2cd3bc691050', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('f385d7ff7140b46f48fa0cd5992974403b4914ab', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('f3896bfaad17eb796fb218713bc35c384f307711', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('f38af4c15f8b9f04b83d4089442447c4e67f8e19', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('f3b393bf35730bbf2f6f7c5cd4928a6ace4ec26e', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('f3ddc5fa7ac8f276cf807f283b866ce9fc1a16d4', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('f42c4a3a3483003e7392c3d433073a97a3b9219a', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('f43a20e8265f9f3e5192723ce6c914ad576a91a3', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('f459e97ba4bbc10caaf3a08b892faea8d20e6645', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('f48e5747046b6dec300ddc03ad61cf50cbc4b806', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('f4dbe8e20a641696752de169908d10a69f012272', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('f4ea62b65c9868a8674bed1e4412692ed65a0767', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('f4fce21080dcea4f602fd1facba7960b5ea5e39d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('f502c90ef759bef5c83d897160dac4327f6e98c7', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('f527a61ac903f5e40646de359a85ff74521cbe34', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('f531bade820fd81fb85b8b4f63e18d3fcd03c016', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('f56dee4c519a236d8e4e0dbacf0a7286b3537d95', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('f5a2b0fef52cd9c49207114bdc1c459fa5b1a99f', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('f5b7aafef98f4a0f4bfe5338ff343ab2d755ecf0', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('f5d112d928312bb5f17a11993d6d186c663e750b', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('f5e0a6dfbca80632077dd1858d698eccd2e2f2bb', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('f5e5ad0af8cc035350fc278fb35ab5e871715df0', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('f5f7dd1ee1356258009ef4e457aafe7897fea11d', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('f5fe56804aa1ee3091c9fb7f792d1e4aa8c898e4', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('f62844e57f3303defd93d075443a3e36c3c96660', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('f64252ac383bf155e963c26cc25f5514ab6b63f5', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('f6a7a3a8df59da4d16a3b1545d6cc94e1a0cdc29', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('f6b00b75f30c813e8a1f36309e7a7cc5b7a85039', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('f6b3f17830c8e24190a54bd882094d35f164d8b0', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('f6bd2ffe837baacfdd73559c383efa731ff02b1b', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('f751dfabbd536667dc2ec377f91911f7ad994763', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('f756839baa8564c6ad04060d00adb64d9c9ddf85', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('f7900304685a9342532c85e021bfbbc03fd97ed0', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('f7906cc6dc96c4ed3092a207e4e55c2a3d14fdb9', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('f7ccf603d6747544ae650ef8dc70bf4fb87810f8', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('f7e237f03cc9a0fadca85dae0e95d993e4adc8ca', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('f7ff3fc0167873908b36c8d556eea7750d897d43', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('f7ff5cd4029220112d0b10879fca6980a2679640', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('f8181077a74152357ec7695862f0bd4e340c71d4', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('f8214bfabc7b8e9fa258b34f7c8bc0948b86eded', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('f86e6c652a4b115269411697f3a639050dd8d68b', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('f876247f34aa1656cb438699a63a463c6e22a110', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('f896e028b6ae3a137d4c245fbdbf84d7051929ed', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('f89a50bbd353e4a755ebe844d2dc7a6446495a29', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('f8ab1a9882cf60cbb1b56cb15fd5ef227071a012', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('f8b6b9a2d2b16dfcb79282de13387abcedc1e23d', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b);
INSERT INTO `sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('f8c09bc6b2f4c23594078957efe3de0032d51748', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('f917597edcc732fab2b45297150acf9a1744646d', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('f91ace84e83b8578458d72098bf17b5c09356906', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('f91d4b87cfcbcca4ce12c03fcfcdc315a5fcfcd6', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('f925f6bafaf81e5e8a9b6b61ef15333e67846275', '127.0.0.1', 1440271529, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313235383b6c616e67756167657c733a323a22656e223b),
('f96fdc865a666f5be3217a3abf3449efeadfd1a4', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('f977a01285347d5e307cb0caade6340e8d19cce6', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('f9802d8d096af9905195f8c6c060f1d4f901e7c7', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('f98a8bc61b4ec6a0a1d954d49e6e4fa555e0c017', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('f9ace339571f7a49b6e3984b9a0a19cb5727b837', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('f9cf9dd83612c286f7fea79f58b611132174195e', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('fa1805eb7700beff84f03aaa5de462ec4fbbd511', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('fa318361d0bc713cd22821f34b6f69cf7f7f6d32', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('fa36776ea518fcfe29286a7435edf181138cb020', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('fa36920c4d6eeb229caf0d3c50fdeb4cc75d5f83', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('fa3f67b02f91075bd6b717a1114f33053c60b904', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('fa57d4695770390b4fc25ad7315a09ddc432d7f2', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('fa720f2e01b5be8a333a4674064ded6bcfb3d97c', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('fa870344c4317163a1e7bcaa635ef3370287e3b6', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('fa94b9928efe01a4ca96f0d508dd14c0e711b3ba', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('faa0eed6b074ead7d2942e51feaa2a5010b26b35', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('fab7db84f2bf65c977cb0bc263d34406957f614b', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('fabc34d13591dff5d74082b839c8496c360a8500', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('fad79b5e1374cf7312de6f242a5a240fe9ca0cdf', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('fadec39e35e77d74ee3feeaa3d60523123f1596d', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('faeb62f5bb574112b28adf81c6cd4655b2cb181a', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('faf390659693277536af52d93840de803356fc36', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('faf825874a31535bcfcdc0618d35902b7924c604', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('fb563ac1cfc52a9e221309e274ad431faee74d8c', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('fb61adf058d53c3a16e607c49b52c13a650796bb', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('fb9e6a2267f6f805867125fa22905486ec67c83f', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('fba993edf4d625f0cbc120d70b01f8baa61a482f', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('fbd1daa1480fadcabb951e3de54e5e3ecaacfb67', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('fbf6da4555880dc040472dd2f23aefcad4d05161', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('fc006f52a0a9cecc32426a9dae90c5e63afc6790', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('fc026ae51811cf79cf3f18ff64d1af37276fee91', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('fc25eb4aec5faabc1c4f76959f17df4d711d3964', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('fc2f44d5481de8fc0bf1874a7dd960224a8b5c89', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('fc73a2ea7a99737a93413fae4c3915fa5470391d', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('fc806f8d94cff3ea49cd86aa93f811abfe648432', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('fc94d915b95899e971bd1bf8859b49e646287042', '127.0.0.1', 1440271921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932313b6c616e67756167657c733a323a22656e223b),
('fca83cbfc3bef19fd140b221b9cf7897d9b23ff0', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('fcc9e8e265ba9123b1db714f3278b8703b39081a', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('fcf239ffbaf8fca41d0d0aa32cb23377375f19ac', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('fd311eef8a014615ccc2534498ee0064740300f2', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('fd3f7f135cd1b6bd136ea14f7cc8058fc68aac9b', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('fda341eb4b945a86283a14f5bd501d4edfb30389', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('fdb032379a6d0e1da9ac308017967a0e72ccd99a', '127.0.0.1', 1440262909, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303236323837353b6c616e67756167657c733a323a22656e223b),
('fdce9acad7387cca0f8a525385beda7ec726a892', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('fdd9fe8e0e82dd310decf924261cd26a57f22fe4', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('fdfca56b878c754c6790ff8908535458f4eaaf0a', '127.0.0.1', 1440271919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931393b6c616e67756167657c733a323a22656e223b),
('fe097a85abd07a4563f355f451312516c2823a8d', '127.0.0.1', 1440271923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932333b6c616e67756167657c733a323a22656e223b),
('fe24abbd775e56a4345b6154e08c99798b43dab0', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('fe3c0e620c5c9549b6aac17a435f53d4dbf30479', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('fe4043f945e83111ac6906da15c45d51d2eaa827', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('fe4f08104f1f575fc3f05aa2d089173c496d1043', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('fe8c9872745cbf36be872e4e9b68612fc52520a2', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('fea5bb36588324509dfccc8a080aab073600b2b2', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('feae010fce10ed2962e247d5c151d60b450ecdfe', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('febfb6ecd9213cb99895831db6dfd0f0529950ee', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('fec2cbedaeed28e647dda09f52481b55a85bc88b', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('fec5337b7f9acf7d65048ff970606a4d67f35fd8', '127.0.0.1', 1440271918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931383b6c616e67756167657c733a323a22656e223b),
('fee95f57a48c0fe0a37caddb73098ced0aa8cf5b', '127.0.0.1', 1440271931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933313b6c616e67756167657c733a323a22656e223b),
('feec723d7b97e698dcd23f48cf145413ca91966b', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('fefab131520401df9cd8243cda9c01e471265669', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('ff152ed30e418e7aa448d1ea2e2255b111fd6287', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('ff348d12cebc061a7599e715cf3bea125cabd486', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('ff3f4fdcd3d2699a34d268c4a55724b1e8e08a0d', '127.0.0.1', 1440271930, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933303b6c616e67756167657c733a323a22656e223b),
('ff3fb029a87de9593d411adf4c860778cc663100', '127.0.0.1', 1440271920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932303b6c616e67756167657c733a323a22656e223b),
('ff64f9bb03e13c367629d6f2b6f02a036db643de', '127.0.0.1', 1440271932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933323b6c616e67756167657c733a323a22656e223b),
('ff814fd9a6957247a48da51d291bcf1eb7f87f4b', '127.0.0.1', 1440271917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313931373b6c616e67756167657c733a323a22656e223b),
('ffa2bd44295d0a793705581f1c5f0a76040e04bf', '127.0.0.1', 1440271922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313932323b6c616e67756167657c733a323a22656e223b),
('ffc756b8ae7a6f32ce84a1063111105d16fab4bc', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b),
('fffffc870ad6fc104f6cd18b13e1c581d8b0814a', '127.0.0.1', 1440271933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303237313933333b6c616e67756167657c733a323a22656e223b);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
`id_settings` int(11) unsigned NOT NULL,
  `id_language` int(11) unsigned DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `settings`
--

INSERT INTO `settings` (`id_settings`, `id_language`, `language`, `name`, `value`) VALUES
(1, NULL, NULL, 'language', 'en'),
(2, NULL, NULL, 'theme', 'Default_Native'),
(3, 1, 'en', 'site_title', 'My Website');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `urls`
--

DROP TABLE IF EXISTS `urls`;
CREATE TABLE IF NOT EXISTS `urls` (
`id_url` int(11) unsigned NOT NULL,
  `id_language` int(11) unsigned DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_parent` int(11) unsigned DEFAULT NULL,
  `id_content` int(11) unsigned DEFAULT NULL,
  `domain` varchar(100) DEFAULT '*',
  `subdomain` varchar(100) DEFAULT '*',
  `url` varchar(100) DEFAULT NULL,
  `full_url` varchar(500) DEFAULT NULL,
  `pattern` varchar(500) DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `forwarded` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- TÁBLA KAPCSOLATAI `urls`:
--   `id_content`
--       `contents` -> `id_content`
--

-- --------------------------------------------------------

--
-- A nézet helyettes szerkezete `user`
--
DROP VIEW IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
`id_user` int(11) unsigned
,`login` varchar(50)
,`encryption` enum('text','md5','sha256')
,`password` varchar(100)
,`name` varchar(100)
,`email` varchar(100)
,`forname` varchar(50)
,`lastname` varchar(50)
,`gender` enum('w','m')
,`birthday` date
,`birthday_unix` bigint(11)
,`activated` datetime
,`activated_unix` bigint(11)
,`registered` timestamp
,`registered_unix` bigint(11)
,`id_role` bigint(11) unsigned
,`role` varchar(20)
,`role_name` varchar(100)
,`role_level` bigint(11)
,`level` bigint(11)
,`id_language` int(11) unsigned
,`language` varchar(30)
,`last_login` datetime
,`last_login_unix` bigint(11)
,`last_ip` varchar(20)
,`login_try` int(2) unsigned
,`extends_data` text
,`deactivated` datetime
,`deactivated_unix` bigint(11)
);
-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
`id_user` int(11) unsigned NOT NULL,
  `login` varchar(50) NOT NULL,
  `encryption` enum('text','md5','sha256') DEFAULT 'text',
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
  `deleted` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- TÁBLA KAPCSOLATAI `users`:
--   `id_role`
--       `roles` -> `id_role`
--

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id_user`, `login`, `encryption`, `password`, `name`, `email`, `forname`, `lastname`, `gender`, `birthday`, `activated`, `registered`, `id_role`, `id_language`, `language`, `last_login`, `last_ip`, `login_try`, `extends_data`, `deactivated`, `deleted`) VALUES
(1, 'admin', 'text', 'admin', 'Admin User', 'admin@ionizecms.com', 'Admin', 'User', NULL, NULL, '2015-08-12 17:07:10', '2015-08-12 14:41:58', 1, 1, 'en', NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Nézet szerkezete `content`
--
DROP TABLE IF EXISTS `content`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `content` AS select `cnt`.`id_content` AS `id_content`,`cnt`.`code` AS `name`,group_concat(distinct `cntp`.`id_parent` order by `cntp`.`ordering` ASC separator ',') AS `id_parents`,`cntp`.`ordering` AS `ordering`,group_concat(distinct `cntc`.`id_content` order by `cntc`.`ordering` ASC separator ',') AS `id_childrens`,`cnt`.`id_type` AS `id_type`,`ctp`.`code` AS `type`,`cnt`.`publish_on` AS `publish_on`,unix_timestamp(`cnt`.`publish_on`) AS `publish_on_unix`,`cnt`.`publish_off` AS `publish_off`,unix_timestamp(`cnt`.`publish_off`) AS `publish_off_unix`,coalesce(`cnt`.`logical_date`,`cnt`.`created`) AS `logical_date`,unix_timestamp(coalesce(`cnt`.`logical_date`,`cnt`.`created`)) AS `logical_date_unix`,coalesce(`cnt`.`extends_data`,'[]') AS `extends_data`,`ctp`.`default_list_view` AS `default_list_view`,`ctp`.`default_single_view` AS `default_single_view`,`ctp`.`default_item_view` AS `default_item_view`,`cnt`.`list_view` AS `list_view`,`cnt`.`single_view` AS `single_view`,`cnt`.`item_view` AS `item_view`,(case when ((coalesce(`cntc`.`id_content`,0,1) = 1) and (`cnt`.`site_root` = 0)) then coalesce(`cnt`.`list_view`,`ctp`.`default_list_view`) when ((coalesce(`cntc`.`id_content`,0,1) = 0) and (`cnt`.`site_root` = 0)) then coalesce(`cnt`.`single_view`,`ctp`.`default_single_view`) when (`cnt`.`site_root` = 1) then 'page_home' else NULL end) AS `view`,`lng`.`id_language` AS `id_language`,`lng`.`code` AS `language`,`ctr`.`title` AS `title`,`ctr`.`subtitle` AS `subtitle`,`ctr`.`preview` AS `preview`,`ctr`.`window` AS `window`,`ctr`.`short_url` AS `short_url`,`ctr`.`long_url` AS `long_url`,`ctr`.`full_url` AS `url`,`ctr`.`content` AS `content`,`ctr`.`keywords` AS `keywords`,`ctr`.`description` AS `description`,coalesce(`ctr`.`extends_data`,'[]') AS `extends_data_lang`,`cnt`.`indexed` AS `indexed`,coalesce(`cnt`.`has_url`,0) AS `has_url`,coalesce(`cntc`.`id_content`,0,1) AS `has_children`,`cnt`.`flag` AS `flag`,`cnt`.`priority` AS `priority`,`ath`.`id_user` AS `id_author`,`cnt`.`created` AS `created`,unix_timestamp(`cnt`.`created`) AS `created_unix`,`ath`.`login` AS `author_login`,`ath`.`name` AS `author_name`,`ath`.`forname` AS `author_forname`,`ath`.`lastname` AS `author_lastname`,`ath`.`email` AS `author_email`,coalesce(`ath`.`extends_data`,'[]') AS `author_extends_data`,`upd`.`id_user` AS `id_updater`,`cnt`.`updated` AS `updated`,unix_timestamp(`cnt`.`updated`) AS `updated_unix`,`upd`.`login` AS `updater_login`,`upd`.`name` AS `updater_name`,`upd`.`forname` AS `updater_forname`,`upd`.`lastname` AS `updater_lastname`,`upd`.`email` AS `updater_email`,coalesce(`upd`.`extends_data`,'[]') AS `updater_extends_data`,`cnt`.`default_language` AS `default_language`,`cnt`.`site_root` AS `homepage` from (((((((`contents_translations` `ctr` left join `languages` `lng` on((`ctr`.`id_language` = `lng`.`id_language`))) left join `contents` `cnt` on((`ctr`.`id_content` = `cnt`.`id_content`))) left join `contents_relations` `cntp` on((`cntp`.`id_content` = `cnt`.`id_content`))) left join `contents_relations` `cntc` on((`cntc`.`id_parent` = `cnt`.`id_content`))) left join `contents_types` `ctp` on((`cnt`.`id_type` = `ctp`.`id_type`))) left join `users` `ath` on((`cnt`.`id_author` = `ath`.`id_user`))) left join `users` `upd` on((`cnt`.`id_updater` = `upd`.`id_user`))) where isnull(`cnt`.`deleted`) group by `ctr`.`id_translation`;

-- --------------------------------------------------------

--
-- Nézet szerkezete `language`
--
DROP TABLE IF EXISTS `language`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `language` AS select `l`.`id_language` AS `id_language`,`l`.`code` AS `language`,`l`.`ordering` AS `ordering`,`l`.`url` AS `code`,`l`.`name` AS `name`,`l`.`default` AS `default` from `languages` `l` order by `l`.`ordering`;

-- --------------------------------------------------------

--
-- Nézet szerkezete `navigation`
--
DROP TABLE IF EXISTS `navigation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `navigation` AS select `n`.`id_navigation` AS `id_navigation`,`n`.`ordering` AS `navigation_ordering`,`n`.`code` AS `code`,`n`.`name` AS `name`,`nc`.`id_item` AS `id_item`,`nc`.`level` AS `level`,`nc`.`ordering` AS `ordering`,`nc`.`id_url` AS `id_url`,`nc`.`id_content` AS `id_content`,`nc`.`id_parent` AS `id_parent`,`ncp`.`id_item` AS `parent_item`,`ncp`.`level` AS `parent_level`,`ncp`.`ordering` AS `parent_ordering`,`ncp`.`id_content` AS `parent_content`,`ncp`.`id_url` AS `parent_link` from ((`navigations` `n` join `navigations_contents` `nc` on((`nc`.`id_navigation` = `n`.`id_navigation`))) left join `navigations_contents` `ncp` on((`nc`.`id_parent` = `ncp`.`id_content`))) order by `n`.`ordering`,`nc`.`level`,`ncp`.`ordering`,`nc`.`ordering`;

-- --------------------------------------------------------

--
-- Nézet szerkezete `user`
--
DROP TABLE IF EXISTS `user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user` AS select `u`.`id_user` AS `id_user`,`u`.`login` AS `login`,`u`.`encryption` AS `encryption`,`u`.`password` AS `password`,`u`.`name` AS `name`,`u`.`email` AS `email`,`u`.`forname` AS `forname`,`u`.`lastname` AS `lastname`,`u`.`gender` AS `gender`,`u`.`birthday` AS `birthday`,unix_timestamp(`u`.`birthday`) AS `birthday_unix`,`u`.`activated` AS `activated`,unix_timestamp(`u`.`activated`) AS `activated_unix`,`u`.`registered` AS `registered`,unix_timestamp(`u`.`registered`) AS `registered_unix`,coalesce(`ur`.`id_role`,`dr`.`id_role`) AS `id_role`,coalesce(`ur`.`code`,`dr`.`code`) AS `role`,coalesce(`ur`.`name`,`dr`.`name`) AS `role_name`,coalesce(`ur`.`level`,`dr`.`level`) AS `role_level`,coalesce(`ur`.`level`,`dr`.`level`) AS `level`,`u`.`id_language` AS `id_language`,`u`.`language` AS `language`,`u`.`last_login` AS `last_login`,unix_timestamp(`u`.`last_login`) AS `last_login_unix`,`u`.`last_ip` AS `last_ip`,`u`.`login_try` AS `login_try`,`u`.`extends_data` AS `extends_data`,`u`.`deactivated` AS `deactivated`,unix_timestamp(`u`.`deactivated`) AS `deactivated_unix` from ((`users` `u` left join `roles` `ur` on((`ur`.`id_role` = `u`.`id_role`))) left join `roles` `dr` on((`dr`.`level` <= 100))) where isnull(`u`.`deleted`);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id_category`,`code`), ADD KEY `id_parent` (`id_parent`,`parent`), ADD KEY `id_category` (`id_category`);

--
-- Indexes for table `categories_translations`
--
ALTER TABLE `categories_translations`
 ADD PRIMARY KEY (`id_translation`), ADD KEY `id_category` (`id_category`), ADD KEY `id_language` (`id_language`,`language`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
 ADD PRIMARY KEY (`id_content`), ADD UNIQUE KEY `id_content` (`id_content`,`code`) USING BTREE, ADD KEY `content_type` (`id_type`), ADD KEY `content_author` (`id_author`,`author`), ADD KEY `content_updater` (`id_updater`,`updater`), ADD KEY `publish_on` (`publish_on`), ADD KEY `publish_off` (`publish_off`), ADD KEY `deleted` (`deleted`), ADD KEY `logical_date` (`logical_date`), ADD KEY `site_root` (`site_root`);

--
-- Indexes for table `contents_categories`
--
ALTER TABLE `contents_categories`
 ADD PRIMARY KEY (`id_con`), ADD KEY `id_content` (`id_content`), ADD KEY `id_category` (`id_category`), ADD KEY `id_creator` (`id_creator`,`creator`);

--
-- Indexes for table `contents_medias`
--
ALTER TABLE `contents_medias`
 ADD PRIMARY KEY (`id_con`), ADD KEY `id_content` (`id_content`), ADD KEY `id_media` (`id_media`), ADD KEY `id_creator` (`id_creator`,`creator`);

--
-- Indexes for table `contents_relations`
--
ALTER TABLE `contents_relations`
 ADD PRIMARY KEY (`id_relation`), ADD KEY `id_parent` (`id_parent`), ADD KEY `id_content` (`id_content`);

--
-- Indexes for table `contents_translations`
--
ALTER TABLE `contents_translations`
 ADD PRIMARY KEY (`id_translation`), ADD UNIQUE KEY `unique_translation` (`id_content`,`id_language`) USING BTREE, ADD KEY `translations_language` (`id_language`,`language`);

--
-- Indexes for table `contents_types`
--
ALTER TABLE `contents_types`
 ADD PRIMARY KEY (`id_type`,`code`), ADD KEY `id_type` (`id_type`);

--
-- Indexes for table `definitions`
--
ALTER TABLE `definitions`
 ADD PRIMARY KEY (`id_definition`,`code`), ADD KEY `id_definition` (`id_definition`), ADD KEY `id_content` (`id_content`), ADD KEY `id_media` (`id_media`), ADD KEY `id_type` (`id_type`);

--
-- Indexes for table `extends`
--
ALTER TABLE `extends`
 ADD PRIMARY KEY (`id_extend`), ADD UNIQUE KEY `unique_field` (`id_definition`,`code`) USING BTREE;

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
 ADD PRIMARY KEY (`id_language`,`code`,`url`), ADD KEY `id_language` (`id_language`,`code`);

--
-- Indexes for table `medias`
--
ALTER TABLE `medias`
 ADD PRIMARY KEY (`id_media`), ADD KEY `id_uploader` (`id_uploader`,`uploader`);

--
-- Indexes for table `medias_translations`
--
ALTER TABLE `medias_translations`
 ADD PRIMARY KEY (`id_translation`), ADD UNIQUE KEY `unique_translation` (`id_language`,`id_media`) USING BTREE, ADD KEY `id_media` (`id_media`), ADD KEY `id_language` (`id_language`,`language`);

--
-- Indexes for table `navigations`
--
ALTER TABLE `navigations`
 ADD PRIMARY KEY (`id_navigation`,`code`), ADD KEY `id_navigation` (`id_navigation`);

--
-- Indexes for table `navigations_contents`
--
ALTER TABLE `navigations_contents`
 ADD PRIMARY KEY (`id_item`), ADD KEY `id_navigation` (`id_navigation`), ADD KEY `id_content` (`id_content`), ADD KEY `id_creator` (`id_creator`,`creator`), ADD KEY `id_parent` (`id_parent`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
 ADD PRIMARY KEY (`id_role`,`code`), ADD KEY `id_role` (`id_role`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
 ADD PRIMARY KEY (`id`), ADD KEY `key_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
 ADD PRIMARY KEY (`id_settings`), ADD UNIQUE KEY `unique_setting` (`id_language`,`name`), ADD KEY `id_langauge` (`id_language`,`language`);

--
-- Indexes for table `urls`
--
ALTER TABLE `urls`
 ADD PRIMARY KEY (`id_url`), ADD UNIQUE KEY `unique_url` (`id_content`,`id_language`) USING BTREE, ADD KEY `urls_ibfk_1` (`id_language`,`language`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id_user`,`login`,`email`), ADD KEY `id_user` (`id_user`,`email`), ADD KEY `user_language` (`id_language`,`language`), ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id_category` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories_translations`
--
ALTER TABLE `categories_translations`
MODIFY `id_translation` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
MODIFY `id_content` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `contents_categories`
--
ALTER TABLE `contents_categories`
MODIFY `id_con` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contents_medias`
--
ALTER TABLE `contents_medias`
MODIFY `id_con` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contents_relations`
--
ALTER TABLE `contents_relations`
MODIFY `id_relation` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `contents_translations`
--
ALTER TABLE `contents_translations`
MODIFY `id_translation` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `contents_types`
--
ALTER TABLE `contents_types`
MODIFY `id_type` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `definitions`
--
ALTER TABLE `definitions`
MODIFY `id_definition` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
MODIFY `id_language` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `medias`
--
ALTER TABLE `medias`
MODIFY `id_media` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `medias_translations`
--
ALTER TABLE `medias_translations`
MODIFY `id_translation` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `navigations`
--
ALTER TABLE `navigations`
MODIFY `id_navigation` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `navigations_contents`
--
ALTER TABLE `navigations_contents`
MODIFY `id_item` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
MODIFY `id_role` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
MODIFY `id_settings` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `urls`
--
ALTER TABLE `urls`
MODIFY `id_url` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id_user` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `categories`
--
ALTER TABLE `categories`
ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`id_parent`, `parent`) REFERENCES `categories` (`id_category`, `code`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Megkötések a táblához `categories_translations`
--
ALTER TABLE `categories_translations`
ADD CONSTRAINT `categories_translations_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `categories_translations_ibfk_2` FOREIGN KEY (`id_language`, `language`) REFERENCES `languages` (`id_language`, `code`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Megkötések a táblához `contents`
--
ALTER TABLE `contents`
ADD CONSTRAINT `content_author` FOREIGN KEY (`id_author`, `author`) REFERENCES `users` (`id_user`, `email`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `content_type` FOREIGN KEY (`id_type`) REFERENCES `contents_types` (`id_type`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `content_updater` FOREIGN KEY (`id_updater`, `updater`) REFERENCES `users` (`id_user`, `email`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Megkötések a táblához `contents_categories`
--
ALTER TABLE `contents_categories`
ADD CONSTRAINT `contents_categories_ibfk_1` FOREIGN KEY (`id_content`) REFERENCES `contents` (`id_content`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `contents_categories_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `contents_categories_ibfk_3` FOREIGN KEY (`id_creator`, `creator`) REFERENCES `users` (`id_user`, `email`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Megkötések a táblához `contents_medias`
--
ALTER TABLE `contents_medias`
ADD CONSTRAINT `contents_medias_ibfk_1` FOREIGN KEY (`id_content`) REFERENCES `contents` (`id_content`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `contents_medias_ibfk_2` FOREIGN KEY (`id_media`) REFERENCES `medias` (`id_media`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `contents_medias_ibfk_3` FOREIGN KEY (`id_creator`, `creator`) REFERENCES `users` (`id_user`, `email`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Megkötések a táblához `contents_relations`
--
ALTER TABLE `contents_relations`
ADD CONSTRAINT `contents_relations_ibfk_1` FOREIGN KEY (`id_parent`) REFERENCES `contents` (`id_content`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `contents_relations_ibfk_2` FOREIGN KEY (`id_content`) REFERENCES `contents` (`id_content`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `contents_translations`
--
ALTER TABLE `contents_translations`
ADD CONSTRAINT `contents_translation` FOREIGN KEY (`id_content`) REFERENCES `contents` (`id_content`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `translations_language` FOREIGN KEY (`id_language`, `language`) REFERENCES `languages` (`id_language`, `code`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Megkötések a táblához `definitions`
--
ALTER TABLE `definitions`
ADD CONSTRAINT `definitions_ibfk_1` FOREIGN KEY (`id_content`) REFERENCES `contents` (`id_content`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `definitions_ibfk_2` FOREIGN KEY (`id_media`) REFERENCES `medias` (`id_media`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `definitions_ibfk_3` FOREIGN KEY (`id_type`) REFERENCES `contents_types` (`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `extends`
--
ALTER TABLE `extends`
ADD CONSTRAINT `extends_ibfk_1` FOREIGN KEY (`id_definition`) REFERENCES `definitions` (`id_definition`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `medias`
--
ALTER TABLE `medias`
ADD CONSTRAINT `medias_ibfk_1` FOREIGN KEY (`id_uploader`, `uploader`) REFERENCES `users` (`id_user`, `email`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Megkötések a táblához `medias_translations`
--
ALTER TABLE `medias_translations`
ADD CONSTRAINT `medias_translations_ibfk_1` FOREIGN KEY (`id_media`) REFERENCES `medias` (`id_media`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `medias_translations_ibfk_2` FOREIGN KEY (`id_language`, `language`) REFERENCES `languages` (`id_language`, `code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `navigations_contents`
--
ALTER TABLE `navigations_contents`
ADD CONSTRAINT `navigations_contents_ibfk_1` FOREIGN KEY (`id_navigation`) REFERENCES `navigations` (`id_navigation`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `navigations_contents_ibfk_2` FOREIGN KEY (`id_content`) REFERENCES `contents` (`id_content`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `navigations_contents_ibfk_3` FOREIGN KEY (`id_creator`, `creator`) REFERENCES `users` (`id_user`, `email`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `navigations_contents_ibfk_4` FOREIGN KEY (`id_parent`) REFERENCES `navigations_contents` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `settings`
--
ALTER TABLE `settings`
ADD CONSTRAINT `settings_ibfk_1` FOREIGN KEY (`id_language`, `language`) REFERENCES `languages` (`id_language`, `code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `urls`
--
ALTER TABLE `urls`
ADD CONSTRAINT `urls_ibfk_1` FOREIGN KEY (`id_language`, `language`) REFERENCES `languages` (`id_language`, `code`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `urls_ibfk_2` FOREIGN KEY (`id_content`) REFERENCES `contents` (`id_content`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `user_language` FOREIGN KEY (`id_language`, `language`) REFERENCES `languages` (`id_language`, `code`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`) ON DELETE SET NULL ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
