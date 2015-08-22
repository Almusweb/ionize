-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Hoszt: localhost
-- Létrehozás ideje: 2015. Aug 22. 16:19
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- TÁBLA KAPCSOLATAI `contents`:
--   `id_type`
--       `contents_types` -> `id_type`
--

--
-- A tábla adatainak kiíratása `contents`
--

INSERT INTO `contents` (`id_content`, `code`, `id_type`, `id_author`, `author`, `created`, `id_updater`, `updater`, `updated`, `publish_on`, `publish_off`, `logical_date`, `indexed`, `has_url`, `flag`, `priority`, `default_language`, `site_root`, `extends_data`, `list_view`, `item_view`, `single_view`, `deleted`) VALUES
(1, 'homepage', 1, 1, 'admin@ionizecms.com', '2015-08-12 15:09:28', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 5, 1, 1, NULL, NULL, NULL, NULL, NULL),
(2, 'whats_new', 1, 1, 'admin@ionizecms.com', '2015-08-20 23:34:07', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 5, 1, 0, NULL, 'page', NULL, NULL, NULL),
(3, 'codeigniter3', 2, 1, 'admin@ionizecms.com', '2015-08-21 00:10:31', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 5, 1, 0, NULL, NULL, NULL, 'page', NULL),
(4, 'database', 2, 1, 'admin@ionizecms.com', '2015-08-21 08:20:55', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 5, 1, 0, NULL, NULL, NULL, 'page', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
(2, 2, 4, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- TÁBLA KAPCSOLATAI `contents_translations`:
--   `id_content`
--       `contents` -> `id_content`
--

--
-- A tábla adatainak kiíratása `contents_translations`
--

INSERT INTO `contents_translations` (`id_translation`, `id_content`, `id_language`, `language`, `title`, `subtitle`, `window`, `navigation`, `short_url`, `long_url`, `full_url`, `preview`, `content`, `extends_data`, `keywords`, `description`) VALUES
(1, 1, 1, 'en_US', 'Welcome to ionize 2.0', 'Welcome!', NULL, NULL, NULL, 'welcome', '/welcome', NULL, '<p>For more information about building a website with Ionize, you can:</p> <ul><li>Download &amp; read <a href="http://www.ionizecms.com">the Documentation</a></li><li>Visit <a href="http://www.ionizecms.com/forum">the Community Forum</a></li></ul><p>Have fun !</p>', NULL, NULL, NULL),
(3, 2, 1, 'en_US', 'What''s new?', NULL, NULL, NULL, NULL, 'whats-new', '/whats-new', '<p class="justify">The new Ionize 2.0 comming with huge features, the core was completley rewritten, the performace was boosted up to 4000 request per second (with full cache), cache now has levels, the dataclasses can cached seperate, the database has rewritten, and from now Ionize will support other template engines and Ionize core template engine has been rewritten for performance.</p>', '<p class="justify">The new Ionize 2.0 comming with huge features, the core was completley rewritten, the performace was boosted up to 4000 request per second (with full cache), cache now has levels, the dataclasses can cached seperate, the database has rewritten, and from now Ionize will support other template engines and Ionize core template engine has been rewritten for performance.</p>', NULL, NULL, NULL),
(4, 3, 1, 'en_US', 'Codeigniter 3.0', NULL, NULL, NULL, NULL, 'codeigniter3', '/whats-new/codeigniter3', '<p class="justify">The Codeigniter framework was replaced to Codeigniter 3.0, the core files was rewritten completely, now the database models and the content objects has seperate classes with namespaces. The core now functioning as a HMVVMC Hierarchical Model–View-ViewModel–Controller structure. The database model view access from now forbidden for security reasons.</p>', '<p class="justify">The Codeigniter framework was replaced to Codeigniter 3.0, the core files was rewritten completely, now the database models and the content objects has seperate classes with namespaces. The core now functioning as a HMVVMC Hierarchical Model–View-ViewModel–Controller structure. The database model view access from now forbidden for security reasons.</p>', NULL, NULL, NULL),
(5, 4, 1, 'en_US', 'Database', NULL, NULL, NULL, NULL, 'database', '/whats-new/database', '<p class="justify">New remaked Database structure with Views, Triggers, Procedures and Functions. The Database now generating and cleaning itself and contents generator functions can be use for developments.</p>', '<p class="justify">New remaked Database structure with Views, Triggers, Procedures and Functions. The Database now generating and cleaning itself and contents generator functions can be use for developments.</p>', NULL, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `languages`
--

INSERT INTO `languages` (`id_language`, `code`, `url`, `name`, `ordering`, `default`) VALUES
(1, 'en_US', 'en', 'English', 0, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
('7e422a3d87f98bbcca9bb98ad9b27d0a846c65a0', '127.0.0.1', 1440252380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303235323038333b6c616e67756167657c733a353a22656e5f5553223b),
('c1426b487bb5b57240b60530aadb37a078a37f4e', '127.0.0.1', 1440253127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303235333131363b6c616e67756167657c733a353a22656e5f5553223b),
('d5e1a9981e94250df2149f0fe557d260b46cc559', '127.0.0.1', 1440252465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434303235323431363b6c616e67756167657c733a353a22656e5f5553223b);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `settings`
--

INSERT INTO `settings` (`id_settings`, `id_language`, `language`, `name`, `value`) VALUES
(1, NULL, NULL, 'language', 'en_US'),
(2, NULL, NULL, 'theme', 'Default_Native'),
(3, 1, 'en_US', 'site_title', 'My Website');

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
(1, 'admin', 'text', 'admin', 'Admin User', 'admin@ionizecms.com', 'Admin', 'User', NULL, NULL, '2015-08-12 17:07:10', '2015-08-12 14:41:58', 1, 1, 'en_US', NULL, NULL, 0, NULL, NULL, NULL);

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
MODIFY `id_content` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
MODIFY `id_relation` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `contents_translations`
--
ALTER TABLE `contents_translations`
MODIFY `id_translation` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
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
MODIFY `id_language` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `medias`
--
ALTER TABLE `medias`
MODIFY `id_media` int(11) unsigned NOT NULL AUTO_INCREMENT;
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
MODIFY `id_item` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
MODIFY `id_role` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
MODIFY `id_settings` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
