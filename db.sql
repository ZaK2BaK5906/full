-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           12.1.2-MariaDB - MariaDB Server
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.13.0.7147
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour zak
CREATE DATABASE IF NOT EXISTS `zak` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `zak`;

-- Listage de la structure de table zak. addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.addon_account : ~14 rows (environ)
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Savings account', 0),
	('caution', 'caution', 0),
	('society_ambulance', 'EMS', 1),
	('society_banker', 'Bank', 1),
	('society_beans', 'Beans Coffee', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_casino', 'Casino', 1),
	('society_concess', 'Concessionnaire', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_pops', 'Pop\'s Diner', 1),
	('society_realestate', 'Real Estate Society', 1),
	('society_taxi', 'Taxi', 1),
	('society_unicorn', 'Unicorn Night Club', 1),
	('society_upnatom', 'Up\'N Atom Burger', 1);

-- Listage de la structure de table zak. addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.addon_account_data : ~13 rows (environ)
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_cardealer', 5000000, NULL),
	(2, 'society_police', 0, NULL),
	(3, 'society_ambulance', 0, NULL),
	(4, 'society_mechanic', 41000, NULL),
	(5, 'society_taxi', 0, NULL),
	(9, 'society_realestate', 0, NULL),
	(10, 'society_harmony', 4500, NULL),
	(11, 'society_upnatom', 0, NULL),
	(12, 'society_pops', 0, NULL),
	(13, 'society_beans', 0, NULL),
	(14, 'society_unicorn', 0, NULL),
	(15, 'society_concess', 17500, NULL),
	(17, 'society_taxi', 0, NULL);

-- Listage de la structure de table zak. addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.addon_inventory : ~7 rows (environ)
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('casino', 'Casino', 0),
	('drugs', 'Drugs', 0),
	('propery', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);

-- Listage de la structure de table zak. addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.addon_inventory_items : ~0 rows (environ)

-- Listage de la structure de table zak. banking
CREATE TABLE IF NOT EXISTS `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(11) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.banking : ~0 rows (environ)

-- Listage de la structure de table zak. bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `license` varchar(64) DEFAULT NULL,
  `discord` varchar(64) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` bigint(20) unsigned NOT NULL,
  `bannedby` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.bans : ~0 rows (environ)

-- Listage de la structure de table zak. billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.billing : ~0 rows (environ)

-- Listage de la structure de table zak. boutique_admins
CREATE TABLE IF NOT EXISTS `boutique_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `added_by` varchar(50) NOT NULL,
  `added_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.boutique_admins : ~0 rows (environ)

-- Listage de la structure de table zak. bulletproof
CREATE TABLE IF NOT EXISTS `bulletproof` (
  `identifier` varchar(46) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.bulletproof : ~7 rows (environ)
INSERT INTO `bulletproof` (`identifier`, `quantity`) VALUES
	('e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 0),
	('ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 0),
	('72e2349201e0683aa2540804c45f566df0755123', 0),
	('fcb47b307801e586e8c95881bdfc98004f24d031', 0),
	('d80bf51e74a6e4cc571852f5de48f019df1f37ff', 0),
	('28a24dc4b57feb9580c57626e3c03439a900f876', 0),
	('09e089f17095e762c4d5fa0c760cb95ff555a4e6', 0);

-- Listage de la structure de table zak. cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.cardealer_vehicles : ~0 rows (environ)

-- Listage de la structure de table zak. carsale_vehicles
CREATE TABLE IF NOT EXISTS `carsale_vehicles` (
  `plate` varchar(40) NOT NULL,
  `vehicle` longtext NOT NULL,
  `price` int(11) DEFAULT NULL,
  `state` varchar(20) NOT NULL,
  `job` varchar(40) NOT NULL,
  `coords` longtext DEFAULT NULL,
  `time` bigint(25) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.carsale_vehicles : ~0 rows (environ)

-- Listage de la structure de table zak. casino_blocked_players
CREATE TABLE IF NOT EXISTS `casino_blocked_players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(90) NOT NULL DEFAULT '0',
  `reason` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.casino_blocked_players : ~0 rows (environ)

-- Listage de la structure de table zak. casino_memberships
CREATE TABLE IF NOT EXISTS `casino_memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(90) NOT NULL DEFAULT '0',
  `chips` int(11) NOT NULL DEFAULT 0,
  `vip` tinyint(1) DEFAULT 0,
  `luckywheel_date` timestamp NULL DEFAULT current_timestamp(),
  `chip_buy_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.casino_memberships : ~4 rows (environ)
INSERT INTO `casino_memberships` (`id`, `identifier`, `chips`, `vip`, `luckywheel_date`, `chip_buy_date`) VALUES
	(1, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 200, 1, '2025-12-01 12:40:12', '2025-11-30 12:39:00'),
	(7, 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 0, 1, '2025-12-03 21:09:34', '2025-11-30 13:53:54'),
	(10, 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 0, 0, '2025-12-03 20:54:54', '2025-12-04 20:55:16'),
	(14, 'char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 80500, 0, '2025-12-04 16:34:49', '2025-12-05 16:35:11');

-- Listage de la structure de table zak. clothing_job_outfits
CREATE TABLE IF NOT EXISTS `clothing_job_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(80) NOT NULL DEFAULT '0',
  `label` varchar(80) NOT NULL DEFAULT '',
  `job` varchar(50) NOT NULL DEFAULT '0',
  `grades` text NOT NULL,
  `model` varchar(80) NOT NULL DEFAULT '',
  `components` text NOT NULL,
  `props` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.clothing_job_outfits : ~0 rows (environ)

-- Listage de la structure de table zak. clothing_player_outfits
CREATE TABLE IF NOT EXISTS `clothing_player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(80) NOT NULL DEFAULT '0',
  `label` varchar(80) NOT NULL DEFAULT '0',
  `model` varchar(80) NOT NULL DEFAULT '0',
  `components` text DEFAULT NULL,
  `props` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.clothing_player_outfits : ~0 rows (environ)

-- Listage de la structure de table zak. clothing_stores
CREATE TABLE IF NOT EXISTS `clothing_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(80) DEFAULT '0',
  `name` varchar(50) DEFAULT '0',
  `type` varchar(50) DEFAULT '0',
  `zone` text DEFAULT NULL,
  `show_blip` tinyint(1) DEFAULT 0,
  `config` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.clothing_stores : ~0 rows (environ)

-- Listage de la structure de table zak. codem_venicehud_data
CREATE TABLE IF NOT EXISTS `codem_venicehud_data` (
  `identifier` varchar(65) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `stress` int(11) DEFAULT NULL,
  UNIQUE KEY `identifier` (`identifier`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.codem_venicehud_data : ~8 rows (environ)
INSERT INTO `codem_venicehud_data` (`identifier`, `data`, `stress`) VALUES
	('char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', '{"hud":"venicehud","hudColors":{"venicehud":{"thirst":"#4886FFac","parachute":"#48FFBDac","stress":"#48A7FFac","hunger":"#FFA048ac","armor":"#fafafa","stamina":"#C4FF48ac","altitude":"#00FFF0ac","health":"#FF4848ac","oxy":"#48A7FFac","nitro":"#AFFF48ac"},"belairhud":{"thirst":"#00C6BA","parachute":"#48ffde","stress":"","hunger":"#FF8A00","health":"#FF8A00","stamina":"#59a10c","altitude":"#48deff","nitro":"#8eff48","oxy":"#48A7FFac","armor":""},"malibuhud":{"thirst":"#4886FF","parachute":"#48FFBD","stress":"#48A7FF","hunger":"#FFA048","armor":"#FFFFFF","stamina":"#C4FF48","altitude":"#00FFF0","health":"#FF4848","oxy":"#48A7FF","nitro":"#AFFF48"}},"hudsize":"0.7","speedometerSize":"0.7","showHideBox":false,"carhud":"vertexhud","speedtype":"kmh","positionsData":{"radial-hunger":{"top":"-18.19061279296875px","left":"172.38751220703125px","position":"absolute"},"radial-armor":{"top":"-19.190673828125px","left":"260.38751220703125px","position":"absolute"},"radial-stamina":{"top":"-16.190673828125px","left":"130.3874969482422px","position":"absolute"},"radial-thirst":{"top":"-16.784423828125px","left":"46.76249694824219px","position":"absolute"},"vertexhuds":{"top":"975.1968994140625px","left":"614.7906494140625px","position":"absolute"},"radial-health":{"top":"-19.784423828125px","left":"213.76251220703125px","position":"absolute"},"perspecthuds":{"top":"959px","left":"726px","position":"absolute"},"radial-stress":{"top":"-17.190673828125px","left":"90.38749694824219px","position":"absolute"},"radial-microphone":{"top":"-20.190673828125px","left":"4.200000762939453px","position":"absolute"}},"hideBoxData":{"health":100,"stamina":100,"oxy":100,"stress":100,"water":100,"hunger":100,"armor":100},"showmenu":{"showmoney":true,"showlogo":false,"showphonekey":false,"showid":true,"showonline":true,"showjob":true,"showmickey":false,"showammo":true,"showmenukey":false,"showinventorykey":false},"hide":false,"carhudColors":{"vertexhud":{"health":"#34a199","gas":"#34a199","speed":"#34a199"},"mayhemhud":{"s200":"#00ffff84","s100":"#00ffff","s140":"#00ffff","s20":"#00ffff","s240":"#00ffff84","s40":"#00ffff84","speed":"#FF4848","gas":"#00ffff","s80":"#00ffff84","s120":"#00ffff84","shift":"#FF4848","circle":"#FF4848","s220":"#00ffff","needle":"#FF4848","wind":"#FF4848","health":"#FF4848","nitro":"#00ffff","s260":"#00ffff","altitude":"#00ffff","s160":"#00ffff84","s0":"#00ffff84","s180":"#00ffff","s60":"#00ffff"},"perspecthud":{"nitro":"#e71313","health":"#e71313","wind":"#e71313","altitude":"#e71313","speed":"#e71313","gas":"#e71313","roads":"#e71313","shift":"#e71313"}}}', 0),
	('char0:72e2349201e0683aa2540804c45f566df0755123', '{"hud":"belairhud","hudColors":{"venicehud":{"thirst":"#4886FFac","parachute":"#48FFBDac","stress":"#48A7FFac","hunger":"#FFA048ac","armor":"#fafafa","stamina":"#C4FF48ac","altitude":"#00FFF0ac","health":"#FF4848ac","oxy":"#48A7FFac","nitro":"#AFFF48ac"},"belairhud":{"thirst":"#00C6BA","parachute":"#48ffde","stress":"","hunger":"#FF8A00","health":"#FF8A00","stamina":"#59a10c","altitude":"#48deff","nitro":"#8eff48","oxy":"#48A7FFac","armor":""},"malibuhud":{"thirst":"#4886FF","parachute":"#48FFBD","stress":"#48A7FF","hunger":"#FFA048","armor":"#FFFFFF","stamina":"#C4FF48","altitude":"#00FFF0","health":"#FF4848","oxy":"#48A7FF","nitro":"#AFFF48"}},"hudsize":"0.8","speedometerSize":"1.3","showHideBox":false,"carhud":"perspecthud","speedtype":"kmh","positionsData":{"radial-stress":[],"radial-hunger":[],"radial-armor":[],"radial-health":[],"perspecthuds":{"top":"1215px","left":"1200px","position":"absolute"},"radial-stamina":[],"radial-microphone":[]},"hideBoxData":{"health":100,"stamina":100,"oxy":100,"stress":100,"water":100,"hunger":100,"armor":100},"showmenu":{"showmoney":true,"showlogo":false,"showphonekey":false,"showid":true,"showonline":true,"showjob":true,"showmickey":false,"showammo":true,"showmenukey":false,"showinventorykey":false},"hide":false,"carhudColors":{"vertexhud":{"health":"#34a199","gas":"#34a199","speed":"#34a199"},"mayhemhud":{"s200":"#00ffff84","s100":"#00ffff","s140":"#00ffff","s20":"#00ffff","s240":"#00ffff84","s40":"#00ffff84","speed":"#FF4848","gas":"#00ffff","s80":"#00ffff84","s120":"#00ffff84","shift":"#FF4848","circle":"#FF4848","s220":"#00ffff","needle":"#FF4848","wind":"#FF4848","health":"#FF4848","nitro":"#00ffff","s260":"#00ffff","altitude":"#00ffff","s160":"#00ffff84","s0":"#00ffff84","s180":"#00ffff","s60":"#00ffff"},"perspecthud":{"nitro":"#e71313","health":"#e71313","wind":"#e71313","altitude":"#e71313","speed":"#e71313","gas":"#e71313","roads":"#e71313","shift":"#e71313"}}}', 0),
	('char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{"showHideBox":false,"positionsData":{"radial-stress":{"top":"-13.796875px","left":"514px","position":"absolute"},"belair-stress":{"top":"-1332px","left":"3334px","position":"absolute"},"belair-microphone":{"top":"-10px","left":"3316px","position":"absolute"}},"hud":"belairhud","speedometerSize":1.2,"carhudColors":{"perspecthud":{"wind":"#e71313","shift":"#e71313","altitude":"#e71313","health":"#e71313","gas":"#e71313","roads":"#e71313","speed":"#e71313","nitro":"#e71313"},"vertexhud":{"gas":"#34a199","speed":"#34a199","health":"#34a199"},"mayhemhud":{"s200":"#00ffff84","s100":"#00ffff","s260":"#00ffff","s160":"#00ffff84","gas":"#00ffff","speed":"#FF4848","s80":"#00ffff84","s20":"#00ffff","s60":"#00ffff","needle":"#FF4848","s180":"#00ffff","s140":"#00ffff","circle":"#FF4848","s240":"#00ffff84","shift":"#FF4848","health":"#FF4848","s40":"#00ffff84","s220":"#00ffff","altitude":"#00ffff","wind":"#FF4848","s120":"#00ffff84","nitro":"#00ffff","s0":"#00ffff84"}},"hudsize":1.0,"hudColors":{"malibuhud":{"stress":"#48A7FF","armor":"#FFFFFF","health":"#FF4848","thirst":"#4886FF","stamina":"#C4FF48","altitude":"#00FFF0","hunger":"#FFA048","nitro":"#AFFF48","oxy":"#48A7FF","parachute":"#48FFBD"},"venicehud":{"stress":"#48A7FFac","armor":"#fafafa","health":"#FF4848ac","thirst":"#4886FFac","stamina":"#C4FF48ac","altitude":"#00FFF0ac","hunger":"#FFA048ac","nitro":"#AFFF48ac","oxy":"#48A7FFac","parachute":"#48FFBDac"},"belairhud":{"stress":"","armor":"","health":"#fc0000","thirst":"#00C6BA","stamina":"#59a10c","altitude":"#48deff","hunger":"#FF8A00","parachute":"#48ffde","nitro":"#8eff48","oxy":"#48A7FFac"}},"showmenu":{"showammo":true,"showjob":true,"showphonekey":false,"showlogo":false,"showid":true,"showonline":true,"showinventorykey":false,"showmoney":true,"showmenukey":false,"showmickey":false},"speedtype":"kmh","hide":false,"hideBoxData":{"stress":100,"armor":100,"health":100,"water":100,"oxy":100,"hunger":100,"stamina":100},"carhud":"mayhemhud"}', 0),
	('char0:28a24dc4b57feb9580c57626e3c03439a900f876', '{"speedtype":"kmh","hide":false,"speedometerSize":1.2,"showHideBox":false,"carhudColors":{"vertexhud":{"speed":"#00FFF0","health":"#00FFF0","gas":"#00FFF0"},"mayhemhud":{"s140":"#00ffff","s240":"#00ffff84","s180":"#00ffff","shift":"#FF4848","altitude":"#00ffff","s200":"#00ffff84","s100":"#00ffff","s40":"#00ffff84","wind":"#FF4848","s60":"#00ffff","s160":"#00ffff84","speed":"#FF4848","circle":"#FF4848","s0":"#00ffff84","s80":"#00ffff84","nitro":"#00ffff","health":"#FF4848","gas":"#00ffff","needle":"#FF4848","s220":"#00ffff","s120":"#00ffff84","s260":"#00ffff","s20":"#00ffff"},"perspecthud":{"shift":"#00FFF0","roads":"#00FFF0","altitude":"#00FFF0","wind":"#00FFF0","speed":"#00FFF0","health":"#00FFF0","gas":"#00FFF0","nitro":"#00FFF0"}},"positionsData":[],"carhud":"mayhemhud","hideBoxData":{"stress":100,"armor":100,"oxy":100,"hunger":100,"health":100,"stamina":100,"water":100},"showmenu":{"showid":true,"showmoney":true,"showlogo":false,"showammo":false,"showphonekey":false,"showinventorykey":false,"showmenukey":false,"showmickey":false,"showjob":true,"showonline":true},"hudColors":{"malibuhud":{"armor":"#FFFFFF","health":"#FF4848","stress":"#48A7FF","altitude":"#00FFF0","hunger":"#FFA048","oxy":"#48A7FF","parachute":"#48FFBD","thirst":"#4886FF","stamina":"#C4FF48","nitro":"#AFFF48"},"venicehud":{"armor":"#FFFFFFac","health":"#FF4848ac","stress":"#48A7FFac","altitude":"#00FFF0ac","hunger":"#FFA048ac","parachute":"#48FFBDac","oxy":"#48A7FFac","thirst":"#4886FFac","stamina":"#C4FF48ac","nitro":"#AFFF48ac"},"belairhud":{"armor":"#2E3893","health":"#FF8A00","stress":"#CD007B","altitude":"#48deff","hunger":"#FF8A00","parachute":"#48ffde","thirst":"#00C6BA","oxy":"#48A7FFac","stamina":"#c4ff48","nitro":"#8eff48"}},"hudsize":1.0,"hud":"malibuhud"}', 0),
	('char0:fcb47b307801e586e8c95881bdfc98004f24d031', '{"carhudColors":{"perspecthud":{"gas":"#20f675","wind":"#20f675","health":"#20f675","speed":"#20f675","shift":"#20f675","roads":"#20f675","nitro":"#20f675","altitude":"#20f675"},"mayhemhud":{"s80":"#00ffff84","s60":"#00ffff","s0":"#00ffff84","needle":"#FF4848","health":"#FF4848","s20":"#00ffff","s240":"#00ffff84","s180":"#00ffff","s140":"#00ffff","gas":"#00ffff","shift":"#FF4848","wind":"#FF4848","altitude":"#00ffff","s200":"#00ffff84","nitro":"#00ffff","s40":"#00ffff84","circle":"#FF4848","s220":"#00ffff","s100":"#00ffff","speed":"#FF4848","s120":"#00ffff84","s260":"#00ffff","s160":"#00ffff84"},"vertexhud":{"gas":"#00FFF0","health":"#00FFF0","speed":"#00FFF0"}},"showmenu":{"showinventorykey":false,"showjob":true,"showmoney":true,"showid":true,"showonline":true,"showammo":true,"showmenukey":true,"showlogo":true,"showmickey":true,"showphonekey":true},"hide":false,"hudColors":{"venicehud":{"stress":"#48A7FFac","hunger":"#FFA048ac","nitro":"#AFFF48ac","thirst":"#4886FFac","health":"#FF4848ac","parachute":"#48FFBDac","armor":"#FFFFFFac","stamina":"#C4FF48ac","oxy":"#48A7FFac","altitude":"#00FFF0ac"},"belairhud":{"stress":"","hunger":"","nitro":"#8eff48","thirst":"","health":"#FF8A00","parachute":"#48ffde","armor":"","stamina":"","oxy":"","altitude":"#48deff"},"malibuhud":{"stress":"#48A7FF","hunger":"#FFA048","nitro":"#AFFF48","thirst":"#4886FF","health":"#FF4848","parachute":"#48FFBD","armor":"#FFFFFF","stamina":"#C4FF48","oxy":"#48A7FF","altitude":"#00FFF0"}},"hudsize":1.0,"speedtype":"kmh","carhud":"perspecthud","speedometerSize":1.2,"hideBoxData":{"stress":100,"armor":100,"health":100,"water":100,"stamina":100,"oxy":100,"hunger":100},"positionsData":{"belair-health":{"left":"1673px","top":"-978px","position":"absolute"},"belair-stress":{"left":"1061px","top":"-164px","position":"absolute"},"belair-thirst":{"left":"1779px","top":"-978px","position":"absolute"},"belair-stamina":{"left":"532px","top":"-5px","position":"absolute"},"belair-hunger":{"left":"1668px","top":"-771px","position":"absolute"}},"showHideBox":false,"hud":"belairhud"}', 0),
	('char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', '{"showHideBox":false,"carhud":"mayhemhud","hudsize":1.0,"speedometerSize":1.2,"hudColors":{"belairhud":{"stamina":"#c4ff48","armor":"#2E3893","parachute":"#48ffde","altitude":"#48deff","oxy":"#48A7FFac","nitro":"#8eff48","health":"#FF8A00","thirst":"#00C6BA","hunger":"#FF8A00","stress":"#CD007B"},"venicehud":{"stamina":"#C4FF48ac","armor":"#FFFFFFac","parachute":"#48FFBDac","altitude":"#00FFF0ac","oxy":"#48A7FFac","nitro":"#AFFF48ac","health":"#FF4848ac","thirst":"#4886FFac","hunger":"#FFA048ac","stress":"#48A7FFac"},"malibuhud":{"stamina":"#C4FF48","armor":"#FFFFFF","parachute":"#48FFBD","altitude":"#00FFF0","oxy":"#48A7FF","nitro":"#AFFF48","health":"#FF4848","thirst":"#4886FF","hunger":"#FFA048","stress":"#48A7FF"}},"hud":"malibuhud","hide":false,"carhudColors":{"vertexhud":{"health":"#00FFF0","gas":"#00FFF0","speed":"#00FFF0"},"perspecthud":{"shift":"#00FFF0","gas":"#00FFF0","roads":"#00FFF0","nitro":"#00FFF0","health":"#00FFF0","altitude":"#00FFF0","speed":"#00FFF0","wind":"#00FFF0"},"mayhemhud":{"s260":"#00ffff","gas":"#00ffff","s160":"#00ffff84","shift":"#FF4848","needle":"#FF4848","speed":"#FF4848","s200":"#00ffff84","s100":"#00ffff","s80":"#00ffff84","s240":"#00ffff84","altitude":"#00ffff","s0":"#00ffff84","s20":"#00ffff","s40":"#00ffff84","wind":"#FF4848","nitro":"#00ffff","health":"#FF4848","s180":"#00ffff","circle":"#FF4848","s220":"#00ffff","s120":"#00ffff84","s140":"#00ffff","s60":"#00ffff"}},"hideBoxData":{"oxy":100,"stamina":100,"hunger":100,"health":100,"armor":100,"water":100,"stress":100},"speedtype":"kmh","positionsData":[],"showmenu":{"showmenukey":false,"showid":true,"showonline":true,"showlogo":false,"showinventorykey":false,"showjob":true,"showmickey":false,"showphonekey":false,"showammo":false,"showmoney":true}}', 0),
	('char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', '{"hideBoxData":{"oxy":100,"armor":100,"hunger":100,"stress":100,"water":100,"health":100,"stamina":100},"hudsize":1.0,"speedtype":"kmh","hudColors":{"malibuhud":{"stamina":"#C4FF48","altitude":"#00FFF0","nitro":"#AFFF48","oxy":"#48A7FF","armor":"#FFFFFF","hunger":"#FFA048","parachute":"#48FFBD","stress":"#48A7FF","health":"#FF4848","thirst":"#4886FF"},"belairhud":{"stamina":"#c4ff48","altitude":"#48deff","nitro":"#8eff48","oxy":"#48A7FFac","armor":"#2E3893","hunger":"#FF8A00","parachute":"#48ffde","stress":"#CD007B","health":"#FF8A00","thirst":"#00C6BA"},"venicehud":{"stamina":"#C4FF48ac","altitude":"#00FFF0ac","nitro":"#AFFF48ac","oxy":"#48A7FFac","armor":"#FFFFFFac","hunger":"#FFA048ac","parachute":"#48FFBDac","stress":"#48A7FFac","health":"#FF4848ac","thirst":"#4886FFac"}},"showHideBox":false,"carhudColors":{"mayhemhud":{"shift":"#FF4848","altitude":"#00ffff","nitro":"#00ffff","wind":"#FF4848","s200":"#00ffff84","s100":"#00ffff","s180":"#00ffff","circle":"#FF4848","s40":"#00ffff84","s120":"#00ffff84","health":"#FF4848","s0":"#00ffff84","s140":"#00ffff","needle":"#FF4848","speed":"#FF4848","s20":"#00ffff","s220":"#00ffff","s260":"#00ffff","s160":"#00ffff84","s240":"#00ffff84","s80":"#00ffff84","gas":"#00ffff","s60":"#00ffff"},"perspecthud":{"shift":"#00FFF0","roads":"#00FFF0","altitude":"#00FFF0","gas":"#00FFF0","nitro":"#00FFF0","wind":"#00FFF0","speed":"#00FFF0","health":"#00FFF0"},"vertexhud":{"gas":"#00FFF0","speed":"#00FFF0","health":"#00FFF0"}},"speedometerSize":1.2,"hide":false,"showmenu":{"showlogo":false,"showmoney":true,"showmickey":false,"showid":true,"showjob":true,"showphonekey":false,"showammo":false,"showinventorykey":false,"showonline":true,"showmenukey":false},"hud":"malibuhud","positionsData":[],"carhud":"mayhemhud"}', 0),
	('char0:2c04a8506e426a0867af88aada9d2698cebb7d18', '{"showHideBox":false,"hide":false,"carhud":"mayhemhud","hideBoxData":{"oxy":100,"hunger":100,"armor":100,"stamina":100,"water":100,"stress":100,"health":100},"hud":"malibuhud","showmenu":{"showinventorykey":false,"showid":true,"showonline":true,"showjob":true,"showammo":false,"showlogo":false,"showmickey":false,"showphonekey":false,"showmoney":true,"showmenukey":false},"hudsize":1.0,"positionsData":[],"speedometerSize":1.2,"speedtype":"kmh","hudColors":{"venicehud":{"oxy":"#48A7FFac","parachute":"#48FFBDac","hunger":"#FFA048ac","health":"#FF4848ac","nitro":"#AFFF48ac","armor":"#FFFFFFac","stamina":"#C4FF48ac","altitude":"#00FFF0ac","stress":"#48A7FFac","thirst":"#4886FFac"},"malibuhud":{"oxy":"#48A7FF","parachute":"#48FFBD","hunger":"#FFA048","health":"#FF4848","nitro":"#AFFF48","armor":"#FFFFFF","stamina":"#C4FF48","altitude":"#00FFF0","stress":"#48A7FF","thirst":"#4886FF"},"belairhud":{"oxy":"#48A7FFac","parachute":"#48ffde","hunger":"#FF8A00","health":"#FF8A00","nitro":"#8eff48","armor":"#2E3893","stamina":"#c4ff48","altitude":"#48deff","stress":"#CD007B","thirst":"#00C6BA"}},"carhudColors":{"vertexhud":{"speed":"#00FFF0","gas":"#00FFF0","health":"#00FFF0"},"perspecthud":{"roads":"#00FFF0","nitro":"#00FFF0","altitude":"#00FFF0","shift":"#00FFF0","wind":"#00FFF0","speed":"#00FFF0","gas":"#00FFF0","health":"#00FFF0"},"mayhemhud":{"s100":"#00ffff","shift":"#FF4848","s0":"#00ffff84","s140":"#00ffff","needle":"#FF4848","s240":"#00ffff84","nitro":"#00ffff","wind":"#FF4848","speed":"#FF4848","s80":"#00ffff84","s60":"#00ffff","s40":"#00ffff84","s220":"#00ffff","s260":"#00ffff","s160":"#00ffff84","s20":"#00ffff","s180":"#00ffff","s200":"#00ffff84","circle":"#FF4848","health":"#FF4848","gas":"#00ffff","altitude":"#00ffff","s120":"#00ffff84"}}}', 0);

-- Listage de la structure de table zak. concess_orders
CREATE TABLE IF NOT EXISTS `concess_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_model` varchar(50) NOT NULL,
  `vehicle_name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `status` enum('pending','in_progress','completed','cancelled') NOT NULL DEFAULT 'pending',
  `ordered_by` varchar(60) NOT NULL,
  `ordered_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `completed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.concess_orders : ~6 rows (environ)
INSERT INTO `concess_orders` (`id`, `vehicle_model`, `vehicle_name`, `quantity`, `total_price`, `status`, `ordered_by`, `ordered_at`, `completed_at`) VALUES
	(1, 'blista', 'Blista', 3, 36000, 'in_progress', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '2025-11-29 22:00:34', NULL),
	(2, 'blista', 'Blista', 1, 12000, 'in_progress', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '2025-11-30 12:48:23', NULL),
	(3, 'blista', 'Blista', 1, 12000, 'completed', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '2025-11-30 13:02:34', '2025-11-30 13:03:53'),
	(4, 'asterope', 'Asterope', 1, 18000, 'completed', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '2025-11-30 13:49:25', '2025-11-30 13:55:10'),
	(5, 'panto', 'Panto', 3, 28500, 'completed', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '2025-11-30 15:32:58', '2025-11-30 15:34:22'),
	(6, 'brioso', 'Brioso R/A', 1, 15000, 'in_progress', 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', '2025-11-30 15:54:45', NULL);

-- Listage de la structure de table zak. concess_stock
CREATE TABLE IF NOT EXISTS `concess_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_model` varchar(50) NOT NULL,
  `vehicle_name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `buy_price` int(11) NOT NULL,
  `sell_price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vehicle_model` (`vehicle_model`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.concess_stock : ~3 rows (environ)
INSERT INTO `concess_stock` (`id`, `vehicle_model`, `vehicle_name`, `quantity`, `buy_price`, `sell_price`) VALUES
	(1, 'blista', 'Blista', 0, 12000, 14400),
	(2, 'asterope', 'Asterope', 0, 18000, 21600),
	(3, 'panto', 'Panto', 2, 9500, 11400);

-- Listage de la structure de table zak. crafting_queue
CREATE TABLE IF NOT EXISTS `crafting_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(80) NOT NULL DEFAULT '0',
  `tableId` varchar(30) DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 1,
  `startDate` timestamp NULL DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `earn` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `owner_tableId` (`owner`,`tableId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.crafting_queue : ~1 rows (environ)
INSERT INTO `crafting_queue` (`id`, `owner`, `tableId`, `item`, `amount`, `startDate`, `duration`, `earn`) VALUES
	(2, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '1', 'money', 40, '2025-12-04 00:14:13', 5, 0);

-- Listage de la structure de table zak. crafting_tables
CREATE TABLE IF NOT EXISTS `crafting_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(80) NOT NULL DEFAULT '0',
  `label` varchar(50) NOT NULL DEFAULT '0',
  `size` smallint(6) NOT NULL DEFAULT 0,
  `object` varchar(50) DEFAULT '0',
  `coords` longtext NOT NULL,
  `recipes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `blip` longtext DEFAULT NULL,
  `global` tinyint(1) DEFAULT NULL,
  `jobs` longtext DEFAULT NULL,
  `gangs` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.crafting_tables : ~7 rows (environ)
INSERT INTO `crafting_tables` (`id`, `creator`, `label`, `size`, `object`, `coords`, `recipes`, `blip`, `global`, `jobs`, `gangs`) VALUES
	(3, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'Tables armes légères', 5, 'gr_prop_gr_bench_02b', '{"x":1338.2440185546876,"y":-742.4241333007813,"z":62.51237106323242,"w":66.99999237060547}', '[{"earn":0,"ingredients":{"scrapmetal":4000,"steel_bar":4000,"iron_ore":4000,"copper_wire":4000},"name":"WEAPON_SNSPISTOL","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"scrapmetal":4000,"steel_bar":4000,"iron_ore":4000,"copper_wire":4000},"name":"WEAPON_SNSPISTOL_MK2","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"scrapmetal":4000,"steel_bar":4000,"iron_ore":4000,"copper_wire":4000},"name":"WEAPON_COMBATPISTOL","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"scrapmetal":4000,"steel_bar":4000,"iron_ore":4000,"copper_wire":4000},"name":"WEAPON_PISTOL_MK2","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"scrapmetal":4000,"steel_bar":4000,"iron_ore":4000,"copper_wire":4000},"name":"WEAPON_PISTOLXM3","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"scrapmetal":4000,"steel_bar":4000,"iron_ore":4000,"copper_wire":4000},"name":"WEAPON_CERAMICPISTOL","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"scrapmetal":4000,"steel_bar":4000,"iron_ore":4000,"copper_wire":4000},"name":"WEAPON_PISTOL50","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"scrapmetal":4000,"steel_bar":4000,"iron_ore":4000,"copper_wire":4000},"name":"WEAPON_HEAVYPISTOL","level":0,"duration":60,"price":0}]', NULL, 0, NULL, NULL),
	(11, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Table armes moyennes', 5, 'gr_prop_gr_bench_02b', '{"x":1337.431640625,"y":-744.3631591796875,"z":62.51237106323242,"w":65.0}', '[{"earn":0,"ingredients":{"iron_ore":6000,"copper_wire":6000,"steel_bar":6000,"scrapmetal":6000},"name":"WEAPON_SMG","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"copper_wire":6000,"iron_ore":6000,"steel_bar":6000,"scrapmetal":6000},"name":"WEAPON_MACHINEPISTOL","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"copper_wire":6000,"iron_ore":6000,"steel_bar":6000,"scrapmetal":6000},"name":"WEAPON_MINISMG","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"scrapmetal":6000,"copper_wire":6000,"iron_ore":6000,"steel_bar":6000},"name":"WEAPON_TECPISTOL","level":0,"duration":60,"price":0}]', NULL, 1, NULL, NULL),
	(12, 'char0:72e2349201e0683aa2540804c45f566df0755123', 'Table arme lourde', 5, 'gr_prop_gr_bench_02b', '{"x":1336.5020751953126,"y":-746.4111938476563,"z":62.51237106323242,"w":66.0}', '[{"earn":0,"ingredients":{"copper_wire":8000,"iron_ore":8000,"scrapmetal":8000,"steel_bar":8000},"name":"WEAPON_ASSAULTRIFLE","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"copper_wire":8000,"iron_ore":8000,"scrapmetal":8000,"steel_bar":8000},"name":"WEAPON_COMPACTRIFLE","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"copper_wire":8000,"iron_ore":8000,"scrapmetal":8000},"name":"WEAPON_HEAVYRIFLE","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"steel_bar":8000,"copper_wire":8000,"iron_ore":8000},"name":"WEAPON_TACTICALRIFLE","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"scrapmetal":8000,"copper_wire":8000,"iron_ore":8000,"steel_bar":8000},"name":"WEAPON_COMBATSHOTGUN","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"copper_wire":8000,"iron_ore":8000,"scrapmetal":8000,"steel_bar":8000},"name":"WEAPON_PUMPSHOTGUN_MK2","level":0,"duration":60,"price":0},{"earn":0,"ingredients":{"copper_wire":8000,"iron_ore":8000,"scrapmetal":8000,"steel_bar":8000},"name":"WEAPON_DBSHOTGUN","level":0,"duration":60,"price":0}]', NULL, 1, NULL, NULL),
	(13, 'char0:72e2349201e0683aa2540804c45f566df0755123', 'Table munition petit et moyenne', 5, 'gr_prop_gr_bench_02b', '{"x":1340.9039306640626,"y":-751.7869873046875,"z":62.51229858398437,"w":250.0}', '[{"earn":0,"ingredients":{"iron_ore":500},"name":"ammo-9","level":0,"duration":5,"price":0},{"earn":0,"ingredients":{"iron_ore":500},"name":"ammo-45","level":0,"duration":5,"price":0},{"earn":0,"ingredients":{"iron_ore":500},"name":"ammo-50","level":0,"duration":5,"price":0}]', NULL, 0, NULL, NULL),
	(14, 'char0:72e2349201e0683aa2540804c45f566df0755123', 'Table munition lourde', 5, 'gr_prop_gr_bench_02b', '{"x":1341.5181884765626,"y":-749.8012084960938,"z":62.51228332519531,"w":247.0}', '[{"earn":0,"ingredients":{"iron_ore":500},"name":"ammo-rifle2","level":0,"duration":5,"price":0},{"earn":0,"ingredients":{"iron_ore":500},"name":"ammo-rifle","level":0,"duration":5,"price":0},{"earn":0,"ingredients":{"iron_ore":500},"name":"ammo-shotgun","level":0,"duration":5,"price":0}]', NULL, 0, NULL, NULL),
	(15, 'char0:72e2349201e0683aa2540804c45f566df0755123', 'table accessoires armes', 5, 'gr_prop_gr_bench_02b', '{"z":62.51235198974609,"y":-746.9380493164063,"x":1339.546142578125,"w":338.0}', '[{"level":0,"ingredients":{"iron_ore":900},"earn":0,"duration":5,"price":0,"name":"at_flashlight"},{"level":0,"ingredients":{"iron_ore":900},"earn":0,"duration":5,"price":0,"name":"at_suppressor_heavy"},{"level":0,"ingredients":{"iron_ore":900},"earn":0,"duration":5,"price":0,"name":"at_suppressor_light"},{"level":0,"ingredients":{"iron_ore":900},"earn":0,"duration":5,"price":0,"name":"at_clip_extended_pistol"},{"level":0,"ingredients":{"iron_ore":900},"earn":0,"duration":5,"price":0,"name":"at_clip_extended_smg"},{"level":0,"ingredients":{"iron_ore":900},"earn":0,"duration":5,"price":0,"name":"at_clip_extended_rifle"},{"level":0,"ingredients":{"iron_ore":900},"earn":0,"duration":5,"price":0,"name":"at_clip_extended_shotgun"},{"level":0,"ingredients":{"iron_ore":900},"earn":0,"duration":5,"price":0,"name":"at_scope_small"},{"level":0,"ingredients":{"iron_ore":900},"earn":0,"duration":5,"price":0,"name":"at_scope_large"},{"level":0,"ingredients":{"iron_ore":900},"earn":0,"duration":5,"price":0,"name":"at_scope_macro"},{"level":0,"ingredients":{"iron_ore":900},"earn":0,"duration":5,"price":0,"name":"at_scope_medium"}]', NULL, 0, NULL, NULL),
	(16, 'char0:72e2349201e0683aa2540804c45f566df0755123', 'Table GPB', 5, 'gr_prop_gr_bench_02b', '{"x":1341.6068115234376,"y":-741.891357421875,"z":62.51237106323242,"w":341.0}', '[{"level":0,"ingredients":{"iron_ore":1250},"earn":0,"duration":5,"price":0,"name":"lowbulletproofvest"},{"level":0,"ingredients":{"iron_ore":2500},"earn":0,"duration":5,"price":0,"name":"mediumbulletproofvest"},{"level":0,"ingredients":{"iron_ore":900},"earn":0,"duration":5,"price":0,"name":"bulletproofvest"}]', NULL, 0, NULL, NULL);

-- Listage de la structure de table zak. crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'btc',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.crypto : ~0 rows (environ)
INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('btc', 5000, '[{"PreviousWorth":90331.77,"NewWorth":5000},{"PreviousWorth":90507.4,"NewWorth":5000},{"PreviousWorth":89984.66,"NewWorth":5000}]');

-- Listage de la structure de table zak. crypto_history
CREATE TABLE IF NOT EXISTS `crypto_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worth` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.crypto_history : ~7 156 rows (environ)
INSERT INTO `crypto_history` (`id`, `worth`, `name`, `date`) VALUES
	(1, 86639, 'btc', '2025-11-26 13:12:25'),
	(2, 86622, 'btc', '2025-11-26 13:14:26'),
	(3, 86633, 'btc', '2025-11-26 13:16:26'),
	(4, 86624, 'btc', '2025-11-26 13:18:27'),
	(5, 86694, 'btc', '2025-11-26 13:19:11'),
	(6, 86688, 'btc', '2025-11-26 13:19:36'),
	(7, 86743, 'btc', '2025-11-26 13:21:37'),
	(8, 86718, 'btc', '2025-11-26 13:23:16'),
	(9, 86633, 'btc', '2025-11-26 13:33:37'),
	(10, 86693, 'btc', '2025-11-26 13:35:38'),
	(11, 86825, 'btc', '2025-11-26 13:37:38'),
	(12, 86927, 'btc', '2025-11-26 13:39:38'),
	(13, 87052, 'btc', '2025-11-26 13:41:39'),
	(14, 87013, 'btc', '2025-11-26 13:43:39'),
	(15, 86982, 'btc', '2025-11-26 13:45:40'),
	(16, 86980, 'btc', '2025-11-26 13:47:40'),
	(17, 86994, 'btc', '2025-11-26 13:49:40'),
	(18, 86980, 'btc', '2025-11-26 13:51:41'),
	(19, 87000, 'btc', '2025-11-26 13:53:41'),
	(20, 86974, 'btc', '2025-11-26 13:55:42'),
	(21, 87030, 'btc', '2025-11-26 13:57:42'),
	(22, 86959, 'btc', '2025-11-26 14:02:31'),
	(23, 87019, 'btc', '2025-11-26 14:04:32'),
	(24, 87033, 'btc', '2025-11-26 14:06:32'),
	(25, 87063, 'btc', '2025-11-26 14:08:32'),
	(26, 87065, 'btc', '2025-11-26 14:09:13'),
	(27, 87041, 'btc', '2025-11-26 14:11:14'),
	(28, 87300, 'btc', '2025-11-26 14:13:15'),
	(29, 87253, 'btc', '2025-11-26 14:15:16'),
	(30, 87248, 'btc', '2025-11-26 14:17:16'),
	(31, 87274, 'btc', '2025-11-26 14:19:16'),
	(32, 87300, 'btc', '2025-11-26 14:21:17'),
	(33, 87270, 'btc', '2025-11-26 14:23:17'),
	(34, 87308, 'btc', '2025-11-26 14:24:06'),
	(35, 87266, 'btc', '2025-11-26 14:26:06'),
	(36, 87312, 'btc', '2025-11-26 14:28:07'),
	(37, 87294, 'btc', '2025-11-26 14:30:07'),
	(38, 87440, 'btc', '2025-11-26 14:31:04'),
	(39, 87329, 'btc', '2025-11-26 14:33:05'),
	(40, 87192, 'btc', '2025-11-26 14:35:05'),
	(41, 87260, 'btc', '2025-11-26 14:37:06'),
	(42, 87399, 'btc', '2025-11-26 14:39:06'),
	(43, 87540, 'btc', '2025-11-26 14:41:06'),
	(44, 87438, 'btc', '2025-11-26 14:43:07'),
	(45, 87350, 'btc', '2025-11-26 14:45:07'),
	(46, 87453, 'btc', '2025-11-26 14:47:08'),
	(47, 87558, 'btc', '2025-11-26 14:49:08'),
	(48, 87519, 'btc', '2025-11-26 14:51:08'),
	(49, 87374, 'btc', '2025-11-26 14:53:09'),
	(50, 87182, 'btc', '2025-11-26 14:55:09'),
	(51, 87120, 'btc', '2025-11-26 14:57:10'),
	(52, 86872, 'btc', '2025-11-26 14:59:10'),
	(53, 86964, 'btc', '2025-11-26 15:01:10'),
	(54, 87127, 'btc', '2025-11-26 15:03:11'),
	(55, 86981, 'btc', '2025-11-26 15:05:11'),
	(56, 86993, 'btc', '2025-11-26 15:07:12'),
	(57, 87191, 'btc', '2025-11-26 15:09:12'),
	(58, 87154, 'btc', '2025-11-26 15:09:46'),
	(59, 87106, 'btc', '2025-11-26 15:11:47'),
	(60, 87061, 'btc', '2025-11-26 15:13:47'),
	(61, 86982, 'btc', '2025-11-26 15:15:48'),
	(62, 87132, 'btc', '2025-11-26 15:17:48'),
	(63, 87057, 'btc', '2025-11-26 15:19:48'),
	(64, 86955, 'btc', '2025-11-26 15:21:49'),
	(65, 86949, 'btc', '2025-11-26 15:23:49'),
	(66, 87053, 'btc', '2025-11-26 15:25:50'),
	(67, 87244, 'btc', '2025-11-26 15:27:50'),
	(68, 87275, 'btc', '2025-11-26 15:29:51'),
	(69, 87278, 'btc', '2025-11-26 15:31:51'),
	(70, 87216, 'btc', '2025-11-26 15:33:51'),
	(71, 87164, 'btc', '2025-11-26 15:35:52'),
	(72, 87179, 'btc', '2025-11-26 15:37:52'),
	(73, 87119, 'btc', '2025-11-26 15:39:52'),
	(74, 87083, 'btc', '2025-11-26 15:41:53'),
	(75, 86988, 'btc', '2025-11-26 15:43:53'),
	(76, 86808, 'btc', '2025-11-26 15:45:54'),
	(77, 86832, 'btc', '2025-11-26 15:47:54'),
	(78, 86826, 'btc', '2025-11-26 15:49:55'),
	(79, 86872, 'btc', '2025-11-26 15:51:55'),
	(80, 86978, 'btc', '2025-11-26 15:53:56'),
	(81, 86942, 'btc', '2025-11-26 15:55:56'),
	(82, 86920, 'btc', '2025-11-26 15:57:57'),
	(83, 86978, 'btc', '2025-11-26 15:59:57'),
	(84, 87064, 'btc', '2025-11-26 16:01:57'),
	(85, 87234, 'btc', '2025-11-26 16:04:17'),
	(86, 87232, 'btc', '2025-11-26 16:04:49'),
	(87, 87362, 'btc', '2025-11-26 16:06:49'),
	(88, 87328, 'btc', '2025-11-26 16:08:50'),
	(89, 87437, 'btc', '2025-11-26 16:10:50'),
	(90, 87544, 'btc', '2025-11-26 16:12:51'),
	(91, 87558, 'btc', '2025-11-26 16:14:51'),
	(92, 87729, 'btc', '2025-11-26 16:16:51'),
	(93, 87641, 'btc', '2025-11-26 16:18:52'),
	(94, 87705, 'btc', '2025-11-26 16:20:52'),
	(95, 87649, 'btc', '2025-11-26 16:22:53'),
	(96, 87706, 'btc', '2025-11-26 16:24:53'),
	(97, 87650, 'btc', '2025-11-26 16:26:53'),
	(98, 87620, 'btc', '2025-11-26 16:28:54'),
	(99, 87589, 'btc', '2025-11-26 16:30:54'),
	(100, 87732, 'btc', '2025-11-26 16:32:55'),
	(101, 87756, 'btc', '2025-11-26 16:34:55'),
	(102, 87940, 'btc', '2025-11-26 16:36:55'),
	(103, 87875, 'btc', '2025-11-26 16:38:56'),
	(104, 87731, 'btc', '2025-11-26 16:40:56'),
	(105, 87713, 'btc', '2025-11-26 16:44:14'),
	(106, 87664, 'btc', '2025-11-26 16:46:14'),
	(107, 87647, 'btc', '2025-11-26 16:48:15'),
	(108, 87653, 'btc', '2025-11-26 16:50:15'),
	(109, 87626, 'btc', '2025-11-26 16:52:16'),
	(110, 87540, 'btc', '2025-11-26 16:54:16'),
	(111, 87811, 'btc', '2025-11-26 16:56:16'),
	(112, 87859, 'btc', '2025-11-26 16:58:17'),
	(113, 87868, 'btc', '2025-11-26 17:00:17'),
	(114, 87896, 'btc', '2025-11-26 17:02:18'),
	(115, 87751, 'btc', '2025-11-26 17:04:18'),
	(116, 87927, 'btc', '2025-11-26 17:06:19'),
	(117, 87883, 'btc', '2025-11-26 17:08:19'),
	(118, 87870, 'btc', '2025-11-26 17:10:19'),
	(119, 87969, 'btc', '2025-11-26 17:12:20'),
	(120, 87894, 'btc', '2025-11-26 17:14:20'),
	(121, 87818, 'btc', '2025-11-26 17:16:21'),
	(122, 87722, 'btc', '2025-11-26 17:20:12'),
	(123, 87789, 'btc', '2025-11-26 17:22:13'),
	(124, 87868, 'btc', '2025-11-26 17:24:13'),
	(125, 88192, 'btc', '2025-11-26 17:26:14'),
	(126, 88789, 'btc', '2025-11-26 17:28:14'),
	(127, 88659, 'btc', '2025-11-26 17:29:04'),
	(128, 88803, 'btc', '2025-11-26 17:31:05'),
	(129, 88801, 'btc', '2025-11-26 17:33:05'),
	(130, 89010, 'btc', '2025-11-26 17:35:05'),
	(131, 89194, 'btc', '2025-11-26 17:37:06'),
	(132, 89087, 'btc', '2025-11-26 17:39:06'),
	(133, 89123, 'btc', '2025-11-26 17:41:07'),
	(134, 89338, 'btc', '2025-11-26 17:43:07'),
	(135, 89555, 'btc', '2025-11-26 17:45:07'),
	(136, 89669, 'btc', '2025-11-26 17:47:08'),
	(137, 89856, 'btc', '2025-11-26 17:49:08'),
	(138, 89726, 'btc', '2025-11-26 17:51:09'),
	(139, 89536, 'btc', '2025-11-26 17:53:09'),
	(140, 89692, 'btc', '2025-11-26 17:55:09'),
	(141, 89870, 'btc', '2025-11-26 17:57:10'),
	(142, 89924, 'btc', '2025-11-26 17:59:10'),
	(143, 89901, 'btc', '2025-11-26 18:01:11'),
	(144, 89872, 'btc', '2025-11-26 18:03:11'),
	(145, 89868, 'btc', '2025-11-26 18:05:11'),
	(146, 89990, 'btc', '2025-11-26 18:07:12'),
	(147, 89966, 'btc', '2025-11-26 18:09:12'),
	(148, 89989, 'btc', '2025-11-26 18:11:13'),
	(149, 90007, 'btc', '2025-11-26 18:13:13'),
	(150, 90162, 'btc', '2025-11-26 18:15:14'),
	(151, 90354, 'btc', '2025-11-26 18:17:14'),
	(152, 90224, 'btc', '2025-11-26 18:19:14'),
	(153, 90135, 'btc', '2025-11-26 18:21:15'),
	(154, 90234, 'btc', '2025-11-26 18:23:15'),
	(155, 90219, 'btc', '2025-11-26 18:25:16'),
	(156, 90345, 'btc', '2025-11-26 18:27:16'),
	(157, 90321, 'btc', '2025-11-26 18:29:16'),
	(158, 90250, 'btc', '2025-11-26 18:31:17'),
	(159, 90052, 'btc', '2025-11-26 18:33:17'),
	(160, 90000, 'btc', '2025-11-26 18:35:18'),
	(161, 89911, 'btc', '2025-11-26 18:37:18'),
	(162, 89829, 'btc', '2025-11-26 18:38:53'),
	(163, 90011, 'btc', '2025-11-26 18:40:53'),
	(164, 89960, 'btc', '2025-11-26 18:42:54'),
	(165, 89736, 'btc', '2025-11-26 18:44:54'),
	(166, 89882, 'btc', '2025-11-26 18:46:55'),
	(167, 90013, 'btc', '2025-11-26 18:48:55'),
	(168, 90065, 'btc', '2025-11-26 18:50:55'),
	(169, 90038, 'btc', '2025-11-26 18:52:56'),
	(170, 90035, 'btc', '2025-11-26 18:54:56'),
	(171, 90060, 'btc', '2025-11-26 18:56:57'),
	(172, 90147, 'btc', '2025-11-26 18:58:57'),
	(173, 90104, 'btc', '2025-11-26 19:00:58'),
	(174, 90156, 'btc', '2025-11-26 19:02:59'),
	(175, 89926, 'btc', '2025-11-26 19:04:59'),
	(176, 89946, 'btc', '2025-11-26 19:06:59'),
	(177, 89891, 'btc', '2025-11-26 19:09:00'),
	(178, 90020, 'btc', '2025-11-26 19:11:00'),
	(179, 89749, 'btc', '2025-11-26 19:13:00'),
	(180, 89870, 'btc', '2025-11-26 19:15:01'),
	(181, 89822, 'btc', '2025-11-26 19:17:01'),
	(182, 89960, 'btc', '2025-11-26 19:19:02'),
	(183, 89978, 'btc', '2025-11-26 19:21:02'),
	(184, 89988, 'btc', '2025-11-26 19:23:02'),
	(185, 89743, 'btc', '2025-11-26 19:25:03'),
	(186, 89803, 'btc', '2025-11-26 19:27:03'),
	(187, 89833, 'btc', '2025-11-26 19:29:04'),
	(188, 89839, 'btc', '2025-11-26 19:31:04'),
	(189, 89856, 'btc', '2025-11-26 19:33:04'),
	(190, 89842, 'btc', '2025-11-26 19:35:05'),
	(191, 89795, 'btc', '2025-11-26 19:37:05'),
	(192, 89860, 'btc', '2025-11-26 19:39:06'),
	(193, 89954, 'btc', '2025-11-26 19:41:06'),
	(194, 89903, 'btc', '2025-11-26 19:43:06'),
	(195, 89834, 'btc', '2025-11-26 19:45:07'),
	(196, 89848, 'btc', '2025-11-26 19:47:07'),
	(197, 89812, 'btc', '2025-11-26 19:49:08'),
	(198, 89957, 'btc', '2025-11-26 19:51:08'),
	(199, 90005, 'btc', '2025-11-26 19:53:09'),
	(200, 89993, 'btc', '2025-11-26 19:55:09'),
	(201, 90005, 'btc', '2025-11-26 19:57:10'),
	(202, 89987, 'btc', '2025-11-26 19:59:10'),
	(203, 89863, 'btc', '2025-11-26 20:01:11'),
	(204, 89939, 'btc', '2025-11-26 20:03:11'),
	(205, 89757, 'btc', '2025-11-26 20:05:12'),
	(206, 89566, 'btc', '2025-11-26 20:07:12'),
	(207, 89596, 'btc', '2025-11-26 20:09:12'),
	(208, 89796, 'btc', '2025-11-26 20:11:13'),
	(209, 89950, 'btc', '2025-11-26 20:13:13'),
	(210, 89962, 'btc', '2025-11-26 20:15:14'),
	(211, 90000, 'btc', '2025-11-26 20:17:14'),
	(212, 89911, 'btc', '2025-11-26 20:19:14'),
	(213, 89889, 'btc', '2025-11-26 20:21:15'),
	(214, 89917, 'btc', '2025-11-26 20:23:16'),
	(215, 90041, 'btc', '2025-11-26 20:25:16'),
	(216, 90075, 'btc', '2025-11-26 20:27:17'),
	(217, 89974, 'btc', '2025-11-26 20:29:17'),
	(218, 90032, 'btc', '2025-11-26 20:31:17'),
	(219, 89985, 'btc', '2025-11-26 20:33:18'),
	(220, 89880, 'btc', '2025-11-26 20:35:18'),
	(221, 89946, 'btc', '2025-11-26 20:37:19'),
	(222, 89960, 'btc', '2025-11-26 20:39:19'),
	(223, 89903, 'btc', '2025-11-26 20:41:20'),
	(224, 89838, 'btc', '2025-11-26 20:43:20'),
	(225, 89722, 'btc', '2025-11-26 20:45:20'),
	(226, 89664, 'btc', '2025-11-26 20:47:21'),
	(227, 89708, 'btc', '2025-11-26 20:49:21'),
	(228, 89777, 'btc', '2025-11-26 20:51:22'),
	(229, 89890, 'btc', '2025-11-26 20:53:22'),
	(230, 89922, 'btc', '2025-11-26 20:55:22'),
	(231, 89945, 'btc', '2025-11-26 20:57:23'),
	(232, 89857, 'btc', '2025-11-26 20:59:23'),
	(233, 89921, 'btc', '2025-11-26 21:01:24'),
	(234, 90000, 'btc', '2025-11-26 21:03:24'),
	(235, 89880, 'btc', '2025-11-26 21:05:25'),
	(236, 89877, 'btc', '2025-11-26 21:07:25'),
	(237, 89850, 'btc', '2025-11-26 21:09:25'),
	(238, 89871, 'btc', '2025-11-26 21:11:53'),
	(239, 89883, 'btc', '2025-11-26 21:13:54'),
	(240, 89872, 'btc', '2025-11-26 21:15:54'),
	(241, 89921, 'btc', '2025-11-26 21:17:54'),
	(242, 89829, 'btc', '2025-11-26 21:19:55'),
	(243, 89835, 'btc', '2025-11-26 21:21:55'),
	(244, 89936, 'btc', '2025-11-26 21:23:56'),
	(245, 90231, 'btc', '2025-11-26 21:25:56'),
	(246, 90223, 'btc', '2025-11-26 21:27:57'),
	(247, 90270, 'btc', '2025-11-26 21:29:57'),
	(248, 90349, 'btc', '2025-11-26 21:31:57'),
	(249, 90298, 'btc', '2025-11-26 21:33:58'),
	(250, 90281, 'btc', '2025-11-26 21:35:58'),
	(251, 90329, 'btc', '2025-11-26 21:37:59'),
	(252, 90224, 'btc', '2025-11-26 21:39:59'),
	(253, 90232, 'btc', '2025-11-26 21:42:00'),
	(254, 90236, 'btc', '2025-11-26 21:44:00'),
	(255, 90250, 'btc', '2025-11-26 21:46:00'),
	(256, 90347, 'btc', '2025-11-26 21:48:01'),
	(257, 90377, 'btc', '2025-11-26 21:50:01'),
	(258, 90370, 'btc', '2025-11-26 21:51:37'),
	(259, 90378, 'btc', '2025-11-26 21:53:37'),
	(260, 90267, 'btc', '2025-11-26 21:55:38'),
	(261, 90210, 'btc', '2025-11-26 21:57:38'),
	(262, 90179, 'btc', '2025-11-26 21:59:38'),
	(263, 90977, 'btc', '2025-11-27 16:11:21'),
	(264, 91015, 'btc', '2025-11-27 16:13:21'),
	(265, 91202, 'btc', '2025-11-27 16:15:21'),
	(266, 91187, 'btc', '2025-11-27 16:16:03'),
	(267, 91187, 'btc', '2025-11-27 16:18:04'),
	(268, 91194, 'btc', '2025-11-27 16:20:04'),
	(269, 91182, 'btc', '2025-11-27 16:22:05'),
	(270, 91258, 'btc', '2025-11-27 16:24:05'),
	(271, 91156, 'btc', '2025-11-27 16:26:06'),
	(272, 91212, 'btc', '2025-11-27 16:28:06'),
	(273, 91195, 'btc', '2025-11-27 16:30:07'),
	(274, 91287, 'btc', '2025-11-27 16:32:07'),
	(275, 91310, 'btc', '2025-11-27 16:34:08'),
	(276, 91308, 'btc', '2025-11-27 16:36:08'),
	(277, 91437, 'btc', '2025-11-27 16:38:08'),
	(278, 91504, 'btc', '2025-11-27 16:40:09'),
	(279, 91366, 'btc', '2025-11-27 16:42:09'),
	(280, 91358, 'btc', '2025-11-27 16:44:10'),
	(281, 91245, 'btc', '2025-11-27 16:46:10'),
	(282, 91320, 'btc', '2025-11-27 16:48:10'),
	(283, 91282, 'btc', '2025-11-27 16:50:11'),
	(284, 91372, 'btc', '2025-11-27 16:52:11'),
	(285, 91434, 'btc', '2025-11-27 16:54:12'),
	(286, 91443, 'btc', '2025-11-27 16:56:12'),
	(287, 91450, 'btc', '2025-11-27 16:57:38'),
	(288, 91471, 'btc', '2025-11-27 16:59:07'),
	(289, 91452, 'btc', '2025-11-27 17:01:07'),
	(290, 91426, 'btc', '2025-11-27 17:03:08'),
	(291, 91495, 'btc', '2025-11-27 17:03:58'),
	(292, 91422, 'btc', '2025-11-27 17:05:59'),
	(293, 91400, 'btc', '2025-11-27 17:07:59'),
	(294, 91484, 'btc', '2025-11-27 17:10:00'),
	(295, 91512, 'btc', '2025-11-27 17:12:00'),
	(296, 91485, 'btc', '2025-11-27 17:14:00'),
	(297, 91513, 'btc', '2025-11-27 17:16:01'),
	(298, 91523, 'btc', '2025-11-27 17:18:01'),
	(299, 91476, 'btc', '2025-11-27 17:20:02'),
	(300, 91579, 'btc', '2025-11-27 17:22:02'),
	(301, 91551, 'btc', '2025-11-27 17:24:02'),
	(302, 91567, 'btc', '2025-11-27 17:26:03'),
	(303, 91524, 'btc', '2025-11-27 17:28:03'),
	(304, 91392, 'btc', '2025-11-27 17:30:04'),
	(305, 91356, 'btc', '2025-11-27 17:32:04'),
	(306, 91472, 'btc', '2025-11-27 17:34:05'),
	(307, 91528, 'btc', '2025-11-27 17:36:05'),
	(308, 91415, 'btc', '2025-11-27 17:38:06'),
	(309, 91345, 'btc', '2025-11-27 17:40:06'),
	(310, 91411, 'btc', '2025-11-27 17:42:07'),
	(311, 91421, 'btc', '2025-11-27 17:44:07'),
	(312, 91474, 'btc', '2025-11-27 17:46:07'),
	(313, 91408, 'btc', '2025-11-27 17:48:08'),
	(314, 91447, 'btc', '2025-11-27 17:50:08'),
	(315, 91447, 'btc', '2025-11-27 17:52:09'),
	(316, 91464, 'btc', '2025-11-27 17:54:09'),
	(317, 91496, 'btc', '2025-11-27 17:56:10'),
	(318, 91472, 'btc', '2025-11-27 17:58:10'),
	(319, 91464, 'btc', '2025-11-27 18:00:11'),
	(320, 91430, 'btc', '2025-11-27 18:02:11'),
	(321, 91436, 'btc', '2025-11-27 18:04:11'),
	(322, 91415, 'btc', '2025-11-27 18:06:12'),
	(323, 91491, 'btc', '2025-11-27 18:08:12'),
	(324, 91470, 'btc', '2025-11-27 18:10:13'),
	(325, 91450, 'btc', '2025-11-27 18:12:13'),
	(326, 91391, 'btc', '2025-11-27 18:14:13'),
	(327, 91408, 'btc', '2025-11-27 18:16:14'),
	(328, 91431, 'btc', '2025-11-27 18:18:14'),
	(329, 91490, 'btc', '2025-11-27 18:20:15'),
	(330, 91439, 'btc', '2025-11-27 18:22:15'),
	(331, 91399, 'btc', '2025-11-27 18:24:16'),
	(332, 91500, 'btc', '2025-11-27 18:26:16'),
	(333, 91441, 'btc', '2025-11-27 18:28:17'),
	(334, 91385, 'btc', '2025-11-27 18:30:17'),
	(335, 91414, 'btc', '2025-11-27 18:32:17'),
	(336, 91414, 'btc', '2025-11-27 18:34:18'),
	(337, 91493, 'btc', '2025-11-27 18:36:18'),
	(338, 91537, 'btc', '2025-11-27 18:38:19'),
	(339, 91672, 'btc', '2025-11-27 18:40:19'),
	(340, 91786, 'btc', '2025-11-27 18:42:20'),
	(341, 91765, 'btc', '2025-11-27 18:44:20'),
	(342, 91814, 'btc', '2025-11-27 18:46:21'),
	(343, 91736, 'btc', '2025-11-27 18:48:21'),
	(344, 91780, 'btc', '2025-11-27 18:50:21'),
	(345, 91789, 'btc', '2025-11-27 18:52:22'),
	(346, 91809, 'btc', '2025-11-27 18:54:22'),
	(347, 91800, 'btc', '2025-11-27 18:56:23'),
	(348, 91802, 'btc', '2025-11-27 18:58:23'),
	(349, 91733, 'btc', '2025-11-27 19:00:23'),
	(350, 91642, 'btc', '2025-11-27 19:02:24'),
	(351, 91617, 'btc', '2025-11-27 19:04:24'),
	(352, 91613, 'btc', '2025-11-27 19:06:25'),
	(353, 91613, 'btc', '2025-11-27 19:08:25'),
	(354, 91645, 'btc', '2025-11-27 19:10:25'),
	(355, 91645, 'btc', '2025-11-27 19:12:26'),
	(356, 91623, 'btc', '2025-11-27 19:14:26'),
	(357, 91586, 'btc', '2025-11-27 19:16:27'),
	(358, 91609, 'btc', '2025-11-27 19:18:27'),
	(359, 91637, 'btc', '2025-11-27 19:20:28'),
	(360, 91588, 'btc', '2025-11-27 19:22:28'),
	(361, 91601, 'btc', '2025-11-27 19:24:28'),
	(362, 91603, 'btc', '2025-11-27 19:26:29'),
	(363, 91628, 'btc', '2025-11-27 19:28:29'),
	(364, 91597, 'btc', '2025-11-27 19:30:30'),
	(365, 91633, 'btc', '2025-11-27 19:32:30'),
	(366, 91527, 'btc', '2025-11-27 19:34:30'),
	(367, 91552, 'btc', '2025-11-27 19:36:31'),
	(368, 91595, 'btc', '2025-11-27 19:38:31'),
	(369, 91627, 'btc', '2025-11-27 19:40:32'),
	(370, 91674, 'btc', '2025-11-27 19:42:32'),
	(371, 91731, 'btc', '2025-11-27 19:44:33'),
	(372, 91641, 'btc', '2025-11-27 19:46:33'),
	(373, 91605, 'btc', '2025-11-27 19:48:33'),
	(374, 91612, 'btc', '2025-11-27 19:50:34'),
	(375, 91529, 'btc', '2025-11-27 19:52:34'),
	(376, 91544, 'btc', '2025-11-27 19:54:35'),
	(377, 91545, 'btc', '2025-11-27 19:56:35'),
	(378, 91528, 'btc', '2025-11-27 19:58:35'),
	(379, 91507, 'btc', '2025-11-27 20:00:36'),
	(380, 91542, 'btc', '2025-11-27 20:02:36'),
	(381, 91462, 'btc', '2025-11-27 20:04:37'),
	(382, 91499, 'btc', '2025-11-27 20:06:37'),
	(383, 91516, 'btc', '2025-11-27 20:08:38'),
	(384, 91557, 'btc', '2025-11-27 20:10:38'),
	(385, 91526, 'btc', '2025-11-27 20:12:39'),
	(386, 91494, 'btc', '2025-11-27 20:14:39'),
	(387, 91445, 'btc', '2025-11-27 20:16:39'),
	(388, 91450, 'btc', '2025-11-27 20:18:40'),
	(389, 91435, 'btc', '2025-11-27 20:20:41'),
	(390, 91400, 'btc', '2025-11-27 20:22:41'),
	(391, 91407, 'btc', '2025-11-27 20:25:20'),
	(392, 91443, 'btc', '2025-11-27 20:27:20'),
	(393, 91437, 'btc', '2025-11-27 20:29:21'),
	(394, 91404, 'btc', '2025-11-27 20:31:21'),
	(395, 91498, 'btc', '2025-11-27 20:33:22'),
	(396, 91554, 'btc', '2025-11-27 20:35:22'),
	(397, 91494, 'btc', '2025-11-27 20:37:22'),
	(398, 91436, 'btc', '2025-11-27 20:39:23'),
	(399, 91475, 'btc', '2025-11-27 20:41:23'),
	(400, 91464, 'btc', '2025-11-27 20:43:24'),
	(401, 91467, 'btc', '2025-11-27 20:45:24'),
	(402, 91460, 'btc', '2025-11-27 20:47:24'),
	(403, 91407, 'btc', '2025-11-27 20:49:25'),
	(404, 91469, 'btc', '2025-11-27 20:51:25'),
	(405, 91469, 'btc', '2025-11-27 20:53:26'),
	(406, 91466, 'btc', '2025-11-27 20:55:26'),
	(407, 91482, 'btc', '2025-11-27 20:57:27'),
	(408, 91458, 'btc', '2025-11-27 20:59:27'),
	(409, 91348, 'btc', '2025-11-27 21:01:28'),
	(410, 91308, 'btc', '2025-11-27 21:03:28'),
	(411, 91323, 'btc', '2025-11-27 21:05:29'),
	(412, 91295, 'btc', '2025-11-27 21:07:29'),
	(413, 91350, 'btc', '2025-11-27 21:09:29'),
	(414, 91352, 'btc', '2025-11-27 21:11:30'),
	(415, 91394, 'btc', '2025-11-27 21:13:30'),
	(416, 91418, 'btc', '2025-11-27 21:15:31'),
	(417, 91484, 'btc', '2025-11-27 21:17:31'),
	(418, 91537, 'btc', '2025-11-27 21:19:32'),
	(419, 91520, 'btc', '2025-11-27 21:21:32'),
	(420, 91505, 'btc', '2025-11-27 21:23:33'),
	(421, 91469, 'btc', '2025-11-27 21:25:33'),
	(422, 91511, 'btc', '2025-11-27 21:27:34'),
	(423, 91534, 'btc', '2025-11-27 21:29:34'),
	(424, 91538, 'btc', '2025-11-27 21:31:35'),
	(425, 91513, 'btc', '2025-11-27 21:33:36'),
	(426, 91552, 'btc', '2025-11-27 21:35:37'),
	(427, 91535, 'btc', '2025-11-27 21:37:37'),
	(428, 91563, 'btc', '2025-11-27 21:39:37'),
	(429, 91579, 'btc', '2025-11-27 21:40:38'),
	(430, 91570, 'btc', '2025-11-27 21:42:39'),
	(431, 91540, 'btc', '2025-11-27 21:44:39'),
	(432, 91559, 'btc', '2025-11-27 21:46:40'),
	(433, 91557, 'btc', '2025-11-27 21:48:40'),
	(434, 91498, 'btc', '2025-11-27 21:50:40'),
	(435, 91469, 'btc', '2025-11-27 21:52:41'),
	(436, 91485, 'btc', '2025-11-27 21:54:41'),
	(437, 91409, 'btc', '2025-11-27 21:56:42'),
	(438, 91438, 'btc', '2025-11-27 21:58:42'),
	(439, 91401, 'btc', '2025-11-27 22:00:42'),
	(440, 91460, 'btc', '2025-11-27 22:02:43'),
	(441, 91429, 'btc', '2025-11-27 22:04:43'),
	(442, 91386, 'btc', '2025-11-27 22:06:44'),
	(443, 91351, 'btc', '2025-11-27 22:08:44'),
	(444, 91374, 'btc', '2025-11-27 22:10:45'),
	(445, 91385, 'btc', '2025-11-27 22:12:45'),
	(446, 91476, 'btc', '2025-11-27 22:14:46'),
	(447, 91518, 'btc', '2025-11-27 22:16:46'),
	(448, 91569, 'btc', '2025-11-27 22:18:46'),
	(449, 91548, 'btc', '2025-11-27 22:20:47'),
	(450, 91511, 'btc', '2025-11-27 22:22:47'),
	(451, 91505, 'btc', '2025-11-27 22:24:48'),
	(452, 91562, 'btc', '2025-11-27 22:26:48'),
	(453, 91563, 'btc', '2025-11-27 22:28:49'),
	(454, 91567, 'btc', '2025-11-27 22:31:22'),
	(455, 91567, 'btc', '2025-11-27 22:32:01'),
	(456, 91528, 'btc', '2025-11-27 22:34:02'),
	(457, 91520, 'btc', '2025-11-27 22:36:02'),
	(458, 91459, 'btc', '2025-11-27 22:38:03'),
	(459, 91436, 'btc', '2025-11-27 22:40:03'),
	(460, 91334, 'btc', '2025-11-27 22:42:03'),
	(461, 91253, 'btc', '2025-11-27 22:44:04'),
	(462, 91268, 'btc', '2025-11-27 22:46:04'),
	(463, 91397, 'btc', '2025-11-27 22:48:05'),
	(464, 91278, 'btc', '2025-11-27 22:50:05'),
	(465, 91320, 'btc', '2025-11-27 22:52:05'),
	(466, 91259, 'btc', '2025-11-27 22:54:06'),
	(467, 91279, 'btc', '2025-11-27 22:56:06'),
	(468, 91310, 'btc', '2025-11-27 22:58:07'),
	(469, 91315, 'btc', '2025-11-27 23:00:07'),
	(470, 91412, 'btc', '2025-11-27 23:02:08'),
	(471, 91467, 'btc', '2025-11-27 23:04:08'),
	(472, 91463, 'btc', '2025-11-27 23:06:08'),
	(473, 91416, 'btc', '2025-11-27 23:08:09'),
	(474, 91405, 'btc', '2025-11-27 23:10:09'),
	(475, 91378, 'btc', '2025-11-27 23:12:10'),
	(476, 91512, 'btc', '2025-11-27 23:14:10'),
	(477, 91550, 'btc', '2025-11-27 23:16:11'),
	(478, 91505, 'btc', '2025-11-27 23:18:11'),
	(479, 91456, 'btc', '2025-11-27 23:20:11'),
	(480, 91436, 'btc', '2025-11-27 23:22:12'),
	(481, 91406, 'btc', '2025-11-27 23:24:12'),
	(482, 91400, 'btc', '2025-11-27 23:26:13'),
	(483, 91405, 'btc', '2025-11-27 23:28:13'),
	(484, 91381, 'btc', '2025-11-27 23:30:13'),
	(485, 91302, 'btc', '2025-11-27 23:32:14'),
	(486, 91255, 'btc', '2025-11-27 23:34:14'),
	(487, 91272, 'btc', '2025-11-27 23:36:15'),
	(488, 91330, 'btc', '2025-11-27 23:38:15'),
	(489, 91360, 'btc', '2025-11-27 23:40:16'),
	(490, 91360, 'btc', '2025-11-27 23:42:16'),
	(491, 91386, 'btc', '2025-11-27 23:44:16'),
	(492, 91362, 'btc', '2025-11-27 23:46:17'),
	(493, 91300, 'btc', '2025-11-27 23:48:17'),
	(494, 91302, 'btc', '2025-11-27 23:50:18'),
	(495, 91283, 'btc', '2025-11-27 23:52:18'),
	(496, 91293, 'btc', '2025-11-27 23:55:01'),
	(497, 91296, 'btc', '2025-11-27 23:57:01'),
	(498, 91310, 'btc', '2025-11-27 23:59:02'),
	(499, 91328, 'btc', '2025-11-28 00:01:02'),
	(500, 91229, 'btc', '2025-11-28 00:03:03'),
	(501, 91202, 'btc', '2025-11-28 00:05:03'),
	(502, 91264, 'btc', '2025-11-28 00:07:03'),
	(503, 91187, 'btc', '2025-11-28 00:09:04'),
	(504, 91179, 'btc', '2025-11-28 00:11:05'),
	(505, 91158, 'btc', '2025-11-28 00:13:05'),
	(506, 91174, 'btc', '2025-11-28 00:15:06'),
	(507, 91131, 'btc', '2025-11-28 00:17:06'),
	(508, 91093, 'btc', '2025-11-28 00:19:07'),
	(509, 91268, 'btc', '2025-11-28 00:21:07'),
	(510, 91216, 'btc', '2025-11-28 00:23:07'),
	(511, 91254, 'btc', '2025-11-28 00:25:08'),
	(512, 91254, 'btc', '2025-11-28 00:27:08'),
	(513, 91234, 'btc', '2025-11-28 00:29:09'),
	(514, 91244, 'btc', '2025-11-28 00:31:09'),
	(515, 91264, 'btc', '2025-11-28 00:33:10'),
	(516, 91351, 'btc', '2025-11-28 00:35:10'),
	(517, 91312, 'btc', '2025-11-28 00:37:10'),
	(518, 91269, 'btc', '2025-11-28 00:39:11'),
	(519, 91232, 'btc', '2025-11-28 00:41:11'),
	(520, 91219, 'btc', '2025-11-28 00:43:12'),
	(521, 91205, 'btc', '2025-11-28 00:45:12'),
	(522, 91228, 'btc', '2025-11-28 00:47:12'),
	(523, 91199, 'btc', '2025-11-28 00:49:13'),
	(524, 91190, 'btc', '2025-11-28 00:51:13'),
	(525, 91192, 'btc', '2025-11-28 00:53:14'),
	(526, 91164, 'btc', '2025-11-28 00:55:14'),
	(527, 91194, 'btc', '2025-11-28 00:57:15'),
	(528, 91200, 'btc', '2025-11-28 00:59:15'),
	(529, 91199, 'btc', '2025-11-28 01:01:15'),
	(530, 91149, 'btc', '2025-11-28 01:03:16'),
	(531, 91102, 'btc', '2025-11-28 01:05:16'),
	(532, 91182, 'btc', '2025-11-28 01:07:16'),
	(533, 91062, 'btc', '2025-11-28 01:09:17'),
	(534, 90934, 'btc', '2025-11-28 01:11:17'),
	(535, 91469, 'btc', '2025-11-28 16:47:23'),
	(536, 91506, 'btc', '2025-11-28 16:49:23'),
	(537, 91304, 'btc', '2025-11-28 16:51:24'),
	(538, 91323, 'btc', '2025-11-28 16:53:24'),
	(539, 91292, 'btc', '2025-11-28 16:55:24'),
	(540, 91056, 'btc', '2025-11-28 16:57:25'),
	(541, 90927, 'btc', '2025-11-28 16:59:25'),
	(542, 90866, 'btc', '2025-11-28 17:01:26'),
	(543, 91043, 'btc', '2025-11-28 17:03:26'),
	(544, 91090, 'btc', '2025-11-28 17:05:26'),
	(545, 91103, 'btc', '2025-11-28 17:07:27'),
	(546, 91054, 'btc', '2025-11-28 17:09:27'),
	(547, 91123, 'btc', '2025-11-28 17:11:27'),
	(548, 90909, 'btc', '2025-11-28 17:13:28'),
	(549, 90864, 'btc', '2025-11-28 17:15:28'),
	(550, 90726, 'btc', '2025-11-28 17:17:29'),
	(551, 90728, 'btc', '2025-11-28 17:19:29'),
	(552, 90598, 'btc', '2025-11-28 17:21:30'),
	(553, 90607, 'btc', '2025-11-28 17:23:30'),
	(554, 90663, 'btc', '2025-11-28 17:25:30'),
	(555, 90596, 'btc', '2025-11-28 17:27:31'),
	(556, 90468, 'btc', '2025-11-28 17:29:31'),
	(557, 90414, 'btc', '2025-11-28 17:31:32'),
	(558, 90348, 'btc', '2025-11-28 17:33:32'),
	(559, 90260, 'btc', '2025-11-28 17:35:32'),
	(560, 90313, 'btc', '2025-11-28 17:37:33'),
	(561, 90317, 'btc', '2025-11-28 17:39:33'),
	(562, 90244, 'btc', '2025-11-28 17:41:33'),
	(563, 90338, 'btc', '2025-11-28 17:43:34'),
	(564, 90391, 'btc', '2025-11-28 17:45:34'),
	(565, 90536, 'btc', '2025-11-28 17:47:35'),
	(566, 90509, 'btc', '2025-11-28 17:49:35'),
	(567, 90612, 'btc', '2025-11-28 17:51:36'),
	(568, 90688, 'btc', '2025-11-28 17:53:36'),
	(569, 90692, 'btc', '2025-11-28 17:55:36'),
	(570, 90742, 'btc', '2025-11-28 17:57:37'),
	(571, 90529, 'btc', '2025-11-28 17:59:37'),
	(572, 90549, 'btc', '2025-11-28 18:01:38'),
	(573, 90589, 'btc', '2025-11-28 18:03:38'),
	(574, 90476, 'btc', '2025-11-28 18:05:39'),
	(575, 90509, 'btc', '2025-11-28 18:07:39'),
	(576, 90618, 'btc', '2025-11-28 18:09:39'),
	(577, 90769, 'btc', '2025-11-28 18:11:40'),
	(578, 90866, 'btc', '2025-11-28 18:13:40'),
	(579, 90862, 'btc', '2025-11-28 18:15:41'),
	(580, 90727, 'btc', '2025-11-28 18:17:41'),
	(581, 90718, 'btc', '2025-11-28 18:19:41'),
	(582, 90718, 'btc', '2025-11-28 18:21:42'),
	(583, 90736, 'btc', '2025-11-28 18:23:42'),
	(584, 90693, 'btc', '2025-11-28 18:25:43'),
	(585, 90756, 'btc', '2025-11-28 18:27:43'),
	(586, 90792, 'btc', '2025-11-28 18:29:43'),
	(587, 90768, 'btc', '2025-11-28 18:31:44'),
	(588, 90727, 'btc', '2025-11-28 18:33:44'),
	(589, 90767, 'btc', '2025-11-28 18:35:45'),
	(590, 90740, 'btc', '2025-11-28 18:37:45'),
	(591, 90839, 'btc', '2025-11-28 18:39:45'),
	(592, 90776, 'btc', '2025-11-28 18:41:48'),
	(593, 90848, 'btc', '2025-11-28 18:43:49'),
	(594, 90848, 'btc', '2025-11-28 18:45:49'),
	(595, 90888, 'btc', '2025-11-28 18:47:49'),
	(596, 90934, 'btc', '2025-11-28 18:49:50'),
	(597, 90793, 'btc', '2025-11-28 18:51:50'),
	(598, 90797, 'btc', '2025-11-28 18:53:51'),
	(599, 90721, 'btc', '2025-11-28 18:55:51'),
	(600, 90733, 'btc', '2025-11-28 18:57:52'),
	(601, 90831, 'btc', '2025-11-28 18:59:52'),
	(602, 90919, 'btc', '2025-11-28 19:01:52'),
	(603, 90890, 'btc', '2025-11-28 19:03:53'),
	(604, 90934, 'btc', '2025-11-28 19:05:53'),
	(605, 90903, 'btc', '2025-11-28 19:07:54'),
	(606, 90875, 'btc', '2025-11-28 19:09:54'),
	(607, 90899, 'btc', '2025-11-28 19:11:55'),
	(608, 90966, 'btc', '2025-11-28 19:13:55'),
	(609, 90943, 'btc', '2025-11-28 19:15:55'),
	(610, 90960, 'btc', '2025-11-28 19:17:56'),
	(611, 90964, 'btc', '2025-11-28 19:19:56'),
	(612, 91125, 'btc', '2025-11-28 19:21:57'),
	(613, 91123, 'btc', '2025-11-28 19:23:57'),
	(614, 91123, 'btc', '2025-11-28 19:25:57'),
	(615, 91065, 'btc', '2025-11-28 19:27:58'),
	(616, 91068, 'btc', '2025-11-28 19:29:58'),
	(617, 91008, 'btc', '2025-11-28 19:31:59'),
	(618, 91043, 'btc', '2025-11-28 19:33:59'),
	(619, 91053, 'btc', '2025-11-28 19:36:00'),
	(620, 91174, 'btc', '2025-11-28 19:38:00'),
	(621, 91184, 'btc', '2025-11-28 19:40:00'),
	(622, 91171, 'btc', '2025-11-28 19:42:01'),
	(623, 91124, 'btc', '2025-11-28 19:44:01'),
	(624, 91165, 'btc', '2025-11-28 19:46:02'),
	(625, 91139, 'btc', '2025-11-28 19:48:02'),
	(626, 91100, 'btc', '2025-11-28 19:50:02'),
	(627, 91085, 'btc', '2025-11-28 19:52:03'),
	(628, 91159, 'btc', '2025-11-28 19:54:03'),
	(629, 91192, 'btc', '2025-11-28 19:56:04'),
	(630, 91146, 'btc', '2025-11-28 19:58:04'),
	(631, 91109, 'btc', '2025-11-28 20:00:05'),
	(632, 90977, 'btc', '2025-11-28 20:02:05'),
	(633, 90953, 'btc', '2025-11-28 20:04:06'),
	(634, 90910, 'btc', '2025-11-28 20:06:06'),
	(635, 90973, 'btc', '2025-11-28 20:08:06'),
	(636, 91000, 'btc', '2025-11-28 20:10:07'),
	(637, 90983, 'btc', '2025-11-28 20:12:07'),
	(638, 91024, 'btc', '2025-11-28 20:14:08'),
	(639, 90951, 'btc', '2025-11-28 20:16:08'),
	(640, 91075, 'btc', '2025-11-28 20:18:08'),
	(641, 91150, 'btc', '2025-11-28 20:20:09'),
	(642, 91132, 'btc', '2025-11-28 20:22:09'),
	(643, 91195, 'btc', '2025-11-28 20:24:10'),
	(644, 91145, 'btc', '2025-11-28 20:26:10'),
	(645, 91176, 'btc', '2025-11-28 20:28:11'),
	(646, 91157, 'btc', '2025-11-28 20:30:11'),
	(647, 91164, 'btc', '2025-11-28 20:32:12'),
	(648, 91116, 'btc', '2025-11-28 20:34:12'),
	(649, 91127, 'btc', '2025-11-28 20:36:12'),
	(650, 91111, 'btc', '2025-11-28 20:38:13'),
	(651, 91111, 'btc', '2025-11-28 20:41:56'),
	(652, 91118, 'btc', '2025-11-28 20:43:56'),
	(653, 91083, 'btc', '2025-11-28 20:45:57'),
	(654, 91145, 'btc', '2025-11-28 20:47:57'),
	(655, 91152, 'btc', '2025-11-28 20:49:58'),
	(656, 91147, 'btc', '2025-11-28 20:51:58'),
	(657, 91159, 'btc', '2025-11-28 20:53:59'),
	(658, 91120, 'btc', '2025-11-28 20:55:59'),
	(659, 91150, 'btc', '2025-11-28 20:58:00'),
	(660, 91216, 'btc', '2025-11-28 21:00:00'),
	(661, 91208, 'btc', '2025-11-28 21:02:00'),
	(662, 91168, 'btc', '2025-11-28 21:04:01'),
	(663, 91229, 'btc', '2025-11-28 21:06:01'),
	(664, 91219, 'btc', '2025-11-28 21:08:02'),
	(665, 91174, 'btc', '2025-11-28 21:10:02'),
	(666, 91187, 'btc', '2025-11-28 21:12:03'),
	(667, 91159, 'btc', '2025-11-28 21:14:03'),
	(668, 91152, 'btc', '2025-11-28 21:16:04'),
	(669, 91057, 'btc', '2025-11-28 21:18:04'),
	(670, 91029, 'btc', '2025-11-28 21:20:04'),
	(671, 91033, 'btc', '2025-11-28 21:22:05'),
	(672, 91055, 'btc', '2025-11-28 21:24:05'),
	(673, 91097, 'btc', '2025-11-28 21:26:06'),
	(674, 91098, 'btc', '2025-11-28 21:27:44'),
	(675, 91137, 'btc', '2025-11-28 21:29:44'),
	(676, 91126, 'btc', '2025-11-28 21:31:45'),
	(677, 91123, 'btc', '2025-11-28 21:33:11'),
	(678, 91140, 'btc', '2025-11-28 21:35:11'),
	(679, 91122, 'btc', '2025-11-28 21:37:12'),
	(680, 91159, 'btc', '2025-11-28 21:39:12'),
	(681, 91200, 'btc', '2025-11-28 21:41:13'),
	(682, 91240, 'btc', '2025-11-28 21:43:13'),
	(683, 91202, 'btc', '2025-11-28 21:45:14'),
	(684, 91178, 'btc', '2025-11-28 21:47:14'),
	(685, 91136, 'btc', '2025-11-28 21:49:14'),
	(686, 91158, 'btc', '2025-11-28 21:51:15'),
	(687, 90985, 'btc', '2025-11-28 21:53:15'),
	(688, 90997, 'btc', '2025-11-28 21:55:16'),
	(689, 91017, 'btc', '2025-11-28 21:57:16'),
	(690, 90900, 'btc', '2025-11-28 21:59:16'),
	(691, 90912, 'btc', '2025-11-28 22:01:17'),
	(692, 90771, 'btc', '2025-11-28 22:03:17'),
	(693, 91000, 'btc', '2025-11-28 22:05:18'),
	(694, 90918, 'btc', '2025-11-28 22:07:18'),
	(695, 90927, 'btc', '2025-11-28 22:09:18'),
	(696, 90942, 'btc', '2025-11-28 22:11:19'),
	(697, 90860, 'btc', '2025-11-28 22:13:19'),
	(698, 90706, 'btc', '2025-11-28 22:15:20'),
	(699, 90886, 'btc', '2025-11-28 22:17:20'),
	(700, 90904, 'btc', '2025-11-28 22:19:21'),
	(701, 90856, 'btc', '2025-11-28 22:21:21'),
	(702, 90826, 'btc', '2025-11-28 22:23:21'),
	(703, 90865, 'btc', '2025-11-28 22:25:22'),
	(704, 90902, 'btc', '2025-11-28 22:27:22'),
	(705, 90881, 'btc', '2025-11-28 22:29:23'),
	(706, 90918, 'btc', '2025-11-28 22:31:23'),
	(707, 90939, 'btc', '2025-11-28 22:33:23'),
	(708, 90940, 'btc', '2025-11-28 22:35:24'),
	(709, 90974, 'btc', '2025-11-28 22:37:24'),
	(710, 91013, 'btc', '2025-11-28 22:39:25'),
	(711, 90985, 'btc', '2025-11-28 22:41:25'),
	(712, 90982, 'btc', '2025-11-28 22:43:25'),
	(713, 91034, 'btc', '2025-11-28 22:45:57'),
	(714, 91020, 'btc', '2025-11-28 22:47:57'),
	(715, 91041, 'btc', '2025-11-28 22:49:58'),
	(716, 91154, 'btc', '2025-11-28 22:51:58'),
	(717, 91092, 'btc', '2025-11-28 22:53:59'),
	(718, 91064, 'btc', '2025-11-28 22:55:59'),
	(719, 91093, 'btc', '2025-11-28 22:58:00'),
	(720, 91118, 'btc', '2025-11-28 23:00:00'),
	(721, 91143, 'btc', '2025-11-28 23:02:00'),
	(722, 91163, 'btc', '2025-11-28 23:04:01'),
	(723, 91128, 'btc', '2025-11-28 23:06:01'),
	(724, 91015, 'btc', '2025-11-28 23:08:02'),
	(725, 91074, 'btc', '2025-11-28 23:10:02'),
	(726, 91157, 'btc', '2025-11-28 23:12:02'),
	(727, 91152, 'btc', '2025-11-28 23:14:03'),
	(728, 91102, 'btc', '2025-11-28 23:16:03'),
	(729, 91054, 'btc', '2025-11-28 23:18:04'),
	(730, 91064, 'btc', '2025-11-28 23:20:04'),
	(731, 91068, 'btc', '2025-11-28 23:22:05'),
	(732, 91044, 'btc', '2025-11-28 23:24:05'),
	(733, 91018, 'btc', '2025-11-28 23:26:06'),
	(734, 91005, 'btc', '2025-11-28 23:28:06'),
	(735, 90973, 'btc', '2025-11-28 23:30:07'),
	(736, 90932, 'btc', '2025-11-28 23:32:07'),
	(737, 90979, 'btc', '2025-11-28 23:34:07'),
	(738, 91022, 'btc', '2025-11-28 23:36:08'),
	(739, 91038, 'btc', '2025-11-28 23:38:08'),
	(740, 90987, 'btc', '2025-11-28 23:40:09'),
	(741, 90995, 'btc', '2025-11-28 23:42:09'),
	(742, 91000, 'btc', '2025-11-28 23:44:09'),
	(743, 90989, 'btc', '2025-11-28 23:46:10'),
	(744, 90930, 'btc', '2025-11-28 23:48:10'),
	(745, 90968, 'btc', '2025-11-28 23:50:11'),
	(746, 90963, 'btc', '2025-11-28 23:52:11'),
	(747, 90948, 'btc', '2025-11-28 23:54:11'),
	(748, 90893, 'btc', '2025-11-28 23:56:12'),
	(749, 90900, 'btc', '2025-11-28 23:58:12'),
	(750, 90897, 'btc', '2025-11-29 00:00:13'),
	(751, 90927, 'btc', '2025-11-29 00:02:13'),
	(752, 90942, 'btc', '2025-11-29 00:04:13'),
	(753, 90958, 'btc', '2025-11-29 00:06:14'),
	(754, 90913, 'btc', '2025-11-29 00:08:14'),
	(755, 90864, 'btc', '2025-11-29 00:10:15'),
	(756, 90872, 'btc', '2025-11-29 00:12:15'),
	(757, 90883, 'btc', '2025-11-29 00:14:15'),
	(758, 90907, 'btc', '2025-11-29 00:16:16'),
	(759, 90806, 'btc', '2025-11-29 00:18:16'),
	(760, 90830, 'btc', '2025-11-29 00:20:17'),
	(761, 90880, 'btc', '2025-11-29 00:22:17'),
	(762, 90926, 'btc', '2025-11-29 00:24:18'),
	(763, 90836, 'btc', '2025-11-29 00:26:18'),
	(764, 90865, 'btc', '2025-11-29 00:28:18'),
	(765, 90901, 'btc', '2025-11-29 00:30:19'),
	(766, 90822, 'btc', '2025-11-29 00:32:19'),
	(767, 90839, 'btc', '2025-11-29 00:34:20'),
	(768, 90828, 'btc', '2025-11-29 00:36:20'),
	(769, 90917, 'btc', '2025-11-29 00:38:21'),
	(770, 90854, 'btc', '2025-11-29 00:40:21'),
	(771, 90936, 'btc', '2025-11-29 00:42:22'),
	(772, 90943, 'btc', '2025-11-29 00:44:22'),
	(773, 90924, 'btc', '2025-11-29 00:46:22'),
	(774, 90882, 'btc', '2025-11-29 00:48:23'),
	(775, 90897, 'btc', '2025-11-29 00:50:23'),
	(776, 90856, 'btc', '2025-11-29 00:52:24'),
	(777, 90888, 'btc', '2025-11-29 00:54:24'),
	(778, 90857, 'btc', '2025-11-29 00:56:24'),
	(779, 90862, 'btc', '2025-11-29 00:58:25'),
	(780, 90866, 'btc', '2025-11-29 01:00:25'),
	(781, 90890, 'btc', '2025-11-29 01:02:26'),
	(782, 90905, 'btc', '2025-11-29 01:04:26'),
	(783, 90870, 'btc', '2025-11-29 01:06:26'),
	(784, 90941, 'btc', '2025-11-29 01:08:27'),
	(785, 90947, 'btc', '2025-11-29 01:10:27'),
	(786, 90946, 'btc', '2025-11-29 01:12:28'),
	(787, 91037, 'btc', '2025-11-29 01:14:28'),
	(788, 91064, 'btc', '2025-11-29 01:16:29'),
	(789, 91089, 'btc', '2025-11-29 01:18:29'),
	(790, 90976, 'btc', '2025-11-29 01:20:29'),
	(791, 91000, 'btc', '2025-11-29 01:22:30'),
	(792, 91000, 'btc', '2025-11-29 01:24:30'),
	(793, 90959, 'btc', '2025-11-29 01:26:31'),
	(794, 90958, 'btc', '2025-11-29 01:28:31'),
	(795, 90963, 'btc', '2025-11-29 01:30:32'),
	(796, 90942, 'btc', '2025-11-29 01:32:32'),
	(797, 90902, 'btc', '2025-11-29 01:34:33'),
	(798, 90888, 'btc', '2025-11-29 01:36:33'),
	(799, 90867, 'btc', '2025-11-29 01:38:33'),
	(800, 90800, 'btc', '2025-11-29 01:40:34'),
	(801, 90834, 'btc', '2025-11-29 01:42:34'),
	(802, 90869, 'btc', '2025-11-29 01:44:35'),
	(803, 90885, 'btc', '2025-11-29 01:46:35'),
	(804, 90855, 'btc', '2025-11-29 01:48:36'),
	(805, 90843, 'btc', '2025-11-29 01:50:36'),
	(806, 90857, 'btc', '2025-11-29 01:52:37'),
	(807, 90863, 'btc', '2025-11-29 01:54:37'),
	(808, 90906, 'btc', '2025-11-29 01:56:38'),
	(809, 90882, 'btc', '2025-11-29 01:58:38'),
	(810, 90881, 'btc', '2025-11-29 02:00:38'),
	(811, 90847, 'btc', '2025-11-29 02:02:39'),
	(812, 90809, 'btc', '2025-11-29 02:04:39'),
	(813, 90835, 'btc', '2025-11-29 02:06:40'),
	(814, 90810, 'btc', '2025-11-29 02:08:40'),
	(815, 90813, 'btc', '2025-11-29 02:10:40'),
	(816, 90827, 'btc', '2025-11-29 02:12:41'),
	(817, 90856, 'btc', '2025-11-29 02:14:41'),
	(818, 90872, 'btc', '2025-11-29 02:16:42'),
	(819, 90890, 'btc', '2025-11-29 02:18:42'),
	(820, 90893, 'btc', '2025-11-29 02:20:42'),
	(821, 90919, 'btc', '2025-11-29 02:22:43'),
	(822, 90923, 'btc', '2025-11-29 02:24:43'),
	(823, 90890, 'btc', '2025-11-29 02:26:44'),
	(824, 90906, 'btc', '2025-11-29 02:28:44'),
	(825, 90840, 'btc', '2025-11-29 02:30:45'),
	(826, 90642, 'btc', '2025-11-29 02:32:45'),
	(827, 90580, 'btc', '2025-11-29 02:34:45'),
	(828, 90593, 'btc', '2025-11-29 02:36:46'),
	(829, 90630, 'btc', '2025-11-29 02:38:46'),
	(830, 90653, 'btc', '2025-11-29 02:40:46'),
	(831, 90653, 'btc', '2025-11-29 02:42:47'),
	(832, 90672, 'btc', '2025-11-29 02:44:47'),
	(833, 90600, 'btc', '2025-11-29 02:46:48'),
	(834, 90645, 'btc', '2025-11-29 02:48:48'),
	(835, 90662, 'btc', '2025-11-29 02:50:48'),
	(836, 90698, 'btc', '2025-11-29 02:52:49'),
	(837, 90709, 'btc', '2025-11-29 02:54:49'),
	(838, 90756, 'btc', '2025-11-29 02:56:50'),
	(839, 90781, 'btc', '2025-11-29 02:58:50'),
	(840, 90818, 'btc', '2025-11-29 03:00:50'),
	(841, 90811, 'btc', '2025-11-29 03:02:51'),
	(842, 90874, 'btc', '2025-11-29 03:04:51'),
	(843, 90841, 'btc', '2025-11-29 03:06:52'),
	(844, 90706, 'btc', '2025-11-29 13:38:50'),
	(845, 90658, 'btc', '2025-11-29 14:42:27'),
	(846, 90685, 'btc', '2025-11-29 14:44:28'),
	(847, 90632, 'btc', '2025-11-29 14:46:28'),
	(848, 90680, 'btc', '2025-11-29 14:48:29'),
	(849, 90685, 'btc', '2025-11-29 14:50:29'),
	(850, 90634, 'btc', '2025-11-29 14:52:30'),
	(851, 90660, 'btc', '2025-11-29 14:54:37'),
	(852, 90626, 'btc', '2025-11-29 14:55:35'),
	(853, 90610, 'btc', '2025-11-29 14:57:36'),
	(854, 90622, 'btc', '2025-11-29 14:59:36'),
	(855, 90666, 'btc', '2025-11-29 15:01:37'),
	(856, 90658, 'btc', '2025-11-29 15:03:37'),
	(857, 90659, 'btc', '2025-11-29 15:05:38'),
	(858, 90691, 'btc', '2025-11-29 15:07:38'),
	(859, 90679, 'btc', '2025-11-29 15:09:38'),
	(860, 90711, 'btc', '2025-11-29 15:11:39'),
	(861, 90689, 'btc', '2025-11-29 15:13:39'),
	(862, 90855, 'btc', '2025-11-29 15:15:40'),
	(863, 90947, 'btc', '2025-11-29 15:17:40'),
	(864, 90947, 'btc', '2025-11-29 15:19:41'),
	(865, 91012, 'btc', '2025-11-29 15:21:18'),
	(866, 91040, 'btc', '2025-11-29 15:23:19'),
	(867, 90914, 'btc', '2025-11-29 15:25:19'),
	(868, 90881, 'btc', '2025-11-29 15:27:20'),
	(869, 90882, 'btc', '2025-11-29 15:27:54'),
	(870, 90882, 'btc', '2025-11-29 15:29:54'),
	(871, 90901, 'btc', '2025-11-29 15:31:54'),
	(872, 90925, 'btc', '2025-11-29 15:33:55'),
	(873, 90891, 'btc', '2025-11-29 15:35:55'),
	(874, 90871, 'btc', '2025-11-29 15:37:56'),
	(875, 90904, 'btc', '2025-11-29 15:39:56'),
	(876, 90879, 'btc', '2025-11-29 15:41:57'),
	(877, 90881, 'btc', '2025-11-29 15:43:57'),
	(878, 90944, 'btc', '2025-11-29 15:45:57'),
	(879, 90988, 'btc', '2025-11-29 15:47:58'),
	(880, 91017, 'btc', '2025-11-29 15:49:58'),
	(881, 90991, 'btc', '2025-11-29 15:51:59'),
	(882, 91018, 'btc', '2025-11-29 15:53:59'),
	(883, 91049, 'btc', '2025-11-29 15:56:00'),
	(884, 91063, 'btc', '2025-11-29 15:58:00'),
	(885, 91050, 'btc', '2025-11-29 16:00:00'),
	(886, 90982, 'btc', '2025-11-29 16:02:01'),
	(887, 91018, 'btc', '2025-11-29 16:04:01'),
	(888, 91069, 'btc', '2025-11-29 16:06:02'),
	(889, 91003, 'btc', '2025-11-29 16:08:02'),
	(890, 90979, 'btc', '2025-11-29 16:10:03'),
	(891, 91044, 'btc', '2025-11-29 16:12:03'),
	(892, 91002, 'btc', '2025-11-29 16:14:04'),
	(893, 91028, 'btc', '2025-11-29 16:16:04'),
	(894, 91082, 'btc', '2025-11-29 16:18:05'),
	(895, 91137, 'btc', '2025-11-29 16:20:05'),
	(896, 91108, 'btc', '2025-11-29 16:22:05'),
	(897, 91076, 'btc', '2025-11-29 16:24:06'),
	(898, 90976, 'btc', '2025-11-29 16:26:06'),
	(899, 90897, 'btc', '2025-11-29 16:28:07'),
	(900, 90917, 'btc', '2025-11-29 16:30:07'),
	(901, 90941, 'btc', '2025-11-29 16:31:38'),
	(902, 90954, 'btc', '2025-11-29 16:33:38'),
	(903, 90911, 'btc', '2025-11-29 16:35:39'),
	(904, 90921, 'btc', '2025-11-29 16:37:39'),
	(905, 90918, 'btc', '2025-11-29 16:38:00'),
	(906, 90946, 'btc', '2025-11-29 16:40:00'),
	(907, 90926, 'btc', '2025-11-29 16:42:00'),
	(908, 90930, 'btc', '2025-11-29 16:44:01'),
	(909, 90894, 'btc', '2025-11-29 16:46:01'),
	(910, 90895, 'btc', '2025-11-29 16:48:02'),
	(911, 90875, 'btc', '2025-11-29 16:50:02'),
	(912, 90929, 'btc', '2025-11-29 16:52:03'),
	(913, 91006, 'btc', '2025-11-29 16:54:03'),
	(914, 91009, 'btc', '2025-11-29 16:56:03'),
	(915, 91002, 'btc', '2025-11-29 16:58:04'),
	(916, 90999, 'btc', '2025-11-29 17:00:04'),
	(917, 90999, 'btc', '2025-11-29 17:02:05'),
	(918, 90999, 'btc', '2025-11-29 17:04:05'),
	(919, 90946, 'btc', '2025-11-29 17:06:06'),
	(920, 90889, 'btc', '2025-11-29 17:08:06'),
	(921, 90855, 'btc', '2025-11-29 17:10:07'),
	(922, 90784, 'btc', '2025-11-29 17:12:07'),
	(923, 90723, 'btc', '2025-11-29 17:14:08'),
	(924, 90677, 'btc', '2025-11-29 17:16:08'),
	(925, 90645, 'btc', '2025-11-29 17:18:08'),
	(926, 90711, 'btc', '2025-11-29 17:20:09'),
	(927, 90656, 'btc', '2025-11-29 17:22:09'),
	(928, 90695, 'btc', '2025-11-29 17:24:10'),
	(929, 90680, 'btc', '2025-11-29 17:26:11'),
	(930, 90698, 'btc', '2025-11-29 17:28:11'),
	(931, 90706, 'btc', '2025-11-29 17:30:12'),
	(932, 90637, 'btc', '2025-11-29 17:32:12'),
	(933, 90504, 'btc', '2025-11-29 17:34:12'),
	(934, 90573, 'btc', '2025-11-29 17:36:13'),
	(935, 90582, 'btc', '2025-11-29 17:38:14'),
	(936, 90598, 'btc', '2025-11-29 17:40:14'),
	(937, 90606, 'btc', '2025-11-29 17:42:14'),
	(938, 90596, 'btc', '2025-11-29 17:44:15'),
	(939, 90595, 'btc', '2025-11-29 17:46:15'),
	(940, 90522, 'btc', '2025-11-29 17:48:16'),
	(941, 90474, 'btc', '2025-11-29 17:50:16'),
	(942, 90540, 'btc', '2025-11-29 17:52:17'),
	(943, 90481, 'btc', '2025-11-29 17:54:17'),
	(944, 90466, 'btc', '2025-11-29 17:56:17'),
	(945, 90464, 'btc', '2025-11-29 17:58:18'),
	(946, 90421, 'btc', '2025-11-29 18:00:06'),
	(947, 90486, 'btc', '2025-11-29 18:02:06'),
	(948, 90503, 'btc', '2025-11-29 18:04:07'),
	(949, 90428, 'btc', '2025-11-29 18:06:07'),
	(950, 90506, 'btc', '2025-11-29 18:08:07'),
	(951, 90490, 'btc', '2025-11-29 18:10:08'),
	(952, 90515, 'btc', '2025-11-29 18:12:08'),
	(953, 90256, 'btc', '2025-11-29 18:14:09'),
	(954, 90421, 'btc', '2025-11-29 18:16:09'),
	(955, 90328, 'btc', '2025-11-29 18:18:10'),
	(956, 90322, 'btc', '2025-11-29 18:20:10'),
	(957, 90350, 'btc', '2025-11-29 18:22:11'),
	(958, 90294, 'btc', '2025-11-29 18:24:11'),
	(959, 90322, 'btc', '2025-11-29 18:26:11'),
	(960, 90230, 'btc', '2025-11-29 18:28:12'),
	(961, 90269, 'btc', '2025-11-29 18:30:12'),
	(962, 90282, 'btc', '2025-11-29 18:32:13'),
	(963, 90329, 'btc', '2025-11-29 18:34:13'),
	(964, 90410, 'btc', '2025-11-29 18:36:14'),
	(965, 90460, 'btc', '2025-11-29 18:38:14'),
	(966, 90450, 'btc', '2025-11-29 18:40:15'),
	(967, 90478, 'btc', '2025-11-29 18:42:15'),
	(968, 90594, 'btc', '2025-11-29 18:44:16'),
	(969, 90643, 'btc', '2025-11-29 18:46:16'),
	(970, 90588, 'btc', '2025-11-29 18:48:17'),
	(971, 90602, 'btc', '2025-11-29 18:50:17'),
	(972, 90682, 'btc', '2025-11-29 18:52:17'),
	(973, 90651, 'btc', '2025-11-29 18:54:18'),
	(974, 90700, 'btc', '2025-11-29 18:56:18'),
	(975, 90701, 'btc', '2025-11-29 18:58:19'),
	(976, 90672, 'btc', '2025-11-29 19:00:19'),
	(977, 90647, 'btc', '2025-11-29 19:02:20'),
	(978, 90633, 'btc', '2025-11-29 19:04:20'),
	(979, 90749, 'btc', '2025-11-29 19:06:21'),
	(980, 90680, 'btc', '2025-11-29 19:08:21'),
	(981, 90766, 'btc', '2025-11-29 19:10:21'),
	(982, 90773, 'btc', '2025-11-29 19:12:22'),
	(983, 90753, 'btc', '2025-11-29 19:14:22'),
	(984, 90729, 'btc', '2025-11-29 19:16:23'),
	(985, 90748, 'btc', '2025-11-29 19:18:23'),
	(986, 90723, 'btc', '2025-11-29 19:20:24'),
	(987, 90750, 'btc', '2025-11-29 19:22:24'),
	(988, 90794, 'btc', '2025-11-29 19:24:25'),
	(989, 90803, 'btc', '2025-11-29 19:26:25'),
	(990, 90819, 'btc', '2025-11-29 19:28:25'),
	(991, 90823, 'btc', '2025-11-29 19:30:26'),
	(992, 90745, 'btc', '2025-11-29 19:32:26'),
	(993, 90695, 'btc', '2025-11-29 19:34:27'),
	(994, 90694, 'btc', '2025-11-29 19:36:27'),
	(995, 90705, 'btc', '2025-11-29 19:38:28'),
	(996, 90705, 'btc', '2025-11-29 19:40:28'),
	(997, 90642, 'btc', '2025-11-29 19:42:29'),
	(998, 90642, 'btc', '2025-11-29 19:44:29'),
	(999, 90668, 'btc', '2025-11-29 19:46:29'),
	(1000, 90637, 'btc', '2025-11-29 19:48:30'),
	(1001, 90600, 'btc', '2025-11-29 19:50:30'),
	(1002, 90639, 'btc', '2025-11-29 19:52:31'),
	(1003, 90658, 'btc', '2025-11-29 19:54:31'),
	(1004, 90628, 'btc', '2025-11-29 19:56:31'),
	(1005, 90638, 'btc', '2025-11-29 19:58:32'),
	(1006, 90591, 'btc', '2025-11-29 20:00:32'),
	(1007, 90556, 'btc', '2025-11-29 20:02:33'),
	(1008, 90464, 'btc', '2025-11-29 20:04:33'),
	(1009, 90457, 'btc', '2025-11-29 20:06:34'),
	(1010, 90419, 'btc', '2025-11-29 20:08:34'),
	(1011, 90471, 'btc', '2025-11-29 20:10:34'),
	(1012, 90437, 'btc', '2025-11-29 20:12:35'),
	(1013, 90451, 'btc', '2025-11-29 20:14:35'),
	(1014, 90507, 'btc', '2025-11-29 20:16:36'),
	(1015, 90513, 'btc', '2025-11-29 20:18:36'),
	(1016, 90569, 'btc', '2025-11-29 20:20:37'),
	(1017, 90576, 'btc', '2025-11-29 20:22:37'),
	(1018, 90555, 'btc', '2025-11-29 20:24:37'),
	(1019, 90596, 'btc', '2025-11-29 20:26:38'),
	(1020, 90680, 'btc', '2025-11-29 20:28:38'),
	(1021, 90684, 'btc', '2025-11-29 20:30:39'),
	(1022, 90653, 'btc', '2025-11-29 20:32:39'),
	(1023, 90713, 'btc', '2025-11-29 20:34:40'),
	(1024, 90750, 'btc', '2025-11-29 20:36:40'),
	(1025, 90698, 'btc', '2025-11-29 20:38:41'),
	(1026, 90698, 'btc', '2025-11-29 20:40:41'),
	(1027, 90691, 'btc', '2025-11-29 20:42:42'),
	(1028, 90800, 'btc', '2025-11-29 20:44:42'),
	(1029, 90808, 'btc', '2025-11-29 20:46:43'),
	(1030, 90827, 'btc', '2025-11-29 20:48:43'),
	(1031, 90924, 'btc', '2025-11-29 20:50:44'),
	(1032, 90960, 'btc', '2025-11-29 20:55:56'),
	(1033, 91030, 'btc', '2025-11-29 20:57:56'),
	(1034, 91003, 'btc', '2025-11-29 20:59:59'),
	(1035, 90945, 'btc', '2025-11-29 21:01:59'),
	(1036, 90874, 'btc', '2025-11-29 21:04:00'),
	(1037, 90912, 'btc', '2025-11-29 21:06:01'),
	(1038, 90866, 'btc', '2025-11-29 21:08:01'),
	(1039, 90823, 'btc', '2025-11-29 21:10:02'),
	(1040, 90818, 'btc', '2025-11-29 21:12:02'),
	(1041, 90873, 'btc', '2025-11-29 21:14:03'),
	(1042, 90906, 'btc', '2025-11-29 21:16:03'),
	(1043, 90843, 'btc', '2025-11-29 21:18:04'),
	(1044, 90825, 'btc', '2025-11-29 21:20:04'),
	(1045, 90911, 'btc', '2025-11-29 21:22:05'),
	(1046, 90949, 'btc', '2025-11-29 21:22:33'),
	(1047, 90923, 'btc', '2025-11-29 21:24:34'),
	(1048, 90970, 'btc', '2025-11-29 21:26:34'),
	(1049, 90938, 'btc', '2025-11-29 21:28:35'),
	(1050, 90952, 'btc', '2025-11-29 21:30:35'),
	(1051, 90953, 'btc', '2025-11-29 21:32:35'),
	(1052, 90965, 'btc', '2025-11-29 21:34:36'),
	(1053, 91000, 'btc', '2025-11-29 21:36:36'),
	(1054, 90994, 'btc', '2025-11-29 21:38:37'),
	(1055, 91005, 'btc', '2025-11-29 21:40:37'),
	(1056, 91000, 'btc', '2025-11-29 21:42:05'),
	(1057, 91048, 'btc', '2025-11-29 21:44:06'),
	(1058, 91036, 'btc', '2025-11-29 21:46:06'),
	(1059, 91027, 'btc', '2025-11-29 21:48:06'),
	(1060, 90969, 'btc', '2025-11-29 21:50:07'),
	(1061, 90976, 'btc', '2025-11-29 21:52:07'),
	(1062, 91003, 'btc', '2025-11-29 21:54:08'),
	(1063, 91014, 'btc', '2025-11-29 21:55:11'),
	(1064, 91024, 'btc', '2025-11-29 21:57:11'),
	(1065, 91000, 'btc', '2025-11-29 21:59:11'),
	(1066, 90959, 'btc', '2025-11-29 22:01:12'),
	(1067, 90961, 'btc', '2025-11-29 22:03:12'),
	(1068, 90887, 'btc', '2025-11-29 22:05:13'),
	(1069, 90911, 'btc', '2025-11-29 22:07:13'),
	(1070, 90898, 'btc', '2025-11-29 22:09:13'),
	(1071, 90907, 'btc', '2025-11-29 22:11:14'),
	(1072, 90806, 'btc', '2025-11-29 22:13:14'),
	(1073, 90796, 'btc', '2025-11-29 22:15:15'),
	(1074, 90788, 'btc', '2025-11-29 22:17:15'),
	(1075, 90768, 'btc', '2025-11-29 22:19:15'),
	(1076, 90741, 'btc', '2025-11-29 22:21:16'),
	(1077, 90743, 'btc', '2025-11-29 22:23:16'),
	(1078, 90733, 'btc', '2025-11-29 22:25:17'),
	(1079, 90711, 'btc', '2025-11-29 22:27:17'),
	(1080, 90723, 'btc', '2025-11-29 22:29:17'),
	(1081, 90743, 'btc', '2025-11-29 22:31:18'),
	(1082, 90783, 'btc', '2025-11-29 22:33:18'),
	(1083, 90799, 'btc', '2025-11-29 22:35:18'),
	(1084, 90839, 'btc', '2025-11-29 22:37:19'),
	(1085, 90836, 'btc', '2025-11-29 22:39:19'),
	(1086, 90819, 'btc', '2025-11-29 22:41:20'),
	(1087, 90898, 'btc', '2025-11-29 22:43:20'),
	(1088, 90916, 'btc', '2025-11-29 22:45:20'),
	(1089, 90811, 'btc', '2025-11-29 22:47:30'),
	(1090, 90788, 'btc', '2025-11-29 22:50:03'),
	(1091, 90760, 'btc', '2025-11-29 22:52:04'),
	(1092, 90811, 'btc', '2025-11-29 22:54:04'),
	(1093, 90808, 'btc', '2025-11-29 22:56:04'),
	(1094, 90775, 'btc', '2025-11-29 22:58:05'),
	(1095, 90749, 'btc', '2025-11-29 23:00:05'),
	(1096, 90767, 'btc', '2025-11-29 23:02:05'),
	(1097, 90735, 'btc', '2025-11-29 23:04:06'),
	(1098, 90790, 'btc', '2025-11-29 23:06:06'),
	(1099, 90715, 'btc', '2025-11-29 23:08:07'),
	(1100, 90690, 'btc', '2025-11-29 23:10:07'),
	(1101, 90722, 'btc', '2025-11-29 23:12:21'),
	(1102, 90714, 'btc', '2025-11-29 23:14:11'),
	(1103, 90711, 'btc', '2025-11-29 23:16:12'),
	(1104, 90753, 'btc', '2025-11-29 23:18:29'),
	(1105, 90762, 'btc', '2025-11-29 23:19:49'),
	(1106, 90806, 'btc', '2025-11-29 23:21:49'),
	(1107, 90828, 'btc', '2025-11-29 23:23:50'),
	(1108, 90882, 'btc', '2025-11-29 23:25:50'),
	(1109, 90842, 'btc', '2025-11-29 23:27:50'),
	(1110, 90817, 'btc', '2025-11-29 23:29:51'),
	(1111, 90836, 'btc', '2025-11-29 23:31:51'),
	(1112, 90829, 'btc', '2025-11-29 23:33:51'),
	(1113, 90946, 'btc', '2025-11-30 01:29:33'),
	(1114, 90984, 'btc', '2025-11-30 01:31:33'),
	(1115, 90993, 'btc', '2025-11-30 01:33:34'),
	(1116, 90992, 'btc', '2025-11-30 01:35:34'),
	(1117, 91021, 'btc', '2025-11-30 01:36:46'),
	(1118, 91001, 'btc', '2025-11-30 01:38:46'),
	(1119, 90985, 'btc', '2025-11-30 01:40:46'),
	(1120, 90964, 'btc', '2025-11-30 01:42:47'),
	(1121, 90955, 'btc', '2025-11-30 01:44:47'),
	(1122, 90944, 'btc', '2025-11-30 01:46:47'),
	(1123, 90944, 'btc', '2025-11-30 01:48:48'),
	(1124, 90946, 'btc', '2025-11-30 01:50:48'),
	(1125, 90913, 'btc', '2025-11-30 01:52:48'),
	(1126, 90923, 'btc', '2025-11-30 01:54:42'),
	(1127, 90906, 'btc', '2025-11-30 01:56:42'),
	(1128, 90941, 'btc', '2025-11-30 01:58:43'),
	(1129, 90935, 'btc', '2025-11-30 02:00:43'),
	(1130, 90961, 'btc', '2025-11-30 02:02:43'),
	(1131, 91000, 'btc', '2025-11-30 02:04:43'),
	(1132, 90984, 'btc', '2025-11-30 02:06:11'),
	(1133, 91025, 'btc', '2025-11-30 02:08:11'),
	(1134, 91030, 'btc', '2025-11-30 02:10:11'),
	(1135, 90950, 'btc', '2025-11-30 02:12:12'),
	(1136, 90945, 'btc', '2025-11-30 02:14:12'),
	(1137, 90936, 'btc', '2025-11-30 02:16:12'),
	(1138, 90901, 'btc', '2025-11-30 02:17:14'),
	(1139, 90946, 'btc', '2025-11-30 02:19:15'),
	(1140, 90946, 'btc', '2025-11-30 02:21:15'),
	(1141, 90984, 'btc', '2025-11-30 02:23:15'),
	(1142, 90926, 'btc', '2025-11-30 02:25:15'),
	(1143, 90916, 'btc', '2025-11-30 02:27:16'),
	(1144, 90951, 'btc', '2025-11-30 02:29:16'),
	(1145, 90955, 'btc', '2025-11-30 02:31:16'),
	(1146, 90982, 'btc', '2025-11-30 02:33:17'),
	(1147, 90994, 'btc', '2025-11-30 02:35:17'),
	(1148, 90914, 'btc', '2025-11-30 02:37:17'),
	(1149, 90891, 'btc', '2025-11-30 02:39:18'),
	(1150, 90853, 'btc', '2025-11-30 02:41:18'),
	(1151, 90829, 'btc', '2025-11-30 02:43:18'),
	(1152, 90836, 'btc', '2025-11-30 02:45:18'),
	(1153, 90871, 'btc', '2025-11-30 02:47:19'),
	(1154, 90848, 'btc', '2025-11-30 02:49:19'),
	(1155, 90871, 'btc', '2025-11-30 02:51:19'),
	(1156, 90821, 'btc', '2025-11-30 02:53:20'),
	(1157, 90750, 'btc', '2025-11-30 02:55:20'),
	(1158, 90764, 'btc', '2025-11-30 02:57:20'),
	(1159, 90784, 'btc', '2025-11-30 02:59:21'),
	(1160, 90768, 'btc', '2025-11-30 03:01:21'),
	(1161, 90820, 'btc', '2025-11-30 03:03:21'),
	(1162, 90752, 'btc', '2025-11-30 03:05:21'),
	(1163, 90762, 'btc', '2025-11-30 03:07:22'),
	(1164, 90651, 'btc', '2025-11-30 03:09:22'),
	(1165, 90651, 'btc', '2025-11-30 03:11:22'),
	(1166, 90618, 'btc', '2025-11-30 03:13:23'),
	(1167, 90605, 'btc', '2025-11-30 03:15:23'),
	(1168, 90624, 'btc', '2025-11-30 03:17:23'),
	(1169, 90533, 'btc', '2025-11-30 03:19:24'),
	(1170, 90523, 'btc', '2025-11-30 03:21:24'),
	(1171, 90701, 'btc', '2025-11-30 03:23:24'),
	(1172, 90697, 'btc', '2025-11-30 03:25:24'),
	(1173, 90692, 'btc', '2025-11-30 03:27:25'),
	(1174, 90687, 'btc', '2025-11-30 03:29:25'),
	(1175, 90764, 'btc', '2025-11-30 03:31:25'),
	(1176, 90740, 'btc', '2025-11-30 03:33:26'),
	(1177, 90699, 'btc', '2025-11-30 03:35:26'),
	(1178, 90734, 'btc', '2025-11-30 03:37:26'),
	(1179, 90727, 'btc', '2025-11-30 03:39:26'),
	(1180, 90793, 'btc', '2025-11-30 03:41:27'),
	(1181, 90860, 'btc', '2025-11-30 03:43:27'),
	(1182, 90903, 'btc', '2025-11-30 03:45:27'),
	(1183, 90901, 'btc', '2025-11-30 03:47:28'),
	(1184, 90898, 'btc', '2025-11-30 03:49:28'),
	(1185, 90880, 'btc', '2025-11-30 03:51:28'),
	(1186, 90886, 'btc', '2025-11-30 03:53:29'),
	(1187, 90866, 'btc', '2025-11-30 03:55:29'),
	(1188, 90897, 'btc', '2025-11-30 03:57:29'),
	(1189, 90890, 'btc', '2025-11-30 03:59:29'),
	(1190, 90893, 'btc', '2025-11-30 04:01:30'),
	(1191, 90938, 'btc', '2025-11-30 04:03:30'),
	(1192, 90912, 'btc', '2025-11-30 04:05:30'),
	(1193, 90970, 'btc', '2025-11-30 04:07:31'),
	(1194, 90938, 'btc', '2025-11-30 04:09:31'),
	(1195, 90965, 'btc', '2025-11-30 04:11:31'),
	(1196, 90940, 'btc', '2025-11-30 04:13:31'),
	(1197, 90920, 'btc', '2025-11-30 04:15:32'),
	(1198, 90904, 'btc', '2025-11-30 04:17:32'),
	(1199, 90916, 'btc', '2025-11-30 04:19:32'),
	(1200, 90930, 'btc', '2025-11-30 04:21:33'),
	(1201, 90918, 'btc', '2025-11-30 04:23:33'),
	(1202, 90906, 'btc', '2025-11-30 04:25:33'),
	(1203, 90885, 'btc', '2025-11-30 04:27:33'),
	(1204, 90871, 'btc', '2025-11-30 04:29:34'),
	(1205, 90890, 'btc', '2025-11-30 04:31:34'),
	(1206, 90858, 'btc', '2025-11-30 04:33:34'),
	(1207, 90880, 'btc', '2025-11-30 04:35:34'),
	(1208, 90867, 'btc', '2025-11-30 04:37:35'),
	(1209, 90889, 'btc', '2025-11-30 04:39:35'),
	(1210, 90888, 'btc', '2025-11-30 04:41:35'),
	(1211, 90835, 'btc', '2025-11-30 04:43:36'),
	(1212, 90826, 'btc', '2025-11-30 04:45:36'),
	(1213, 90851, 'btc', '2025-11-30 04:47:36'),
	(1214, 90817, 'btc', '2025-11-30 04:49:36'),
	(1215, 90857, 'btc', '2025-11-30 04:51:37'),
	(1216, 90842, 'btc', '2025-11-30 04:53:37'),
	(1217, 90842, 'btc', '2025-11-30 04:55:37'),
	(1218, 90836, 'btc', '2025-11-30 04:57:38'),
	(1219, 90858, 'btc', '2025-11-30 04:59:38'),
	(1220, 90822, 'btc', '2025-11-30 05:01:38'),
	(1221, 90791, 'btc', '2025-11-30 05:03:38'),
	(1222, 90746, 'btc', '2025-11-30 05:05:39'),
	(1223, 90771, 'btc', '2025-11-30 05:07:39'),
	(1224, 90762, 'btc', '2025-11-30 05:09:39'),
	(1225, 90766, 'btc', '2025-11-30 05:11:40'),
	(1226, 90769, 'btc', '2025-11-30 05:13:40'),
	(1227, 90781, 'btc', '2025-11-30 05:15:40'),
	(1228, 90678, 'btc', '2025-11-30 05:17:41'),
	(1229, 90735, 'btc', '2025-11-30 05:19:41'),
	(1230, 90724, 'btc', '2025-11-30 05:21:41'),
	(1231, 90693, 'btc', '2025-11-30 05:23:41'),
	(1232, 90719, 'btc', '2025-11-30 05:25:42'),
	(1233, 90704, 'btc', '2025-11-30 05:27:42'),
	(1234, 90704, 'btc', '2025-11-30 05:29:42'),
	(1235, 90710, 'btc', '2025-11-30 05:31:43'),
	(1236, 90753, 'btc', '2025-11-30 05:33:43'),
	(1237, 90739, 'btc', '2025-11-30 05:35:43'),
	(1238, 90717, 'btc', '2025-11-30 05:37:43'),
	(1239, 90727, 'btc', '2025-11-30 05:39:44'),
	(1240, 90750, 'btc', '2025-11-30 05:41:44'),
	(1241, 90779, 'btc', '2025-11-30 05:43:44'),
	(1242, 90738, 'btc', '2025-11-30 05:45:45'),
	(1243, 90751, 'btc', '2025-11-30 05:47:45'),
	(1244, 90730, 'btc', '2025-11-30 05:49:45'),
	(1245, 90805, 'btc', '2025-11-30 05:51:45'),
	(1246, 90795, 'btc', '2025-11-30 05:53:46'),
	(1247, 90817, 'btc', '2025-11-30 05:55:46'),
	(1248, 90810, 'btc', '2025-11-30 05:57:46'),
	(1249, 90784, 'btc', '2025-11-30 05:59:47'),
	(1250, 90796, 'btc', '2025-11-30 06:01:47'),
	(1251, 90802, 'btc', '2025-11-30 06:03:47'),
	(1252, 90847, 'btc', '2025-11-30 06:05:48'),
	(1253, 90870, 'btc', '2025-11-30 06:07:48'),
	(1254, 90732, 'btc', '2025-11-30 06:09:48'),
	(1255, 90743, 'btc', '2025-11-30 06:11:48'),
	(1256, 90767, 'btc', '2025-11-30 06:13:49'),
	(1257, 90733, 'btc', '2025-11-30 06:15:49'),
	(1258, 90781, 'btc', '2025-11-30 06:17:49'),
	(1259, 90779, 'btc', '2025-11-30 06:19:50'),
	(1260, 90817, 'btc', '2025-11-30 06:21:50'),
	(1261, 90852, 'btc', '2025-11-30 06:23:50'),
	(1262, 90878, 'btc', '2025-11-30 06:25:50'),
	(1263, 90889, 'btc', '2025-11-30 06:27:51'),
	(1264, 90905, 'btc', '2025-11-30 06:29:51'),
	(1265, 90900, 'btc', '2025-11-30 06:31:51'),
	(1266, 90923, 'btc', '2025-11-30 06:33:52'),
	(1267, 90924, 'btc', '2025-11-30 06:35:52'),
	(1268, 90905, 'btc', '2025-11-30 06:37:52'),
	(1269, 90909, 'btc', '2025-11-30 06:39:53'),
	(1270, 90899, 'btc', '2025-11-30 06:41:53'),
	(1271, 90917, 'btc', '2025-11-30 06:43:53'),
	(1272, 90914, 'btc', '2025-11-30 06:45:54'),
	(1273, 90890, 'btc', '2025-11-30 06:47:54'),
	(1274, 90872, 'btc', '2025-11-30 06:49:54'),
	(1275, 90907, 'btc', '2025-11-30 06:51:54'),
	(1276, 90875, 'btc', '2025-11-30 06:53:55'),
	(1277, 90885, 'btc', '2025-11-30 06:55:55'),
	(1278, 90880, 'btc', '2025-11-30 06:57:55'),
	(1279, 90899, 'btc', '2025-11-30 06:59:55'),
	(1280, 90860, 'btc', '2025-11-30 07:01:56'),
	(1281, 90888, 'btc', '2025-11-30 07:03:56'),
	(1282, 90937, 'btc', '2025-11-30 07:05:56'),
	(1283, 90927, 'btc', '2025-11-30 07:07:57'),
	(1284, 90901, 'btc', '2025-11-30 07:09:57'),
	(1285, 90936, 'btc', '2025-11-30 07:11:57'),
	(1286, 90957, 'btc', '2025-11-30 07:13:57'),
	(1287, 90957, 'btc', '2025-11-30 07:15:58'),
	(1288, 90955, 'btc', '2025-11-30 07:17:58'),
	(1289, 90968, 'btc', '2025-11-30 07:19:58'),
	(1290, 90950, 'btc', '2025-11-30 07:21:59'),
	(1291, 90942, 'btc', '2025-11-30 07:23:59'),
	(1292, 90953, 'btc', '2025-11-30 07:25:59'),
	(1293, 90976, 'btc', '2025-11-30 07:28:00'),
	(1294, 90955, 'btc', '2025-11-30 07:30:00'),
	(1295, 90951, 'btc', '2025-11-30 07:32:00'),
	(1296, 90952, 'btc', '2025-11-30 07:34:00'),
	(1297, 90930, 'btc', '2025-11-30 07:36:01'),
	(1298, 90952, 'btc', '2025-11-30 07:38:01'),
	(1299, 90956, 'btc', '2025-11-30 07:40:01'),
	(1300, 90908, 'btc', '2025-11-30 07:42:02'),
	(1301, 90916, 'btc', '2025-11-30 07:44:02'),
	(1302, 90957, 'btc', '2025-11-30 07:46:02'),
	(1303, 91014, 'btc', '2025-11-30 07:48:02'),
	(1304, 91033, 'btc', '2025-11-30 07:50:03'),
	(1305, 90954, 'btc', '2025-11-30 07:52:03'),
	(1306, 90934, 'btc', '2025-11-30 07:54:03'),
	(1307, 90958, 'btc', '2025-11-30 07:56:04'),
	(1308, 90980, 'btc', '2025-11-30 07:58:04'),
	(1309, 90968, 'btc', '2025-11-30 08:00:04'),
	(1310, 91000, 'btc', '2025-11-30 08:02:05'),
	(1311, 91004, 'btc', '2025-11-30 08:04:05'),
	(1312, 91000, 'btc', '2025-11-30 08:06:05'),
	(1313, 91012, 'btc', '2025-11-30 08:08:05'),
	(1314, 91024, 'btc', '2025-11-30 08:10:06'),
	(1315, 91013, 'btc', '2025-11-30 08:12:06'),
	(1316, 90986, 'btc', '2025-11-30 08:14:06'),
	(1317, 90982, 'btc', '2025-11-30 08:16:07'),
	(1318, 90992, 'btc', '2025-11-30 08:18:07'),
	(1319, 91040, 'btc', '2025-11-30 08:20:07'),
	(1320, 91096, 'btc', '2025-11-30 08:22:07'),
	(1321, 91388, 'btc', '2025-11-30 08:24:08'),
	(1322, 91226, 'btc', '2025-11-30 08:26:08'),
	(1323, 91229, 'btc', '2025-11-30 08:28:08'),
	(1324, 91192, 'btc', '2025-11-30 08:30:09'),
	(1325, 91112, 'btc', '2025-11-30 08:32:09'),
	(1326, 91187, 'btc', '2025-11-30 08:34:09'),
	(1327, 91057, 'btc', '2025-11-30 08:36:09'),
	(1328, 91019, 'btc', '2025-11-30 08:38:10'),
	(1329, 90991, 'btc', '2025-11-30 08:40:10'),
	(1330, 91050, 'btc', '2025-11-30 08:42:10'),
	(1331, 91187, 'btc', '2025-11-30 08:44:11'),
	(1332, 91167, 'btc', '2025-11-30 08:46:11'),
	(1333, 91128, 'btc', '2025-11-30 08:48:11'),
	(1334, 91213, 'btc', '2025-11-30 08:50:11'),
	(1335, 91283, 'btc', '2025-11-30 08:52:12'),
	(1336, 91246, 'btc', '2025-11-30 08:54:12'),
	(1337, 91222, 'btc', '2025-11-30 08:56:12'),
	(1338, 91229, 'btc', '2025-11-30 08:58:13'),
	(1339, 91184, 'btc', '2025-11-30 09:00:13'),
	(1340, 91172, 'btc', '2025-11-30 09:02:13'),
	(1341, 91173, 'btc', '2025-11-30 09:04:14'),
	(1342, 91218, 'btc', '2025-11-30 09:06:14'),
	(1343, 91291, 'btc', '2025-11-30 09:08:14'),
	(1344, 91310, 'btc', '2025-11-30 09:10:14'),
	(1345, 91477, 'btc', '2025-11-30 09:12:15'),
	(1346, 91557, 'btc', '2025-11-30 09:14:15'),
	(1347, 91455, 'btc', '2025-11-30 09:16:15'),
	(1348, 91409, 'btc', '2025-11-30 09:18:16'),
	(1349, 91488, 'btc', '2025-11-30 09:20:16'),
	(1350, 91438, 'btc', '2025-11-30 09:22:16'),
	(1351, 91434, 'btc', '2025-11-30 09:24:16'),
	(1352, 91334, 'btc', '2025-11-30 09:26:17'),
	(1353, 91374, 'btc', '2025-11-30 09:28:17'),
	(1354, 91432, 'btc', '2025-11-30 09:30:17'),
	(1355, 91332, 'btc', '2025-11-30 09:32:18'),
	(1356, 91391, 'btc', '2025-11-30 09:34:18'),
	(1357, 91386, 'btc', '2025-11-30 09:36:18'),
	(1358, 91359, 'btc', '2025-11-30 09:38:19'),
	(1359, 91354, 'btc', '2025-11-30 09:40:19'),
	(1360, 91402, 'btc', '2025-11-30 09:42:19'),
	(1361, 91393, 'btc', '2025-11-30 09:44:20'),
	(1362, 91415, 'btc', '2025-11-30 09:46:20'),
	(1363, 91377, 'btc', '2025-11-30 09:48:20'),
	(1364, 91343, 'btc', '2025-11-30 09:50:20'),
	(1365, 91360, 'btc', '2025-11-30 09:52:21'),
	(1366, 91325, 'btc', '2025-11-30 09:54:21'),
	(1367, 91365, 'btc', '2025-11-30 09:56:21'),
	(1368, 91429, 'btc', '2025-11-30 09:58:21'),
	(1369, 91402, 'btc', '2025-11-30 10:00:22'),
	(1370, 91425, 'btc', '2025-11-30 10:02:22'),
	(1371, 91358, 'btc', '2025-11-30 10:04:22'),
	(1372, 91325, 'btc', '2025-11-30 10:06:23'),
	(1373, 91294, 'btc', '2025-11-30 10:08:23'),
	(1374, 91286, 'btc', '2025-11-30 10:10:23'),
	(1375, 91274, 'btc', '2025-11-30 10:12:24'),
	(1376, 91264, 'btc', '2025-11-30 10:14:24'),
	(1377, 91243, 'btc', '2025-11-30 10:16:24'),
	(1378, 91279, 'btc', '2025-11-30 10:18:24'),
	(1379, 91347, 'btc', '2025-11-30 10:20:25'),
	(1380, 91347, 'btc', '2025-11-30 10:22:25'),
	(1381, 91327, 'btc', '2025-11-30 10:24:25'),
	(1382, 91360, 'btc', '2025-11-30 10:26:26'),
	(1383, 91379, 'btc', '2025-11-30 10:28:26'),
	(1384, 91368, 'btc', '2025-11-30 10:30:26'),
	(1385, 91299, 'btc', '2025-11-30 10:32:27'),
	(1386, 91270, 'btc', '2025-11-30 10:34:27'),
	(1387, 91240, 'btc', '2025-11-30 10:36:27'),
	(1388, 91260, 'btc', '2025-11-30 10:38:27'),
	(1389, 91253, 'btc', '2025-11-30 10:40:28'),
	(1390, 91237, 'btc', '2025-11-30 10:42:28'),
	(1391, 91240, 'btc', '2025-11-30 10:44:28'),
	(1392, 91200, 'btc', '2025-11-30 10:46:29'),
	(1393, 91275, 'btc', '2025-11-30 10:48:29'),
	(1394, 91260, 'btc', '2025-11-30 10:50:29'),
	(1395, 91230, 'btc', '2025-11-30 10:52:30'),
	(1396, 91201, 'btc', '2025-11-30 10:54:30'),
	(1397, 91239, 'btc', '2025-11-30 10:56:30'),
	(1398, 91238, 'btc', '2025-11-30 10:58:31'),
	(1399, 91242, 'btc', '2025-11-30 11:00:31'),
	(1400, 91236, 'btc', '2025-11-30 11:02:31'),
	(1401, 91290, 'btc', '2025-11-30 11:04:31'),
	(1402, 91340, 'btc', '2025-11-30 11:06:32'),
	(1403, 91390, 'btc', '2025-11-30 11:08:32'),
	(1404, 91335, 'btc', '2025-11-30 11:10:32'),
	(1405, 91372, 'btc', '2025-11-30 11:12:33'),
	(1406, 91323, 'btc', '2025-11-30 11:14:33'),
	(1407, 91337, 'btc', '2025-11-30 11:16:33'),
	(1408, 91288, 'btc', '2025-11-30 11:18:34'),
	(1409, 91280, 'btc', '2025-11-30 11:20:34'),
	(1410, 91250, 'btc', '2025-11-30 11:22:34'),
	(1411, 91258, 'btc', '2025-11-30 11:24:34'),
	(1412, 91226, 'btc', '2025-11-30 11:26:35'),
	(1413, 91255, 'btc', '2025-11-30 11:28:35'),
	(1414, 91269, 'btc', '2025-11-30 11:30:35'),
	(1415, 91213, 'btc', '2025-11-30 11:32:36'),
	(1416, 91181, 'btc', '2025-11-30 11:34:36'),
	(1417, 91128, 'btc', '2025-11-30 11:36:36'),
	(1418, 91144, 'btc', '2025-11-30 11:38:36'),
	(1419, 91180, 'btc', '2025-11-30 11:40:37'),
	(1420, 91151, 'btc', '2025-11-30 11:42:37'),
	(1421, 91183, 'btc', '2025-11-30 11:44:37'),
	(1422, 91167, 'btc', '2025-11-30 11:46:38'),
	(1423, 91167, 'btc', '2025-11-30 11:48:38'),
	(1424, 91122, 'btc', '2025-11-30 11:50:38'),
	(1425, 91073, 'btc', '2025-11-30 11:52:38'),
	(1426, 91101, 'btc', '2025-11-30 11:54:39'),
	(1427, 91071, 'btc', '2025-11-30 11:56:39'),
	(1428, 91055, 'btc', '2025-11-30 11:58:39'),
	(1429, 91066, 'btc', '2025-11-30 12:00:40'),
	(1430, 91050, 'btc', '2025-11-30 12:02:40'),
	(1431, 91045, 'btc', '2025-11-30 12:04:40'),
	(1432, 91109, 'btc', '2025-11-30 12:06:40'),
	(1433, 91136, 'btc', '2025-11-30 12:08:41'),
	(1434, 91168, 'btc', '2025-11-30 12:10:41'),
	(1435, 91228, 'btc', '2025-11-30 12:12:41'),
	(1436, 91254, 'btc', '2025-11-30 12:14:42'),
	(1437, 91317, 'btc', '2025-11-30 12:16:42'),
	(1438, 91265, 'btc', '2025-11-30 12:18:42'),
	(1439, 91258, 'btc', '2025-11-30 12:19:45'),
	(1440, 91254, 'btc', '2025-11-30 12:21:46'),
	(1441, 91317, 'btc', '2025-11-30 12:23:46'),
	(1442, 91284, 'btc', '2025-11-30 12:25:46'),
	(1443, 91292, 'btc', '2025-11-30 12:27:46'),
	(1444, 91262, 'btc', '2025-11-30 12:29:47'),
	(1445, 91231, 'btc', '2025-11-30 12:31:47'),
	(1446, 91223, 'btc', '2025-11-30 12:33:47'),
	(1447, 91236, 'btc', '2025-11-30 12:35:47'),
	(1448, 91250, 'btc', '2025-11-30 12:37:48'),
	(1449, 91236, 'btc', '2025-11-30 12:39:48'),
	(1450, 91276, 'btc', '2025-11-30 12:41:48'),
	(1451, 91345, 'btc', '2025-11-30 12:43:49'),
	(1452, 91425, 'btc', '2025-11-30 12:45:49'),
	(1453, 91440, 'btc', '2025-11-30 12:47:49'),
	(1454, 91482, 'btc', '2025-11-30 12:49:50'),
	(1455, 91420, 'btc', '2025-11-30 12:51:50'),
	(1456, 91441, 'btc', '2025-11-30 12:53:50'),
	(1457, 91412, 'btc', '2025-11-30 12:55:51'),
	(1458, 91399, 'btc', '2025-11-30 12:57:51'),
	(1459, 91467, 'btc', '2025-11-30 12:59:51'),
	(1460, 91434, 'btc', '2025-11-30 13:01:52'),
	(1461, 91500, 'btc', '2025-11-30 13:03:52'),
	(1462, 91511, 'btc', '2025-11-30 13:05:52'),
	(1463, 91421, 'btc', '2025-11-30 13:07:52'),
	(1464, 91429, 'btc', '2025-11-30 13:09:53'),
	(1465, 91473, 'btc', '2025-11-30 13:11:53'),
	(1466, 91440, 'btc', '2025-11-30 13:13:53'),
	(1467, 91529, 'btc', '2025-11-30 13:15:54'),
	(1468, 91516, 'btc', '2025-11-30 13:17:54'),
	(1469, 91713, 'btc', '2025-11-30 13:19:54'),
	(1470, 91729, 'btc', '2025-11-30 13:21:54'),
	(1471, 91905, 'btc', '2025-11-30 13:23:55'),
	(1472, 91840, 'btc', '2025-11-30 13:25:55'),
	(1473, 91799, 'btc', '2025-11-30 13:27:55'),
	(1474, 91851, 'btc', '2025-11-30 13:29:56'),
	(1475, 91832, 'btc', '2025-11-30 13:31:56'),
	(1476, 91779, 'btc', '2025-11-30 13:33:56'),
	(1477, 91814, 'btc', '2025-11-30 13:35:57'),
	(1478, 91839, 'btc', '2025-11-30 13:37:57'),
	(1479, 91811, 'btc', '2025-11-30 13:39:57'),
	(1480, 91708, 'btc', '2025-11-30 13:41:58'),
	(1481, 91719, 'btc', '2025-11-30 13:43:58'),
	(1482, 91698, 'btc', '2025-11-30 13:45:58'),
	(1483, 91753, 'btc', '2025-11-30 13:47:59'),
	(1484, 91645, 'btc', '2025-11-30 13:49:59'),
	(1485, 91678, 'btc', '2025-11-30 13:51:59'),
	(1486, 91729, 'btc', '2025-11-30 13:54:00'),
	(1487, 91780, 'btc', '2025-11-30 13:56:00'),
	(1488, 91723, 'btc', '2025-11-30 13:58:00'),
	(1489, 91770, 'btc', '2025-11-30 14:00:01'),
	(1490, 91692, 'btc', '2025-11-30 14:02:01'),
	(1491, 91738, 'btc', '2025-11-30 14:04:01'),
	(1492, 91726, 'btc', '2025-11-30 14:06:02'),
	(1493, 91696, 'btc', '2025-11-30 14:08:02'),
	(1494, 91705, 'btc', '2025-11-30 14:10:02'),
	(1495, 91673, 'btc', '2025-11-30 14:12:02'),
	(1496, 91641, 'btc', '2025-11-30 14:14:03'),
	(1497, 91647, 'btc', '2025-11-30 14:16:03'),
	(1498, 91585, 'btc', '2025-11-30 14:18:03'),
	(1499, 91550, 'btc', '2025-11-30 14:20:04'),
	(1500, 91526, 'btc', '2025-11-30 14:22:04'),
	(1501, 91542, 'btc', '2025-11-30 14:24:04'),
	(1502, 91558, 'btc', '2025-11-30 14:26:04'),
	(1503, 91558, 'btc', '2025-11-30 14:28:05'),
	(1504, 91554, 'btc', '2025-11-30 14:30:05'),
	(1505, 91538, 'btc', '2025-11-30 14:32:05'),
	(1506, 91502, 'btc', '2025-11-30 14:34:06'),
	(1507, 91452, 'btc', '2025-11-30 14:36:06'),
	(1508, 91374, 'btc', '2025-11-30 14:38:06'),
	(1509, 91292, 'btc', '2025-11-30 14:40:06'),
	(1510, 91324, 'btc', '2025-11-30 14:42:07'),
	(1511, 91348, 'btc', '2025-11-30 14:44:07'),
	(1512, 91336, 'btc', '2025-11-30 14:46:07'),
	(1513, 91440, 'btc', '2025-11-30 14:48:08'),
	(1514, 91446, 'btc', '2025-11-30 14:50:08'),
	(1515, 91417, 'btc', '2025-11-30 14:52:08'),
	(1516, 91430, 'btc', '2025-11-30 14:54:08'),
	(1517, 91442, 'btc', '2025-11-30 14:56:09'),
	(1518, 91459, 'btc', '2025-11-30 14:58:09'),
	(1519, 91487, 'btc', '2025-11-30 15:00:09'),
	(1520, 91451, 'btc', '2025-11-30 15:02:10'),
	(1521, 91403, 'btc', '2025-11-30 15:04:10'),
	(1522, 91327, 'btc', '2025-11-30 15:06:10'),
	(1523, 91336, 'btc', '2025-11-30 15:08:10'),
	(1524, 91381, 'btc', '2025-11-30 15:10:11'),
	(1525, 91362, 'btc', '2025-11-30 15:12:11'),
	(1526, 91388, 'btc', '2025-11-30 15:14:11'),
	(1527, 91388, 'btc', '2025-11-30 15:16:12'),
	(1528, 91355, 'btc', '2025-11-30 15:18:12'),
	(1529, 91401, 'btc', '2025-11-30 15:19:15'),
	(1530, 91483, 'btc', '2025-11-30 15:21:16'),
	(1531, 91544, 'btc', '2025-11-30 15:23:16'),
	(1532, 91586, 'btc', '2025-11-30 15:25:16'),
	(1533, 91539, 'btc', '2025-11-30 15:27:16'),
	(1534, 91613, 'btc', '2025-11-30 15:29:17'),
	(1535, 91514, 'btc', '2025-11-30 15:31:17'),
	(1536, 91425, 'btc', '2025-11-30 15:33:17'),
	(1537, 91409, 'btc', '2025-11-30 15:35:18'),
	(1538, 91370, 'btc', '2025-11-30 15:37:18'),
	(1539, 91433, 'btc', '2025-11-30 15:39:18'),
	(1540, 91410, 'btc', '2025-11-30 15:41:19'),
	(1541, 91411, 'btc', '2025-11-30 15:43:19'),
	(1542, 91446, 'btc', '2025-11-30 15:45:19'),
	(1543, 91465, 'btc', '2025-11-30 15:47:19'),
	(1544, 91475, 'btc', '2025-11-30 15:49:20'),
	(1545, 91450, 'btc', '2025-11-30 15:51:20'),
	(1546, 91463, 'btc', '2025-11-30 15:53:20'),
	(1547, 91465, 'btc', '2025-11-30 15:55:21'),
	(1548, 91470, 'btc', '2025-11-30 15:57:21'),
	(1549, 91442, 'btc', '2025-11-30 15:59:21'),
	(1550, 91435, 'btc', '2025-11-30 16:01:21'),
	(1551, 91450, 'btc', '2025-11-30 16:03:22'),
	(1552, 91445, 'btc', '2025-11-30 16:05:22'),
	(1553, 91434, 'btc', '2025-11-30 16:07:22'),
	(1554, 91449, 'btc', '2025-11-30 16:09:23'),
	(1555, 91455, 'btc', '2025-11-30 16:11:23'),
	(1556, 91468, 'btc', '2025-11-30 16:13:23'),
	(1557, 91514, 'btc', '2025-11-30 16:15:24'),
	(1558, 91526, 'btc', '2025-11-30 16:17:24'),
	(1559, 91550, 'btc', '2025-11-30 16:19:24'),
	(1560, 91751, 'btc', '2025-11-30 16:21:25'),
	(1561, 91741, 'btc', '2025-11-30 16:23:25'),
	(1562, 91729, 'btc', '2025-11-30 16:25:25'),
	(1563, 91777, 'btc', '2025-11-30 16:27:26'),
	(1564, 91744, 'btc', '2025-11-30 16:29:26'),
	(1565, 91678, 'btc', '2025-11-30 16:31:26'),
	(1566, 91660, 'btc', '2025-11-30 16:33:26'),
	(1567, 91649, 'btc', '2025-11-30 16:35:27'),
	(1568, 91667, 'btc', '2025-11-30 16:37:27'),
	(1569, 91705, 'btc', '2025-11-30 16:39:27'),
	(1570, 91750, 'btc', '2025-11-30 16:41:28'),
	(1571, 91697, 'btc', '2025-11-30 16:43:28'),
	(1572, 91686, 'btc', '2025-11-30 16:45:28'),
	(1573, 91759, 'btc', '2025-11-30 16:47:29'),
	(1574, 91820, 'btc', '2025-11-30 16:49:29'),
	(1575, 91836, 'btc', '2025-11-30 16:51:29'),
	(1576, 91849, 'btc', '2025-11-30 16:53:30'),
	(1577, 91819, 'btc', '2025-11-30 16:55:30'),
	(1578, 91786, 'btc', '2025-11-30 16:57:30'),
	(1579, 91797, 'btc', '2025-11-30 16:59:31'),
	(1580, 91722, 'btc', '2025-11-30 17:01:31'),
	(1581, 91708, 'btc', '2025-11-30 17:03:31'),
	(1582, 91640, 'btc', '2025-11-30 17:05:32'),
	(1583, 91621, 'btc', '2025-11-30 17:07:32'),
	(1584, 91548, 'btc', '2025-11-30 17:09:32'),
	(1585, 91421, 'btc', '2025-11-30 17:11:33'),
	(1586, 91372, 'btc', '2025-11-30 17:13:33'),
	(1587, 91422, 'btc', '2025-11-30 17:15:33'),
	(1588, 91494, 'btc', '2025-11-30 17:17:34'),
	(1589, 91474, 'btc', '2025-11-30 17:19:34'),
	(1590, 91417, 'btc', '2025-11-30 17:21:34'),
	(1591, 91425, 'btc', '2025-11-30 17:23:35'),
	(1592, 91381, 'btc', '2025-11-30 17:25:35'),
	(1593, 91377, 'btc', '2025-11-30 17:27:38'),
	(1594, 91377, 'btc', '2025-11-30 17:29:38'),
	(1595, 91401, 'btc', '2025-11-30 17:31:38'),
	(1596, 91380, 'btc', '2025-11-30 17:33:39'),
	(1597, 91328, 'btc', '2025-11-30 17:35:39'),
	(1598, 91326, 'btc', '2025-11-30 17:37:39'),
	(1599, 91453, 'btc', '2025-11-30 17:39:40'),
	(1600, 91485, 'btc', '2025-11-30 17:41:40'),
	(1601, 91476, 'btc', '2025-11-30 17:43:40'),
	(1602, 91498, 'btc', '2025-11-30 17:45:41'),
	(1603, 91492, 'btc', '2025-11-30 17:47:41'),
	(1604, 91550, 'btc', '2025-11-30 17:49:41'),
	(1605, 91518, 'btc', '2025-11-30 17:51:41'),
	(1606, 91485, 'btc', '2025-11-30 17:53:42'),
	(1607, 91496, 'btc', '2025-11-30 17:55:42'),
	(1608, 91498, 'btc', '2025-11-30 17:57:42'),
	(1609, 91488, 'btc', '2025-11-30 17:59:43'),
	(1610, 91450, 'btc', '2025-11-30 18:01:43'),
	(1611, 91382, 'btc', '2025-11-30 18:03:43'),
	(1612, 91300, 'btc', '2025-11-30 18:05:44'),
	(1613, 91300, 'btc', '2025-11-30 18:07:44'),
	(1614, 91314, 'btc', '2025-11-30 18:08:20'),
	(1615, 91241, 'btc', '2025-11-30 18:10:20'),
	(1616, 91273, 'btc', '2025-11-30 18:12:20'),
	(1617, 91311, 'btc', '2025-11-30 18:14:21'),
	(1618, 91314, 'btc', '2025-11-30 18:16:21'),
	(1619, 91336, 'btc', '2025-11-30 18:18:22'),
	(1620, 91359, 'btc', '2025-11-30 18:20:22'),
	(1621, 91349, 'btc', '2025-11-30 18:22:22'),
	(1622, 91336, 'btc', '2025-11-30 18:24:22'),
	(1623, 91356, 'btc', '2025-11-30 18:26:23'),
	(1624, 91374, 'btc', '2025-11-30 18:28:23'),
	(1625, 91363, 'btc', '2025-11-30 18:30:24'),
	(1626, 91338, 'btc', '2025-11-30 18:32:24'),
	(1627, 91401, 'btc', '2025-11-30 18:34:25'),
	(1628, 91389, 'btc', '2025-11-30 18:36:25'),
	(1629, 91428, 'btc', '2025-11-30 18:38:25'),
	(1630, 91379, 'btc', '2025-11-30 18:40:26'),
	(1631, 91337, 'btc', '2025-11-30 18:42:26'),
	(1632, 91390, 'btc', '2025-11-30 18:44:26'),
	(1633, 91404, 'btc', '2025-11-30 18:46:26'),
	(1634, 91392, 'btc', '2025-11-30 18:48:27'),
	(1635, 91408, 'btc', '2025-11-30 18:50:27'),
	(1636, 91430, 'btc', '2025-11-30 18:52:27'),
	(1637, 91473, 'btc', '2025-11-30 18:54:28'),
	(1638, 91477, 'btc', '2025-11-30 18:56:28'),
	(1639, 91442, 'btc', '2025-11-30 18:58:28'),
	(1640, 91444, 'btc', '2025-11-30 19:00:29'),
	(1641, 91432, 'btc', '2025-11-30 19:02:29'),
	(1642, 91476, 'btc', '2025-11-30 19:04:29'),
	(1643, 91452, 'btc', '2025-11-30 19:06:29'),
	(1644, 91428, 'btc', '2025-11-30 19:08:30'),
	(1645, 91427, 'btc', '2025-11-30 19:10:30'),
	(1646, 91452, 'btc', '2025-11-30 19:12:30'),
	(1647, 91470, 'btc', '2025-11-30 19:14:31'),
	(1648, 91484, 'btc', '2025-11-30 19:16:31'),
	(1649, 91484, 'btc', '2025-11-30 19:18:31'),
	(1650, 91402, 'btc', '2025-11-30 19:20:31'),
	(1651, 91353, 'btc', '2025-11-30 19:22:32'),
	(1652, 91382, 'btc', '2025-11-30 19:23:07'),
	(1653, 91379, 'btc', '2025-11-30 19:25:08'),
	(1654, 91322, 'btc', '2025-11-30 19:27:08'),
	(1655, 91347, 'btc', '2025-11-30 19:29:08'),
	(1656, 91335, 'btc', '2025-11-30 19:31:09'),
	(1657, 91318, 'btc', '2025-11-30 19:33:09'),
	(1658, 91328, 'btc', '2025-11-30 19:35:09'),
	(1659, 91440, 'btc', '2025-11-30 19:37:10'),
	(1660, 91477, 'btc', '2025-11-30 19:39:10'),
	(1661, 91464, 'btc', '2025-11-30 19:41:10'),
	(1662, 91467, 'btc', '2025-11-30 19:43:11'),
	(1663, 91449, 'btc', '2025-11-30 19:45:11'),
	(1664, 91463, 'btc', '2025-11-30 19:47:11'),
	(1665, 91428, 'btc', '2025-11-30 19:49:11'),
	(1666, 91427, 'btc', '2025-11-30 19:51:12'),
	(1667, 91444, 'btc', '2025-11-30 19:53:12'),
	(1668, 91441, 'btc', '2025-11-30 19:55:12'),
	(1669, 91482, 'btc', '2025-11-30 19:57:13'),
	(1670, 91456, 'btc', '2025-11-30 19:59:13'),
	(1671, 91448, 'btc', '2025-11-30 20:01:14'),
	(1672, 91420, 'btc', '2025-11-30 20:03:14'),
	(1673, 91500, 'btc', '2025-11-30 20:05:14'),
	(1674, 91546, 'btc', '2025-11-30 20:07:14'),
	(1675, 91576, 'btc', '2025-11-30 20:09:15'),
	(1676, 91622, 'btc', '2025-11-30 20:11:15'),
	(1677, 91583, 'btc', '2025-11-30 20:13:15'),
	(1678, 91550, 'btc', '2025-11-30 20:15:16'),
	(1679, 91537, 'btc', '2025-11-30 20:17:16'),
	(1680, 91494, 'btc', '2025-11-30 20:19:16'),
	(1681, 91390, 'btc', '2025-11-30 20:21:17'),
	(1682, 91390, 'btc', '2025-11-30 20:23:17'),
	(1683, 91390, 'btc', '2025-11-30 20:25:17'),
	(1684, 91339, 'btc', '2025-11-30 20:27:18'),
	(1685, 91313, 'btc', '2025-11-30 20:29:18'),
	(1686, 91322, 'btc', '2025-11-30 20:31:18'),
	(1687, 91292, 'btc', '2025-11-30 20:33:18'),
	(1688, 91214, 'btc', '2025-11-30 20:35:19'),
	(1689, 91220, 'btc', '2025-11-30 20:37:19'),
	(1690, 91231, 'btc', '2025-11-30 20:39:19'),
	(1691, 91231, 'btc', '2025-11-30 20:41:20'),
	(1692, 91246, 'btc', '2025-11-30 20:43:20'),
	(1693, 91324, 'btc', '2025-11-30 20:45:20'),
	(1694, 91332, 'btc', '2025-11-30 20:47:21'),
	(1695, 91320, 'btc', '2025-11-30 20:49:21'),
	(1696, 91292, 'btc', '2025-11-30 20:51:21'),
	(1697, 91321, 'btc', '2025-11-30 20:53:22'),
	(1698, 91319, 'btc', '2025-11-30 20:55:22'),
	(1699, 91339, 'btc', '2025-11-30 20:57:23'),
	(1700, 91341, 'btc', '2025-11-30 20:59:23'),
	(1701, 91332, 'btc', '2025-11-30 21:01:23'),
	(1702, 91302, 'btc', '2025-11-30 21:03:24'),
	(1703, 91289, 'btc', '2025-11-30 21:05:24'),
	(1704, 91314, 'btc', '2025-11-30 21:07:24'),
	(1705, 91265, 'btc', '2025-11-30 21:09:25'),
	(1706, 91187, 'btc', '2025-11-30 21:11:25'),
	(1707, 91172, 'btc', '2025-11-30 21:13:25'),
	(1708, 91123, 'btc', '2025-11-30 21:18:11'),
	(1709, 91079, 'btc', '2025-11-30 21:20:11'),
	(1710, 91049, 'btc', '2025-11-30 21:22:11'),
	(1711, 90947, 'btc', '2025-11-30 21:24:11'),
	(1712, 90976, 'btc', '2025-11-30 21:26:12'),
	(1713, 90997, 'btc', '2025-11-30 21:28:12'),
	(1714, 91044, 'btc', '2025-11-30 21:30:12'),
	(1715, 91062, 'btc', '2025-11-30 21:32:13'),
	(1716, 91168, 'btc', '2025-11-30 21:34:13'),
	(1717, 91169, 'btc', '2025-11-30 21:36:13'),
	(1718, 91142, 'btc', '2025-11-30 21:38:14'),
	(1719, 91110, 'btc', '2025-11-30 21:40:14'),
	(1720, 91053, 'btc', '2025-11-30 21:42:14'),
	(1721, 91055, 'btc', '2025-11-30 21:44:15'),
	(1722, 91083, 'btc', '2025-11-30 21:46:15'),
	(1723, 91108, 'btc', '2025-11-30 21:48:15'),
	(1724, 91109, 'btc', '2025-11-30 21:50:16'),
	(1725, 91137, 'btc', '2025-11-30 21:52:16'),
	(1726, 91135, 'btc', '2025-11-30 21:54:16'),
	(1727, 91173, 'btc', '2025-11-30 21:56:16'),
	(1728, 91180, 'btc', '2025-11-30 21:58:17'),
	(1729, 91194, 'btc', '2025-11-30 22:00:17'),
	(1730, 91227, 'btc', '2025-11-30 22:02:17'),
	(1731, 91239, 'btc', '2025-11-30 22:04:18'),
	(1732, 91288, 'btc', '2025-11-30 22:06:18'),
	(1733, 91269, 'btc', '2025-11-30 22:08:18'),
	(1734, 91292, 'btc', '2025-11-30 22:09:08'),
	(1735, 91294, 'btc', '2025-11-30 22:11:08'),
	(1736, 91301, 'btc', '2025-11-30 22:13:08'),
	(1737, 91254, 'btc', '2025-11-30 22:15:08'),
	(1738, 91341, 'btc', '2025-11-30 22:17:09'),
	(1739, 91326, 'btc', '2025-11-30 22:19:09'),
	(1740, 91259, 'btc', '2025-11-30 22:21:09'),
	(1741, 91214, 'btc', '2025-11-30 22:23:09'),
	(1742, 91230, 'btc', '2025-11-30 22:25:10'),
	(1743, 91284, 'btc', '2025-11-30 22:27:10'),
	(1744, 91250, 'btc', '2025-11-30 22:29:10'),
	(1745, 91209, 'btc', '2025-11-30 22:31:11'),
	(1746, 91128, 'btc', '2025-11-30 22:33:11'),
	(1747, 91100, 'btc', '2025-11-30 22:35:03'),
	(1748, 91173, 'btc', '2025-11-30 22:37:03'),
	(1749, 91055, 'btc', '2025-11-30 22:39:04'),
	(1750, 91089, 'btc', '2025-11-30 22:40:26'),
	(1751, 91173, 'btc', '2025-11-30 22:42:27'),
	(1752, 91149, 'btc', '2025-11-30 22:44:27'),
	(1753, 91104, 'btc', '2025-11-30 22:46:27'),
	(1754, 91140, 'btc', '2025-11-30 22:48:27'),
	(1755, 91139, 'btc', '2025-11-30 22:50:28'),
	(1756, 91176, 'btc', '2025-11-30 22:52:28'),
	(1757, 91155, 'btc', '2025-11-30 22:54:28'),
	(1758, 91211, 'btc', '2025-11-30 22:56:29'),
	(1759, 91220, 'btc', '2025-11-30 22:58:29'),
	(1760, 91180, 'btc', '2025-11-30 23:00:29'),
	(1761, 91222, 'btc', '2025-11-30 23:02:29'),
	(1762, 91058, 'btc', '2025-11-30 23:04:30'),
	(1763, 90993, 'btc', '2025-11-30 23:06:30'),
	(1764, 90924, 'btc', '2025-11-30 23:08:30'),
	(1765, 90923, 'btc', '2025-11-30 23:10:31'),
	(1766, 90937, 'btc', '2025-11-30 23:12:31'),
	(1767, 90986, 'btc', '2025-11-30 23:14:31'),
	(1768, 90914, 'btc', '2025-11-30 23:16:32'),
	(1769, 90932, 'btc', '2025-11-30 23:18:32'),
	(1770, 90896, 'btc', '2025-11-30 23:20:32'),
	(1771, 90925, 'btc', '2025-11-30 23:22:32'),
	(1772, 90860, 'btc', '2025-11-30 23:24:33'),
	(1773, 90728, 'btc', '2025-11-30 23:26:33'),
	(1774, 90679, 'btc', '2025-11-30 23:28:33'),
	(1775, 90637, 'btc', '2025-11-30 23:30:34'),
	(1776, 90686, 'btc', '2025-11-30 23:32:34'),
	(1777, 90631, 'btc', '2025-11-30 23:34:34'),
	(1778, 90643, 'btc', '2025-11-30 23:36:35'),
	(1779, 90563, 'btc', '2025-11-30 23:38:35'),
	(1780, 90536, 'btc', '2025-11-30 23:40:35'),
	(1781, 90555, 'btc', '2025-11-30 23:42:35'),
	(1782, 90604, 'btc', '2025-11-30 23:44:36'),
	(1783, 90678, 'btc', '2025-11-30 23:46:36'),
	(1784, 90688, 'btc', '2025-11-30 23:48:36'),
	(1785, 90595, 'btc', '2025-11-30 23:50:37'),
	(1786, 90530, 'btc', '2025-11-30 23:52:37'),
	(1787, 90396, 'btc', '2025-11-30 23:54:37'),
	(1788, 90449, 'btc', '2025-11-30 23:56:37'),
	(1789, 90346, 'btc', '2025-11-30 23:58:38'),
	(1790, 90354, 'btc', '2025-12-01 00:00:38'),
	(1791, 90326, 'btc', '2025-12-01 00:02:38'),
	(1792, 89888, 'btc', '2025-12-01 00:04:39'),
	(1793, 89602, 'btc', '2025-12-01 00:06:39'),
	(1794, 89264, 'btc', '2025-12-01 00:08:39'),
	(1795, 88952, 'btc', '2025-12-01 00:10:40'),
	(1796, 89042, 'btc', '2025-12-01 00:12:40'),
	(1797, 88943, 'btc', '2025-12-01 00:14:40'),
	(1798, 88934, 'btc', '2025-12-01 00:16:40'),
	(1799, 88820, 'btc', '2025-12-01 00:18:41'),
	(1800, 88826, 'btc', '2025-12-01 00:20:41'),
	(1801, 88560, 'btc', '2025-12-01 00:22:41'),
	(1802, 88477, 'btc', '2025-12-01 00:24:42'),
	(1803, 88539, 'btc', '2025-12-01 00:26:42'),
	(1804, 88400, 'btc', '2025-12-01 00:28:42'),
	(1805, 88243, 'btc', '2025-12-01 00:30:42'),
	(1806, 88093, 'btc', '2025-12-01 00:32:43'),
	(1807, 87853, 'btc', '2025-12-01 00:34:43'),
	(1808, 87981, 'btc', '2025-12-01 00:36:43'),
	(1809, 87788, 'btc', '2025-12-01 00:38:44'),
	(1810, 87802, 'btc', '2025-12-01 00:40:44'),
	(1811, 87988, 'btc', '2025-12-01 00:42:44'),
	(1812, 87736, 'btc', '2025-12-01 00:44:44'),
	(1813, 87601, 'btc', '2025-12-01 00:46:45'),
	(1814, 87455, 'btc', '2025-12-01 00:48:45'),
	(1815, 87443, 'btc', '2025-12-01 00:50:45'),
	(1816, 87480, 'btc', '2025-12-01 00:52:46'),
	(1817, 87152, 'btc', '2025-12-01 00:54:46'),
	(1818, 87009, 'btc', '2025-12-01 00:56:46'),
	(1819, 87125, 'btc', '2025-12-01 00:58:46'),
	(1820, 87008, 'btc', '2025-12-01 01:00:47'),
	(1821, 87374, 'btc', '2025-12-01 01:02:47'),
	(1822, 87436, 'btc', '2025-12-01 01:04:47'),
	(1823, 87333, 'btc', '2025-12-01 01:06:48'),
	(1824, 87577, 'btc', '2025-12-01 01:08:48'),
	(1825, 87299, 'btc', '2025-12-01 01:10:48'),
	(1826, 87432, 'btc', '2025-12-01 01:12:48'),
	(1827, 87405, 'btc', '2025-12-01 01:14:49'),
	(1828, 87654, 'btc', '2025-12-01 01:16:49'),
	(1829, 87720, 'btc', '2025-12-01 01:18:49'),
	(1830, 87423, 'btc', '2025-12-01 01:20:50'),
	(1831, 87520, 'btc', '2025-12-01 01:22:50'),
	(1832, 87391, 'btc', '2025-12-01 01:24:50'),
	(1833, 87294, 'btc', '2025-12-01 01:26:50'),
	(1834, 87320, 'btc', '2025-12-01 01:28:51'),
	(1835, 87196, 'btc', '2025-12-01 01:30:51'),
	(1836, 87345, 'btc', '2025-12-01 01:32:52'),
	(1837, 87343, 'btc', '2025-12-01 01:34:52'),
	(1838, 87540, 'btc', '2025-12-01 01:36:52'),
	(1839, 87476, 'btc', '2025-12-01 01:38:53'),
	(1840, 87380, 'btc', '2025-12-01 01:40:53'),
	(1841, 87519, 'btc', '2025-12-01 01:42:53'),
	(1842, 87421, 'btc', '2025-12-01 01:44:54'),
	(1843, 87350, 'btc', '2025-12-01 01:46:54'),
	(1844, 87420, 'btc', '2025-12-01 01:48:54'),
	(1845, 87332, 'btc', '2025-12-01 01:50:54'),
	(1846, 87250, 'btc', '2025-12-01 01:52:55'),
	(1847, 87227, 'btc', '2025-12-01 01:54:55'),
	(1848, 87313, 'btc', '2025-12-01 01:56:55'),
	(1849, 87265, 'btc', '2025-12-01 01:58:56'),
	(1850, 87185, 'btc', '2025-12-01 02:00:56'),
	(1851, 87115, 'btc', '2025-12-01 02:02:56'),
	(1852, 87354, 'btc', '2025-12-01 02:04:57'),
	(1853, 87272, 'btc', '2025-12-01 02:06:57'),
	(1854, 87256, 'btc', '2025-12-01 02:08:57'),
	(1855, 87252, 'btc', '2025-12-01 02:10:58'),
	(1856, 87483, 'btc', '2025-12-01 02:12:58'),
	(1857, 87402, 'btc', '2025-12-01 02:14:58'),
	(1858, 87299, 'btc', '2025-12-01 02:16:58'),
	(1859, 87274, 'btc', '2025-12-01 02:18:59'),
	(1860, 87201, 'btc', '2025-12-01 02:20:59'),
	(1861, 87226, 'btc', '2025-12-01 02:22:59'),
	(1862, 87131, 'btc', '2025-12-01 02:25:00'),
	(1863, 87117, 'btc', '2025-12-01 02:27:00'),
	(1864, 87161, 'btc', '2025-12-01 02:29:00'),
	(1865, 87068, 'btc', '2025-12-01 02:31:00'),
	(1866, 87075, 'btc', '2025-12-01 02:33:01'),
	(1867, 87106, 'btc', '2025-12-01 02:35:01'),
	(1868, 86963, 'btc', '2025-12-01 02:37:01'),
	(1869, 86652, 'btc', '2025-12-01 02:39:02'),
	(1870, 86910, 'btc', '2025-12-01 02:41:02'),
	(1871, 86934, 'btc', '2025-12-01 02:43:02'),
	(1872, 86820, 'btc', '2025-12-01 02:45:02'),
	(1873, 86657, 'btc', '2025-12-01 02:47:03'),
	(1874, 86570, 'btc', '2025-12-01 02:49:03'),
	(1875, 86600, 'btc', '2025-12-01 02:51:03'),
	(1876, 86531, 'btc', '2025-12-01 02:53:04'),
	(1877, 86762, 'btc', '2025-12-01 02:55:04'),
	(1878, 86736, 'btc', '2025-12-01 02:57:04'),
	(1879, 86776, 'btc', '2025-12-01 02:59:04'),
	(1880, 86787, 'btc', '2025-12-01 03:01:05'),
	(1881, 86696, 'btc', '2025-12-01 03:03:05'),
	(1882, 86766, 'btc', '2025-12-01 03:05:05'),
	(1883, 86611, 'btc', '2025-12-01 03:07:06'),
	(1884, 86495, 'btc', '2025-12-01 03:09:06'),
	(1885, 86452, 'btc', '2025-12-01 03:11:06'),
	(1886, 86457, 'btc', '2025-12-01 03:13:06'),
	(1887, 86409, 'btc', '2025-12-01 03:15:07'),
	(1888, 86384, 'btc', '2025-12-01 03:17:07'),
	(1889, 86513, 'btc', '2025-12-01 03:19:07'),
	(1890, 86459, 'btc', '2025-12-01 03:21:08'),
	(1891, 86481, 'btc', '2025-12-01 03:23:08'),
	(1892, 86515, 'btc', '2025-12-01 03:25:08'),
	(1893, 86468, 'btc', '2025-12-01 03:27:08'),
	(1894, 86436, 'btc', '2025-12-01 03:29:09'),
	(1895, 86335, 'btc', '2025-12-01 03:31:09'),
	(1896, 86302, 'btc', '2025-12-01 03:33:09'),
	(1897, 86238, 'btc', '2025-12-01 03:35:10'),
	(1898, 86317, 'btc', '2025-12-01 03:37:10'),
	(1899, 86216, 'btc', '2025-12-01 03:39:10'),
	(1900, 86320, 'btc', '2025-12-01 03:41:10'),
	(1901, 86421, 'btc', '2025-12-01 03:43:11'),
	(1902, 86450, 'btc', '2025-12-01 03:45:11'),
	(1903, 86378, 'btc', '2025-12-01 03:47:11'),
	(1904, 86300, 'btc', '2025-12-01 03:49:12'),
	(1905, 86298, 'btc', '2025-12-01 03:51:12'),
	(1906, 86330, 'btc', '2025-12-01 03:53:13'),
	(1907, 86292, 'btc', '2025-12-01 03:55:13'),
	(1908, 86354, 'btc', '2025-12-01 03:57:13'),
	(1909, 86393, 'btc', '2025-12-01 03:59:13'),
	(1910, 86233, 'btc', '2025-12-01 04:01:14'),
	(1911, 86258, 'btc', '2025-12-01 04:03:14'),
	(1912, 86239, 'btc', '2025-12-01 04:05:14'),
	(1913, 86260, 'btc', '2025-12-01 04:07:15'),
	(1914, 86279, 'btc', '2025-12-01 04:09:15'),
	(1915, 86265, 'btc', '2025-12-01 04:11:15'),
	(1916, 86109, 'btc', '2025-12-01 04:13:16'),
	(1917, 86044, 'btc', '2025-12-01 04:15:16'),
	(1918, 86002, 'btc', '2025-12-01 04:17:16'),
	(1919, 86000, 'btc', '2025-12-01 04:19:16'),
	(1920, 85957, 'btc', '2025-12-01 04:21:17'),
	(1921, 85850, 'btc', '2025-12-01 04:23:17'),
	(1922, 85786, 'btc', '2025-12-01 04:25:17'),
	(1923, 85770, 'btc', '2025-12-01 04:27:18'),
	(1924, 85709, 'btc', '2025-12-01 04:29:18'),
	(1925, 85793, 'btc', '2025-12-01 04:31:18'),
	(1926, 85799, 'btc', '2025-12-01 04:33:19'),
	(1927, 85879, 'btc', '2025-12-01 04:35:19'),
	(1928, 85831, 'btc', '2025-12-01 04:37:19'),
	(1929, 85922, 'btc', '2025-12-01 04:39:19'),
	(1930, 85926, 'btc', '2025-12-01 04:41:20'),
	(1931, 85980, 'btc', '2025-12-01 04:43:20'),
	(1932, 85892, 'btc', '2025-12-01 04:45:20'),
	(1933, 85887, 'btc', '2025-12-01 04:47:21'),
	(1934, 85885, 'btc', '2025-12-01 04:49:21'),
	(1935, 85854, 'btc', '2025-12-01 04:51:21'),
	(1936, 85857, 'btc', '2025-12-01 04:53:21'),
	(1937, 85790, 'btc', '2025-12-01 04:55:22'),
	(1938, 85867, 'btc', '2025-12-01 04:57:22'),
	(1939, 85803, 'btc', '2025-12-01 04:59:22'),
	(1940, 85845, 'btc', '2025-12-01 05:01:23'),
	(1941, 85865, 'btc', '2025-12-01 05:03:23'),
	(1942, 85775, 'btc', '2025-12-01 05:05:23'),
	(1943, 85736, 'btc', '2025-12-01 05:07:23'),
	(1944, 85668, 'btc', '2025-12-01 05:09:24'),
	(1945, 85910, 'btc', '2025-12-01 05:11:24'),
	(1946, 85839, 'btc', '2025-12-01 05:13:24'),
	(1947, 85791, 'btc', '2025-12-01 05:15:25'),
	(1948, 85787, 'btc', '2025-12-01 05:17:25'),
	(1949, 85711, 'btc', '2025-12-01 05:19:25'),
	(1950, 85762, 'btc', '2025-12-01 05:21:25'),
	(1951, 85804, 'btc', '2025-12-01 05:23:26'),
	(1952, 85861, 'btc', '2025-12-01 05:25:26'),
	(1953, 85907, 'btc', '2025-12-01 05:27:26'),
	(1954, 85980, 'btc', '2025-12-01 05:29:27'),
	(1955, 85859, 'btc', '2025-12-01 05:31:27'),
	(1956, 85904, 'btc', '2025-12-01 05:33:27'),
	(1957, 85808, 'btc', '2025-12-01 05:35:27'),
	(1958, 85784, 'btc', '2025-12-01 05:37:28'),
	(1959, 85700, 'btc', '2025-12-01 05:39:28'),
	(1960, 85754, 'btc', '2025-12-01 05:41:28'),
	(1961, 85790, 'btc', '2025-12-01 05:43:29'),
	(1962, 85826, 'btc', '2025-12-01 05:45:29'),
	(1963, 85873, 'btc', '2025-12-01 05:47:29'),
	(1964, 85974, 'btc', '2025-12-01 05:49:29'),
	(1965, 85949, 'btc', '2025-12-01 05:51:30'),
	(1966, 85980, 'btc', '2025-12-01 05:53:30'),
	(1967, 85963, 'btc', '2025-12-01 05:55:30'),
	(1968, 85948, 'btc', '2025-12-01 05:57:31'),
	(1969, 86000, 'btc', '2025-12-01 05:59:31'),
	(1970, 86148, 'btc', '2025-12-01 06:01:31'),
	(1971, 86169, 'btc', '2025-12-01 06:03:32'),
	(1972, 86025, 'btc', '2025-12-01 06:05:32'),
	(1973, 86115, 'btc', '2025-12-01 06:07:32'),
	(1974, 86125, 'btc', '2025-12-01 06:09:32'),
	(1975, 86191, 'btc', '2025-12-01 06:11:33'),
	(1976, 86227, 'btc', '2025-12-01 06:13:33'),
	(1977, 86250, 'btc', '2025-12-01 06:15:33'),
	(1978, 86168, 'btc', '2025-12-01 06:17:33'),
	(1979, 86111, 'btc', '2025-12-01 06:19:34'),
	(1980, 86053, 'btc', '2025-12-01 06:21:34'),
	(1981, 86086, 'btc', '2025-12-01 06:23:34'),
	(1982, 86067, 'btc', '2025-12-01 06:25:35'),
	(1983, 86040, 'btc', '2025-12-01 06:27:35'),
	(1984, 86052, 'btc', '2025-12-01 06:29:35'),
	(1985, 86041, 'btc', '2025-12-01 06:31:36'),
	(1986, 86080, 'btc', '2025-12-01 06:33:36'),
	(1987, 86089, 'btc', '2025-12-01 06:35:36'),
	(1988, 86134, 'btc', '2025-12-01 06:37:36'),
	(1989, 86265, 'btc', '2025-12-01 06:39:37'),
	(1990, 86185, 'btc', '2025-12-01 06:41:37'),
	(1991, 86200, 'btc', '2025-12-01 06:43:37'),
	(1992, 86288, 'btc', '2025-12-01 06:45:38'),
	(1993, 86300, 'btc', '2025-12-01 06:47:38'),
	(1994, 86280, 'btc', '2025-12-01 06:49:38'),
	(1995, 86164, 'btc', '2025-12-01 06:51:38'),
	(1996, 86218, 'btc', '2025-12-01 06:53:39'),
	(1997, 86207, 'btc', '2025-12-01 06:55:39'),
	(1998, 86323, 'btc', '2025-12-01 06:57:39'),
	(1999, 86265, 'btc', '2025-12-01 06:59:40'),
	(2000, 86191, 'btc', '2025-12-01 07:01:40'),
	(2001, 86232, 'btc', '2025-12-01 07:03:40'),
	(2002, 86154, 'btc', '2025-12-01 07:05:41'),
	(2003, 86114, 'btc', '2025-12-01 07:07:41'),
	(2004, 86098, 'btc', '2025-12-01 07:09:41'),
	(2005, 86130, 'btc', '2025-12-01 07:11:41'),
	(2006, 86121, 'btc', '2025-12-01 07:13:42'),
	(2007, 86136, 'btc', '2025-12-01 07:15:42'),
	(2008, 86190, 'btc', '2025-12-01 07:17:42'),
	(2009, 86144, 'btc', '2025-12-01 07:19:43'),
	(2010, 86110, 'btc', '2025-12-01 07:21:43'),
	(2011, 86093, 'btc', '2025-12-01 07:23:43'),
	(2012, 86228, 'btc', '2025-12-01 07:25:43'),
	(2013, 86291, 'btc', '2025-12-01 07:27:44'),
	(2014, 86279, 'btc', '2025-12-01 07:29:44'),
	(2015, 86183, 'btc', '2025-12-01 07:31:44'),
	(2016, 86281, 'btc', '2025-12-01 07:33:45'),
	(2017, 86322, 'btc', '2025-12-01 07:35:45'),
	(2018, 86331, 'btc', '2025-12-01 07:37:45'),
	(2019, 86414, 'btc', '2025-12-01 07:39:46'),
	(2020, 86442, 'btc', '2025-12-01 07:41:46'),
	(2021, 86475, 'btc', '2025-12-01 07:43:46'),
	(2022, 86500, 'btc', '2025-12-01 07:45:47'),
	(2023, 86505, 'btc', '2025-12-01 07:47:47'),
	(2024, 86521, 'btc', '2025-12-01 07:49:47'),
	(2025, 86511, 'btc', '2025-12-01 07:51:47'),
	(2026, 86550, 'btc', '2025-12-01 07:53:48'),
	(2027, 86540, 'btc', '2025-12-01 07:55:48'),
	(2028, 86508, 'btc', '2025-12-01 07:57:48'),
	(2029, 86559, 'btc', '2025-12-01 07:59:49'),
	(2030, 86500, 'btc', '2025-12-01 08:01:49'),
	(2031, 86450, 'btc', '2025-12-01 08:03:49'),
	(2032, 86396, 'btc', '2025-12-01 08:05:49'),
	(2033, 86650, 'btc', '2025-12-01 08:07:50'),
	(2034, 86604, 'btc', '2025-12-01 08:09:50'),
	(2035, 86450, 'btc', '2025-12-01 08:11:50'),
	(2036, 86479, 'btc', '2025-12-01 08:13:51'),
	(2037, 86521, 'btc', '2025-12-01 08:15:51'),
	(2038, 86582, 'btc', '2025-12-01 08:17:51'),
	(2039, 86560, 'btc', '2025-12-01 08:19:51'),
	(2040, 86565, 'btc', '2025-12-01 08:21:52'),
	(2041, 86514, 'btc', '2025-12-01 08:23:52'),
	(2042, 86511, 'btc', '2025-12-01 08:25:52'),
	(2043, 86568, 'btc', '2025-12-01 08:27:53'),
	(2044, 86639, 'btc', '2025-12-01 08:29:53'),
	(2045, 86571, 'btc', '2025-12-01 08:31:53'),
	(2046, 86500, 'btc', '2025-12-01 08:33:53'),
	(2047, 86649, 'btc', '2025-12-01 08:35:54'),
	(2048, 86642, 'btc', '2025-12-01 08:37:54'),
	(2049, 86695, 'btc', '2025-12-01 08:39:54'),
	(2050, 86734, 'btc', '2025-12-01 08:41:55'),
	(2051, 86767, 'btc', '2025-12-01 08:43:55'),
	(2052, 86778, 'btc', '2025-12-01 08:45:55'),
	(2053, 86770, 'btc', '2025-12-01 08:47:56'),
	(2054, 86807, 'btc', '2025-12-01 08:49:56'),
	(2055, 86830, 'btc', '2025-12-01 08:51:56'),
	(2056, 86850, 'btc', '2025-12-01 08:53:57'),
	(2057, 86850, 'btc', '2025-12-01 08:55:57'),
	(2058, 86825, 'btc', '2025-12-01 08:57:57'),
	(2059, 86881, 'btc', '2025-12-01 08:59:57'),
	(2060, 86909, 'btc', '2025-12-01 09:01:58'),
	(2061, 86911, 'btc', '2025-12-01 09:03:58'),
	(2062, 86871, 'btc', '2025-12-01 09:05:58'),
	(2063, 86806, 'btc', '2025-12-01 09:07:59'),
	(2064, 86750, 'btc', '2025-12-01 09:09:59'),
	(2065, 86664, 'btc', '2025-12-01 09:11:59'),
	(2066, 86610, 'btc', '2025-12-01 09:13:59'),
	(2067, 86677, 'btc', '2025-12-01 09:16:00'),
	(2068, 86696, 'btc', '2025-12-01 09:18:00'),
	(2069, 86720, 'btc', '2025-12-01 09:20:00'),
	(2070, 86749, 'btc', '2025-12-01 09:22:01'),
	(2071, 86765, 'btc', '2025-12-01 09:24:01'),
	(2072, 86652, 'btc', '2025-12-01 09:26:01'),
	(2073, 86596, 'btc', '2025-12-01 09:28:02'),
	(2074, 86615, 'btc', '2025-12-01 09:30:02'),
	(2075, 86596, 'btc', '2025-12-01 09:32:02'),
	(2076, 86666, 'btc', '2025-12-01 09:34:03'),
	(2077, 86671, 'btc', '2025-12-01 09:36:03'),
	(2078, 86727, 'btc', '2025-12-01 09:38:03'),
	(2079, 86686, 'btc', '2025-12-01 09:40:03'),
	(2080, 86763, 'btc', '2025-12-01 09:42:04'),
	(2081, 86810, 'btc', '2025-12-01 09:44:04'),
	(2082, 86874, 'btc', '2025-12-01 09:46:04'),
	(2083, 86778, 'btc', '2025-12-01 09:48:05'),
	(2084, 86709, 'btc', '2025-12-01 09:50:05'),
	(2085, 86801, 'btc', '2025-12-01 09:52:05'),
	(2086, 86703, 'btc', '2025-12-01 09:54:05'),
	(2087, 86689, 'btc', '2025-12-01 09:56:06'),
	(2088, 86736, 'btc', '2025-12-01 09:58:06'),
	(2089, 86715, 'btc', '2025-12-01 10:00:06'),
	(2090, 86756, 'btc', '2025-12-01 10:02:07'),
	(2091, 86744, 'btc', '2025-12-01 10:04:07'),
	(2092, 86800, 'btc', '2025-12-01 10:06:08'),
	(2093, 86802, 'btc', '2025-12-01 10:08:08'),
	(2094, 86764, 'btc', '2025-12-01 10:10:08'),
	(2095, 86754, 'btc', '2025-12-01 10:12:08'),
	(2096, 86746, 'btc', '2025-12-01 10:14:09'),
	(2097, 86645, 'btc', '2025-12-01 10:16:09'),
	(2098, 86632, 'btc', '2025-12-01 10:18:09'),
	(2099, 86640, 'btc', '2025-12-01 10:20:10'),
	(2100, 86619, 'btc', '2025-12-01 10:22:10'),
	(2101, 86638, 'btc', '2025-12-01 10:24:10'),
	(2102, 86630, 'btc', '2025-12-01 10:26:11'),
	(2103, 86552, 'btc', '2025-12-01 10:28:11'),
	(2104, 86596, 'btc', '2025-12-01 10:30:11'),
	(2105, 86654, 'btc', '2025-12-01 10:32:11'),
	(2106, 86555, 'btc', '2025-12-01 10:34:12'),
	(2107, 86626, 'btc', '2025-12-01 10:36:12'),
	(2108, 86631, 'btc', '2025-12-01 10:38:12'),
	(2109, 86615, 'btc', '2025-12-01 10:40:13'),
	(2110, 86625, 'btc', '2025-12-01 10:42:13'),
	(2111, 86617, 'btc', '2025-12-01 10:44:13'),
	(2112, 86653, 'btc', '2025-12-01 10:46:13'),
	(2113, 86700, 'btc', '2025-12-01 10:48:14'),
	(2114, 86661, 'btc', '2025-12-01 10:50:14'),
	(2115, 86635, 'btc', '2025-12-01 10:52:14'),
	(2116, 86648, 'btc', '2025-12-01 10:54:15'),
	(2117, 86634, 'btc', '2025-12-01 10:56:15'),
	(2118, 86658, 'btc', '2025-12-01 10:58:15'),
	(2119, 86648, 'btc', '2025-12-01 11:00:15'),
	(2120, 86695, 'btc', '2025-12-01 11:02:16'),
	(2121, 86625, 'btc', '2025-12-01 11:04:16'),
	(2122, 86486, 'btc', '2025-12-01 11:06:16'),
	(2123, 86535, 'btc', '2025-12-01 11:08:17'),
	(2124, 86520, 'btc', '2025-12-01 11:10:17'),
	(2125, 86486, 'btc', '2025-12-01 11:12:17'),
	(2126, 86495, 'btc', '2025-12-01 11:14:18'),
	(2127, 86531, 'btc', '2025-12-01 11:16:18'),
	(2128, 86467, 'btc', '2025-12-01 11:18:19'),
	(2129, 86473, 'btc', '2025-12-01 11:20:19'),
	(2130, 86448, 'btc', '2025-12-01 11:22:19'),
	(2131, 86478, 'btc', '2025-12-01 11:24:19'),
	(2132, 86432, 'btc', '2025-12-01 11:26:20'),
	(2133, 86434, 'btc', '2025-12-01 11:28:20'),
	(2134, 86451, 'btc', '2025-12-01 11:30:20'),
	(2135, 86404, 'btc', '2025-12-01 11:32:20'),
	(2136, 86379, 'btc', '2025-12-01 11:34:21'),
	(2137, 86412, 'btc', '2025-12-01 11:36:21'),
	(2138, 86382, 'btc', '2025-12-01 11:38:22'),
	(2139, 86399, 'btc', '2025-12-01 11:40:22'),
	(2140, 86339, 'btc', '2025-12-01 11:42:22'),
	(2141, 86313, 'btc', '2025-12-01 11:44:22'),
	(2142, 86312, 'btc', '2025-12-01 11:46:23'),
	(2143, 86317, 'btc', '2025-12-01 11:48:23'),
	(2144, 86314, 'btc', '2025-12-01 11:50:23'),
	(2145, 86344, 'btc', '2025-12-01 11:52:24'),
	(2146, 86302, 'btc', '2025-12-01 11:54:24'),
	(2147, 86269, 'btc', '2025-12-01 11:56:24'),
	(2148, 86279, 'btc', '2025-12-01 11:58:25'),
	(2149, 86155, 'btc', '2025-12-01 12:00:25'),
	(2150, 86170, 'btc', '2025-12-01 12:02:25'),
	(2151, 86192, 'btc', '2025-12-01 12:04:26'),
	(2152, 85980, 'btc', '2025-12-01 12:06:26'),
	(2153, 86020, 'btc', '2025-12-01 12:08:26'),
	(2154, 86011, 'btc', '2025-12-01 12:10:27'),
	(2155, 85857, 'btc', '2025-12-01 12:12:27'),
	(2156, 85888, 'btc', '2025-12-01 12:14:27'),
	(2157, 85884, 'btc', '2025-12-01 12:16:27'),
	(2158, 85874, 'btc', '2025-12-01 12:18:28'),
	(2159, 85874, 'btc', '2025-12-01 12:20:28'),
	(2160, 85956, 'btc', '2025-12-01 12:22:28'),
	(2161, 85997, 'btc', '2025-12-01 12:24:29'),
	(2162, 85951, 'btc', '2025-12-01 12:26:29'),
	(2163, 85819, 'btc', '2025-12-01 12:28:29'),
	(2164, 85839, 'btc', '2025-12-01 12:30:29'),
	(2165, 85772, 'btc', '2025-12-01 12:32:30'),
	(2166, 85710, 'btc', '2025-12-01 12:34:30'),
	(2167, 85847, 'btc', '2025-12-01 12:36:30'),
	(2168, 85817, 'btc', '2025-12-01 12:38:31'),
	(2169, 85691, 'btc', '2025-12-01 12:40:31'),
	(2170, 85630, 'btc', '2025-12-01 12:42:31'),
	(2171, 85491, 'btc', '2025-12-01 12:44:32'),
	(2172, 85365, 'btc', '2025-12-01 12:46:32'),
	(2173, 85025, 'btc', '2025-12-01 12:48:32'),
	(2174, 85134, 'btc', '2025-12-01 12:50:32'),
	(2175, 85405, 'btc', '2025-12-01 12:52:33'),
	(2176, 85385, 'btc', '2025-12-01 12:54:33'),
	(2177, 85337, 'btc', '2025-12-01 12:56:33'),
	(2178, 85520, 'btc', '2025-12-01 12:58:34'),
	(2179, 85420, 'btc', '2025-12-01 13:00:34'),
	(2180, 85827, 'btc', '2025-12-01 13:02:34'),
	(2181, 86050, 'btc', '2025-12-01 13:04:35'),
	(2182, 85851, 'btc', '2025-12-01 13:06:35'),
	(2183, 86015, 'btc', '2025-12-01 13:08:35'),
	(2184, 85936, 'btc', '2025-12-01 13:10:35'),
	(2185, 85998, 'btc', '2025-12-01 13:12:36'),
	(2186, 86036, 'btc', '2025-12-01 13:14:36'),
	(2187, 86059, 'btc', '2025-12-01 13:16:36'),
	(2188, 86029, 'btc', '2025-12-01 13:18:37'),
	(2189, 86034, 'btc', '2025-12-01 13:20:37'),
	(2190, 85971, 'btc', '2025-12-01 13:22:37'),
	(2191, 85983, 'btc', '2025-12-01 13:24:38'),
	(2192, 86000, 'btc', '2025-12-01 13:26:38'),
	(2193, 85995, 'btc', '2025-12-01 13:28:38'),
	(2194, 85986, 'btc', '2025-12-01 13:30:39'),
	(2195, 85840, 'btc', '2025-12-01 13:32:39'),
	(2196, 85832, 'btc', '2025-12-01 13:34:39'),
	(2197, 85931, 'btc', '2025-12-01 13:36:39'),
	(2198, 85831, 'btc', '2025-12-01 13:38:40'),
	(2199, 85694, 'btc', '2025-12-01 13:40:40'),
	(2200, 85758, 'btc', '2025-12-01 13:42:40'),
	(2201, 85795, 'btc', '2025-12-01 13:44:41'),
	(2202, 85823, 'btc', '2025-12-01 13:46:41'),
	(2203, 85747, 'btc', '2025-12-01 13:48:41'),
	(2204, 85752, 'btc', '2025-12-01 13:50:42'),
	(2205, 85957, 'btc', '2025-12-01 13:52:42'),
	(2206, 86020, 'btc', '2025-12-01 13:54:42'),
	(2207, 85949, 'btc', '2025-12-01 13:56:42'),
	(2208, 86039, 'btc', '2025-12-01 13:58:43'),
	(2209, 86030, 'btc', '2025-12-01 14:00:43'),
	(2210, 86066, 'btc', '2025-12-01 14:02:43'),
	(2211, 86306, 'btc', '2025-12-01 14:04:44'),
	(2212, 86101, 'btc', '2025-12-01 14:06:44'),
	(2213, 86058, 'btc', '2025-12-01 14:08:44'),
	(2214, 86227, 'btc', '2025-12-01 14:10:44'),
	(2215, 86299, 'btc', '2025-12-01 14:12:45'),
	(2216, 86214, 'btc', '2025-12-01 14:14:45'),
	(2217, 86082, 'btc', '2025-12-01 14:16:45'),
	(2218, 86052, 'btc', '2025-12-01 14:18:46'),
	(2219, 86111, 'btc', '2025-12-01 14:20:46'),
	(2220, 86164, 'btc', '2025-12-01 14:22:46'),
	(2221, 86093, 'btc', '2025-12-01 14:24:47'),
	(2222, 86154, 'btc', '2025-12-01 14:26:47'),
	(2223, 86252, 'btc', '2025-12-01 14:28:47'),
	(2224, 86259, 'btc', '2025-12-01 14:30:48'),
	(2225, 86036, 'btc', '2025-12-01 14:32:48'),
	(2226, 86279, 'btc', '2025-12-01 14:34:48'),
	(2227, 86542, 'btc', '2025-12-01 14:36:49'),
	(2228, 86500, 'btc', '2025-12-01 14:38:49'),
	(2229, 86316, 'btc', '2025-12-01 14:40:49'),
	(2230, 86111, 'btc', '2025-12-01 14:42:49'),
	(2231, 86071, 'btc', '2025-12-01 14:44:50'),
	(2232, 86240, 'btc', '2025-12-01 14:46:50'),
	(2233, 86020, 'btc', '2025-12-01 14:48:50'),
	(2234, 85950, 'btc', '2025-12-01 14:50:51'),
	(2235, 86106, 'btc', '2025-12-01 14:52:51'),
	(2236, 86038, 'btc', '2025-12-01 14:54:51'),
	(2237, 86276, 'btc', '2025-12-01 14:56:52'),
	(2238, 86174, 'btc', '2025-12-01 14:58:52'),
	(2239, 86043, 'btc', '2025-12-01 15:00:52'),
	(2240, 86045, 'btc', '2025-12-01 15:02:52'),
	(2241, 85759, 'btc', '2025-12-01 15:04:53'),
	(2242, 85853, 'btc', '2025-12-01 15:06:53'),
	(2243, 85865, 'btc', '2025-12-01 15:08:53'),
	(2244, 85852, 'btc', '2025-12-01 15:10:54'),
	(2245, 85814, 'btc', '2025-12-01 15:12:54'),
	(2246, 85610, 'btc', '2025-12-01 15:14:54'),
	(2247, 85705, 'btc', '2025-12-01 15:16:54'),
	(2248, 85605, 'btc', '2025-12-01 15:18:55'),
	(2249, 85521, 'btc', '2025-12-01 15:20:55'),
	(2250, 85379, 'btc', '2025-12-01 15:22:55'),
	(2251, 85324, 'btc', '2025-12-01 15:24:56'),
	(2252, 85072, 'btc', '2025-12-01 15:26:56'),
	(2253, 84989, 'btc', '2025-12-01 15:28:57'),
	(2254, 84900, 'btc', '2025-12-01 15:30:29'),
	(2255, 84710, 'btc', '2025-12-01 15:32:29'),
	(2256, 84457, 'btc', '2025-12-01 15:34:30'),
	(2257, 84738, 'btc', '2025-12-01 15:36:30'),
	(2258, 84533, 'btc', '2025-12-01 15:38:30'),
	(2259, 84305, 'btc', '2025-12-01 15:40:30'),
	(2260, 84083, 'btc', '2025-12-01 15:42:31'),
	(2261, 83949, 'btc', '2025-12-01 15:44:31'),
	(2262, 84106, 'btc', '2025-12-01 15:46:31'),
	(2263, 84333, 'btc', '2025-12-01 15:48:32'),
	(2264, 84514, 'btc', '2025-12-01 15:50:32'),
	(2265, 84841, 'btc', '2025-12-01 15:52:32'),
	(2266, 84881, 'btc', '2025-12-01 15:54:32'),
	(2267, 84653, 'btc', '2025-12-01 15:56:33'),
	(2268, 84679, 'btc', '2025-12-01 15:58:33'),
	(2269, 84686, 'btc', '2025-12-01 16:00:33'),
	(2270, 84623, 'btc', '2025-12-01 16:02:34'),
	(2271, 84500, 'btc', '2025-12-01 16:04:34'),
	(2272, 84399, 'btc', '2025-12-01 16:06:34'),
	(2273, 84253, 'btc', '2025-12-01 16:08:34'),
	(2274, 84250, 'btc', '2025-12-01 16:10:35'),
	(2275, 84325, 'btc', '2025-12-01 16:12:35'),
	(2276, 84145, 'btc', '2025-12-01 16:14:35'),
	(2277, 84128, 'btc', '2025-12-01 16:16:36'),
	(2278, 84124, 'btc', '2025-12-01 16:18:36'),
	(2279, 84100, 'btc', '2025-12-01 16:20:36'),
	(2280, 84268, 'btc', '2025-12-01 16:22:37'),
	(2281, 84230, 'btc', '2025-12-01 16:24:37'),
	(2282, 84452, 'btc', '2025-12-01 16:26:37'),
	(2283, 84573, 'btc', '2025-12-01 16:28:37'),
	(2284, 84553, 'btc', '2025-12-01 16:30:38'),
	(2285, 84769, 'btc', '2025-12-01 16:32:38'),
	(2286, 84744, 'btc', '2025-12-01 16:34:38'),
	(2287, 84719, 'btc', '2025-12-01 16:36:39'),
	(2288, 85140, 'btc', '2025-12-01 16:38:39'),
	(2289, 85324, 'btc', '2025-12-01 16:40:39'),
	(2290, 85332, 'btc', '2025-12-01 16:42:40'),
	(2291, 85230, 'btc', '2025-12-01 16:44:40'),
	(2292, 85054, 'btc', '2025-12-01 16:46:40'),
	(2293, 84968, 'btc', '2025-12-01 16:48:40'),
	(2294, 84772, 'btc', '2025-12-01 16:50:41'),
	(2295, 84663, 'btc', '2025-12-01 16:52:41'),
	(2296, 84549, 'btc', '2025-12-01 16:54:41'),
	(2297, 84588, 'btc', '2025-12-01 16:56:42'),
	(2298, 84502, 'btc', '2025-12-01 16:58:42'),
	(2299, 84528, 'btc', '2025-12-01 16:59:27'),
	(2300, 84724, 'btc', '2025-12-01 17:01:27'),
	(2301, 84603, 'btc', '2025-12-01 17:03:13'),
	(2302, 84822, 'btc', '2025-12-01 17:05:13'),
	(2303, 84886, 'btc', '2025-12-01 17:07:14'),
	(2304, 84941, 'btc', '2025-12-01 17:09:14'),
	(2305, 84731, 'btc', '2025-12-01 17:11:14'),
	(2306, 84767, 'btc', '2025-12-01 17:13:14'),
	(2307, 84541, 'btc', '2025-12-01 17:15:15'),
	(2308, 84633, 'btc', '2025-12-01 17:17:15'),
	(2309, 84628, 'btc', '2025-12-01 17:19:15'),
	(2310, 84765, 'btc', '2025-12-01 17:21:16'),
	(2311, 84886, 'btc', '2025-12-01 17:23:16'),
	(2312, 84886, 'btc', '2025-12-01 17:25:16'),
	(2313, 84935, 'btc', '2025-12-01 17:27:17'),
	(2314, 85048, 'btc', '2025-12-01 17:29:17'),
	(2315, 84818, 'btc', '2025-12-01 17:31:17'),
	(2316, 84706, 'btc', '2025-12-01 17:33:18'),
	(2317, 84742, 'btc', '2025-12-01 17:35:18'),
	(2318, 84952, 'btc', '2025-12-01 17:37:18'),
	(2319, 84940, 'btc', '2025-12-01 17:39:19'),
	(2320, 85036, 'btc', '2025-12-01 17:41:19'),
	(2321, 85042, 'btc', '2025-12-01 17:43:19'),
	(2322, 85239, 'btc', '2025-12-01 17:45:19'),
	(2323, 85190, 'btc', '2025-12-01 17:47:20'),
	(2324, 85198, 'btc', '2025-12-01 17:49:20'),
	(2325, 85092, 'btc', '2025-12-01 17:51:20'),
	(2326, 85041, 'btc', '2025-12-01 17:53:21'),
	(2327, 85082, 'btc', '2025-12-01 17:55:21'),
	(2328, 85010, 'btc', '2025-12-01 17:57:21'),
	(2329, 85011, 'btc', '2025-12-01 17:58:11'),
	(2330, 84956, 'btc', '2025-12-01 17:59:43'),
	(2331, 85144, 'btc', '2025-12-01 18:02:00'),
	(2332, 85048, 'btc', '2025-12-01 18:03:44'),
	(2333, 85020, 'btc', '2025-12-01 18:04:43'),
	(2334, 85053, 'btc', '2025-12-01 18:06:43'),
	(2335, 85042, 'btc', '2025-12-01 18:08:44'),
	(2336, 84995, 'btc', '2025-12-01 18:09:47'),
	(2337, 85178, 'btc', '2025-12-01 18:11:47'),
	(2338, 85348, 'btc', '2025-12-01 18:13:47'),
	(2339, 85489, 'btc', '2025-12-01 18:15:48'),
	(2340, 85404, 'btc', '2025-12-01 18:17:48'),
	(2341, 85514, 'btc', '2025-12-01 18:19:48'),
	(2342, 85286, 'btc', '2025-12-01 18:21:49'),
	(2343, 85373, 'btc', '2025-12-01 18:22:51'),
	(2344, 85402, 'btc', '2025-12-01 18:24:51'),
	(2345, 85362, 'btc', '2025-12-01 18:26:52'),
	(2346, 85332, 'btc', '2025-12-01 18:28:52'),
	(2347, 85221, 'btc', '2025-12-01 18:30:52'),
	(2348, 85182, 'btc', '2025-12-01 18:32:53'),
	(2349, 85164, 'btc', '2025-12-01 18:34:53'),
	(2350, 84995, 'btc', '2025-12-01 18:36:53'),
	(2351, 84960, 'btc', '2025-12-01 18:38:54'),
	(2352, 84841, 'btc', '2025-12-01 18:40:54'),
	(2353, 84757, 'btc', '2025-12-01 18:42:54'),
	(2354, 84758, 'btc', '2025-12-01 18:44:55'),
	(2355, 84804, 'btc', '2025-12-01 18:46:55'),
	(2356, 84898, 'btc', '2025-12-01 18:48:55'),
	(2357, 84871, 'btc', '2025-12-01 18:50:56'),
	(2358, 84854, 'btc', '2025-12-01 18:52:56'),
	(2359, 84938, 'btc', '2025-12-01 18:54:56'),
	(2360, 85030, 'btc', '2025-12-01 18:56:56'),
	(2361, 85169, 'btc', '2025-12-01 18:58:57'),
	(2362, 85250, 'btc', '2025-12-01 19:00:57'),
	(2363, 85129, 'btc', '2025-12-01 19:02:57'),
	(2364, 85129, 'btc', '2025-12-01 19:04:58'),
	(2365, 84999, 'btc', '2025-12-01 19:06:58'),
	(2366, 84811, 'btc', '2025-12-01 19:08:58'),
	(2367, 85004, 'btc', '2025-12-01 19:10:59'),
	(2368, 85048, 'btc', '2025-12-01 19:12:59'),
	(2369, 85027, 'btc', '2025-12-01 19:14:59'),
	(2370, 85018, 'btc', '2025-12-01 19:17:00'),
	(2371, 84968, 'btc', '2025-12-01 19:19:00'),
	(2372, 84850, 'btc', '2025-12-01 19:21:00'),
	(2373, 84822, 'btc', '2025-12-01 19:23:00'),
	(2374, 84965, 'btc', '2025-12-01 19:25:01'),
	(2375, 84774, 'btc', '2025-12-01 19:27:01'),
	(2376, 84807, 'btc', '2025-12-01 19:29:01'),
	(2377, 84651, 'btc', '2025-12-01 19:31:02'),
	(2378, 84617, 'btc', '2025-12-01 19:33:02'),
	(2379, 84708, 'btc', '2025-12-01 19:35:02'),
	(2380, 85024, 'btc', '2025-12-01 19:37:03'),
	(2381, 84806, 'btc', '2025-12-01 19:39:03'),
	(2382, 84875, 'btc', '2025-12-01 19:41:03'),
	(2383, 84774, 'btc', '2025-12-01 19:43:03'),
	(2384, 84781, 'btc', '2025-12-01 19:45:04'),
	(2385, 84729, 'btc', '2025-12-01 19:47:04'),
	(2386, 84761, 'btc', '2025-12-01 19:49:04'),
	(2387, 84947, 'btc', '2025-12-01 19:51:05'),
	(2388, 84952, 'btc', '2025-12-01 19:53:05'),
	(2389, 85040, 'btc', '2025-12-01 19:55:05'),
	(2390, 85004, 'btc', '2025-12-01 19:57:06'),
	(2391, 85100, 'btc', '2025-12-01 19:59:06'),
	(2392, 85240, 'btc', '2025-12-01 20:01:06'),
	(2393, 85360, 'btc', '2025-12-01 20:03:07'),
	(2394, 85469, 'btc', '2025-12-01 20:05:07'),
	(2395, 85691, 'btc', '2025-12-01 20:07:07'),
	(2396, 85795, 'btc', '2025-12-01 20:09:08'),
	(2397, 85824, 'btc', '2025-12-01 20:11:08'),
	(2398, 85596, 'btc', '2025-12-01 20:13:08'),
	(2399, 85511, 'btc', '2025-12-01 20:15:09'),
	(2400, 85442, 'btc', '2025-12-01 20:17:09'),
	(2401, 85448, 'btc', '2025-12-01 20:19:09'),
	(2402, 85507, 'btc', '2025-12-01 20:21:10'),
	(2403, 85422, 'btc', '2025-12-01 20:23:10'),
	(2404, 85400, 'btc', '2025-12-01 20:25:10'),
	(2405, 85286, 'btc', '2025-12-01 20:27:11'),
	(2406, 85273, 'btc', '2025-12-01 20:29:11'),
	(2407, 85324, 'btc', '2025-12-01 20:31:11'),
	(2408, 85309, 'btc', '2025-12-01 20:33:11'),
	(2409, 85275, 'btc', '2025-12-01 20:35:12'),
	(2410, 85311, 'btc', '2025-12-01 20:37:12'),
	(2411, 85366, 'btc', '2025-12-01 20:39:12'),
	(2412, 85384, 'btc', '2025-12-01 20:41:13'),
	(2413, 85378, 'btc', '2025-12-01 20:43:13'),
	(2414, 85437, 'btc', '2025-12-01 20:45:13'),
	(2415, 85423, 'btc', '2025-12-01 20:47:14'),
	(2416, 85476, 'btc', '2025-12-01 20:49:14'),
	(2417, 85463, 'btc', '2025-12-01 20:51:14'),
	(2418, 85318, 'btc', '2025-12-01 20:53:15'),
	(2419, 85319, 'btc', '2025-12-01 20:55:15'),
	(2420, 85462, 'btc', '2025-12-01 20:57:15'),
	(2421, 85436, 'btc', '2025-12-01 20:59:16'),
	(2422, 85651, 'btc', '2025-12-01 21:01:16'),
	(2423, 85580, 'btc', '2025-12-01 21:03:16'),
	(2424, 85662, 'btc', '2025-12-01 21:05:16'),
	(2425, 85767, 'btc', '2025-12-01 21:07:17'),
	(2426, 85859, 'btc', '2025-12-01 21:09:17'),
	(2427, 85856, 'btc', '2025-12-01 21:11:17'),
	(2428, 85704, 'btc', '2025-12-01 21:13:18'),
	(2429, 85650, 'btc', '2025-12-01 21:15:18'),
	(2430, 85790, 'btc', '2025-12-01 21:17:18'),
	(2431, 85841, 'btc', '2025-12-01 21:19:18'),
	(2432, 86031, 'btc', '2025-12-01 21:21:19'),
	(2433, 86029, 'btc', '2025-12-01 21:23:19'),
	(2434, 86254, 'btc', '2025-12-01 21:28:18'),
	(2435, 86184, 'btc', '2025-12-01 21:30:18'),
	(2436, 86302, 'btc', '2025-12-01 21:32:19'),
	(2437, 86456, 'btc', '2025-12-01 21:34:19'),
	(2438, 86413, 'btc', '2025-12-01 21:36:19'),
	(2439, 86300, 'btc', '2025-12-01 21:38:20'),
	(2440, 86354, 'btc', '2025-12-01 21:40:20'),
	(2441, 86419, 'btc', '2025-12-01 21:42:20'),
	(2442, 86432, 'btc', '2025-12-01 21:44:21'),
	(2443, 86410, 'btc', '2025-12-01 21:46:21'),
	(2444, 86261, 'btc', '2025-12-01 21:48:21'),
	(2445, 86314, 'btc', '2025-12-01 21:49:20'),
	(2446, 86364, 'btc', '2025-12-01 21:51:20'),
	(2447, 86444, 'btc', '2025-12-01 21:53:20'),
	(2448, 86434, 'btc', '2025-12-01 21:55:21'),
	(2449, 86436, 'btc', '2025-12-01 21:57:21'),
	(2450, 86430, 'btc', '2025-12-01 21:59:21'),
	(2451, 86541, 'btc', '2025-12-01 22:01:22'),
	(2452, 86528, 'btc', '2025-12-01 22:03:22'),
	(2453, 86711, 'btc', '2025-12-01 22:05:22'),
	(2454, 86799, 'btc', '2025-12-01 22:07:23'),
	(2455, 86807, 'btc', '2025-12-01 22:09:23'),
	(2456, 86736, 'btc', '2025-12-01 22:11:23'),
	(2457, 86513, 'btc', '2025-12-01 22:13:24'),
	(2458, 86612, 'btc', '2025-12-01 22:15:24'),
	(2459, 86521, 'btc', '2025-12-01 22:17:24'),
	(2460, 86423, 'btc', '2025-12-01 22:19:25'),
	(2461, 86503, 'btc', '2025-12-01 22:21:25'),
	(2462, 86438, 'btc', '2025-12-01 22:23:36'),
	(2463, 86433, 'btc', '2025-12-01 22:25:36'),
	(2464, 86495, 'btc', '2025-12-01 22:27:37'),
	(2465, 86473, 'btc', '2025-12-01 22:29:37'),
	(2466, 86526, 'btc', '2025-12-01 22:31:37'),
	(2467, 86423, 'btc', '2025-12-01 22:33:38'),
	(2468, 86375, 'btc', '2025-12-01 22:35:38'),
	(2469, 86460, 'btc', '2025-12-01 22:37:38'),
	(2470, 86580, 'btc', '2025-12-01 22:39:39'),
	(2471, 86620, 'btc', '2025-12-01 22:41:39'),
	(2472, 86674, 'btc', '2025-12-01 22:43:39'),
	(2473, 86747, 'btc', '2025-12-01 22:45:39'),
	(2474, 86786, 'btc', '2025-12-01 22:47:40'),
	(2475, 86807, 'btc', '2025-12-01 22:49:40'),
	(2476, 86802, 'btc', '2025-12-01 22:51:40'),
	(2477, 86745, 'btc', '2025-12-01 22:53:41'),
	(2478, 86726, 'btc', '2025-12-01 22:55:41'),
	(2479, 86634, 'btc', '2025-12-01 22:57:41'),
	(2480, 86573, 'btc', '2025-12-01 22:59:41'),
	(2481, 86714, 'btc', '2025-12-01 23:01:42'),
	(2482, 86745, 'btc', '2025-12-01 23:03:42'),
	(2483, 86737, 'btc', '2025-12-01 23:05:10'),
	(2484, 86601, 'btc', '2025-12-01 23:07:10'),
	(2485, 86515, 'btc', '2025-12-01 23:09:11'),
	(2486, 86558, 'btc', '2025-12-01 23:11:11'),
	(2487, 86532, 'btc', '2025-12-01 23:13:11'),
	(2488, 86465, 'btc', '2025-12-01 23:15:12'),
	(2489, 86488, 'btc', '2025-12-01 23:17:12'),
	(2490, 86627, 'btc', '2025-12-01 23:19:12'),
	(2491, 86700, 'btc', '2025-12-01 23:21:13'),
	(2492, 86700, 'btc', '2025-12-01 23:23:13'),
	(2493, 86694, 'btc', '2025-12-01 23:25:13'),
	(2494, 86679, 'btc', '2025-12-01 23:27:13'),
	(2495, 86700, 'btc', '2025-12-01 23:29:14'),
	(2496, 86830, 'btc', '2025-12-01 23:31:14'),
	(2497, 86766, 'btc', '2025-12-01 23:33:14'),
	(2498, 86680, 'btc', '2025-12-01 23:35:15'),
	(2499, 86548, 'btc', '2025-12-01 23:37:15'),
	(2500, 86586, 'btc', '2025-12-01 23:39:15'),
	(2501, 86577, 'btc', '2025-12-01 23:41:16'),
	(2502, 86540, 'btc', '2025-12-01 23:43:16'),
	(2503, 86493, 'btc', '2025-12-01 23:45:16'),
	(2504, 86460, 'btc', '2025-12-01 23:47:17'),
	(2505, 86411, 'btc', '2025-12-01 23:49:17'),
	(2506, 86351, 'btc', '2025-12-01 23:51:17'),
	(2507, 86395, 'btc', '2025-12-01 23:53:17'),
	(2508, 86292, 'btc', '2025-12-01 23:55:18'),
	(2509, 86286, 'btc', '2025-12-01 23:57:18'),
	(2510, 86320, 'btc', '2025-12-01 23:59:18'),
	(2511, 86328, 'btc', '2025-12-02 00:01:19'),
	(2512, 86312, 'btc', '2025-12-02 00:03:19'),
	(2513, 86294, 'btc', '2025-12-02 00:05:19'),
	(2514, 86519, 'btc', '2025-12-02 00:07:20'),
	(2515, 86469, 'btc', '2025-12-02 00:09:20'),
	(2516, 86463, 'btc', '2025-12-02 00:11:20'),
	(2517, 86385, 'btc', '2025-12-02 00:13:20'),
	(2518, 86328, 'btc', '2025-12-02 00:15:21'),
	(2519, 86345, 'btc', '2025-12-02 00:17:21'),
	(2520, 86392, 'btc', '2025-12-02 00:19:21'),
	(2521, 86214, 'btc', '2025-12-02 00:21:22'),
	(2522, 86240, 'btc', '2025-12-02 00:23:22'),
	(2523, 86348, 'btc', '2025-12-02 00:25:22'),
	(2524, 86277, 'btc', '2025-12-02 00:27:22'),
	(2525, 86318, 'btc', '2025-12-02 00:29:23'),
	(2526, 86382, 'btc', '2025-12-02 00:31:23'),
	(2527, 86413, 'btc', '2025-12-02 00:33:23'),
	(2528, 86480, 'btc', '2025-12-02 00:35:24'),
	(2529, 86369, 'btc', '2025-12-02 00:37:24'),
	(2530, 86440, 'btc', '2025-12-02 00:39:24'),
	(2531, 86389, 'btc', '2025-12-02 00:41:25'),
	(2532, 86394, 'btc', '2025-12-02 00:43:25'),
	(2533, 86335, 'btc', '2025-12-02 00:45:25'),
	(2534, 86379, 'btc', '2025-12-02 00:47:25'),
	(2535, 86450, 'btc', '2025-12-02 00:49:26'),
	(2536, 86594, 'btc', '2025-12-02 00:51:26'),
	(2537, 86631, 'btc', '2025-12-02 00:53:26'),
	(2538, 86501, 'btc', '2025-12-02 00:55:27'),
	(2539, 86500, 'btc', '2025-12-02 00:57:27'),
	(2540, 86513, 'btc', '2025-12-02 00:59:27'),
	(2541, 86596, 'btc', '2025-12-02 01:01:27'),
	(2542, 86577, 'btc', '2025-12-02 01:03:28'),
	(2543, 86740, 'btc', '2025-12-02 01:05:28'),
	(2544, 87193, 'btc', '2025-12-02 01:07:28'),
	(2545, 86917, 'btc', '2025-12-02 01:09:29'),
	(2546, 86888, 'btc', '2025-12-02 01:11:29'),
	(2547, 86822, 'btc', '2025-12-02 01:13:29'),
	(2548, 86762, 'btc', '2025-12-02 01:15:29'),
	(2549, 86831, 'btc', '2025-12-02 01:17:30'),
	(2550, 86683, 'btc', '2025-12-02 01:19:30'),
	(2551, 86642, 'btc', '2025-12-02 01:21:30'),
	(2552, 86736, 'btc', '2025-12-02 01:23:30'),
	(2553, 86734, 'btc', '2025-12-02 01:25:31'),
	(2554, 86800, 'btc', '2025-12-02 01:27:31'),
	(2555, 86718, 'btc', '2025-12-02 01:29:31'),
	(2556, 86752, 'btc', '2025-12-02 01:31:32'),
	(2557, 86772, 'btc', '2025-12-02 01:33:32'),
	(2558, 86530, 'btc', '2025-12-02 01:35:32'),
	(2559, 86617, 'btc', '2025-12-02 01:37:33'),
	(2560, 86668, 'btc', '2025-12-02 01:39:33'),
	(2561, 86635, 'btc', '2025-12-02 01:41:33'),
	(2562, 86586, 'btc', '2025-12-02 01:43:33'),
	(2563, 86562, 'btc', '2025-12-02 01:45:34'),
	(2564, 86536, 'btc', '2025-12-02 01:47:34'),
	(2565, 86517, 'btc', '2025-12-02 01:49:34'),
	(2566, 86451, 'btc', '2025-12-02 01:51:35'),
	(2567, 86490, 'btc', '2025-12-02 01:53:35'),
	(2568, 86467, 'btc', '2025-12-02 01:55:35'),
	(2569, 86418, 'btc', '2025-12-02 01:57:35'),
	(2570, 86496, 'btc', '2025-12-02 01:59:36'),
	(2571, 86368, 'btc', '2025-12-02 02:01:36'),
	(2572, 86437, 'btc', '2025-12-02 02:03:36'),
	(2573, 86443, 'btc', '2025-12-02 02:05:36'),
	(2574, 86343, 'btc', '2025-12-02 02:07:37'),
	(2575, 86377, 'btc', '2025-12-02 02:09:37'),
	(2576, 86480, 'btc', '2025-12-02 02:11:37'),
	(2577, 86607, 'btc', '2025-12-02 02:13:38'),
	(2578, 86704, 'btc', '2025-12-02 02:15:38'),
	(2579, 86782, 'btc', '2025-12-02 02:17:38'),
	(2580, 86805, 'btc', '2025-12-02 02:19:38'),
	(2581, 86775, 'btc', '2025-12-02 02:21:39'),
	(2582, 86800, 'btc', '2025-12-02 02:23:39'),
	(2583, 86820, 'btc', '2025-12-02 02:25:39'),
	(2584, 86810, 'btc', '2025-12-02 02:27:40'),
	(2585, 86680, 'btc', '2025-12-02 02:29:40'),
	(2586, 86684, 'btc', '2025-12-02 02:31:40'),
	(2587, 86751, 'btc', '2025-12-02 02:33:40'),
	(2588, 86819, 'btc', '2025-12-02 02:35:41'),
	(2589, 86796, 'btc', '2025-12-02 02:37:41'),
	(2590, 86734, 'btc', '2025-12-02 02:39:41'),
	(2591, 86820, 'btc', '2025-12-02 02:41:42'),
	(2592, 86797, 'btc', '2025-12-02 02:43:42'),
	(2593, 86759, 'btc', '2025-12-02 02:45:42'),
	(2594, 86705, 'btc', '2025-12-02 02:47:42'),
	(2595, 86715, 'btc', '2025-12-02 02:49:43'),
	(2596, 86660, 'btc', '2025-12-02 02:51:43'),
	(2597, 86664, 'btc', '2025-12-02 02:53:43'),
	(2598, 86651, 'btc', '2025-12-02 02:55:44'),
	(2599, 86586, 'btc', '2025-12-02 02:57:44'),
	(2600, 86531, 'btc', '2025-12-02 02:59:44'),
	(2601, 86521, 'btc', '2025-12-02 03:01:45'),
	(2602, 86568, 'btc', '2025-12-02 03:03:45'),
	(2603, 86487, 'btc', '2025-12-02 03:05:45'),
	(2604, 86498, 'btc', '2025-12-02 03:07:46'),
	(2605, 86507, 'btc', '2025-12-02 03:09:46'),
	(2606, 86637, 'btc', '2025-12-02 03:11:46'),
	(2607, 86603, 'btc', '2025-12-02 03:13:46'),
	(2608, 86560, 'btc', '2025-12-02 03:15:47'),
	(2609, 86526, 'btc', '2025-12-02 03:17:47'),
	(2610, 86566, 'btc', '2025-12-02 03:19:47'),
	(2611, 86382, 'btc', '2025-12-02 03:21:48'),
	(2612, 86318, 'btc', '2025-12-02 03:23:48'),
	(2613, 86367, 'btc', '2025-12-02 03:25:48'),
	(2614, 86370, 'btc', '2025-12-02 03:27:48'),
	(2615, 86357, 'btc', '2025-12-02 03:29:49'),
	(2616, 86308, 'btc', '2025-12-02 03:31:49'),
	(2617, 86235, 'btc', '2025-12-02 03:33:49'),
	(2618, 86295, 'btc', '2025-12-02 03:35:50'),
	(2619, 86401, 'btc', '2025-12-02 03:37:50'),
	(2620, 86370, 'btc', '2025-12-02 03:39:50'),
	(2621, 86450, 'btc', '2025-12-02 03:41:50'),
	(2622, 86780, 'btc', '2025-12-02 03:43:51'),
	(2623, 86890, 'btc', '2025-12-02 03:45:51'),
	(2624, 86843, 'btc', '2025-12-02 03:47:51'),
	(2625, 86807, 'btc', '2025-12-02 03:49:52'),
	(2626, 86832, 'btc', '2025-12-02 03:51:52'),
	(2627, 86840, 'btc', '2025-12-02 03:53:52'),
	(2628, 86944, 'btc', '2025-12-02 03:55:53'),
	(2629, 86990, 'btc', '2025-12-02 03:57:53'),
	(2630, 86963, 'btc', '2025-12-02 03:59:53'),
	(2631, 87196, 'btc', '2025-12-02 04:01:53'),
	(2632, 87123, 'btc', '2025-12-02 04:03:54'),
	(2633, 87016, 'btc', '2025-12-02 04:05:54'),
	(2634, 87095, 'btc', '2025-12-02 04:07:54'),
	(2635, 87039, 'btc', '2025-12-02 04:09:55'),
	(2636, 87070, 'btc', '2025-12-02 04:11:55'),
	(2637, 87130, 'btc', '2025-12-02 04:13:55'),
	(2638, 87050, 'btc', '2025-12-02 04:15:56'),
	(2639, 87188, 'btc', '2025-12-02 04:17:56'),
	(2640, 87186, 'btc', '2025-12-02 04:19:56'),
	(2641, 87080, 'btc', '2025-12-02 04:21:56'),
	(2642, 87093, 'btc', '2025-12-02 04:23:57'),
	(2643, 87050, 'btc', '2025-12-02 04:25:57'),
	(2644, 87058, 'btc', '2025-12-02 04:27:57'),
	(2645, 87020, 'btc', '2025-12-02 04:29:58'),
	(2646, 86996, 'btc', '2025-12-02 04:31:58'),
	(2647, 86954, 'btc', '2025-12-02 04:33:58'),
	(2648, 87008, 'btc', '2025-12-02 04:35:58'),
	(2649, 87024, 'btc', '2025-12-02 04:37:59'),
	(2650, 87007, 'btc', '2025-12-02 04:39:59'),
	(2651, 86994, 'btc', '2025-12-02 04:41:59'),
	(2652, 86922, 'btc', '2025-12-02 04:44:00'),
	(2653, 86974, 'btc', '2025-12-02 04:46:00'),
	(2654, 87016, 'btc', '2025-12-02 04:48:00'),
	(2655, 86928, 'btc', '2025-12-02 04:50:01'),
	(2656, 87002, 'btc', '2025-12-02 04:52:01'),
	(2657, 86996, 'btc', '2025-12-02 04:54:01'),
	(2658, 87000, 'btc', '2025-12-02 04:56:01'),
	(2659, 86959, 'btc', '2025-12-02 04:58:02'),
	(2660, 86970, 'btc', '2025-12-02 05:00:02'),
	(2661, 86978, 'btc', '2025-12-02 05:02:02'),
	(2662, 86984, 'btc', '2025-12-02 05:04:03'),
	(2663, 86880, 'btc', '2025-12-02 05:06:03'),
	(2664, 86880, 'btc', '2025-12-02 05:08:03'),
	(2665, 86900, 'btc', '2025-12-02 05:10:03'),
	(2666, 87040, 'btc', '2025-12-02 05:12:04'),
	(2667, 87044, 'btc', '2025-12-02 05:14:04'),
	(2668, 86991, 'btc', '2025-12-02 05:16:04'),
	(2669, 86996, 'btc', '2025-12-02 05:18:05'),
	(2670, 87023, 'btc', '2025-12-02 05:20:05'),
	(2671, 86968, 'btc', '2025-12-02 05:22:05'),
	(2672, 86973, 'btc', '2025-12-02 05:24:05'),
	(2673, 86976, 'btc', '2025-12-02 05:26:06'),
	(2674, 86950, 'btc', '2025-12-02 05:28:06'),
	(2675, 86927, 'btc', '2025-12-02 05:30:06'),
	(2676, 86932, 'btc', '2025-12-02 05:32:07'),
	(2677, 86874, 'btc', '2025-12-02 05:34:07'),
	(2678, 86935, 'btc', '2025-12-02 05:36:07'),
	(2679, 86915, 'btc', '2025-12-02 05:38:08'),
	(2680, 86869, 'btc', '2025-12-02 05:40:08'),
	(2681, 86919, 'btc', '2025-12-02 05:42:08'),
	(2682, 86952, 'btc', '2025-12-02 05:44:09'),
	(2683, 86979, 'btc', '2025-12-02 05:46:09'),
	(2684, 87030, 'btc', '2025-12-02 05:48:09'),
	(2685, 87005, 'btc', '2025-12-02 05:50:10'),
	(2686, 87000, 'btc', '2025-12-02 05:52:10'),
	(2687, 86991, 'btc', '2025-12-02 05:54:10'),
	(2688, 86954, 'btc', '2025-12-02 05:56:10'),
	(2689, 87014, 'btc', '2025-12-02 05:58:11'),
	(2690, 86997, 'btc', '2025-12-02 06:00:11'),
	(2691, 86991, 'btc', '2025-12-02 06:02:11'),
	(2692, 86964, 'btc', '2025-12-02 06:04:12'),
	(2693, 86907, 'btc', '2025-12-02 06:06:12'),
	(2694, 86950, 'btc', '2025-12-02 06:08:12'),
	(2695, 86914, 'btc', '2025-12-02 06:10:12'),
	(2696, 86913, 'btc', '2025-12-02 06:12:13'),
	(2697, 86936, 'btc', '2025-12-02 06:14:13'),
	(2698, 86965, 'btc', '2025-12-02 06:16:13'),
	(2699, 86963, 'btc', '2025-12-02 06:18:14'),
	(2700, 86931, 'btc', '2025-12-02 06:20:14'),
	(2701, 86891, 'btc', '2025-12-02 06:22:14'),
	(2702, 86934, 'btc', '2025-12-02 06:24:15'),
	(2703, 86915, 'btc', '2025-12-02 06:26:15'),
	(2704, 86880, 'btc', '2025-12-02 06:28:15'),
	(2705, 86922, 'btc', '2025-12-02 06:30:16'),
	(2706, 86990, 'btc', '2025-12-02 06:32:16'),
	(2707, 87060, 'btc', '2025-12-02 06:34:16'),
	(2708, 87025, 'btc', '2025-12-02 06:36:16'),
	(2709, 87077, 'btc', '2025-12-02 06:38:17'),
	(2710, 87121, 'btc', '2025-12-02 06:40:17'),
	(2711, 87152, 'btc', '2025-12-02 06:42:17'),
	(2712, 87152, 'btc', '2025-12-02 06:44:18'),
	(2713, 87126, 'btc', '2025-12-02 06:46:18'),
	(2714, 87119, 'btc', '2025-12-02 06:48:18'),
	(2715, 87125, 'btc', '2025-12-02 06:50:18'),
	(2716, 87150, 'btc', '2025-12-02 06:52:19'),
	(2717, 87144, 'btc', '2025-12-02 06:54:19'),
	(2718, 87120, 'btc', '2025-12-02 06:56:19'),
	(2719, 87122, 'btc', '2025-12-02 06:58:20'),
	(2720, 87099, 'btc', '2025-12-02 07:00:20'),
	(2721, 87111, 'btc', '2025-12-02 07:02:20'),
	(2722, 87032, 'btc', '2025-12-02 07:04:20'),
	(2723, 86976, 'btc', '2025-12-02 07:06:21'),
	(2724, 86934, 'btc', '2025-12-02 07:08:21'),
	(2725, 86946, 'btc', '2025-12-02 07:10:21'),
	(2726, 87050, 'btc', '2025-12-02 07:12:21'),
	(2727, 86979, 'btc', '2025-12-02 07:14:22'),
	(2728, 86932, 'btc', '2025-12-02 07:16:22'),
	(2729, 86943, 'btc', '2025-12-02 07:18:22'),
	(2730, 86983, 'btc', '2025-12-02 07:20:23'),
	(2731, 86991, 'btc', '2025-12-02 07:22:23'),
	(2732, 86942, 'btc', '2025-12-02 07:24:23'),
	(2733, 86946, 'btc', '2025-12-02 07:26:24'),
	(2734, 86926, 'btc', '2025-12-02 07:28:24'),
	(2735, 86950, 'btc', '2025-12-02 07:30:24'),
	(2736, 86920, 'btc', '2025-12-02 07:32:24'),
	(2737, 86937, 'btc', '2025-12-02 07:34:25'),
	(2738, 86939, 'btc', '2025-12-02 07:36:25'),
	(2739, 87025, 'btc', '2025-12-02 07:38:25'),
	(2740, 86966, 'btc', '2025-12-02 07:40:26'),
	(2741, 87020, 'btc', '2025-12-02 07:42:26'),
	(2742, 87008, 'btc', '2025-12-02 07:44:26'),
	(2743, 87004, 'btc', '2025-12-02 07:46:27'),
	(2744, 87024, 'btc', '2025-12-02 07:48:27'),
	(2745, 87019, 'btc', '2025-12-02 07:50:27'),
	(2746, 87015, 'btc', '2025-12-02 07:52:28'),
	(2747, 87034, 'btc', '2025-12-02 07:54:28'),
	(2748, 87022, 'btc', '2025-12-02 07:56:28'),
	(2749, 87029, 'btc', '2025-12-02 07:58:28'),
	(2750, 87043, 'btc', '2025-12-02 08:00:29'),
	(2751, 87027, 'btc', '2025-12-02 08:02:29'),
	(2752, 86993, 'btc', '2025-12-02 08:04:29'),
	(2753, 86935, 'btc', '2025-12-02 08:06:30'),
	(2754, 86906, 'btc', '2025-12-02 08:08:30'),
	(2755, 86889, 'btc', '2025-12-02 08:10:30'),
	(2756, 86748, 'btc', '2025-12-02 08:12:30'),
	(2757, 86788, 'btc', '2025-12-02 08:14:31'),
	(2758, 86755, 'btc', '2025-12-02 08:16:31'),
	(2759, 86677, 'btc', '2025-12-02 08:18:31'),
	(2760, 86647, 'btc', '2025-12-02 08:20:32'),
	(2761, 86644, 'btc', '2025-12-02 08:22:32'),
	(2762, 86640, 'btc', '2025-12-02 08:24:32'),
	(2763, 86511, 'btc', '2025-12-02 08:26:33'),
	(2764, 86512, 'btc', '2025-12-02 08:28:33'),
	(2765, 86457, 'btc', '2025-12-02 08:30:33'),
	(2766, 86478, 'btc', '2025-12-02 08:32:33'),
	(2767, 86541, 'btc', '2025-12-02 08:34:34'),
	(2768, 86530, 'btc', '2025-12-02 08:36:34'),
	(2769, 86634, 'btc', '2025-12-02 08:38:34'),
	(2770, 86707, 'btc', '2025-12-02 08:40:35'),
	(2771, 86685, 'btc', '2025-12-02 08:42:35'),
	(2772, 86474, 'btc', '2025-12-02 08:44:35'),
	(2773, 86581, 'btc', '2025-12-02 08:46:35'),
	(2774, 86653, 'btc', '2025-12-02 08:48:36'),
	(2775, 86490, 'btc', '2025-12-02 08:50:36'),
	(2776, 86496, 'btc', '2025-12-02 08:52:36'),
	(2777, 86509, 'btc', '2025-12-02 08:54:37'),
	(2778, 86412, 'btc', '2025-12-02 08:56:37'),
	(2779, 86419, 'btc', '2025-12-02 08:58:37'),
	(2780, 86490, 'btc', '2025-12-02 09:00:38'),
	(2781, 86611, 'btc', '2025-12-02 09:02:38'),
	(2782, 86623, 'btc', '2025-12-02 09:04:39'),
	(2783, 86883, 'btc', '2025-12-02 09:06:39'),
	(2784, 86675, 'btc', '2025-12-02 09:08:39'),
	(2785, 86735, 'btc', '2025-12-02 09:10:40'),
	(2786, 86737, 'btc', '2025-12-02 09:12:40'),
	(2787, 86662, 'btc', '2025-12-02 09:14:40'),
	(2788, 86625, 'btc', '2025-12-02 09:16:41'),
	(2789, 86585, 'btc', '2025-12-02 09:18:41'),
	(2790, 86639, 'btc', '2025-12-02 09:20:41'),
	(2791, 86775, 'btc', '2025-12-02 09:22:42'),
	(2792, 86839, 'btc', '2025-12-02 09:24:42'),
	(2793, 86926, 'btc', '2025-12-02 09:26:42'),
	(2794, 86873, 'btc', '2025-12-02 09:28:42'),
	(2795, 86799, 'btc', '2025-12-02 09:30:43'),
	(2796, 86811, 'btc', '2025-12-02 09:32:43'),
	(2797, 86802, 'btc', '2025-12-02 09:34:43'),
	(2798, 86703, 'btc', '2025-12-02 09:36:44'),
	(2799, 86745, 'btc', '2025-12-02 09:38:44'),
	(2800, 86682, 'btc', '2025-12-02 09:40:44'),
	(2801, 86661, 'btc', '2025-12-02 09:42:45'),
	(2802, 86697, 'btc', '2025-12-02 09:44:45'),
	(2803, 86650, 'btc', '2025-12-02 09:46:46'),
	(2804, 86764, 'btc', '2025-12-02 09:48:46'),
	(2805, 86757, 'btc', '2025-12-02 09:50:46'),
	(2806, 86757, 'btc', '2025-12-02 09:52:46'),
	(2807, 86727, 'btc', '2025-12-02 09:54:47'),
	(2808, 86710, 'btc', '2025-12-02 09:56:47'),
	(2809, 86748, 'btc', '2025-12-02 09:58:47'),
	(2810, 86804, 'btc', '2025-12-02 10:00:48'),
	(2811, 86827, 'btc', '2025-12-02 10:02:48'),
	(2812, 86790, 'btc', '2025-12-02 10:04:48'),
	(2813, 86900, 'btc', '2025-12-02 10:06:49'),
	(2814, 86900, 'btc', '2025-12-02 10:08:49'),
	(2815, 86907, 'btc', '2025-12-02 10:10:50'),
	(2816, 86896, 'btc', '2025-12-02 10:12:50'),
	(2817, 86907, 'btc', '2025-12-02 10:14:50'),
	(2818, 86868, 'btc', '2025-12-02 10:16:50'),
	(2819, 86887, 'btc', '2025-12-02 10:18:51'),
	(2820, 86853, 'btc', '2025-12-02 10:20:52'),
	(2821, 86832, 'btc', '2025-12-02 10:22:52'),
	(2822, 86821, 'btc', '2025-12-02 10:24:52'),
	(2823, 86815, 'btc', '2025-12-02 10:26:52'),
	(2824, 86804, 'btc', '2025-12-02 10:28:53'),
	(2825, 86825, 'btc', '2025-12-02 10:30:53'),
	(2826, 86875, 'btc', '2025-12-02 10:32:53'),
	(2827, 86839, 'btc', '2025-12-02 10:34:54'),
	(2828, 86868, 'btc', '2025-12-02 10:36:54'),
	(2829, 86891, 'btc', '2025-12-02 10:38:54'),
	(2830, 86893, 'btc', '2025-12-02 10:40:54'),
	(2831, 86950, 'btc', '2025-12-02 10:42:55'),
	(2832, 87066, 'btc', '2025-12-02 10:44:55'),
	(2833, 87086, 'btc', '2025-12-02 10:46:55'),
	(2834, 87274, 'btc', '2025-12-02 10:48:56'),
	(2835, 87213, 'btc', '2025-12-02 10:50:56'),
	(2836, 87495, 'btc', '2025-12-02 10:52:56'),
	(2837, 87281, 'btc', '2025-12-02 10:54:56'),
	(2838, 87378, 'btc', '2025-12-02 10:56:57'),
	(2839, 87282, 'btc', '2025-12-02 10:58:57'),
	(2840, 87304, 'btc', '2025-12-02 11:00:57'),
	(2841, 87286, 'btc', '2025-12-02 11:02:58'),
	(2842, 87253, 'btc', '2025-12-02 11:04:58'),
	(2843, 87253, 'btc', '2025-12-02 11:06:58'),
	(2844, 87210, 'btc', '2025-12-02 11:08:58'),
	(2845, 87189, 'btc', '2025-12-02 11:10:59'),
	(2846, 87065, 'btc', '2025-12-02 11:12:59'),
	(2847, 87084, 'btc', '2025-12-02 11:14:59'),
	(2848, 87018, 'btc', '2025-12-02 11:17:00'),
	(2849, 87125, 'btc', '2025-12-02 11:19:01'),
	(2850, 87207, 'btc', '2025-12-02 11:21:01'),
	(2851, 87152, 'btc', '2025-12-02 11:23:02'),
	(2852, 87185, 'btc', '2025-12-02 11:25:02'),
	(2853, 87256, 'btc', '2025-12-02 11:27:02'),
	(2854, 87360, 'btc', '2025-12-02 11:29:03'),
	(2855, 87335, 'btc', '2025-12-02 11:31:03'),
	(2856, 87367, 'btc', '2025-12-02 11:33:03'),
	(2857, 87423, 'btc', '2025-12-02 11:35:03'),
	(2858, 87350, 'btc', '2025-12-02 11:37:04'),
	(2859, 87345, 'btc', '2025-12-02 11:39:04'),
	(2860, 87356, 'btc', '2025-12-02 11:41:04'),
	(2861, 87358, 'btc', '2025-12-02 11:43:05'),
	(2862, 87330, 'btc', '2025-12-02 11:45:05'),
	(2863, 87395, 'btc', '2025-12-02 11:47:05'),
	(2864, 87393, 'btc', '2025-12-02 11:49:06'),
	(2865, 87372, 'btc', '2025-12-02 11:51:06'),
	(2866, 87412, 'btc', '2025-12-02 11:53:06'),
	(2867, 87483, 'btc', '2025-12-02 11:55:07'),
	(2868, 87452, 'btc', '2025-12-02 11:57:07'),
	(2869, 87353, 'btc', '2025-12-02 11:59:07'),
	(2870, 87392, 'btc', '2025-12-02 12:01:07'),
	(2871, 87325, 'btc', '2025-12-02 12:03:08'),
	(2872, 87379, 'btc', '2025-12-02 12:05:08'),
	(2873, 87484, 'btc', '2025-12-02 12:07:08'),
	(2874, 87468, 'btc', '2025-12-02 12:08:03'),
	(2875, 87471, 'btc', '2025-12-02 12:10:03'),
	(2876, 87470, 'btc', '2025-12-02 12:12:03'),
	(2877, 87477, 'btc', '2025-12-02 12:14:03'),
	(2878, 87421, 'btc', '2025-12-02 12:16:04'),
	(2879, 87454, 'btc', '2025-12-02 12:18:04'),
	(2880, 87462, 'btc', '2025-12-02 12:20:04'),
	(2881, 87372, 'btc', '2025-12-02 12:22:05'),
	(2882, 87372, 'btc', '2025-12-02 12:24:05'),
	(2883, 87398, 'btc', '2025-12-02 12:26:05'),
	(2884, 87426, 'btc', '2025-12-02 12:28:06'),
	(2885, 87455, 'btc', '2025-12-02 12:30:06'),
	(2886, 87450, 'btc', '2025-12-02 12:32:07'),
	(2887, 87362, 'btc', '2025-12-02 12:34:07'),
	(2888, 87296, 'btc', '2025-12-02 12:36:07'),
	(2889, 87316, 'btc', '2025-12-02 12:38:08'),
	(2890, 87402, 'btc', '2025-12-02 12:40:08'),
	(2891, 87352, 'btc', '2025-12-02 12:42:08'),
	(2892, 87349, 'btc', '2025-12-02 12:44:09'),
	(2893, 87316, 'btc', '2025-12-02 12:46:09'),
	(2894, 87286, 'btc', '2025-12-02 12:48:09'),
	(2895, 87317, 'btc', '2025-12-02 12:50:09'),
	(2896, 87269, 'btc', '2025-12-02 12:52:10'),
	(2897, 87265, 'btc', '2025-12-02 12:54:10'),
	(2898, 87319, 'btc', '2025-12-02 12:56:11'),
	(2899, 87230, 'btc', '2025-12-02 12:58:11'),
	(2900, 87297, 'btc', '2025-12-02 13:00:11'),
	(2901, 87227, 'btc', '2025-12-02 13:02:11'),
	(2902, 87160, 'btc', '2025-12-02 13:04:12'),
	(2903, 87159, 'btc', '2025-12-02 13:06:12'),
	(2904, 87185, 'btc', '2025-12-02 13:08:12'),
	(2905, 87127, 'btc', '2025-12-02 13:10:13'),
	(2906, 87146, 'btc', '2025-12-02 13:12:13'),
	(2907, 87175, 'btc', '2025-12-02 13:14:14'),
	(2908, 87300, 'btc', '2025-12-02 13:16:14'),
	(2909, 87365, 'btc', '2025-12-02 13:18:14'),
	(2910, 87431, 'btc', '2025-12-02 13:20:15'),
	(2911, 87339, 'btc', '2025-12-02 13:22:15'),
	(2912, 87311, 'btc', '2025-12-02 13:24:16'),
	(2913, 87352, 'btc', '2025-12-02 13:26:16'),
	(2914, 87360, 'btc', '2025-12-02 13:28:16'),
	(2915, 87359, 'btc', '2025-12-02 13:30:17'),
	(2916, 87359, 'btc', '2025-12-02 13:32:17'),
	(2917, 87389, 'btc', '2025-12-02 13:34:17'),
	(2918, 87414, 'btc', '2025-12-02 13:36:17'),
	(2919, 87440, 'btc', '2025-12-02 13:38:18'),
	(2920, 87542, 'btc', '2025-12-02 13:40:18'),
	(2921, 87490, 'btc', '2025-12-02 13:42:18'),
	(2922, 87489, 'btc', '2025-12-02 13:44:19'),
	(2923, 87563, 'btc', '2025-12-02 13:46:19'),
	(2924, 87527, 'btc', '2025-12-02 13:48:19'),
	(2925, 87572, 'btc', '2025-12-02 13:50:19'),
	(2926, 87589, 'btc', '2025-12-02 13:52:20'),
	(2927, 87705, 'btc', '2025-12-02 13:54:21'),
	(2928, 87827, 'btc', '2025-12-02 13:56:21'),
	(2929, 87839, 'btc', '2025-12-02 13:58:21'),
	(2930, 87700, 'btc', '2025-12-02 14:00:21'),
	(2931, 87664, 'btc', '2025-12-02 14:02:22'),
	(2932, 87714, 'btc', '2025-12-02 14:04:23'),
	(2933, 87784, 'btc', '2025-12-02 14:06:23'),
	(2934, 88122, 'btc', '2025-12-02 14:08:23'),
	(2935, 88062, 'btc', '2025-12-02 14:10:23'),
	(2936, 88197, 'btc', '2025-12-02 14:12:24'),
	(2937, 88242, 'btc', '2025-12-02 14:14:24'),
	(2938, 88416, 'btc', '2025-12-02 14:16:24'),
	(2939, 88425, 'btc', '2025-12-02 14:18:25'),
	(2940, 88418, 'btc', '2025-12-02 14:20:25'),
	(2941, 88303, 'btc', '2025-12-02 14:22:25'),
	(2942, 88515, 'btc', '2025-12-02 14:24:26'),
	(2943, 88628, 'btc', '2025-12-02 14:26:26'),
	(2944, 88648, 'btc', '2025-12-02 14:28:26'),
	(2945, 88600, 'btc', '2025-12-02 14:30:27'),
	(2946, 88748, 'btc', '2025-12-02 14:32:27'),
	(2947, 88644, 'btc', '2025-12-02 14:34:27'),
	(2948, 88821, 'btc', '2025-12-02 14:36:27'),
	(2949, 88650, 'btc', '2025-12-02 14:38:28'),
	(2950, 88544, 'btc', '2025-12-02 14:40:28'),
	(2951, 88466, 'btc', '2025-12-02 14:42:28'),
	(2952, 88797, 'btc', '2025-12-02 14:44:29'),
	(2953, 88842, 'btc', '2025-12-02 14:46:29'),
	(2954, 89136, 'btc', '2025-12-02 14:48:30'),
	(2955, 89133, 'btc', '2025-12-02 14:50:30'),
	(2956, 89139, 'btc', '2025-12-02 14:52:30'),
	(2957, 88979, 'btc', '2025-12-02 14:54:31'),
	(2958, 89103, 'btc', '2025-12-02 14:56:31'),
	(2959, 89150, 'btc', '2025-12-02 14:58:31'),
	(2960, 89420, 'btc', '2025-12-02 15:00:32'),
	(2961, 89573, 'btc', '2025-12-02 15:02:32'),
	(2962, 90027, 'btc', '2025-12-02 15:04:32'),
	(2963, 90013, 'btc', '2025-12-02 15:06:33'),
	(2964, 90133, 'btc', '2025-12-02 15:08:33'),
	(2965, 90031, 'btc', '2025-12-02 15:10:33'),
	(2966, 90603, 'btc', '2025-12-02 15:12:33'),
	(2967, 90592, 'btc', '2025-12-02 15:14:34'),
	(2968, 90590, 'btc', '2025-12-02 15:16:34'),
	(2969, 90594, 'btc', '2025-12-02 15:18:34'),
	(2970, 90492, 'btc', '2025-12-02 15:20:35'),
	(2971, 90443, 'btc', '2025-12-02 15:22:35'),
	(2972, 90526, 'btc', '2025-12-02 15:24:35'),
	(2973, 90461, 'btc', '2025-12-02 15:26:35'),
	(2974, 90247, 'btc', '2025-12-02 15:28:36'),
	(2975, 90271, 'btc', '2025-12-02 15:30:36'),
	(2976, 90299, 'btc', '2025-12-02 15:32:36'),
	(2977, 90095, 'btc', '2025-12-02 15:34:37'),
	(2978, 90142, 'btc', '2025-12-02 15:36:37'),
	(2979, 90274, 'btc', '2025-12-02 15:38:38'),
	(2980, 90348, 'btc', '2025-12-02 15:40:38'),
	(2981, 90552, 'btc', '2025-12-02 15:42:38'),
	(2982, 90581, 'btc', '2025-12-02 15:44:38'),
	(2983, 90727, 'btc', '2025-12-02 15:46:39'),
	(2984, 90727, 'btc', '2025-12-02 15:48:39'),
	(2985, 90805, 'btc', '2025-12-02 15:50:39'),
	(2986, 91040, 'btc', '2025-12-02 15:52:40'),
	(2987, 91007, 'btc', '2025-12-02 15:54:40'),
	(2988, 90950, 'btc', '2025-12-02 15:56:40'),
	(2989, 90917, 'btc', '2025-12-02 15:58:41'),
	(2990, 91028, 'btc', '2025-12-02 16:00:41'),
	(2991, 91237, 'btc', '2025-12-02 16:02:42'),
	(2992, 91060, 'btc', '2025-12-02 16:04:42'),
	(2993, 91026, 'btc', '2025-12-02 16:06:42'),
	(2994, 91091, 'btc', '2025-12-02 16:08:43'),
	(2995, 90992, 'btc', '2025-12-02 16:10:44'),
	(2996, 90988, 'btc', '2025-12-02 16:12:44'),
	(2997, 90870, 'btc', '2025-12-02 16:14:45'),
	(2998, 90739, 'btc', '2025-12-02 16:16:45'),
	(2999, 90595, 'btc', '2025-12-02 16:18:45'),
	(3000, 90728, 'btc', '2025-12-02 16:20:46'),
	(3001, 90398, 'btc', '2025-12-02 16:22:46'),
	(3002, 90318, 'btc', '2025-12-02 16:24:46'),
	(3003, 90268, 'btc', '2025-12-02 16:26:47'),
	(3004, 90327, 'btc', '2025-12-02 16:28:47'),
	(3005, 90427, 'btc', '2025-12-02 16:30:47'),
	(3006, 90528, 'btc', '2025-12-02 16:32:48'),
	(3007, 90531, 'btc', '2025-12-02 16:34:48'),
	(3008, 90737, 'btc', '2025-12-02 16:36:48'),
	(3009, 90829, 'btc', '2025-12-02 16:38:49'),
	(3010, 90825, 'btc', '2025-12-02 16:40:49'),
	(3011, 90706, 'btc', '2025-12-02 16:42:49'),
	(3012, 90589, 'btc', '2025-12-02 16:44:50'),
	(3013, 90691, 'btc', '2025-12-02 16:46:50'),
	(3014, 90590, 'btc', '2025-12-02 16:48:50'),
	(3015, 90606, 'btc', '2025-12-02 16:50:50'),
	(3016, 90899, 'btc', '2025-12-02 16:52:51'),
	(3017, 90977, 'btc', '2025-12-02 16:54:52'),
	(3018, 91109, 'btc', '2025-12-02 16:56:52'),
	(3019, 90808, 'btc', '2025-12-02 16:58:52'),
	(3020, 90931, 'btc', '2025-12-02 17:00:53'),
	(3021, 90978, 'btc', '2025-12-02 17:02:53'),
	(3022, 90987, 'btc', '2025-12-02 17:04:53'),
	(3023, 90909, 'btc', '2025-12-02 17:06:54'),
	(3024, 90880, 'btc', '2025-12-02 17:08:13'),
	(3025, 90871, 'btc', '2025-12-02 17:10:13'),
	(3026, 91047, 'btc', '2025-12-02 17:12:14'),
	(3027, 90955, 'btc', '2025-12-02 17:14:14'),
	(3028, 91033, 'btc', '2025-12-02 17:16:14'),
	(3029, 91256, 'btc', '2025-12-02 17:18:15'),
	(3030, 91412, 'btc', '2025-12-02 17:20:15'),
	(3031, 91504, 'btc', '2025-12-02 17:22:15'),
	(3032, 91569, 'btc', '2025-12-02 17:24:16'),
	(3033, 91644, 'btc', '2025-12-02 17:26:16'),
	(3034, 91983, 'btc', '2025-12-02 17:28:16'),
	(3035, 91728, 'btc', '2025-12-02 17:30:16'),
	(3036, 91797, 'btc', '2025-12-02 17:32:17'),
	(3037, 91847, 'btc', '2025-12-02 17:34:17'),
	(3038, 91849, 'btc', '2025-12-02 17:36:17'),
	(3039, 91757, 'btc', '2025-12-02 17:38:18'),
	(3040, 91623, 'btc', '2025-12-02 17:40:18'),
	(3041, 91690, 'btc', '2025-12-02 17:42:18'),
	(3042, 91687, 'btc', '2025-12-02 17:44:19'),
	(3043, 91544, 'btc', '2025-12-02 17:46:19'),
	(3044, 91566, 'btc', '2025-12-02 17:48:20'),
	(3045, 91600, 'btc', '2025-12-02 17:50:20'),
	(3046, 91506, 'btc', '2025-12-02 17:52:20'),
	(3047, 91573, 'btc', '2025-12-02 17:54:21'),
	(3048, 91523, 'btc', '2025-12-02 17:56:21'),
	(3049, 91450, 'btc', '2025-12-02 17:58:21'),
	(3050, 91478, 'btc', '2025-12-02 18:00:22'),
	(3051, 91541, 'btc', '2025-12-02 18:02:22'),
	(3052, 91660, 'btc', '2025-12-02 18:04:22'),
	(3053, 91633, 'btc', '2025-12-02 18:06:22'),
	(3054, 91683, 'btc', '2025-12-02 18:08:23'),
	(3055, 91710, 'btc', '2025-12-02 18:10:23'),
	(3056, 91754, 'btc', '2025-12-02 18:12:23'),
	(3057, 91724, 'btc', '2025-12-02 18:14:24'),
	(3058, 91870, 'btc', '2025-12-02 18:16:24'),
	(3059, 91949, 'btc', '2025-12-02 18:18:24'),
	(3060, 91958, 'btc', '2025-12-02 18:20:24'),
	(3061, 92074, 'btc', '2025-12-02 18:22:25'),
	(3062, 92059, 'btc', '2025-12-02 18:24:25'),
	(3063, 91859, 'btc', '2025-12-02 18:26:25'),
	(3064, 91867, 'btc', '2025-12-02 18:28:26'),
	(3065, 91930, 'btc', '2025-12-02 18:30:26'),
	(3066, 92097, 'btc', '2025-12-02 18:32:26'),
	(3067, 91992, 'btc', '2025-12-02 18:34:27'),
	(3068, 92179, 'btc', '2025-12-02 18:36:27'),
	(3069, 92073, 'btc', '2025-12-02 18:38:27'),
	(3070, 91869, 'btc', '2025-12-02 18:40:27'),
	(3071, 91940, 'btc', '2025-12-02 18:42:28'),
	(3072, 91973, 'btc', '2025-12-02 18:44:28'),
	(3073, 91971, 'btc', '2025-12-02 18:46:28'),
	(3074, 92033, 'btc', '2025-12-02 18:48:29'),
	(3075, 91925, 'btc', '2025-12-02 18:50:29'),
	(3076, 91905, 'btc', '2025-12-02 18:52:29'),
	(3077, 91930, 'btc', '2025-12-02 18:54:30'),
	(3078, 91861, 'btc', '2025-12-02 18:56:30'),
	(3079, 91825, 'btc', '2025-12-02 18:58:30'),
	(3080, 91985, 'btc', '2025-12-02 19:00:30'),
	(3081, 92098, 'btc', '2025-12-02 19:02:31'),
	(3082, 92210, 'btc', '2025-12-02 19:04:31'),
	(3083, 92076, 'btc', '2025-12-02 19:06:31'),
	(3084, 92047, 'btc', '2025-12-02 19:08:32'),
	(3085, 92174, 'btc', '2025-12-02 19:10:32'),
	(3086, 92141, 'btc', '2025-12-02 19:12:32'),
	(3087, 92020, 'btc', '2025-12-02 19:14:33'),
	(3088, 92032, 'btc', '2025-12-02 19:16:33'),
	(3089, 92099, 'btc', '2025-12-02 19:18:33'),
	(3090, 92023, 'btc', '2025-12-02 19:20:34'),
	(3091, 91942, 'btc', '2025-12-02 19:22:34'),
	(3092, 91915, 'btc', '2025-12-02 19:24:34'),
	(3093, 91976, 'btc', '2025-12-02 19:26:34'),
	(3094, 92057, 'btc', '2025-12-02 19:28:35'),
	(3095, 92046, 'btc', '2025-12-02 19:30:35'),
	(3096, 91992, 'btc', '2025-12-02 19:32:35'),
	(3097, 92109, 'btc', '2025-12-02 19:34:36'),
	(3098, 92152, 'btc', '2025-12-02 19:36:36'),
	(3099, 92089, 'btc', '2025-12-02 19:47:57'),
	(3100, 92025, 'btc', '2025-12-02 19:49:57'),
	(3101, 92044, 'btc', '2025-12-02 19:51:48'),
	(3102, 91946, 'btc', '2025-12-02 19:53:49'),
	(3103, 91966, 'btc', '2025-12-02 19:55:49'),
	(3104, 91895, 'btc', '2025-12-02 19:57:49'),
	(3105, 91886, 'btc', '2025-12-02 19:59:49'),
	(3106, 91779, 'btc', '2025-12-02 20:01:50'),
	(3107, 91725, 'btc', '2025-12-02 20:03:50'),
	(3108, 91740, 'btc', '2025-12-02 20:05:50'),
	(3109, 91800, 'btc', '2025-12-02 20:07:51'),
	(3110, 91878, 'btc', '2025-12-02 20:09:51'),
	(3111, 91730, 'btc', '2025-12-02 20:11:51'),
	(3112, 91596, 'btc', '2025-12-02 20:13:52'),
	(3113, 91503, 'btc', '2025-12-02 20:15:52'),
	(3114, 91389, 'btc', '2025-12-02 20:17:52'),
	(3115, 91270, 'btc', '2025-12-02 20:19:53'),
	(3116, 91316, 'btc', '2025-12-02 20:21:53'),
	(3117, 91262, 'btc', '2025-12-02 20:23:53'),
	(3118, 91334, 'btc', '2025-12-02 20:25:54'),
	(3119, 91383, 'btc', '2025-12-02 20:27:54'),
	(3120, 90978, 'btc', '2025-12-02 20:29:54'),
	(3121, 91033, 'btc', '2025-12-02 20:31:55'),
	(3122, 91080, 'btc', '2025-12-02 20:33:55'),
	(3123, 90966, 'btc', '2025-12-02 20:35:55'),
	(3124, 90862, 'btc', '2025-12-02 20:37:55'),
	(3125, 90736, 'btc', '2025-12-02 20:39:56'),
	(3126, 90867, 'btc', '2025-12-02 20:41:56'),
	(3127, 90882, 'btc', '2025-12-02 20:43:56'),
	(3128, 90990, 'btc', '2025-12-02 20:45:57'),
	(3129, 91059, 'btc', '2025-12-02 20:47:57'),
	(3130, 90949, 'btc', '2025-12-02 20:49:57'),
	(3131, 91016, 'btc', '2025-12-02 20:51:58'),
	(3132, 91033, 'btc', '2025-12-02 20:53:58'),
	(3133, 90947, 'btc', '2025-12-02 20:55:58'),
	(3134, 91021, 'btc', '2025-12-02 20:57:59'),
	(3135, 91023, 'btc', '2025-12-02 20:59:59'),
	(3136, 91075, 'btc', '2025-12-02 21:01:59'),
	(3137, 91142, 'btc', '2025-12-02 21:04:00'),
	(3138, 91236, 'btc', '2025-12-02 21:06:00'),
	(3139, 91271, 'btc', '2025-12-02 21:08:00'),
	(3140, 91237, 'btc', '2025-12-02 21:10:00'),
	(3141, 91185, 'btc', '2025-12-02 21:12:01'),
	(3142, 91196, 'btc', '2025-12-02 21:14:01'),
	(3143, 91226, 'btc', '2025-12-02 21:16:01'),
	(3144, 91226, 'btc', '2025-12-02 21:18:02'),
	(3145, 91220, 'btc', '2025-12-02 21:20:02'),
	(3146, 91312, 'btc', '2025-12-02 21:22:02'),
	(3147, 91274, 'btc', '2025-12-02 21:24:03'),
	(3148, 91282, 'btc', '2025-12-02 21:26:03'),
	(3149, 91413, 'btc', '2025-12-02 21:28:03'),
	(3150, 91442, 'btc', '2025-12-02 21:30:04'),
	(3151, 91486, 'btc', '2025-12-02 21:32:04'),
	(3152, 91391, 'btc', '2025-12-02 21:34:04'),
	(3153, 91317, 'btc', '2025-12-02 21:36:05'),
	(3154, 91433, 'btc', '2025-12-02 21:38:05'),
	(3155, 91401, 'btc', '2025-12-02 21:40:05'),
	(3156, 91460, 'btc', '2025-12-02 21:42:05'),
	(3157, 91470, 'btc', '2025-12-02 21:44:06'),
	(3158, 91488, 'btc', '2025-12-02 21:46:06'),
	(3159, 91500, 'btc', '2025-12-02 21:48:06'),
	(3160, 91479, 'btc', '2025-12-02 21:50:07'),
	(3161, 91600, 'btc', '2025-12-02 21:52:07'),
	(3162, 91610, 'btc', '2025-12-02 21:54:07'),
	(3163, 91563, 'btc', '2025-12-02 21:56:08'),
	(3164, 91574, 'btc', '2025-12-02 21:58:08'),
	(3165, 91583, 'btc', '2025-12-02 22:00:08'),
	(3166, 91669, 'btc', '2025-12-02 22:02:09'),
	(3167, 91777, 'btc', '2025-12-02 22:04:09'),
	(3168, 91838, 'btc', '2025-12-02 22:06:09'),
	(3169, 91584, 'btc', '2025-12-02 22:08:10'),
	(3170, 91551, 'btc', '2025-12-02 22:10:10'),
	(3171, 91716, 'btc', '2025-12-02 22:12:10'),
	(3172, 91817, 'btc', '2025-12-02 22:14:11'),
	(3173, 91836, 'btc', '2025-12-02 22:16:11'),
	(3174, 91805, 'btc', '2025-12-02 22:18:11'),
	(3175, 91792, 'btc', '2025-12-02 22:20:12'),
	(3176, 91720, 'btc', '2025-12-02 22:22:12'),
	(3177, 91704, 'btc', '2025-12-02 22:24:12'),
	(3178, 91741, 'btc', '2025-12-02 22:26:13'),
	(3179, 91704, 'btc', '2025-12-02 22:28:13'),
	(3180, 91614, 'btc', '2025-12-02 22:30:13'),
	(3181, 91589, 'btc', '2025-12-02 22:32:14'),
	(3182, 91638, 'btc', '2025-12-02 22:34:14'),
	(3183, 91712, 'btc', '2025-12-02 22:36:14'),
	(3184, 91679, 'btc', '2025-12-02 22:38:15'),
	(3185, 91660, 'btc', '2025-12-02 22:40:15'),
	(3186, 91906, 'btc', '2025-12-02 22:42:15'),
	(3187, 91828, 'btc', '2025-12-02 22:44:16'),
	(3188, 91707, 'btc', '2025-12-02 22:46:16'),
	(3189, 91800, 'btc', '2025-12-02 22:48:16'),
	(3190, 91855, 'btc', '2025-12-02 22:50:16'),
	(3191, 91860, 'btc', '2025-12-02 22:52:17'),
	(3192, 91912, 'btc', '2025-12-02 22:54:17'),
	(3193, 91947, 'btc', '2025-12-02 22:56:17'),
	(3194, 91949, 'btc', '2025-12-02 22:58:18'),
	(3195, 91956, 'btc', '2025-12-02 23:00:19'),
	(3196, 91896, 'btc', '2025-12-02 23:02:19'),
	(3197, 91946, 'btc', '2025-12-02 23:04:19'),
	(3198, 91866, 'btc', '2025-12-02 23:06:19'),
	(3199, 91839, 'btc', '2025-12-02 23:08:20'),
	(3200, 91888, 'btc', '2025-12-02 23:10:20'),
	(3201, 91917, 'btc', '2025-12-02 23:12:20'),
	(3202, 91862, 'btc', '2025-12-02 23:14:21'),
	(3203, 91870, 'btc', '2025-12-02 23:16:21'),
	(3204, 91866, 'btc', '2025-12-02 23:18:21'),
	(3205, 91824, 'btc', '2025-12-02 23:20:22'),
	(3206, 91768, 'btc', '2025-12-02 23:22:22'),
	(3207, 91734, 'btc', '2025-12-02 23:24:22'),
	(3208, 91667, 'btc', '2025-12-02 23:26:23'),
	(3209, 91650, 'btc', '2025-12-02 23:28:23'),
	(3210, 91674, 'btc', '2025-12-02 23:30:23'),
	(3211, 91605, 'btc', '2025-12-02 23:32:23'),
	(3212, 91481, 'btc', '2025-12-02 23:34:24'),
	(3213, 91527, 'btc', '2025-12-02 23:36:24'),
	(3214, 91469, 'btc', '2025-12-02 23:38:24'),
	(3215, 91436, 'btc', '2025-12-02 23:40:25'),
	(3216, 91455, 'btc', '2025-12-02 23:42:25'),
	(3217, 91440, 'btc', '2025-12-02 23:44:25'),
	(3218, 91400, 'btc', '2025-12-02 23:46:25'),
	(3219, 91348, 'btc', '2025-12-02 23:48:26'),
	(3220, 91384, 'btc', '2025-12-02 23:50:26'),
	(3221, 91396, 'btc', '2025-12-02 23:52:26'),
	(3222, 91328, 'btc', '2025-12-02 23:54:27'),
	(3223, 91350, 'btc', '2025-12-02 23:56:27'),
	(3224, 91308, 'btc', '2025-12-02 23:58:27'),
	(3225, 91338, 'btc', '2025-12-03 00:00:28'),
	(3226, 91314, 'btc', '2025-12-03 00:02:28'),
	(3227, 91259, 'btc', '2025-12-03 00:04:28'),
	(3228, 91191, 'btc', '2025-12-03 00:06:29'),
	(3229, 91327, 'btc', '2025-12-03 00:08:29'),
	(3230, 91500, 'btc', '2025-12-03 00:10:30'),
	(3231, 91410, 'btc', '2025-12-03 00:12:30'),
	(3232, 91318, 'btc', '2025-12-03 00:14:30'),
	(3233, 91357, 'btc', '2025-12-03 00:16:31'),
	(3234, 91362, 'btc', '2025-12-03 00:18:31'),
	(3235, 91389, 'btc', '2025-12-03 00:20:31'),
	(3236, 91368, 'btc', '2025-12-03 00:22:32'),
	(3237, 91367, 'btc', '2025-12-03 00:24:32'),
	(3238, 91155, 'btc', '2025-12-03 00:26:32'),
	(3239, 91174, 'btc', '2025-12-03 00:28:33'),
	(3240, 91122, 'btc', '2025-12-03 00:30:33'),
	(3241, 91041, 'btc', '2025-12-03 00:32:33'),
	(3242, 91120, 'btc', '2025-12-03 00:34:33'),
	(3243, 91058, 'btc', '2025-12-03 00:36:34'),
	(3244, 91159, 'btc', '2025-12-03 00:38:34'),
	(3245, 91171, 'btc', '2025-12-03 00:40:34'),
	(3246, 91316, 'btc', '2025-12-03 00:42:35'),
	(3247, 91424, 'btc', '2025-12-03 00:44:35'),
	(3248, 91499, 'btc', '2025-12-03 00:46:36'),
	(3249, 91597, 'btc', '2025-12-03 00:48:36'),
	(3250, 91676, 'btc', '2025-12-03 00:50:36'),
	(3251, 91705, 'btc', '2025-12-03 00:52:37'),
	(3252, 91575, 'btc', '2025-12-03 00:54:37'),
	(3253, 91436, 'btc', '2025-12-03 00:56:37'),
	(3254, 91534, 'btc', '2025-12-03 00:58:38'),
	(3255, 91680, 'btc', '2025-12-03 01:00:38'),
	(3256, 91608, 'btc', '2025-12-03 01:02:38'),
	(3257, 91509, 'btc', '2025-12-03 01:04:38'),
	(3258, 91536, 'btc', '2025-12-03 01:06:39'),
	(3259, 91641, 'btc', '2025-12-03 01:08:39'),
	(3260, 91660, 'btc', '2025-12-03 01:10:39'),
	(3261, 91734, 'btc', '2025-12-03 01:12:40'),
	(3262, 91750, 'btc', '2025-12-03 01:14:40'),
	(3263, 91649, 'btc', '2025-12-03 01:16:41'),
	(3264, 91768, 'btc', '2025-12-03 01:18:41'),
	(3265, 91916, 'btc', '2025-12-03 01:20:42'),
	(3266, 91879, 'btc', '2025-12-03 01:22:42'),
	(3267, 91920, 'btc', '2025-12-03 01:24:43'),
	(3268, 91945, 'btc', '2025-12-03 01:26:43'),
	(3269, 91878, 'btc', '2025-12-03 01:28:43'),
	(3270, 91937, 'btc', '2025-12-03 01:30:43'),
	(3271, 91923, 'btc', '2025-12-03 01:32:44'),
	(3272, 92017, 'btc', '2025-12-03 01:34:44'),
	(3273, 91930, 'btc', '2025-12-03 01:36:44'),
	(3274, 91903, 'btc', '2025-12-03 01:38:45'),
	(3275, 91906, 'btc', '2025-12-03 01:40:45'),
	(3276, 91943, 'btc', '2025-12-03 01:42:45'),
	(3277, 91949, 'btc', '2025-12-03 01:44:45'),
	(3278, 92000, 'btc', '2025-12-03 01:46:46'),
	(3279, 92157, 'btc', '2025-12-03 01:48:46'),
	(3280, 92312, 'btc', '2025-12-03 01:50:46'),
	(3281, 92267, 'btc', '2025-12-03 01:52:47'),
	(3282, 92356, 'btc', '2025-12-03 01:54:47'),
	(3283, 92264, 'btc', '2025-12-03 01:56:47'),
	(3284, 92166, 'btc', '2025-12-03 01:58:47'),
	(3285, 92243, 'btc', '2025-12-03 02:00:48'),
	(3286, 92321, 'btc', '2025-12-03 02:02:48'),
	(3287, 92661, 'btc', '2025-12-03 02:04:48'),
	(3288, 92241, 'btc', '2025-12-03 02:06:49'),
	(3289, 92292, 'btc', '2025-12-03 02:08:49'),
	(3290, 92431, 'btc', '2025-12-03 02:10:49'),
	(3291, 92626, 'btc', '2025-12-03 02:12:49'),
	(3292, 92885, 'btc', '2025-12-03 02:14:50'),
	(3293, 92816, 'btc', '2025-12-03 02:16:50'),
	(3294, 92731, 'btc', '2025-12-03 02:18:50'),
	(3295, 92699, 'btc', '2025-12-03 02:20:50'),
	(3296, 92676, 'btc', '2025-12-03 02:22:51'),
	(3297, 92904, 'btc', '2025-12-03 02:24:51'),
	(3298, 92932, 'btc', '2025-12-03 02:26:51'),
	(3299, 92836, 'btc', '2025-12-03 02:28:52'),
	(3300, 92667, 'btc', '2025-12-03 02:30:52'),
	(3301, 92747, 'btc', '2025-12-03 02:32:53'),
	(3302, 92680, 'btc', '2025-12-03 02:34:53'),
	(3303, 92679, 'btc', '2025-12-03 02:36:53'),
	(3304, 92734, 'btc', '2025-12-03 02:38:54'),
	(3305, 92650, 'btc', '2025-12-03 02:40:54'),
	(3306, 92744, 'btc', '2025-12-03 02:42:54'),
	(3307, 92658, 'btc', '2025-12-03 02:44:55'),
	(3308, 92394, 'btc', '2025-12-03 02:46:55'),
	(3309, 92562, 'btc', '2025-12-03 02:48:55'),
	(3310, 92512, 'btc', '2025-12-03 02:50:56'),
	(3311, 92586, 'btc', '2025-12-03 02:52:56'),
	(3312, 92667, 'btc', '2025-12-03 02:54:57'),
	(3313, 92826, 'btc', '2025-12-03 02:56:57'),
	(3314, 92786, 'btc', '2025-12-03 02:58:57'),
	(3315, 92745, 'btc', '2025-12-03 03:00:58'),
	(3316, 92953, 'btc', '2025-12-03 03:02:58'),
	(3317, 92770, 'btc', '2025-12-03 03:04:58'),
	(3318, 92705, 'btc', '2025-12-03 03:06:59'),
	(3319, 92680, 'btc', '2025-12-03 03:08:59'),
	(3320, 92764, 'btc', '2025-12-03 03:10:59'),
	(3321, 92747, 'btc', '2025-12-03 03:13:00'),
	(3322, 92764, 'btc', '2025-12-03 03:15:00'),
	(3323, 92680, 'btc', '2025-12-03 03:17:00'),
	(3324, 92812, 'btc', '2025-12-03 03:19:01'),
	(3325, 92712, 'btc', '2025-12-03 03:21:01'),
	(3326, 92725, 'btc', '2025-12-03 03:23:01'),
	(3327, 92723, 'btc', '2025-12-03 03:25:02'),
	(3328, 92770, 'btc', '2025-12-03 03:27:02'),
	(3329, 92816, 'btc', '2025-12-03 03:29:02'),
	(3330, 92728, 'btc', '2025-12-03 03:31:03'),
	(3331, 92782, 'btc', '2025-12-03 03:33:03'),
	(3332, 92752, 'btc', '2025-12-03 03:35:03'),
	(3333, 92738, 'btc', '2025-12-03 03:37:03'),
	(3334, 92746, 'btc', '2025-12-03 03:39:04'),
	(3335, 92713, 'btc', '2025-12-03 03:41:04'),
	(3336, 92760, 'btc', '2025-12-03 03:43:04'),
	(3337, 92731, 'btc', '2025-12-03 03:45:05'),
	(3338, 92777, 'btc', '2025-12-03 03:47:05'),
	(3339, 92772, 'btc', '2025-12-03 03:49:05'),
	(3340, 92714, 'btc', '2025-12-03 03:51:05'),
	(3341, 92784, 'btc', '2025-12-03 03:53:06'),
	(3342, 92719, 'btc', '2025-12-03 03:55:06'),
	(3343, 92735, 'btc', '2025-12-03 03:57:06'),
	(3344, 92682, 'btc', '2025-12-03 03:59:07'),
	(3345, 92682, 'btc', '2025-12-03 04:01:07'),
	(3346, 92665, 'btc', '2025-12-03 04:03:07'),
	(3347, 92780, 'btc', '2025-12-03 04:05:08'),
	(3348, 92772, 'btc', '2025-12-03 04:07:08'),
	(3349, 92800, 'btc', '2025-12-03 04:09:08'),
	(3350, 92942, 'btc', '2025-12-03 04:11:08'),
	(3351, 92968, 'btc', '2025-12-03 04:13:09'),
	(3352, 92829, 'btc', '2025-12-03 04:15:09'),
	(3353, 92856, 'btc', '2025-12-03 04:17:09'),
	(3354, 92876, 'btc', '2025-12-03 04:19:10'),
	(3355, 92917, 'btc', '2025-12-03 04:21:10'),
	(3356, 92959, 'btc', '2025-12-03 04:23:10'),
	(3357, 92981, 'btc', '2025-12-03 04:25:11'),
	(3358, 93031, 'btc', '2025-12-03 04:27:11'),
	(3359, 92876, 'btc', '2025-12-03 04:29:11'),
	(3360, 92969, 'btc', '2025-12-03 04:31:11'),
	(3361, 93010, 'btc', '2025-12-03 04:33:12'),
	(3362, 93114, 'btc', '2025-12-03 04:35:12'),
	(3363, 92938, 'btc', '2025-12-03 04:37:12'),
	(3364, 93010, 'btc', '2025-12-03 04:39:13'),
	(3365, 92978, 'btc', '2025-12-03 04:41:13'),
	(3366, 92950, 'btc', '2025-12-03 04:43:13'),
	(3367, 92939, 'btc', '2025-12-03 04:45:14'),
	(3368, 92952, 'btc', '2025-12-03 04:47:14'),
	(3369, 93029, 'btc', '2025-12-03 04:49:14'),
	(3370, 93057, 'btc', '2025-12-03 04:51:14'),
	(3371, 93129, 'btc', '2025-12-03 04:53:15'),
	(3372, 93183, 'btc', '2025-12-03 04:55:15'),
	(3373, 93118, 'btc', '2025-12-03 04:57:15'),
	(3374, 93380, 'btc', '2025-12-03 04:59:16'),
	(3375, 93385, 'btc', '2025-12-03 05:01:16'),
	(3376, 93267, 'btc', '2025-12-03 05:03:16'),
	(3377, 93298, 'btc', '2025-12-03 05:05:16'),
	(3378, 93510, 'btc', '2025-12-03 05:07:17'),
	(3379, 93510, 'btc', '2025-12-03 05:09:18'),
	(3380, 93353, 'btc', '2025-12-03 05:11:18'),
	(3381, 93310, 'btc', '2025-12-03 05:13:18'),
	(3382, 93271, 'btc', '2025-12-03 05:15:18'),
	(3383, 93287, 'btc', '2025-12-03 05:17:19'),
	(3384, 93261, 'btc', '2025-12-03 05:19:19'),
	(3385, 93157, 'btc', '2025-12-03 05:21:19'),
	(3386, 93265, 'btc', '2025-12-03 05:23:20'),
	(3387, 93309, 'btc', '2025-12-03 05:25:20'),
	(3388, 93353, 'btc', '2025-12-03 05:27:20'),
	(3389, 93314, 'btc', '2025-12-03 05:29:21'),
	(3390, 93254, 'btc', '2025-12-03 05:31:21'),
	(3391, 93360, 'btc', '2025-12-03 05:33:21'),
	(3392, 93362, 'btc', '2025-12-03 05:35:22'),
	(3393, 93432, 'btc', '2025-12-03 05:37:22'),
	(3394, 93550, 'btc', '2025-12-03 05:39:22'),
	(3395, 93577, 'btc', '2025-12-03 05:41:23'),
	(3396, 93492, 'btc', '2025-12-03 05:43:23'),
	(3397, 93436, 'btc', '2025-12-03 05:45:23'),
	(3398, 93472, 'btc', '2025-12-03 05:47:24'),
	(3399, 93554, 'btc', '2025-12-03 05:49:24'),
	(3400, 93600, 'btc', '2025-12-03 05:51:24'),
	(3401, 93512, 'btc', '2025-12-03 05:53:25'),
	(3402, 93580, 'btc', '2025-12-03 05:55:25'),
	(3403, 93629, 'btc', '2025-12-03 05:57:25'),
	(3404, 93650, 'btc', '2025-12-03 05:59:25'),
	(3405, 93694, 'btc', '2025-12-03 06:01:26'),
	(3406, 93776, 'btc', '2025-12-03 06:03:26'),
	(3407, 93822, 'btc', '2025-12-03 06:05:26'),
	(3408, 93749, 'btc', '2025-12-03 06:07:27'),
	(3409, 93793, 'btc', '2025-12-03 06:09:27'),
	(3410, 93755, 'btc', '2025-12-03 06:11:27'),
	(3411, 93703, 'btc', '2025-12-03 06:13:28'),
	(3412, 93714, 'btc', '2025-12-03 06:15:28'),
	(3413, 93813, 'btc', '2025-12-03 06:17:28'),
	(3414, 93870, 'btc', '2025-12-03 06:19:28'),
	(3415, 93798, 'btc', '2025-12-03 06:21:29'),
	(3416, 93897, 'btc', '2025-12-03 06:23:29'),
	(3417, 93916, 'btc', '2025-12-03 06:25:29'),
	(3418, 93899, 'btc', '2025-12-03 06:27:30'),
	(3419, 93928, 'btc', '2025-12-03 06:29:30'),
	(3420, 93887, 'btc', '2025-12-03 06:31:30'),
	(3421, 93832, 'btc', '2025-12-03 06:33:31'),
	(3422, 93793, 'btc', '2025-12-03 06:35:31'),
	(3423, 93891, 'btc', '2025-12-03 06:37:31'),
	(3424, 93767, 'btc', '2025-12-03 06:39:31'),
	(3425, 93582, 'btc', '2025-12-03 06:41:32'),
	(3426, 93553, 'btc', '2025-12-03 06:43:32'),
	(3427, 93208, 'btc', '2025-12-03 06:45:32'),
	(3428, 93182, 'btc', '2025-12-03 06:47:33'),
	(3429, 93229, 'btc', '2025-12-03 06:49:33'),
	(3430, 93264, 'btc', '2025-12-03 06:51:33'),
	(3431, 93294, 'btc', '2025-12-03 06:53:34'),
	(3432, 93304, 'btc', '2025-12-03 06:55:34'),
	(3433, 93387, 'btc', '2025-12-03 06:57:34'),
	(3434, 93426, 'btc', '2025-12-03 06:59:34'),
	(3435, 93371, 'btc', '2025-12-03 07:01:35'),
	(3436, 93377, 'btc', '2025-12-03 07:03:35'),
	(3437, 93359, 'btc', '2025-12-03 07:05:35'),
	(3438, 93323, 'btc', '2025-12-03 07:07:36'),
	(3439, 93285, 'btc', '2025-12-03 07:09:36'),
	(3440, 93298, 'btc', '2025-12-03 07:11:36'),
	(3441, 93226, 'btc', '2025-12-03 07:13:37'),
	(3442, 93148, 'btc', '2025-12-03 07:15:37'),
	(3443, 92975, 'btc', '2025-12-03 07:17:37'),
	(3444, 92910, 'btc', '2025-12-03 07:19:38'),
	(3445, 93047, 'btc', '2025-12-03 07:21:38'),
	(3446, 93027, 'btc', '2025-12-03 07:23:38'),
	(3447, 93126, 'btc', '2025-12-03 07:25:39'),
	(3448, 93120, 'btc', '2025-12-03 07:27:39'),
	(3449, 93023, 'btc', '2025-12-03 07:29:39'),
	(3450, 93019, 'btc', '2025-12-03 07:31:40'),
	(3451, 93049, 'btc', '2025-12-03 07:33:40'),
	(3452, 93042, 'btc', '2025-12-03 07:35:40'),
	(3453, 92984, 'btc', '2025-12-03 07:37:40'),
	(3454, 93019, 'btc', '2025-12-03 07:39:41'),
	(3455, 93066, 'btc', '2025-12-03 07:41:41'),
	(3456, 93079, 'btc', '2025-12-03 07:43:41'),
	(3457, 93021, 'btc', '2025-12-03 07:45:42'),
	(3458, 92953, 'btc', '2025-12-03 07:47:42'),
	(3459, 92995, 'btc', '2025-12-03 07:49:42'),
	(3460, 92984, 'btc', '2025-12-03 07:51:43'),
	(3461, 92958, 'btc', '2025-12-03 07:53:43'),
	(3462, 93024, 'btc', '2025-12-03 07:55:44'),
	(3463, 92988, 'btc', '2025-12-03 07:57:44'),
	(3464, 92980, 'btc', '2025-12-03 07:59:44'),
	(3465, 93008, 'btc', '2025-12-03 08:01:45'),
	(3466, 93064, 'btc', '2025-12-03 08:03:45'),
	(3467, 93164, 'btc', '2025-12-03 08:05:46'),
	(3468, 92972, 'btc', '2025-12-03 08:07:46'),
	(3469, 92928, 'btc', '2025-12-03 08:09:46'),
	(3470, 93029, 'btc', '2025-12-03 08:11:47'),
	(3471, 93019, 'btc', '2025-12-03 08:13:47'),
	(3472, 92971, 'btc', '2025-12-03 08:15:47'),
	(3473, 92861, 'btc', '2025-12-03 08:17:48'),
	(3474, 92856, 'btc', '2025-12-03 08:19:48'),
	(3475, 92903, 'btc', '2025-12-03 08:21:48'),
	(3476, 92871, 'btc', '2025-12-03 08:23:48'),
	(3477, 92870, 'btc', '2025-12-03 08:25:49'),
	(3478, 92889, 'btc', '2025-12-03 08:27:49'),
	(3479, 92900, 'btc', '2025-12-03 08:29:49'),
	(3480, 92995, 'btc', '2025-12-03 08:31:50'),
	(3481, 92903, 'btc', '2025-12-03 08:33:50'),
	(3482, 92845, 'btc', '2025-12-03 08:35:50'),
	(3483, 92899, 'btc', '2025-12-03 08:37:50'),
	(3484, 92783, 'btc', '2025-12-03 08:39:51'),
	(3485, 92837, 'btc', '2025-12-03 08:41:51'),
	(3486, 92825, 'btc', '2025-12-03 08:43:52'),
	(3487, 92883, 'btc', '2025-12-03 08:45:52'),
	(3488, 92860, 'btc', '2025-12-03 08:47:52'),
	(3489, 92812, 'btc', '2025-12-03 08:49:52'),
	(3490, 92823, 'btc', '2025-12-03 08:51:53'),
	(3491, 92738, 'btc', '2025-12-03 08:53:53'),
	(3492, 92731, 'btc', '2025-12-03 08:55:54'),
	(3493, 92700, 'btc', '2025-12-03 08:57:54'),
	(3494, 92784, 'btc', '2025-12-03 08:59:54'),
	(3495, 92808, 'btc', '2025-12-03 09:01:55'),
	(3496, 92852, 'btc', '2025-12-03 09:03:55'),
	(3497, 92827, 'btc', '2025-12-03 09:05:55'),
	(3498, 92772, 'btc', '2025-12-03 09:07:56'),
	(3499, 92805, 'btc', '2025-12-03 09:09:56'),
	(3500, 92838, 'btc', '2025-12-03 09:11:56'),
	(3501, 92919, 'btc', '2025-12-03 09:13:56'),
	(3502, 92885, 'btc', '2025-12-03 09:15:57'),
	(3503, 92887, 'btc', '2025-12-03 09:17:57'),
	(3504, 92905, 'btc', '2025-12-03 09:19:57'),
	(3505, 92887, 'btc', '2025-12-03 09:21:58'),
	(3506, 92935, 'btc', '2025-12-03 09:23:58'),
	(3507, 92908, 'btc', '2025-12-03 09:25:58'),
	(3508, 92902, 'btc', '2025-12-03 09:27:59'),
	(3509, 92934, 'btc', '2025-12-03 09:29:59'),
	(3510, 92888, 'btc', '2025-12-03 09:31:59'),
	(3511, 92872, 'btc', '2025-12-03 09:33:59'),
	(3512, 92886, 'btc', '2025-12-03 09:36:00'),
	(3513, 92880, 'btc', '2025-12-03 09:38:00'),
	(3514, 92930, 'btc', '2025-12-03 09:40:00'),
	(3515, 92947, 'btc', '2025-12-03 09:42:01'),
	(3516, 92874, 'btc', '2025-12-03 09:44:01'),
	(3517, 92910, 'btc', '2025-12-03 09:46:01'),
	(3518, 92920, 'btc', '2025-12-03 09:48:02'),
	(3519, 92949, 'btc', '2025-12-03 09:50:02'),
	(3520, 92977, 'btc', '2025-12-03 09:52:02'),
	(3521, 93111, 'btc', '2025-12-03 09:54:03'),
	(3522, 93162, 'btc', '2025-12-03 09:56:03'),
	(3523, 93142, 'btc', '2025-12-03 09:58:03'),
	(3524, 93178, 'btc', '2025-12-03 10:00:04'),
	(3525, 93146, 'btc', '2025-12-03 10:02:04'),
	(3526, 93027, 'btc', '2025-12-03 10:04:04'),
	(3527, 93077, 'btc', '2025-12-03 10:06:05'),
	(3528, 93103, 'btc', '2025-12-03 10:08:05'),
	(3529, 93128, 'btc', '2025-12-03 10:10:05'),
	(3530, 93171, 'btc', '2025-12-03 10:12:05'),
	(3531, 93136, 'btc', '2025-12-03 10:14:06'),
	(3532, 93137, 'btc', '2025-12-03 10:16:06'),
	(3533, 93190, 'btc', '2025-12-03 10:18:06'),
	(3534, 93202, 'btc', '2025-12-03 10:20:07'),
	(3535, 93302, 'btc', '2025-12-03 10:22:07'),
	(3536, 93378, 'btc', '2025-12-03 10:24:07'),
	(3537, 93332, 'btc', '2025-12-03 10:26:07'),
	(3538, 93191, 'btc', '2025-12-03 10:28:08'),
	(3539, 93195, 'btc', '2025-12-03 10:30:08'),
	(3540, 93011, 'btc', '2025-12-03 10:32:08'),
	(3541, 93189, 'btc', '2025-12-03 10:34:09'),
	(3542, 93054, 'btc', '2025-12-03 10:36:09'),
	(3543, 92917, 'btc', '2025-12-03 10:38:09'),
	(3544, 92988, 'btc', '2025-12-03 10:40:10'),
	(3545, 92910, 'btc', '2025-12-03 10:42:10'),
	(3546, 92954, 'btc', '2025-12-03 10:44:10'),
	(3547, 92923, 'btc', '2025-12-03 10:46:10'),
	(3548, 93019, 'btc', '2025-12-03 10:48:11'),
	(3549, 92993, 'btc', '2025-12-03 10:50:11'),
	(3550, 93018, 'btc', '2025-12-03 10:52:11'),
	(3551, 93031, 'btc', '2025-12-03 10:54:12'),
	(3552, 92963, 'btc', '2025-12-03 10:56:12'),
	(3553, 92904, 'btc', '2025-12-03 10:58:12'),
	(3554, 92976, 'btc', '2025-12-03 11:00:13'),
	(3555, 92994, 'btc', '2025-12-03 11:02:13'),
	(3556, 92953, 'btc', '2025-12-03 11:04:13'),
	(3557, 92925, 'btc', '2025-12-03 11:06:13'),
	(3558, 92944, 'btc', '2025-12-03 11:08:14'),
	(3559, 92906, 'btc', '2025-12-03 11:10:14'),
	(3560, 92768, 'btc', '2025-12-03 11:12:14'),
	(3561, 92776, 'btc', '2025-12-03 11:14:15'),
	(3562, 92689, 'btc', '2025-12-03 11:16:15'),
	(3563, 92831, 'btc', '2025-12-03 11:18:15'),
	(3564, 92850, 'btc', '2025-12-03 11:20:16'),
	(3565, 92879, 'btc', '2025-12-03 11:22:16'),
	(3566, 93000, 'btc', '2025-12-03 11:24:16'),
	(3567, 92969, 'btc', '2025-12-03 11:26:17'),
	(3568, 93015, 'btc', '2025-12-03 11:28:17'),
	(3569, 92962, 'btc', '2025-12-03 11:30:17'),
	(3570, 92907, 'btc', '2025-12-03 11:32:17'),
	(3571, 92928, 'btc', '2025-12-03 11:34:18'),
	(3572, 92924, 'btc', '2025-12-03 11:36:18'),
	(3573, 92970, 'btc', '2025-12-03 11:38:18'),
	(3574, 92972, 'btc', '2025-12-03 11:40:19'),
	(3575, 92912, 'btc', '2025-12-03 11:42:19'),
	(3576, 92890, 'btc', '2025-12-03 11:44:19'),
	(3577, 93033, 'btc', '2025-12-03 11:46:20'),
	(3578, 92986, 'btc', '2025-12-03 11:48:20'),
	(3579, 92966, 'btc', '2025-12-03 11:50:20'),
	(3580, 93010, 'btc', '2025-12-03 11:52:20'),
	(3581, 92981, 'btc', '2025-12-03 11:54:21'),
	(3582, 92977, 'btc', '2025-12-03 11:56:21'),
	(3583, 93004, 'btc', '2025-12-03 11:58:21'),
	(3584, 92995, 'btc', '2025-12-03 12:00:22'),
	(3585, 92932, 'btc', '2025-12-03 12:02:22'),
	(3586, 93069, 'btc', '2025-12-03 12:04:22'),
	(3587, 92926, 'btc', '2025-12-03 12:06:23'),
	(3588, 92895, 'btc', '2025-12-03 12:08:23'),
	(3589, 92930, 'btc', '2025-12-03 12:10:23'),
	(3590, 92856, 'btc', '2025-12-03 12:12:23'),
	(3591, 92860, 'btc', '2025-12-03 12:14:24'),
	(3592, 92856, 'btc', '2025-12-03 12:16:24'),
	(3593, 92834, 'btc', '2025-12-03 12:18:24'),
	(3594, 92926, 'btc', '2025-12-03 12:20:25'),
	(3595, 92768, 'btc', '2025-12-03 12:22:25'),
	(3596, 92832, 'btc', '2025-12-03 12:24:25'),
	(3597, 92800, 'btc', '2025-12-03 12:26:25'),
	(3598, 92770, 'btc', '2025-12-03 12:28:26'),
	(3599, 92709, 'btc', '2025-12-03 12:30:26'),
	(3600, 92716, 'btc', '2025-12-03 12:32:26'),
	(3601, 92773, 'btc', '2025-12-03 12:34:27'),
	(3602, 92842, 'btc', '2025-12-03 12:36:27'),
	(3603, 92847, 'btc', '2025-12-03 12:38:27'),
	(3604, 92812, 'btc', '2025-12-03 12:40:28'),
	(3605, 92843, 'btc', '2025-12-03 12:42:28'),
	(3606, 92858, 'btc', '2025-12-03 12:44:28'),
	(3607, 92824, 'btc', '2025-12-03 12:46:28'),
	(3608, 92873, 'btc', '2025-12-03 12:48:29'),
	(3609, 92948, 'btc', '2025-12-03 12:50:29'),
	(3610, 92945, 'btc', '2025-12-03 12:52:29'),
	(3611, 92904, 'btc', '2025-12-03 12:54:30'),
	(3612, 92938, 'btc', '2025-12-03 12:56:30'),
	(3613, 92949, 'btc', '2025-12-03 12:58:30'),
	(3614, 92926, 'btc', '2025-12-03 13:00:31'),
	(3615, 92966, 'btc', '2025-12-03 13:02:31'),
	(3616, 93058, 'btc', '2025-12-03 13:04:31'),
	(3617, 93032, 'btc', '2025-12-03 13:06:32'),
	(3618, 92953, 'btc', '2025-12-03 13:08:32'),
	(3619, 93016, 'btc', '2025-12-03 13:10:32'),
	(3620, 92966, 'btc', '2025-12-03 13:12:32'),
	(3621, 92918, 'btc', '2025-12-03 13:14:33'),
	(3622, 93028, 'btc', '2025-12-03 13:16:33'),
	(3623, 93030, 'btc', '2025-12-03 13:18:33'),
	(3624, 93015, 'btc', '2025-12-03 13:20:34'),
	(3625, 93047, 'btc', '2025-12-03 13:22:34'),
	(3626, 93016, 'btc', '2025-12-03 13:24:34'),
	(3627, 93100, 'btc', '2025-12-03 13:26:35'),
	(3628, 93090, 'btc', '2025-12-03 13:28:35'),
	(3629, 92943, 'btc', '2025-12-03 13:30:35'),
	(3630, 93039, 'btc', '2025-12-03 13:32:35'),
	(3631, 93088, 'btc', '2025-12-03 13:34:36'),
	(3632, 93082, 'btc', '2025-12-03 13:36:36'),
	(3633, 93163, 'btc', '2025-12-03 13:38:36'),
	(3634, 93121, 'btc', '2025-12-03 13:40:37'),
	(3635, 93181, 'btc', '2025-12-03 13:42:37'),
	(3636, 93209, 'btc', '2025-12-03 13:44:37'),
	(3637, 93155, 'btc', '2025-12-03 13:46:38'),
	(3638, 93131, 'btc', '2025-12-03 13:48:38'),
	(3639, 93241, 'btc', '2025-12-03 13:50:38'),
	(3640, 93166, 'btc', '2025-12-03 13:52:38'),
	(3641, 93154, 'btc', '2025-12-03 13:54:39'),
	(3642, 93153, 'btc', '2025-12-03 13:56:39'),
	(3643, 93098, 'btc', '2025-12-03 13:58:39'),
	(3644, 93131, 'btc', '2025-12-03 14:00:40'),
	(3645, 92234, 'btc', '2025-12-03 14:02:40'),
	(3646, 91863, 'btc', '2025-12-03 14:04:40'),
	(3647, 92168, 'btc', '2025-12-03 14:06:41'),
	(3648, 91816, 'btc', '2025-12-03 14:08:41'),
	(3649, 92145, 'btc', '2025-12-03 14:10:41'),
	(3650, 92302, 'btc', '2025-12-03 14:12:42'),
	(3651, 92082, 'btc', '2025-12-03 14:14:42'),
	(3652, 92248, 'btc', '2025-12-03 14:16:42'),
	(3653, 92495, 'btc', '2025-12-03 14:18:42'),
	(3654, 92247, 'btc', '2025-12-03 14:20:43'),
	(3655, 92255, 'btc', '2025-12-03 14:22:43'),
	(3656, 92310, 'btc', '2025-12-03 14:24:43'),
	(3657, 92398, 'btc', '2025-12-03 14:26:44'),
	(3658, 92486, 'btc', '2025-12-03 14:28:44'),
	(3659, 92305, 'btc', '2025-12-03 14:30:44'),
	(3660, 92462, 'btc', '2025-12-03 14:32:45'),
	(3661, 92240, 'btc', '2025-12-03 14:34:45'),
	(3662, 92323, 'btc', '2025-12-03 14:36:45'),
	(3663, 92660, 'btc', '2025-12-03 14:38:45'),
	(3664, 92840, 'btc', '2025-12-03 14:40:46'),
	(3665, 93369, 'btc', '2025-12-03 14:42:46'),
	(3666, 93573, 'btc', '2025-12-03 14:44:46'),
	(3667, 92992, 'btc', '2025-12-03 14:46:47'),
	(3668, 92827, 'btc', '2025-12-03 14:48:47'),
	(3669, 93040, 'btc', '2025-12-03 14:50:47'),
	(3670, 92585, 'btc', '2025-12-03 14:52:48'),
	(3671, 92774, 'btc', '2025-12-03 14:54:48'),
	(3672, 92614, 'btc', '2025-12-03 14:56:48'),
	(3673, 92581, 'btc', '2025-12-03 14:58:49'),
	(3674, 92545, 'btc', '2025-12-03 15:00:49'),
	(3675, 92520, 'btc', '2025-12-03 15:02:49'),
	(3676, 92958, 'btc', '2025-12-03 15:04:49'),
	(3677, 92797, 'btc', '2025-12-03 15:06:50'),
	(3678, 92626, 'btc', '2025-12-03 15:08:50'),
	(3679, 92712, 'btc', '2025-12-03 15:10:50'),
	(3680, 92620, 'btc', '2025-12-03 15:12:51'),
	(3681, 92198, 'btc', '2025-12-03 15:14:51'),
	(3682, 92365, 'btc', '2025-12-03 15:16:51'),
	(3683, 92333, 'btc', '2025-12-03 15:18:52'),
	(3684, 92152, 'btc', '2025-12-03 15:20:52'),
	(3685, 92018, 'btc', '2025-12-03 15:22:52'),
	(3686, 92266, 'btc', '2025-12-03 15:24:53'),
	(3687, 92332, 'btc', '2025-12-03 15:26:53'),
	(3688, 92386, 'btc', '2025-12-03 15:28:53'),
	(3689, 92297, 'btc', '2025-12-03 15:30:53'),
	(3690, 92452, 'btc', '2025-12-03 15:32:54'),
	(3691, 92575, 'btc', '2025-12-03 15:34:54'),
	(3692, 92725, 'btc', '2025-12-03 15:36:54'),
	(3693, 92400, 'btc', '2025-12-03 15:38:55'),
	(3694, 92433, 'btc', '2025-12-03 15:40:55'),
	(3695, 92396, 'btc', '2025-12-03 15:42:55'),
	(3696, 92342, 'btc', '2025-12-03 15:44:56'),
	(3697, 92535, 'btc', '2025-12-03 15:46:56'),
	(3698, 92610, 'btc', '2025-12-03 15:48:56'),
	(3699, 92470, 'btc', '2025-12-03 15:50:56'),
	(3700, 92512, 'btc', '2025-12-03 15:52:57'),
	(3701, 92438, 'btc', '2025-12-03 15:54:57'),
	(3702, 92395, 'btc', '2025-12-03 15:56:57'),
	(3703, 92343, 'btc', '2025-12-03 15:58:58'),
	(3704, 92388, 'btc', '2025-12-03 16:00:58'),
	(3705, 92415, 'btc', '2025-12-03 16:02:58'),
	(3706, 92280, 'btc', '2025-12-03 16:04:59'),
	(3707, 92142, 'btc', '2025-12-03 16:06:59'),
	(3708, 91969, 'btc', '2025-12-03 16:08:59'),
	(3709, 91841, 'btc', '2025-12-03 16:11:00'),
	(3710, 91806, 'btc', '2025-12-03 16:13:00'),
	(3711, 92033, 'btc', '2025-12-03 16:15:00'),
	(3712, 92161, 'btc', '2025-12-03 16:17:00'),
	(3713, 92130, 'btc', '2025-12-03 16:19:01'),
	(3714, 92216, 'btc', '2025-12-03 16:21:01'),
	(3715, 92099, 'btc', '2025-12-03 16:23:01'),
	(3716, 92184, 'btc', '2025-12-03 16:25:02'),
	(3717, 92156, 'btc', '2025-12-03 16:27:02'),
	(3718, 92205, 'btc', '2025-12-03 16:29:02'),
	(3719, 92366, 'btc', '2025-12-03 16:31:03'),
	(3720, 92415, 'btc', '2025-12-03 16:33:03'),
	(3721, 92518, 'btc', '2025-12-03 16:35:03'),
	(3722, 92657, 'btc', '2025-12-03 16:37:04'),
	(3723, 92691, 'btc', '2025-12-03 16:39:04'),
	(3724, 92592, 'btc', '2025-12-03 16:41:04'),
	(3725, 92575, 'btc', '2025-12-03 16:43:04'),
	(3726, 92688, 'btc', '2025-12-03 16:45:05'),
	(3727, 92670, 'btc', '2025-12-03 16:47:05'),
	(3728, 92491, 'btc', '2025-12-03 16:49:05'),
	(3729, 92526, 'btc', '2025-12-03 16:51:06'),
	(3730, 92510, 'btc', '2025-12-03 16:53:06'),
	(3731, 92422, 'btc', '2025-12-03 16:55:06'),
	(3732, 92422, 'btc', '2025-12-03 16:57:07'),
	(3733, 92253, 'btc', '2025-12-03 16:59:07'),
	(3734, 92358, 'btc', '2025-12-03 17:01:07'),
	(3735, 92293, 'btc', '2025-12-03 17:03:07'),
	(3736, 92318, 'btc', '2025-12-03 17:08:55'),
	(3737, 92327, 'btc', '2025-12-03 17:10:56'),
	(3738, 92593, 'btc', '2025-12-03 17:12:56'),
	(3739, 92630, 'btc', '2025-12-03 17:14:56'),
	(3740, 92565, 'btc', '2025-12-03 17:16:56'),
	(3741, 92286, 'btc', '2025-12-03 17:18:57'),
	(3742, 92341, 'btc', '2025-12-03 17:20:57'),
	(3743, 92567, 'btc', '2025-12-03 17:22:57'),
	(3744, 92507, 'btc', '2025-12-03 17:24:58'),
	(3745, 92547, 'btc', '2025-12-03 17:26:58'),
	(3746, 92545, 'btc', '2025-12-03 17:28:58'),
	(3747, 92640, 'btc', '2025-12-03 17:30:58'),
	(3748, 92575, 'btc', '2025-12-03 17:32:59'),
	(3749, 92606, 'btc', '2025-12-03 17:34:59'),
	(3750, 92615, 'btc', '2025-12-03 17:36:59'),
	(3751, 92807, 'btc', '2025-12-03 17:39:00'),
	(3752, 92734, 'btc', '2025-12-03 17:41:00'),
	(3753, 92787, 'btc', '2025-12-03 17:43:00'),
	(3754, 92729, 'btc', '2025-12-03 17:45:01'),
	(3755, 92777, 'btc', '2025-12-03 17:47:01'),
	(3756, 92915, 'btc', '2025-12-03 17:49:01'),
	(3757, 92881, 'btc', '2025-12-03 17:51:02'),
	(3758, 92958, 'btc', '2025-12-03 17:53:02'),
	(3759, 93007, 'btc', '2025-12-03 17:55:02'),
	(3760, 93014, 'btc', '2025-12-03 17:57:02'),
	(3761, 93004, 'btc', '2025-12-03 17:59:03'),
	(3762, 92978, 'btc', '2025-12-03 18:01:03'),
	(3763, 92974, 'btc', '2025-12-03 18:03:03'),
	(3764, 93183, 'btc', '2025-12-03 18:05:04'),
	(3765, 93067, 'btc', '2025-12-03 18:07:04'),
	(3766, 93099, 'btc', '2025-12-03 18:09:04'),
	(3767, 93201, 'btc', '2025-12-03 18:11:05'),
	(3768, 93452, 'btc', '2025-12-03 18:13:05'),
	(3769, 93403, 'btc', '2025-12-03 18:15:05'),
	(3770, 93046, 'btc', '2025-12-03 18:17:06'),
	(3771, 92987, 'btc', '2025-12-03 18:19:06'),
	(3772, 93028, 'btc', '2025-12-03 18:21:06'),
	(3773, 93043, 'btc', '2025-12-03 18:23:06'),
	(3774, 93099, 'btc', '2025-12-03 18:25:07'),
	(3775, 93075, 'btc', '2025-12-03 18:27:07'),
	(3776, 93059, 'btc', '2025-12-03 18:29:08'),
	(3777, 93101, 'btc', '2025-12-03 18:31:08'),
	(3778, 92980, 'btc', '2025-12-03 18:33:08'),
	(3779, 93140, 'btc', '2025-12-03 18:35:08'),
	(3780, 93024, 'btc', '2025-12-03 18:37:09'),
	(3781, 93073, 'btc', '2025-12-03 18:39:09'),
	(3782, 93089, 'btc', '2025-12-03 18:41:09'),
	(3783, 93123, 'btc', '2025-12-03 18:43:10'),
	(3784, 93095, 'btc', '2025-12-03 18:45:10'),
	(3785, 92922, 'btc', '2025-12-03 18:47:10'),
	(3786, 92828, 'btc', '2025-12-03 18:49:11'),
	(3787, 92701, 'btc', '2025-12-03 18:51:11'),
	(3788, 92680, 'btc', '2025-12-03 18:53:11'),
	(3789, 92575, 'btc', '2025-12-03 18:55:11'),
	(3790, 92427, 'btc', '2025-12-03 18:57:12'),
	(3791, 92592, 'btc', '2025-12-03 18:59:12'),
	(3792, 92696, 'btc', '2025-12-03 19:01:12'),
	(3793, 92666, 'btc', '2025-12-03 19:03:13'),
	(3794, 92741, 'btc', '2025-12-03 19:05:13'),
	(3795, 92754, 'btc', '2025-12-03 19:07:13'),
	(3796, 92837, 'btc', '2025-12-03 19:09:14'),
	(3797, 92736, 'btc', '2025-12-03 19:11:14'),
	(3798, 92720, 'btc', '2025-12-03 19:13:14'),
	(3799, 92666, 'btc', '2025-12-03 19:15:15'),
	(3800, 92559, 'btc', '2025-12-03 19:17:33'),
	(3801, 92727, 'btc', '2025-12-03 19:19:33'),
	(3802, 92772, 'btc', '2025-12-03 19:21:33'),
	(3803, 92718, 'btc', '2025-12-03 19:23:33'),
	(3804, 92718, 'btc', '2025-12-03 19:25:34'),
	(3805, 92731, 'btc', '2025-12-03 19:27:34'),
	(3806, 92765, 'btc', '2025-12-03 19:29:34'),
	(3807, 92625, 'btc', '2025-12-03 19:31:35'),
	(3808, 92743, 'btc', '2025-12-03 19:33:35'),
	(3809, 92759, 'btc', '2025-12-03 19:35:35'),
	(3810, 92751, 'btc', '2025-12-03 19:37:35'),
	(3811, 92669, 'btc', '2025-12-03 19:39:36'),
	(3812, 92689, 'btc', '2025-12-03 19:41:36'),
	(3813, 92764, 'btc', '2025-12-03 19:43:36'),
	(3814, 92865, 'btc', '2025-12-03 19:45:37'),
	(3815, 92878, 'btc', '2025-12-03 19:47:37'),
	(3816, 92959, 'btc', '2025-12-03 19:49:37'),
	(3817, 93002, 'btc', '2025-12-03 19:51:38'),
	(3818, 93066, 'btc', '2025-12-03 19:53:38'),
	(3819, 92951, 'btc', '2025-12-03 19:55:38'),
	(3820, 93010, 'btc', '2025-12-03 19:57:39'),
	(3821, 93012, 'btc', '2025-12-03 19:59:39'),
	(3822, 93065, 'btc', '2025-12-03 20:01:39'),
	(3823, 93052, 'btc', '2025-12-03 20:03:39'),
	(3824, 92860, 'btc', '2025-12-03 20:05:40'),
	(3825, 93065, 'btc', '2025-12-03 20:07:40'),
	(3826, 93041, 'btc', '2025-12-03 20:09:40'),
	(3827, 93053, 'btc', '2025-12-03 20:11:41'),
	(3828, 92933, 'btc', '2025-12-03 20:13:41'),
	(3829, 92995, 'btc', '2025-12-03 20:15:41'),
	(3830, 92929, 'btc', '2025-12-03 20:17:41'),
	(3831, 93047, 'btc', '2025-12-03 20:19:42'),
	(3832, 93067, 'btc', '2025-12-03 20:21:42'),
	(3833, 93006, 'btc', '2025-12-03 20:23:42'),
	(3834, 93066, 'btc', '2025-12-03 20:25:43'),
	(3835, 92970, 'btc', '2025-12-03 20:27:43'),
	(3836, 93016, 'btc', '2025-12-03 20:29:43'),
	(3837, 93051, 'btc', '2025-12-03 20:31:44'),
	(3838, 93062, 'btc', '2025-12-03 20:33:44'),
	(3839, 93098, 'btc', '2025-12-03 20:35:44'),
	(3840, 93066, 'btc', '2025-12-03 20:37:44'),
	(3841, 93079, 'btc', '2025-12-03 20:39:45'),
	(3842, 93055, 'btc', '2025-12-03 20:41:45'),
	(3843, 93113, 'btc', '2025-12-03 20:43:45'),
	(3844, 93198, 'btc', '2025-12-03 20:45:46'),
	(3845, 93126, 'btc', '2025-12-03 20:47:46'),
	(3846, 93206, 'btc', '2025-12-03 20:49:46'),
	(3847, 93203, 'btc', '2025-12-03 20:51:47'),
	(3848, 93296, 'btc', '2025-12-03 20:53:47'),
	(3849, 93140, 'btc', '2025-12-03 20:55:47'),
	(3850, 93025, 'btc', '2025-12-03 20:57:47'),
	(3851, 92960, 'btc', '2025-12-03 20:59:48'),
	(3852, 92894, 'btc', '2025-12-03 21:01:48'),
	(3853, 92922, 'btc', '2025-12-03 21:03:48'),
	(3854, 92903, 'btc', '2025-12-03 21:05:49'),
	(3855, 92968, 'btc', '2025-12-03 21:07:49'),
	(3856, 93038, 'btc', '2025-12-03 21:09:49'),
	(3857, 93073, 'btc', '2025-12-03 21:11:49'),
	(3858, 93110, 'btc', '2025-12-03 21:13:50'),
	(3859, 93019, 'btc', '2025-12-03 21:15:50'),
	(3860, 93194, 'btc', '2025-12-03 21:17:50'),
	(3861, 93173, 'btc', '2025-12-03 21:19:51'),
	(3862, 93228, 'btc', '2025-12-03 21:21:51'),
	(3863, 93328, 'btc', '2025-12-03 21:23:51'),
	(3864, 93253, 'btc', '2025-12-03 21:25:52'),
	(3865, 93234, 'btc', '2025-12-03 21:27:52'),
	(3866, 93270, 'btc', '2025-12-03 21:29:52'),
	(3867, 93364, 'btc', '2025-12-03 21:31:52'),
	(3868, 93348, 'btc', '2025-12-03 21:33:53'),
	(3869, 93437, 'btc', '2025-12-03 21:35:53'),
	(3870, 93360, 'btc', '2025-12-03 21:37:53'),
	(3871, 93467, 'btc', '2025-12-03 21:39:54'),
	(3872, 93450, 'btc', '2025-12-03 21:41:54'),
	(3873, 93451, 'btc', '2025-12-03 21:43:54'),
	(3874, 93513, 'btc', '2025-12-03 21:45:54'),
	(3875, 93378, 'btc', '2025-12-03 21:47:55'),
	(3876, 93411, 'btc', '2025-12-03 21:49:55'),
	(3877, 93468, 'btc', '2025-12-03 21:51:55'),
	(3878, 93450, 'btc', '2025-12-03 21:53:56'),
	(3879, 93462, 'btc', '2025-12-03 21:55:56'),
	(3880, 93642, 'btc', '2025-12-03 21:57:56'),
	(3881, 93751, 'btc', '2025-12-03 21:59:56'),
	(3882, 93800, 'btc', '2025-12-03 22:01:57'),
	(3883, 93475, 'btc', '2025-12-03 22:03:57'),
	(3884, 93534, 'btc', '2025-12-03 22:05:57'),
	(3885, 93553, 'btc', '2025-12-03 22:07:58'),
	(3886, 93520, 'btc', '2025-12-03 22:09:58'),
	(3887, 93621, 'btc', '2025-12-03 22:11:58'),
	(3888, 93578, 'btc', '2025-12-03 22:17:02'),
	(3889, 93605, 'btc', '2025-12-03 22:19:02'),
	(3890, 93569, 'btc', '2025-12-03 22:21:03'),
	(3891, 93574, 'btc', '2025-12-03 22:23:03'),
	(3892, 93458, 'btc', '2025-12-03 22:25:03'),
	(3893, 93375, 'btc', '2025-12-03 22:27:03'),
	(3894, 93392, 'btc', '2025-12-03 22:29:04'),
	(3895, 93432, 'btc', '2025-12-03 22:31:04'),
	(3896, 93384, 'btc', '2025-12-03 22:33:04'),
	(3897, 93324, 'btc', '2025-12-03 22:35:05'),
	(3898, 93352, 'btc', '2025-12-03 22:37:05'),
	(3899, 93579, 'btc', '2025-12-03 22:39:05'),
	(3900, 93546, 'btc', '2025-12-03 22:41:06'),
	(3901, 93703, 'btc', '2025-12-03 22:43:06'),
	(3902, 93610, 'btc', '2025-12-03 22:45:06'),
	(3903, 93734, 'btc', '2025-12-03 22:47:06'),
	(3904, 93858, 'btc', '2025-12-03 22:49:07'),
	(3905, 93923, 'btc', '2025-12-03 22:51:07'),
	(3906, 93812, 'btc', '2025-12-03 22:53:07'),
	(3907, 93636, 'btc', '2025-12-03 22:55:08'),
	(3908, 93815, 'btc', '2025-12-03 22:57:08'),
	(3909, 93774, 'btc', '2025-12-03 22:59:09'),
	(3910, 93962, 'btc', '2025-12-03 23:01:09'),
	(3911, 93947, 'btc', '2025-12-03 23:03:09'),
	(3912, 93888, 'btc', '2025-12-03 23:05:10'),
	(3913, 94026, 'btc', '2025-12-03 23:07:10'),
	(3914, 94000, 'btc', '2025-12-03 23:09:10'),
	(3915, 93858, 'btc', '2025-12-03 23:11:10'),
	(3916, 93880, 'btc', '2025-12-03 23:13:11'),
	(3917, 93751, 'btc', '2025-12-03 23:15:11'),
	(3918, 93681, 'btc', '2025-12-03 23:17:11'),
	(3919, 93716, 'btc', '2025-12-03 23:19:12'),
	(3920, 93712, 'btc', '2025-12-03 23:21:12'),
	(3921, 93605, 'btc', '2025-12-03 23:23:12'),
	(3922, 93595, 'btc', '2025-12-03 23:25:12'),
	(3923, 93671, 'btc', '2025-12-03 23:27:13'),
	(3924, 93630, 'btc', '2025-12-03 23:29:13'),
	(3925, 93565, 'btc', '2025-12-03 23:31:13'),
	(3926, 93501, 'btc', '2025-12-03 23:33:14'),
	(3927, 93501, 'btc', '2025-12-03 23:35:14'),
	(3928, 93493, 'btc', '2025-12-03 23:37:14'),
	(3929, 93511, 'btc', '2025-12-03 23:39:15'),
	(3930, 93551, 'btc', '2025-12-03 23:41:15'),
	(3931, 93566, 'btc', '2025-12-03 23:43:15'),
	(3932, 93483, 'btc', '2025-12-03 23:45:15'),
	(3933, 93592, 'btc', '2025-12-03 23:47:16'),
	(3934, 93591, 'btc', '2025-12-03 23:49:16'),
	(3935, 93578, 'btc', '2025-12-03 23:51:16'),
	(3936, 93644, 'btc', '2025-12-03 23:53:17'),
	(3937, 93616, 'btc', '2025-12-03 23:55:17'),
	(3938, 93573, 'btc', '2025-12-03 23:57:17'),
	(3939, 93442, 'btc', '2025-12-03 23:59:17'),
	(3940, 93433, 'btc', '2025-12-04 00:04:06'),
	(3941, 93411, 'btc', '2025-12-04 00:06:06'),
	(3942, 93309, 'btc', '2025-12-04 00:08:07'),
	(3943, 93292, 'btc', '2025-12-04 00:10:07'),
	(3944, 93139, 'btc', '2025-12-04 00:12:07'),
	(3945, 92987, 'btc', '2025-12-04 00:14:08'),
	(3946, 93060, 'btc', '2025-12-04 00:16:08'),
	(3947, 92972, 'btc', '2025-12-04 00:18:08'),
	(3948, 93025, 'btc', '2025-12-04 00:20:09'),
	(3949, 93011, 'btc', '2025-12-04 00:22:09'),
	(3950, 93003, 'btc', '2025-12-04 00:23:57'),
	(3951, 92902, 'btc', '2025-12-04 00:25:57'),
	(3952, 92834, 'btc', '2025-12-04 00:27:57'),
	(3953, 92828, 'btc', '2025-12-04 00:29:57'),
	(3954, 92797, 'btc', '2025-12-04 00:31:58'),
	(3955, 92735, 'btc', '2025-12-04 00:33:58'),
	(3956, 92731, 'btc', '2025-12-04 00:35:58'),
	(3957, 92732, 'btc', '2025-12-04 00:37:59'),
	(3958, 92843, 'btc', '2025-12-04 00:39:59'),
	(3959, 92937, 'btc', '2025-12-04 00:41:59'),
	(3960, 93051, 'btc', '2025-12-04 00:44:00'),
	(3961, 92995, 'btc', '2025-12-04 00:46:00'),
	(3962, 93018, 'btc', '2025-12-04 00:48:00'),
	(3963, 93010, 'btc', '2025-12-04 00:50:01'),
	(3964, 93062, 'btc', '2025-12-04 00:52:01'),
	(3965, 93068, 'btc', '2025-12-04 00:54:01'),
	(3966, 93054, 'btc', '2025-12-04 00:56:02'),
	(3967, 93053, 'btc', '2025-12-04 00:58:02'),
	(3968, 93048, 'btc', '2025-12-04 01:00:02'),
	(3969, 93138, 'btc', '2025-12-04 01:02:02'),
	(3970, 93140, 'btc', '2025-12-04 01:04:03'),
	(3971, 93261, 'btc', '2025-12-04 01:06:03'),
	(3972, 93274, 'btc', '2025-12-04 01:08:03'),
	(3973, 93218, 'btc', '2025-12-04 01:10:04'),
	(3974, 93443, 'btc', '2025-12-04 01:12:04'),
	(3975, 93597, 'btc', '2025-12-04 01:14:04'),
	(3976, 93620, 'btc', '2025-12-04 01:16:04'),
	(3977, 93434, 'btc', '2025-12-04 01:18:05'),
	(3978, 93323, 'btc', '2025-12-04 01:20:05'),
	(3979, 93467, 'btc', '2025-12-04 01:22:05'),
	(3980, 93325, 'btc', '2025-12-04 01:24:06'),
	(3981, 93391, 'btc', '2025-12-04 01:26:06'),
	(3982, 93261, 'btc', '2025-12-04 01:28:06'),
	(3983, 93378, 'btc', '2025-12-04 01:30:07'),
	(3984, 93402, 'btc', '2025-12-04 01:32:07'),
	(3985, 93430, 'btc', '2025-12-04 01:34:07'),
	(3986, 93516, 'btc', '2025-12-04 01:36:08'),
	(3987, 93557, 'btc', '2025-12-04 01:38:08'),
	(3988, 93500, 'btc', '2025-12-04 01:40:08'),
	(3989, 93474, 'btc', '2025-12-04 01:42:08'),
	(3990, 93453, 'btc', '2025-12-04 01:44:09'),
	(3991, 93410, 'btc', '2025-12-04 01:46:09'),
	(3992, 93328, 'btc', '2025-12-04 01:48:09'),
	(3993, 93299, 'btc', '2025-12-04 01:50:10'),
	(3994, 93223, 'btc', '2025-12-04 01:52:10'),
	(3995, 93229, 'btc', '2025-12-04 01:54:10'),
	(3996, 93213, 'btc', '2025-12-04 01:56:11'),
	(3997, 93183, 'btc', '2025-12-04 01:58:11'),
	(3998, 93232, 'btc', '2025-12-04 02:00:11'),
	(3999, 93179, 'btc', '2025-12-04 02:02:11'),
	(4000, 93273, 'btc', '2025-12-04 02:04:12'),
	(4001, 93378, 'btc', '2025-12-04 02:06:12'),
	(4002, 93354, 'btc', '2025-12-04 02:08:12'),
	(4003, 93412, 'btc', '2025-12-04 02:10:13'),
	(4004, 93590, 'btc', '2025-12-04 02:12:13'),
	(4005, 93644, 'btc', '2025-12-04 02:14:13'),
	(4006, 93661, 'btc', '2025-12-04 02:16:13'),
	(4007, 93708, 'btc', '2025-12-04 02:18:14'),
	(4008, 93966, 'btc', '2025-12-04 02:20:14'),
	(4009, 93779, 'btc', '2025-12-04 02:22:14'),
	(4010, 93820, 'btc', '2025-12-04 02:24:15'),
	(4011, 93872, 'btc', '2025-12-04 02:26:15'),
	(4012, 93880, 'btc', '2025-12-04 02:28:15'),
	(4013, 93822, 'btc', '2025-12-04 02:30:15'),
	(4014, 93689, 'btc', '2025-12-04 02:32:16'),
	(4015, 93734, 'btc', '2025-12-04 02:34:16'),
	(4016, 93816, 'btc', '2025-12-04 02:36:16'),
	(4017, 93801, 'btc', '2025-12-04 02:38:17'),
	(4018, 93953, 'btc', '2025-12-04 02:40:17'),
	(4019, 93795, 'btc', '2025-12-04 02:42:17'),
	(4020, 93829, 'btc', '2025-12-04 02:44:18'),
	(4021, 93916, 'btc', '2025-12-04 02:46:18'),
	(4022, 93805, 'btc', '2025-12-04 02:48:18'),
	(4023, 93853, 'btc', '2025-12-04 02:50:19'),
	(4024, 93772, 'btc', '2025-12-04 02:52:19'),
	(4025, 93872, 'btc', '2025-12-04 02:54:20'),
	(4026, 93880, 'btc', '2025-12-04 02:56:20'),
	(4027, 93941, 'btc', '2025-12-04 02:58:20'),
	(4028, 93915, 'btc', '2025-12-04 03:00:20'),
	(4029, 93906, 'btc', '2025-12-04 03:02:21'),
	(4030, 93903, 'btc', '2025-12-04 03:04:21'),
	(4031, 93944, 'btc', '2025-12-04 03:06:21'),
	(4032, 94002, 'btc', '2025-12-04 03:08:22'),
	(4033, 93953, 'btc', '2025-12-04 03:10:22'),
	(4034, 93857, 'btc', '2025-12-04 03:12:22'),
	(4035, 93863, 'btc', '2025-12-04 03:14:23'),
	(4036, 93700, 'btc', '2025-12-04 03:16:23'),
	(4037, 93687, 'btc', '2025-12-04 03:18:24'),
	(4038, 93620, 'btc', '2025-12-04 03:20:24'),
	(4039, 93597, 'btc', '2025-12-04 03:22:24'),
	(4040, 93650, 'btc', '2025-12-04 03:24:24'),
	(4041, 93566, 'btc', '2025-12-04 03:26:25'),
	(4042, 93633, 'btc', '2025-12-04 03:28:25'),
	(4043, 93585, 'btc', '2025-12-04 03:30:25'),
	(4044, 93559, 'btc', '2025-12-04 03:32:26'),
	(4045, 93508, 'btc', '2025-12-04 03:34:26'),
	(4046, 93581, 'btc', '2025-12-04 03:36:26'),
	(4047, 93439, 'btc', '2025-12-04 03:38:27'),
	(4048, 93427, 'btc', '2025-12-04 03:40:27'),
	(4049, 93482, 'btc', '2025-12-04 03:42:27'),
	(4050, 93468, 'btc', '2025-12-04 03:44:28'),
	(4051, 93460, 'btc', '2025-12-04 03:46:28'),
	(4052, 93519, 'btc', '2025-12-04 03:48:28'),
	(4053, 93600, 'btc', '2025-12-04 03:50:28'),
	(4054, 93554, 'btc', '2025-12-04 03:52:29'),
	(4055, 93553, 'btc', '2025-12-04 03:54:29'),
	(4056, 93504, 'btc', '2025-12-04 03:56:29'),
	(4057, 93540, 'btc', '2025-12-04 03:58:30'),
	(4058, 93560, 'btc', '2025-12-04 04:00:30'),
	(4059, 93520, 'btc', '2025-12-04 04:02:30'),
	(4060, 93384, 'btc', '2025-12-04 04:04:31'),
	(4061, 93395, 'btc', '2025-12-04 04:06:31'),
	(4062, 93401, 'btc', '2025-12-04 04:08:31'),
	(4063, 93491, 'btc', '2025-12-04 04:10:32'),
	(4064, 93523, 'btc', '2025-12-04 04:12:32'),
	(4065, 93458, 'btc', '2025-12-04 04:14:32'),
	(4066, 93484, 'btc', '2025-12-04 04:16:33'),
	(4067, 93424, 'btc', '2025-12-04 04:18:33'),
	(4068, 93422, 'btc', '2025-12-04 04:20:33'),
	(4069, 93377, 'btc', '2025-12-04 04:22:33'),
	(4070, 93385, 'btc', '2025-12-04 04:24:34'),
	(4071, 93405, 'btc', '2025-12-04 04:26:34'),
	(4072, 93403, 'btc', '2025-12-04 04:28:34'),
	(4073, 93417, 'btc', '2025-12-04 04:30:35'),
	(4074, 93494, 'btc', '2025-12-04 04:32:35'),
	(4075, 93449, 'btc', '2025-12-04 04:34:35'),
	(4076, 93479, 'btc', '2025-12-04 04:36:35'),
	(4077, 93456, 'btc', '2025-12-04 04:38:36'),
	(4078, 93437, 'btc', '2025-12-04 04:40:36'),
	(4079, 93472, 'btc', '2025-12-04 04:42:36'),
	(4080, 93368, 'btc', '2025-12-04 04:44:37'),
	(4081, 93381, 'btc', '2025-12-04 04:46:37'),
	(4082, 93269, 'btc', '2025-12-04 04:48:37'),
	(4083, 93316, 'btc', '2025-12-04 04:50:37'),
	(4084, 93268, 'btc', '2025-12-04 04:52:38'),
	(4085, 93315, 'btc', '2025-12-04 04:54:38'),
	(4086, 93362, 'btc', '2025-12-04 04:56:38'),
	(4087, 93324, 'btc', '2025-12-04 04:58:39'),
	(4088, 93375, 'btc', '2025-12-04 05:00:39'),
	(4089, 93298, 'btc', '2025-12-04 05:02:39'),
	(4090, 93310, 'btc', '2025-12-04 05:04:40'),
	(4091, 93217, 'btc', '2025-12-04 05:06:40'),
	(4092, 93180, 'btc', '2025-12-04 05:08:40'),
	(4093, 93054, 'btc', '2025-12-04 05:10:40'),
	(4094, 93205, 'btc', '2025-12-04 05:12:41'),
	(4095, 93204, 'btc', '2025-12-04 05:14:41'),
	(4096, 93223, 'btc', '2025-12-04 05:16:41'),
	(4097, 93100, 'btc', '2025-12-04 05:18:42'),
	(4098, 93046, 'btc', '2025-12-04 05:20:42'),
	(4099, 93044, 'btc', '2025-12-04 05:22:42'),
	(4100, 93130, 'btc', '2025-12-04 05:24:43'),
	(4101, 93181, 'btc', '2025-12-04 05:26:43'),
	(4102, 93196, 'btc', '2025-12-04 05:28:43'),
	(4103, 93184, 'btc', '2025-12-04 05:30:43'),
	(4104, 93139, 'btc', '2025-12-04 05:32:44'),
	(4105, 93124, 'btc', '2025-12-04 05:34:44'),
	(4106, 93031, 'btc', '2025-12-04 05:36:44'),
	(4107, 93074, 'btc', '2025-12-04 05:38:45'),
	(4108, 93058, 'btc', '2025-12-04 05:40:45'),
	(4109, 93056, 'btc', '2025-12-04 05:42:45'),
	(4110, 92991, 'btc', '2025-12-04 05:44:45'),
	(4111, 92999, 'btc', '2025-12-04 05:46:46'),
	(4112, 92980, 'btc', '2025-12-04 05:48:46'),
	(4113, 92838, 'btc', '2025-12-04 05:50:46'),
	(4114, 92790, 'btc', '2025-12-04 05:52:47'),
	(4115, 92870, 'btc', '2025-12-04 05:54:47'),
	(4116, 92958, 'btc', '2025-12-04 05:56:47'),
	(4117, 92992, 'btc', '2025-12-04 05:58:48'),
	(4118, 93000, 'btc', '2025-12-04 06:00:48'),
	(4119, 92878, 'btc', '2025-12-04 06:02:48'),
	(4120, 92904, 'btc', '2025-12-04 06:04:48'),
	(4121, 92949, 'btc', '2025-12-04 06:06:49'),
	(4122, 93014, 'btc', '2025-12-04 06:08:49'),
	(4123, 93052, 'btc', '2025-12-04 06:10:49'),
	(4124, 93018, 'btc', '2025-12-04 06:12:50'),
	(4125, 93036, 'btc', '2025-12-04 06:14:50'),
	(4126, 93098, 'btc', '2025-12-04 06:16:50'),
	(4127, 93067, 'btc', '2025-12-04 06:18:50'),
	(4128, 93043, 'btc', '2025-12-04 06:20:51'),
	(4129, 93024, 'btc', '2025-12-04 06:22:51'),
	(4130, 93025, 'btc', '2025-12-04 06:24:51'),
	(4131, 93209, 'btc', '2025-12-04 06:26:52'),
	(4132, 93219, 'btc', '2025-12-04 06:28:52'),
	(4133, 93261, 'btc', '2025-12-04 06:30:52'),
	(4134, 93233, 'btc', '2025-12-04 06:32:53'),
	(4135, 93322, 'btc', '2025-12-04 06:34:53'),
	(4136, 93323, 'btc', '2025-12-04 06:36:53'),
	(4137, 93315, 'btc', '2025-12-04 06:38:53'),
	(4138, 93218, 'btc', '2025-12-04 06:40:54'),
	(4139, 93203, 'btc', '2025-12-04 06:42:54'),
	(4140, 93120, 'btc', '2025-12-04 06:44:54'),
	(4141, 93035, 'btc', '2025-12-04 06:46:55'),
	(4142, 93045, 'btc', '2025-12-04 06:48:55'),
	(4143, 93172, 'btc', '2025-12-04 06:50:55'),
	(4144, 93083, 'btc', '2025-12-04 06:52:55'),
	(4145, 93133, 'btc', '2025-12-04 06:54:56'),
	(4146, 93108, 'btc', '2025-12-04 06:56:56'),
	(4147, 93128, 'btc', '2025-12-04 06:58:56'),
	(4148, 93110, 'btc', '2025-12-04 07:00:56'),
	(4149, 93083, 'btc', '2025-12-04 07:02:57'),
	(4150, 93107, 'btc', '2025-12-04 07:04:57'),
	(4151, 93088, 'btc', '2025-12-04 07:06:57'),
	(4152, 93129, 'btc', '2025-12-04 07:08:58'),
	(4153, 93032, 'btc', '2025-12-04 07:10:58'),
	(4154, 92888, 'btc', '2025-12-04 07:12:58'),
	(4155, 93050, 'btc', '2025-12-04 07:14:58'),
	(4156, 93034, 'btc', '2025-12-04 07:16:59'),
	(4157, 93094, 'btc', '2025-12-04 07:18:59'),
	(4158, 93120, 'btc', '2025-12-04 07:20:59'),
	(4159, 93040, 'btc', '2025-12-04 07:23:00'),
	(4160, 93045, 'btc', '2025-12-04 07:25:00'),
	(4161, 93135, 'btc', '2025-12-04 07:27:00'),
	(4162, 93108, 'btc', '2025-12-04 07:29:00'),
	(4163, 93152, 'btc', '2025-12-04 07:31:01'),
	(4164, 93196, 'btc', '2025-12-04 07:33:01'),
	(4165, 93209, 'btc', '2025-12-04 07:35:01'),
	(4166, 93228, 'btc', '2025-12-04 07:37:02'),
	(4167, 93220, 'btc', '2025-12-04 07:39:02'),
	(4168, 93247, 'btc', '2025-12-04 07:41:02'),
	(4169, 93257, 'btc', '2025-12-04 07:43:03'),
	(4170, 93272, 'btc', '2025-12-04 07:45:03'),
	(4171, 93268, 'btc', '2025-12-04 07:47:03'),
	(4172, 93234, 'btc', '2025-12-04 07:49:03'),
	(4173, 93285, 'btc', '2025-12-04 07:51:04'),
	(4174, 93340, 'btc', '2025-12-04 07:53:04'),
	(4175, 93330, 'btc', '2025-12-04 07:55:04'),
	(4176, 93342, 'btc', '2025-12-04 07:57:05'),
	(4177, 93413, 'btc', '2025-12-04 07:59:05'),
	(4178, 93311, 'btc', '2025-12-04 08:01:05'),
	(4179, 93497, 'btc', '2025-12-04 08:03:06'),
	(4180, 93567, 'btc', '2025-12-04 08:05:06'),
	(4181, 93497, 'btc', '2025-12-04 08:07:06'),
	(4182, 93377, 'btc', '2025-12-04 08:09:06'),
	(4183, 93179, 'btc', '2025-12-04 08:11:07'),
	(4184, 93115, 'btc', '2025-12-04 08:13:07'),
	(4185, 93128, 'btc', '2025-12-04 08:15:07'),
	(4186, 93198, 'btc', '2025-12-04 08:17:08'),
	(4187, 93169, 'btc', '2025-12-04 08:19:08'),
	(4188, 93194, 'btc', '2025-12-04 08:21:08'),
	(4189, 93188, 'btc', '2025-12-04 08:23:09'),
	(4190, 93163, 'btc', '2025-12-04 08:25:09'),
	(4191, 93169, 'btc', '2025-12-04 08:27:09'),
	(4192, 93159, 'btc', '2025-12-04 08:29:09'),
	(4193, 93071, 'btc', '2025-12-04 08:31:10'),
	(4194, 93128, 'btc', '2025-12-04 08:33:10'),
	(4195, 93235, 'btc', '2025-12-04 08:35:10'),
	(4196, 93240, 'btc', '2025-12-04 08:37:11'),
	(4197, 93240, 'btc', '2025-12-04 08:39:11'),
	(4198, 93334, 'btc', '2025-12-04 08:41:11'),
	(4199, 93364, 'btc', '2025-12-04 08:43:11'),
	(4200, 93333, 'btc', '2025-12-04 08:45:12'),
	(4201, 93334, 'btc', '2025-12-04 08:47:12'),
	(4202, 93382, 'btc', '2025-12-04 08:49:12'),
	(4203, 93234, 'btc', '2025-12-04 08:51:13'),
	(4204, 93181, 'btc', '2025-12-04 08:53:13'),
	(4205, 93145, 'btc', '2025-12-04 08:55:13'),
	(4206, 93198, 'btc', '2025-12-04 08:57:14'),
	(4207, 93233, 'btc', '2025-12-04 08:59:14'),
	(4208, 93268, 'btc', '2025-12-04 09:01:14'),
	(4209, 93327, 'btc', '2025-12-04 09:03:14'),
	(4210, 93304, 'btc', '2025-12-04 09:05:15'),
	(4211, 93547, 'btc', '2025-12-04 09:07:15'),
	(4212, 93616, 'btc', '2025-12-04 09:09:15'),
	(4213, 93531, 'btc', '2025-12-04 09:11:16'),
	(4214, 93440, 'btc', '2025-12-04 09:13:16'),
	(4215, 93324, 'btc', '2025-12-04 09:15:16'),
	(4216, 93294, 'btc', '2025-12-04 09:17:17'),
	(4217, 93302, 'btc', '2025-12-04 09:19:17'),
	(4218, 93321, 'btc', '2025-12-04 09:21:17'),
	(4219, 93361, 'btc', '2025-12-04 09:23:10'),
	(4220, 93379, 'btc', '2025-12-04 09:25:10'),
	(4221, 93381, 'btc', '2025-12-04 09:27:10'),
	(4222, 93349, 'btc', '2025-12-04 09:29:11'),
	(4223, 93381, 'btc', '2025-12-04 09:31:11'),
	(4224, 93408, 'btc', '2025-12-04 09:33:11'),
	(4225, 93454, 'btc', '2025-12-04 09:35:11'),
	(4226, 93427, 'btc', '2025-12-04 09:37:12'),
	(4227, 93486, 'btc', '2025-12-04 09:39:12'),
	(4228, 93485, 'btc', '2025-12-04 09:41:12'),
	(4229, 93427, 'btc', '2025-12-04 09:43:13'),
	(4230, 93465, 'btc', '2025-12-04 09:45:13'),
	(4231, 93440, 'btc', '2025-12-04 09:47:13'),
	(4232, 93419, 'btc', '2025-12-04 09:49:13'),
	(4233, 93480, 'btc', '2025-12-04 09:51:14'),
	(4234, 93541, 'btc', '2025-12-04 09:53:14'),
	(4235, 93540, 'btc', '2025-12-04 09:55:14'),
	(4236, 93451, 'btc', '2025-12-04 09:57:15'),
	(4237, 93458, 'btc', '2025-12-04 09:59:15'),
	(4238, 93539, 'btc', '2025-12-04 10:01:15'),
	(4239, 93507, 'btc', '2025-12-04 10:03:16'),
	(4240, 93528, 'btc', '2025-12-04 10:05:16'),
	(4241, 93446, 'btc', '2025-12-04 10:07:16'),
	(4242, 93398, 'btc', '2025-12-04 10:09:17'),
	(4243, 93395, 'btc', '2025-12-04 10:11:17'),
	(4244, 93399, 'btc', '2025-12-04 10:13:17'),
	(4245, 93363, 'btc', '2025-12-04 10:15:17'),
	(4246, 93342, 'btc', '2025-12-04 10:17:18'),
	(4247, 93317, 'btc', '2025-12-04 10:19:18'),
	(4248, 93288, 'btc', '2025-12-04 10:21:18'),
	(4249, 93344, 'btc', '2025-12-04 10:23:19'),
	(4250, 93325, 'btc', '2025-12-04 10:25:19'),
	(4251, 93359, 'btc', '2025-12-04 10:27:19'),
	(4252, 93313, 'btc', '2025-12-04 10:29:19'),
	(4253, 93326, 'btc', '2025-12-04 10:31:20'),
	(4254, 93299, 'btc', '2025-12-04 10:33:20'),
	(4255, 93330, 'btc', '2025-12-04 10:35:20'),
	(4256, 93340, 'btc', '2025-12-04 10:37:21'),
	(4257, 93318, 'btc', '2025-12-04 10:39:05'),
	(4258, 93335, 'btc', '2025-12-04 10:41:05'),
	(4259, 93307, 'btc', '2025-12-04 10:43:05'),
	(4260, 93261, 'btc', '2025-12-04 10:44:01'),
	(4261, 93332, 'btc', '2025-12-04 10:46:01'),
	(4262, 93291, 'btc', '2025-12-04 10:48:02'),
	(4263, 93246, 'btc', '2025-12-04 10:50:02'),
	(4264, 93207, 'btc', '2025-12-04 10:52:02'),
	(4265, 93195, 'btc', '2025-12-04 10:54:02'),
	(4266, 93261, 'btc', '2025-12-04 10:56:03'),
	(4267, 93252, 'btc', '2025-12-04 10:58:03'),
	(4268, 93260, 'btc', '2025-12-04 11:00:03'),
	(4269, 93271, 'btc', '2025-12-04 11:02:04'),
	(4270, 93260, 'btc', '2025-12-04 11:04:04'),
	(4271, 93201, 'btc', '2025-12-04 11:06:04'),
	(4272, 93213, 'btc', '2025-12-04 11:08:04'),
	(4273, 93260, 'btc', '2025-12-04 11:10:05'),
	(4274, 93265, 'btc', '2025-12-04 11:12:05'),
	(4275, 93240, 'btc', '2025-12-04 11:14:05'),
	(4276, 93243, 'btc', '2025-12-04 11:16:06'),
	(4277, 93230, 'btc', '2025-12-04 11:18:06'),
	(4278, 93223, 'btc', '2025-12-04 11:20:06'),
	(4279, 93220, 'btc', '2025-12-04 11:22:07'),
	(4280, 93144, 'btc', '2025-12-04 11:24:07'),
	(4281, 93059, 'btc', '2025-12-04 11:26:07'),
	(4282, 93036, 'btc', '2025-12-04 11:28:08'),
	(4283, 93005, 'btc', '2025-12-04 11:30:08'),
	(4284, 92960, 'btc', '2025-12-04 11:32:08'),
	(4285, 92801, 'btc', '2025-12-04 11:34:08'),
	(4286, 92856, 'btc', '2025-12-04 11:36:09'),
	(4287, 92821, 'btc', '2025-12-04 11:38:09'),
	(4288, 92832, 'btc', '2025-12-04 11:40:09'),
	(4289, 92775, 'btc', '2025-12-04 11:42:10'),
	(4290, 92819, 'btc', '2025-12-04 11:44:10'),
	(4291, 92816, 'btc', '2025-12-04 11:46:10'),
	(4292, 92839, 'btc', '2025-12-04 11:48:10'),
	(4293, 92870, 'btc', '2025-12-04 11:50:11'),
	(4294, 92905, 'btc', '2025-12-04 11:52:11'),
	(4295, 92935, 'btc', '2025-12-04 11:54:11'),
	(4296, 92977, 'btc', '2025-12-04 11:56:12'),
	(4297, 92923, 'btc', '2025-12-04 11:58:12'),
	(4298, 92959, 'btc', '2025-12-04 12:00:12'),
	(4299, 93001, 'btc', '2025-12-04 12:02:13'),
	(4300, 93039, 'btc', '2025-12-04 12:04:13'),
	(4301, 92972, 'btc', '2025-12-04 12:06:13'),
	(4302, 92927, 'btc', '2025-12-04 12:08:14'),
	(4303, 92957, 'btc', '2025-12-04 12:10:14'),
	(4304, 92943, 'btc', '2025-12-04 12:12:14'),
	(4305, 92994, 'btc', '2025-12-04 12:14:14'),
	(4306, 93015, 'btc', '2025-12-04 12:16:15'),
	(4307, 92948, 'btc', '2025-12-04 12:18:15'),
	(4308, 92890, 'btc', '2025-12-04 12:20:15'),
	(4309, 92803, 'btc', '2025-12-04 12:22:16'),
	(4310, 92791, 'btc', '2025-12-04 12:24:16'),
	(4311, 92853, 'btc', '2025-12-04 12:26:16'),
	(4312, 92882, 'btc', '2025-12-04 12:28:16'),
	(4313, 92855, 'btc', '2025-12-04 12:30:17'),
	(4314, 92868, 'btc', '2025-12-04 12:32:17'),
	(4315, 92919, 'btc', '2025-12-04 12:34:17'),
	(4316, 92990, 'btc', '2025-12-04 12:36:18'),
	(4317, 93004, 'btc', '2025-12-04 12:38:18'),
	(4318, 93012, 'btc', '2025-12-04 12:40:18'),
	(4319, 93123, 'btc', '2025-12-04 12:42:18'),
	(4320, 93079, 'btc', '2025-12-04 12:44:19'),
	(4321, 93178, 'btc', '2025-12-04 12:46:19'),
	(4322, 93116, 'btc', '2025-12-04 12:48:19'),
	(4323, 93068, 'btc', '2025-12-04 12:50:20'),
	(4324, 93079, 'btc', '2025-12-04 12:52:20'),
	(4325, 93056, 'btc', '2025-12-04 12:54:20'),
	(4326, 93117, 'btc', '2025-12-04 12:56:20'),
	(4327, 92949, 'btc', '2025-12-04 12:58:21'),
	(4328, 93000, 'btc', '2025-12-04 13:00:21'),
	(4329, 92906, 'btc', '2025-12-04 13:02:21'),
	(4330, 92797, 'btc', '2025-12-04 13:04:22'),
	(4331, 92602, 'btc', '2025-12-04 13:06:22'),
	(4332, 92617, 'btc', '2025-12-04 13:08:22'),
	(4333, 92615, 'btc', '2025-12-04 13:10:23'),
	(4334, 92657, 'btc', '2025-12-04 13:12:23'),
	(4335, 92590, 'btc', '2025-12-04 13:13:14'),
	(4336, 92594, 'btc', '2025-12-04 13:15:14'),
	(4337, 92622, 'btc', '2025-12-04 13:17:15'),
	(4338, 92674, 'btc', '2025-12-04 13:19:32'),
	(4339, 92676, 'btc', '2025-12-04 13:20:54'),
	(4340, 92774, 'btc', '2025-12-04 13:22:54'),
	(4341, 92811, 'btc', '2025-12-04 13:24:54'),
	(4342, 92846, 'btc', '2025-12-04 13:26:54'),
	(4343, 92848, 'btc', '2025-12-04 13:28:55'),
	(4344, 92697, 'btc', '2025-12-04 13:30:55'),
	(4345, 92851, 'btc', '2025-12-04 13:32:55'),
	(4346, 92837, 'btc', '2025-12-04 13:34:56'),
	(4347, 92721, 'btc', '2025-12-04 13:36:56'),
	(4348, 92731, 'btc', '2025-12-04 13:38:56'),
	(4349, 92844, 'btc', '2025-12-04 13:40:57'),
	(4350, 92791, 'btc', '2025-12-04 13:42:57'),
	(4351, 92734, 'btc', '2025-12-04 13:44:57'),
	(4352, 92550, 'btc', '2025-12-04 13:46:57'),
	(4353, 92460, 'btc', '2025-12-04 13:48:58'),
	(4354, 92481, 'btc', '2025-12-04 13:50:58'),
	(4355, 92485, 'btc', '2025-12-04 13:52:04'),
	(4356, 92601, 'btc', '2025-12-04 13:54:05'),
	(4357, 92652, 'btc', '2025-12-04 13:56:05'),
	(4358, 92546, 'btc', '2025-12-04 13:58:06'),
	(4359, 92525, 'btc', '2025-12-04 14:00:06'),
	(4360, 92618, 'btc', '2025-12-04 14:02:06'),
	(4361, 92606, 'btc', '2025-12-04 14:04:06'),
	(4362, 92551, 'btc', '2025-12-04 14:06:07'),
	(4363, 92620, 'btc', '2025-12-04 14:08:07'),
	(4364, 92603, 'btc', '2025-12-04 14:10:07'),
	(4365, 92611, 'btc', '2025-12-04 14:12:08'),
	(4366, 92674, 'btc', '2025-12-04 14:14:08'),
	(4367, 92674, 'btc', '2025-12-04 14:16:02'),
	(4368, 92646, 'btc', '2025-12-04 14:18:02'),
	(4369, 92636, 'btc', '2025-12-04 14:20:02'),
	(4370, 92628, 'btc', '2025-12-04 14:22:03'),
	(4371, 92658, 'btc', '2025-12-04 14:24:03'),
	(4372, 92697, 'btc', '2025-12-04 14:26:03'),
	(4373, 92813, 'btc', '2025-12-04 14:28:04'),
	(4374, 92723, 'btc', '2025-12-04 14:30:04'),
	(4375, 92478, 'btc', '2025-12-04 14:32:04'),
	(4376, 92600, 'btc', '2025-12-04 14:34:05'),
	(4377, 92600, 'btc', '2025-12-04 14:36:05'),
	(4378, 92602, 'btc', '2025-12-04 14:38:05'),
	(4379, 92588, 'btc', '2025-12-04 14:40:06'),
	(4380, 92627, 'btc', '2025-12-04 14:42:06'),
	(4381, 92687, 'btc', '2025-12-04 14:44:06'),
	(4382, 92628, 'btc', '2025-12-04 14:46:06'),
	(4383, 92615, 'btc', '2025-12-04 14:48:07'),
	(4384, 92373, 'btc', '2025-12-04 14:50:07'),
	(4385, 92087, 'btc', '2025-12-04 14:52:07'),
	(4386, 91988, 'btc', '2025-12-04 14:54:08'),
	(4387, 92092, 'btc', '2025-12-04 14:56:08'),
	(4388, 91874, 'btc', '2025-12-04 14:58:08'),
	(4389, 91956, 'btc', '2025-12-04 15:00:08'),
	(4390, 92111, 'btc', '2025-12-04 15:02:09'),
	(4391, 92147, 'btc', '2025-12-04 15:04:09'),
	(4392, 92296, 'btc', '2025-12-04 15:06:09'),
	(4393, 92384, 'btc', '2025-12-04 15:08:10'),
	(4394, 92401, 'btc', '2025-12-04 15:10:10'),
	(4395, 92569, 'btc', '2025-12-04 15:12:10'),
	(4396, 92650, 'btc', '2025-12-04 15:14:10'),
	(4397, 92551, 'btc', '2025-12-04 15:16:11'),
	(4398, 92648, 'btc', '2025-12-04 15:18:11'),
	(4399, 92752, 'btc', '2025-12-04 15:20:11'),
	(4400, 92757, 'btc', '2025-12-04 15:22:12'),
	(4401, 92674, 'btc', '2025-12-04 15:24:12'),
	(4402, 92381, 'btc', '2025-12-04 15:26:12'),
	(4403, 92503, 'btc', '2025-12-04 15:28:12'),
	(4404, 92569, 'btc', '2025-12-04 15:30:13'),
	(4405, 92528, 'btc', '2025-12-04 15:32:13'),
	(4406, 92485, 'btc', '2025-12-04 15:34:13'),
	(4407, 92567, 'btc', '2025-12-04 15:36:14'),
	(4408, 92770, 'btc', '2025-12-04 15:38:14'),
	(4409, 93032, 'btc', '2025-12-04 15:40:14'),
	(4410, 92966, 'btc', '2025-12-04 15:42:15'),
	(4411, 93024, 'btc', '2025-12-04 15:44:15'),
	(4412, 92779, 'btc', '2025-12-04 16:08:05'),
	(4413, 92765, 'btc', '2025-12-04 16:10:05'),
	(4414, 92786, 'btc', '2025-12-04 16:12:05'),
	(4415, 92876, 'btc', '2025-12-04 16:14:05'),
	(4416, 92814, 'btc', '2025-12-04 16:16:06'),
	(4417, 92914, 'btc', '2025-12-04 16:18:06'),
	(4418, 93078, 'btc', '2025-12-04 16:20:06'),
	(4419, 92997, 'btc', '2025-12-04 16:22:07'),
	(4420, 93096, 'btc', '2025-12-04 16:24:07'),
	(4421, 93050, 'btc', '2025-12-04 16:26:07'),
	(4422, 92961, 'btc', '2025-12-04 16:28:08'),
	(4423, 92858, 'btc', '2025-12-04 16:30:08'),
	(4424, 92834, 'btc', '2025-12-04 16:32:08'),
	(4425, 92798, 'btc', '2025-12-04 16:34:09'),
	(4426, 92763, 'btc', '2025-12-04 16:36:09'),
	(4427, 92698, 'btc', '2025-12-04 16:38:09'),
	(4428, 92602, 'btc', '2025-12-04 16:40:09'),
	(4429, 92503, 'btc', '2025-12-04 16:42:10'),
	(4430, 92480, 'btc', '2025-12-04 16:44:10'),
	(4431, 92569, 'btc', '2025-12-04 16:46:10'),
	(4432, 92620, 'btc', '2025-12-04 16:48:11'),
	(4433, 92520, 'btc', '2025-12-04 16:50:11'),
	(4434, 92541, 'btc', '2025-12-04 16:52:11'),
	(4435, 92332, 'btc', '2025-12-04 16:54:12'),
	(4436, 92329, 'btc', '2025-12-04 16:56:12'),
	(4437, 92464, 'btc', '2025-12-04 16:58:12'),
	(4438, 92425, 'btc', '2025-12-04 17:00:12'),
	(4439, 92487, 'btc', '2025-12-04 17:02:13'),
	(4440, 92357, 'btc', '2025-12-04 17:04:13'),
	(4441, 92241, 'btc', '2025-12-04 17:06:13'),
	(4442, 92224, 'btc', '2025-12-04 17:08:14'),
	(4443, 92209, 'btc', '2025-12-04 17:10:14'),
	(4444, 92171, 'btc', '2025-12-04 17:12:14'),
	(4445, 92283, 'btc', '2025-12-04 17:14:15'),
	(4446, 92243, 'btc', '2025-12-04 17:16:15'),
	(4447, 92131, 'btc', '2025-12-04 17:18:15'),
	(4448, 92147, 'btc', '2025-12-04 17:20:15'),
	(4449, 92118, 'btc', '2025-12-04 17:22:16'),
	(4450, 92169, 'btc', '2025-12-04 17:24:16'),
	(4451, 92220, 'btc', '2025-12-04 17:26:17'),
	(4452, 92100, 'btc', '2025-12-04 17:28:17'),
	(4453, 92089, 'btc', '2025-12-04 17:30:17'),
	(4454, 92013, 'btc', '2025-12-04 17:32:18'),
	(4455, 92057, 'btc', '2025-12-04 17:34:18'),
	(4456, 92303, 'btc', '2025-12-04 17:36:18'),
	(4457, 92106, 'btc', '2025-12-04 17:38:19'),
	(4458, 91823, 'btc', '2025-12-04 17:40:19'),
	(4459, 91909, 'btc', '2025-12-04 17:42:19'),
	(4460, 91937, 'btc', '2025-12-04 17:44:20'),
	(4461, 91913, 'btc', '2025-12-04 17:46:20'),
	(4462, 91992, 'btc', '2025-12-04 17:48:20'),
	(4463, 92147, 'btc', '2025-12-04 17:50:21'),
	(4464, 92270, 'btc', '2025-12-04 17:52:21'),
	(4465, 92271, 'btc', '2025-12-04 17:54:21'),
	(4466, 92384, 'btc', '2025-12-04 17:56:22'),
	(4467, 92410, 'btc', '2025-12-04 17:58:22'),
	(4468, 92405, 'btc', '2025-12-04 18:00:22'),
	(4469, 92267, 'btc', '2025-12-04 18:02:23'),
	(4470, 92251, 'btc', '2025-12-04 18:04:23'),
	(4471, 92288, 'btc', '2025-12-04 18:06:23'),
	(4472, 92218, 'btc', '2025-12-04 18:08:24'),
	(4473, 92267, 'btc', '2025-12-04 18:10:24'),
	(4474, 92358, 'btc', '2025-12-04 18:12:24'),
	(4475, 92371, 'btc', '2025-12-04 18:14:25'),
	(4476, 92234, 'btc', '2025-12-04 18:16:25'),
	(4477, 92208, 'btc', '2025-12-04 18:18:25'),
	(4478, 92264, 'btc', '2025-12-04 18:20:26'),
	(4479, 92364, 'btc', '2025-12-04 18:22:26'),
	(4480, 92545, 'btc', '2025-12-04 18:24:26'),
	(4481, 92465, 'btc', '2025-12-04 18:26:26'),
	(4482, 92443, 'btc', '2025-12-04 18:28:27'),
	(4483, 92431, 'btc', '2025-12-04 18:30:27'),
	(4484, 92506, 'btc', '2025-12-04 18:32:27'),
	(4485, 92494, 'btc', '2025-12-04 18:34:28'),
	(4486, 92535, 'btc', '2025-12-04 18:36:28'),
	(4487, 92475, 'btc', '2025-12-04 18:38:28'),
	(4488, 92258, 'btc', '2025-12-04 18:40:29'),
	(4489, 92096, 'btc', '2025-12-04 18:42:29'),
	(4490, 92028, 'btc', '2025-12-04 18:44:29'),
	(4491, 92043, 'btc', '2025-12-04 18:46:30'),
	(4492, 92078, 'btc', '2025-12-04 18:48:30'),
	(4493, 92162, 'btc', '2025-12-04 18:50:30'),
	(4494, 92124, 'btc', '2025-12-04 18:52:31'),
	(4495, 92016, 'btc', '2025-12-04 18:54:31'),
	(4496, 92005, 'btc', '2025-12-04 18:56:31'),
	(4497, 92017, 'btc', '2025-12-04 18:58:32'),
	(4498, 92163, 'btc', '2025-12-04 19:00:32'),
	(4499, 92092, 'btc', '2025-12-04 19:02:32'),
	(4500, 91946, 'btc', '2025-12-04 19:04:32'),
	(4501, 92078, 'btc', '2025-12-04 19:06:33'),
	(4502, 91962, 'btc', '2025-12-04 19:08:33'),
	(4503, 91878, 'btc', '2025-12-04 19:10:33'),
	(4504, 91814, 'btc', '2025-12-04 19:12:34'),
	(4505, 91430, 'btc', '2025-12-04 19:14:34'),
	(4506, 91345, 'btc', '2025-12-04 19:16:34'),
	(4507, 91483, 'btc', '2025-12-04 19:18:35'),
	(4508, 91124, 'btc', '2025-12-04 19:20:35'),
	(4509, 91111, 'btc', '2025-12-04 19:22:35'),
	(4510, 90931, 'btc', '2025-12-04 19:24:36'),
	(4511, 91260, 'btc', '2025-12-04 19:26:36'),
	(4512, 91370, 'btc', '2025-12-04 19:28:36'),
	(4513, 91350, 'btc', '2025-12-04 19:30:36'),
	(4514, 91469, 'btc', '2025-12-04 19:32:37'),
	(4515, 91637, 'btc', '2025-12-04 19:34:37'),
	(4516, 91836, 'btc', '2025-12-04 19:36:37'),
	(4517, 91871, 'btc', '2025-12-04 19:38:38'),
	(4518, 91872, 'btc', '2025-12-04 19:40:38'),
	(4519, 91900, 'btc', '2025-12-04 19:42:38'),
	(4520, 91940, 'btc', '2025-12-04 19:44:39'),
	(4521, 91838, 'btc', '2025-12-04 19:46:39'),
	(4522, 92108, 'btc', '2025-12-04 19:48:39'),
	(4523, 92014, 'btc', '2025-12-04 19:50:40'),
	(4524, 91943, 'btc', '2025-12-04 19:52:40'),
	(4525, 92032, 'btc', '2025-12-04 19:54:40'),
	(4526, 92000, 'btc', '2025-12-04 19:56:40'),
	(4527, 92005, 'btc', '2025-12-04 19:58:41'),
	(4528, 92069, 'btc', '2025-12-04 20:00:41'),
	(4529, 92165, 'btc', '2025-12-04 20:02:41'),
	(4530, 92032, 'btc', '2025-12-04 20:04:42'),
	(4531, 91946, 'btc', '2025-12-04 20:06:42'),
	(4532, 91808, 'btc', '2025-12-04 20:08:42'),
	(4533, 92029, 'btc', '2025-12-04 20:10:42'),
	(4534, 91949, 'btc', '2025-12-04 20:12:43'),
	(4535, 92011, 'btc', '2025-12-04 20:14:43'),
	(4536, 91993, 'btc', '2025-12-04 20:16:43'),
	(4537, 91933, 'btc', '2025-12-04 20:18:44'),
	(4538, 92045, 'btc', '2025-12-04 20:20:44'),
	(4539, 91990, 'btc', '2025-12-04 20:22:44'),
	(4540, 92051, 'btc', '2025-12-04 20:24:45'),
	(4541, 92100, 'btc', '2025-12-04 20:26:45'),
	(4542, 92142, 'btc', '2025-12-04 20:28:45'),
	(4543, 92041, 'btc', '2025-12-04 20:30:46'),
	(4544, 92147, 'btc', '2025-12-04 20:32:46'),
	(4545, 92133, 'btc', '2025-12-04 20:34:46'),
	(4546, 92094, 'btc', '2025-12-04 20:36:47'),
	(4547, 92128, 'btc', '2025-12-04 20:38:47'),
	(4548, 92195, 'btc', '2025-12-04 20:40:47'),
	(4549, 92156, 'btc', '2025-12-04 20:42:47'),
	(4550, 92306, 'btc', '2025-12-04 20:44:48'),
	(4551, 92325, 'btc', '2025-12-04 20:46:48'),
	(4552, 92394, 'btc', '2025-12-04 20:48:48'),
	(4553, 92498, 'btc', '2025-12-04 20:50:49'),
	(4554, 92449, 'btc', '2025-12-04 20:52:49'),
	(4555, 92447, 'btc', '2025-12-04 20:54:49'),
	(4556, 92512, 'btc', '2025-12-04 20:56:50'),
	(4557, 92516, 'btc', '2025-12-04 20:58:50'),
	(4558, 92448, 'btc', '2025-12-04 21:00:50'),
	(4559, 92386, 'btc', '2025-12-04 21:02:50'),
	(4560, 92418, 'btc', '2025-12-04 21:04:51'),
	(4561, 92654, 'btc', '2025-12-04 21:06:51'),
	(4562, 92592, 'btc', '2025-12-04 21:08:52'),
	(4563, 92614, 'btc', '2025-12-04 21:10:52'),
	(4564, 92570, 'btc', '2025-12-04 21:12:52'),
	(4565, 92440, 'btc', '2025-12-04 21:14:52'),
	(4566, 92492, 'btc', '2025-12-04 21:16:53'),
	(4567, 92503, 'btc', '2025-12-04 21:18:53'),
	(4568, 92418, 'btc', '2025-12-04 21:20:53'),
	(4569, 92375, 'btc', '2025-12-04 21:22:54'),
	(4570, 92404, 'btc', '2025-12-04 21:24:54'),
	(4571, 92387, 'btc', '2025-12-04 21:26:54'),
	(4572, 92384, 'btc', '2025-12-04 21:28:55'),
	(4573, 92308, 'btc', '2025-12-04 21:30:55'),
	(4574, 92304, 'btc', '2025-12-04 21:32:55'),
	(4575, 92288, 'btc', '2025-12-04 21:34:56'),
	(4576, 92258, 'btc', '2025-12-04 21:36:56'),
	(4577, 92294, 'btc', '2025-12-04 21:38:56'),
	(4578, 92304, 'btc', '2025-12-04 21:40:57'),
	(4579, 92253, 'btc', '2025-12-04 21:42:57'),
	(4580, 92242, 'btc', '2025-12-04 21:44:57'),
	(4581, 92154, 'btc', '2025-12-04 21:46:57'),
	(4582, 92220, 'btc', '2025-12-04 21:48:58'),
	(4583, 92148, 'btc', '2025-12-04 21:50:58'),
	(4584, 92236, 'btc', '2025-12-04 21:52:58'),
	(4585, 92194, 'btc', '2025-12-04 21:54:59'),
	(4586, 92185, 'btc', '2025-12-04 21:56:59'),
	(4587, 92163, 'btc', '2025-12-04 21:58:59'),
	(4588, 92214, 'btc', '2025-12-04 22:00:59'),
	(4589, 92384, 'btc', '2025-12-04 22:03:00'),
	(4590, 92239, 'btc', '2025-12-04 22:05:00'),
	(4591, 92288, 'btc', '2025-12-04 22:07:00'),
	(4592, 92297, 'btc', '2025-12-04 22:09:01'),
	(4593, 92332, 'btc', '2025-12-04 22:11:01'),
	(4594, 92263, 'btc', '2025-12-04 22:13:01'),
	(4595, 92311, 'btc', '2025-12-04 22:15:01'),
	(4596, 92298, 'btc', '2025-12-04 22:17:02'),
	(4597, 92343, 'btc', '2025-12-04 22:19:02'),
	(4598, 92343, 'btc', '2025-12-04 22:21:02'),
	(4599, 92195, 'btc', '2025-12-04 22:23:03'),
	(4600, 92212, 'btc', '2025-12-04 22:25:03'),
	(4601, 92203, 'btc', '2025-12-04 22:27:03'),
	(4602, 92195, 'btc', '2025-12-04 22:29:04'),
	(4603, 92301, 'btc', '2025-12-04 22:31:04'),
	(4604, 92300, 'btc', '2025-12-04 22:33:04'),
	(4605, 92463, 'btc', '2025-12-04 22:35:05'),
	(4606, 92400, 'btc', '2025-12-04 22:37:05'),
	(4607, 92400, 'btc', '2025-12-04 22:39:05'),
	(4608, 92388, 'btc', '2025-12-04 22:41:05'),
	(4609, 92420, 'btc', '2025-12-04 22:43:06'),
	(4610, 92463, 'btc', '2025-12-04 22:45:06'),
	(4611, 92423, 'btc', '2025-12-04 22:47:06'),
	(4612, 92417, 'btc', '2025-12-04 22:49:07'),
	(4613, 92466, 'btc', '2025-12-04 22:51:07'),
	(4614, 92452, 'btc', '2025-12-04 22:53:07'),
	(4615, 92390, 'btc', '2025-12-04 22:55:07'),
	(4616, 92448, 'btc', '2025-12-04 22:57:08'),
	(4617, 92347, 'btc', '2025-12-04 22:59:08'),
	(4618, 92271, 'btc', '2025-12-04 23:01:08'),
	(4619, 92296, 'btc', '2025-12-04 23:03:09'),
	(4620, 92365, 'btc', '2025-12-04 23:05:09'),
	(4621, 92449, 'btc', '2025-12-04 23:07:09'),
	(4622, 92411, 'btc', '2025-12-04 23:09:09'),
	(4623, 92269, 'btc', '2025-12-04 23:11:10'),
	(4624, 92303, 'btc', '2025-12-04 23:13:10'),
	(4625, 92318, 'btc', '2025-12-04 23:15:10'),
	(4626, 92357, 'btc', '2025-12-04 23:17:11'),
	(4627, 92306, 'btc', '2025-12-04 23:19:11'),
	(4628, 92258, 'btc', '2025-12-04 23:21:11'),
	(4629, 92285, 'btc', '2025-12-04 23:23:12'),
	(4630, 92235, 'btc', '2025-12-04 23:25:12'),
	(4631, 92220, 'btc', '2025-12-04 23:27:12'),
	(4632, 92218, 'btc', '2025-12-04 23:29:13'),
	(4633, 92217, 'btc', '2025-12-04 23:31:13'),
	(4634, 92280, 'btc', '2025-12-04 23:33:13'),
	(4635, 92272, 'btc', '2025-12-04 23:35:13'),
	(4636, 92289, 'btc', '2025-12-04 23:37:14'),
	(4637, 92240, 'btc', '2025-12-04 23:39:14'),
	(4638, 92130, 'btc', '2025-12-04 23:41:14'),
	(4639, 92121, 'btc', '2025-12-04 23:43:15'),
	(4640, 92117, 'btc', '2025-12-04 23:45:15'),
	(4641, 92151, 'btc', '2025-12-04 23:47:15'),
	(4642, 92127, 'btc', '2025-12-04 23:49:16'),
	(4643, 92145, 'btc', '2025-12-04 23:51:16'),
	(4644, 92125, 'btc', '2025-12-04 23:53:16'),
	(4645, 92117, 'btc', '2025-12-04 23:55:16'),
	(4646, 92144, 'btc', '2025-12-04 23:57:17'),
	(4647, 92090, 'btc', '2025-12-04 23:59:17'),
	(4648, 92164, 'btc', '2025-12-05 00:01:17'),
	(4649, 92181, 'btc', '2025-12-05 00:03:18'),
	(4650, 92228, 'btc', '2025-12-05 00:05:18'),
	(4651, 92253, 'btc', '2025-12-05 00:07:18'),
	(4652, 92205, 'btc', '2025-12-05 00:09:19'),
	(4653, 92162, 'btc', '2025-12-05 00:11:19'),
	(4654, 92136, 'btc', '2025-12-05 00:13:19'),
	(4655, 92124, 'btc', '2025-12-05 00:15:20'),
	(4656, 92136, 'btc', '2025-12-05 00:17:20'),
	(4657, 92166, 'btc', '2025-12-05 00:19:21'),
	(4658, 92124, 'btc', '2025-12-05 00:21:21'),
	(4659, 92325, 'btc', '2025-12-05 00:23:21'),
	(4660, 92392, 'btc', '2025-12-05 00:25:21'),
	(4661, 92348, 'btc', '2025-12-05 00:27:22'),
	(4662, 92322, 'btc', '2025-12-05 00:29:22'),
	(4663, 92358, 'btc', '2025-12-05 00:31:22'),
	(4664, 92389, 'btc', '2025-12-05 00:33:23'),
	(4665, 92293, 'btc', '2025-12-05 00:35:23'),
	(4666, 92312, 'btc', '2025-12-05 00:37:23'),
	(4667, 92331, 'btc', '2025-12-05 00:39:23'),
	(4668, 92387, 'btc', '2025-12-05 00:41:24'),
	(4669, 92426, 'btc', '2025-12-05 00:43:24'),
	(4670, 92357, 'btc', '2025-12-05 00:45:24'),
	(4671, 92370, 'btc', '2025-12-05 00:47:25'),
	(4672, 92393, 'btc', '2025-12-05 00:49:25'),
	(4673, 92285, 'btc', '2025-12-05 00:51:25'),
	(4674, 92355, 'btc', '2025-12-05 00:53:25'),
	(4675, 92272, 'btc', '2025-12-05 00:55:26'),
	(4676, 92272, 'btc', '2025-12-05 00:57:26'),
	(4677, 92305, 'btc', '2025-12-05 00:59:26'),
	(4678, 92269, 'btc', '2025-12-05 01:01:27'),
	(4679, 92333, 'btc', '2025-12-05 01:03:27'),
	(4680, 92382, 'btc', '2025-12-05 01:05:27'),
	(4681, 92445, 'btc', '2025-12-05 01:07:27'),
	(4682, 92464, 'btc', '2025-12-05 01:09:28'),
	(4683, 92403, 'btc', '2025-12-05 01:11:28'),
	(4684, 92381, 'btc', '2025-12-05 01:13:28'),
	(4685, 92393, 'btc', '2025-12-05 01:15:29'),
	(4686, 92471, 'btc', '2025-12-05 01:17:29'),
	(4687, 92448, 'btc', '2025-12-05 01:19:29'),
	(4688, 92410, 'btc', '2025-12-05 01:21:30'),
	(4689, 92437, 'btc', '2025-12-05 01:23:30'),
	(4690, 92500, 'btc', '2025-12-05 01:25:30'),
	(4691, 92519, 'btc', '2025-12-05 01:27:30'),
	(4692, 92517, 'btc', '2025-12-05 01:29:31'),
	(4693, 92526, 'btc', '2025-12-05 01:31:31'),
	(4694, 92440, 'btc', '2025-12-05 01:33:31'),
	(4695, 92410, 'btc', '2025-12-05 01:35:32'),
	(4696, 92439, 'btc', '2025-12-05 01:37:32'),
	(4697, 92450, 'btc', '2025-12-05 01:39:32'),
	(4698, 92440, 'btc', '2025-12-05 01:41:32'),
	(4699, 92468, 'btc', '2025-12-05 01:43:33'),
	(4700, 92401, 'btc', '2025-12-05 01:45:33'),
	(4701, 92409, 'btc', '2025-12-05 01:47:33'),
	(4702, 92484, 'btc', '2025-12-05 01:49:34'),
	(4703, 92487, 'btc', '2025-12-05 01:51:34'),
	(4704, 92349, 'btc', '2025-12-05 01:53:34'),
	(4705, 92372, 'btc', '2025-12-05 01:55:35'),
	(4706, 92348, 'btc', '2025-12-05 01:57:35'),
	(4707, 92358, 'btc', '2025-12-05 01:59:35'),
	(4708, 92307, 'btc', '2025-12-05 02:01:36'),
	(4709, 92271, 'btc', '2025-12-05 02:03:36'),
	(4710, 92326, 'btc', '2025-12-05 02:05:36'),
	(4711, 92332, 'btc', '2025-12-05 02:07:36'),
	(4712, 92308, 'btc', '2025-12-05 02:09:37'),
	(4713, 92253, 'btc', '2025-12-05 02:11:37'),
	(4714, 92355, 'btc', '2025-12-05 02:13:37'),
	(4715, 92457, 'btc', '2025-12-05 02:15:38'),
	(4716, 92505, 'btc', '2025-12-05 02:17:38'),
	(4717, 92536, 'btc', '2025-12-05 02:19:38'),
	(4718, 92520, 'btc', '2025-12-05 02:21:39'),
	(4719, 92536, 'btc', '2025-12-05 02:23:39'),
	(4720, 92548, 'btc', '2025-12-05 02:25:40'),
	(4721, 92575, 'btc', '2025-12-05 02:27:40'),
	(4722, 92568, 'btc', '2025-12-05 02:29:40'),
	(4723, 92549, 'btc', '2025-12-05 02:31:41'),
	(4724, 92483, 'btc', '2025-12-05 02:33:41'),
	(4725, 92487, 'btc', '2025-12-05 02:35:41'),
	(4726, 92526, 'btc', '2025-12-05 02:37:41'),
	(4727, 92658, 'btc', '2025-12-05 02:39:42'),
	(4728, 92648, 'btc', '2025-12-05 02:41:42'),
	(4729, 92631, 'btc', '2025-12-05 02:43:42'),
	(4730, 92622, 'btc', '2025-12-05 02:45:43'),
	(4731, 92580, 'btc', '2025-12-05 02:47:43'),
	(4732, 92584, 'btc', '2025-12-05 02:49:43'),
	(4733, 92577, 'btc', '2025-12-05 02:51:43'),
	(4734, 92582, 'btc', '2025-12-05 02:53:44'),
	(4735, 92532, 'btc', '2025-12-05 02:55:44'),
	(4736, 92488, 'btc', '2025-12-05 02:57:44'),
	(4737, 92508, 'btc', '2025-12-05 02:59:45'),
	(4738, 92525, 'btc', '2025-12-05 03:01:45'),
	(4739, 92543, 'btc', '2025-12-05 03:03:45'),
	(4740, 92541, 'btc', '2025-12-05 03:05:46'),
	(4741, 92556, 'btc', '2025-12-05 03:07:46'),
	(4742, 92619, 'btc', '2025-12-05 03:09:46'),
	(4743, 92554, 'btc', '2025-12-05 03:11:47'),
	(4744, 92549, 'btc', '2025-12-05 03:13:47'),
	(4745, 92548, 'btc', '2025-12-05 03:15:47'),
	(4746, 92545, 'btc', '2025-12-05 03:17:47'),
	(4747, 92531, 'btc', '2025-12-05 03:19:48'),
	(4748, 92469, 'btc', '2025-12-05 03:21:48'),
	(4749, 92411, 'btc', '2025-12-05 03:23:48'),
	(4750, 92429, 'btc', '2025-12-05 03:25:49'),
	(4751, 92400, 'btc', '2025-12-05 03:27:49'),
	(4752, 92408, 'btc', '2025-12-05 03:29:49'),
	(4753, 92385, 'btc', '2025-12-05 03:31:50'),
	(4754, 92381, 'btc', '2025-12-05 03:33:50'),
	(4755, 92426, 'btc', '2025-12-05 03:35:50'),
	(4756, 92338, 'btc', '2025-12-05 03:37:50'),
	(4757, 92380, 'btc', '2025-12-05 03:39:51'),
	(4758, 92331, 'btc', '2025-12-05 03:41:51'),
	(4759, 92328, 'btc', '2025-12-05 03:43:51'),
	(4760, 92301, 'btc', '2025-12-05 03:45:52'),
	(4761, 92293, 'btc', '2025-12-05 03:47:52'),
	(4762, 92306, 'btc', '2025-12-05 03:49:52'),
	(4763, 92311, 'btc', '2025-12-05 03:51:52'),
	(4764, 92316, 'btc', '2025-12-05 03:53:53'),
	(4765, 92291, 'btc', '2025-12-05 03:55:53'),
	(4766, 92142, 'btc', '2025-12-05 03:57:53'),
	(4767, 92162, 'btc', '2025-12-05 03:59:54'),
	(4768, 92252, 'btc', '2025-12-05 04:01:54'),
	(4769, 92282, 'btc', '2025-12-05 04:03:54'),
	(4770, 92312, 'btc', '2025-12-05 04:05:55'),
	(4771, 92236, 'btc', '2025-12-05 04:07:55'),
	(4772, 92264, 'btc', '2025-12-05 04:09:55'),
	(4773, 92304, 'btc', '2025-12-05 04:11:56'),
	(4774, 92285, 'btc', '2025-12-05 04:13:56'),
	(4775, 92346, 'btc', '2025-12-05 04:15:56'),
	(4776, 92348, 'btc', '2025-12-05 04:17:56'),
	(4777, 92371, 'btc', '2025-12-05 04:19:57'),
	(4778, 92300, 'btc', '2025-12-05 04:21:57'),
	(4779, 92249, 'btc', '2025-12-05 04:23:57'),
	(4780, 92216, 'btc', '2025-12-05 04:25:58'),
	(4781, 92248, 'btc', '2025-12-05 04:27:58'),
	(4782, 92190, 'btc', '2025-12-05 04:29:58'),
	(4783, 92068, 'btc', '2025-12-05 04:31:59'),
	(4784, 91891, 'btc', '2025-12-05 04:33:59'),
	(4785, 92077, 'btc', '2025-12-05 04:35:59'),
	(4786, 91998, 'btc', '2025-12-05 04:37:59'),
	(4787, 91978, 'btc', '2025-12-05 04:40:00'),
	(4788, 92018, 'btc', '2025-12-05 04:42:00'),
	(4789, 91914, 'btc', '2025-12-05 04:44:00'),
	(4790, 91865, 'btc', '2025-12-05 04:46:01'),
	(4791, 91885, 'btc', '2025-12-05 04:48:01'),
	(4792, 91901, 'btc', '2025-12-05 04:50:01'),
	(4793, 91933, 'btc', '2025-12-05 04:52:01'),
	(4794, 92073, 'btc', '2025-12-05 04:54:02'),
	(4795, 92042, 'btc', '2025-12-05 04:56:02'),
	(4796, 91993, 'btc', '2025-12-05 04:58:02'),
	(4797, 92028, 'btc', '2025-12-05 05:00:03'),
	(4798, 92071, 'btc', '2025-12-05 05:02:03'),
	(4799, 92080, 'btc', '2025-12-05 05:04:03'),
	(4800, 92116, 'btc', '2025-12-05 05:06:04'),
	(4801, 92159, 'btc', '2025-12-05 05:08:04'),
	(4802, 92095, 'btc', '2025-12-05 05:10:04'),
	(4803, 92164, 'btc', '2025-12-05 05:12:04'),
	(4804, 92149, 'btc', '2025-12-05 05:14:05'),
	(4805, 92155, 'btc', '2025-12-05 05:16:05'),
	(4806, 92140, 'btc', '2025-12-05 05:18:05'),
	(4807, 92107, 'btc', '2025-12-05 05:20:06'),
	(4808, 92054, 'btc', '2025-12-05 05:22:06'),
	(4809, 91974, 'btc', '2025-12-05 05:24:06'),
	(4810, 91941, 'btc', '2025-12-05 05:26:07'),
	(4811, 91923, 'btc', '2025-12-05 05:28:07'),
	(4812, 91977, 'btc', '2025-12-05 05:30:07'),
	(4813, 91880, 'btc', '2025-12-05 05:32:07'),
	(4814, 91923, 'btc', '2025-12-05 05:34:08'),
	(4815, 91937, 'btc', '2025-12-05 05:36:08'),
	(4816, 91972, 'btc', '2025-12-05 05:38:08'),
	(4817, 91944, 'btc', '2025-12-05 05:40:09'),
	(4818, 92014, 'btc', '2025-12-05 05:42:09'),
	(4819, 92005, 'btc', '2025-12-05 05:44:09'),
	(4820, 92025, 'btc', '2025-12-05 05:46:09'),
	(4821, 91917, 'btc', '2025-12-05 05:48:10'),
	(4822, 91946, 'btc', '2025-12-05 05:50:10'),
	(4823, 91960, 'btc', '2025-12-05 05:52:10'),
	(4824, 91921, 'btc', '2025-12-05 05:54:11'),
	(4825, 91898, 'btc', '2025-12-05 05:56:11'),
	(4826, 91895, 'btc', '2025-12-05 05:58:11'),
	(4827, 91970, 'btc', '2025-12-05 06:00:11'),
	(4828, 91970, 'btc', '2025-12-05 06:02:12'),
	(4829, 91970, 'btc', '2025-12-05 06:04:12'),
	(4830, 91999, 'btc', '2025-12-05 06:06:12'),
	(4831, 91992, 'btc', '2025-12-05 06:08:13'),
	(4832, 92080, 'btc', '2025-12-05 06:10:13'),
	(4833, 92094, 'btc', '2025-12-05 06:12:13'),
	(4834, 92115, 'btc', '2025-12-05 06:14:14'),
	(4835, 92093, 'btc', '2025-12-05 06:16:14'),
	(4836, 92096, 'btc', '2025-12-05 06:18:14'),
	(4837, 92006, 'btc', '2025-12-05 06:20:14'),
	(4838, 92036, 'btc', '2025-12-05 06:22:15'),
	(4839, 92024, 'btc', '2025-12-05 06:24:15'),
	(4840, 92051, 'btc', '2025-12-05 06:26:15'),
	(4841, 92026, 'btc', '2025-12-05 06:28:16'),
	(4842, 92043, 'btc', '2025-12-05 06:30:16'),
	(4843, 91937, 'btc', '2025-12-05 06:32:16'),
	(4844, 91982, 'btc', '2025-12-05 06:34:16'),
	(4845, 92066, 'btc', '2025-12-05 06:36:17'),
	(4846, 92086, 'btc', '2025-12-05 06:38:17'),
	(4847, 92047, 'btc', '2025-12-05 06:40:17'),
	(4848, 92077, 'btc', '2025-12-05 06:42:18'),
	(4849, 92100, 'btc', '2025-12-05 06:44:18'),
	(4850, 92157, 'btc', '2025-12-05 06:46:18'),
	(4851, 92148, 'btc', '2025-12-05 06:48:18'),
	(4852, 92152, 'btc', '2025-12-05 06:50:19'),
	(4853, 92268, 'btc', '2025-12-05 06:52:19'),
	(4854, 92228, 'btc', '2025-12-05 06:54:19'),
	(4855, 92218, 'btc', '2025-12-05 06:56:20'),
	(4856, 92287, 'btc', '2025-12-05 06:58:20'),
	(4857, 92254, 'btc', '2025-12-05 07:00:20'),
	(4858, 92208, 'btc', '2025-12-05 07:02:21'),
	(4859, 92233, 'btc', '2025-12-05 07:04:21'),
	(4860, 92279, 'btc', '2025-12-05 07:06:21'),
	(4861, 92406, 'btc', '2025-12-05 07:08:22'),
	(4862, 92399, 'btc', '2025-12-05 07:10:22'),
	(4863, 92358, 'btc', '2025-12-05 07:12:22'),
	(4864, 92335, 'btc', '2025-12-05 07:14:22'),
	(4865, 92372, 'btc', '2025-12-05 07:16:23'),
	(4866, 92373, 'btc', '2025-12-05 07:18:23'),
	(4867, 92352, 'btc', '2025-12-05 07:20:23'),
	(4868, 92376, 'btc', '2025-12-05 07:22:24'),
	(4869, 92430, 'btc', '2025-12-05 07:24:24'),
	(4870, 92441, 'btc', '2025-12-05 07:26:24'),
	(4871, 92480, 'btc', '2025-12-05 07:28:25'),
	(4872, 92444, 'btc', '2025-12-05 07:30:25'),
	(4873, 92439, 'btc', '2025-12-05 07:32:25'),
	(4874, 92435, 'btc', '2025-12-05 07:34:26'),
	(4875, 92420, 'btc', '2025-12-05 07:36:26'),
	(4876, 92427, 'btc', '2025-12-05 07:38:26'),
	(4877, 92375, 'btc', '2025-12-05 07:40:26'),
	(4878, 92296, 'btc', '2025-12-05 07:42:27'),
	(4879, 92307, 'btc', '2025-12-05 07:44:27'),
	(4880, 92288, 'btc', '2025-12-05 07:46:27'),
	(4881, 92281, 'btc', '2025-12-05 07:48:28'),
	(4882, 92252, 'btc', '2025-12-05 07:50:28'),
	(4883, 92235, 'btc', '2025-12-05 07:52:28'),
	(4884, 92224, 'btc', '2025-12-05 07:54:28'),
	(4885, 92240, 'btc', '2025-12-05 07:56:29'),
	(4886, 92226, 'btc', '2025-12-05 07:58:29'),
	(4887, 92227, 'btc', '2025-12-05 08:00:29'),
	(4888, 92180, 'btc', '2025-12-05 08:02:30'),
	(4889, 92187, 'btc', '2025-12-05 08:04:30'),
	(4890, 92122, 'btc', '2025-12-05 08:06:30'),
	(4891, 92083, 'btc', '2025-12-05 08:08:31'),
	(4892, 92091, 'btc', '2025-12-05 08:10:31'),
	(4893, 92145, 'btc', '2025-12-05 08:12:31'),
	(4894, 92128, 'btc', '2025-12-05 08:14:32'),
	(4895, 92032, 'btc', '2025-12-05 08:16:32'),
	(4896, 92054, 'btc', '2025-12-05 08:18:32'),
	(4897, 92036, 'btc', '2025-12-05 08:20:32'),
	(4898, 92090, 'btc', '2025-12-05 08:22:33'),
	(4899, 92100, 'btc', '2025-12-05 08:24:33'),
	(4900, 92146, 'btc', '2025-12-05 08:26:33'),
	(4901, 92112, 'btc', '2025-12-05 08:28:34'),
	(4902, 92054, 'btc', '2025-12-05 08:30:34'),
	(4903, 92042, 'btc', '2025-12-05 08:32:34'),
	(4904, 92037, 'btc', '2025-12-05 08:34:35'),
	(4905, 92038, 'btc', '2025-12-05 08:36:35'),
	(4906, 92025, 'btc', '2025-12-05 08:38:35'),
	(4907, 91991, 'btc', '2025-12-05 08:40:36'),
	(4908, 91993, 'btc', '2025-12-05 08:42:36'),
	(4909, 91995, 'btc', '2025-12-05 08:44:36'),
	(4910, 92019, 'btc', '2025-12-05 08:46:36'),
	(4911, 92042, 'btc', '2025-12-05 08:48:37'),
	(4912, 92041, 'btc', '2025-12-05 08:50:37'),
	(4913, 92091, 'btc', '2025-12-05 08:52:37'),
	(4914, 92095, 'btc', '2025-12-05 08:54:38'),
	(4915, 92133, 'btc', '2025-12-05 08:56:38'),
	(4916, 92147, 'btc', '2025-12-05 08:58:38'),
	(4917, 92110, 'btc', '2025-12-05 09:00:38'),
	(4918, 91961, 'btc', '2025-12-05 09:02:39'),
	(4919, 92016, 'btc', '2025-12-05 09:04:39'),
	(4920, 91937, 'btc', '2025-12-05 09:06:39'),
	(4921, 91911, 'btc', '2025-12-05 09:08:40'),
	(4922, 91922, 'btc', '2025-12-05 09:10:40'),
	(4923, 91907, 'btc', '2025-12-05 09:12:40'),
	(4924, 91838, 'btc', '2025-12-05 09:14:41'),
	(4925, 91742, 'btc', '2025-12-05 09:16:41'),
	(4926, 91558, 'btc', '2025-12-05 09:18:41'),
	(4927, 91355, 'btc', '2025-12-05 09:20:42'),
	(4928, 91491, 'btc', '2025-12-05 09:22:42'),
	(4929, 91434, 'btc', '2025-12-05 09:24:42'),
	(4930, 91321, 'btc', '2025-12-05 09:26:42'),
	(4931, 91359, 'btc', '2025-12-05 09:28:43'),
	(4932, 91300, 'btc', '2025-12-05 09:30:43'),
	(4933, 91304, 'btc', '2025-12-05 09:32:43'),
	(4934, 91234, 'btc', '2025-12-05 09:34:44'),
	(4935, 91295, 'btc', '2025-12-05 09:36:44'),
	(4936, 91313, 'btc', '2025-12-05 09:38:45'),
	(4937, 91233, 'btc', '2025-12-05 09:40:45'),
	(4938, 91155, 'btc', '2025-12-05 09:42:45'),
	(4939, 91050, 'btc', '2025-12-05 09:44:46'),
	(4940, 91010, 'btc', '2025-12-05 09:46:46'),
	(4941, 91033, 'btc', '2025-12-05 09:48:46'),
	(4942, 91068, 'btc', '2025-12-05 09:50:47'),
	(4943, 91094, 'btc', '2025-12-05 09:52:47'),
	(4944, 91021, 'btc', '2025-12-05 09:54:47'),
	(4945, 91074, 'btc', '2025-12-05 09:56:48'),
	(4946, 91123, 'btc', '2025-12-05 09:58:48'),
	(4947, 91107, 'btc', '2025-12-05 10:00:48'),
	(4948, 91145, 'btc', '2025-12-05 10:02:48'),
	(4949, 91210, 'btc', '2025-12-05 10:04:49'),
	(4950, 91268, 'btc', '2025-12-05 10:06:49'),
	(4951, 91236, 'btc', '2025-12-05 10:08:49'),
	(4952, 91232, 'btc', '2025-12-05 10:10:50'),
	(4953, 91286, 'btc', '2025-12-05 10:12:50'),
	(4954, 91243, 'btc', '2025-12-05 10:14:50'),
	(4955, 91312, 'btc', '2025-12-05 10:16:51'),
	(4956, 91255, 'btc', '2025-12-05 10:18:51'),
	(4957, 91255, 'btc', '2025-12-05 10:20:51'),
	(4958, 91267, 'btc', '2025-12-05 10:22:52'),
	(4959, 91315, 'btc', '2025-12-05 10:24:52'),
	(4960, 91437, 'btc', '2025-12-05 10:26:52'),
	(4961, 91350, 'btc', '2025-12-05 10:28:53'),
	(4962, 91285, 'btc', '2025-12-05 10:30:53'),
	(4963, 91299, 'btc', '2025-12-05 10:32:53'),
	(4964, 91376, 'btc', '2025-12-05 10:34:53'),
	(4965, 91359, 'btc', '2025-12-05 10:36:54'),
	(4966, 91318, 'btc', '2025-12-05 10:38:54'),
	(4967, 91345, 'btc', '2025-12-05 10:40:54'),
	(4968, 91420, 'btc', '2025-12-05 10:42:55'),
	(4969, 91488, 'btc', '2025-12-05 10:44:55'),
	(4970, 91455, 'btc', '2025-12-05 10:46:55'),
	(4971, 91322, 'btc', '2025-12-05 10:48:56'),
	(4972, 91342, 'btc', '2025-12-05 10:50:56'),
	(4973, 91392, 'btc', '2025-12-05 10:52:56'),
	(4974, 91401, 'btc', '2025-12-05 10:54:56'),
	(4975, 91390, 'btc', '2025-12-05 10:56:57'),
	(4976, 91306, 'btc', '2025-12-05 10:58:57'),
	(4977, 91244, 'btc', '2025-12-05 11:00:57'),
	(4978, 91339, 'btc', '2025-12-05 11:02:58'),
	(4979, 91365, 'btc', '2025-12-05 11:04:58'),
	(4980, 91441, 'btc', '2025-12-05 11:06:58'),
	(4981, 91516, 'btc', '2025-12-05 11:08:58'),
	(4982, 91478, 'btc', '2025-12-05 11:10:59'),
	(4983, 91519, 'btc', '2025-12-05 11:12:59'),
	(4984, 91527, 'btc', '2025-12-05 11:14:59'),
	(4985, 91445, 'btc', '2025-12-05 11:17:00'),
	(4986, 91536, 'btc', '2025-12-05 11:19:00'),
	(4987, 91537, 'btc', '2025-12-05 11:21:00'),
	(4988, 91450, 'btc', '2025-12-05 11:23:01'),
	(4989, 91330, 'btc', '2025-12-05 11:25:01'),
	(4990, 91415, 'btc', '2025-12-05 11:27:01'),
	(4991, 91415, 'btc', '2025-12-05 11:29:01'),
	(4992, 91400, 'btc', '2025-12-05 11:31:02'),
	(4993, 91383, 'btc', '2025-12-05 11:33:02'),
	(4994, 91158, 'btc', '2025-12-05 11:35:02'),
	(4995, 91187, 'btc', '2025-12-05 11:37:03'),
	(4996, 91242, 'btc', '2025-12-05 11:39:03'),
	(4997, 91219, 'btc', '2025-12-05 11:41:03'),
	(4998, 91206, 'btc', '2025-12-05 11:43:04'),
	(4999, 91129, 'btc', '2025-12-05 11:45:04'),
	(5000, 91207, 'btc', '2025-12-05 11:47:04'),
	(5001, 91296, 'btc', '2025-12-05 11:49:04'),
	(5002, 91292, 'btc', '2025-12-05 11:51:05'),
	(5003, 91356, 'btc', '2025-12-05 11:53:05'),
	(5004, 91377, 'btc', '2025-12-05 11:55:05'),
	(5005, 91396, 'btc', '2025-12-05 11:57:06'),
	(5006, 91334, 'btc', '2025-12-05 11:59:06'),
	(5007, 91295, 'btc', '2025-12-05 12:01:06'),
	(5008, 91231, 'btc', '2025-12-05 12:03:07'),
	(5009, 91291, 'btc', '2025-12-05 12:05:07'),
	(5010, 91360, 'btc', '2025-12-05 12:07:07'),
	(5011, 91405, 'btc', '2025-12-05 12:09:07'),
	(5012, 91379, 'btc', '2025-12-05 12:11:08'),
	(5013, 91279, 'btc', '2025-12-05 12:13:08'),
	(5014, 91287, 'btc', '2025-12-05 12:15:08'),
	(5015, 91317, 'btc', '2025-12-05 12:17:09'),
	(5016, 91339, 'btc', '2025-12-05 12:19:09'),
	(5017, 91234, 'btc', '2025-12-05 12:21:09'),
	(5018, 91167, 'btc', '2025-12-05 12:23:09'),
	(5019, 91152, 'btc', '2025-12-05 12:25:10'),
	(5020, 91204, 'btc', '2025-12-05 12:27:10'),
	(5021, 91214, 'btc', '2025-12-05 12:29:10'),
	(5022, 91154, 'btc', '2025-12-05 12:31:11'),
	(5023, 91179, 'btc', '2025-12-05 12:33:11'),
	(5024, 91237, 'btc', '2025-12-05 12:35:11'),
	(5025, 91267, 'btc', '2025-12-05 12:37:12'),
	(5026, 91260, 'btc', '2025-12-05 12:39:12'),
	(5027, 91240, 'btc', '2025-12-05 12:41:12'),
	(5028, 91221, 'btc', '2025-12-05 12:43:12'),
	(5029, 91169, 'btc', '2025-12-05 12:45:13'),
	(5030, 91187, 'btc', '2025-12-05 12:47:13'),
	(5031, 91212, 'btc', '2025-12-05 12:49:13'),
	(5032, 91217, 'btc', '2025-12-05 12:51:14'),
	(5033, 91209, 'btc', '2025-12-05 12:53:14'),
	(5034, 91216, 'btc', '2025-12-05 12:55:14'),
	(5035, 91259, 'btc', '2025-12-05 12:57:14'),
	(5036, 91258, 'btc', '2025-12-05 12:59:15'),
	(5037, 91190, 'btc', '2025-12-05 13:01:15'),
	(5038, 91251, 'btc', '2025-12-05 13:03:15'),
	(5039, 91115, 'btc', '2025-12-05 13:05:16'),
	(5040, 91114, 'btc', '2025-12-05 13:07:16'),
	(5041, 91116, 'btc', '2025-12-05 13:09:16'),
	(5042, 91332, 'btc', '2025-12-05 13:11:17'),
	(5043, 91213, 'btc', '2025-12-05 13:13:17'),
	(5044, 91123, 'btc', '2025-12-05 13:15:17'),
	(5045, 91012, 'btc', '2025-12-05 13:17:18'),
	(5046, 91105, 'btc', '2025-12-05 13:19:18'),
	(5047, 91030, 'btc', '2025-12-05 13:21:18'),
	(5048, 91025, 'btc', '2025-12-05 13:23:19'),
	(5049, 90920, 'btc', '2025-12-05 13:25:19'),
	(5050, 90820, 'btc', '2025-12-05 13:27:19'),
	(5051, 90695, 'btc', '2025-12-05 13:29:20'),
	(5052, 90819, 'btc', '2025-12-05 13:31:20'),
	(5053, 90699, 'btc', '2025-12-05 13:33:20'),
	(5054, 90852, 'btc', '2025-12-05 13:35:21'),
	(5055, 90558, 'btc', '2025-12-05 13:40:37'),
	(5056, 90436, 'btc', '2025-12-05 13:42:37'),
	(5057, 90381, 'btc', '2025-12-05 13:44:37'),
	(5058, 90300, 'btc', '2025-12-05 13:46:38'),
	(5059, 90370, 'btc', '2025-12-05 13:47:23'),
	(5060, 90425, 'btc', '2025-12-05 13:48:32'),
	(5061, 90526, 'btc', '2025-12-05 13:49:35'),
	(5062, 90560, 'btc', '2025-12-05 13:50:43'),
	(5063, 90660, 'btc', '2025-12-05 13:52:44'),
	(5064, 90584, 'btc', '2025-12-05 13:54:44'),
	(5065, 90649, 'btc', '2025-12-05 13:56:44'),
	(5066, 90525, 'btc', '2025-12-05 13:58:44'),
	(5067, 90507, 'btc', '2025-12-05 14:00:45'),
	(5068, 90549, 'btc', '2025-12-05 14:02:45'),
	(5069, 90507, 'btc', '2025-12-05 14:04:45'),
	(5070, 90591, 'btc', '2025-12-05 14:06:46'),
	(5071, 90634, 'btc', '2025-12-05 14:08:46'),
	(5072, 90719, 'btc', '2025-12-05 14:10:46'),
	(5073, 90609, 'btc', '2025-12-05 14:12:46'),
	(5074, 90527, 'btc', '2025-12-05 14:14:47'),
	(5075, 90492, 'btc', '2025-12-05 14:16:47'),
	(5076, 90416, 'btc', '2025-12-05 14:18:47'),
	(5077, 90362, 'btc', '2025-12-05 14:20:48'),
	(5078, 90344, 'btc', '2025-12-05 14:22:48'),
	(5079, 90384, 'btc', '2025-12-05 14:24:48'),
	(5080, 90468, 'btc', '2025-12-05 14:26:49'),
	(5081, 90444, 'btc', '2025-12-05 14:28:49'),
	(5082, 90409, 'btc', '2025-12-05 14:30:49'),
	(5083, 90580, 'btc', '2025-12-05 14:32:49'),
	(5084, 90623, 'btc', '2025-12-05 14:34:50'),
	(5085, 90422, 'btc', '2025-12-05 14:36:50'),
	(5086, 90268, 'btc', '2025-12-05 14:38:50'),
	(5087, 90142, 'btc', '2025-12-05 14:40:51'),
	(5088, 90216, 'btc', '2025-12-05 14:42:51'),
	(5089, 90232, 'btc', '2025-12-05 14:44:51'),
	(5090, 90362, 'btc', '2025-12-05 14:46:52'),
	(5091, 90059, 'btc', '2025-12-05 14:48:52'),
	(5092, 90020, 'btc', '2025-12-05 14:50:52'),
	(5093, 90156, 'btc', '2025-12-05 14:52:52'),
	(5094, 90245, 'btc', '2025-12-05 14:54:53'),
	(5095, 90272, 'btc', '2025-12-05 14:56:53'),
	(5096, 90275, 'btc', '2025-12-05 14:58:53'),
	(5097, 90435, 'btc', '2025-12-05 15:00:54'),
	(5098, 90820, 'btc', '2025-12-05 15:02:54'),
	(5099, 91146, 'btc', '2025-12-05 15:04:54'),
	(5100, 91285, 'btc', '2025-12-05 15:06:55'),
	(5101, 90968, 'btc', '2025-12-05 15:08:55'),
	(5102, 90970, 'btc', '2025-12-05 15:10:55'),
	(5103, 90971, 'btc', '2025-12-05 15:12:51'),
	(5104, 91032, 'btc', '2025-12-05 15:14:51'),
	(5105, 91144, 'btc', '2025-12-05 15:16:51'),
	(5106, 90906, 'btc', '2025-12-05 15:18:51'),
	(5107, 90932, 'btc', '2025-12-05 15:20:52'),
	(5108, 91032, 'btc', '2025-12-05 15:22:52'),
	(5109, 91150, 'btc', '2025-12-05 15:24:52'),
	(5110, 91113, 'btc', '2025-12-05 15:26:52'),
	(5111, 91118, 'btc', '2025-12-05 15:28:53'),
	(5112, 91231, 'btc', '2025-12-05 15:30:53'),
	(5113, 91333, 'btc', '2025-12-05 15:32:53'),
	(5114, 91244, 'btc', '2025-12-05 15:34:54'),
	(5115, 91273, 'btc', '2025-12-05 15:36:54'),
	(5116, 91161, 'btc', '2025-12-05 15:38:54'),
	(5117, 90970, 'btc', '2025-12-05 15:40:54'),
	(5118, 90975, 'btc', '2025-12-05 15:42:55'),
	(5119, 91020, 'btc', '2025-12-05 15:44:55'),
	(5120, 90818, 'btc', '2025-12-05 15:46:55'),
	(5121, 90956, 'btc', '2025-12-05 15:48:56'),
	(5122, 91113, 'btc', '2025-12-05 15:50:56'),
	(5123, 90668, 'btc', '2025-12-05 15:52:56'),
	(5124, 90657, 'btc', '2025-12-05 15:54:57'),
	(5125, 90390, 'btc', '2025-12-05 15:56:57'),
	(5126, 90282, 'btc', '2025-12-05 15:58:57'),
	(5127, 90381, 'btc', '2025-12-05 16:00:57'),
	(5128, 90236, 'btc', '2025-12-05 16:02:58'),
	(5129, 90152, 'btc', '2025-12-05 16:04:58'),
	(5130, 90000, 'btc', '2025-12-05 16:06:58'),
	(5131, 89407, 'btc', '2025-12-05 16:08:59'),
	(5132, 89400, 'btc', '2025-12-05 16:10:59'),
	(5133, 89303, 'btc', '2025-12-05 16:12:59'),
	(5134, 89363, 'btc', '2025-12-05 16:15:00'),
	(5135, 89124, 'btc', '2025-12-05 16:17:00'),
	(5136, 89278, 'btc', '2025-12-05 16:19:00'),
	(5137, 89169, 'btc', '2025-12-05 16:21:00'),
	(5138, 89244, 'btc', '2025-12-05 16:23:01'),
	(5139, 89038, 'btc', '2025-12-05 16:25:01'),
	(5140, 89236, 'btc', '2025-12-05 16:27:01'),
	(5141, 89113, 'btc', '2025-12-05 16:29:02'),
	(5142, 89084, 'btc', '2025-12-05 16:31:02'),
	(5143, 88775, 'btc', '2025-12-05 16:33:02'),
	(5144, 88877, 'btc', '2025-12-05 16:35:03'),
	(5145, 88728, 'btc', '2025-12-05 16:37:03'),
	(5146, 88758, 'btc', '2025-12-05 16:39:03'),
	(5147, 88490, 'btc', '2025-12-05 16:41:03'),
	(5148, 88276, 'btc', '2025-12-05 16:43:04'),
	(5149, 88403, 'btc', '2025-12-05 16:45:04'),
	(5150, 88608, 'btc', '2025-12-05 16:47:04'),
	(5151, 88402, 'btc', '2025-12-05 16:49:05'),
	(5152, 88512, 'btc', '2025-12-05 16:51:05'),
	(5153, 88743, 'btc', '2025-12-05 16:53:05'),
	(5154, 88728, 'btc', '2025-12-05 16:55:06'),
	(5155, 88818, 'btc', '2025-12-05 16:57:06'),
	(5156, 88970, 'btc', '2025-12-05 16:59:06'),
	(5157, 88784, 'btc', '2025-12-05 17:01:07'),
	(5158, 88854, 'btc', '2025-12-05 17:03:07'),
	(5159, 88824, 'btc', '2025-12-05 17:05:07'),
	(5160, 88761, 'btc', '2025-12-05 17:07:07'),
	(5161, 88684, 'btc', '2025-12-05 17:09:08'),
	(5162, 88690, 'btc', '2025-12-05 17:11:08'),
	(5163, 88674, 'btc', '2025-12-05 17:13:08'),
	(5164, 88701, 'btc', '2025-12-05 17:15:09'),
	(5165, 88879, 'btc', '2025-12-05 17:17:09'),
	(5166, 88837, 'btc', '2025-12-05 17:19:09'),
	(5167, 88940, 'btc', '2025-12-05 17:21:09'),
	(5168, 88736, 'btc', '2025-12-05 17:23:10'),
	(5169, 88868, 'btc', '2025-12-05 17:25:10'),
	(5170, 88741, 'btc', '2025-12-05 17:27:10'),
	(5171, 88731, 'btc', '2025-12-05 17:29:11'),
	(5172, 88905, 'btc', '2025-12-05 17:31:11'),
	(5173, 89138, 'btc', '2025-12-05 17:33:11'),
	(5174, 88974, 'btc', '2025-12-05 17:35:12'),
	(5175, 88753, 'btc', '2025-12-05 17:37:12'),
	(5176, 88933, 'btc', '2025-12-05 17:39:12'),
	(5177, 88920, 'btc', '2025-12-05 17:41:12'),
	(5178, 89000, 'btc', '2025-12-05 17:43:13'),
	(5179, 88982, 'btc', '2025-12-05 17:45:13'),
	(5180, 89154, 'btc', '2025-12-05 17:47:13'),
	(5181, 89161, 'btc', '2025-12-05 17:49:14'),
	(5182, 89179, 'btc', '2025-12-05 17:51:14'),
	(5183, 89378, 'btc', '2025-12-05 17:53:14'),
	(5184, 89302, 'btc', '2025-12-05 17:55:15'),
	(5185, 89310, 'btc', '2025-12-05 17:57:15'),
	(5186, 89330, 'btc', '2025-12-05 17:59:15'),
	(5187, 89295, 'btc', '2025-12-05 18:01:15'),
	(5188, 89271, 'btc', '2025-12-05 18:03:16'),
	(5189, 89450, 'btc', '2025-12-05 18:05:16'),
	(5190, 89598, 'btc', '2025-12-05 18:07:16'),
	(5191, 89697, 'btc', '2025-12-05 18:09:17'),
	(5192, 89695, 'btc', '2025-12-05 18:11:17'),
	(5193, 89614, 'btc', '2025-12-05 18:13:17'),
	(5194, 89606, 'btc', '2025-12-05 18:15:18'),
	(5195, 89648, 'btc', '2025-12-05 18:17:18'),
	(5196, 89443, 'btc', '2025-12-05 18:19:18'),
	(5197, 89256, 'btc', '2025-12-05 18:21:18'),
	(5198, 89345, 'btc', '2025-12-05 18:23:19'),
	(5199, 89235, 'btc', '2025-12-05 18:25:19'),
	(5200, 89304, 'btc', '2025-12-05 18:27:19'),
	(5201, 89396, 'btc', '2025-12-05 18:29:19'),
	(5202, 89480, 'btc', '2025-12-05 18:31:20'),
	(5203, 89326, 'btc', '2025-12-05 18:33:20'),
	(5204, 89261, 'btc', '2025-12-05 18:35:20'),
	(5205, 89283, 'btc', '2025-12-05 18:37:21'),
	(5206, 89235, 'btc', '2025-12-05 18:39:21'),
	(5207, 89111, 'btc', '2025-12-05 18:41:21'),
	(5208, 89055, 'btc', '2025-12-05 18:43:22'),
	(5209, 89114, 'btc', '2025-12-05 18:45:22'),
	(5210, 89139, 'btc', '2025-12-05 18:47:22'),
	(5211, 89142, 'btc', '2025-12-05 18:49:22'),
	(5212, 89075, 'btc', '2025-12-05 18:51:23'),
	(5213, 89046, 'btc', '2025-12-05 18:53:23'),
	(5214, 89034, 'btc', '2025-12-05 18:55:23'),
	(5215, 89096, 'btc', '2025-12-05 18:57:24'),
	(5216, 88936, 'btc', '2025-12-05 18:59:24'),
	(5217, 88868, 'btc', '2025-12-05 19:01:24'),
	(5218, 89006, 'btc', '2025-12-05 19:03:25'),
	(5219, 88892, 'btc', '2025-12-05 19:05:25'),
	(5220, 88929, 'btc', '2025-12-05 19:07:25'),
	(5221, 89022, 'btc', '2025-12-05 19:09:25'),
	(5222, 89080, 'btc', '2025-12-05 19:11:26'),
	(5223, 89087, 'btc', '2025-12-05 19:13:26'),
	(5224, 89206, 'btc', '2025-12-05 19:15:26'),
	(5225, 89147, 'btc', '2025-12-05 19:17:27'),
	(5226, 89302, 'btc', '2025-12-05 19:19:27'),
	(5227, 89391, 'btc', '2025-12-05 19:21:27'),
	(5228, 89292, 'btc', '2025-12-05 19:23:27'),
	(5229, 89343, 'btc', '2025-12-05 19:25:28'),
	(5230, 89453, 'btc', '2025-12-05 19:27:28'),
	(5231, 89400, 'btc', '2025-12-05 19:29:28'),
	(5232, 89489, 'btc', '2025-12-05 19:31:29'),
	(5233, 89411, 'btc', '2025-12-05 19:33:29'),
	(5234, 89444, 'btc', '2025-12-05 19:35:29'),
	(5235, 89436, 'btc', '2025-12-05 19:37:29'),
	(5236, 89492, 'btc', '2025-12-05 19:39:30'),
	(5237, 89576, 'btc', '2025-12-05 19:41:30'),
	(5238, 89516, 'btc', '2025-12-05 19:43:30'),
	(5239, 89404, 'btc', '2025-12-05 19:45:31'),
	(5240, 89443, 'btc', '2025-12-05 19:47:31'),
	(5241, 89414, 'btc', '2025-12-05 19:49:31'),
	(5242, 89524, 'btc', '2025-12-05 19:51:32'),
	(5243, 89547, 'btc', '2025-12-05 19:53:32'),
	(5244, 89650, 'btc', '2025-12-05 19:55:33'),
	(5245, 89799, 'btc', '2025-12-05 19:57:33'),
	(5246, 89662, 'btc', '2025-12-05 19:59:33'),
	(5247, 89639, 'btc', '2025-12-05 20:01:33'),
	(5248, 89647, 'btc', '2025-12-05 20:03:34'),
	(5249, 89492, 'btc', '2025-12-05 20:05:34'),
	(5250, 89489, 'btc', '2025-12-05 20:07:34'),
	(5251, 89461, 'btc', '2025-12-05 20:09:35'),
	(5252, 89463, 'btc', '2025-12-05 20:11:35'),
	(5253, 89544, 'btc', '2025-12-05 20:13:35'),
	(5254, 89712, 'btc', '2025-12-05 20:15:36'),
	(5255, 89620, 'btc', '2025-12-05 20:17:36'),
	(5256, 89690, 'btc', '2025-12-05 20:19:36'),
	(5257, 89661, 'btc', '2025-12-05 20:21:37'),
	(5258, 89645, 'btc', '2025-12-05 20:23:37'),
	(5259, 89637, 'btc', '2025-12-05 20:25:37'),
	(5260, 89565, 'btc', '2025-12-05 20:27:37'),
	(5261, 89539, 'btc', '2025-12-05 20:29:38'),
	(5262, 89404, 'btc', '2025-12-05 20:31:38'),
	(5263, 89429, 'btc', '2025-12-05 20:33:38'),
	(5264, 89437, 'btc', '2025-12-05 20:35:39'),
	(5265, 89391, 'btc', '2025-12-05 20:37:39'),
	(5266, 89352, 'btc', '2025-12-05 20:39:39'),
	(5267, 89300, 'btc', '2025-12-05 20:41:40'),
	(5268, 89317, 'btc', '2025-12-05 20:43:40'),
	(5269, 89286, 'btc', '2025-12-05 20:45:40'),
	(5270, 89214, 'btc', '2025-12-05 20:47:40'),
	(5271, 89274, 'btc', '2025-12-05 20:49:41'),
	(5272, 89247, 'btc', '2025-12-05 20:51:41'),
	(5273, 89327, 'btc', '2025-12-05 20:53:41'),
	(5274, 89313, 'btc', '2025-12-05 20:55:42'),
	(5275, 89323, 'btc', '2025-12-05 20:57:43'),
	(5276, 89311, 'btc', '2025-12-05 20:59:44'),
	(5277, 89378, 'btc', '2025-12-05 21:01:44'),
	(5278, 89360, 'btc', '2025-12-05 21:03:44'),
	(5279, 89355, 'btc', '2025-12-05 21:05:45'),
	(5280, 89381, 'btc', '2025-12-05 21:07:45'),
	(5281, 89374, 'btc', '2025-12-05 21:09:45'),
	(5282, 89316, 'btc', '2025-12-05 21:11:45'),
	(5283, 89391, 'btc', '2025-12-05 21:18:37'),
	(5284, 89428, 'btc', '2025-12-05 21:20:37'),
	(5285, 89481, 'btc', '2025-12-05 21:22:37'),
	(5286, 89447, 'btc', '2025-12-05 21:24:37'),
	(5287, 89410, 'btc', '2025-12-05 21:26:38'),
	(5288, 89426, 'btc', '2025-12-05 21:28:38'),
	(5289, 89461, 'btc', '2025-12-05 21:30:38'),
	(5290, 89400, 'btc', '2025-12-05 21:32:39'),
	(5291, 89362, 'btc', '2025-12-05 21:34:39'),
	(5292, 89363, 'btc', '2025-12-05 21:36:39'),
	(5293, 89249, 'btc', '2025-12-05 21:38:40'),
	(5294, 89282, 'btc', '2025-12-05 21:40:40'),
	(5295, 89266, 'btc', '2025-12-05 21:42:40'),
	(5296, 89264, 'btc', '2025-12-05 21:44:40'),
	(5297, 89286, 'btc', '2025-12-05 21:46:41'),
	(5298, 89230, 'btc', '2025-12-05 21:48:41'),
	(5299, 89130, 'btc', '2025-12-05 21:50:41'),
	(5300, 89099, 'btc', '2025-12-05 21:52:42'),
	(5301, 89200, 'btc', '2025-12-05 21:54:42'),
	(5302, 89239, 'btc', '2025-12-05 21:56:42'),
	(5303, 89140, 'btc', '2025-12-05 21:58:43'),
	(5304, 89050, 'btc', '2025-12-05 22:00:43'),
	(5305, 88993, 'btc', '2025-12-05 22:02:43'),
	(5306, 89051, 'btc', '2025-12-05 22:04:44'),
	(5307, 89127, 'btc', '2025-12-05 22:06:44'),
	(5308, 89142, 'btc', '2025-12-05 22:08:44'),
	(5309, 89138, 'btc', '2025-12-05 22:10:44'),
	(5310, 89033, 'btc', '2025-12-05 22:12:45'),
	(5311, 88949, 'btc', '2025-12-05 22:14:45'),
	(5312, 89084, 'btc', '2025-12-05 22:16:45'),
	(5313, 89140, 'btc', '2025-12-05 22:18:46'),
	(5314, 89704, 'btc', '2025-12-06 05:01:23'),
	(5315, 89718, 'btc', '2025-12-06 05:03:23'),
	(5316, 89717, 'btc', '2025-12-06 05:05:24'),
	(5317, 89692, 'btc', '2025-12-06 05:07:24'),
	(5318, 89710, 'btc', '2025-12-06 05:09:24'),
	(5319, 89726, 'btc', '2025-12-06 05:11:24'),
	(5320, 89701, 'btc', '2025-12-06 05:13:25'),
	(5321, 89674, 'btc', '2025-12-06 05:15:25'),
	(5322, 89602, 'btc', '2025-12-06 05:17:25'),
	(5323, 89608, 'btc', '2025-12-06 05:19:26'),
	(5324, 89612, 'btc', '2025-12-06 05:21:26'),
	(5325, 89644, 'btc', '2025-12-06 05:23:26'),
	(5326, 89636, 'btc', '2025-12-06 05:25:27'),
	(5327, 89599, 'btc', '2025-12-06 05:27:27'),
	(5328, 89608, 'btc', '2025-12-06 05:29:27'),
	(5329, 89576, 'btc', '2025-12-06 05:31:28'),
	(5330, 89554, 'btc', '2025-12-06 05:33:28'),
	(5331, 89560, 'btc', '2025-12-06 05:35:28'),
	(5332, 89548, 'btc', '2025-12-06 05:37:28'),
	(5333, 89543, 'btc', '2025-12-06 05:39:29'),
	(5334, 89559, 'btc', '2025-12-06 05:41:29'),
	(5335, 89586, 'btc', '2025-12-06 05:43:29'),
	(5336, 89546, 'btc', '2025-12-06 05:45:30'),
	(5337, 89563, 'btc', '2025-12-06 05:47:30'),
	(5338, 89572, 'btc', '2025-12-06 05:49:30'),
	(5339, 89603, 'btc', '2025-12-06 05:51:31'),
	(5340, 89608, 'btc', '2025-12-06 05:53:31'),
	(5341, 89618, 'btc', '2025-12-06 05:55:31'),
	(5342, 89612, 'btc', '2025-12-06 05:57:31'),
	(5343, 89605, 'btc', '2025-12-06 05:59:32'),
	(5344, 89554, 'btc', '2025-12-06 06:01:32'),
	(5345, 89549, 'btc', '2025-12-06 06:03:32'),
	(5346, 89586, 'btc', '2025-12-06 06:05:33'),
	(5347, 89642, 'btc', '2025-12-06 06:07:33'),
	(5348, 89635, 'btc', '2025-12-06 06:09:33'),
	(5349, 89632, 'btc', '2025-12-06 06:11:33'),
	(5350, 89642, 'btc', '2025-12-06 06:13:34'),
	(5351, 89678, 'btc', '2025-12-06 06:15:34'),
	(5352, 89664, 'btc', '2025-12-06 06:17:34'),
	(5353, 89645, 'btc', '2025-12-06 06:19:35'),
	(5354, 89642, 'btc', '2025-12-06 06:21:35'),
	(5355, 89691, 'btc', '2025-12-06 06:23:35'),
	(5356, 89716, 'btc', '2025-12-06 06:25:36'),
	(5357, 89710, 'btc', '2025-12-06 06:27:36'),
	(5358, 89744, 'btc', '2025-12-06 06:29:36'),
	(5359, 89725, 'btc', '2025-12-06 06:31:36'),
	(5360, 89725, 'btc', '2025-12-06 06:33:37'),
	(5361, 89748, 'btc', '2025-12-06 06:35:37'),
	(5362, 89723, 'btc', '2025-12-06 06:37:37'),
	(5363, 89694, 'btc', '2025-12-06 06:39:38'),
	(5364, 89650, 'btc', '2025-12-06 06:41:38'),
	(5365, 89671, 'btc', '2025-12-06 06:43:38'),
	(5366, 89624, 'btc', '2025-12-06 06:45:39'),
	(5367, 89663, 'btc', '2025-12-06 06:47:39'),
	(5368, 89673, 'btc', '2025-12-06 06:49:39'),
	(5369, 89667, 'btc', '2025-12-06 06:51:39'),
	(5370, 89694, 'btc', '2025-12-06 06:53:40'),
	(5371, 89676, 'btc', '2025-12-06 06:55:40'),
	(5372, 89681, 'btc', '2025-12-06 06:57:40'),
	(5373, 89683, 'btc', '2025-12-06 06:59:41'),
	(5374, 89689, 'btc', '2025-12-06 07:01:41'),
	(5375, 89667, 'btc', '2025-12-06 07:03:41'),
	(5376, 89672, 'btc', '2025-12-06 07:05:42'),
	(5377, 89690, 'btc', '2025-12-06 07:07:42'),
	(5378, 89698, 'btc', '2025-12-06 07:09:42'),
	(5379, 89665, 'btc', '2025-12-06 07:11:42'),
	(5380, 89688, 'btc', '2025-12-06 07:13:43'),
	(5381, 89688, 'btc', '2025-12-06 07:15:43'),
	(5382, 89689, 'btc', '2025-12-06 07:17:43'),
	(5383, 89689, 'btc', '2025-12-06 07:19:44'),
	(5384, 89650, 'btc', '2025-12-06 07:21:44'),
	(5385, 89691, 'btc', '2025-12-06 07:23:44'),
	(5386, 89667, 'btc', '2025-12-06 07:25:45'),
	(5387, 89620, 'btc', '2025-12-06 07:27:45'),
	(5388, 89580, 'btc', '2025-12-06 07:29:45'),
	(5389, 89499, 'btc', '2025-12-06 07:31:46'),
	(5390, 89598, 'btc', '2025-12-06 07:33:46'),
	(5391, 89605, 'btc', '2025-12-06 07:35:46'),
	(5392, 89647, 'btc', '2025-12-06 07:37:47'),
	(5393, 89594, 'btc', '2025-12-06 07:39:47'),
	(5394, 89652, 'btc', '2025-12-06 07:41:47'),
	(5395, 89637, 'btc', '2025-12-06 07:43:48'),
	(5396, 89658, 'btc', '2025-12-06 07:45:48'),
	(5397, 89683, 'btc', '2025-12-06 07:47:48'),
	(5398, 89671, 'btc', '2025-12-06 07:49:49'),
	(5399, 89614, 'btc', '2025-12-06 07:51:49'),
	(5400, 89601, 'btc', '2025-12-06 07:53:49'),
	(5401, 89579, 'btc', '2025-12-06 07:55:50'),
	(5402, 89625, 'btc', '2025-12-06 07:57:50'),
	(5403, 89586, 'btc', '2025-12-06 07:59:50'),
	(5404, 89580, 'btc', '2025-12-06 08:01:50'),
	(5405, 89570, 'btc', '2025-12-06 08:03:51'),
	(5406, 89576, 'btc', '2025-12-06 08:05:51'),
	(5407, 89562, 'btc', '2025-12-06 08:07:51'),
	(5408, 89585, 'btc', '2025-12-06 08:09:52'),
	(5409, 89546, 'btc', '2025-12-06 08:11:52'),
	(5410, 89553, 'btc', '2025-12-06 08:13:53'),
	(5411, 89536, 'btc', '2025-12-06 08:15:53'),
	(5412, 89585, 'btc', '2025-12-06 08:17:53'),
	(5413, 89554, 'btc', '2025-12-06 08:19:54'),
	(5414, 89411, 'btc', '2025-12-06 08:21:54'),
	(5415, 89389, 'btc', '2025-12-06 08:23:54'),
	(5416, 89360, 'btc', '2025-12-06 08:25:54'),
	(5417, 89343, 'btc', '2025-12-06 08:27:55'),
	(5418, 89288, 'btc', '2025-12-06 08:29:55'),
	(5419, 89327, 'btc', '2025-12-06 08:31:55'),
	(5420, 89227, 'btc', '2025-12-06 08:33:56'),
	(5421, 89311, 'btc', '2025-12-06 08:35:56'),
	(5422, 89417, 'btc', '2025-12-06 08:37:56'),
	(5423, 89333, 'btc', '2025-12-06 08:39:57'),
	(5424, 89389, 'btc', '2025-12-06 08:41:57'),
	(5425, 89394, 'btc', '2025-12-06 08:43:57'),
	(5426, 89360, 'btc', '2025-12-06 08:45:57'),
	(5427, 89311, 'btc', '2025-12-06 08:47:58'),
	(5428, 89295, 'btc', '2025-12-06 08:49:58'),
	(5429, 89356, 'btc', '2025-12-06 08:51:58'),
	(5430, 89302, 'btc', '2025-12-06 08:53:59'),
	(5431, 89315, 'btc', '2025-12-06 08:55:59'),
	(5432, 89317, 'btc', '2025-12-06 08:57:59'),
	(5433, 89277, 'btc', '2025-12-06 08:59:59'),
	(5434, 89307, 'btc', '2025-12-06 09:02:00'),
	(5435, 89342, 'btc', '2025-12-06 09:04:00'),
	(5436, 89316, 'btc', '2025-12-06 09:06:00'),
	(5437, 89361, 'btc', '2025-12-06 09:08:01'),
	(5438, 89399, 'btc', '2025-12-06 09:10:01'),
	(5439, 89489, 'btc', '2025-12-06 09:12:01'),
	(5440, 89515, 'btc', '2025-12-06 09:14:02'),
	(5441, 89489, 'btc', '2025-12-06 09:16:02'),
	(5442, 89538, 'btc', '2025-12-06 09:18:02'),
	(5443, 89503, 'btc', '2025-12-06 09:20:03'),
	(5444, 89523, 'btc', '2025-12-06 09:22:03'),
	(5445, 89532, 'btc', '2025-12-06 09:24:03'),
	(5446, 89554, 'btc', '2025-12-06 09:26:04'),
	(5447, 89603, 'btc', '2025-12-06 09:28:04'),
	(5448, 89608, 'btc', '2025-12-06 09:30:04'),
	(5449, 89533, 'btc', '2025-12-06 09:32:04'),
	(5450, 89581, 'btc', '2025-12-06 09:34:05'),
	(5451, 89610, 'btc', '2025-12-06 09:36:05'),
	(5452, 89598, 'btc', '2025-12-06 09:38:05'),
	(5453, 89634, 'btc', '2025-12-06 09:40:06'),
	(5454, 89616, 'btc', '2025-12-06 09:42:06'),
	(5455, 89608, 'btc', '2025-12-06 09:44:06'),
	(5456, 89628, 'btc', '2025-12-06 09:46:06'),
	(5457, 89625, 'btc', '2025-12-06 09:48:07'),
	(5458, 89625, 'btc', '2025-12-06 09:50:07'),
	(5459, 89634, 'btc', '2025-12-06 09:52:07'),
	(5460, 89613, 'btc', '2025-12-06 09:54:08'),
	(5461, 89573, 'btc', '2025-12-06 09:56:08'),
	(5462, 89575, 'btc', '2025-12-06 09:58:09'),
	(5463, 89582, 'btc', '2025-12-06 10:00:09'),
	(5464, 89572, 'btc', '2025-12-06 10:02:09'),
	(5465, 89544, 'btc', '2025-12-06 10:04:10'),
	(5466, 89500, 'btc', '2025-12-06 10:06:10'),
	(5467, 89543, 'btc', '2025-12-06 10:08:10'),
	(5468, 89542, 'btc', '2025-12-06 10:10:11'),
	(5469, 89552, 'btc', '2025-12-06 10:12:11'),
	(5470, 89575, 'btc', '2025-12-06 10:14:11'),
	(5471, 89600, 'btc', '2025-12-06 10:16:12'),
	(5472, 89594, 'btc', '2025-12-06 10:18:12'),
	(5473, 89600, 'btc', '2025-12-06 10:20:12'),
	(5474, 89683, 'btc', '2025-12-06 10:22:13'),
	(5475, 89628, 'btc', '2025-12-06 10:24:13'),
	(5476, 89554, 'btc', '2025-12-06 10:26:13'),
	(5477, 89527, 'btc', '2025-12-06 10:28:13'),
	(5478, 89519, 'btc', '2025-12-06 10:30:14'),
	(5479, 89559, 'btc', '2025-12-06 10:32:14'),
	(5480, 89536, 'btc', '2025-12-06 10:34:14'),
	(5481, 89539, 'btc', '2025-12-06 10:36:15'),
	(5482, 89510, 'btc', '2025-12-06 10:38:15'),
	(5483, 89544, 'btc', '2025-12-06 10:40:15'),
	(5484, 89573, 'btc', '2025-12-06 10:42:16'),
	(5485, 89554, 'btc', '2025-12-06 10:44:16'),
	(5486, 89572, 'btc', '2025-12-06 10:46:16'),
	(5487, 89497, 'btc', '2025-12-06 10:48:16'),
	(5488, 89528, 'btc', '2025-12-06 10:50:17'),
	(5489, 89521, 'btc', '2025-12-06 10:52:17'),
	(5490, 89523, 'btc', '2025-12-06 10:54:17'),
	(5491, 89509, 'btc', '2025-12-06 10:56:18'),
	(5492, 89539, 'btc', '2025-12-06 10:58:18'),
	(5493, 89506, 'btc', '2025-12-06 11:00:18'),
	(5494, 89515, 'btc', '2025-12-06 11:02:19'),
	(5495, 89523, 'btc', '2025-12-06 11:04:19'),
	(5496, 89501, 'btc', '2025-12-06 11:06:19'),
	(5497, 89527, 'btc', '2025-12-06 11:08:19'),
	(5498, 89537, 'btc', '2025-12-06 11:10:20'),
	(5499, 89578, 'btc', '2025-12-06 11:12:20'),
	(5500, 89514, 'btc', '2025-12-06 11:14:20'),
	(5501, 89530, 'btc', '2025-12-06 11:16:21'),
	(5502, 89560, 'btc', '2025-12-06 11:18:21'),
	(5503, 89568, 'btc', '2025-12-06 11:20:21'),
	(5504, 89568, 'btc', '2025-12-06 11:22:21'),
	(5505, 89561, 'btc', '2025-12-06 11:24:22'),
	(5506, 89573, 'btc', '2025-12-06 11:26:22'),
	(5507, 89609, 'btc', '2025-12-06 11:28:22'),
	(5508, 89587, 'btc', '2025-12-06 11:30:23'),
	(5509, 89577, 'btc', '2025-12-06 11:32:23'),
	(5510, 89615, 'btc', '2025-12-06 11:34:23'),
	(5511, 89617, 'btc', '2025-12-06 11:36:24'),
	(5512, 89597, 'btc', '2025-12-06 11:38:24'),
	(5513, 89608, 'btc', '2025-12-06 11:40:24'),
	(5514, 89700, 'btc', '2025-12-06 11:42:24'),
	(5515, 89730, 'btc', '2025-12-06 11:44:25'),
	(5516, 89705, 'btc', '2025-12-06 11:46:25'),
	(5517, 89723, 'btc', '2025-12-06 11:48:26'),
	(5518, 89678, 'btc', '2025-12-06 11:50:26'),
	(5519, 89650, 'btc', '2025-12-06 11:52:26'),
	(5520, 89640, 'btc', '2025-12-06 11:54:26'),
	(5521, 89629, 'btc', '2025-12-06 11:56:27'),
	(5522, 89612, 'btc', '2025-12-06 11:58:27'),
	(5523, 89603, 'btc', '2025-12-06 12:00:27'),
	(5524, 89587, 'btc', '2025-12-06 12:02:28'),
	(5525, 89596, 'btc', '2025-12-06 12:04:28'),
	(5526, 89625, 'btc', '2025-12-06 12:06:28'),
	(5527, 89615, 'btc', '2025-12-06 12:08:28'),
	(5528, 89579, 'btc', '2025-12-06 12:10:29'),
	(5529, 89586, 'btc', '2025-12-06 12:12:29'),
	(5530, 89582, 'btc', '2025-12-06 12:14:29'),
	(5531, 89592, 'btc', '2025-12-06 12:16:30'),
	(5532, 89597, 'btc', '2025-12-06 12:18:30'),
	(5533, 89607, 'btc', '2025-12-06 12:20:30'),
	(5534, 89611, 'btc', '2025-12-06 12:22:31'),
	(5535, 89623, 'btc', '2025-12-06 12:24:31'),
	(5536, 89589, 'btc', '2025-12-06 12:26:31'),
	(5537, 89627, 'btc', '2025-12-06 12:28:31'),
	(5538, 89629, 'btc', '2025-12-06 12:30:32'),
	(5539, 89627, 'btc', '2025-12-06 12:32:32'),
	(5540, 89613, 'btc', '2025-12-06 12:34:32'),
	(5541, 89608, 'btc', '2025-12-06 12:36:33'),
	(5542, 89618, 'btc', '2025-12-06 12:38:33'),
	(5543, 89600, 'btc', '2025-12-06 12:40:33'),
	(5544, 89566, 'btc', '2025-12-06 12:42:34'),
	(5545, 89599, 'btc', '2025-12-06 12:44:34'),
	(5546, 89589, 'btc', '2025-12-06 12:46:34'),
	(5547, 89626, 'btc', '2025-12-06 12:48:34'),
	(5548, 89599, 'btc', '2025-12-06 12:50:35'),
	(5549, 89576, 'btc', '2025-12-06 12:52:35'),
	(5550, 89582, 'btc', '2025-12-06 12:54:35'),
	(5551, 89603, 'btc', '2025-12-06 12:56:36'),
	(5552, 89593, 'btc', '2025-12-06 12:58:36'),
	(5553, 89587, 'btc', '2025-12-06 13:00:36'),
	(5554, 89596, 'btc', '2025-12-06 13:02:36'),
	(5555, 89610, 'btc', '2025-12-06 13:04:37'),
	(5556, 89634, 'btc', '2025-12-06 13:06:37'),
	(5557, 89613, 'btc', '2025-12-06 13:08:37'),
	(5558, 89593, 'btc', '2025-12-06 13:10:38'),
	(5559, 89590, 'btc', '2025-12-06 13:12:38'),
	(5560, 89611, 'btc', '2025-12-06 13:14:38'),
	(5561, 89622, 'btc', '2025-12-06 13:16:39'),
	(5562, 89622, 'btc', '2025-12-06 13:18:39'),
	(5563, 89619, 'btc', '2025-12-06 13:20:39'),
	(5564, 89605, 'btc', '2025-12-06 13:22:40'),
	(5565, 89613, 'btc', '2025-12-06 13:24:40'),
	(5566, 89680, 'btc', '2025-12-06 13:26:40'),
	(5567, 89662, 'btc', '2025-12-06 13:28:40'),
	(5568, 89690, 'btc', '2025-12-06 13:30:41'),
	(5569, 89697, 'btc', '2025-12-06 13:32:41'),
	(5570, 89696, 'btc', '2025-12-06 13:34:41'),
	(5571, 89742, 'btc', '2025-12-06 13:36:42'),
	(5572, 89740, 'btc', '2025-12-06 13:38:42'),
	(5573, 89724, 'btc', '2025-12-06 13:40:42'),
	(5574, 89746, 'btc', '2025-12-06 13:42:43'),
	(5575, 89783, 'btc', '2025-12-06 13:44:43'),
	(5576, 89770, 'btc', '2025-12-06 13:46:43'),
	(5577, 89737, 'btc', '2025-12-06 13:48:44'),
	(5578, 89719, 'btc', '2025-12-06 13:50:44'),
	(5579, 89734, 'btc', '2025-12-06 13:52:44'),
	(5580, 89669, 'btc', '2025-12-06 13:54:44'),
	(5581, 89672, 'btc', '2025-12-06 13:56:45'),
	(5582, 89674, 'btc', '2025-12-06 13:58:45'),
	(5583, 89659, 'btc', '2025-12-06 14:00:45'),
	(5584, 89676, 'btc', '2025-12-06 14:02:46'),
	(5585, 89676, 'btc', '2025-12-06 14:04:46'),
	(5586, 89690, 'btc', '2025-12-06 14:06:46'),
	(5587, 89670, 'btc', '2025-12-06 14:08:47'),
	(5588, 89666, 'btc', '2025-12-06 14:10:47'),
	(5589, 89723, 'btc', '2025-12-06 14:12:47'),
	(5590, 89740, 'btc', '2025-12-06 14:14:47'),
	(5591, 89924, 'btc', '2025-12-06 14:16:48'),
	(5592, 90108, 'btc', '2025-12-06 14:18:48'),
	(5593, 89974, 'btc', '2025-12-06 14:20:48'),
	(5594, 90054, 'btc', '2025-12-06 14:22:49'),
	(5595, 89931, 'btc', '2025-12-06 14:24:49'),
	(5596, 89932, 'btc', '2025-12-06 14:26:49'),
	(5597, 89928, 'btc', '2025-12-06 14:28:50'),
	(5598, 89936, 'btc', '2025-12-06 14:30:50'),
	(5599, 90016, 'btc', '2025-12-06 14:32:50'),
	(5600, 90013, 'btc', '2025-12-06 14:34:51'),
	(5601, 89962, 'btc', '2025-12-06 14:36:51'),
	(5602, 90071, 'btc', '2025-12-06 14:38:51'),
	(5603, 90049, 'btc', '2025-12-06 14:40:51'),
	(5604, 90050, 'btc', '2025-12-06 14:42:52'),
	(5605, 89999, 'btc', '2025-12-06 14:44:52'),
	(5606, 90159, 'btc', '2025-12-06 14:46:52'),
	(5607, 90130, 'btc', '2025-12-06 14:48:53'),
	(5608, 90014, 'btc', '2025-12-06 14:50:53'),
	(5609, 90072, 'btc', '2025-12-06 14:52:53'),
	(5610, 90060, 'btc', '2025-12-06 14:54:53'),
	(5611, 90067, 'btc', '2025-12-06 14:56:54'),
	(5612, 90010, 'btc', '2025-12-06 14:58:54'),
	(5613, 89994, 'btc', '2025-12-06 15:00:54'),
	(5614, 89907, 'btc', '2025-12-06 15:02:55'),
	(5615, 89958, 'btc', '2025-12-06 15:04:55'),
	(5616, 89838, 'btc', '2025-12-06 15:06:55'),
	(5617, 89836, 'btc', '2025-12-06 15:08:56'),
	(5618, 89913, 'btc', '2025-12-06 15:10:56'),
	(5619, 89860, 'btc', '2025-12-06 15:12:56'),
	(5620, 89841, 'btc', '2025-12-06 15:14:56'),
	(5621, 89656, 'btc', '2025-12-06 15:16:57'),
	(5622, 89607, 'btc', '2025-12-06 15:18:57'),
	(5623, 89630, 'btc', '2025-12-06 15:20:57'),
	(5624, 89629, 'btc', '2025-12-06 15:22:58'),
	(5625, 89593, 'btc', '2025-12-06 15:24:58'),
	(5626, 89585, 'btc', '2025-12-06 15:26:58'),
	(5627, 89631, 'btc', '2025-12-06 15:28:59'),
	(5628, 89648, 'btc', '2025-12-06 15:30:59'),
	(5629, 89648, 'btc', '2025-12-06 15:32:59'),
	(5630, 89615, 'btc', '2025-12-06 15:35:00'),
	(5631, 89659, 'btc', '2025-12-06 15:37:00'),
	(5632, 89651, 'btc', '2025-12-06 15:39:00'),
	(5633, 89893, 'btc', '2025-12-06 15:41:00'),
	(5634, 89903, 'btc', '2025-12-06 15:43:01'),
	(5635, 89874, 'btc', '2025-12-06 15:45:01'),
	(5636, 89898, 'btc', '2025-12-06 15:47:01'),
	(5637, 89899, 'btc', '2025-12-06 15:49:02'),
	(5638, 89890, 'btc', '2025-12-06 15:51:02'),
	(5639, 89855, 'btc', '2025-12-06 15:53:02'),
	(5640, 89861, 'btc', '2025-12-06 15:55:02'),
	(5641, 89844, 'btc', '2025-12-06 15:57:03'),
	(5642, 89880, 'btc', '2025-12-06 15:59:03'),
	(5643, 89766, 'btc', '2025-12-06 16:01:04'),
	(5644, 89865, 'btc', '2025-12-06 16:03:04'),
	(5645, 89880, 'btc', '2025-12-06 16:05:04'),
	(5646, 89919, 'btc', '2025-12-06 16:07:04'),
	(5647, 89957, 'btc', '2025-12-06 16:09:05'),
	(5648, 89957, 'btc', '2025-12-06 16:11:05'),
	(5649, 89943, 'btc', '2025-12-06 16:13:05'),
	(5650, 89943, 'btc', '2025-12-06 16:15:06'),
	(5651, 89923, 'btc', '2025-12-06 16:17:06'),
	(5652, 89900, 'btc', '2025-12-06 16:19:06'),
	(5653, 89878, 'btc', '2025-12-06 16:21:07'),
	(5654, 89896, 'btc', '2025-12-06 16:23:07'),
	(5655, 89914, 'btc', '2025-12-06 16:25:07'),
	(5656, 89919, 'btc', '2025-12-06 16:27:08'),
	(5657, 89873, 'btc', '2025-12-06 16:29:08'),
	(5658, 89829, 'btc', '2025-12-06 16:31:08'),
	(5659, 89871, 'btc', '2025-12-06 16:33:09'),
	(5660, 89835, 'btc', '2025-12-06 16:35:09'),
	(5661, 89838, 'btc', '2025-12-06 16:37:09'),
	(5662, 89856, 'btc', '2025-12-06 16:39:09'),
	(5663, 89862, 'btc', '2025-12-06 16:41:10'),
	(5664, 89825, 'btc', '2025-12-06 16:43:10'),
	(5665, 89815, 'btc', '2025-12-06 16:45:10'),
	(5666, 89807, 'btc', '2025-12-06 16:47:11'),
	(5667, 89788, 'btc', '2025-12-06 16:49:11'),
	(5668, 89712, 'btc', '2025-12-06 16:51:11'),
	(5669, 89680, 'btc', '2025-12-06 16:53:12'),
	(5670, 89716, 'btc', '2025-12-06 16:55:12'),
	(5671, 89692, 'btc', '2025-12-06 16:57:12'),
	(5672, 89708, 'btc', '2025-12-06 16:59:12'),
	(5673, 89699, 'btc', '2025-12-06 17:00:28'),
	(5674, 89683, 'btc', '2025-12-06 17:02:28'),
	(5675, 89704, 'btc', '2025-12-06 17:04:29'),
	(5676, 89742, 'btc', '2025-12-06 17:06:29'),
	(5677, 89765, 'btc', '2025-12-06 17:08:29'),
	(5678, 89744, 'btc', '2025-12-06 17:10:30'),
	(5679, 89666, 'btc', '2025-12-06 17:12:30'),
	(5680, 89682, 'btc', '2025-12-06 17:14:30'),
	(5681, 89683, 'btc', '2025-12-06 17:16:30'),
	(5682, 89660, 'btc', '2025-12-06 17:18:31'),
	(5683, 89650, 'btc', '2025-12-06 17:20:31'),
	(5684, 89633, 'btc', '2025-12-06 17:22:31'),
	(5685, 89734, 'btc', '2025-12-06 17:24:32'),
	(5686, 89752, 'btc', '2025-12-06 17:26:32'),
	(5687, 89750, 'btc', '2025-12-06 17:28:32'),
	(5688, 89778, 'btc', '2025-12-06 17:30:33'),
	(5689, 89784, 'btc', '2025-12-06 17:32:33'),
	(5690, 89692, 'btc', '2025-12-06 17:34:33'),
	(5691, 89717, 'btc', '2025-12-06 17:36:33'),
	(5692, 89720, 'btc', '2025-12-06 17:38:34'),
	(5693, 89661, 'btc', '2025-12-06 17:40:34'),
	(5694, 89671, 'btc', '2025-12-06 17:42:34'),
	(5695, 89664, 'btc', '2025-12-06 17:44:35'),
	(5696, 89695, 'btc', '2025-12-06 17:46:35'),
	(5697, 89655, 'btc', '2025-12-06 17:48:35'),
	(5698, 89659, 'btc', '2025-12-06 17:50:35'),
	(5699, 89633, 'btc', '2025-12-06 17:52:36'),
	(5700, 89676, 'btc', '2025-12-06 17:54:36'),
	(5701, 89680, 'btc', '2025-12-06 17:56:36'),
	(5702, 89716, 'btc', '2025-12-06 17:58:37'),
	(5703, 89707, 'btc', '2025-12-06 18:00:37'),
	(5704, 89648, 'btc', '2025-12-06 18:02:37'),
	(5705, 89664, 'btc', '2025-12-06 18:04:38'),
	(5706, 89690, 'btc', '2025-12-06 18:06:38'),
	(5707, 89643, 'btc', '2025-12-06 18:08:38'),
	(5708, 89651, 'btc', '2025-12-06 18:10:38'),
	(5709, 89667, 'btc', '2025-12-06 18:12:39'),
	(5710, 89766, 'btc', '2025-12-06 18:14:39'),
	(5711, 89749, 'btc', '2025-12-06 18:16:39'),
	(5712, 89788, 'btc', '2025-12-06 18:18:40'),
	(5713, 89723, 'btc', '2025-12-06 18:20:40'),
	(5714, 89714, 'btc', '2025-12-06 18:22:40'),
	(5715, 89699, 'btc', '2025-12-06 18:24:41'),
	(5716, 89756, 'btc', '2025-12-06 18:26:41'),
	(5717, 89762, 'btc', '2025-12-06 18:28:41'),
	(5718, 89693, 'btc', '2025-12-06 18:30:41'),
	(5719, 89701, 'btc', '2025-12-06 18:32:42'),
	(5720, 89735, 'btc', '2025-12-06 18:34:42'),
	(5721, 89723, 'btc', '2025-12-06 18:36:42'),
	(5722, 89723, 'btc', '2025-12-06 18:38:43'),
	(5723, 89680, 'btc', '2025-12-06 18:40:43'),
	(5724, 89723, 'btc', '2025-12-06 18:42:43'),
	(5725, 89650, 'btc', '2025-12-06 18:44:43'),
	(5726, 89628, 'btc', '2025-12-06 18:46:44'),
	(5727, 89609, 'btc', '2025-12-06 18:48:44'),
	(5728, 89613, 'btc', '2025-12-06 18:50:44'),
	(5729, 89556, 'btc', '2025-12-06 18:52:45'),
	(5730, 89575, 'btc', '2025-12-06 18:54:45'),
	(5731, 89608, 'btc', '2025-12-06 18:56:45'),
	(5732, 89647, 'btc', '2025-12-06 18:58:46'),
	(5733, 89636, 'btc', '2025-12-06 19:00:46'),
	(5734, 89725, 'btc', '2025-12-06 19:02:46'),
	(5735, 89717, 'btc', '2025-12-06 19:04:46'),
	(5736, 89728, 'btc', '2025-12-06 19:06:47'),
	(5737, 89475, 'btc', '2025-12-06 19:08:47'),
	(5738, 89473, 'btc', '2025-12-06 19:10:47'),
	(5739, 89483, 'btc', '2025-12-06 19:12:48'),
	(5740, 89487, 'btc', '2025-12-06 19:14:48'),
	(5741, 89550, 'btc', '2025-12-06 19:16:48'),
	(5742, 89564, 'btc', '2025-12-06 19:18:49'),
	(5743, 89520, 'btc', '2025-12-06 19:20:49'),
	(5744, 89522, 'btc', '2025-12-06 19:22:49'),
	(5745, 89522, 'btc', '2025-12-06 19:24:49'),
	(5746, 89470, 'btc', '2025-12-06 19:26:50'),
	(5747, 89488, 'btc', '2025-12-06 19:28:50'),
	(5748, 89427, 'btc', '2025-12-06 19:30:50'),
	(5749, 89313, 'btc', '2025-12-06 19:32:51'),
	(5750, 89385, 'btc', '2025-12-06 19:34:51'),
	(5751, 89402, 'btc', '2025-12-06 19:36:51'),
	(5752, 89370, 'btc', '2025-12-06 19:38:52'),
	(5753, 89398, 'btc', '2025-12-06 19:40:52'),
	(5754, 89490, 'btc', '2025-12-06 19:42:52'),
	(5755, 89433, 'btc', '2025-12-06 19:44:52'),
	(5756, 89467, 'btc', '2025-12-06 19:46:53'),
	(5757, 89436, 'btc', '2025-12-06 19:48:53'),
	(5758, 89432, 'btc', '2025-12-06 19:50:53'),
	(5759, 89425, 'btc', '2025-12-06 19:52:54'),
	(5760, 89404, 'btc', '2025-12-06 19:54:54'),
	(5761, 89393, 'btc', '2025-12-06 19:56:54'),
	(5762, 89410, 'btc', '2025-12-06 19:58:55'),
	(5763, 89452, 'btc', '2025-12-06 20:00:55'),
	(5764, 89462, 'btc', '2025-12-06 20:02:55'),
	(5765, 89449, 'btc', '2025-12-06 20:04:55'),
	(5766, 89468, 'btc', '2025-12-06 20:06:56'),
	(5767, 89348, 'btc', '2025-12-06 20:08:56'),
	(5768, 89378, 'btc', '2025-12-06 20:10:56'),
	(5769, 89426, 'btc', '2025-12-06 20:12:57'),
	(5770, 89392, 'btc', '2025-12-06 20:14:57'),
	(5771, 89409, 'btc', '2025-12-06 20:16:57'),
	(5772, 89419, 'btc', '2025-12-06 20:18:57'),
	(5773, 89415, 'btc', '2025-12-06 20:20:58'),
	(5774, 89431, 'btc', '2025-12-06 20:22:58'),
	(5775, 89413, 'btc', '2025-12-06 20:24:58'),
	(5776, 89425, 'btc', '2025-12-06 20:26:59'),
	(5777, 89443, 'btc', '2025-12-06 20:28:59'),
	(5778, 89435, 'btc', '2025-12-06 20:30:59'),
	(5779, 89446, 'btc', '2025-12-06 20:33:00'),
	(5780, 89467, 'btc', '2025-12-06 20:35:00'),
	(5781, 89506, 'btc', '2025-12-06 20:37:00'),
	(5782, 89484, 'btc', '2025-12-06 20:39:00'),
	(5783, 89516, 'btc', '2025-12-06 20:41:01'),
	(5784, 89537, 'btc', '2025-12-06 20:49:12'),
	(5785, 89533, 'btc', '2025-12-06 20:51:12'),
	(5786, 89527, 'btc', '2025-12-06 20:53:12'),
	(5787, 89540, 'btc', '2025-12-06 20:55:12'),
	(5788, 89549, 'btc', '2025-12-06 20:57:13'),
	(5789, 89549, 'btc', '2025-12-06 20:59:13'),
	(5790, 89523, 'btc', '2025-12-06 21:01:13'),
	(5791, 89554, 'btc', '2025-12-06 21:03:14'),
	(5792, 89608, 'btc', '2025-12-06 21:05:14'),
	(5793, 89504, 'btc', '2025-12-06 21:07:14'),
	(5794, 89508, 'btc', '2025-12-06 21:13:54'),
	(5795, 89439, 'btc', '2025-12-06 21:15:55'),
	(5796, 89487, 'btc', '2025-12-06 21:17:55'),
	(5797, 89459, 'btc', '2025-12-06 21:19:55'),
	(5798, 89469, 'btc', '2025-12-06 21:21:56'),
	(5799, 89427, 'btc', '2025-12-06 21:23:56'),
	(5800, 89403, 'btc', '2025-12-06 21:25:56'),
	(5801, 89446, 'btc', '2025-12-06 21:27:57'),
	(5802, 89432, 'btc', '2025-12-06 21:29:57'),
	(5803, 89436, 'btc', '2025-12-06 21:31:57'),
	(5804, 89417, 'btc', '2025-12-06 21:33:57'),
	(5805, 89445, 'btc', '2025-12-06 21:35:58'),
	(5806, 89460, 'btc', '2025-12-06 21:37:58'),
	(5807, 89489, 'btc', '2025-12-06 21:39:58'),
	(5808, 89507, 'btc', '2025-12-06 21:41:59'),
	(5809, 89489, 'btc', '2025-12-06 21:43:59'),
	(5810, 89475, 'btc', '2025-12-06 21:45:59'),
	(5811, 89477, 'btc', '2025-12-06 21:48:00'),
	(5812, 89466, 'btc', '2025-12-06 21:50:00'),
	(5813, 89471, 'btc', '2025-12-06 21:52:00'),
	(5814, 89453, 'btc', '2025-12-06 21:54:01'),
	(5815, 89415, 'btc', '2025-12-06 21:56:01'),
	(5816, 89446, 'btc', '2025-12-06 21:58:01'),
	(5817, 89420, 'btc', '2025-12-06 22:00:01'),
	(5818, 89404, 'btc', '2025-12-06 22:02:02'),
	(5819, 89392, 'btc', '2025-12-06 22:04:02'),
	(5820, 89397, 'btc', '2025-12-06 22:06:02'),
	(5821, 89385, 'btc', '2025-12-06 22:08:03'),
	(5822, 89348, 'btc', '2025-12-06 22:10:03'),
	(5823, 89348, 'btc', '2025-12-06 22:12:04'),
	(5824, 89488, 'btc', '2025-12-06 22:14:04'),
	(5825, 89417, 'btc', '2025-12-06 22:16:04'),
	(5826, 89462, 'btc', '2025-12-06 22:17:51'),
	(5827, 89493, 'btc', '2025-12-06 22:19:51'),
	(5828, 89480, 'btc', '2025-12-06 22:21:52'),
	(5829, 89488, 'btc', '2025-12-06 22:23:52'),
	(5830, 89448, 'btc', '2025-12-06 22:25:52'),
	(5831, 89411, 'btc', '2025-12-06 22:27:53'),
	(5832, 89381, 'btc', '2025-12-06 22:29:53'),
	(5833, 89397, 'btc', '2025-12-06 22:31:53'),
	(5834, 89417, 'btc', '2025-12-06 22:33:53'),
	(5835, 89400, 'btc', '2025-12-06 22:35:54'),
	(5836, 89398, 'btc', '2025-12-06 22:37:54'),
	(5837, 89432, 'btc', '2025-12-06 22:39:54'),
	(5838, 89419, 'btc', '2025-12-06 22:41:55'),
	(5839, 89351, 'btc', '2025-12-06 22:43:55'),
	(5840, 89340, 'btc', '2025-12-06 22:45:55'),
	(5841, 89331, 'btc', '2025-12-06 22:47:56'),
	(5842, 89355, 'btc', '2025-12-06 22:49:56'),
	(5843, 89321, 'btc', '2025-12-06 22:51:56'),
	(5844, 89257, 'btc', '2025-12-06 22:53:57'),
	(5845, 89316, 'btc', '2025-12-06 22:55:57'),
	(5846, 89261, 'btc', '2025-12-06 22:57:57'),
	(5847, 89286, 'btc', '2025-12-06 22:59:58'),
	(5848, 89325, 'btc', '2025-12-06 23:01:58'),
	(5849, 89133, 'btc', '2025-12-06 23:03:58'),
	(5850, 89119, 'btc', '2025-12-06 23:05:58'),
	(5851, 89183, 'btc', '2025-12-06 23:07:59'),
	(5852, 89110, 'btc', '2025-12-06 23:09:59'),
	(5853, 89184, 'btc', '2025-12-06 23:11:59'),
	(5854, 89162, 'btc', '2025-12-06 23:14:00'),
	(5855, 89172, 'btc', '2025-12-06 23:16:00'),
	(5856, 89150, 'btc', '2025-12-06 23:18:00'),
	(5857, 89122, 'btc', '2025-12-06 23:19:00'),
	(5858, 89094, 'btc', '2025-12-06 23:21:00'),
	(5859, 88989, 'btc', '2025-12-06 23:23:00'),
	(5860, 88950, 'btc', '2025-12-06 23:25:01'),
	(5861, 88942, 'btc', '2025-12-06 23:27:01'),
	(5862, 89000, 'btc', '2025-12-06 23:29:01'),
	(5863, 89026, 'btc', '2025-12-06 23:31:02'),
	(5864, 89068, 'btc', '2025-12-06 23:33:02'),
	(5865, 89049, 'btc', '2025-12-06 23:35:02'),
	(5866, 89124, 'btc', '2025-12-06 23:37:03'),
	(5867, 89165, 'btc', '2025-12-06 23:39:03'),
	(5868, 89143, 'btc', '2025-12-06 23:41:03'),
	(5869, 89046, 'btc', '2025-12-06 23:43:04'),
	(5870, 89098, 'btc', '2025-12-06 23:45:04'),
	(5871, 89240, 'btc', '2025-12-06 23:47:04'),
	(5872, 89186, 'btc', '2025-12-06 23:49:04'),
	(5873, 89238, 'btc', '2025-12-06 23:51:05'),
	(5874, 89238, 'btc', '2025-12-06 23:53:05'),
	(5875, 89231, 'btc', '2025-12-06 23:55:05'),
	(5876, 89262, 'btc', '2025-12-06 23:57:06'),
	(5877, 89255, 'btc', '2025-12-06 23:59:06'),
	(5878, 89207, 'btc', '2025-12-07 00:01:06'),
	(5879, 89229, 'btc', '2025-12-07 00:03:07'),
	(5880, 89326, 'btc', '2025-12-07 00:05:07'),
	(5881, 89308, 'btc', '2025-12-07 00:07:07'),
	(5882, 89318, 'btc', '2025-12-07 00:09:07'),
	(5883, 89343, 'btc', '2025-12-07 00:11:08'),
	(5884, 89267, 'btc', '2025-12-07 00:13:08'),
	(5885, 89199, 'btc', '2025-12-07 00:15:08'),
	(5886, 89231, 'btc', '2025-12-07 00:17:09'),
	(5887, 89245, 'btc', '2025-12-07 00:19:09'),
	(5888, 89235, 'btc', '2025-12-07 00:21:09'),
	(5889, 89294, 'btc', '2025-12-07 00:23:10'),
	(5890, 89323, 'btc', '2025-12-07 00:25:10'),
	(5891, 89308, 'btc', '2025-12-07 00:27:10'),
	(5892, 89366, 'btc', '2025-12-07 00:29:10'),
	(5893, 89359, 'btc', '2025-12-07 00:31:11'),
	(5894, 89400, 'btc', '2025-12-07 00:33:11'),
	(5895, 89448, 'btc', '2025-12-07 00:35:11'),
	(5896, 89449, 'btc', '2025-12-07 00:37:12'),
	(5897, 89499, 'btc', '2025-12-07 00:39:12'),
	(5898, 89510, 'btc', '2025-12-07 00:41:12'),
	(5899, 89549, 'btc', '2025-12-07 00:43:12'),
	(5900, 89488, 'btc', '2025-12-07 00:45:13'),
	(5901, 89482, 'btc', '2025-12-07 00:47:13'),
	(5902, 89449, 'btc', '2025-12-07 00:49:13'),
	(5903, 89520, 'btc', '2025-12-07 00:51:14'),
	(5904, 89502, 'btc', '2025-12-07 00:53:14'),
	(5905, 89464, 'btc', '2025-12-07 00:55:14'),
	(5906, 89468, 'btc', '2025-12-07 00:57:15'),
	(5907, 89489, 'btc', '2025-12-07 00:57:48'),
	(5908, 89404, 'btc', '2025-12-07 00:59:48'),
	(5909, 89530, 'btc', '2025-12-07 01:01:49'),
	(5910, 89462, 'btc', '2025-12-07 01:03:49'),
	(5911, 89488, 'btc', '2025-12-07 01:05:49'),
	(5912, 89428, 'btc', '2025-12-07 01:07:49'),
	(5913, 89454, 'btc', '2025-12-07 01:09:50'),
	(5914, 89482, 'btc', '2025-12-07 01:11:50'),
	(5915, 89496, 'btc', '2025-12-07 01:13:50'),
	(5916, 89490, 'btc', '2025-12-07 01:15:51'),
	(5917, 89548, 'btc', '2025-12-07 01:17:51'),
	(5918, 89560, 'btc', '2025-12-07 01:19:51'),
	(5919, 89571, 'btc', '2025-12-07 01:21:52'),
	(5920, 89500, 'btc', '2025-12-07 01:23:52'),
	(5921, 89422, 'btc', '2025-12-07 01:25:52'),
	(5922, 89450, 'btc', '2025-12-07 01:27:52'),
	(5923, 89450, 'btc', '2025-12-07 01:29:53'),
	(5924, 89454, 'btc', '2025-12-07 01:31:53'),
	(5925, 89408, 'btc', '2025-12-07 01:33:53'),
	(5926, 89429, 'btc', '2025-12-07 01:35:54'),
	(5927, 89438, 'btc', '2025-12-07 01:37:54'),
	(5928, 89403, 'btc', '2025-12-07 01:39:54'),
	(5929, 89412, 'btc', '2025-12-07 01:41:54'),
	(5930, 89390, 'btc', '2025-12-07 01:43:55'),
	(5931, 89359, 'btc', '2025-12-07 01:45:55'),
	(5932, 89380, 'btc', '2025-12-07 01:47:55'),
	(5933, 89413, 'btc', '2025-12-07 01:49:56'),
	(5934, 89449, 'btc', '2025-12-07 01:51:56'),
	(5935, 89372, 'btc', '2025-12-07 01:53:56'),
	(5936, 89363, 'btc', '2025-12-07 01:55:57'),
	(5937, 89343, 'btc', '2025-12-07 01:57:57'),
	(5938, 89300, 'btc', '2025-12-07 01:59:57'),
	(5939, 89349, 'btc', '2025-12-07 02:01:57'),
	(5940, 89380, 'btc', '2025-12-07 02:03:58'),
	(5941, 89377, 'btc', '2025-12-07 02:05:58'),
	(5942, 89387, 'btc', '2025-12-07 02:07:58'),
	(5943, 89396, 'btc', '2025-12-07 02:09:59'),
	(5944, 89387, 'btc', '2025-12-07 02:11:59'),
	(5945, 89387, 'btc', '2025-12-07 02:13:59'),
	(5946, 89397, 'btc', '2025-12-07 02:15:59'),
	(5947, 89434, 'btc', '2025-12-07 02:18:00'),
	(5948, 89485, 'btc', '2025-12-07 02:20:00'),
	(5949, 89472, 'btc', '2025-12-07 02:22:00'),
	(5950, 89463, 'btc', '2025-12-07 02:24:01'),
	(5951, 89444, 'btc', '2025-12-07 02:26:01'),
	(5952, 89452, 'btc', '2025-12-07 02:28:01'),
	(5953, 89441, 'btc', '2025-12-07 02:30:01'),
	(5954, 89441, 'btc', '2025-12-07 02:32:02'),
	(5955, 89436, 'btc', '2025-12-07 02:34:02'),
	(5956, 89450, 'btc', '2025-12-07 02:36:02'),
	(5957, 89414, 'btc', '2025-12-07 02:38:03'),
	(5958, 89410, 'btc', '2025-12-07 02:40:03'),
	(5959, 89421, 'btc', '2025-12-07 02:42:03'),
	(5960, 89437, 'btc', '2025-12-07 02:44:04'),
	(5961, 89450, 'btc', '2025-12-07 02:46:04'),
	(5962, 89476, 'btc', '2025-12-07 02:48:04'),
	(5963, 89499, 'btc', '2025-12-07 02:50:05'),
	(5964, 89539, 'btc', '2025-12-07 02:52:05'),
	(5965, 89549, 'btc', '2025-12-07 02:54:05'),
	(5966, 89590, 'btc', '2025-12-07 02:56:06'),
	(5967, 89631, 'btc', '2025-12-07 02:58:06'),
	(5968, 89619, 'btc', '2025-12-07 03:00:06'),
	(5969, 89595, 'btc', '2025-12-07 03:02:07'),
	(5970, 89564, 'btc', '2025-12-07 03:04:07'),
	(5971, 89571, 'btc', '2025-12-07 03:06:07'),
	(5972, 89569, 'btc', '2025-12-07 03:08:07'),
	(5973, 89613, 'btc', '2025-12-07 03:10:08'),
	(5974, 89619, 'btc', '2025-12-07 03:12:08'),
	(5975, 89592, 'btc', '2025-12-07 03:14:08'),
	(5976, 89583, 'btc', '2025-12-07 03:16:09'),
	(5977, 89561, 'btc', '2025-12-07 03:18:09'),
	(5978, 89608, 'btc', '2025-12-07 03:20:09'),
	(5979, 89583, 'btc', '2025-12-07 03:22:09'),
	(5980, 89583, 'btc', '2025-12-07 03:24:10'),
	(5981, 89577, 'btc', '2025-12-07 03:26:11'),
	(5982, 89577, 'btc', '2025-12-07 03:28:11'),
	(5983, 89577, 'btc', '2025-12-07 03:30:11'),
	(5984, 89589, 'btc', '2025-12-07 03:32:11'),
	(5985, 89582, 'btc', '2025-12-07 03:34:12'),
	(5986, 89586, 'btc', '2025-12-07 03:36:12'),
	(5987, 89654, 'btc', '2025-12-07 03:38:12'),
	(5988, 89661, 'btc', '2025-12-07 03:40:13'),
	(5989, 89705, 'btc', '2025-12-07 03:42:13'),
	(5990, 89698, 'btc', '2025-12-07 03:44:13'),
	(5991, 89694, 'btc', '2025-12-07 03:46:14'),
	(5992, 89728, 'btc', '2025-12-07 03:48:14'),
	(5993, 89728, 'btc', '2025-12-07 03:50:14'),
	(5994, 89728, 'btc', '2025-12-07 03:52:15'),
	(5995, 89682, 'btc', '2025-12-07 03:54:15'),
	(5996, 89706, 'btc', '2025-12-07 03:56:15'),
	(5997, 89706, 'btc', '2025-12-07 03:58:15'),
	(5998, 89718, 'btc', '2025-12-07 04:00:16'),
	(5999, 89734, 'btc', '2025-12-07 04:02:16'),
	(6000, 89690, 'btc', '2025-12-07 04:04:16'),
	(6001, 89752, 'btc', '2025-12-07 04:06:17'),
	(6002, 89791, 'btc', '2025-12-07 04:08:17'),
	(6003, 89724, 'btc', '2025-12-07 04:10:17'),
	(6004, 89716, 'btc', '2025-12-07 04:12:18'),
	(6005, 89696, 'btc', '2025-12-07 04:14:18'),
	(6006, 89675, 'btc', '2025-12-07 04:16:18'),
	(6007, 89673, 'btc', '2025-12-07 04:18:18'),
	(6008, 89650, 'btc', '2025-12-07 04:20:19'),
	(6009, 89662, 'btc', '2025-12-07 04:22:19'),
	(6010, 89674, 'btc', '2025-12-07 04:24:19'),
	(6011, 89674, 'btc', '2025-12-07 04:26:20'),
	(6012, 89646, 'btc', '2025-12-07 04:28:20'),
	(6013, 89635, 'btc', '2025-12-07 04:30:20'),
	(6014, 89600, 'btc', '2025-12-07 04:32:21'),
	(6015, 89556, 'btc', '2025-12-07 04:34:21'),
	(6016, 89567, 'btc', '2025-12-07 04:36:21'),
	(6017, 89506, 'btc', '2025-12-07 04:38:22'),
	(6018, 89504, 'btc', '2025-12-07 04:40:22'),
	(6019, 89533, 'btc', '2025-12-07 04:42:22'),
	(6020, 89554, 'btc', '2025-12-07 04:44:22'),
	(6021, 89583, 'btc', '2025-12-07 04:46:23'),
	(6022, 89569, 'btc', '2025-12-07 04:48:23'),
	(6023, 89566, 'btc', '2025-12-07 04:50:23'),
	(6024, 89525, 'btc', '2025-12-07 04:52:24'),
	(6025, 89540, 'btc', '2025-12-07 04:54:24'),
	(6026, 89541, 'btc', '2025-12-07 04:56:24'),
	(6027, 89536, 'btc', '2025-12-07 04:58:24'),
	(6028, 89548, 'btc', '2025-12-07 05:00:25'),
	(6029, 89554, 'btc', '2025-12-07 05:01:36'),
	(6030, 89522, 'btc', '2025-12-07 05:03:36'),
	(6031, 89512, 'btc', '2025-12-07 05:05:36'),
	(6032, 89512, 'btc', '2025-12-07 05:07:37'),
	(6033, 89456, 'btc', '2025-12-07 05:09:37'),
	(6034, 89471, 'btc', '2025-12-07 05:11:37'),
	(6035, 89479, 'btc', '2025-12-07 05:13:38'),
	(6036, 89470, 'btc', '2025-12-07 05:15:38'),
	(6037, 89496, 'btc', '2025-12-07 05:17:38'),
	(6038, 89447, 'btc', '2025-12-07 05:19:39'),
	(6039, 89444, 'btc', '2025-12-07 05:21:39'),
	(6040, 89449, 'btc', '2025-12-07 05:23:39'),
	(6041, 89477, 'btc', '2025-12-07 05:25:39'),
	(6042, 89478, 'btc', '2025-12-07 05:27:40'),
	(6043, 89475, 'btc', '2025-12-07 05:29:40'),
	(6044, 89477, 'btc', '2025-12-07 05:31:40'),
	(6045, 89480, 'btc', '2025-12-07 05:33:41'),
	(6046, 89507, 'btc', '2025-12-07 05:35:41'),
	(6047, 89508, 'btc', '2025-12-07 05:37:41'),
	(6048, 89501, 'btc', '2025-12-07 05:39:42'),
	(6049, 89531, 'btc', '2025-12-07 05:41:42'),
	(6050, 89525, 'btc', '2025-12-07 05:43:42'),
	(6051, 89506, 'btc', '2025-12-07 05:45:42'),
	(6052, 89506, 'btc', '2025-12-07 05:47:43'),
	(6053, 89478, 'btc', '2025-12-07 05:49:43'),
	(6054, 89489, 'btc', '2025-12-07 05:51:43'),
	(6055, 89474, 'btc', '2025-12-07 05:53:44'),
	(6056, 89534, 'btc', '2025-12-07 05:55:44'),
	(6057, 89539, 'btc', '2025-12-07 05:57:44'),
	(6058, 89515, 'btc', '2025-12-07 05:59:45'),
	(6059, 89507, 'btc', '2025-12-07 06:01:45'),
	(6060, 89540, 'btc', '2025-12-07 06:03:45'),
	(6061, 89570, 'btc', '2025-12-07 06:05:45'),
	(6062, 89569, 'btc', '2025-12-07 06:07:46'),
	(6063, 89561, 'btc', '2025-12-07 06:09:46'),
	(6064, 89626, 'btc', '2025-12-07 06:11:46'),
	(6065, 89564, 'btc', '2025-12-07 06:13:47'),
	(6066, 89581, 'btc', '2025-12-07 06:15:47'),
	(6067, 89578, 'btc', '2025-12-07 06:17:47'),
	(6068, 89606, 'btc', '2025-12-07 06:19:47'),
	(6069, 89646, 'btc', '2025-12-07 06:21:48'),
	(6070, 89672, 'btc', '2025-12-07 06:23:48'),
	(6071, 89686, 'btc', '2025-12-07 06:25:48'),
	(6072, 89666, 'btc', '2025-12-07 06:27:49'),
	(6073, 89659, 'btc', '2025-12-07 06:29:49'),
	(6074, 89661, 'btc', '2025-12-07 06:31:49'),
	(6075, 89683, 'btc', '2025-12-07 06:33:50'),
	(6076, 89688, 'btc', '2025-12-07 06:35:50'),
	(6077, 89667, 'btc', '2025-12-07 06:37:50'),
	(6078, 89663, 'btc', '2025-12-07 06:39:51'),
	(6079, 89656, 'btc', '2025-12-07 06:41:51'),
	(6080, 89673, 'btc', '2025-12-07 06:43:51'),
	(6081, 89662, 'btc', '2025-12-07 06:45:51'),
	(6082, 89652, 'btc', '2025-12-07 06:47:52'),
	(6083, 89642, 'btc', '2025-12-07 06:49:52'),
	(6084, 89624, 'btc', '2025-12-07 06:51:52'),
	(6085, 89600, 'btc', '2025-12-07 06:53:53'),
	(6086, 89649, 'btc', '2025-12-07 06:55:53'),
	(6087, 89673, 'btc', '2025-12-07 06:57:53'),
	(6088, 89710, 'btc', '2025-12-07 06:59:53'),
	(6089, 89678, 'btc', '2025-12-07 07:01:54'),
	(6090, 89659, 'btc', '2025-12-07 07:03:54'),
	(6091, 89591, 'btc', '2025-12-07 07:05:54'),
	(6092, 89550, 'btc', '2025-12-07 07:07:55'),
	(6093, 89567, 'btc', '2025-12-07 07:09:55'),
	(6094, 89430, 'btc', '2025-12-07 07:11:55'),
	(6095, 89469, 'btc', '2025-12-07 07:13:56'),
	(6096, 89449, 'btc', '2025-12-07 07:15:56'),
	(6097, 89431, 'btc', '2025-12-07 07:17:56'),
	(6098, 89392, 'btc', '2025-12-07 07:19:56'),
	(6099, 89408, 'btc', '2025-12-07 07:21:57'),
	(6100, 89432, 'btc', '2025-12-07 07:23:57'),
	(6101, 89352, 'btc', '2025-12-07 07:25:57'),
	(6102, 89353, 'btc', '2025-12-07 07:27:58'),
	(6103, 89402, 'btc', '2025-12-07 07:29:58'),
	(6104, 89366, 'btc', '2025-12-07 07:31:58'),
	(6105, 89270, 'btc', '2025-12-07 07:33:59'),
	(6106, 89300, 'btc', '2025-12-07 07:35:59'),
	(6107, 89254, 'btc', '2025-12-07 07:37:59'),
	(6108, 89282, 'btc', '2025-12-07 07:40:00'),
	(6109, 89251, 'btc', '2025-12-07 07:42:00'),
	(6110, 89296, 'btc', '2025-12-07 07:44:00'),
	(6111, 89226, 'btc', '2025-12-07 07:46:00'),
	(6112, 89300, 'btc', '2025-12-07 07:48:01'),
	(6113, 89356, 'btc', '2025-12-07 07:50:01'),
	(6114, 89380, 'btc', '2025-12-07 07:52:01'),
	(6115, 89342, 'btc', '2025-12-07 07:54:02'),
	(6116, 89358, 'btc', '2025-12-07 07:56:02'),
	(6117, 89354, 'btc', '2025-12-07 07:58:02'),
	(6118, 89376, 'btc', '2025-12-07 08:00:02'),
	(6119, 89335, 'btc', '2025-12-07 08:02:03'),
	(6120, 89345, 'btc', '2025-12-07 08:04:03'),
	(6121, 89308, 'btc', '2025-12-07 08:06:03'),
	(6122, 89287, 'btc', '2025-12-07 08:08:04'),
	(6123, 89298, 'btc', '2025-12-07 08:10:04'),
	(6124, 89297, 'btc', '2025-12-07 08:12:04'),
	(6125, 89209, 'btc', '2025-12-07 08:14:05'),
	(6126, 89191, 'btc', '2025-12-07 08:16:05'),
	(6127, 89267, 'btc', '2025-12-07 08:18:05'),
	(6128, 89263, 'btc', '2025-12-07 08:20:06'),
	(6129, 89272, 'btc', '2025-12-07 08:22:06'),
	(6130, 89307, 'btc', '2025-12-07 08:24:06'),
	(6131, 89343, 'btc', '2025-12-07 08:26:07'),
	(6132, 89333, 'btc', '2025-12-07 08:28:07'),
	(6133, 89357, 'btc', '2025-12-07 08:30:07'),
	(6134, 89343, 'btc', '2025-12-07 08:32:08'),
	(6135, 89358, 'btc', '2025-12-07 08:34:08'),
	(6136, 89378, 'btc', '2025-12-07 08:36:08'),
	(6137, 89436, 'btc', '2025-12-07 08:38:08'),
	(6138, 89468, 'btc', '2025-12-07 08:40:09'),
	(6139, 89506, 'btc', '2025-12-07 08:42:09'),
	(6140, 89491, 'btc', '2025-12-07 08:44:09'),
	(6141, 89450, 'btc', '2025-12-07 08:46:10'),
	(6142, 89453, 'btc', '2025-12-07 08:48:10'),
	(6143, 89461, 'btc', '2025-12-07 08:50:10'),
	(6144, 89459, 'btc', '2025-12-07 08:52:10'),
	(6145, 89431, 'btc', '2025-12-07 08:54:11'),
	(6146, 89321, 'btc', '2025-12-07 08:56:11'),
	(6147, 89310, 'btc', '2025-12-07 08:58:11'),
	(6148, 89317, 'btc', '2025-12-07 09:00:12'),
	(6149, 89327, 'btc', '2025-12-07 09:02:12'),
	(6150, 89384, 'btc', '2025-12-07 09:04:12'),
	(6151, 89340, 'btc', '2025-12-07 09:06:13'),
	(6152, 89355, 'btc', '2025-12-07 09:08:13'),
	(6153, 89358, 'btc', '2025-12-07 09:10:13'),
	(6154, 89361, 'btc', '2025-12-07 09:12:14'),
	(6155, 89364, 'btc', '2025-12-07 09:14:14'),
	(6156, 89387, 'btc', '2025-12-07 09:16:14'),
	(6157, 89369, 'btc', '2025-12-07 09:18:14'),
	(6158, 89324, 'btc', '2025-12-07 09:20:15'),
	(6159, 89216, 'btc', '2025-12-07 09:22:15'),
	(6160, 89200, 'btc', '2025-12-07 09:24:15'),
	(6161, 89165, 'btc', '2025-12-07 09:26:16'),
	(6162, 89189, 'btc', '2025-12-07 09:28:16'),
	(6163, 89191, 'btc', '2025-12-07 09:30:16'),
	(6164, 89219, 'btc', '2025-12-07 09:32:17'),
	(6165, 89254, 'btc', '2025-12-07 09:34:17'),
	(6166, 89229, 'btc', '2025-12-07 09:36:17'),
	(6167, 89249, 'btc', '2025-12-07 09:38:18'),
	(6168, 89218, 'btc', '2025-12-07 09:40:18'),
	(6169, 89181, 'btc', '2025-12-07 09:42:18'),
	(6170, 89198, 'btc', '2025-12-07 09:44:19'),
	(6171, 89185, 'btc', '2025-12-07 09:46:19'),
	(6172, 89120, 'btc', '2025-12-07 09:48:19'),
	(6173, 89103, 'btc', '2025-12-07 09:50:19'),
	(6174, 89092, 'btc', '2025-12-07 09:52:20'),
	(6175, 89073, 'btc', '2025-12-07 09:54:20'),
	(6176, 89098, 'btc', '2025-12-07 09:56:20'),
	(6177, 89140, 'btc', '2025-12-07 09:58:21'),
	(6178, 89124, 'btc', '2025-12-07 10:00:21'),
	(6179, 89190, 'btc', '2025-12-07 10:02:21'),
	(6180, 89141, 'btc', '2025-12-07 10:04:22'),
	(6181, 89107, 'btc', '2025-12-07 10:06:22'),
	(6182, 89147, 'btc', '2025-12-07 10:08:22'),
	(6183, 89179, 'btc', '2025-12-07 10:10:23'),
	(6184, 89238, 'btc', '2025-12-07 10:12:23'),
	(6185, 89277, 'btc', '2025-12-07 10:14:23'),
	(6186, 89217, 'btc', '2025-12-07 10:16:23'),
	(6187, 89250, 'btc', '2025-12-07 10:18:24'),
	(6188, 89224, 'btc', '2025-12-07 10:20:24'),
	(6189, 89263, 'btc', '2025-12-07 10:22:24'),
	(6190, 89254, 'btc', '2025-12-07 10:24:25'),
	(6191, 89232, 'btc', '2025-12-07 10:26:25'),
	(6192, 89212, 'btc', '2025-12-07 10:28:25'),
	(6193, 89205, 'btc', '2025-12-07 10:30:26'),
	(6194, 89140, 'btc', '2025-12-07 10:32:26'),
	(6195, 89137, 'btc', '2025-12-07 10:34:26'),
	(6196, 89110, 'btc', '2025-12-07 10:36:27'),
	(6197, 89147, 'btc', '2025-12-07 10:38:27'),
	(6198, 89218, 'btc', '2025-12-07 10:40:27'),
	(6199, 89324, 'btc', '2025-12-07 10:42:28'),
	(6200, 89289, 'btc', '2025-12-07 10:44:28'),
	(6201, 89311, 'btc', '2025-12-07 10:46:28'),
	(6202, 89356, 'btc', '2025-12-07 10:48:29'),
	(6203, 89343, 'btc', '2025-12-07 10:50:29'),
	(6204, 89329, 'btc', '2025-12-07 10:52:29'),
	(6205, 89315, 'btc', '2025-12-07 10:54:30'),
	(6206, 89244, 'btc', '2025-12-07 10:56:30'),
	(6207, 89258, 'btc', '2025-12-07 10:58:30'),
	(6208, 89221, 'btc', '2025-12-07 11:00:31'),
	(6209, 89200, 'btc', '2025-12-07 11:02:31'),
	(6210, 89214, 'btc', '2025-12-07 11:04:31'),
	(6211, 89238, 'btc', '2025-12-07 11:06:31'),
	(6212, 89243, 'btc', '2025-12-07 11:08:32'),
	(6213, 89239, 'btc', '2025-12-07 11:10:32'),
	(6214, 89214, 'btc', '2025-12-07 11:12:32'),
	(6215, 89212, 'btc', '2025-12-07 11:14:33'),
	(6216, 89239, 'btc', '2025-12-07 11:16:33'),
	(6217, 89245, 'btc', '2025-12-07 11:18:33'),
	(6218, 89243, 'btc', '2025-12-07 11:20:34'),
	(6219, 89242, 'btc', '2025-12-07 11:22:34'),
	(6220, 89245, 'btc', '2025-12-07 11:24:34'),
	(6221, 89227, 'btc', '2025-12-07 11:26:35'),
	(6222, 89200, 'btc', '2025-12-07 11:28:35'),
	(6223, 89192, 'btc', '2025-12-07 11:30:35'),
	(6224, 89219, 'btc', '2025-12-07 11:32:36'),
	(6225, 89251, 'btc', '2025-12-07 11:34:36'),
	(6226, 89255, 'btc', '2025-12-07 11:36:36'),
	(6227, 89222, 'btc', '2025-12-07 11:38:37'),
	(6228, 89235, 'btc', '2025-12-07 11:40:37'),
	(6229, 89229, 'btc', '2025-12-07 11:42:37'),
	(6230, 89210, 'btc', '2025-12-07 11:44:37'),
	(6231, 89185, 'btc', '2025-12-07 11:46:38'),
	(6232, 89172, 'btc', '2025-12-07 11:48:38'),
	(6233, 89166, 'btc', '2025-12-07 11:50:38'),
	(6234, 89154, 'btc', '2025-12-07 11:52:39'),
	(6235, 89166, 'btc', '2025-12-07 11:54:39'),
	(6236, 89163, 'btc', '2025-12-07 11:56:39'),
	(6237, 89182, 'btc', '2025-12-07 11:58:40'),
	(6238, 89149, 'btc', '2025-12-07 12:00:40'),
	(6239, 89144, 'btc', '2025-12-07 12:02:40'),
	(6240, 89153, 'btc', '2025-12-07 12:04:41'),
	(6241, 89189, 'btc', '2025-12-07 12:06:41'),
	(6242, 89233, 'btc', '2025-12-07 12:08:41'),
	(6243, 89229, 'btc', '2025-12-07 12:10:41'),
	(6244, 89271, 'btc', '2025-12-07 12:12:42'),
	(6245, 89285, 'btc', '2025-12-07 12:14:42'),
	(6246, 89333, 'btc', '2025-12-07 12:16:42'),
	(6247, 89270, 'btc', '2025-12-07 12:18:43'),
	(6248, 89255, 'btc', '2025-12-07 12:20:43'),
	(6249, 89252, 'btc', '2025-12-07 12:22:43'),
	(6250, 89222, 'btc', '2025-12-07 12:24:44'),
	(6251, 89258, 'btc', '2025-12-07 12:26:44'),
	(6252, 89230, 'btc', '2025-12-07 12:28:44'),
	(6253, 89296, 'btc', '2025-12-07 12:30:45'),
	(6254, 89284, 'btc', '2025-12-07 12:32:45'),
	(6255, 89274, 'btc', '2025-12-07 12:34:45'),
	(6256, 89274, 'btc', '2025-12-07 12:36:46'),
	(6257, 89281, 'btc', '2025-12-07 12:38:46'),
	(6258, 89281, 'btc', '2025-12-07 12:40:46'),
	(6259, 89287, 'btc', '2025-12-07 12:42:46'),
	(6260, 89315, 'btc', '2025-12-07 12:44:47'),
	(6261, 89465, 'btc', '2025-12-07 12:46:47'),
	(6262, 89572, 'btc', '2025-12-07 12:48:47'),
	(6263, 89506, 'btc', '2025-12-07 12:50:48'),
	(6264, 89463, 'btc', '2025-12-07 12:52:48'),
	(6265, 89465, 'btc', '2025-12-07 12:54:48'),
	(6266, 89460, 'btc', '2025-12-07 12:56:11'),
	(6267, 89449, 'btc', '2025-12-07 12:58:11'),
	(6268, 89476, 'btc', '2025-12-07 13:00:11'),
	(6269, 89494, 'btc', '2025-12-07 13:02:12'),
	(6270, 89470, 'btc', '2025-12-07 13:04:12'),
	(6271, 89424, 'btc', '2025-12-07 13:06:12'),
	(6272, 89426, 'btc', '2025-12-07 13:08:13'),
	(6273, 89450, 'btc', '2025-12-07 13:10:13'),
	(6274, 89313, 'btc', '2025-12-07 13:12:13'),
	(6275, 89352, 'btc', '2025-12-07 13:14:13'),
	(6276, 89338, 'btc', '2025-12-07 13:16:14'),
	(6277, 89341, 'btc', '2025-12-07 13:18:14'),
	(6278, 89346, 'btc', '2025-12-07 13:20:14'),
	(6279, 89036, 'btc', '2025-12-07 13:22:15'),
	(6280, 88950, 'btc', '2025-12-07 13:24:15'),
	(6281, 88979, 'btc', '2025-12-07 13:26:15'),
	(6282, 88985, 'btc', '2025-12-07 13:28:16'),
	(6283, 88974, 'btc', '2025-12-07 13:30:16'),
	(6284, 89005, 'btc', '2025-12-07 13:32:16'),
	(6285, 89018, 'btc', '2025-12-07 13:33:21'),
	(6286, 89011, 'btc', '2025-12-07 13:35:21'),
	(6287, 88975, 'btc', '2025-12-07 13:37:21'),
	(6288, 88923, 'btc', '2025-12-07 13:39:21'),
	(6289, 88984, 'btc', '2025-12-07 13:41:22'),
	(6290, 88950, 'btc', '2025-12-07 13:43:22'),
	(6291, 88978, 'btc', '2025-12-07 13:45:22'),
	(6292, 89003, 'btc', '2025-12-07 13:47:23'),
	(6293, 88935, 'btc', '2025-12-07 13:49:23'),
	(6294, 89031, 'btc', '2025-12-07 13:51:23'),
	(6295, 89034, 'btc', '2025-12-07 13:53:24'),
	(6296, 89053, 'btc', '2025-12-07 13:55:24'),
	(6297, 89085, 'btc', '2025-12-07 13:57:24'),
	(6298, 89025, 'btc', '2025-12-07 13:59:24'),
	(6299, 89080, 'btc', '2025-12-07 14:01:25'),
	(6300, 89058, 'btc', '2025-12-07 14:03:25'),
	(6301, 88998, 'btc', '2025-12-07 14:05:25'),
	(6302, 88977, 'btc', '2025-12-07 14:07:26'),
	(6303, 88981, 'btc', '2025-12-07 14:09:26'),
	(6304, 88951, 'btc', '2025-12-07 14:11:26'),
	(6305, 88890, 'btc', '2025-12-07 14:13:27'),
	(6306, 88854, 'btc', '2025-12-07 14:15:27'),
	(6307, 88827, 'btc', '2025-12-07 14:17:27'),
	(6308, 88773, 'btc', '2025-12-07 14:19:27'),
	(6309, 88745, 'btc', '2025-12-07 14:21:28'),
	(6310, 88592, 'btc', '2025-12-07 14:23:28'),
	(6311, 88115, 'btc', '2025-12-07 14:25:28'),
	(6312, 88202, 'btc', '2025-12-07 14:27:29'),
	(6313, 88050, 'btc', '2025-12-07 14:29:29'),
	(6314, 87981, 'btc', '2025-12-07 14:31:29'),
	(6315, 87785, 'btc', '2025-12-07 14:33:30'),
	(6316, 88034, 'btc', '2025-12-07 14:35:30'),
	(6317, 88200, 'btc', '2025-12-07 14:37:30'),
	(6318, 88314, 'btc', '2025-12-07 14:39:31'),
	(6319, 88288, 'btc', '2025-12-07 14:41:31'),
	(6320, 88139, 'btc', '2025-12-07 14:43:31'),
	(6321, 88271, 'btc', '2025-12-07 14:45:31'),
	(6322, 88198, 'btc', '2025-12-07 14:47:32'),
	(6323, 88291, 'btc', '2025-12-07 14:49:32'),
	(6324, 88220, 'btc', '2025-12-07 14:51:32'),
	(6325, 88173, 'btc', '2025-12-07 14:53:33'),
	(6326, 88160, 'btc', '2025-12-07 14:55:33'),
	(6327, 88161, 'btc', '2025-12-07 14:57:33'),
	(6328, 88278, 'btc', '2025-12-07 14:59:34'),
	(6329, 88298, 'btc', '2025-12-07 15:01:34'),
	(6330, 88222, 'btc', '2025-12-07 15:03:34'),
	(6331, 88218, 'btc', '2025-12-07 15:05:34'),
	(6332, 88667, 'btc', '2025-12-07 15:07:35'),
	(6333, 88730, 'btc', '2025-12-07 15:09:35'),
	(6334, 88777, 'btc', '2025-12-07 15:11:35'),
	(6335, 88832, 'btc', '2025-12-07 15:13:36'),
	(6336, 88924, 'btc', '2025-12-07 15:15:36'),
	(6337, 88702, 'btc', '2025-12-07 15:17:36'),
	(6338, 88707, 'btc', '2025-12-07 15:19:37'),
	(6339, 88744, 'btc', '2025-12-07 15:21:37'),
	(6340, 88822, 'btc', '2025-12-07 15:23:37'),
	(6341, 88776, 'btc', '2025-12-07 15:25:37'),
	(6342, 88803, 'btc', '2025-12-07 15:27:38'),
	(6343, 88735, 'btc', '2025-12-07 15:29:38'),
	(6344, 88801, 'btc', '2025-12-07 15:31:38'),
	(6345, 88807, 'btc', '2025-12-07 15:33:39'),
	(6346, 89030, 'btc', '2025-12-07 15:35:39'),
	(6347, 89034, 'btc', '2025-12-07 15:36:06'),
	(6348, 89059, 'btc', '2025-12-07 15:38:06'),
	(6349, 88885, 'btc', '2025-12-07 15:40:06'),
	(6350, 88928, 'btc', '2025-12-07 15:42:07'),
	(6351, 88904, 'btc', '2025-12-07 15:44:07'),
	(6352, 88962, 'btc', '2025-12-07 15:46:07'),
	(6353, 88973, 'btc', '2025-12-07 15:48:08'),
	(6354, 89005, 'btc', '2025-12-07 15:50:08'),
	(6355, 89018, 'btc', '2025-12-07 15:52:08'),
	(6356, 89240, 'btc', '2025-12-07 15:54:09'),
	(6357, 89532, 'btc', '2025-12-07 15:56:09'),
	(6358, 89588, 'btc', '2025-12-07 15:58:09'),
	(6359, 89493, 'btc', '2025-12-07 16:00:10'),
	(6360, 89446, 'btc', '2025-12-07 16:02:10'),
	(6361, 89431, 'btc', '2025-12-07 16:04:10'),
	(6362, 89457, 'btc', '2025-12-07 16:06:10'),
	(6363, 89398, 'btc', '2025-12-07 16:08:11'),
	(6364, 89230, 'btc', '2025-12-07 16:10:11'),
	(6365, 89199, 'btc', '2025-12-07 16:12:11'),
	(6366, 89201, 'btc', '2025-12-07 16:14:12'),
	(6367, 89156, 'btc', '2025-12-07 16:16:12'),
	(6368, 89382, 'btc', '2025-12-07 16:18:12'),
	(6369, 89359, 'btc', '2025-12-07 16:20:12'),
	(6370, 89343, 'btc', '2025-12-07 16:22:13'),
	(6371, 89292, 'btc', '2025-12-07 16:24:13'),
	(6372, 89264, 'btc', '2025-12-07 16:26:13'),
	(6373, 89332, 'btc', '2025-12-07 16:28:14'),
	(6374, 89338, 'btc', '2025-12-07 16:30:14'),
	(6375, 89256, 'btc', '2025-12-07 16:32:14'),
	(6376, 89374, 'btc', '2025-12-07 16:34:15'),
	(6377, 89500, 'btc', '2025-12-07 16:36:15'),
	(6378, 89496, 'btc', '2025-12-07 16:38:15'),
	(6379, 89481, 'btc', '2025-12-07 16:40:16'),
	(6380, 89442, 'btc', '2025-12-07 16:42:16'),
	(6381, 89494, 'btc', '2025-12-07 16:44:16'),
	(6382, 89457, 'btc', '2025-12-07 16:46:16'),
	(6383, 89404, 'btc', '2025-12-07 16:48:17'),
	(6384, 89409, 'btc', '2025-12-07 16:50:17'),
	(6385, 89463, 'btc', '2025-12-07 16:52:17'),
	(6386, 89432, 'btc', '2025-12-07 16:54:18'),
	(6387, 89510, 'btc', '2025-12-07 16:56:18'),
	(6388, 89587, 'btc', '2025-12-07 16:58:18'),
	(6389, 89775, 'btc', '2025-12-07 17:00:19'),
	(6390, 89754, 'btc', '2025-12-07 17:02:19'),
	(6391, 89805, 'btc', '2025-12-07 17:04:19'),
	(6392, 89678, 'btc', '2025-12-07 17:06:20'),
	(6393, 89730, 'btc', '2025-12-07 17:08:20'),
	(6394, 89635, 'btc', '2025-12-07 17:10:20'),
	(6395, 89812, 'btc', '2025-12-07 17:12:20'),
	(6396, 89849, 'btc', '2025-12-07 17:14:21'),
	(6397, 90044, 'btc', '2025-12-07 17:16:21'),
	(6398, 90176, 'btc', '2025-12-07 17:18:21'),
	(6399, 90263, 'btc', '2025-12-07 17:20:22'),
	(6400, 90380, 'btc', '2025-12-07 17:22:22'),
	(6401, 90611, 'btc', '2025-12-07 17:24:22'),
	(6402, 90589, 'btc', '2025-12-07 17:26:22'),
	(6403, 90652, 'btc', '2025-12-07 17:28:23'),
	(6404, 90835, 'btc', '2025-12-07 17:30:23'),
	(6405, 90855, 'btc', '2025-12-07 17:32:23'),
	(6406, 90900, 'btc', '2025-12-07 17:34:24'),
	(6407, 91044, 'btc', '2025-12-07 17:36:24'),
	(6408, 90888, 'btc', '2025-12-07 17:38:24'),
	(6409, 90782, 'btc', '2025-12-07 17:40:25'),
	(6410, 90905, 'btc', '2025-12-07 17:42:25'),
	(6411, 90890, 'btc', '2025-12-07 17:44:25'),
	(6412, 90753, 'btc', '2025-12-07 17:46:26'),
	(6413, 91038, 'btc', '2025-12-07 17:48:26'),
	(6414, 91118, 'btc', '2025-12-07 17:50:26'),
	(6415, 91036, 'btc', '2025-12-07 17:52:27'),
	(6416, 90860, 'btc', '2025-12-07 17:54:27'),
	(6417, 90877, 'btc', '2025-12-07 17:56:27'),
	(6418, 90995, 'btc', '2025-12-07 17:58:28'),
	(6419, 91036, 'btc', '2025-12-07 18:00:28'),
	(6420, 91145, 'btc', '2025-12-07 18:02:28'),
	(6421, 91292, 'btc', '2025-12-07 18:04:28'),
	(6422, 91360, 'btc', '2025-12-07 18:06:29'),
	(6423, 91312, 'btc', '2025-12-07 18:08:29'),
	(6424, 91370, 'btc', '2025-12-07 18:10:29'),
	(6425, 91316, 'btc', '2025-12-07 18:12:30'),
	(6426, 91317, 'btc', '2025-12-07 18:14:30'),
	(6427, 91358, 'btc', '2025-12-07 18:16:30'),
	(6428, 91671, 'btc', '2025-12-07 18:18:31'),
	(6429, 91400, 'btc', '2025-12-07 18:20:31'),
	(6430, 91420, 'btc', '2025-12-07 18:22:31'),
	(6431, 91490, 'btc', '2025-12-07 18:24:32'),
	(6432, 91634, 'btc', '2025-12-07 18:26:32'),
	(6433, 91613, 'btc', '2025-12-07 18:28:32'),
	(6434, 91638, 'btc', '2025-12-07 18:30:33'),
	(6435, 91679, 'btc', '2025-12-07 18:32:33'),
	(6436, 91680, 'btc', '2025-12-07 18:34:33'),
	(6437, 91651, 'btc', '2025-12-07 18:36:34'),
	(6438, 91611, 'btc', '2025-12-07 18:38:34'),
	(6439, 91461, 'btc', '2025-12-07 18:40:34'),
	(6440, 91443, 'btc', '2025-12-07 18:41:00'),
	(6441, 91421, 'btc', '2025-12-07 18:43:00'),
	(6442, 91389, 'btc', '2025-12-07 18:45:01'),
	(6443, 91452, 'btc', '2025-12-07 18:47:01'),
	(6444, 91466, 'btc', '2025-12-07 18:49:01'),
	(6445, 91448, 'btc', '2025-12-07 18:51:02'),
	(6446, 91454, 'btc', '2025-12-07 18:53:02'),
	(6447, 91399, 'btc', '2025-12-07 18:55:03'),
	(6448, 91269, 'btc', '2025-12-07 18:57:03'),
	(6449, 91383, 'btc', '2025-12-07 18:59:03'),
	(6450, 91448, 'btc', '2025-12-07 19:01:04'),
	(6451, 91376, 'btc', '2025-12-07 19:03:04'),
	(6452, 91367, 'btc', '2025-12-07 19:05:04'),
	(6453, 91293, 'btc', '2025-12-07 19:07:04'),
	(6454, 91351, 'btc', '2025-12-07 19:09:05'),
	(6455, 91456, 'btc', '2025-12-07 19:11:05'),
	(6456, 91489, 'btc', '2025-12-07 19:13:05'),
	(6457, 91504, 'btc', '2025-12-07 19:15:06'),
	(6458, 91421, 'btc', '2025-12-07 19:17:06'),
	(6459, 91450, 'btc', '2025-12-07 19:19:06'),
	(6460, 91403, 'btc', '2025-12-07 19:21:07'),
	(6461, 91360, 'btc', '2025-12-07 19:23:07'),
	(6462, 91308, 'btc', '2025-12-07 19:25:07'),
	(6463, 91297, 'btc', '2025-12-07 19:25:59'),
	(6464, 91278, 'btc', '2025-12-07 19:27:59'),
	(6465, 91267, 'btc', '2025-12-07 19:30:00'),
	(6466, 91385, 'btc', '2025-12-07 19:32:00'),
	(6467, 91348, 'btc', '2025-12-07 19:34:00'),
	(6468, 91340, 'btc', '2025-12-07 19:36:00'),
	(6469, 91260, 'btc', '2025-12-07 19:38:01'),
	(6470, 91267, 'btc', '2025-12-07 19:40:01'),
	(6471, 91278, 'btc', '2025-12-07 19:42:01'),
	(6472, 91345, 'btc', '2025-12-07 19:44:11'),
	(6473, 91392, 'btc', '2025-12-07 19:46:11'),
	(6474, 91413, 'btc', '2025-12-07 19:48:11'),
	(6475, 91395, 'btc', '2025-12-07 19:50:12'),
	(6476, 91335, 'btc', '2025-12-07 19:52:12'),
	(6477, 91340, 'btc', '2025-12-07 19:54:12'),
	(6478, 91316, 'btc', '2025-12-07 19:56:13'),
	(6479, 91329, 'btc', '2025-12-07 19:58:13'),
	(6480, 91452, 'btc', '2025-12-07 20:00:13'),
	(6481, 91422, 'btc', '2025-12-07 20:02:14'),
	(6482, 91388, 'btc', '2025-12-07 20:04:14'),
	(6483, 91322, 'btc', '2025-12-07 20:06:14'),
	(6484, 91348, 'btc', '2025-12-07 20:08:15'),
	(6485, 91348, 'btc', '2025-12-07 20:10:15'),
	(6486, 91344, 'btc', '2025-12-07 20:12:15'),
	(6487, 91366, 'btc', '2025-12-07 20:14:15'),
	(6488, 91367, 'btc', '2025-12-07 20:16:16'),
	(6489, 91368, 'btc', '2025-12-07 20:18:16'),
	(6490, 91355, 'btc', '2025-12-07 20:20:16'),
	(6491, 91380, 'btc', '2025-12-07 20:22:17'),
	(6492, 91481, 'btc', '2025-12-07 20:24:17'),
	(6493, 91435, 'btc', '2025-12-07 20:26:17'),
	(6494, 91459, 'btc', '2025-12-07 20:28:18'),
	(6495, 91397, 'btc', '2025-12-07 20:30:18'),
	(6496, 91372, 'btc', '2025-12-07 20:32:18'),
	(6497, 91354, 'btc', '2025-12-07 20:34:18'),
	(6498, 91373, 'btc', '2025-12-07 20:36:19'),
	(6499, 91377, 'btc', '2025-12-07 20:38:19'),
	(6500, 91412, 'btc', '2025-12-07 20:40:19'),
	(6501, 91446, 'btc', '2025-12-07 20:42:20'),
	(6502, 91486, 'btc', '2025-12-07 20:44:20'),
	(6503, 91445, 'btc', '2025-12-07 20:46:20'),
	(6504, 91469, 'btc', '2025-12-07 20:48:21'),
	(6505, 91423, 'btc', '2025-12-07 20:50:21'),
	(6506, 91433, 'btc', '2025-12-07 20:52:21'),
	(6507, 91412, 'btc', '2025-12-07 20:54:22'),
	(6508, 91432, 'btc', '2025-12-07 20:56:22'),
	(6509, 91438, 'btc', '2025-12-07 20:58:22'),
	(6510, 91409, 'btc', '2025-12-07 21:00:23'),
	(6511, 91333, 'btc', '2025-12-07 21:02:23'),
	(6512, 91346, 'btc', '2025-12-07 21:04:23'),
	(6513, 91323, 'btc', '2025-12-07 21:06:24'),
	(6514, 91286, 'btc', '2025-12-07 21:08:24'),
	(6515, 91335, 'btc', '2025-12-07 21:10:24'),
	(6516, 91276, 'btc', '2025-12-07 21:12:25'),
	(6517, 91275, 'btc', '2025-12-07 21:14:25'),
	(6518, 91268, 'btc', '2025-12-07 21:16:25'),
	(6519, 91250, 'btc', '2025-12-07 21:18:26'),
	(6520, 91204, 'btc', '2025-12-07 21:20:26'),
	(6521, 91103, 'btc', '2025-12-07 21:22:26'),
	(6522, 90988, 'btc', '2025-12-07 21:24:26'),
	(6523, 90973, 'btc', '2025-12-07 21:26:27'),
	(6524, 90858, 'btc', '2025-12-07 21:28:27'),
	(6525, 90857, 'btc', '2025-12-07 21:30:27'),
	(6526, 90919, 'btc', '2025-12-07 21:32:28'),
	(6527, 91010, 'btc', '2025-12-07 21:34:28'),
	(6528, 90931, 'btc', '2025-12-07 21:36:28'),
	(6529, 90783, 'btc', '2025-12-07 21:38:29'),
	(6530, 90700, 'btc', '2025-12-07 21:40:29'),
	(6531, 90500, 'btc', '2025-12-07 21:42:29'),
	(6532, 90553, 'btc', '2025-12-07 21:44:30'),
	(6533, 90426, 'btc', '2025-12-07 21:46:30'),
	(6534, 90248, 'btc', '2025-12-07 21:48:30'),
	(6535, 90263, 'btc', '2025-12-07 21:50:31'),
	(6536, 90107, 'btc', '2025-12-07 21:52:31'),
	(6537, 89970, 'btc', '2025-12-07 21:54:31'),
	(6538, 89987, 'btc', '2025-12-07 21:56:31'),
	(6539, 90065, 'btc', '2025-12-07 21:58:32'),
	(6540, 90186, 'btc', '2025-12-07 22:00:32'),
	(6541, 90022, 'btc', '2025-12-07 22:02:32'),
	(6542, 89942, 'btc', '2025-12-07 22:04:33'),
	(6543, 89424, 'btc', '2025-12-07 22:06:33'),
	(6544, 89358, 'btc', '2025-12-07 22:08:33'),
	(6545, 89403, 'btc', '2025-12-07 22:10:34'),
	(6546, 89512, 'btc', '2025-12-07 22:12:34'),
	(6547, 89405, 'btc', '2025-12-07 22:14:34'),
	(6548, 89270, 'btc', '2025-12-07 22:16:35'),
	(6549, 89405, 'btc', '2025-12-07 22:18:35'),
	(6550, 89258, 'btc', '2025-12-07 22:20:35'),
	(6551, 89423, 'btc', '2025-12-07 22:22:36'),
	(6552, 89406, 'btc', '2025-12-07 22:24:36'),
	(6553, 89698, 'btc', '2025-12-07 22:26:36'),
	(6554, 89581, 'btc', '2025-12-07 22:28:37'),
	(6555, 89697, 'btc', '2025-12-07 22:30:37'),
	(6556, 89683, 'btc', '2025-12-07 22:32:37'),
	(6557, 90106, 'btc', '2025-12-07 22:34:37'),
	(6558, 89923, 'btc', '2025-12-07 22:36:38'),
	(6559, 89931, 'btc', '2025-12-07 22:38:38'),
	(6560, 89987, 'btc', '2025-12-07 22:40:38'),
	(6561, 89975, 'btc', '2025-12-07 22:42:39'),
	(6562, 90000, 'btc', '2025-12-07 22:44:39'),
	(6563, 90029, 'btc', '2025-12-07 22:46:39'),
	(6564, 90028, 'btc', '2025-12-07 22:48:40'),
	(6565, 89984, 'btc', '2025-12-07 22:50:40'),
	(6566, 89988, 'btc', '2025-12-07 22:52:40'),
	(6567, 89680, 'btc', '2025-12-07 22:54:41'),
	(6568, 89598, 'btc', '2025-12-07 22:56:41'),
	(6569, 89602, 'btc', '2025-12-07 22:58:41'),
	(6570, 89596, 'btc', '2025-12-07 23:00:42'),
	(6571, 89707, 'btc', '2025-12-07 23:02:42'),
	(6572, 89724, 'btc', '2025-12-07 23:04:42'),
	(6573, 89579, 'btc', '2025-12-07 23:06:43'),
	(6574, 89604, 'btc', '2025-12-07 23:08:43'),
	(6575, 89654, 'btc', '2025-12-07 23:10:43'),
	(6576, 89688, 'btc', '2025-12-07 23:12:43'),
	(6577, 89742, 'btc', '2025-12-07 23:14:44'),
	(6578, 89856, 'btc', '2025-12-07 23:16:44'),
	(6579, 89765, 'btc', '2025-12-07 23:18:44'),
	(6580, 89830, 'btc', '2025-12-07 23:20:45'),
	(6581, 89931, 'btc', '2025-12-07 23:22:45'),
	(6582, 90008, 'btc', '2025-12-07 23:24:45'),
	(6583, 89975, 'btc', '2025-12-07 23:26:46'),
	(6584, 90043, 'btc', '2025-12-07 23:28:46'),
	(6585, 89971, 'btc', '2025-12-07 23:30:46'),
	(6586, 90040, 'btc', '2025-12-07 23:32:47'),
	(6587, 90012, 'btc', '2025-12-07 23:34:47'),
	(6588, 90032, 'btc', '2025-12-07 23:36:47'),
	(6589, 89963, 'btc', '2025-12-07 23:38:47'),
	(6590, 89873, 'btc', '2025-12-07 23:40:48'),
	(6591, 89879, 'btc', '2025-12-07 23:42:48'),
	(6592, 89928, 'btc', '2025-12-07 23:44:48'),
	(6593, 89969, 'btc', '2025-12-07 23:46:49'),
	(6594, 90090, 'btc', '2025-12-07 23:48:49'),
	(6595, 90141, 'btc', '2025-12-07 23:50:49'),
	(6596, 90131, 'btc', '2025-12-07 23:52:50'),
	(6597, 90162, 'btc', '2025-12-07 23:54:50'),
	(6598, 90305, 'btc', '2025-12-07 23:56:50'),
	(6599, 90376, 'btc', '2025-12-07 23:58:50'),
	(6600, 90271, 'btc', '2025-12-08 00:00:51'),
	(6601, 90290, 'btc', '2025-12-08 00:02:51'),
	(6602, 90372, 'btc', '2025-12-08 00:04:51'),
	(6603, 90188, 'btc', '2025-12-08 00:06:52'),
	(6604, 90186, 'btc', '2025-12-08 00:08:52'),
	(6605, 90132, 'btc', '2025-12-08 00:10:52'),
	(6606, 90145, 'btc', '2025-12-08 00:12:53'),
	(6607, 90085, 'btc', '2025-12-08 00:14:53'),
	(6608, 90055, 'btc', '2025-12-08 00:16:53'),
	(6609, 90060, 'btc', '2025-12-08 00:18:54'),
	(6610, 90030, 'btc', '2025-12-08 00:20:54'),
	(6611, 90098, 'btc', '2025-12-08 00:22:54'),
	(6612, 90220, 'btc', '2025-12-08 00:24:55'),
	(6613, 90248, 'btc', '2025-12-08 00:26:55'),
	(6614, 90213, 'btc', '2025-12-08 00:28:55'),
	(6615, 90224, 'btc', '2025-12-08 00:30:55'),
	(6616, 90360, 'btc', '2025-12-08 00:32:56'),
	(6617, 90436, 'btc', '2025-12-08 00:34:56'),
	(6618, 90441, 'btc', '2025-12-08 00:36:56'),
	(6619, 90471, 'btc', '2025-12-08 00:38:57'),
	(6620, 90463, 'btc', '2025-12-08 00:40:57'),
	(6621, 90418, 'btc', '2025-12-08 00:42:57'),
	(6622, 90318, 'btc', '2025-12-08 00:44:58'),
	(6623, 90314, 'btc', '2025-12-08 00:46:58'),
	(6624, 90357, 'btc', '2025-12-08 00:48:58'),
	(6625, 90380, 'btc', '2025-12-08 00:50:58'),
	(6626, 90336, 'btc', '2025-12-08 00:52:59'),
	(6627, 90400, 'btc', '2025-12-08 00:54:59'),
	(6628, 90436, 'btc', '2025-12-08 00:56:59'),
	(6629, 90384, 'btc', '2025-12-08 00:59:00'),
	(6630, 90351, 'btc', '2025-12-08 01:01:00'),
	(6631, 90411, 'btc', '2025-12-08 01:03:00'),
	(6632, 90376, 'btc', '2025-12-08 01:05:01'),
	(6633, 90538, 'btc', '2025-12-08 01:07:01'),
	(6634, 90567, 'btc', '2025-12-08 01:09:01'),
	(6635, 90681, 'btc', '2025-12-08 01:11:01'),
	(6636, 90750, 'btc', '2025-12-08 01:13:02'),
	(6637, 90681, 'btc', '2025-12-08 01:15:02'),
	(6638, 90616, 'btc', '2025-12-08 01:17:02'),
	(6639, 90760, 'btc', '2025-12-08 01:19:03'),
	(6640, 90727, 'btc', '2025-12-08 01:21:03'),
	(6641, 90769, 'btc', '2025-12-08 01:23:03'),
	(6642, 90800, 'btc', '2025-12-08 01:25:03'),
	(6643, 91012, 'btc', '2025-12-08 01:27:04'),
	(6644, 91252, 'btc', '2025-12-08 01:29:04'),
	(6645, 91300, 'btc', '2025-12-08 01:31:04'),
	(6646, 91476, 'btc', '2025-12-08 01:33:05'),
	(6647, 91434, 'btc', '2025-12-08 01:35:05'),
	(6648, 91380, 'btc', '2025-12-08 01:37:05'),
	(6649, 91638, 'btc', '2025-12-08 01:39:06'),
	(6650, 91516, 'btc', '2025-12-08 01:41:06'),
	(6651, 91428, 'btc', '2025-12-08 01:43:06'),
	(6652, 91277, 'btc', '2025-12-08 01:45:06'),
	(6653, 91200, 'btc', '2025-12-08 01:47:07'),
	(6654, 91068, 'btc', '2025-12-08 01:49:07'),
	(6655, 91088, 'btc', '2025-12-08 01:51:07'),
	(6656, 91073, 'btc', '2025-12-08 01:53:08'),
	(6657, 91080, 'btc', '2025-12-08 01:55:08'),
	(6658, 90859, 'btc', '2025-12-08 01:57:08'),
	(6659, 90939, 'btc', '2025-12-08 01:59:08'),
	(6660, 90842, 'btc', '2025-12-08 02:01:09'),
	(6661, 90945, 'btc', '2025-12-08 02:03:09'),
	(6662, 90844, 'btc', '2025-12-08 02:05:09'),
	(6663, 90856, 'btc', '2025-12-08 02:07:10'),
	(6664, 91008, 'btc', '2025-12-08 02:09:10'),
	(6665, 90973, 'btc', '2025-12-08 02:11:10'),
	(6666, 90951, 'btc', '2025-12-08 02:13:10'),
	(6667, 90913, 'btc', '2025-12-08 02:15:11'),
	(6668, 90986, 'btc', '2025-12-08 02:17:11'),
	(6669, 91023, 'btc', '2025-12-08 02:19:11'),
	(6670, 91002, 'btc', '2025-12-08 02:21:12'),
	(6671, 91065, 'btc', '2025-12-08 02:23:12'),
	(6672, 91040, 'btc', '2025-12-08 02:25:12'),
	(6673, 91060, 'btc', '2025-12-08 02:27:12'),
	(6674, 91046, 'btc', '2025-12-08 02:29:13'),
	(6675, 91082, 'btc', '2025-12-08 02:31:13'),
	(6676, 91053, 'btc', '2025-12-08 02:33:13'),
	(6677, 91028, 'btc', '2025-12-08 02:35:14'),
	(6678, 91216, 'btc', '2025-12-08 02:37:14'),
	(6679, 91171, 'btc', '2025-12-08 02:39:14'),
	(6680, 91201, 'btc', '2025-12-08 02:41:15'),
	(6681, 91125, 'btc', '2025-12-08 02:43:15'),
	(6682, 91250, 'btc', '2025-12-08 02:45:15'),
	(6683, 91250, 'btc', '2025-12-08 02:47:15'),
	(6684, 91139, 'btc', '2025-12-08 02:49:16'),
	(6685, 91218, 'btc', '2025-12-08 02:51:16'),
	(6686, 91281, 'btc', '2025-12-08 02:53:16'),
	(6687, 91416, 'btc', '2025-12-08 02:55:17'),
	(6688, 91416, 'btc', '2025-12-08 02:57:17'),
	(6689, 91358, 'btc', '2025-12-08 02:59:17'),
	(6690, 91362, 'btc', '2025-12-08 03:01:18'),
	(6691, 91214, 'btc', '2025-12-08 03:03:18'),
	(6692, 91279, 'btc', '2025-12-08 03:05:18'),
	(6693, 91276, 'btc', '2025-12-08 03:07:19'),
	(6694, 91240, 'btc', '2025-12-08 03:09:19'),
	(6695, 91217, 'btc', '2025-12-08 03:11:19'),
	(6696, 91132, 'btc', '2025-12-08 03:13:19'),
	(6697, 91132, 'btc', '2025-12-08 03:15:20'),
	(6698, 91196, 'btc', '2025-12-08 03:17:20'),
	(6699, 91256, 'btc', '2025-12-08 03:19:20'),
	(6700, 91338, 'btc', '2025-12-08 03:21:21'),
	(6701, 91318, 'btc', '2025-12-08 03:23:21'),
	(6702, 91389, 'btc', '2025-12-08 03:25:21'),
	(6703, 91315, 'btc', '2025-12-08 03:27:22'),
	(6704, 91277, 'btc', '2025-12-08 03:29:22'),
	(6705, 91257, 'btc', '2025-12-08 03:31:22'),
	(6706, 91268, 'btc', '2025-12-08 03:33:23'),
	(6707, 91226, 'btc', '2025-12-08 03:35:23'),
	(6708, 91174, 'btc', '2025-12-08 03:37:23'),
	(6709, 91051, 'btc', '2025-12-08 03:39:24'),
	(6710, 91002, 'btc', '2025-12-08 03:41:24'),
	(6711, 91014, 'btc', '2025-12-08 03:43:24'),
	(6712, 91009, 'btc', '2025-12-08 03:45:24'),
	(6713, 91075, 'btc', '2025-12-08 03:47:25'),
	(6714, 91072, 'btc', '2025-12-08 03:49:25'),
	(6715, 91054, 'btc', '2025-12-08 03:51:25'),
	(6716, 91059, 'btc', '2025-12-08 03:53:26'),
	(6717, 91036, 'btc', '2025-12-08 03:55:26'),
	(6718, 91050, 'btc', '2025-12-08 03:57:26'),
	(6719, 91118, 'btc', '2025-12-08 03:59:27'),
	(6720, 91150, 'btc', '2025-12-08 04:01:27'),
	(6721, 91100, 'btc', '2025-12-08 04:03:27'),
	(6722, 91064, 'btc', '2025-12-08 04:05:27'),
	(6723, 91085, 'btc', '2025-12-08 04:07:28'),
	(6724, 91080, 'btc', '2025-12-08 04:09:28'),
	(6725, 91156, 'btc', '2025-12-08 04:11:28'),
	(6726, 91106, 'btc', '2025-12-08 04:13:29'),
	(6727, 91124, 'btc', '2025-12-08 04:15:29'),
	(6728, 91132, 'btc', '2025-12-08 04:17:29'),
	(6729, 91124, 'btc', '2025-12-08 04:19:30'),
	(6730, 91122, 'btc', '2025-12-08 04:21:30'),
	(6731, 91137, 'btc', '2025-12-08 04:23:30'),
	(6732, 91160, 'btc', '2025-12-08 04:25:31'),
	(6733, 91222, 'btc', '2025-12-08 04:27:31'),
	(6734, 91253, 'btc', '2025-12-08 04:29:31'),
	(6735, 91335, 'btc', '2025-12-08 04:31:31'),
	(6736, 91470, 'btc', '2025-12-08 04:33:32'),
	(6737, 91389, 'btc', '2025-12-08 04:35:32'),
	(6738, 91260, 'btc', '2025-12-08 04:37:32'),
	(6739, 91246, 'btc', '2025-12-08 04:39:33'),
	(6740, 91188, 'btc', '2025-12-08 04:41:33'),
	(6741, 91244, 'btc', '2025-12-08 04:43:33'),
	(6742, 91214, 'btc', '2025-12-08 04:45:34'),
	(6743, 91232, 'btc', '2025-12-08 04:47:34'),
	(6744, 91222, 'btc', '2025-12-08 04:49:34'),
	(6745, 91185, 'btc', '2025-12-08 04:51:34'),
	(6746, 91214, 'btc', '2025-12-08 04:53:35'),
	(6747, 91223, 'btc', '2025-12-08 04:55:35'),
	(6748, 91293, 'btc', '2025-12-08 04:57:35'),
	(6749, 91268, 'btc', '2025-12-08 04:59:36'),
	(6750, 91119, 'btc', '2025-12-08 05:06:01'),
	(6751, 91128, 'btc', '2025-12-08 05:08:01'),
	(6752, 91090, 'btc', '2025-12-08 05:10:02'),
	(6753, 91073, 'btc', '2025-12-08 05:12:02'),
	(6754, 91150, 'btc', '2025-12-08 05:14:02'),
	(6755, 91070, 'btc', '2025-12-08 05:16:02'),
	(6756, 91109, 'btc', '2025-12-08 05:18:03'),
	(6757, 91320, 'btc', '2025-12-08 05:20:03'),
	(6758, 91332, 'btc', '2025-12-08 05:22:03'),
	(6759, 91374, 'btc', '2025-12-08 05:24:04'),
	(6760, 91297, 'btc', '2025-12-08 05:26:04'),
	(6761, 91308, 'btc', '2025-12-08 05:28:04'),
	(6762, 91285, 'btc', '2025-12-08 05:30:04'),
	(6763, 91329, 'btc', '2025-12-08 05:32:05'),
	(6764, 91354, 'btc', '2025-12-08 05:34:05'),
	(6765, 91426, 'btc', '2025-12-08 05:36:05'),
	(6766, 91322, 'btc', '2025-12-08 05:38:06'),
	(6767, 91328, 'btc', '2025-12-08 05:40:06'),
	(6768, 91378, 'btc', '2025-12-08 05:42:06'),
	(6769, 91343, 'btc', '2025-12-08 05:44:07'),
	(6770, 91348, 'btc', '2025-12-08 05:46:07'),
	(6771, 91343, 'btc', '2025-12-08 05:48:07'),
	(6772, 91371, 'btc', '2025-12-08 05:50:07'),
	(6773, 91403, 'btc', '2025-12-08 05:52:08'),
	(6774, 91325, 'btc', '2025-12-08 05:54:08'),
	(6775, 91339, 'btc', '2025-12-08 05:56:08'),
	(6776, 91325, 'btc', '2025-12-08 05:58:09'),
	(6777, 91334, 'btc', '2025-12-08 06:00:09'),
	(6778, 91383, 'btc', '2025-12-08 06:02:09'),
	(6779, 91264, 'btc', '2025-12-08 06:04:10'),
	(6780, 91313, 'btc', '2025-12-08 06:06:10'),
	(6781, 91360, 'btc', '2025-12-08 06:08:10'),
	(6782, 91392, 'btc', '2025-12-08 06:10:10'),
	(6783, 91357, 'btc', '2025-12-08 06:12:11'),
	(6784, 91373, 'btc', '2025-12-08 06:14:11'),
	(6785, 91409, 'btc', '2025-12-08 06:16:11'),
	(6786, 91425, 'btc', '2025-12-08 06:18:12'),
	(6787, 91408, 'btc', '2025-12-08 06:20:12'),
	(6788, 91362, 'btc', '2025-12-08 06:22:12'),
	(6789, 91344, 'btc', '2025-12-08 06:24:13'),
	(6790, 91395, 'btc', '2025-12-08 06:26:13'),
	(6791, 91413, 'btc', '2025-12-08 06:28:13'),
	(6792, 91493, 'btc', '2025-12-08 06:30:13'),
	(6793, 91500, 'btc', '2025-12-08 06:32:14'),
	(6794, 91506, 'btc', '2025-12-08 06:34:14'),
	(6795, 91521, 'btc', '2025-12-08 06:36:14'),
	(6796, 91594, 'btc', '2025-12-08 06:38:15'),
	(6797, 91569, 'btc', '2025-12-08 06:40:15'),
	(6798, 91588, 'btc', '2025-12-08 06:42:15'),
	(6799, 91550, 'btc', '2025-12-08 06:44:15'),
	(6800, 91609, 'btc', '2025-12-08 06:46:16'),
	(6801, 91589, 'btc', '2025-12-08 06:48:16'),
	(6802, 91630, 'btc', '2025-12-08 06:50:16'),
	(6803, 91599, 'btc', '2025-12-08 06:52:17'),
	(6804, 91593, 'btc', '2025-12-08 06:54:17'),
	(6805, 91519, 'btc', '2025-12-08 06:56:17'),
	(6806, 91465, 'btc', '2025-12-08 06:58:18'),
	(6807, 91412, 'btc', '2025-12-08 07:00:18'),
	(6808, 91443, 'btc', '2025-12-08 07:02:18'),
	(6809, 91468, 'btc', '2025-12-08 07:04:18'),
	(6810, 91447, 'btc', '2025-12-08 07:06:19'),
	(6811, 91424, 'btc', '2025-12-08 07:08:19'),
	(6812, 91403, 'btc', '2025-12-08 07:10:19'),
	(6813, 91396, 'btc', '2025-12-08 07:12:20'),
	(6814, 91409, 'btc', '2025-12-08 07:14:20'),
	(6815, 91423, 'btc', '2025-12-08 07:16:20'),
	(6816, 91470, 'btc', '2025-12-08 07:18:20'),
	(6817, 91465, 'btc', '2025-12-08 07:20:21'),
	(6818, 91510, 'btc', '2025-12-08 07:22:21'),
	(6819, 91650, 'btc', '2025-12-08 07:24:21'),
	(6820, 91722, 'btc', '2025-12-08 07:26:22'),
	(6821, 91692, 'btc', '2025-12-08 07:28:22'),
	(6822, 91720, 'btc', '2025-12-08 07:30:22'),
	(6823, 91677, 'btc', '2025-12-08 07:32:23'),
	(6824, 91692, 'btc', '2025-12-08 07:34:23'),
	(6825, 91733, 'btc', '2025-12-08 07:36:23'),
	(6826, 91797, 'btc', '2025-12-08 07:38:23'),
	(6827, 91794, 'btc', '2025-12-08 07:40:24'),
	(6828, 91702, 'btc', '2025-12-08 07:42:24'),
	(6829, 91691, 'btc', '2025-12-08 07:44:24'),
	(6830, 91586, 'btc', '2025-12-08 07:46:25'),
	(6831, 91598, 'btc', '2025-12-08 07:48:25'),
	(6832, 91565, 'btc', '2025-12-08 07:50:25'),
	(6833, 91530, 'btc', '2025-12-08 07:52:25'),
	(6834, 91516, 'btc', '2025-12-08 07:54:26'),
	(6835, 91527, 'btc', '2025-12-08 07:56:26'),
	(6836, 91538, 'btc', '2025-12-08 07:58:26'),
	(6837, 91550, 'btc', '2025-12-08 08:00:27'),
	(6838, 91493, 'btc', '2025-12-08 08:02:27'),
	(6839, 91526, 'btc', '2025-12-08 08:04:27'),
	(6840, 91517, 'btc', '2025-12-08 08:06:27'),
	(6841, 91560, 'btc', '2025-12-08 08:08:28'),
	(6842, 91522, 'btc', '2025-12-08 08:10:28'),
	(6843, 91571, 'btc', '2025-12-08 08:12:28'),
	(6844, 91602, 'btc', '2025-12-08 08:14:29'),
	(6845, 91712, 'btc', '2025-12-08 08:16:29'),
	(6846, 91683, 'btc', '2025-12-08 08:18:29'),
	(6847, 91655, 'btc', '2025-12-08 08:20:30'),
	(6848, 91684, 'btc', '2025-12-08 08:22:30'),
	(6849, 91718, 'btc', '2025-12-08 08:24:30'),
	(6850, 91697, 'btc', '2025-12-08 08:26:30'),
	(6851, 91686, 'btc', '2025-12-08 08:28:31'),
	(6852, 91702, 'btc', '2025-12-08 08:30:31'),
	(6853, 91630, 'btc', '2025-12-08 08:32:31'),
	(6854, 91637, 'btc', '2025-12-08 08:34:32'),
	(6855, 91694, 'btc', '2025-12-08 08:36:32'),
	(6856, 91720, 'btc', '2025-12-08 08:38:32'),
	(6857, 91725, 'btc', '2025-12-08 08:40:32'),
	(6858, 91758, 'btc', '2025-12-08 08:42:33'),
	(6859, 91816, 'btc', '2025-12-08 08:44:33'),
	(6860, 91770, 'btc', '2025-12-08 08:46:33'),
	(6861, 91888, 'btc', '2025-12-08 08:48:34'),
	(6862, 91723, 'btc', '2025-12-08 08:50:34'),
	(6863, 91721, 'btc', '2025-12-08 08:52:34'),
	(6864, 91786, 'btc', '2025-12-08 08:54:34'),
	(6865, 91832, 'btc', '2025-12-08 08:56:35'),
	(6866, 91829, 'btc', '2025-12-08 08:58:35'),
	(6867, 91846, 'btc', '2025-12-08 09:00:35'),
	(6868, 91934, 'btc', '2025-12-08 09:02:36'),
	(6869, 91973, 'btc', '2025-12-08 09:04:36'),
	(6870, 92256, 'btc', '2025-12-08 09:06:36'),
	(6871, 92157, 'btc', '2025-12-08 09:08:37'),
	(6872, 92100, 'btc', '2025-12-08 09:10:37'),
	(6873, 92038, 'btc', '2025-12-08 09:12:37'),
	(6874, 92078, 'btc', '2025-12-08 09:14:38'),
	(6875, 92003, 'btc', '2025-12-08 09:16:38'),
	(6876, 91964, 'btc', '2025-12-08 09:18:38'),
	(6877, 92034, 'btc', '2025-12-08 09:20:38'),
	(6878, 92019, 'btc', '2025-12-08 09:22:39'),
	(6879, 91998, 'btc', '2025-12-08 09:24:39'),
	(6880, 91974, 'btc', '2025-12-08 09:26:39'),
	(6881, 91992, 'btc', '2025-12-08 09:28:39'),
	(6882, 91923, 'btc', '2025-12-08 09:30:40'),
	(6883, 91977, 'btc', '2025-12-08 09:32:40'),
	(6884, 92012, 'btc', '2025-12-08 09:34:40'),
	(6885, 92051, 'btc', '2025-12-08 09:36:41'),
	(6886, 92009, 'btc', '2025-12-08 09:38:41'),
	(6887, 92028, 'btc', '2025-12-08 09:40:41'),
	(6888, 92011, 'btc', '2025-12-08 09:42:42'),
	(6889, 91990, 'btc', '2025-12-08 09:44:42'),
	(6890, 91963, 'btc', '2025-12-08 09:46:42'),
	(6891, 91973, 'btc', '2025-12-08 09:48:43'),
	(6892, 91964, 'btc', '2025-12-08 09:50:43'),
	(6893, 91936, 'btc', '2025-12-08 09:52:43'),
	(6894, 91908, 'btc', '2025-12-08 09:54:43'),
	(6895, 91917, 'btc', '2025-12-08 09:56:44'),
	(6896, 91930, 'btc', '2025-12-08 09:58:44'),
	(6897, 91908, 'btc', '2025-12-08 10:00:44'),
	(6898, 91883, 'btc', '2025-12-08 10:02:45'),
	(6899, 91851, 'btc', '2025-12-08 10:04:45'),
	(6900, 91857, 'btc', '2025-12-08 10:06:45'),
	(6901, 91868, 'btc', '2025-12-08 10:08:46'),
	(6902, 91946, 'btc', '2025-12-08 10:10:46'),
	(6903, 91955, 'btc', '2025-12-08 10:12:46'),
	(6904, 92031, 'btc', '2025-12-08 10:14:47'),
	(6905, 91982, 'btc', '2025-12-08 10:16:47'),
	(6906, 92023, 'btc', '2025-12-08 10:18:47'),
	(6907, 92041, 'btc', '2025-12-08 10:20:48'),
	(6908, 91964, 'btc', '2025-12-08 10:22:48'),
	(6909, 92042, 'btc', '2025-12-08 10:24:48'),
	(6910, 92020, 'btc', '2025-12-08 10:26:48'),
	(6911, 92000, 'btc', '2025-12-08 10:28:49'),
	(6912, 91981, 'btc', '2025-12-08 10:30:49'),
	(6913, 91985, 'btc', '2025-12-08 10:32:49'),
	(6914, 92134, 'btc', '2025-12-08 10:34:50'),
	(6915, 92140, 'btc', '2025-12-08 10:36:50'),
	(6916, 92140, 'btc', '2025-12-08 10:38:50'),
	(6917, 92133, 'btc', '2025-12-08 10:40:50'),
	(6918, 92180, 'btc', '2025-12-08 10:42:51'),
	(6919, 92207, 'btc', '2025-12-08 10:44:51'),
	(6920, 92185, 'btc', '2025-12-08 10:46:51'),
	(6921, 92206, 'btc', '2025-12-08 10:48:52'),
	(6922, 92198, 'btc', '2025-12-08 10:50:52'),
	(6923, 92138, 'btc', '2025-12-08 10:52:52'),
	(6924, 92136, 'btc', '2025-12-08 10:54:53'),
	(6925, 92131, 'btc', '2025-12-08 10:56:53'),
	(6926, 92141, 'btc', '2025-12-08 10:58:53'),
	(6927, 92151, 'btc', '2025-12-08 11:00:53'),
	(6928, 92065, 'btc', '2025-12-08 11:02:54'),
	(6929, 92025, 'btc', '2025-12-08 11:04:54'),
	(6930, 92068, 'btc', '2025-12-08 11:06:55'),
	(6931, 92106, 'btc', '2025-12-08 11:08:55'),
	(6932, 92155, 'btc', '2025-12-08 11:10:55'),
	(6933, 92123, 'btc', '2025-12-08 11:12:56'),
	(6934, 92148, 'btc', '2025-12-08 11:14:56'),
	(6935, 92144, 'btc', '2025-12-08 11:16:56'),
	(6936, 92132, 'btc', '2025-12-08 11:18:57'),
	(6937, 92160, 'btc', '2025-12-08 11:20:57'),
	(6938, 92131, 'btc', '2025-12-08 11:22:57'),
	(6939, 92131, 'btc', '2025-12-08 11:24:57'),
	(6940, 92123, 'btc', '2025-12-08 11:26:58'),
	(6941, 92075, 'btc', '2025-12-08 11:28:58'),
	(6942, 91969, 'btc', '2025-12-08 11:30:58'),
	(6943, 91902, 'btc', '2025-12-08 11:32:59'),
	(6944, 91917, 'btc', '2025-12-08 11:34:59'),
	(6945, 91979, 'btc', '2025-12-08 11:36:59'),
	(6946, 91930, 'btc', '2025-12-08 11:38:59'),
	(6947, 91976, 'btc', '2025-12-08 11:41:00'),
	(6948, 91965, 'btc', '2025-12-08 11:43:00'),
	(6949, 91926, 'btc', '2025-12-08 11:45:00'),
	(6950, 91902, 'btc', '2025-12-08 11:47:01'),
	(6951, 91966, 'btc', '2025-12-08 11:49:01'),
	(6952, 91971, 'btc', '2025-12-08 11:51:01'),
	(6953, 91951, 'btc', '2025-12-08 11:53:01'),
	(6954, 91980, 'btc', '2025-12-08 11:55:02'),
	(6955, 91968, 'btc', '2025-12-08 11:57:02'),
	(6956, 91974, 'btc', '2025-12-08 11:59:02'),
	(6957, 91922, 'btc', '2025-12-08 12:01:03'),
	(6958, 91913, 'btc', '2025-12-08 12:03:03'),
	(6959, 91865, 'btc', '2025-12-08 12:05:03'),
	(6960, 91879, 'btc', '2025-12-08 12:07:03'),
	(6961, 91833, 'btc', '2025-12-08 12:09:04'),
	(6962, 91830, 'btc', '2025-12-08 12:11:04'),
	(6963, 91832, 'btc', '2025-12-08 12:13:04'),
	(6964, 91784, 'btc', '2025-12-08 12:15:05'),
	(6965, 91825, 'btc', '2025-12-08 12:17:05'),
	(6966, 91834, 'btc', '2025-12-08 12:19:05'),
	(6967, 91820, 'btc', '2025-12-08 12:21:06'),
	(6968, 91866, 'btc', '2025-12-08 12:23:06'),
	(6969, 91848, 'btc', '2025-12-08 12:25:06'),
	(6970, 91826, 'btc', '2025-12-08 12:27:06'),
	(6971, 91880, 'btc', '2025-12-08 12:29:07'),
	(6972, 91920, 'btc', '2025-12-08 12:31:07'),
	(6973, 91874, 'btc', '2025-12-08 12:33:07'),
	(6974, 91767, 'btc', '2025-12-08 12:35:08'),
	(6975, 91770, 'btc', '2025-12-08 12:37:08'),
	(6976, 91738, 'btc', '2025-12-08 12:39:08'),
	(6977, 91783, 'btc', '2025-12-08 12:41:09'),
	(6978, 91766, 'btc', '2025-12-08 12:43:09'),
	(6979, 91763, 'btc', '2025-12-08 12:45:09'),
	(6980, 91790, 'btc', '2025-12-08 12:47:09'),
	(6981, 91806, 'btc', '2025-12-08 12:49:10'),
	(6982, 91800, 'btc', '2025-12-08 12:51:10'),
	(6983, 91736, 'btc', '2025-12-08 12:53:10'),
	(6984, 91761, 'btc', '2025-12-08 12:55:10'),
	(6985, 91768, 'btc', '2025-12-08 12:57:11'),
	(6986, 91775, 'btc', '2025-12-08 12:59:11'),
	(6987, 91771, 'btc', '2025-12-08 13:01:11'),
	(6988, 91785, 'btc', '2025-12-08 13:03:12'),
	(6989, 91722, 'btc', '2025-12-08 13:05:12'),
	(6990, 91892, 'btc', '2025-12-08 13:07:12'),
	(6991, 91856, 'btc', '2025-12-08 13:09:13'),
	(6992, 92013, 'btc', '2025-12-08 13:11:13'),
	(6993, 92006, 'btc', '2025-12-08 13:13:13'),
	(6994, 91805, 'btc', '2025-12-08 13:15:14'),
	(6995, 91759, 'btc', '2025-12-08 13:17:14'),
	(6996, 91715, 'btc', '2025-12-08 13:19:14'),
	(6997, 91732, 'btc', '2025-12-08 13:21:14'),
	(6998, 91655, 'btc', '2025-12-08 13:23:15'),
	(6999, 91617, 'btc', '2025-12-08 13:25:15'),
	(7000, 91651, 'btc', '2025-12-08 13:27:15'),
	(7001, 91665, 'btc', '2025-12-08 13:29:16'),
	(7002, 91670, 'btc', '2025-12-08 13:31:16'),
	(7003, 91596, 'btc', '2025-12-08 13:33:16'),
	(7004, 91603, 'btc', '2025-12-08 13:35:16'),
	(7005, 91657, 'btc', '2025-12-08 13:37:17'),
	(7006, 91583, 'btc', '2025-12-08 13:39:17'),
	(7007, 91458, 'btc', '2025-12-08 13:41:17'),
	(7008, 91584, 'btc', '2025-12-08 13:43:18'),
	(7009, 91686, 'btc', '2025-12-08 13:45:18'),
	(7010, 91706, 'btc', '2025-12-08 13:47:18'),
	(7011, 91589, 'btc', '2025-12-08 13:49:19'),
	(7012, 91629, 'btc', '2025-12-08 13:51:19'),
	(7013, 91544, 'btc', '2025-12-08 13:53:19'),
	(7014, 91521, 'btc', '2025-12-08 13:55:19'),
	(7015, 91473, 'btc', '2025-12-08 13:57:20'),
	(7016, 91465, 'btc', '2025-12-08 13:59:20'),
	(7017, 91418, 'btc', '2025-12-08 14:01:20'),
	(7018, 91468, 'btc', '2025-12-08 14:03:21'),
	(7019, 91553, 'btc', '2025-12-08 14:05:21'),
	(7020, 91545, 'btc', '2025-12-08 14:07:21'),
	(7021, 91500, 'btc', '2025-12-08 14:09:21'),
	(7022, 91526, 'btc', '2025-12-08 14:11:22'),
	(7023, 91471, 'btc', '2025-12-08 14:13:22'),
	(7024, 91551, 'btc', '2025-12-08 14:15:22'),
	(7025, 91524, 'btc', '2025-12-08 14:17:22'),
	(7026, 91552, 'btc', '2025-12-08 14:19:29'),
	(7027, 91463, 'btc', '2025-12-08 14:21:29'),
	(7028, 91394, 'btc', '2025-12-08 14:23:29'),
	(7029, 91262, 'btc', '2025-12-08 14:25:45'),
	(7030, 91218, 'btc', '2025-12-08 14:27:45'),
	(7031, 91308, 'btc', '2025-12-08 14:29:03'),
	(7032, 91261, 'btc', '2025-12-08 14:31:03'),
	(7033, 91608, 'btc', '2025-12-08 14:33:04'),
	(7034, 91540, 'btc', '2025-12-08 14:35:04'),
	(7035, 91063, 'btc', '2025-12-08 14:37:04'),
	(7036, 90818, 'btc', '2025-12-08 14:38:35'),
	(7037, 91076, 'btc', '2025-12-08 14:40:35'),
	(7038, 90972, 'btc', '2025-12-08 14:42:36'),
	(7039, 91444, 'btc', '2025-12-08 14:44:39'),
	(7040, 91566, 'btc', '2025-12-08 14:46:40'),
	(7041, 91530, 'btc', '2025-12-08 14:47:35'),
	(7042, 91363, 'btc', '2025-12-08 14:49:35'),
	(7043, 91333, 'btc', '2025-12-08 14:50:05'),
	(7044, 91408, 'btc', '2025-12-08 14:52:06'),
	(7045, 91489, 'btc', '2025-12-08 14:54:06'),
	(7046, 91200, 'btc', '2025-12-08 14:56:06'),
	(7047, 90868, 'btc', '2025-12-08 14:58:06'),
	(7048, 90897, 'btc', '2025-12-08 15:00:07'),
	(7049, 90780, 'btc', '2025-12-08 15:02:07'),
	(7050, 90833, 'btc', '2025-12-08 15:04:21'),
	(7051, 90893, 'btc', '2025-12-08 15:06:21'),
	(7052, 90723, 'btc', '2025-12-08 15:08:21'),
	(7053, 90461, 'btc', '2025-12-08 15:10:21'),
	(7054, 90346, 'btc', '2025-12-08 15:12:22'),
	(7055, 90170, 'btc', '2025-12-08 15:14:22'),
	(7056, 90406, 'btc', '2025-12-08 15:16:22'),
	(7057, 90473, 'btc', '2025-12-08 15:18:23'),
	(7058, 90354, 'btc', '2025-12-08 15:20:23'),
	(7059, 90199, 'btc', '2025-12-08 15:22:23'),
	(7060, 89982, 'btc', '2025-12-08 15:24:24'),
	(7061, 89821, 'btc', '2025-12-08 15:26:24'),
	(7062, 89977, 'btc', '2025-12-08 15:28:24'),
	(7063, 89913, 'btc', '2025-12-08 15:30:24'),
	(7064, 90050, 'btc', '2025-12-08 15:32:25'),
	(7065, 90153, 'btc', '2025-12-08 15:34:25'),
	(7066, 89843, 'btc', '2025-12-08 15:36:40'),
	(7067, 89854, 'btc', '2025-12-08 15:38:40'),
	(7068, 89786, 'btc', '2025-12-08 15:40:40'),
	(7069, 89770, 'btc', '2025-12-08 15:42:40'),
	(7070, 89722, 'btc', '2025-12-08 15:44:41'),
	(7071, 89740, 'btc', '2025-12-08 15:46:41'),
	(7072, 89827, 'btc', '2025-12-08 15:48:41'),
	(7073, 89816, 'btc', '2025-12-08 15:50:42'),
	(7074, 89864, 'btc', '2025-12-08 15:52:42'),
	(7075, 90104, 'btc', '2025-12-08 15:54:42'),
	(7076, 90170, 'btc', '2025-12-08 15:56:42'),
	(7077, 90054, 'btc', '2025-12-08 15:58:43'),
	(7078, 89925, 'btc', '2025-12-08 16:00:43'),
	(7079, 89725, 'btc', '2025-12-08 16:02:43'),
	(7080, 89753, 'btc', '2025-12-08 16:04:44'),
	(7081, 89845, 'btc', '2025-12-08 16:06:44'),
	(7082, 90013, 'btc', '2025-12-08 16:08:44'),
	(7083, 89911, 'btc', '2025-12-08 16:10:48'),
	(7084, 89977, 'btc', '2025-12-08 16:12:48'),
	(7085, 89977, 'btc', '2025-12-08 16:14:48'),
	(7086, 89880, 'btc', '2025-12-08 16:16:48'),
	(7087, 90025, 'btc', '2025-12-08 16:18:49'),
	(7088, 90250, 'btc', '2025-12-08 16:20:49'),
	(7089, 90180, 'btc', '2025-12-08 16:22:49'),
	(7090, 90355, 'btc', '2025-12-08 16:24:50'),
	(7091, 90297, 'btc', '2025-12-08 16:26:50'),
	(7092, 90300, 'btc', '2025-12-08 16:28:50'),
	(7093, 90405, 'btc', '2025-12-08 16:30:51'),
	(7094, 90360, 'btc', '2025-12-08 16:32:51'),
	(7095, 90247, 'btc', '2025-12-08 16:34:51'),
	(7096, 90188, 'btc', '2025-12-08 16:36:51'),
	(7097, 90380, 'btc', '2025-12-08 16:38:52'),
	(7098, 90426, 'btc', '2025-12-08 16:40:52'),
	(7099, 90261, 'btc', '2025-12-08 16:42:52'),
	(7100, 90280, 'btc', '2025-12-08 16:44:53'),
	(7101, 90230, 'btc', '2025-12-08 16:46:53'),
	(7102, 90117, 'btc', '2025-12-08 16:48:53'),
	(7103, 89970, 'btc', '2025-12-08 16:50:54'),
	(7104, 89830, 'btc', '2025-12-08 16:52:54'),
	(7105, 89887, 'btc', '2025-12-08 16:54:54'),
	(7106, 89886, 'btc', '2025-12-08 16:56:54'),
	(7107, 89969, 'btc', '2025-12-08 16:58:55'),
	(7108, 89956, 'btc', '2025-12-08 17:00:55'),
	(7109, 89784, 'btc', '2025-12-08 17:03:03'),
	(7110, 89964, 'btc', '2025-12-08 17:05:03'),
	(7111, 90163, 'btc', '2025-12-08 17:07:04'),
	(7112, 90022, 'btc', '2025-12-08 17:09:04'),
	(7113, 90100, 'btc', '2025-12-08 17:11:04'),
	(7114, 90162, 'btc', '2025-12-08 17:13:05'),
	(7115, 90087, 'btc', '2025-12-08 17:15:05'),
	(7116, 90163, 'btc', '2025-12-08 17:17:05'),
	(7117, 90055, 'btc', '2025-12-08 17:19:06'),
	(7118, 90005, 'btc', '2025-12-08 17:21:06'),
	(7119, 89925, 'btc', '2025-12-08 17:23:06'),
	(7120, 89881, 'btc', '2025-12-08 17:25:07'),
	(7121, 89964, 'btc', '2025-12-08 17:27:07'),
	(7122, 90026, 'btc', '2025-12-08 17:29:07'),
	(7123, 90074, 'btc', '2025-12-08 17:31:07'),
	(7124, 89951, 'btc', '2025-12-08 17:33:08'),
	(7125, 90033, 'btc', '2025-12-08 17:35:08'),
	(7126, 90040, 'btc', '2025-12-08 17:36:35'),
	(7127, 89944, 'btc', '2025-12-08 17:38:35'),
	(7128, 89848, 'btc', '2025-12-08 17:40:35'),
	(7129, 89875, 'btc', '2025-12-08 17:42:36'),
	(7130, 89871, 'btc', '2025-12-08 17:44:36'),
	(7131, 89799, 'btc', '2025-12-08 17:46:36'),
	(7132, 89926, 'btc', '2025-12-08 17:48:36'),
	(7133, 89937, 'btc', '2025-12-08 17:50:37'),
	(7134, 89880, 'btc', '2025-12-08 17:52:37'),
	(7135, 90002, 'btc', '2025-12-08 17:54:37'),
	(7136, 90102, 'btc', '2025-12-08 17:56:38'),
	(7137, 90314, 'btc', '2025-12-08 17:58:38'),
	(7138, 90349, 'btc', '2025-12-08 18:00:38'),
	(7139, 90286, 'btc', '2025-12-08 18:02:39'),
	(7140, 90236, 'btc', '2025-12-08 18:04:29'),
	(7141, 90321, 'btc', '2025-12-08 18:06:29'),
	(7142, 90352, 'btc', '2025-12-08 18:08:29'),
	(7143, 90362, 'btc', '2025-12-08 18:10:29'),
	(7144, 90332, 'btc', '2025-12-08 18:12:30'),
	(7145, 90395, 'btc', '2025-12-08 18:14:30'),
	(7146, 90369, 'btc', '2025-12-08 18:16:30'),
	(7147, 90335, 'btc', '2025-12-08 18:18:31'),
	(7148, 90467, 'btc', '2025-12-08 18:20:31'),
	(7149, 90507, 'btc', '2025-12-08 18:22:31'),
	(7150, 90480, 'btc', '2025-12-08 18:24:32'),
	(7151, 90398, 'btc', '2025-12-08 18:26:32'),
	(7152, 90233, 'btc', '2025-12-08 18:28:32'),
	(7153, 90106, 'btc', '2025-12-08 18:30:33'),
	(7154, 89985, 'btc', '2025-12-08 18:32:33'),
	(7155, 90087, 'btc', '2025-12-08 18:34:33'),
	(7156, 90312, 'btc', '2025-12-08 18:36:34');

-- Listage de la structure de table zak. crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `citizenid` (`citizenid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.crypto_transactions : ~0 rows (environ)

-- Listage de la structure de table zak. darkchat_messages
CREATE TABLE IF NOT EXISTS `darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(46) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `messages` text DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.darkchat_messages : ~0 rows (environ)

-- Listage de la structure de table zak. datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.datastore : ~11 rows (environ)
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('casino', 'Casino', 0),
	('drugs', 'Drugs', 0),
	('property', 'Property', 0),
	('propery', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);

-- Listage de la structure de table zak. datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.datastore_data : ~76 rows (environ)
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_police', NULL, '{}'),
	(2, 'society_ambulance', NULL, '{}'),
	(3, 'society_mechanic', NULL, '{}'),
	(4, 'society_taxi', NULL, '{}'),
	(5, 'property', NULL, '{}'),
	(11, 'property', 'fcb47b307801e586e8c95881bdfc98004f24d031', '{}'),
	(12, 'user_ears', 'fcb47b307801e586e8c95881bdfc98004f24d031', '{}'),
	(13, 'user_glasses', 'fcb47b307801e586e8c95881bdfc98004f24d031', '{}'),
	(14, 'user_mask', 'fcb47b307801e586e8c95881bdfc98004f24d031', '{}'),
	(15, 'user_helmet', 'fcb47b307801e586e8c95881bdfc98004f24d031', '{}'),
	(16, 'property', 'e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{}'),
	(17, 'user_ears', 'e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{}'),
	(18, 'user_glasses', 'e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{}'),
	(19, 'user_mask', 'e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{}'),
	(20, 'user_helmet', 'e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{}'),
	(21, 'propery', 'fcb47b307801e586e8c95881bdfc98004f24d031', '{}'),
	(22, 'drugs', 'fcb47b307801e586e8c95881bdfc98004f24d031', '{}'),
	(23, 'propery', 'e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{}'),
	(24, 'drugs', 'e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{}'),
	(25, 'property', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '{}'),
	(26, 'user_ears', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '{}'),
	(27, 'user_glasses', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '{}'),
	(28, 'user_mask', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '{}'),
	(29, 'user_helmet', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '{}'),
	(30, 'propery', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '{}'),
	(31, 'drugs', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '{}'),
	(32, 'property', 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{}'),
	(33, 'user_ears', 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{}'),
	(34, 'user_glasses', 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{}'),
	(35, 'user_mask', 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{}'),
	(36, 'drugs', 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{}'),
	(37, 'user_helmet', 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{}'),
	(38, 'propery', 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{}'),
	(39, 'casino', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '{}'),
	(40, 'property', 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', '{}'),
	(41, 'user_ears', 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', '{}'),
	(42, 'user_glasses', 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', '{}'),
	(43, 'user_mask', 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', '{}'),
	(44, 'user_helmet', 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', '{}'),
	(45, 'propery', 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', '{}'),
	(46, 'drugs', 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', '{}'),
	(47, 'casino', 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', '{}'),
	(48, 'property', 'char0:72e2349201e0683aa2540804c45f566df0755123', '{}'),
	(49, 'user_ears', 'char0:72e2349201e0683aa2540804c45f566df0755123', '{}'),
	(50, 'user_glasses', 'char0:72e2349201e0683aa2540804c45f566df0755123', '{}'),
	(51, 'user_helmet', 'char0:72e2349201e0683aa2540804c45f566df0755123', '{}'),
	(52, 'user_mask', 'char0:72e2349201e0683aa2540804c45f566df0755123', '{}'),
	(53, 'casino', 'char0:72e2349201e0683aa2540804c45f566df0755123', '{}'),
	(54, 'drugs', 'char0:72e2349201e0683aa2540804c45f566df0755123', '{}'),
	(55, 'propery', 'char0:72e2349201e0683aa2540804c45f566df0755123', '{}'),
	(56, 'property', 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', '{}'),
	(57, 'user_ears', 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', '{}'),
	(58, 'user_glasses', 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', '{}'),
	(59, 'drugs', 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', '{}'),
	(60, 'user_helmet', 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', '{}'),
	(61, 'propery', 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', '{}'),
	(62, 'user_mask', 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', '{}'),
	(63, 'casino', 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', '{}'),
	(64, 'property', 'char0:28a24dc4b57feb9580c57626e3c03439a900f876', '{}'),
	(65, 'user_mask', 'char0:28a24dc4b57feb9580c57626e3c03439a900f876', '{}'),
	(66, 'user_glasses', 'char0:28a24dc4b57feb9580c57626e3c03439a900f876', '{}'),
	(67, 'user_ears', 'char0:28a24dc4b57feb9580c57626e3c03439a900f876', '{}'),
	(68, 'casino', 'char0:28a24dc4b57feb9580c57626e3c03439a900f876', '{}'),
	(69, 'drugs', 'char0:28a24dc4b57feb9580c57626e3c03439a900f876', '{}'),
	(70, 'propery', 'char0:28a24dc4b57feb9580c57626e3c03439a900f876', '{}'),
	(71, 'user_helmet', 'char0:28a24dc4b57feb9580c57626e3c03439a900f876', '{}'),
	(72, 'casino', 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{}'),
	(73, 'property', 'char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', '{}'),
	(74, 'user_ears', 'char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', '{}'),
	(75, 'user_glasses', 'char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', '{}'),
	(76, 'user_mask', 'char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', '{}'),
	(77, 'user_helmet', 'char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', '{}'),
	(78, 'propery', 'char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', '{}'),
	(79, 'drugs', 'char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', '{}'),
	(80, 'casino', 'char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', '{}'),
	(81, 'property', 'char0:2c04a8506e426a0867af88aada9d2698cebb7d18', '{}'),
	(82, 'user_glasses', 'char0:2c04a8506e426a0867af88aada9d2698cebb7d18', '{}'),
	(83, 'user_ears', 'char0:2c04a8506e426a0867af88aada9d2698cebb7d18', '{}'),
	(84, 'drugs', 'char0:2c04a8506e426a0867af88aada9d2698cebb7d18', '{}'),
	(85, 'user_mask', 'char0:2c04a8506e426a0867af88aada9d2698cebb7d18', '{}'),
	(86, 'user_helmet', 'char0:2c04a8506e426a0867af88aada9d2698cebb7d18', '{}'),
	(87, 'propery', 'char0:2c04a8506e426a0867af88aada9d2698cebb7d18', '{}'),
	(88, 'casino', 'char0:2c04a8506e426a0867af88aada9d2698cebb7d18', '{}');

-- Listage de la structure de table zak. dealerships
CREATE TABLE IF NOT EXISTS `dealerships` (
  `jobName` varchar(40) NOT NULL,
  `soldVehicles` bigint(20) NOT NULL DEFAULT 0,
  `income` bigint(20) NOT NULL DEFAULT 0,
  `balance` int(11) NOT NULL DEFAULT 0,
  `contracts` longtext DEFAULT NULL,
  PRIMARY KEY (`jobName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.dealerships : ~0 rows (environ)
INSERT INTO `dealerships` (`jobName`, `soldVehicles`, `income`, `balance`, `contracts`) VALUES
	('dealership', 0, 0, 0, NULL);

-- Listage de la structure de table zak. discord_accounts
CREATE TABLE IF NOT EXISTS `discord_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(80) NOT NULL DEFAULT '0',
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.discord_accounts : ~0 rows (environ)

-- Listage de la structure de table zak. dispatch_callsigns
CREATE TABLE IF NOT EXISTS `dispatch_callsigns` (
  `identifier` varchar(46) NOT NULL,
  `callsign` varchar(50) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.dispatch_callsigns : ~0 rows (environ)

-- Listage de la structure de table zak. dispatch_cameras
CREATE TABLE IF NOT EXISTS `dispatch_cameras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `model` varchar(50) NOT NULL,
  `coords` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.dispatch_cameras : ~0 rows (environ)

-- Listage de la structure de table zak. dispatch_jail_database
CREATE TABLE IF NOT EXISTS `dispatch_jail_database` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_identifier` varchar(255) NOT NULL,
  `jail_reason` varchar(255) NOT NULL,
  `jail_time` int(11) NOT NULL,
  `jail_start` timestamp NOT NULL DEFAULT current_timestamp(),
  `jail_end` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.dispatch_jail_database : ~0 rows (environ)

-- Listage de la structure de table zak. dispatch_mdt_bolos
CREATE TABLE IF NOT EXISTS `dispatch_mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatorName` varchar(50) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `title` varchar(50) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `officers_involved` text DEFAULT NULL,
  `createdAt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.dispatch_mdt_bolos : ~0 rows (environ)

-- Listage de la structure de table zak. dispatch_mdt_convictions
CREATE TABLE IF NOT EXISTS `dispatch_mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `charges` text DEFAULT NULL,
  `warrant` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.dispatch_mdt_convictions : ~0 rows (environ)

-- Listage de la structure de table zak. dispatch_mdt_data
CREATE TABLE IF NOT EXISTS `dispatch_mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) DEFAULT NULL,
  `tags` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `notes` mediumtext DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.dispatch_mdt_data : ~0 rows (environ)

-- Listage de la structure de table zak. dispatch_mdt_incidents
CREATE TABLE IF NOT EXISTS `dispatch_mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatorName` varchar(50) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `title` varchar(50) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `citizens_involved` text DEFAULT NULL,
  `criminals_involved` text DEFAULT NULL,
  `officers_involved` text DEFAULT NULL,
  `createdAt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.dispatch_mdt_incidents : ~0 rows (environ)

-- Listage de la structure de table zak. dispatch_players_database
CREATE TABLE IF NOT EXISTS `dispatch_players_database` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` longtext NOT NULL,
  `datatype` varchar(1200) NOT NULL DEFAULT 'undefinedData',
  `dataobj` longtext NOT NULL,
  `createdAt` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.dispatch_players_database : ~0 rows (environ)

-- Listage de la structure de table zak. dispatch_vehicle_database
CREATE TABLE IF NOT EXISTS `dispatch_vehicle_database` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datatype` varchar(50) DEFAULT NULL,
  `by` varchar(50) DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `data` longtext DEFAULT NULL,
  `createdAt` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.dispatch_vehicle_database : ~0 rows (environ)

-- Listage de la structure de table zak. doj_accounts_note
CREATE TABLE IF NOT EXISTS `doj_accounts_note` (
  `account` varchar(60) NOT NULL,
  `note` longtext NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.doj_accounts_note : ~0 rows (environ)

-- Listage de la structure de table zak. doj_announcements
CREATE TABLE IF NOT EXISTS `doj_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `content` longtext NOT NULL,
  `priority` int(1) NOT NULL DEFAULT 1,
  `job` varchar(60) NOT NULL,
  `author` varchar(46) NOT NULL,
  `expire` bigint(30) NOT NULL,
  `time` bigint(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.doj_announcements : ~0 rows (environ)
INSERT INTO `doj_announcements` (`id`, `title`, `content`, `priority`, `job`, `author`, `expire`, `time`) VALUES
	(1, 'Test', 'ceci est un test', 3, 'doj', 'Zak Dev', 1764198000, 1764125308);

-- Listage de la structure de table zak. doj_citizen_profiles
CREATE TABLE IF NOT EXISTS `doj_citizen_profiles` (
  `player` varchar(60) NOT NULL,
  `picture` longtext DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `tags` longtext DEFAULT NULL,
  PRIMARY KEY (`player`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.doj_citizen_profiles : ~0 rows (environ)
INSERT INTO `doj_citizen_profiles` (`player`, `picture`, `notes`, `tags`) VALUES
	('char0:fcb47b307801e586e8c95881bdfc98004f24d031', NULL, '[{"title":"testsee","author":"Zak Dev","time":"19:50:53 - 29/11/2025","id":1,"content":"tsetsts","important":0,"expire":1764457200.0},{"author":"Zak Dev","title":"tsetse","time":"19:51:00 - 29/11/2025","id":2,"content":"tsetse","important":1,"expire":1764457200.0},{"title":"tsetse","author":"Zak Dev","time":"19:51:10 - 29/11/2025","id":3,"content":"tesssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss","important":0,"expire":1764457200.0}]', NULL);

-- Listage de la structure de table zak. doj_companies
CREATE TABLE IF NOT EXISTS `doj_companies` (
  `name` varchar(30) NOT NULL,
  `picture` longtext DEFAULT NULL,
  `invoices` longtext DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.doj_companies : ~0 rows (environ)

-- Listage de la structure de table zak. doj_courts
CREATE TABLE IF NOT EXISTS `doj_courts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `room` varchar(10) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `requireAccused` tinyint(1) NOT NULL,
  `courtTime` bigint(25) NOT NULL,
  `time` bigint(20) NOT NULL,
  `notifications` longtext DEFAULT NULL,
  `jail` int(11) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL,
  `verdict` varchar(20) DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.doj_courts : ~0 rows (environ)

-- Listage de la structure de table zak. doj_employee_profiles
CREATE TABLE IF NOT EXISTS `doj_employee_profiles` (
  `identifier` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `picture` longtext DEFAULT NULL,
  `notes` longtext NOT NULL,
  `tags` longtext DEFAULT NULL,
  `licenses` longtext DEFAULT NULL,
  `joinDate` varchar(25) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.doj_employee_profiles : ~0 rows (environ)

-- Listage de la structure de table zak. doj_inspections
CREATE TABLE IF NOT EXISTS `doj_inspections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place` varchar(50) NOT NULL,
  `representative` varchar(46) NOT NULL,
  `inspector` varchar(46) NOT NULL,
  `purpose` varchar(100) NOT NULL,
  `result` int(1) NOT NULL,
  `summary` longtext NOT NULL,
  `time` bigint(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.doj_inspections : ~0 rows (environ)

-- Listage de la structure de table zak. doj_outfits
CREATE TABLE IF NOT EXISTS `doj_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(30) NOT NULL,
  `grade` longtext NOT NULL,
  `label` varchar(60) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `license` longtext DEFAULT 'none',
  `requirements` varchar(50) NOT NULL,
  `skin` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.doj_outfits : ~0 rows (environ)

-- Listage de la structure de table zak. doj_reports
CREATE TABLE IF NOT EXISTS `doj_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant` varchar(46) NOT NULL,
  `suing` varchar(46) NOT NULL,
  `accused` varchar(46) NOT NULL,
  `prosecutor` varchar(46) DEFAULT NULL,
  `judge` varchar(46) DEFAULT NULL,
  `reason` varchar(150) NOT NULL,
  `claims` longtext NOT NULL,
  `justification` longtext NOT NULL,
  `status` varchar(30) NOT NULL,
  `rejectReason` varchar(200) DEFAULT NULL,
  `job` varchar(20) NOT NULL,
  `time` bigint(25) NOT NULL,
  `shared` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.doj_reports : ~0 rows (environ)

-- Listage de la structure de table zak. doj_society
CREATE TABLE IF NOT EXISTS `doj_society` (
  `job` varchar(30) NOT NULL,
  `balance` int(11) NOT NULL,
  `income` int(11) NOT NULL,
  `outcome` int(11) NOT NULL,
  `transactions` longtext DEFAULT NULL,
  `chart` longtext DEFAULT NULL,
  PRIMARY KEY (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.doj_society : ~0 rows (environ)
INSERT INTO `doj_society` (`job`, `balance`, `income`, `outcome`, `transactions`, `chart`) VALUES
	('doj', 500, 500, 0, '[{"type":"income","title":"Dépôt sur le compte entreprise","to":"DOJ","date":1764125318,"amount":500,"from":"Zak Dev"}]', '{"3":500}');

-- Listage de la structure de table zak. doj_vehicle_profiles
CREATE TABLE IF NOT EXISTS `doj_vehicle_profiles` (
  `plate` varchar(8) NOT NULL,
  `picture` longtext DEFAULT NULL,
  `tags` longtext DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `ownership` longtext DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.doj_vehicle_profiles : ~0 rows (environ)

-- Listage de la structure de table zak. drug_farm
CREATE TABLE IF NOT EXISTS `drug_farm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `creator` varchar(80) DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  `zone` text DEFAULT NULL,
  `maxCollectionCount` int(11) NOT NULL DEFAULT 5,
  `blip` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.drug_farm : ~0 rows (environ)

-- Listage de la structure de table zak. drug_lab_decorations
CREATE TABLE IF NOT EXISTS `drug_lab_decorations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lab` varchar(50) DEFAULT NULL,
  `creator` varchar(70) NOT NULL DEFAULT '0',
  `modelName` varchar(50) NOT NULL DEFAULT '0',
  `coords` text DEFAULT NULL,
  `rotation` text NOT NULL DEFAULT '',
  `inStash` tinyint(1) NOT NULL DEFAULT 0,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`lab`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.drug_lab_decorations : ~5 rows (environ)
INSERT INTO `drug_lab_decorations` (`id`, `lab`, `creator`, `modelName`, `coords`, `rotation`, `inStash`, `created`) VALUES
	(1, 'dqzdqzdqz', 'fcb47b307801e586e8c95881bdfc98004f24d031', 'bkr_prop_weed_table_01a', '{"x":414.8999938964844,"y":-1976.699951171875,"z":-21.10000038146972}', '{"x":0.0,"y":0.0,"z":-15.0}', 0, '2025-11-26 18:52:20'),
	(2, 'dqzdqzdqz', 'fcb47b307801e586e8c95881bdfc98004f24d031', 'apa_mp_h_stn_sofa2seat_02', '{"x":413.4637756347656,"y":-1986.288330078125,"z":-20.14669609069824}', '{"x":0.0,"y":-0.0,"z":0.0}', 0, '2025-11-26 18:53:10'),
	(3, 'dqzdqzdqz', 'fcb47b307801e586e8c95881bdfc98004f24d031', 'bkr_prop_clubhouse_sofa_01a', '{"x":414.3271789550781,"y":-1982.6431884765626,"z":-19.9189167022705}', '{"x":0.0,"y":-0.0,"z":0.0}', 0, '2025-11-26 18:53:18'),
	(4, 'dqzdqzdqz', 'fcb47b307801e586e8c95881bdfc98004f24d031', 'prop_yaught_sofa_01', '{"x":414.144775390625,"y":-1984.489013671875,"z":-21.23046493530273}', '{"x":0.0,"y":-0.0,"z":0.0}', 0, '2025-11-26 18:53:23'),
	(5, 'dqdq', 'fcb47b307801e586e8c95881bdfc98004f24d031', 'bkr_prop_weed_table_01a', '{"x":-797.2659912109375,"y":-2070.39990234375,"z":-28.5}', '{"x":0.0,"y":0.0,"z":15.0}', 0, '2025-11-26 19:07:07');

-- Listage de la structure de table zak. drug_labs
CREATE TABLE IF NOT EXISTS `drug_labs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `wardrobe` text DEFAULT NULL,
  `shell` text DEFAULT NULL,
  `blip` text DEFAULT NULL,
  `price` int(11) DEFAULT 500,
  `holders` text DEFAULT NULL,
  `locked` tinyint(2) DEFAULT 0,
  `level` int(11) DEFAULT 1,
  `progress` int(11) DEFAULT 0,
  `public` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.drug_labs : ~0 rows (environ)

-- Listage de la structure de table zak. drug_seller
CREATE TABLE IF NOT EXISTS `drug_seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `creator` varchar(50) NOT NULL DEFAULT '0',
  `blip` text DEFAULT NULL,
  `entry` text DEFAULT NULL,
  `model` varchar(50) NOT NULL,
  `time` text DEFAULT NULL,
  `knock` tinyint(1) NOT NULL DEFAULT 0,
  `itemListId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.drug_seller : ~0 rows (environ)

-- Listage de la structure de table zak. epyi_administration
CREATE TABLE IF NOT EXISTS `epyi_administration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  `date_unix` bigint(20) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `owner` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.epyi_administration : ~0 rows (environ)

-- Listage de la structure de table zak. facetime_call_history
CREATE TABLE IF NOT EXISTS `facetime_call_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caller` varchar(50) NOT NULL DEFAULT '0',
  `calledId` varchar(50) DEFAULT NULL,
  `time` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.facetime_call_history : ~5 rows (environ)
INSERT INTO `facetime_call_history` (`id`, `caller`, `calledId`, `time`) VALUES
	(1, '376142096', '376130954', '2025-11-26 13:37:35'),
	(2, '376142096', '376130954', '2025-11-26 13:38:15'),
	(3, '376130954', '376142096', '2025-11-26 13:38:21'),
	(4, '376130954', '376142096', '2025-11-26 13:38:46'),
	(5, '376142096', '376130954', '2025-11-26 13:38:50');

-- Listage de la structure de table zak. fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.fine_types : ~52 rows (environ)
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Misuse of a horn', 30, 0),
	(2, 'Illegally Crossing a continuous Line', 40, 0),
	(3, 'Driving on the wrong side of the road', 250, 0),
	(4, 'Illegal U-Turn', 250, 0),
	(5, 'Illegally Driving Off-road', 170, 0),
	(6, 'Refusing a Lawful Command', 30, 0),
	(7, 'Illegally Stopping a Vehicle', 150, 0),
	(8, 'Illegal Parking', 70, 0),
	(9, 'Failing to Yield to the right', 70, 0),
	(10, 'Failure to comply with Vehicle Information', 90, 0),
	(11, 'Failing to stop at a Stop Sign ', 105, 0),
	(12, 'Failing to stop at a Red Light', 130, 0),
	(13, 'Illegal Passing', 100, 0),
	(14, 'Driving an illegal Vehicle', 100, 0),
	(15, 'Driving without a License', 1500, 0),
	(16, 'Hit and Run', 800, 0),
	(17, 'Exceeding Speeds Over < 5 mph', 90, 0),
	(18, 'Exceeding Speeds Over 5-15 mph', 120, 0),
	(19, 'Exceeding Speeds Over 15-30 mph', 180, 0),
	(20, 'Exceeding Speeds Over > 30 mph', 300, 0),
	(21, 'Impeding traffic flow', 110, 1),
	(22, 'Public Intoxication', 90, 1),
	(23, 'Disorderly conduct', 90, 1),
	(24, 'Obstruction of Justice', 130, 1),
	(25, 'Insults towards Civilans', 75, 1),
	(26, 'Disrespecting of an LEO', 110, 1),
	(27, 'Verbal Threat towards a Civilan', 90, 1),
	(28, 'Verbal Threat towards an LEO', 150, 1),
	(29, 'Providing False Information', 250, 1),
	(30, 'Attempt of Corruption', 1500, 1),
	(31, 'Brandishing a weapon in city Limits', 120, 2),
	(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
	(33, 'No Firearms License', 600, 2),
	(34, 'Possession of an Illegal Weapon', 700, 2),
	(35, 'Possession of Burglary Tools', 300, 2),
	(36, 'Grand Theft Auto', 1800, 2),
	(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
	(38, 'Frabrication of an Illegal Substance', 1500, 2),
	(39, 'Possession of an Illegal Substance ', 650, 2),
	(40, 'Kidnapping of a Civilan', 1500, 2),
	(41, 'Kidnapping of an LEO', 2000, 2),
	(42, 'Robbery', 650, 2),
	(43, 'Armed Robbery of a Store', 650, 2),
	(44, 'Armed Robbery of a Bank', 1500, 2),
	(45, 'Assault on a Civilian', 2000, 3),
	(46, 'Assault of an LEO', 2500, 3),
	(47, 'Attempt of Murder of a Civilian', 3000, 3),
	(48, 'Attempt of Murder of an LEO', 5000, 3),
	(49, 'Murder of a Civilian', 10000, 3),
	(50, 'Murder of an LEO', 30000, 3),
	(51, 'Involuntary manslaughter', 1800, 3),
	(52, 'Fraud', 2000, 2);

-- Listage de la structure de table zak. fishing_simulator_available_contracts
CREATE TABLE IF NOT EXISTS `fishing_simulator_available_contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `required_items` varchar(255) NOT NULL,
  `money_reward` int(11) DEFAULT NULL,
  `item_reward` varchar(255) DEFAULT NULL,
  `delivery_location` varchar(255) NOT NULL DEFAULT '',
  `progress` varchar(50) DEFAULT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.fishing_simulator_available_contracts : ~8 rows (environ)
INSERT INTO `fishing_simulator_available_contracts` (`id`, `name`, `description`, `image`, `required_items`, `money_reward`, `item_reward`, `delivery_location`, `progress`, `timestamp`) VALUES
	(6228, 'Marché aux poissons gastronomique', 'Un marché haut de gamme recherche du poisson de première qualité. Exécutez leur commande pour un paiement généreux.', 'images/deliveries/gourmet_market.png', '[{"display_name":"Sockeye Salmon","amount":2,"name":"sockeye_salmon"},{"display_name":"European Sea Sturgeon","amount":1,"name":"european_sea_sturgeon"}]', 4144, NULL, '[-33.3,6455.87,31.48]', NULL, 1765214470),
	(6229, 'Stock d\'aquarium exotique', 'Un aquarium exotique cherche à ajouter des espèces rares à sa collection. Pouvez-vous les fournir ?', 'images/deliveries/exotic_aquarium.png', '[{"display_name":"Pufferfish","amount":2,"name":"pufferfish"},{"display_name":"Electric Eel","amount":1,"name":"electric_eel"}]', 5996, NULL, '[-1024.49,-1139.6,2.75]', NULL, 1765214590),
	(6230, 'Recherche de spécimens', 'Les chercheurs marins ont besoin d’espèces de poissons spécifiques pour des études environnementales importantes.', 'images/deliveries/research_specimens.png', '[{"display_name":"Coho Salmon","amount":3,"name":"coho_salmon"},{"display_name":"European Eel","amount":2,"name":"european_eel"},{"display_name":"Giant Freshwater Stingray","amount":1,"name":"giant_freshwater_stingray"}]', 5654, NULL, '[474.27,-635.05,25.65]', NULL, 1765214710),
	(6231, 'Marché aux poissons gastronomique', 'Un marché haut de gamme recherche du poisson de première qualité. Exécutez leur commande pour un paiement généreux.', 'images/deliveries/gourmet_market.png', '[{"display_name":"Sockeye Salmon","amount":2,"name":"sockeye_salmon"},{"display_name":"European Sea Sturgeon","amount":1,"name":"european_sea_sturgeon"}]', 4259, NULL, '[-329.63,6150.58,32.32]', NULL, 1765214830),
	(6232, 'Marchand de poissons rares', 'Un collectionneur est en ville à la recherche d\'espèces rares. Livrez-les et gagnez gros !', 'images/deliveries/rare_fish_trader.png', '[{"display_name":"Pufferfish","amount":1,"name":"pufferfish"},{"display_name":"Beluga Sturgeon","amount":1,"name":"beluga_sturgeon"}]', 4501, NULL, '[-347.15,6224.69,31.7]', NULL, 1765214950),
	(6233, 'Cours de cuisine communautaire', 'Un centre communautaire organise un cours de cuisine et a besoin de poissons locaux communs pour enseigner les techniques de nettoyage et de cuisson appropriées..', 'images/deliveries/cooking_class.png', '[{"display_name":"Yellow Perch","amount":4,"name":"yellow_perch"},{"display_name":"Prussian Carp","amount":3,"name":"prussian_carp"},{"display_name":"Tench","amount":2,"name":"tench"}]', 101, NULL, '[-347.15,6224.69,31.7]', NULL, 1765215070),
	(6234, 'Exposition d\'aquariums', 'Un aquarium cherche à agrandir son exposition. Offrez ces poissons contre une récompense.', 'images/deliveries/aquarium_exhibit.png', '[{"display_name":"Tiger Shark","amount":1,"name":"tiger_shark"},{"display_name":"Mahi-Mahi","amount":2,"name":"mahi_mahi"}]', 5658, NULL, '[175.03,6643.14,31.57]', NULL, 1765215190),
	(6235, 'Exposition d\'aquariums', 'Un aquarium cherche à agrandir son exposition. Offrez ces poissons contre une récompense.', 'images/deliveries/aquarium_exhibit.png', '[{"display_name":"Tiger Shark","amount":1,"name":"tiger_shark"},{"display_name":"Mahi-Mahi","amount":2,"name":"mahi_mahi"}]', 5661, NULL, '[1691.4,3866.21,34.91]', NULL, 1765215310);

-- Listage de la structure de table zak. fishing_simulator_available_dives
CREATE TABLE IF NOT EXISTS `fishing_simulator_available_dives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `money_reward` int(11) DEFAULT NULL,
  `item_reward` varchar(255) DEFAULT NULL,
  `dive_location` varchar(255) NOT NULL DEFAULT '',
  `progress` varchar(50) DEFAULT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.fishing_simulator_available_dives : ~8 rows (environ)
INSERT INTO `fishing_simulator_available_dives` (`id`, `name`, `description`, `image`, `money_reward`, `item_reward`, `dive_location`, `progress`, `timestamp`) VALUES
	(6228, 'Relique de la guerre froide', 'Récupérer le matériel d\'espionnage perdu dans un sous-marin coulé de la guerre froide.', 'images/dives/cold_war_relic.png', NULL, '{"item":"spy_gadget","display_name":"Spy Gadget","amount":1}', '[-142.02,4203.83,26.72]', NULL, 1765214470),
	(6229, 'Armada engloutie', 'Plongez dans les vestiges d\'une flotte légendaire perdue lors d\'une énorme tempête. Récupérer les artefacts!', 'images/dives/sunken_armada.png', NULL, '{"item":"antique_compass","display_name":"Antique Compass","amount":1}', '[214.58,3920.34,7.83]', NULL, 1765214590),
	(6230, 'Opération de sauvetage en haute mer', 'Récupérez une précieuse cargaison d\'un cargo coulé au fond de l\'océan.', 'images/dives/deep_sea_salvage.png', 2427, NULL, '[-1899.371,-1301.6575,-38.6908]', NULL, 1765214710),
	(6231, 'Épave du Titan', 'Le Titan, un yacht de luxe coulé dans des circonstances mystérieuses, serait rempli de richesses.', 'images/dives/wreck_titan.png', NULL, '{"item":"luxury_watch","display_name":"Luxury Watch","amount":2}', '[3224.5,1208.6,-63.83]', NULL, 1765214830),
	(6232, 'Relique de la guerre froide', 'Récupérer le matériel d\'espionnage perdu dans un sous-marin coulé de la guerre froide.', 'images/dives/cold_war_relic.png', NULL, '{"item":"spy_gadget","display_name":"Spy Gadget","amount":1}', '[1846.83,4199.49,-7.68]', NULL, 1765214950),
	(6233, 'Le yacht coulé du magnat du pétrole', 'Le yacht d\'un milliardaire a coulé dans des circonstances mystérieuses. Récupérez tous les objets de valeur que vous trouvez.', 'images/dives/sunken_yacht.png', 2798, NULL, '[-3432.79,-61.34,-47.35]', NULL, 1765215070),
	(6234, 'Joyau perdu de l\'Atlantide', 'À la recherche du légendaire joyau perdu qui se trouverait au large des côtes, gardé par les mystères de la mer.', 'images/dives/lost_jewel_atlantis.png', 2101, NULL, '[-2207.79,-914.72,-76.89]', NULL, 1765215190),
	(6235, 'Découverte des cheminées volcaniques', 'Explorez des cheminées volcaniques en haute mer regorgeant de formes de vie uniques et collectez des échantillons à étudier.', 'images/dives/volcanic_vents.png', 1927, NULL, '[4012.76,4817.33,-43.43]', NULL, 1765215310);

-- Listage de la structure de table zak. fishing_simulator_fishes_caught
CREATE TABLE IF NOT EXISTS `fishing_simulator_fishes_caught` (
  `user_id` varchar(50) NOT NULL,
  `fish_rarity` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`fish_rarity`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.fishing_simulator_fishes_caught : ~3 rows (environ)
INSERT INTO `fishing_simulator_fishes_caught` (`user_id`, `fish_rarity`, `amount`) VALUES
	('char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 'common', 116),
	('char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 'uncommon', 9),
	('char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'common', 1);

-- Listage de la structure de table zak. fishing_simulator_loans
CREATE TABLE IF NOT EXISTS `fishing_simulator_loans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `loan` int(10) unsigned NOT NULL DEFAULT 0,
  `remaining_amount` int(10) unsigned NOT NULL DEFAULT 0,
  `day_cost` int(10) unsigned NOT NULL DEFAULT 0,
  `taxes_on_day` int(10) unsigned NOT NULL DEFAULT 0,
  `timer` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.fishing_simulator_loans : ~0 rows (environ)

-- Listage de la structure de table zak. fishing_simulator_properties
CREATE TABLE IF NOT EXISTS `fishing_simulator_properties` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `property` varchar(80) NOT NULL,
  `stock` longtext NOT NULL,
  `property_condition` int(11) unsigned NOT NULL DEFAULT 100,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fishing_simulator_vehicle` (`user_id`,`property`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.fishing_simulator_properties : ~0 rows (environ)

-- Listage de la structure de table zak. fishing_simulator_tournaments
CREATE TABLE IF NOT EXISTS `fishing_simulator_tournaments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `notified` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `timestamp` (`timestamp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.fishing_simulator_tournaments : ~5 rows (environ)
INSERT INTO `fishing_simulator_tournaments` (`id`, `location`, `timestamp`, `notified`) VALUES
	(1, '[-1588.18,5208.35,4.06]', 1764534600, 1),
	(2, '[-2477.66,4243.59,1.39]', 1764707400, 1),
	(3, '[714.21,4146.69,35.78]', 1764880200, 1),
	(4, '[-2082.54,2614.12,3.08]', 1765139400, 1),
	(5, '[-2082.54,2614.12,3.08]', 1765225800, 0);

-- Listage de la structure de table zak. fishing_simulator_tournaments_users
CREATE TABLE IF NOT EXISTS `fishing_simulator_tournaments_users` (
  `user_id` varchar(50) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  `catches` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`tournament_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.fishing_simulator_tournaments_users : ~0 rows (environ)

-- Listage de la structure de table zak. fishing_simulator_users
CREATE TABLE IF NOT EXISTS `fishing_simulator_users` (
  `user_id` varchar(50) NOT NULL,
  `boats_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `vehicles_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `properties_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `sea_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `lake_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `river_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `swamp_upgrade` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `money` double NOT NULL DEFAULT 0,
  `exp` int(11) NOT NULL DEFAULT 0,
  `skill_points` int(11) NOT NULL DEFAULT 0,
  `total_money_earned` double unsigned NOT NULL DEFAULT 0,
  `total_money_spent` double unsigned NOT NULL DEFAULT 0,
  `total_dives` int(10) unsigned NOT NULL DEFAULT 0,
  `total_deliveries` int(10) unsigned NOT NULL DEFAULT 0,
  `loan_notify` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `dark_theme` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.fishing_simulator_users : ~5 rows (environ)
INSERT INTO `fishing_simulator_users` (`user_id`, `boats_upgrade`, `vehicles_upgrade`, `properties_upgrade`, `sea_upgrade`, `lake_upgrade`, `river_upgrade`, `swamp_upgrade`, `money`, `exp`, `skill_points`, `total_money_earned`, `total_money_spent`, `total_dives`, `total_deliveries`, `loan_notify`, `dark_theme`) VALUES
	('char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 0, 0, 0, 0, 0, 0, 0, 2940, 0, 0, 0, 2060, 0, 0, 0, 1),
	('char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 0, 0, 0, 0, 0, 0, 0, 15640, 0, 0, 0, 4360, 0, 0, 0, 1),
	('char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 0, 0, 0, 0, 0, 0, 0, 497650, 0, 0, 0, 2350, 2, 0, 0, 1),
	('char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 0, 0, 0, 0, 0, 0, 0, 1925, 6700, 6, 74853, 33075, 1, 0, 0, 1),
	('char0:fcb47b307801e586e8c95881bdfc98004f24d031', 0, 0, 0, 0, 0, 0, 0, 47650, 50, 0, 0, 2350, 0, 0, 0, 1);

-- Listage de la structure de table zak. fishing_simulator_vehicles
CREATE TABLE IF NOT EXISTS `fishing_simulator_vehicles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `vehicle` varchar(50) NOT NULL,
  `properties` longtext NOT NULL,
  `traveled_distance` int(11) unsigned NOT NULL DEFAULT 0,
  `health` int(11) unsigned NOT NULL DEFAULT 1000,
  `fuel` int(11) unsigned NOT NULL DEFAULT 100,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fishing_simulator_vehicle` (`user_id`,`vehicle`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.fishing_simulator_vehicles : ~1 rows (environ)
INSERT INTO `fishing_simulator_vehicles` (`id`, `user_id`, `vehicle`, `properties`, `traveled_distance`, `health`, `fuel`, `type`) VALUES
	(1, 'char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 'dinghy2', '{"neonColor":[255,0,255],"bodyHealth":403,"modTank":-1,"modFrontWheels":-1,"wheels":0,"wheelSize":0.0,"modTrunk":-1,"modFrame":-1,"modRoof":-1,"modBackWheels":-1,"modDashboard":-1,"modAerials":-1,"modExhaust":-1,"modPlateHolder":-1,"tyres":[],"modLightbar":-1,"bulletProofTyres":1,"tyreSmokeColor":[255,255,255],"modCustomTiresR":false,"xenonColor":255,"model":276773164,"modSideSkirt":-1,"modStruts":-1,"modSubwoofer":-1,"modTrimA":-1,"modXenon":false,"plate":"FS950703","modTurbo":false,"dirtLevel":0,"modSpeakers":-1,"modTransmission":-1,"neonEnabled":[false,false,false,false],"modEngineBlock":-1,"modOrnaments":-1,"modSuspension":-1,"modBrakes":-1,"modSteeringWheel":-1,"modVanityPlate":-1,"dashboardColor":0,"modDoorR":-1,"fuelLevel":99,"pearlescentColor":8,"modRoofLivery":-1,"oilLevel":3,"modNitrous":-1,"modHydraulics":false,"windows":[0,1,2,3,4,5,7],"modShifterLeavers":-1,"wheelColor":156,"extras":[1,1,0],"modAPlate":-1,"modRightFender":-1,"modFender":-1,"doors":[],"modSmokeEnabled":false,"wheelWidth":0.0,"modArmor":-1,"modLivery":-1,"modSpoilers":-1,"modAirFilter":-1,"modWindows":-1,"engineHealth":403,"modEngine":-1,"modDial":-1,"color1":0,"tankHealth":1000,"plateIndex":4,"modRearBumper":-1,"modArchCover":-1,"modFrontBumper":-1,"modCustomTiresF":false,"modTrimB":-1,"modHorns":-1,"windowTint":-1,"modGrille":-1,"interiorColor":0,"modHydrolic":-1,"color2":0,"modSeats":-1,"driftTyres":false,"modDoorSpeaker":-1,"modHood":-1}', 1145, 403, 99, 'boat');

-- Listage de la structure de table zak. fuel_stations
CREATE TABLE IF NOT EXISTS `fuel_stations` (
  `id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT 100,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table zak.fuel_stations : ~0 rows (environ)

-- Listage de la structure de table zak. gmt_announcements
CREATE TABLE IF NOT EXISTS `gmt_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `creator` varchar(46) NOT NULL,
  `time` bigint(25) NOT NULL,
  `job` varchar(20) NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gmt_announcements : ~0 rows (environ)

-- Listage de la structure de table zak. gmt_citizens_allergies
CREATE TABLE IF NOT EXISTS `gmt_citizens_allergies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(46) NOT NULL,
  `officer` varchar(46) NOT NULL,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  `time` bigint(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gmt_citizens_allergies : ~0 rows (environ)

-- Listage de la structure de table zak. gmt_citizens_notes
CREATE TABLE IF NOT EXISTS `gmt_citizens_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(46) NOT NULL,
  `officer` varchar(46) NOT NULL,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  `time` bigint(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gmt_citizens_notes : ~0 rows (environ)

-- Listage de la structure de table zak. gmt_citizens_procedures
CREATE TABLE IF NOT EXISTS `gmt_citizens_procedures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(46) NOT NULL,
  `officer` varchar(46) NOT NULL,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  `time` bigint(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gmt_citizens_procedures : ~0 rows (environ)

-- Listage de la structure de table zak. gmt_documents
CREATE TABLE IF NOT EXISTS `gmt_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(46) NOT NULL,
  `officer` varchar(46) NOT NULL,
  `type` varchar(40) NOT NULL,
  `label` varchar(120) NOT NULL,
  `time` bigint(25) NOT NULL,
  `job` varchar(30) NOT NULL,
  `expireTime` bigint(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gmt_documents : ~0 rows (environ)

-- Listage de la structure de table zak. gmt_licenses
CREATE TABLE IF NOT EXISTS `gmt_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(46) NOT NULL,
  `type` varchar(20) NOT NULL,
  `label` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gmt_licenses : ~0 rows (environ)

-- Listage de la structure de table zak. gmt_workers_notes
CREATE TABLE IF NOT EXISTS `gmt_workers_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(46) NOT NULL,
  `officer` varchar(46) NOT NULL,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `time` bigint(25) NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gmt_workers_notes : ~0 rows (environ)

-- Listage de la structure de table zak. gpt_announcements
CREATE TABLE IF NOT EXISTS `gpt_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `creator` varchar(46) NOT NULL,
  `time` bigint(25) NOT NULL,
  `job` varchar(20) NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gpt_announcements : ~0 rows (environ)

-- Listage de la structure de table zak. gpt_cases
CREATE TABLE IF NOT EXISTS `gpt_cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `creator` varchar(46) NOT NULL,
  `create_time` bigint(25) NOT NULL,
  `edit_time` bigint(25) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `description` longtext NOT NULL,
  `citizens` longtext NOT NULL,
  `officers` longtext NOT NULL,
  `vehicles` longtext NOT NULL,
  `attachments` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gpt_cases : ~9 rows (environ)
INSERT INTO `gpt_cases` (`id`, `title`, `creator`, `create_time`, `edit_time`, `status`, `description`, `citizens`, `officers`, `vehicles`, `attachments`) VALUES
	(1, 'dqdqgdgqs', 'fcb47b307801e586e8c95881bdfc98004f24d031', 1764128015, 1764128024, 1, 'dqdqdqgdgdgdrgdgdrgdr', '[]', '[]', '[]', '[]'),
	(2, 'fsfse', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 1764808712, 1764808712, 0, 'fsefseffsfsefsefseeeeeeeeeeeeeeeeeeee', '[]', '[]', '[]', '[]'),
	(3, 'fsfse', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 1764808713, 1764808713, 0, 'fsefseffsfsefsefseeeeeeeeeeeeeeeeeeee', '[]', '[]', '[]', '[]'),
	(4, 'fsfse', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 1764808722, 1764808722, 0, 'fsefseffsfsefsefseeeeeeeeeeeeeeeeeeee', '[]', '[]', '[]', '[]'),
	(5, 'fsfsesASAsA', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 1764808724, 1764808724, 0, 'fsefseffsfsefsefseeeeeeeeeeeeeeeeeeee', '[]', '[]', '[]', '[]'),
	(6, 'fsfsesASAsA', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 1764808724, 1764808724, 0, 'fsefseffsfsefsefseeeeeeeeeeeeeeeeeeee', '[]', '[]', '[]', '[]'),
	(7, 'fsfsesASAsA', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 1764808725, 1764808725, 0, 'fsefseffsfsefsefseeeeeeeeeeeeeeeeeeee', '[]', '[]', '[]', '[]'),
	(8, 'fsfsesASAsA', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 1764808727, 1764808727, 0, 'fsefseffsfsefsefseeeeeeeeeeeeeeeeeeee', '[]', '[]', '[]', '[]'),
	(9, 'fsfsesASAsAdqzdqdqdzq', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 1764808730, 1764808730, 0, 'fsefseffsfsefsefseeeeeeeeeeeeeeeeeeee', '[]', '[]', '[]', '[]'),
	(10, 'fsfsesASAsAdqzdqdqdzq', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 1764808735, 1764808735, 0, 'fsefseffsfsefsefseeeeeeeeeeeeeeeeeeeedqzdqzzzzzzzzzzzzzzzds dqsdqdqsdqzdq', '[]', '[]', '[]', '[]');

-- Listage de la structure de table zak. gpt_citizens_notes
CREATE TABLE IF NOT EXISTS `gpt_citizens_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(46) NOT NULL,
  `officer` varchar(46) NOT NULL,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  `time` bigint(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gpt_citizens_notes : ~0 rows (environ)

-- Listage de la structure de table zak. gpt_citizens_wanted
CREATE TABLE IF NOT EXISTS `gpt_citizens_wanted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(46) NOT NULL,
  `officer` varchar(46) NOT NULL,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  `expire` bigint(25) NOT NULL,
  `time` bigint(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gpt_citizens_wanted : ~0 rows (environ)

-- Listage de la structure de table zak. gpt_confiscates
CREATE TABLE IF NOT EXISTS `gpt_confiscates` (
  `vin` varchar(25) NOT NULL,
  `reason` longtext NOT NULL,
  `price` int(11) NOT NULL,
  `expire` bigint(25) NOT NULL,
  PRIMARY KEY (`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gpt_confiscates : ~0 rows (environ)

-- Listage de la structure de table zak. gpt_evidences
CREATE TABLE IF NOT EXISTS `gpt_evidences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `data` longtext NOT NULL,
  `serial` varchar(46) NOT NULL,
  `time` bigint(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gpt_evidences : ~0 rows (environ)

-- Listage de la structure de table zak. gpt_licenses
CREATE TABLE IF NOT EXISTS `gpt_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(46) NOT NULL,
  `type` varchar(20) NOT NULL,
  `label` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gpt_licenses : ~0 rows (environ)

-- Listage de la structure de table zak. gpt_vehicles_notes
CREATE TABLE IF NOT EXISTS `gpt_vehicles_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `officer` varchar(46) NOT NULL,
  `vin` varchar(20) NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  `time` bigint(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gpt_vehicles_notes : ~0 rows (environ)

-- Listage de la structure de table zak. gpt_vehicles_wanted
CREATE TABLE IF NOT EXISTS `gpt_vehicles_wanted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `officer` varchar(46) NOT NULL,
  `text` longtext NOT NULL,
  `vin` varchar(20) NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  `expire` bigint(25) NOT NULL,
  `time` bigint(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gpt_vehicles_wanted : ~0 rows (environ)

-- Listage de la structure de table zak. gpt_weapons
CREATE TABLE IF NOT EXISTS `gpt_weapons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(40) NOT NULL,
  `owner` varchar(46) NOT NULL,
  `serial` varchar(25) NOT NULL,
  `time` bigint(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gpt_weapons : ~0 rows (environ)

-- Listage de la structure de table zak. gpt_workers_notes
CREATE TABLE IF NOT EXISTS `gpt_workers_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(46) NOT NULL,
  `officer` varchar(46) NOT NULL,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `time` bigint(25) NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.gpt_workers_notes : ~0 rows (environ)

-- Listage de la structure de table zak. gym_data
CREATE TABLE IF NOT EXISTS `gym_data` (
  `citizenid` varchar(255) NOT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.gym_data : ~0 rows (environ)
INSERT INTO `gym_data` (`citizenid`, `data`) VALUES
	('fcb47b307801e586e8c95881bdfc98004f24d031', '{"membership":true,"membershipExpiry":1766860974,"strength":0,"stamina":0}');

-- Listage de la structure de table zak. health_insurances
CREATE TABLE IF NOT EXISTS `health_insurances` (
  `owner` varchar(60) NOT NULL,
  `insurance` varchar(30) NOT NULL,
  `duration` bigint(30) NOT NULL,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.health_insurances : ~3 rows (environ)
INSERT INTO `health_insurances` (`owner`, `insurance`, `duration`) VALUES
	('char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 'premium', 1767119575),
	('char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'basic', 1765813487),
	('e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'premium', 1766870671);

-- Listage de la structure de table zak. house_bills
CREATE TABLE IF NOT EXISTS `house_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house` varchar(100) NOT NULL,
  `payed_by` varchar(80) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `breakdown` longtext NOT NULL,
  `payed` tinyint(1) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_house_payed_by` (`house`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.house_bills : ~60 rows (environ)
INSERT INTO `house_bills` (`id`, `house`, `payed_by`, `total`, `breakdown`, `payed`, `date`) VALUES
	(1, '123-apt-1', NULL, 530, '{"electricity":182,"internet":268,"water":80}', 0, '2025-12-01 21:22:51'),
	(2, '123-apt-1', NULL, 431, '{"internet":130,"water":123,"electricity":178}', 0, '2025-12-02 00:05:10'),
	(3, '123-apt-1', NULL, 407, '{"internet":263,"water":35,"electricity":109}', 0, '2025-12-02 01:05:10'),
	(4, '123-apt-1', NULL, 369, '{"internet":81,"water":139,"electricity":149}', 0, '2025-12-02 02:05:10'),
	(5, '123-apt-1', NULL, 455, '{"internet":204,"water":138,"electricity":113}', 0, '2025-12-02 03:05:11'),
	(6, '123-apt-1', NULL, 376, '{"internet":112,"water":102,"electricity":162}', 0, '2025-12-02 04:05:11'),
	(7, '123-apt-1', NULL, 402, '{"internet":114,"water":104,"electricity":184}', 0, '2025-12-02 05:05:11'),
	(8, '123-apt-1', NULL, 252, '{"internet":93,"water":80,"electricity":79}', 0, '2025-12-02 06:05:11'),
	(9, '123-apt-1', NULL, 206, '{"internet":104,"water":38,"electricity":64}', 0, '2025-12-02 07:05:11'),
	(10, '123-apt-1', NULL, 338, '{"internet":110,"water":114,"electricity":114}', 0, '2025-12-02 08:05:11'),
	(11, '123-apt-1', NULL, 437, '{"internet":252,"water":129,"electricity":56}', 0, '2025-12-02 09:05:11'),
	(12, '123-apt-1', NULL, 376, '{"internet":149,"water":31,"electricity":196}', 0, '2025-12-02 10:05:11'),
	(13, '123-apt-1', NULL, 266, '{"internet":109,"water":80,"electricity":77}', 0, '2025-12-02 11:05:12'),
	(14, '123-apt-1', NULL, 404, '{"internet":157,"water":135,"electricity":112}', 0, '2025-12-02 12:05:12'),
	(15, '123-apt-1', NULL, 454, '{"water":102,"internet":296,"electricity":56}', 0, '2025-12-02 13:08:03'),
	(16, '123-apt-1', NULL, 426, '{"water":97,"internet":268,"electricity":61}', 0, '2025-12-02 14:08:03'),
	(17, '123-apt-1', NULL, 425, '{"water":114,"internet":171,"electricity":140}', 0, '2025-12-02 15:08:03'),
	(18, '123-apt-1', NULL, 576, '{"water":110,"internet":284,"electricity":182}', 0, '2025-12-02 16:08:03'),
	(19, '123-apt-1', NULL, 474, '{"electricity":79,"water":149,"internet":246}', 0, '2025-12-02 18:08:13'),
	(20, '123-apt-1', NULL, 296, '{"electricity":127,"water":89,"internet":80}', 0, '2025-12-02 19:08:13'),
	(21, '123-apt-1', NULL, 528, '{"electricity":178,"internet":258,"water":92}', 0, '2025-12-02 20:51:48'),
	(22, '123-apt-1', NULL, 394, '{"electricity":87,"internet":276,"water":31}', 0, '2025-12-02 21:51:48'),
	(23, '123-apt-1', NULL, 589, '{"electricity":184,"internet":290,"water":115}', 0, '2025-12-02 22:51:49'),
	(24, '123-apt-1', NULL, 253, '{"electricity":75,"internet":122,"water":56}', 0, '2025-12-02 23:51:49'),
	(25, '123-apt-1', NULL, 542, '{"electricity":176,"internet":264,"water":102}', 0, '2025-12-03 00:51:49'),
	(26, '123-apt-1', NULL, 480, '{"electricity":169,"internet":196,"water":115}', 0, '2025-12-03 01:51:49'),
	(27, '123-apt-1', NULL, 477, '{"electricity":139,"internet":214,"water":124}', 0, '2025-12-03 02:51:49'),
	(28, '123-apt-1', NULL, 426, '{"electricity":156,"internet":125,"water":145}', 0, '2025-12-03 03:51:49'),
	(29, '123-apt-1', NULL, 444, '{"electricity":54,"internet":264,"water":126}', 0, '2025-12-03 04:51:49'),
	(30, '123-apt-1', NULL, 469, '{"electricity":180,"internet":168,"water":121}', 0, '2025-12-03 05:51:50'),
	(31, '123-apt-1', NULL, 374, '{"electricity":105,"internet":176,"water":93}', 0, '2025-12-03 06:51:50'),
	(32, '123-apt-1', NULL, 599, '{"electricity":184,"internet":266,"water":149}', 0, '2025-12-03 07:51:50'),
	(33, '123-apt-1', NULL, 402, '{"electricity":176,"internet":179,"water":47}', 0, '2025-12-03 08:51:50'),
	(34, '123-apt-1', NULL, 398, '{"electricity":50,"internet":238,"water":110}', 0, '2025-12-03 09:51:50'),
	(35, '123-apt-1', NULL, 432, '{"electricity":92,"internet":258,"water":82}', 0, '2025-12-03 10:51:50'),
	(36, '123-apt-1', NULL, 443, '{"electricity":86,"internet":218,"water":139}', 0, '2025-12-03 11:51:50'),
	(37, '123-apt-1', NULL, 452, '{"electricity":105,"internet":221,"water":126}', 0, '2025-12-03 12:51:50'),
	(38, '123-apt-1', NULL, 459, '{"electricity":102,"internet":260,"water":97}', 0, '2025-12-03 13:51:51'),
	(39, '123-apt-1', NULL, 311, '{"electricity":122,"internet":101,"water":88}', 0, '2025-12-03 14:51:51'),
	(40, '123-apt-1', NULL, 341, '{"electricity":149,"internet":103,"water":89}', 0, '2025-12-03 15:51:51'),
	(41, '123-apt-1', NULL, 524, '{"electricity":175,"internet":289,"water":60}', 0, '2025-12-03 16:51:51'),
	(42, '123-apt-1', NULL, 404, '{"internet":124,"electricity":181,"water":99}', 0, '2025-12-03 18:08:55'),
	(43, '123-apt-1', NULL, 358, '{"internet":138,"electricity":137,"water":83}', 0, '2025-12-03 19:08:55'),
	(44, '123-apt-1', NULL, 438, '{"water":139,"electricity":159,"internet":140}', 0, '2025-12-03 20:17:32'),
	(45, '123-apt-1', NULL, 364, '{"water":83,"electricity":170,"internet":111}', 0, '2025-12-03 21:17:33'),
	(46, '123-apt-1', NULL, 369, '{"internet":157,"electricity":63,"water":149}', 0, '2025-12-03 23:17:02'),
	(47, '123-apt-1', NULL, 477, '{"water":72,"internet":254,"electricity":151}', 0, '2025-12-04 01:23:57'),
	(48, 'dqzdzq', NULL, 502, '{"water":135,"internet":193,"electricity":174}', 0, '2025-12-04 01:23:57'),
	(49, '123-apt-1', NULL, 261, '{"water":60,"internet":140,"electricity":61}', 0, '2025-12-04 02:23:57'),
	(50, 'dqzdzq', NULL, 490, '{"water":100,"internet":273,"electricity":117}', 0, '2025-12-04 02:23:57'),
	(51, '123-apt-1', NULL, 428, '{"water":61,"internet":174,"electricity":193}', 0, '2025-12-04 03:23:57'),
	(52, 'dqzdzq', NULL, 400, '{"water":63,"internet":137,"electricity":200}', 0, '2025-12-04 03:23:57'),
	(53, '123-apt-1', NULL, 320, '{"water":74,"internet":114,"electricity":132}', 0, '2025-12-04 04:23:57'),
	(54, 'dqzdzq', NULL, 462, '{"water":138,"internet":186,"electricity":138}', 0, '2025-12-04 04:23:57'),
	(55, '123-apt-1', NULL, 350, '{"water":106,"internet":184,"electricity":60}', 0, '2025-12-04 05:23:57'),
	(56, 'dqzdzq', NULL, 516, '{"water":95,"internet":273,"electricity":148}', 0, '2025-12-04 05:23:57'),
	(57, '123-apt-1', NULL, 433, '{"water":63,"internet":239,"electricity":131}', 0, '2025-12-04 06:23:57'),
	(58, 'dqzdzq', NULL, 409, '{"water":119,"internet":183,"electricity":107}', 0, '2025-12-04 06:23:57'),
	(59, '123-apt-1', NULL, 414, '{"water":56,"internet":291,"electricity":67}', 0, '2025-12-04 07:23:58'),
	(60, 'dqzdzq', NULL, 461, '{"water":71,"internet":199,"electricity":191}', 0, '2025-12-04 07:23:58'),
	(61, '123-apt-1', NULL, 275, '{"water":118,"internet":102,"electricity":55}', 0, '2025-12-04 08:23:58'),
	(62, 'dqzdzq', NULL, 502, '{"water":92,"internet":224,"electricity":186}', 0, '2025-12-04 08:23:58'),
	(63, 'blanchisserie', NULL, 396, '{"water":63,"electricity":112,"internet":221}', 0, '2025-12-04 10:36:38');

-- Listage de la structure de table zak. house_decorations
CREATE TABLE IF NOT EXISTS `house_decorations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `house` varchar(50) DEFAULT NULL,
  `creator` varchar(70) NOT NULL DEFAULT '0',
  `modelName` varchar(50) NOT NULL DEFAULT '0',
  `coords` text DEFAULT NULL,
  `rotation` text NOT NULL DEFAULT '',
  `inStash` tinyint(1) NOT NULL DEFAULT 0,
  `inHouse` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `uniq` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `lightData` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`house`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.house_decorations : ~0 rows (environ)

-- Listage de la structure de table zak. house_objects
CREATE TABLE IF NOT EXISTS `house_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) NOT NULL DEFAULT '0',
  `coords` text NOT NULL,
  `house` varchar(80) DEFAULT NULL,
  `construction` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table zak.house_objects : ~0 rows (environ)

-- Listage de la structure de table zak. house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB AUTO_INCREMENT=7123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.house_plants : ~0 rows (environ)

-- Listage de la structure de table zak. house_rents
CREATE TABLE IF NOT EXISTS `house_rents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL DEFAULT '',
  `identifier` varchar(80) NOT NULL DEFAULT '',
  `payed` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.house_rents : ~0 rows (environ)

-- Listage de la structure de table zak. houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(2) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `defaultPrice` int(11) DEFAULT NULL,
  `tier` smallint(6) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  `garageShell` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `mlo` text DEFAULT NULL,
  `ipl` text DEFAULT NULL,
  `console` int(11) DEFAULT NULL,
  `board` text DEFAULT NULL,
  `for_sale` int(11) DEFAULT 1,
  `extra_imgs` text DEFAULT NULL,
  `description` text NOT NULL DEFAULT '',
  `creatorJob` varchar(50) DEFAULT NULL,
  `blip` text DEFAULT NULL,
  `upgrades` text DEFAULT NULL,
  `apartmentCount` int(11) DEFAULT NULL,
  `creatorGotMoney` tinyint(1) NOT NULL DEFAULT 0,
  `permissions` longtext DEFAULT NULL,
  `paymentMethod` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.houselocations : ~1 rows (environ)
INSERT INTO `houselocations` (`id`, `name`, `label`, `coords`, `owned`, `price`, `defaultPrice`, `tier`, `garage`, `garageShell`, `creator`, `mlo`, `ipl`, `console`, `board`, `for_sale`, `extra_imgs`, `description`, `creatorJob`, `blip`, `upgrades`, `apartmentCount`, `creatorGotMoney`, `permissions`, `paymentMethod`) VALUES
	(3, 'blanchisserie', 'Magellan Avenue', '{"cam":{"y":-1024.485595703125,"x":-1311.671142578125,"h":219,"yaw":-10.0,"z":26.890962600708},"shellCoords":{"y":-1064.3045654296876,"h":208.52359008789066,"x":-1359.5264892578126,"z":-17.92526245117187},"PolyZone":{"points":[{"y":-1022.9107666015624,"x":-1309.1822509765626,"z":27},{"y":-1040.0509033203126,"x":-1294.121826171875,"z":27},{"y":-1052.5565185546876,"x":-1312.469482421875,"z":27},{"y":-1027.1490478515626,"x":-1317.533203125,"z":27}],"thickness":25},"interiorCoords":{"y":-1064.3045654296876,"x":-1359.5264892578126,"w":208.52359008789066,"z":-17.92526245117187},"enter":{"y":-1024.485595703125,"h":219,"x":-1311.671142578125,"z":26.890962600708},"exit":{"y":-1078.2244873046876,"h":208.52359008789066,"x":-1363.4085693359376,"z":-15.51109504699707}}', NULL, 100000, 100000, 17, NULL, NULL, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'null', 'null', NULL, '{"object":"qs_salesign_01","name":"Zak Dev","phone":"5621"}', 1, NULL, '', 'police', '{"color":3,"sprite":40,"enable":true,"name":"House","scale":0.3}', NULL, 0, 0, NULL, 'money');

-- Listage de la structure de table zak. instagram_accounts
CREATE TABLE IF NOT EXISTS `instagram_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `owner` varchar(120) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  `avatar` text DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `verified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `phone` (`phone`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.instagram_accounts : ~0 rows (environ)

-- Listage de la structure de table zak. instagram_follow
CREATE TABLE IF NOT EXISTS `instagram_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follower` int(11) NOT NULL DEFAULT 0,
  `following` int(11) NOT NULL DEFAULT 0,
  `updatedDate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.instagram_follow : ~0 rows (environ)

-- Listage de la structure de table zak. instagram_messages
CREATE TABLE IF NOT EXISTS `instagram_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL DEFAULT 0,
  `receiver` int(11) NOT NULL DEFAULT 0,
  `time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `messages` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.instagram_messages : ~0 rows (environ)

-- Listage de la structure de table zak. instagram_notifications
CREATE TABLE IF NOT EXISTS `instagram_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT 0,
  `targetId` int(11) NOT NULL DEFAULT 0,
  `type` varchar(50) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.instagram_notifications : ~0 rows (environ)

-- Listage de la structure de table zak. instagram_post_comments
CREATE TABLE IF NOT EXISTS `instagram_post_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `postId` (`postId`)
) ENGINE=InnoDB AUTO_INCREMENT=4405 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.instagram_post_comments : ~0 rows (environ)

-- Listage de la structure de table zak. instagram_posts
CREATE TABLE IF NOT EXISTS `instagram_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `userId` int(11) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `content` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` tinytext DEFAULT NULL,
  `likes` text DEFAULT NULL,
  `filter` tinytext DEFAULT NULL,
  `commentCount` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=525 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.instagram_posts : ~0 rows (environ)

-- Listage de la structure de table zak. instagram_stories
CREATE TABLE IF NOT EXISTS `instagram_stories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT 0,
  `updatedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `data` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Listage des données de la table zak.instagram_stories : ~0 rows (environ)

-- Listage de la structure de table zak. items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.items : ~49 rows (environ)
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('alive_chicken', 'Living chicken', 1, 0, 1),
	('arcorn', 'Arcorn', 1, 0, 1),
	('bandage', 'Bandage', 2, 0, 1),
	('blowpipe', 'Blowtorch', 2, 0, 1),
	('bread', 'Bread', 1, 0, 1),
	('cannabis', 'Cannabis', 3, 0, 1),
	('carokit', 'Body Kit', 3, 0, 1),
	('carotool', 'Tools', 2, 0, 1),
	('clothe', 'Cloth', 1, 0, 1),
	('coca', 'Coca', 1, 0, 1),
	('coffee', 'Café', 1, 0, 1),
	('copper', 'Copper', 1, 0, 1),
	('cutted_wood', 'Cut wood', 1, 0, 1),
	('diamond', 'Diamond', 1, 0, 1),
	('essence', 'Gas', 1, 0, 1),
	('fabric', 'Fabric', 1, 0, 1),
	('fish', 'Fish', 1, 0, 1),
	('fixkit', 'Repair Kit', 3, 0, 1),
	('fixtool', 'Repair Tools', 2, 0, 1),
	('gazbottle', 'Gas Bottle', 2, 0, 1),
	('gold', 'Gold', 1, 0, 1),
	('hotdog', 'Hotdog', 2, 0, 1),
	('ice_tea', 'Ice Tea', 1, 0, 1),
	('iron', 'Iron', 1, 0, 1),
	('long_coffee', 'Café allongé', 1, 0, 1),
	('maple_syrup_extract', 'Maple syrup extract', 1, 0, 1),
	('maple_wood', 'Maple wood', 1, 0, 1),
	('marijuana', 'Marijuana', 2, 0, 1),
	('medikit', 'Medikit', 2, 0, 1),
	('oak_bark', 'Oak Bark', 1, 0, 1),
	('oak_wood', 'Oak wood', 1, 0, 1),
	('packaged_chicken', 'Chicken fillet', 1, 0, 1),
	('packaged_plank', 'Packaged wood', 1, 0, 1),
	('petrol', 'Oil', 1, 0, 1),
	('petrol_raffin', 'Processed oil', 1, 0, 1),
	('phone', 'Phone', 1, 0, 1),
	('pine_resin', 'Pine resin', 1, 0, 1),
	('pine_wood', 'Pine wood', 1, 0, 1),
	('radio', 'Radio', 1, 0, 1),
	('ristretto', 'Ristretto', 1, 0, 1),
	('slaughtered_chicken', 'Slaughtered chicken', 1, 0, 1),
	('sprunk', 'Sprunk', 1, 0, 1),
	('stone', 'Stone', 1, 0, 1),
	('strong_fiber', 'Strong fiber', 1, 0, 1),
	('washed_stone', 'Washed stone', 1, 0, 1),
	('water', 'Water', 1, 0, 1),
	('wood', 'Wood', 1, 0, 1),
	('wood_shavings', 'Wood Shavings', 1, 0, 1),
	('wool', 'Wool', 1, 0, 1);

-- Listage de la structure de table zak. job_announcements
CREATE TABLE IF NOT EXISTS `job_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_job` (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.job_announcements : ~0 rows (environ)

-- Listage de la structure de table zak. job_applications
CREATE TABLE IF NOT EXISTS `job_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `job` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `answers` longtext NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `date_submitted` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_reviewed` timestamp NULL DEFAULT NULL,
  `reviewer_id` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job` (`job`),
  KEY `citizenid` (`citizenid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.job_applications : ~0 rows (environ)

-- Listage de la structure de table zak. job_creator
CREATE TABLE IF NOT EXISTS `job_creator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.job_creator : ~0 rows (environ)

-- Listage de la structure de table zak. job_employee_permissions
CREATE TABLE IF NOT EXISTS `job_employee_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `job` varchar(50) NOT NULL,
  `permissions` text NOT NULL,
  `granted_by` varchar(50) NOT NULL,
  `granted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_employee_job` (`citizenid`,`job`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.job_employee_permissions : ~0 rows (environ)

-- Listage de la structure de table zak. job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.job_grades : ~91 rows (environ)
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
	(2, 'police', 0, 'recruit', 'Recruit', 20, '{}', '{}'),
	(3, 'police', 1, 'officer', 'Officer', 40, '{}', '{}'),
	(4, 'police', 2, 'sergeant', 'Sergeant', 60, '{}', '{}'),
	(5, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
	(6, 'police', 4, 'boss', 'Captain', 100, '{}', '{}'),
	(11, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
	(12, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(13, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
	(14, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(15, 'lumberjack', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(16, 'fisherman', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(17, 'fueler', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(18, 'reporter', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(19, 'tailor', 0, 'employee', 'Employee', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(20, 'miner', 0, 'employee', 'Employee', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(21, 'slaughterer', 0, 'employee', 'Employee', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(22, 'ambulance', 0, 'ambulance', 'Jr. EMT', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(23, 'ambulance', 1, 'doctor', 'EMT', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(24, 'ambulance', 2, 'chief_doctor', 'Sr. EMT', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(25, 'ambulance', 3, 'boss', 'EMT Supervisor', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(26, 'mechanic', 0, 'recrue', 'Recruit', 12, '{}', '{}'),
	(27, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}'),
	(28, 'mechanic', 2, 'experimente', 'Experienced', 36, '{}', '{}'),
	(29, 'mechanic', 3, 'chief', 'Leader', 48, '{}', '{}'),
	(30, 'mechanic', 4, 'boss', 'Boss', 0, '{}', '{}'),
	(31, 'taxi', 0, 'recrue', 'Recruit', 12, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(32, 'taxi', 1, 'novice', 'Cabby', 24, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(33, 'taxi', 2, 'experimente', 'Experienced', 36, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(34, 'taxi', 3, 'uber', 'Uber Cabby', 48, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(35, 'taxi', 4, 'boss', 'Lead Cabby', 0, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(36, 'banker', 0, 'advisor', 'Consultant', 10, '{}', '{}'),
	(37, 'banker', 1, 'banker', 'Banker', 20, '{}', '{}'),
	(38, 'banker', 2, 'business_banker', 'Investment banker', 30, '{}', '{}'),
	(39, 'banker', 3, 'trader', 'Broker', 40, '{}', '{}'),
	(40, 'banker', 4, 'boss', 'Boss', 0, '{}', '{}'),
	(41, 'ambulance', 0, 'ambulance', 'Paramedic', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(42, 'ambulance', 1, 'doctor', 'Doctor', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(43, 'ambulance', 2, 'chief_doctor', 'Chief Doctor', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(44, 'ambulance', 3, 'boss', 'Director', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(45, 'doj', 0, 'lawyer', 'Lawyer', 10, '{}', '{}'),
	(46, 'doj', 1, 'irs', 'IRS', 10, '{}', '{}'),
	(47, 'doj', 2, 'prosecutor', 'Prosecutor', 10, '{}', '{}'),
	(48, 'doj', 3, 'judge', 'Judge', 10, '{}', '{}'),
	(49, 'taxi', 0, 'recruit', 'Recrue', 150, '{}', '{}'),
	(50, 'taxi', 1, 'driver', 'Chauffeur', 250, '{}', '{}'),
	(51, 'taxi', 2, 'experienced', 'Chauffeur Expérimenté', 350, '{}', '{}'),
	(52, 'taxi', 3, 'supervisor', 'Superviseur', 450, '{}', '{}'),
	(53, 'taxi', 4, 'boss', 'Patron', 550, '{}', '{}'),
	(54, 'hunter', 0, 'novice', 'Novice', 10, '{}', '{}'),
	(55, 'dog_walker', 0, 'novice', 'Novice', 10, '{}', '{}'),
	(56, 'lumberjack', 0, 'novice', 'Novice', 10, '{}', '{}'),
	(57, 'miner', 0, 'novice', 'Novice', 10, '{}', '{}'),
	(58, 'newspaper_delivery', 0, 'novice', 'Novice', 10, '{}', '{}'),
	(59, 'realestate', 0, 'agent', 'Agent', 400, '{}', '{}'),
	(60, 'realestate', 1, 'senior_agent', 'Senior Agent', 600, '{}', '{}'),
	(61, 'realestate', 2, 'manager', 'Manager', 800, '{}', '{}'),
	(62, 'realestate', 3, 'boss', 'Boss', 1000, '{}', '{}'),
	(63, 'upnatom', 0, 'trainee', 'Stagiaire', 250, '{}', '{}'),
	(64, 'upnatom', 1, 'employee', 'Employé', 350, '{}', '{}'),
	(65, 'upnatom', 2, 'cashier', 'Caissier', 400, '{}', '{}'),
	(66, 'upnatom', 3, 'cook', 'Cuisinier', 450, '{}', '{}'),
	(67, 'upnatom', 4, 'manager', 'Manager', 550, '{}', '{}'),
	(68, 'upnatom', 5, 'boss', 'Patron', 700, '{}', '{}'),
	(69, 'pops', 0, 'trainee', 'Stagiaire', 250, '{}', '{}'),
	(70, 'pops', 1, 'waiter', 'Serveur', 350, '{}', '{}'),
	(71, 'pops', 2, 'cook', 'Cuisinier', 450, '{}', '{}'),
	(72, 'pops', 3, 'chef', 'Chef', 500, '{}', '{}'),
	(73, 'pops', 4, 'manager', 'Manager', 600, '{}', '{}'),
	(74, 'pops', 5, 'boss', 'Propriétaire', 750, '{}', '{}'),
	(75, 'beans', 0, 'trainee', 'Stagiaire', 200, '{}', '{}'),
	(76, 'beans', 1, 'barista', 'Barista', 300, '{}', '{}'),
	(77, 'beans', 2, 'senior_barista', 'Barista Senior', 350, '{}', '{}'),
	(78, 'beans', 3, 'shift_leader', 'Chef d\'Équipe', 400, '{}', '{}'),
	(79, 'beans', 4, 'manager', 'Manager', 500, '{}', '{}'),
	(80, 'beans', 5, 'boss', 'Propriétaire', 650, '{}', '{}'),
	(81, 'unicorn', 0, 'trainee', 'Stagiaire', 300, '{}', '{}'),
	(82, 'unicorn', 1, 'dancer', 'Danseur/Danseuse', 400, '{}', '{}'),
	(83, 'unicorn', 2, 'bartender', 'Barman', 450, '{}', '{}'),
	(84, 'unicorn', 3, 'vip_host', 'Hôte VIP', 500, '{}', '{}'),
	(85, 'unicorn', 4, 'manager', 'Manager', 600, '{}', '{}'),
	(86, 'unicorn', 5, 'boss', 'Propriétaire', 800, '{}', '{}'),
	(87, 'harmony', 0, 'recrue', 'Recrue', 200, '{}', '{}'),
	(88, 'harmony', 1, 'novice', 'Mécanicien Novice', 300, '{}', '{}'),
	(89, 'harmony', 2, 'experimente', 'Mécanicien Expérimenté', 400, '{}', '{}'),
	(90, 'harmony', 3, 'chief', 'Chef d\'Atelier', 500, '{}', '{}'),
	(91, 'harmony', 4, 'viceboss', 'Directeur Adjoint', 600, '{}', '{}'),
	(92, 'harmony', 5, 'boss', 'Gérant', 700, '{}', '{}'),
	(93, 'concess', 0, 'employee', 'Employé', 250, '{}', '{}'),
	(94, 'concess', 1, 'manager', 'Gérant', 450, '{}', '{}'),
	(95, 'concess', 2, 'boss', 'Patron', 750, '{}', '{}'),
	(96, 'casino', 0, 'croupier', 'Croupier', 10, '{}', '{}'),
	(97, 'casino', 1, 'boss', 'Boss', 50, '{}', '{}'),
	(98, 'taxi', 0, 'chauffeur', 'Chauffeur', 500, '{}', '{}'),
	(99, 'taxi', 1, 'gerant', 'Gérant', 750, '{}', '{}'),
	(100, 'taxi', 2, 'boss', 'Boss', 1000, '{}', '{}');

-- Listage de la structure de table zak. job_manager_settings
CREATE TABLE IF NOT EXISTS `job_manager_settings` (
  `citizenid` varchar(50) NOT NULL,
  `settings` longtext DEFAULT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.job_manager_settings : ~0 rows (environ)

-- Listage de la structure de table zak. job_playtime
CREATE TABLE IF NOT EXISTS `job_playtime` (
  `citizenid` varchar(50) NOT NULL,
  `job` varchar(50) NOT NULL,
  `total_minutes` int(10) unsigned NOT NULL DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`,`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.job_playtime : ~0 rows (environ)

-- Listage de la structure de table zak. jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.jobs : ~26 rows (environ)
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'SAMS', 0),
	('banker', 'Banker', 0),
	('beans', 'Beans Coffee', 0),
	('cardealer', 'Concessionnaire', 0),
	('casino', 'Casino', 0),
	('concess', 'Concessionnaire', 0),
	('dealership', 'Concessionnaire', 0),
	('dog_walker', 'Promeneur de chien', 0),
	('doj', 'DOJ', 0),
	('fisherman', 'Pecheur', 0),
	('fueler', 'Fueler', 0),
	('harmony', 'Harmony\'S Repair', 0),
	('hunter', 'Chasseur', 0),
	('lumberjack', 'Bucheron', 0),
	('mechanic', 'Otto\'S Repair', 0),
	('miner', 'Mineur', 0),
	('newspaper_delivery', 'Newspaper Delivery', 0),
	('police', 'SASP', 0),
	('pops', 'Pop\'s Diner', 0),
	('realestate', 'Agent Immobilier', 1),
	('reporter', 'Journaliste', 0),
	('slaughterer', 'Butcher', 0),
	('tailor', 'Tailor', 0),
	('taxi', 'Taxi', 0),
	('unemployed', 'Unemployed', 0),
	('unicorn', 'Vintage Unicorn', 0),
	('upnatom', 'Up\'N Atom Burger', 0);

-- Listage de la structure de table zak. judgements
CREATE TABLE IF NOT EXISTS `judgements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `officer` varchar(46) NOT NULL,
  `player` varchar(46) NOT NULL,
  `offenses` longtext NOT NULL,
  `jail` int(11) NOT NULL,
  `fine` int(11) NOT NULL,
  `time` bigint(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.judgements : ~0 rows (environ)

-- Listage de la structure de table zak. ks_bossmenu_actions
CREATE TABLE IF NOT EXISTS `ks_bossmenu_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` text DEFAULT NULL,
  `employee` text DEFAULT NULL,
  `time` varchar(10) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `job` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.ks_bossmenu_actions : ~0 rows (environ)

-- Listage de la structure de table zak. ks_bossmenu_bonus_queue
CREATE TABLE IF NOT EXISTS `ks_bossmenu_bonus_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `job` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.ks_bossmenu_bonus_queue : ~0 rows (environ)

-- Listage de la structure de table zak. ks_bossmenu_transactions
CREATE TABLE IF NOT EXISTS `ks_bossmenu_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` text DEFAULT NULL,
  `employee` text DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `time` varchar(10) DEFAULT NULL,
  `job` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.ks_bossmenu_transactions : ~0 rows (environ)

-- Listage de la structure de table zak. lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.lapraces : ~0 rows (environ)

-- Listage de la structure de table zak. licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.licenses : ~7 rows (environ)
INSERT INTO `licenses` (`type`, `label`) VALUES
	('boat', 'Boat License'),
	('dmv', 'Driving Permit'),
	('drive', 'Drivers License'),
	('drive_bike', 'Motorcycle License'),
	('drive_truck', 'Commercial Drivers License'),
	('weapon', 'Weapon License'),
	('weed_processing', 'Weed Processing License');

-- Listage de la structure de table zak. lst_announcements
CREATE TABLE IF NOT EXISTS `lst_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `creator` varchar(46) NOT NULL,
  `time` bigint(25) NOT NULL,
  `job` varchar(20) NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.lst_announcements : ~0 rows (environ)

-- Listage de la structure de table zak. lst_licenses
CREATE TABLE IF NOT EXISTS `lst_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(46) NOT NULL,
  `type` varchar(20) NOT NULL,
  `label` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.lst_licenses : ~0 rows (environ)

-- Listage de la structure de table zak. lst_orders
CREATE TABLE IF NOT EXISTS `lst_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(120) NOT NULL,
  `items` longtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `job` varchar(30) NOT NULL,
  `time` bigint(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.lst_orders : ~0 rows (environ)

-- Listage de la structure de table zak. lst_repairs
CREATE TABLE IF NOT EXISTS `lst_repairs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer` varchar(120) NOT NULL,
  `employee` varchar(120) NOT NULL,
  `identifier` varchar(46) NOT NULL,
  `job` varchar(20) NOT NULL,
  `title` varchar(256) NOT NULL,
  `price` int(11) NOT NULL,
  `time` bigint(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.lst_repairs : ~0 rows (environ)

-- Listage de la structure de table zak. lst_workers_notes
CREATE TABLE IF NOT EXISTS `lst_workers_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(46) NOT NULL,
  `officer` varchar(46) NOT NULL,
  `title` varchar(60) NOT NULL,
  `text` longtext NOT NULL,
  `time` bigint(25) NOT NULL,
  `important` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.lst_workers_notes : ~0 rows (environ)

-- Listage de la structure de table zak. mail_accounts
CREATE TABLE IF NOT EXISTS `mail_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT '0',
  `mail` varchar(50) DEFAULT '0',
  `name` varchar(50) DEFAULT '0',
  `password` varchar(50) DEFAULT '',
  `phone` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.mail_accounts : ~0 rows (environ)

-- Listage de la structure de table zak. management_funds
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `type` enum('society','gang') NOT NULL DEFAULT 'society',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.management_funds : ~0 rows (environ)

-- Listage de la structure de table zak. market_accounts
CREATE TABLE IF NOT EXISTS `market_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `phone` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `avatar` text NOT NULL,
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.market_accounts : ~0 rows (environ)

-- Listage de la structure de table zak. market_markets
CREATE TABLE IF NOT EXISTS `market_markets` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `job` text NOT NULL DEFAULT '[]',
  `ratings` text NOT NULL DEFAULT '[]',
  `coords` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.market_markets : ~8 rows (environ)
INSERT INTO `market_markets` (`id`, `name`, `description`, `job`, `ratings`, `coords`) VALUES
	(1, 'Los Santos Police Department', 'The city police, always willing to help you, let us know if you have any problems in Los Santos.', '["police","sheriff"]', '[]', '{"x":452.1199951171875,"y":-980.5499877929688,"z":30.69000053405761}'),
	(2, 'Pillbox Medical Center', 'If you need a doctor, contact the Los Santos Emergency Center!', '["ambulance"]', '[]', '{"x":335.1199951171875,"y":-584.5499877929688,"z":43.68999862670898}'),
	(3, 'Bean Machine', 'The best coffee shop in the city now with home delivery—order your coffee, cappuccino, with milk, or whatever you want!', '["beanmachine","deliver"]', '[]', '{"x":280.79998779296877,"y":-963.982421875,"z":29.4146728515625}'),
	(4, 'Jamaican Roast', 'Home delivery and in-store sales. Try the best cappuccino in Los Santos—toast, meals, grill!', '["jamaican","deliver"]', '[]', '{"x":273.4681396484375,"y":-832.971435546875,"z":29.3978271484375}'),
	(5, 'Pizza This', 'Since 1988 bringing the best Italian pizza to LS. Choose your flavor and contact us!', '["pizzajob","deliver"]', '[]', '{"x":287.73626708984377,"y":-963.96923828125,"z":29.4146728515625}'),
	(6, 'Bennys Original Motor Works', 'Top mechanic company with home orders or direct contact through Marketplace—repairs and tuning.', '["mechanic"]', '[]', '{"x":-206.00439453125,"y":-1310.2813720703126,"z":31.2850341796875}'),
	(7, 'Premium Deluxe Motorsport', 'Order your new car, ask for prices, and schedule delivery—your next sports car awaits!', '["dealership"]', '[]', '{"x":-45.36263656616211,"y":-1107.3099365234376,"z":26.4322509765625}'),
	(8, 'Vanilla Unicorn', 'Drinks, shows, and reservations. Place your order or book your favorite performer.', '["unicornjob"]', '[]', '{"x":128.7956085205078,"y":-1297.265869140625,"z":29.14501953125}');

-- Listage de la structure de table zak. market_messages
CREATE TABLE IF NOT EXISTS `market_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `messages` text NOT NULL,
  `isMarket` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.market_messages : ~0 rows (environ)

-- Listage de la structure de table zak. mechanic_outfits
CREATE TABLE IF NOT EXISTS `mechanic_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(30) NOT NULL,
  `grade` longtext NOT NULL,
  `label` varchar(60) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `license` longtext DEFAULT 'none',
  `requirements` varchar(50) NOT NULL,
  `skin` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.mechanic_outfits : ~0 rows (environ)

-- Listage de la structure de table zak. medic_outfits
CREATE TABLE IF NOT EXISTS `medic_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(30) NOT NULL,
  `grade` longtext NOT NULL,
  `label` varchar(60) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `license` longtext DEFAULT 'none',
  `requirements` varchar(50) NOT NULL,
  `skin` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.medic_outfits : ~0 rows (environ)

-- Listage de la structure de table zak. multicharacter_slots
CREATE TABLE IF NOT EXISTS `multicharacter_slots` (
  `identifier` varchar(60) NOT NULL,
  `slots` int(11) NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  KEY `slots` (`slots`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.multicharacter_slots : ~0 rows (environ)

-- Listage de la structure de table zak. outfitbag_outfits
CREATE TABLE IF NOT EXISTS `outfitbag_outfits` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.outfitbag_outfits : ~0 rows (environ)
INSERT INTO `outfitbag_outfits` (`id`, `identifier`, `name`, `data`) VALUES
	(520306, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'test', '{"t-shirt":{"item":0,"texture":0,"palette":0},"chain":{"item":-1,"texture":-1},"glass":{"item":-1,"texture":-1},"mask":{"item":0,"texture":0,"palette":0},"pants":{"item":0,"texture":0,"palette":0},"bag":{"item":0,"texture":0,"palette":0},"torso2":{"item":0,"texture":0,"palette":0},"arms":{"item":0,"texture":0,"palette":0},"ear":{"item":-1,"texture":-1},"vest":{"item":0,"texture":0,"palette":0},"bracelet":{"item":-1,"texture":-1},"face":{"item":0,"texture":0,"palette":0},"shoes":{"item":0,"texture":0,"palette":0},"decals":{"item":0,"texture":0,"palette":0},"hat":{"item":-1,"texture":-1},"watch":{"item":-1,"texture":-1},"hair":{"item":0,"texture":0,"palette":0},"accessory":{"item":0,"texture":0,"palette":0}}');

-- Listage de la structure de table zak. owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) NOT NULL,
  `co_owner` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `plate` varchar(250) NOT NULL,
  `vin` varchar(17) DEFAULT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'vehicle',
  `garage` varchar(200) DEFAULT 'OUT',
  `impound_data` text DEFAULT '',
  `favorite` int(3) NOT NULL DEFAULT 0,
  `stored` tinyint(4) DEFAULT 0,
  `jobVehicle` varchar(50) DEFAULT '',
  `jobGarage` varchar(50) DEFAULT '',
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  `job` varchar(30) DEFAULT NULL,
  `wheelchair` int(1) DEFAULT 0,
  `wheelchairTime` bigint(25) DEFAULT 0,
  `parking` varchar(60) DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_co_owner` (`co_owner`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table zak.owned_vehicles : ~8 rows (environ)
INSERT INTO `owned_vehicles` (`id`, `owner`, `co_owner`, `tag`, `plate`, `vin`, `vehicle`, `type`, `garage`, `impound_data`, `favorite`, `stored`, `jobVehicle`, `jobGarage`, `glovebox`, `trunk`, `job`, `wheelchair`, `wheelchairTime`, `parking`, `balance`, `paymentamount`, `paymentsleft`, `financetime`) VALUES
	(1, 'fcb47b307801e586e8c95881bdfc98004f24d031', NULL, NULL, '08W U15', 'DS3GNS9TFX8I', '{"dirtLevel":3.2,"modSideSkirt":-1,"doorsBroken":{"3":false,"0":false,"1":false,"2":false},"fuelLevel":65,"coords":{"x":227.61758422851563,"y":-817.6615600585938,"z":29.987548828125,"w":312.46368408203127},"modAerials":-1,"modRearBumper":-1,"modBackWheels":-1,"modEngineBlock":-1,"modGrille":-1,"tyreSmokeColor":[255,255,255],"bodyHealth":1000.0,"windowTint":-1,"xenonColor":255,"modHydrolic":-1,"modAPlate":-1,"neonEnabled":[false,false,false,false],"modCustomBackWheels":false,"color1":4,"modArmor":-1,"modSeats":-1,"modDial":-1,"tankHealth":1000,"modVanityPlate":-1,"modTank":-1,"interiorColor":0,"modHood":-1,"modDoorSpeaker":-1,"modRightFender":-1,"plateIndex":0,"modCustomFrontWheels":false,"modSmokeEnabled":1,"modRoof":-1,"modDashboard":-1,"plate":"08W U15","modLivery":-1,"modFrame":-1,"modRoofLivery":-1,"modAirFilter":-1,"modBrakes":-1,"neonColor":[255,0,255],"modOrnaments":-1,"dashboardColor":0,"locked":0,"deformations":[],"modHorns":-1,"windowsBroken":{"7":true,"0":false,"1":false,"2":false,"3":false,"4":true,"5":true,"6":false},"modArchCover":-1,"model":-1216765807,"modTurbo":false,"modPlateHolder":-1,"extras":{"10":1,"1":1,"12":false},"modSpeakers":-1,"tyresCanBurst":1,"wheels":7,"color2":12,"fuel":100.0,"engineHealth":1000.0,"modStruts":-1,"modXenon":false,"modFender":-1,"modExhaust":-1,"modTransmission":-1,"wheelColor":156,"modLightbar":-1,"modFrontBumper":-1,"modTrunk":-1,"modTrimA":-1,"modWindows":-1,"modTrimB":-1,"modSuspension":-1,"modSpoilers":-1,"modShifterLeavers":-1,"pearlescentColor":111,"modSteeringWheel":-1,"modEngine":-1,"modFrontWheels":-1,"tyreBurst":{"5":false,"0":false,"1":false,"4":false}}', 'car', '0', '', 0, 1, '', '', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0),
	(2, 'fcb47b307801e586e8c95881bdfc98004f24d031', NULL, NULL, '06Q K19', 'ZHDHC102J8FT', '{"modRoofLivery":-1,"modExhaust":-1,"modTank":-1,"modOrnaments":-1,"modAerials":-1,"modAPlate":-1,"modSeats":-1,"doorsBroken":{"2":false,"1":false,"0":false,"3":false},"modArchCover":-1,"plateIndex":0,"modSuspension":-1,"modVanityPlate":-1,"modTrimB":-1,"modHydrolic":-1,"modHorns":-1,"extras":{"1":1,"12":1,"10":false},"modSmokeEnabled":1,"modLivery":-1,"modFrontWheels":-1,"modDial":-1,"modEngine":-1,"modSideSkirt":-1,"modPlateHolder":-1,"modRearBumper":-1,"modTurbo":false,"wheelColor":156,"modEngineBlock":-1,"modFender":-1,"modTrunk":-1,"modWindows":-1,"modShifterLeavers":-1,"modBrakes":-1,"tyresCanBurst":1,"wheels":7,"modSpoilers":-1,"modRoof":-1,"color2":27,"modStruts":-1,"model":-1216765807,"fuelLevel":65.0,"bodyHealth":997.78515625,"modSpeakers":-1,"engineHealth":996.677734375,"modDoorSpeaker":-1,"neonColor":[255,0,255],"deformations":[],"modDashboard":-1,"modBackWheels":-1,"dashboardColor":0,"modRightFender":-1,"modFrontBumper":-1,"modTransmission":-1,"modLightbar":-1,"tankHealth":1000.0,"color1":36,"tyreSmokeColor":[255,255,255],"modXenon":false,"windowsBroken":{"6":false,"5":true,"4":true,"3":false,"2":false,"1":false,"0":false,"7":true},"plate":"06Q K19","neonEnabled":[false,false,false,false],"tyreBurst":{"5":false,"1":false,"4":false,"0":false},"modCustomBackWheels":false,"modHood":-1,"windowTint":-1,"modSteeringWheel":-1,"dirtLevel":3.0,"modGrille":-1,"interiorColor":0,"pearlescentColor":37,"modFrame":-1,"xenonColor":255,"modCustomFrontWheels":false,"modArmor":-1,"modTrimA":-1,"modAirFilter":-1}', 'car', '0', '', 0, 1, '', '', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0),
	(3, 'fcb47b307801e586e8c95881bdfc98004f24d031', NULL, NULL, 'U07 84R', 'RXWACUEA4MPU', '{"model":-1216765807,"plate":"U07 84R"}', 'car', '0', '', 0, 1, '', '', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0),
	(4, 'fcb47b307801e586e8c95881bdfc98004f24d031', NULL, NULL, 'H69 84P', '39CY01GI2EML', '{"plate":"H69 84P","model":-1216765807}', 'car', '0', '', 0, 1, '', '', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0),
	(5, 'char0:72e2349201e0683aa2540804c45f566df0755123', NULL, NULL, '14V O21', 'HIANZRM32AU3', '{"engineHealth":995.0499877929688,"modFrame":-1,"tyreSmokeColor":[255,255,255],"modRoofLivery":-1,"modAPlate":-1,"interiorColor":0,"plateIndex":0,"modGrille":-1,"modStruts":-1,"modRearBumper":-1,"deformations":[],"modSteeringWheel":-1,"windowTint":-1,"modWindows":-1,"modSideSkirt":-1,"modHydrolic":-1,"modFender":-1,"fuelLevel":64.5,"modSpeakers":-1,"modShifterLeavers":-1,"modBrakes":-1,"modAirFilter":-1,"modTrunk":-1,"modSpoilers":-1,"modLightbar":-1,"bodyHealth":985.0,"modCustomFrontWheels":false,"modFrontWheels":-1,"modEngine":-1,"modPlateHolder":-1,"modDoorSpeaker":-1,"modHood":-1,"modSmokeEnabled":1,"fuel":64.49706268310547,"windowsBroken":{"1":false,"0":false,"7":false,"6":false,"5":true,"4":true,"3":false,"2":false},"modExhaust":-1,"modArmor":-1,"modEngineBlock":-1,"modRoof":-1,"modArchCover":-1,"plate":"14V O21","modHorns":-1,"modSuspension":-1,"tyresCanBurst":1,"model":-344943009,"modVanityPlate":-1,"modDashboard":-1,"modXenon":false,"modAerials":-1,"dashboardColor":0,"modSeats":-1,"modOrnaments":-1,"neonColor":[255,0,255],"neonEnabled":[false,false,false,false],"extras":{"12":false,"10":false},"modTransmission":-1,"color1":7,"pearlescentColor":5,"xenonColor":255,"color2":0,"tyreBurst":{"1":false,"4":false,"5":false,"0":false},"modFrontBumper":-1,"dirtLevel":4.0,"modCustomBackWheels":false,"modTrimA":-1,"wheelColor":156,"modRightFender":-1,"modBackWheels":-1,"modTurbo":false,"modTank":-1,"wheels":0,"doorsBroken":{"1":false,"0":false,"4":false,"3":false,"2":false},"modTrimB":-1,"tankHealth":1000.0,"modLivery":-1,"modDial":-1}', 'car', 'Sandy Shore Parking', '', 0, 1, '', '', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0),
	(6, 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', NULL, NULL, 'AXB 02O', 'U13CA88BBNLS', '{"model":-344943009,"plate":"AXB 02O"}', 'car', 'Legion Square', '', 0, 2, '', '', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0),
	(7, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', NULL, NULL, '4MI8ZTJT', 'KMRJT7TEDGZF', '{"plate":"4MI8ZTJT","fuel":100.0,"deformations":[],"engineHealth":993.0,"bodyHealth":995.0,"model":"sultan","locked":0,"coords":{"x":1912.7076416015626,"y":3774.883544921875,"z":31.874755859375,"w":164.10496520996095}}', 'car', 'OUT', '', 0, 0, '', '', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0),
	(8, 'char0:72e2349201e0683aa2540804c45f566df0755123', NULL, NULL, 'GOMMSUFA', '13YEDO29ZU7A', '{"modTransmission":-1,"dirtLevel":6.0,"modBrakes":-1,"modCustomBackWheels":false,"modDoorSpeaker":-1,"tyreBurst":{"1":false,"5":false,"4":false,"0":false},"bodyHealth":1000.0,"modWindows":-1,"windowsBroken":{"2":false,"1":false,"0":false,"7":false,"6":false,"5":true,"4":true,"3":false},"modBackWheels":-1,"xenonColor":255,"neonColor":[255,0,255],"neonEnabled":[false,false,false,false],"plateIndex":3,"modTank":-1,"interiorColor":0,"modRearBumper":-1,"modGrille":-1,"doorsBroken":{"2":false,"1":false,"0":false,"6":false,"5":false,"4":false,"3":false},"modFrame":-1,"modRoof":-1,"modCustomFrontWheels":false,"model":970598228,"plate":"GOMMSUFA","modSteeringWheel":-1,"modTrimB":-1,"modArmor":-1,"modLivery":-1,"wheels":0,"modSeats":-1,"dashboardColor":0,"modSideSkirt":-1,"modXenon":false,"color1":4,"modRightFender":-1,"modAirFilter":-1,"modDial":-1,"modSpeakers":-1,"modArchCover":-1,"fuelLevel":99.8,"modOrnaments":-1,"windowTint":-1,"modHorns":-1,"modSpoilers":-1,"modLightbar":-1,"modRoofLivery":-1,"deformations":[],"pearlescentColor":111,"tyreSmokeColor":[255,255,255],"modEngine":-1,"modAerials":-1,"modEngineBlock":-1,"fuel":99.77767944335938,"tankHealth":1000.0,"modFrontWheels":-1,"engineHealth":1000.0,"modExhaust":-1,"tyresCanBurst":1,"modTrunk":-1,"modTrimA":-1,"modDashboard":-1,"extras":{"10":false,"12":1},"modHydrolic":-1,"modTurbo":false,"modAPlate":-1,"modShifterLeavers":-1,"modHood":-1,"modFender":-1,"color2":4,"wheelColor":156,"modFrontBumper":-1,"modSmokeEnabled":false,"modStruts":-1,"modVanityPlate":-1,"modPlateHolder":-1,"modSuspension":-1}', 'car', 'Sandy Shore Parking', '', 0, 1, '', '', NULL, NULL, NULL, 0, 0, NULL, 0, 0, 0, 0);

-- Listage de la structure de table zak. ox_doorlock
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.ox_doorlock : ~77 rows (environ)
INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
	(1, 'community_mrpd 1', '{"coords":{"x":434.7478942871094,"y":-981.916748046875,"z":30.83926963806152},"groups":{"police":0,"offpolice":0},"maxDistance":2.5,"state":0,"doors":[{"coords":{"x":434.7478942871094,"y":-980.618408203125,"z":30.83926963806152},"model":-1215222675,"heading":270},{"coords":{"x":434.7478942871094,"y":-983.215087890625,"z":30.83926963806152},"model":320433149,"heading":270}],"hideUi":false}'),
	(2, 'community_mrpd 2', '{"coords":{"x":468.6697998046875,"y":-1014.4520263671875,"z":26.53623962402343},"groups":{"police":0},"maxDistance":2.5,"state":1,"doors":[{"coords":{"x":469.9679870605469,"y":-1014.4520263671875,"z":26.53623962402343},"model":-2023754432,"heading":180},{"coords":{"x":467.3716125488281,"y":-1014.4520263671875,"z":26.53623962402343},"model":-2023754432,"heading":0}],"hideUi":false}'),
	(3, 'community_mrpd 3', '{"coords":{"x":463.4783020019531,"y":-1003.5380249023438,"z":25.00598907470703},"model":-1033001619,"groups":{"police":0},"heading":0,"maxDistance":2,"state":1,"hideUi":false}'),
	(4, 'community_mrpd 4', '{"coords":{"x":488.8948059082031,"y":-1017.2100219726563,"z":27.14863014221191},"auto":true,"lockSound":"button-remote","groups":{"police":0},"heading":90,"maxDistance":5,"state":1,"model":-1603817716,"hideUi":false}'),
	(5, 'community_mrpd 5', '{"coords":{"x":431.4056091308594,"y":-1001.1690063476563,"z":26.71261024475097},"auto":true,"lockSound":"button-remote","groups":{"police":0},"heading":0,"maxDistance":5,"state":1,"model":-190780785,"hideUi":false}'),
	(6, 'community_mrpd 6', '{"coords":{"x":436.223388671875,"y":-1001.1690063476563,"z":26.71261024475097},"auto":true,"lockSound":"button-remote","groups":{"police":0},"heading":0,"maxDistance":5,"state":1,"model":-190780785,"hideUi":false}'),
	(7, 'community_mrpd 7', '{"coords":{"x":450.10418701171877,"y":-985.7384033203125,"z":30.83930969238281},"model":1557126584,"groups":{"police":0,"offpolice":0},"heading":90,"maxDistance":2,"state":1,"hideUi":false}'),
	(8, 'community_mrpd 8', '{"coords":{"x":464.15838623046877,"y":-1011.260009765625,"z":33.01121139526367},"model":507213820,"groups":{"police":0},"heading":0,"maxDistance":2,"state":1,"hideUi":false}'),
	(9, 'community_mrpd 9', '{"coords":{"x":461.2864990234375,"y":-985.3206176757813,"z":30.83926963806152},"model":749848321,"groups":{"police":0},"heading":90,"maxDistance":2,"state":1,"hideUi":false}'),
	(10, 'community_mrpd 10', '{"coords":{"x":446.57281494140627,"y":-980.0106201171875,"z":30.83930969238281},"model":-1320876379,"groups":{"police":0},"heading":180,"maxDistance":2,"state":1,"hideUi":false}'),
	(11, 'community_mrpd 11', '{"coords":{"x":453.09381103515627,"y":-983.2293701171875,"z":30.83926963806152},"model":-1033001619,"groups":{"police":0},"heading":91,"maxDistance":2,"state":1,"hideUi":false}'),
	(12, 'community_mrpd 12', '{"coords":{"x":464.36138916015627,"y":-984.677978515625,"z":43.83443832397461},"model":-340230128,"groups":{"police":0},"heading":90,"maxDistance":2,"state":1,"hideUi":false}'),
	(13, 'community_mrpd 13', '{"coords":{"x":442.6625061035156,"y":-988.2412719726563,"z":26.81977081298828},"model":-131296141,"groups":{"police":0},"heading":179,"maxDistance":2,"state":1,"hideUi":false}'),
	(14, 'community_mrpd 14', '{"coords":{"x":471.3153991699219,"y":-986.1090698242188,"z":25.05794906616211},"model":-131296141,"groups":{"police":0},"heading":270,"maxDistance":2,"state":1,"hideUi":false}'),
	(15, 'community_mrpd 15', '{"coords":{"x":467.5935974121094,"y":-977.9932861328125,"z":25.05794906616211},"model":-131296141,"groups":{"police":0},"heading":180,"maxDistance":2,"state":1,"hideUi":false}'),
	(16, 'community_mrpd 16', '{"coords":{"x":463.6145935058594,"y":-980.5814208984375,"z":25.05794906616211},"model":-131296141,"groups":{"police":0},"heading":90,"maxDistance":2,"state":1,"hideUi":false}'),
	(17, 'community_mrpd 17', '{"coords":{"x":464.5701904296875,"y":-992.6641235351563,"z":25.0644302368164},"model":631614199,"lockSound":"metal-locker","groups":{"police":0},"heading":0,"maxDistance":2,"state":1,"unlockSound":"metallic-creak","hideUi":false}'),
	(18, 'community_mrpd 18', '{"coords":{"x":461.8064880371094,"y":-994.4086303710938,"z":25.0644302368164},"model":631614199,"lockSound":"metal-locker","groups":{"police":0},"heading":270,"maxDistance":2,"state":1,"unlockSound":"metallic-creak","hideUi":false}'),
	(19, 'community_mrpd 19', '{"coords":{"x":461.8064880371094,"y":-997.6583862304688,"z":25.0644302368164},"model":631614199,"lockSound":"metal-locker","groups":{"police":0},"heading":90,"maxDistance":2,"state":1,"unlockSound":"metallic-creak","hideUi":false}'),
	(20, 'community_mrpd 20', '{"coords":{"x":461.8064880371094,"y":-1001.302001953125,"z":25.0644302368164},"model":631614199,"lockSound":"metal-locker","groups":{"police":0},"heading":90,"maxDistance":2,"state":1,"unlockSound":"metallic-creak","hideUi":false}'),
	(21, 'community_mrpd 21', '{"coords":{"x":467.19219970703127,"y":-996.4594116210938,"z":25.00598907470703},"model":-1033001619,"groups":{"police":0},"heading":0,"maxDistance":2,"state":1,"hideUi":false}'),
	(22, 'community_mrpd 22', '{"coords":{"x":471.4754943847656,"y":-996.4594116210938,"z":25.00598907470703},"model":-1033001619,"groups":{"police":0},"heading":0,"maxDistance":2,"state":1,"hideUi":false}'),
	(23, 'community_mrpd 23', '{"coords":{"x":475.7543029785156,"y":-996.4594116210938,"z":25.00598907470703},"model":-1033001619,"groups":{"police":0},"heading":0,"maxDistance":2,"state":1,"hideUi":false}'),
	(24, 'community_mrpd 24', '{"coords":{"x":480.03009033203127,"y":-996.4594116210938,"z":25.00598907470703},"model":-1033001619,"groups":{"police":0},"heading":0,"maxDistance":2,"state":1,"hideUi":false}'),
	(25, 'community_mrpd 25', '{"coords":{"x":468.4872131347656,"y":-1003.5479736328125,"z":25.01313972473144},"model":-1033001619,"groups":{"police":0},"heading":180,"maxDistance":2,"state":1,"hideUi":false}'),
	(26, 'community_mrpd 26', '{"coords":{"x":471.4747009277344,"y":-1003.5380249023438,"z":25.01222991943359},"model":-1033001619,"groups":{"police":0},"heading":0,"maxDistance":2,"state":1,"hideUi":false}'),
	(27, 'community_mrpd 27', '{"coords":{"x":477.0495910644531,"y":-1003.552001953125,"z":25.01203918457031},"auto":false,"groups":{"police":0},"heading":179,"lockpick":false,"maxDistance":2,"state":1,"model":-1033001619,"hideUi":false}'),
	(28, 'community_mrpd 28', '{"coords":{"x":480.03009033203127,"y":-1003.5380249023438,"z":25.00598907470703},"model":-1033001619,"groups":{"police":0},"heading":0,"maxDistance":2,"state":1,"hideUi":false}'),
	(29, 'community_mrpd 29', '{"coords":{"x":444.7078857421875,"y":-989.4453735351563,"z":30.83930969238281},"groups":{"police":0},"maxDistance":2.5,"state":1,"doors":[{"coords":{"x":443.4078063964844,"y":-989.4453735351563,"z":30.83930969238281},"model":185711165,"heading":180},{"coords":{"x":446.00799560546877,"y":-989.4453735351563,"z":30.83930969238281},"model":185711165,"heading":0}],"hideUi":false}'),
	(30, 'community_mrpd 30', '{"coords":{"x":445.9197998046875,"y":-999.0016479492188,"z":30.7890396118164},"groups":{"police":0},"maxDistance":2.5,"state":1,"doors":[{"coords":{"x":447.2184143066406,"y":-999.0023193359375,"z":30.78941917419433},"model":-1033001619,"heading":180},{"coords":{"x":444.6211853027344,"y":-999.0009765625,"z":30.78866004943847},"model":-1033001619,"heading":0}],"hideUi":false}'),
	(31, 'community_mrpd 31', '{"coords":{"x":445.9298400878906,"y":-997.044677734375,"z":30.84351921081543},"groups":{"police":0},"maxDistance":2.5,"state":0,"doors":[{"coords":{"x":444.62939453125,"y":-997.044677734375,"z":30.84351921081543},"model":-2023754432,"heading":0},{"coords":{"x":447.23028564453127,"y":-997.044677734375,"z":30.84351921081543},"model":-2023754432,"heading":180}],"hideUi":false}'),
	(32, 'sasp 1', '{"groups":{"police":0},"doors":[{"coords":{"x":381.7760009765625,"y":-1594.2769775390626,"z":30.2012825012207},"model":618295057,"heading":140},{"coords":{"x":379.7842102050781,"y":-1592.605712890625,"z":30.2012825012207},"model":1670919150,"heading":140}],"maxDistance":2,"coords":{"x":380.78009033203127,"y":-1593.44140625,"z":30.2012825012207},"state":1}'),
	(34, 'gav 1 sasp', '{"groups":{"police":0},"model":-674638964,"doors":false,"maxDistance":2,"heading":320,"coords":{"x":369.0669250488281,"y":-1605.6873779296876,"z":29.9421272277832},"state":0}'),
	(35, 'gav 2 sasp', '{"groups":{"police":0},"model":-674638964,"doors":false,"maxDistance":2,"heading":140,"coords":{"x":368.266845703125,"y":-1605.0159912109376,"z":29.9421272277832},"state":0}'),
	(36, 'sasp back 2', '{"groups":{"police":0},"doors":[{"coords":{"x":371.511962890625,"y":-1615.8707275390626,"z":30.2012825012207},"model":1670919150,"heading":320},{"coords":{"x":369.5201721191406,"y":-1614.1993408203126,"z":30.2012825012207},"model":618295057,"heading":320}],"maxDistance":2,"coords":{"x":370.51605224609377,"y":-1615.0350341796876,"z":30.2012825012207},"state":0}'),
	(37, 'sasp garage', '{"groups":{"police":0},"model":1286535678,"doors":false,"maxDistance":2,"heading":140,"coords":{"x":397.8851013183594,"y":-1607.3861083984376,"z":28.34165573120117},"auto":true,"state":0}'),
	(38, 'saps cell 1 bas', '{"groups":{"police":0},"model":-674638964,"doors":false,"maxDistance":2,"heading":140,"coords":{"x":375.077880859375,"y":-1598.4345703125,"z":25.34305763244629},"state":0}'),
	(39, 'sasps bas 2', '{"groups":{"police":0},"model":-674638964,"doors":false,"maxDistance":2,"heading":320,"coords":{"x":375.8779602050781,"y":-1599.1058349609376,"z":25.34305763244629},"state":0}'),
	(40, 'sams', '{"groups":{"ems":0,"ambulance":0},"doors":[{"coords":{"x":300.0307922363281,"y":-583.7262573242188,"z":42.28400802612305},"model":661758796,"heading":250},{"coords":{"x":299.22784423828127,"y":-585.9323120117188,"z":42.28400802612305},"model":-487908756,"heading":250}],"maxDistance":2,"coords":{"x":299.62933349609377,"y":-584.8292846679688,"z":42.28400802612305},"auto":true,"state":0}'),
	(42, 'upnatom 1', '{"groups":{"upnatom":0},"doors":[{"coords":{"x":80.4225082397461,"y":275.83892822265627,"z":110.56688690185547},"model":2050300835,"heading":160},{"coords":{"x":82.76136016845703,"y":274.9876708984375,"z":110.56688690185547},"model":-862896030,"heading":340}],"maxDistance":2,"coords":{"x":81.59193420410156,"y":275.4132995605469,"z":110.56688690185547},"state":0}'),
	(43, 'up2', '{"groups":{"upnatom":0},"doors":[{"coords":{"x":79.17525482177735,"y":287.7790832519531,"z":110.56688690185547},"model":-862896030,"heading":250},{"coords":{"x":80.02653503417969,"y":290.117919921875,"z":110.56688690185547},"model":2050300835,"heading":70}],"maxDistance":2,"coords":{"x":79.60089111328125,"y":288.948486328125,"z":110.56688690185547},"state":0}'),
	(44, 'mecha1', '{"groups":{"mechanic":0},"model":270330101,"doors":false,"maxDistance":2,"heading":270,"coords":{"x":823.8389892578125,"y":-812.9501953125,"z":27.39545822143554},"auto":true,"state":0}'),
	(45, 'mecha 2', '{"groups":{"mechanic":0},"model":270330101,"doors":false,"maxDistance":2,"heading":270,"coords":{"x":823.8390502929688,"y":-820.27099609375,"z":27.39545822143554},"auto":true,"state":0}'),
	(46, 'mecha 3', '{"groups":{"mechanic":0},"model":-147325430,"doors":false,"maxDistance":2,"heading":90,"coords":{"x":823.7611694335938,"y":-828.9948120117188,"z":26.48237609863281},"state":0}'),
	(47, 'mecha 4', '{"groups":{"mechanic":0},"model":-147325430,"doors":false,"maxDistance":2,"heading":0,"coords":{"x":800.3914794921875,"y":-824.3545532226563,"z":26.48451614379882},"state":0}'),
	(48, 'mecha 5', '{"groups":{"mechanic":0},"model":270330101,"doors":false,"maxDistance":2,"heading":270,"coords":{"x":823.8389892578125,"y":-805.58203125,"z":27.39545822143554},"auto":true,"state":0}'),
	(49, 'harmo 1', '{"groups":{"harmony":0},"model":1335311341,"doors":false,"maxDistance":2,"heading":180,"coords":{"x":1187.2027587890626,"y":2644.949951171875,"z":38.55176544189453},"state":0}'),
	(50, 'harmony 2', '{"groups":{"harmony":0},"model":-822900180,"doors":false,"maxDistance":2,"heading":180,"coords":{"x":1182.305908203125,"y":2645.232177734375,"z":38.63961410522461},"auto":true,"state":0}'),
	(51, 'harmo 3', '{"groups":{"harmony":0},"model":-822900180,"doors":false,"maxDistance":2,"heading":180,"coords":{"x":1174.6546630859376,"y":2645.221923828125,"z":38.63961410522461},"auto":true,"state":0}'),
	(52, 'pops', '{"groups":{"pops":0},"model":-1428884643,"doors":false,"maxDistance":2,"heading":245,"coords":{"x":1595.5367431640626,"y":6451.9404296875,"z":25.01383018493652},"state":0}'),
	(53, 'pops2', '{"groups":{"pops":0},"model":861832298,"doors":false,"maxDistance":2,"heading":245,"coords":{"x":1581.062255859375,"y":6458.740234375,"z":25.01383018493652},"state":0}'),
	(54, 'doj', '{"groups":{"doj":0},"doors":[{"coords":{"x":-543.488525390625,"y":-191.8074493408203,"z":38.43664169311523},"model":-1940023190,"heading":300},{"coords":{"x":-544.13818359375,"y":-190.68182373046876,"z":38.43664169311523},"model":-1940023190,"heading":120}],"maxDistance":2,"coords":{"x":-543.8133544921875,"y":-191.24462890625,"z":38.43664169311523},"state":0}'),
	(56, 'doj2', '{"groups":{"doj":0},"doors":[{"coords":{"x":-556.5889282226563,"y":-199.36883544921876,"z":38.43664169311523},"model":-1940023190,"heading":300},{"coords":{"x":-557.2386474609375,"y":-198.2432098388672,"z":38.43664169311523},"model":-1940023190,"heading":120}],"maxDistance":2,"coords":{"x":-556.913818359375,"y":-198.8060302734375,"z":38.43664169311523},"state":0}'),
	(57, 'vec3(148.026611, -1044.363892, 29.506933)', '{"model":2121050683,"doors":false,"maxDistance":2,"heading":250,"coords":{"x":148.026611328125,"y":-1044.3638916015626,"z":29.50693321228027},"state":0}'),
	(58, 'real', '{"groups":{"realestate":0},"heading":295,"doors":false,"maxDistance":2,"state":0,"model":1901183774,"coords":{"x":-716.35009765625,"y":270.5545654296875,"z":84.79842376708985}}'),
	(59, 'real 2', '{"groups":{"realestate":0},"doors":[{"coords":{"x":-699.6559448242188,"y":271.8886413574219,"z":83.41496276855469},"model":-1922281023,"heading":115},{"coords":{"x":-698.7478637695313,"y":269.9759826660156,"z":83.41462707519531},"model":-1922281023,"heading":295}],"maxDistance":2,"state":0,"coords":{"x":-699.201904296875,"y":270.93231201171877,"z":83.414794921875}}'),
	(60, 'vec3(1866.088013, 3099.845947, 47.405285)', '{"heading":118,"model":-1852144354,"state":1,"doors":false,"maxDistance":2,"coords":{"x":1866.0880126953126,"y":3099.845947265625,"z":47.4052848815918},"groups":{"admin":0}}'),
	(61, 'vec3(1877.464478, 3103.675537, 47.529575)', '{"heading":298,"model":324176020,"state":1,"doors":false,"maxDistance":2,"coords":{"x":1877.4644775390626,"y":3103.675537109375,"z":47.52957534790039},"groups":{"admin":0}}'),
	(62, 'vec3(1902.086426, 3117.055420, 47.427799)', '{"heading":124,"model":324176020,"state":1,"doors":false,"maxDistance":2,"coords":{"x":1902.08642578125,"y":3117.055419921875,"z":47.42779922485351},"groups":{"admin":0}}'),
	(63, 'vec3(1912.934937, 3122.022217, 47.466637)', '{"heading":304,"model":-1852144354,"state":1,"doors":false,"maxDistance":2,"coords":{"x":1912.9349365234376,"y":3122.022216796875,"z":47.46663665771484},"groups":{"admin":0}}'),
	(64, 'vec3(1900.465088, 3102.005615, 47.408619)', '{"heading":79,"model":-1852144354,"state":1,"doors":false,"maxDistance":2,"coords":{"x":1900.465087890625,"y":3102.005615234375,"z":47.40861892700195},"groups":{"admin":0}}'),
	(65, 'vec3(1892.489380, 3094.183838, 47.542023)', '{"heading":16,"model":324176020,"state":1,"doors":false,"maxDistance":2,"coords":{"x":1892.4893798828126,"y":3094.183837890625,"z":47.54202270507812},"groups":{"admin":0}}'),
	(66, 'vec3(1894.057373, 3082.167725, 47.430191)', '{"heading":198,"model":-1852144354,"state":1,"doors":false,"maxDistance":2,"coords":{"x":1894.057373046875,"y":3082.167724609375,"z":47.43019104003906},"groups":{"admin":0}}'),
	(68, 'villa GM', '{"state":1,"doors":[{"coords":{"x":1303.154296875,"y":-721.3006591796875,"z":68.16744232177735},"heading":67,"model":-1574151574},{"coords":{"x":1301.33642578125,"y":-725.6060791015625,"z":68.16744232177735},"heading":67,"model":1215477734}],"maxDistance":2,"coords":{"x":1302.245361328125,"y":-723.453369140625,"z":68.16744232177735},"passcode":"02632"}'),
	(69, 'porte sous sol villa gm', '{"heading":68,"model":-543490328,"state":1,"doors":false,"maxDistance":2,"coords":{"x":1337.7459716796876,"y":-755.250244140625,"z":69.02145385742188},"passcode":"02632"}'),
	(70, 'uni', '{"model":-1116041313,"groups":{"unicorn":0},"state":1,"doors":false,"maxDistance":2,"heading":30,"coords":{"x":128.15158081054688,"y":-1298.86474609375,"z":29.39959144592285}}'),
	(71, 'uni 2', '{"model":390840000,"groups":{"unicorn":0},"state":1,"doors":false,"maxDistance":2,"heading":211,"coords":{"x":123.66561126708985,"y":-1293.9012451171876,"z":29.39165306091308}}'),
	(72, 'uni 3', '{"groups":{"unicorn":0},"state":1,"doors":[{"heading":301,"model":-1912787471,"coords":{"x":119.21638488769531,"y":-1298.3006591796876,"z":29.33167266845703}},{"heading":121,"model":5739168,"coords":{"x":120.04254913330078,"y":-1299.6439208984376,"z":29.36252212524414}}],"maxDistance":2,"coords":{"x":119.62947082519531,"y":-1298.9722900390626,"z":29.34709739685058}}'),
	(73, 'uni 5', '{"model":390840000,"groups":{"unicorn":0},"state":1,"doors":false,"maxDistance":2,"heading":119,"coords":{"x":115.38945770263672,"y":-1301.881103515625,"z":29.39378929138183}}'),
	(74, 'unicorn cuiz', '{"groups":{"unicorn":0},"state":1,"doors":[{"heading":147,"model":390840000,"coords":{"x":129.92926025390626,"y":-1319.5706787109376,"z":19.57453155517578}},{"heading":327,"model":390840000,"coords":{"x":127.75621795654297,"y":-1318.1505126953126,"z":19.57785034179687}}],"maxDistance":2,"coords":{"x":128.84274291992188,"y":-1318.860595703125,"z":19.57619094848632}}'),
	(75, 'unicorn cuiz2', '{"groups":{"unicorn":0},"state":1,"doors":[{"heading":147,"model":390840000,"coords":{"x":142.63906860351563,"y":-1326.469970703125,"z":19.5399169921875}},{"heading":327,"model":390840000,"coords":{"x":140.4521484375,"y":-1325.0782470703126,"z":19.5399169921875}}],"maxDistance":2,"coords":{"x":141.5456085205078,"y":-1325.774169921875,"z":19.5399169921875}}'),
	(76, 'unicorn ggg', '{"model":736699661,"groups":{"unicorn":0},"state":1,"doors":false,"maxDistance":2,"heading":55,"coords":{"x":143.92269897460938,"y":-1330.33984375,"z":20.42727470397949}}'),
	(77, 'unicorn ffdd', '{"model":736699661,"groups":{"unicorn":0},"state":1,"doors":false,"maxDistance":2,"heading":327,"coords":{"x":144.22021484375,"y":-1333.6419677734376,"z":20.45333671569824}}'),
	(78, 'unicorn', '{"model":-626684119,"groups":{"unicorn":0},"state":1,"doors":false,"maxDistance":2,"heading":57,"coords":{"x":110.56449127197266,"y":-1335.489501953125,"z":24.80398559570312}}'),
	(79, 'unicorn yara', '{"model":93377375,"heading":327,"state":1,"doors":false,"maxDistance":2,"passcode":"5050","coords":{"x":115.95541381835938,"y":-1321.2496337890626,"z":24.80442237854004}}'),
	(80, 'vec3(309.325134, -721.587463, 29.517673)', '{"state":0,"doors":[{"heading":69,"model":709926823,"coords":{"x":309.7514953613281,"y":-720.4646606445313,"z":29.51767349243164}},{"heading":69,"model":-1438507124,"coords":{"x":308.8987731933594,"y":-722.7102661132813,"z":29.51767349243164}}],"maxDistance":2,"passcode":"02632","coords":{"x":309.32513427734377,"y":-721.5874633789063,"z":29.51767349243164}}'),
	(81, 'ambuoance bas', '{"groups":{"ambulance":0},"state":0,"maxDistance":2,"coords":{"x":354.7629699707031,"y":-580.9067993164063,"z":27.87432098388672},"doors":[{"heading":99,"model":-1880717552,"coords":{"x":354.5923156738281,"y":-579.8651733398438,"z":27.87210845947265}},{"heading":279,"model":-1880717552,"coords":{"x":354.9336242675781,"y":-581.9484252929688,"z":27.87653350830078}}]}');

-- Listage de la structure de table zak. ox_inventory
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.ox_inventory : ~0 rows (environ)

-- Listage de la structure de table zak. p_bank_accounts
CREATE TABLE IF NOT EXISTS `p_bank_accounts` (
  `iban` varchar(40) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `type` varchar(10) NOT NULL,
  `credit_score` int(11) NOT NULL DEFAULT 0,
  `users` longtext NOT NULL DEFAULT '[]',
  `invoices` longtext NOT NULL DEFAULT '[]',
  `transactions` longtext NOT NULL DEFAULT '[]',
  `logs` longtext NOT NULL DEFAULT '[]',
  PRIMARY KEY (`iban`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.p_bank_accounts : ~23 rows (environ)
INSERT INTO `p_bank_accounts` (`iban`, `owner`, `name`, `balance`, `type`, `credit_score`, `users`, `invoices`, `transactions`, `logs`) VALUES
	('0747067614', 'society_cardealer', 'Cardealer', 0, 'society', 0, '[]', '[]', '[]', '[]'),
	('1928428000', 'char0:28a24dc4b57feb9580c57626e3c03439a900f876', 'Jessy Jhon', 55300, 'personal', 500, '[]', '[]', '[{"title":"Welfare Check","id":1,"amount":200,"date":1764511906,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":2,"amount":200,"date":1764512326,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":3,"amount":200,"date":1764512746,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":4,"amount":200,"date":1764513166,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":5,"amount":200,"date":1764513586,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":6,"amount":200,"date":1764514006,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":7,"amount":200,"date":1764517215,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":8,"amount":200,"date":1764517636,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":9,"amount":200,"date":1764518056,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":10,"amount":200,"date":1764592830,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"unknown","id":11,"amount":8000,"date":1764593212,"to":"SYSTEM","from":"Jessy Jhon","type":"outcome"},{"title":"Welfare Check","id":12,"amount":200,"date":1764673994,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":13,"amount":200,"date":1765143792,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":14,"amount":200,"date":1765144212,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":15,"amount":200,"date":1765144632,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":16,"amount":200,"date":1765145052,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":17,"amount":200,"date":1765145472,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":18,"amount":200,"date":1765145892,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":19,"amount":200,"date":1765146312,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":20,"amount":200,"date":1765146732,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":21,"amount":200,"date":1765147152,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":22,"amount":200,"date":1765147572,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":23,"amount":200,"date":1765147992,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":24,"amount":200,"date":1765148412,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":25,"amount":200,"date":1765148832,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":26,"amount":200,"date":1765149252,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":27,"amount":200,"date":1765149672,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":28,"amount":200,"date":1765150092,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":29,"amount":200,"date":1765150512,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":30,"amount":200,"date":1765150932,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":31,"amount":200,"date":1765151352,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":32,"amount":200,"date":1765151773,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":33,"amount":200,"date":1765152193,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":34,"amount":200,"date":1765152613,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":35,"amount":200,"date":1765153033,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":36,"amount":200,"date":1765153453,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":37,"amount":200,"date":1765153873,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":38,"amount":200,"date":1765154293,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":39,"amount":200,"date":1765154713,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":40,"amount":200,"date":1765155133,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":41,"amount":200,"date":1765155553,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":42,"amount":200,"date":1765155973,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":43,"amount":200,"date":1765156393,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":44,"amount":200,"date":1765156813,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":45,"amount":200,"date":1765157233,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":46,"amount":200,"date":1765157653,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":47,"amount":200,"date":1765158073,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":48,"amount":200,"date":1765158493,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":49,"amount":200,"date":1765158913,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":50,"amount":200,"date":1765159333,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":51,"amount":200,"date":1765159753,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":52,"amount":200,"date":1765160173,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":53,"amount":200,"date":1765206681,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":54,"amount":200,"date":1765207101,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":55,"amount":200,"date":1765207521,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":56,"amount":200,"date":1765207941,"to":"Jessy Jhon","from":"SYSTEM","type":"income"},{"title":"Welfare Check","id":57,"amount":200,"type":"income","to":"Jessy Jhon","from":"SYSTEM","date":1765209880}]', '[]'),
	('2246382272', 'society_banker', 'Bank', 0, 'society', 0, '[]', '[]', '[]', '[]'),
	('2616818146', 'society_upnatom', 'Up\'N Atom Burger', 0, 'society', 0, '[]', '[]', '[]', '[]'),
	('3239949727', 'society_mechanic', 'Mechanic', 0, 'society', 0, '[]', '[]', '[]', '[]'),
	('3728888541', 'society_pops', 'Pop\'s Diner', 0, 'society', 0, '[]', '[]', '[]', '[]'),
	('3946281774', 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Yanis Dev', 622050, 'personal', 500, '[]', '[]', '[{"id":9,"date":1764868391,"type":"income","to":"Yanis Dev","from":"Y Dv","title":"Déposer","amount":1000000},{"id":1,"type":"outcome","date":1764355880,"to":"SYSTEM","from":"Yanis Dev","title":"unknown","amount":2},{"id":2,"type":"income","date":1764367691,"to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":3,"type":"income","date":1764524078,"to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":4,"type":"income","date":1764524498,"to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":5,"type":"income","date":1764524918,"to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":6,"type":"income","date":1764525338,"to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":7,"type":"income","date":1764525758,"to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":8,"type":"income","date":1764526520,"to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":10,"date":1764868434,"type":"outcome","to":"SYSTEM","from":"Yanis Dev","title":"unknown","amount":500000},{"id":11,"date":1764880026,"type":"income","to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":12,"date":1764880446,"type":"income","to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":13,"date":1764880866,"type":"income","to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":14,"date":1765065660,"type":"income","to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":15,"type":"income","date":1765066080,"to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":16,"date":1765066500,"type":"income","to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":17,"type":"income","date":1765066920,"to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":18,"date":1765067340,"type":"income","to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":19,"type":"income","date":1765067760,"to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":20,"date":1765068180,"type":"income","to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":21,"type":"income","date":1765068601,"to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":22,"date":1765112591,"type":"income","to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":23,"type":"income","date":1765113011,"to":"Yanis Dev","amount":200,"title":"Welfare Check","from":"SYSTEM"},{"id":24,"date":1765113431,"type":"income","to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":25,"type":"income","date":1765113851,"to":"Yanis Dev","amount":200,"title":"Welfare Check","from":"SYSTEM"},{"id":26,"date":1765114271,"type":"income","to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":27,"amount":200,"type":"income","to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","date":1765114821},{"id":28,"date":1765115241,"type":"income","to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":29,"from":"SYSTEM","type":"income","to":"Yanis Dev","amount":200,"title":"Welfare Check","date":1765119021},{"id":30,"date":1765119441,"type":"income","to":"Yanis Dev","amount":200,"title":"Welfare Check","from":"SYSTEM"},{"id":31,"amount":200,"type":"income","to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","date":1765119861},{"id":32,"date":1765120281,"type":"income","to":"Yanis Dev","from":"SYSTEM","title":"Welfare Check","amount":200},{"id":33,"from":"SYSTEM","type":"income","to":"Yanis Dev","amount":200,"title":"Welfare Check","date":1765120701}]', '[{"type":"normal","action":"Le joueur a déposé 1000000 $","player":"Y Dv","date":"18:13 04/12/2025","id":1}]'),
	('4181801862', 'society_casino', 'Casino', 0, 'society', 0, '[]', '[]', '[]', '[]'),
	('4328534489', 'society_police', 'Police', 0, 'society', 0, '[]', '[]', '[]', '[]'),
	('4439741968', 'society_realestate', 'Real Estate Society', 0, 'society', 0, '[]', '[]', '[]', '[]'),
	('4479697461', 'society_ambulance', 'EMS', 0, 'society', 0, '[]', '[]', '[]', '[]'),
	('4579442701', 'char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 'Karl Miller', 90189, 'personal', 500, '[]', '[]', '[{"to":"Karl Miller","title":"Welfare Check","date":1764518476,"amount":200,"id":1,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764518896,"amount":200,"id":2,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764687784,"amount":200,"id":3,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764688204,"amount":200,"id":4,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764688624,"amount":200,"id":5,"type":"income","from":"SYSTEM"},{"to":"SYSTEM","title":"unknown","date":1764688754,"amount":20000,"id":6,"type":"outcome","from":"Karl Miller"},{"to":"Karl Miller","title":"Welfare Check","date":1764689044,"amount":200,"id":7,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764689464,"amount":200,"id":8,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764689884,"amount":200,"id":9,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764690304,"amount":200,"id":10,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764690724,"amount":200,"id":11,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764691144,"amount":200,"id":12,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764691564,"amount":200,"id":13,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764691984,"amount":200,"id":14,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764692404,"amount":200,"id":15,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764692824,"amount":200,"id":16,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764693244,"amount":200,"id":17,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764693664,"amount":200,"id":18,"type":"income","from":"SYSTEM"},{"to":"SYSTEM","title":"unknown","date":1764695826,"amount":3800,"id":19,"type":"outcome","from":"Karl Miller"},{"to":"Karl Miller","title":"Welfare Check","date":1764696133,"amount":200,"id":20,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764696553,"amount":200,"id":21,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764865325,"amount":200,"id":22,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764865745,"amount":200,"id":23,"type":"income","from":"SYSTEM"},{"to":"SYSTEM","title":"unknown","date":1764866089,"amount":5000,"id":24,"type":"outcome","from":"Karl Miller"},{"to":"SYSTEM","title":"unknown","date":1764866111,"amount":5000,"id":25,"type":"outcome","from":"Karl Miller"},{"to":"Karl Miller","title":"Welfare Check","date":1764866165,"amount":200,"id":26,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764866585,"amount":200,"id":27,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764867005,"amount":200,"id":28,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764867425,"amount":200,"id":29,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764867845,"amount":200,"id":30,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764868265,"amount":200,"id":31,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764868685,"amount":200,"id":32,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764869105,"amount":200,"id":33,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764869525,"amount":200,"id":34,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"unknown","date":1764869612,"amount":122,"id":35,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764869945,"amount":200,"id":36,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764870365,"amount":200,"id":37,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764870785,"amount":200,"id":38,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764871205,"amount":200,"id":39,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764871625,"amount":200,"id":40,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764872045,"amount":200,"id":41,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"unknown","date":1764872403,"amount":170,"id":42,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764872465,"amount":200,"id":43,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764872885,"amount":200,"id":44,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1764873305,"amount":200,"id":45,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765067760,"amount":200,"id":46,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765068180,"amount":200,"id":47,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765068601,"amount":200,"id":48,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765069021,"amount":200,"id":49,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765069488,"amount":200,"id":50,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"unknown","date":1765069736,"amount":330,"id":51,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765069908,"amount":200,"id":52,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765070328,"amount":200,"id":53,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765070748,"amount":200,"id":54,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765071168,"amount":200,"id":55,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765071588,"amount":200,"id":56,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765072008,"amount":200,"id":57,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"unknown","date":1765072096,"amount":130,"id":58,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765072428,"amount":200,"id":59,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"unknown","date":1765072583,"amount":52,"id":60,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765072849,"amount":200,"id":61,"type":"income","from":"SYSTEM"},{"to":"SYSTEM","title":"unknown","date":1765073222,"amount":15000,"id":62,"type":"outcome","from":"Karl Miller"},{"to":"Karl Miller","title":"Welfare Check","date":1765073269,"amount":200,"id":63,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765073689,"amount":200,"id":64,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765147992,"amount":200,"id":65,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765148412,"amount":200,"id":66,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765148832,"amount":200,"id":67,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765149252,"amount":200,"id":68,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765149672,"amount":200,"id":69,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765150092,"amount":200,"id":70,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765150512,"amount":200,"id":71,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765150932,"amount":200,"id":72,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765151352,"amount":200,"id":73,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765153033,"amount":200,"id":74,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765153453,"amount":200,"id":75,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"Welfare Check","date":1765153873,"amount":200,"id":76,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"unknown","date":1765156769,"amount":81,"id":77,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"unknown","date":1765156786,"amount":3690,"id":78,"type":"income","from":"SYSTEM"},{"to":"Karl Miller","title":"unknown","from":"SYSTEM","amount":70110,"id":79,"type":"income","date":1765156795},{"to":"Karl Miller","title":"unknown","from":"SYSTEM","amount":47,"id":80,"type":"income","date":1765213313},{"to":"Karl Miller","title":"unknown","date":1765214634,"amount":121,"id":81,"type":"income","from":"SYSTEM"}]', '[]'),
	('5527573270', 'society_beans', 'Beans Coffee', 0, 'society', 0, '[]', '[]', '[]', '[]'),
	('5572334446', 'fcb47b307801e586e8c95881bdfc98004f24d031', 'trest', 4951245, 'personal', 500, '[]', '[]', '[{"id":22,"type":"income","date":1764179744,"amount":5000000,"to":"trest","from":"Zak Dev","title":"Déposer"},{"id":5,"type":"income","date":1764125398,"amount":10000,"to":"trest","from":"Banque","title":"Prêt"},{"id":3,"type":"outcome","date":1764124792,"amount":500,"to":"Zak Dev","from":"trest","title":"Retirer"},{"id":2,"type":"income","date":1764124791,"amount":500,"to":"trest","from":"Zak Dev","title":"Déposer"},{"id":1,"type":"outcome","date":1764124786,"amount":500,"to":"Zak Dev","from":"trest","title":"Retirer"},{"id":4,"type":"income","date":1764125100,"amount":200,"to":"trest","from":"SYSTEM","title":"Welfare Check"},{"id":6,"type":"income","date":1764153607,"amount":20,"to":"trest","from":"SYSTEM","title":"unknown"},{"id":7,"type":"outcome","date":1764161165,"amount":462,"to":"SYSTEM","from":"trest","title":"unknown"},{"id":8,"type":"outcome","date":1764162887,"amount":1,"to":"SYSTEM","from":"trest","title":"unknown"},{"id":9,"type":"outcome","date":1764168899,"amount":2,"to":"SYSTEM","from":"trest","title":"unknown"},{"id":10,"type":"outcome","date":1764169164,"amount":2,"to":"SYSTEM","from":"trest","title":"unknown"},{"id":11,"type":"outcome","date":1764169534,"amount":2,"to":"SYSTEM","from":"trest","title":"unknown"},{"id":12,"type":"income","date":1764174768,"amount":200,"to":"trest","from":"SYSTEM","title":"Welfare Check"},{"id":13,"type":"income","date":1764175189,"amount":200,"to":"trest","from":"SYSTEM","title":"Welfare Check"},{"id":14,"type":"income","date":1764175874,"amount":200,"to":"trest","from":"SYSTEM","title":"Welfare Check"},{"id":15,"type":"income","date":1764176294,"amount":200,"to":"trest","from":"SYSTEM","title":"Welfare Check"},{"id":16,"type":"income","date":1764178032,"amount":200,"to":"trest","from":"SYSTEM","title":"Welfare Check"},{"id":17,"type":"income","date":1764178564,"amount":200,"to":"trest","from":"SYSTEM","title":"Welfare Check"},{"id":18,"type":"income","date":1764178984,"amount":200,"to":"trest","from":"SYSTEM","title":"Welfare Check"},{"id":19,"type":"outcome","date":1764179410,"amount":2,"to":"SYSTEM","from":"trest","title":"unknown"},{"id":20,"type":"outcome","date":1764179443,"amount":10000,"to":"SYSTEM","from":"trest","title":"unknown"},{"id":21,"type":"outcome","date":1764179445,"amount":35000,"to":"SYSTEM","from":"trest","title":"unknown"},{"id":23,"type":"outcome","date":1764179773,"amount":45000,"to":"SYSTEM","from":"trest","title":"unknown"},{"id":24,"type":"outcome","date":1764179775,"amount":50000,"to":"SYSTEM","from":"trest","title":"unknown"},{"id":25,"type":"outcome","date":1764180395,"amount":2,"to":"SYSTEM","from":"trest","title":"unknown"},{"id":26,"type":"outcome","date":1764189899,"amount":2,"to":"SYSTEM","from":"trest","title":"unknown"},{"id":27,"type":"income","date":1764192644,"to":"trest","amount":20,"from":"SYSTEM","title":"unknown"},{"id":28,"type":"income","date":1764192657,"amount":20,"to":"trest","from":"SYSTEM","title":"unknown"},{"id":29,"type":"outcome","date":1764272818,"amount":5000,"to":"SYSTEM","from":"trest","title":"unknown"},{"id":30,"type":"income","date":1764285241,"amount":200,"to":"trest","from":"SYSTEM","title":"Welfare Check"},{"id":31,"title":"unknown","date":1764285381,"to":"SYSTEM","amount":200,"from":"trest","type":"outcome"},{"id":32,"type":"outcome","date":1764285386,"amount":200,"to":"SYSTEM","from":"trest","title":"unknown"},{"id":33,"title":"Welfare Check","date":1764285661,"to":"trest","amount":200,"from":"SYSTEM","type":"income"},{"id":34,"type":"income","date":1764286081,"amount":200,"to":"trest","from":"SYSTEM","title":"Welfare Check"},{"id":35,"title":"Welfare Check","date":1764286501,"to":"trest","amount":200,"from":"SYSTEM","type":"income"},{"id":36,"type":"income","date":1764286921,"amount":200,"to":"trest","from":"SYSTEM","title":"Welfare Check"},{"id":37,"to":"trest","date":1764287341,"title":"Welfare Check","amount":200,"from":"SYSTEM","type":"income"}]', '[{"date":"18:55 26/11/2025","id":5,"type":"normal","player":"Zak Dev","action":"Le joueur a déposé 5000000 $"},{"date":"03:39 26/11/2025","id":4,"type":"risk","player":"Zak Dev","action":"Le joueur a retiré 500 $"},{"date":"03:39 26/11/2025","id":3,"type":"normal","player":"Zak Dev","action":"Le joueur a déposé 500 $"},{"date":"03:39 26/11/2025","id":2,"type":"risk","player":"Zak Dev","action":"Le joueur a retiré 500 $"},{"date":"03:39 26/11/2025","id":1,"type":"normal","player":"Zak Dev","action":"Le joueur a renommé le compte de Zak Dev à trest"}]'),
	('6002403320', 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 'Luca Papapaqpa', 14000, 'personal', 500, '[]', '[]', '[{"title":"Welfare Check","from":"SYSTEM","date":1764504494,"type":"income","id":1,"to":"Luca Papapaqpa","amount":200},{"title":"Welfare Check","from":"SYSTEM","date":1764504914,"type":"income","id":2,"to":"Luca Papapaqpa","amount":200},{"title":"Welfare Check","from":"SYSTEM","date":1764508126,"type":"income","id":3,"to":"Luca Papapaqpa","amount":200},{"title":"Welfare Check","from":"SYSTEM","date":1764508546,"type":"income","id":4,"to":"Luca Papapaqpa","amount":200},{"title":"Welfare Check","from":"SYSTEM","date":1764508966,"type":"income","id":5,"to":"Luca Papapaqpa","amount":200},{"title":"unknown","from":"Luca Papapaqpa","date":1764509223,"type":"outcome","id":6,"to":"SYSTEM","amount":40000},{"title":"unknown","from":"SYSTEM","date":1764622434,"type":"income","id":7,"to":"Luca Papapaqpa","amount":5000},{"title":"unknown","from":"Luca Papapaqpa","date":1764623006,"amount":5000,"type":"outcome","id":8,"to":"SYSTEM"},{"title":"unknown","from":"Luca Papapaqpa","date":1764795294,"to":"SYSTEM","amount":5000,"type":"outcome","id":9},{"title":"unknown","from":"Luca Papapaqpa","date":1764795316,"id":10,"type":"outcome","amount":5000,"to":"SYSTEM"},{"title":"unknown","from":"SYSTEM","date":1764795320,"to":"Luca Papapaqpa","amount":5000,"type":"income","id":11}]', '[]'),
	('6549587206', 'society_unicorn', 'Unicorn Night Club', 0, 'society', 0, '[]', '[]', '[]', '[]'),
	('6755255069', 'society_concess', 'Concessionnaire', 0, 'society', 0, '[]', '[]', '[]', '[]'),
	('7459076366', 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 'Mina Palace', 962400, 'personal', 500, '[]', '[]', '[{"amount":200,"type":"income","from":"SYSTEM","id":1,"title":"Welfare Check","date":1764509386,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":2,"title":"Welfare Check","date":1764509806,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":3,"title":"Welfare Check","date":1764510226,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":4,"title":"Welfare Check","date":1764510646,"to":"Mina Palace"},{"amount":5000,"type":"outcome","from":"Mina Palace","id":5,"title":"unknown","date":1764510834,"to":"SYSTEM"},{"amount":200,"type":"income","from":"SYSTEM","id":6,"title":"Welfare Check","date":1764511066,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":7,"title":"Welfare Check","date":1764511486,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":8,"title":"Welfare Check","date":1764511906,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":9,"title":"Welfare Check","date":1764512326,"to":"Mina Palace"},{"amount":20000,"type":"outcome","from":"Mina Palace","id":10,"title":"unknown","date":1764512540,"to":"SYSTEM"},{"amount":200,"type":"income","from":"SYSTEM","id":11,"title":"Welfare Check","date":1764512746,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":12,"title":"Welfare Check","date":1764513166,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":13,"title":"Welfare Check","date":1764513586,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":14,"title":"Welfare Check","date":1764514006,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":15,"title":"Welfare Check","date":1764514426,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":16,"title":"Welfare Check","date":1764514846,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":17,"title":"Welfare Check","date":1764515266,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":18,"title":"Welfare Check","date":1764515686,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":19,"title":"Welfare Check","date":1764516795,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":20,"title":"Welfare Check","date":1764517215,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":21,"title":"Welfare Check","date":1764517636,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":22,"title":"Welfare Check","date":1764527360,"to":"Mina Palace"},{"amount":500,"type":"outcome","from":"Mina Palace","id":23,"title":"unknown","date":1764527475,"to":"SYSTEM"},{"amount":200,"type":"income","from":"SYSTEM","id":24,"title":"Welfare Check","date":1764527780,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":25,"title":"Welfare Check","date":1764528200,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":26,"title":"Welfare Check","date":1764528620,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":27,"title":"Welfare Check","date":1764529040,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":28,"title":"Welfare Check","date":1764529460,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":29,"title":"Welfare Check","date":1764529880,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":30,"title":"Welfare Check","date":1764530300,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":31,"title":"Welfare Check","date":1764531007,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":32,"title":"Welfare Check","date":1764531428,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":33,"title":"Welfare Check","date":1764531848,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":34,"title":"Welfare Check","date":1764532268,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":35,"title":"Welfare Check","date":1764532688,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":36,"title":"Welfare Check","date":1764533108,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":37,"title":"Welfare Check","date":1764533528,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":38,"title":"Welfare Check","date":1764533948,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":39,"title":"Welfare Check","date":1764534368,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":40,"title":"Welfare Check","date":1764534788,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":41,"title":"Welfare Check","date":1764535208,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":42,"title":"Welfare Check","date":1764535628,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":43,"title":"Welfare Check","date":1764536048,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":44,"title":"Welfare Check","date":1764536468,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":45,"title":"Welfare Check","date":1764536888,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":46,"title":"Welfare Check","date":1764538331,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":47,"title":"Welfare Check","date":1764538751,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":48,"title":"Welfare Check","date":1764539171,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":49,"title":"Welfare Check","date":1764707629,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":50,"title":"Welfare Check","date":1764708049,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":51,"title":"Welfare Check","date":1764708469,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":52,"title":"Welfare Check","date":1764708889,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":53,"title":"Welfare Check","date":1764709309,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":54,"title":"Welfare Check","date":1764709729,"to":"Mina Palace"},{"amount":1000000,"type":"income","from":"SYSTEM","id":55,"title":"unknown","date":1764709748,"to":"Mina Palace"},{"amount":50000,"type":"outcome","from":"Mina Palace","id":56,"title":"unknown","date":1764709752,"to":"SYSTEM"},{"amount":200,"type":"income","from":"SYSTEM","id":57,"title":"Welfare Check","date":1764710149,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":58,"title":"Welfare Check","date":1764710569,"to":"Mina Palace"},{"amount":3500,"type":"outcome","from":"Mina Palace","id":59,"title":"unknown","date":1764710648,"to":"SYSTEM"},{"amount":200,"type":"income","from":"SYSTEM","id":60,"title":"Welfare Check","date":1764710989,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":61,"title":"Welfare Check","date":1764711409,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":62,"title":"Welfare Check","date":1764789873,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":63,"title":"Welfare Check","date":1764790293,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":64,"title":"Welfare Check","date":1764790713,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":65,"title":"Welfare Check","date":1764791133,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":66,"title":"Welfare Check","date":1764791553,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":67,"title":"Welfare Check","date":1764791973,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":68,"title":"Welfare Check","date":1764792393,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":69,"title":"Welfare Check","date":1764792813,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":70,"title":"Welfare Check","date":1764793233,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":71,"title":"Welfare Check","date":1764793653,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":72,"title":"Welfare Check","date":1764794073,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":73,"title":"Welfare Check","date":1764794493,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":74,"title":"Welfare Check","date":1764794913,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":75,"title":"Welfare Check","date":1764795333,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":76,"title":"Welfare Check","date":1764795753,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":77,"title":"Welfare Check","date":1764796173,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":78,"title":"Welfare Check","date":1765059891,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":79,"title":"Welfare Check","date":1765060311,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":80,"title":"Welfare Check","date":1765060731,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":81,"title":"Welfare Check","date":1765061572,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":82,"title":"Welfare Check","date":1765061992,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":83,"title":"Welfare Check","date":1765062412,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":84,"title":"Welfare Check","date":1765062832,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":85,"title":"Welfare Check","date":1765065660,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":86,"title":"Welfare Check","date":1765066080,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":87,"title":"Welfare Check","date":1765066500,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":88,"title":"Welfare Check","date":1765066920,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":89,"title":"Welfare Check","date":1765067340,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":90,"title":"Welfare Check","date":1765067760,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":91,"title":"Welfare Check","date":1765068180,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":92,"title":"Welfare Check","date":1765068601,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":93,"title":"Welfare Check","date":1765069021,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":94,"title":"Welfare Check","date":1765113011,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":95,"title":"Welfare Check","date":1765113431,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":96,"title":"Welfare Check","date":1765113851,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":97,"title":"Welfare Check","date":1765114271,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":98,"date":1765115241,"title":"Welfare Check","to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":99,"title":"Welfare Check","date":1765115661,"to":"Mina Palace"},{"amount":200,"from":"SYSTEM","type":"income","id":100,"date":1765116081,"title":"Welfare Check","to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":101,"title":"Welfare Check","date":1765116501,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":102,"date":1765116921,"title":"Welfare Check","to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":103,"title":"Welfare Check","date":1765117761,"to":"Mina Palace"},{"amount":200,"from":"SYSTEM","type":"income","id":104,"date":1765118181,"title":"Welfare Check","to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":105,"title":"Welfare Check","date":1765118601,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":106,"date":1765119021,"title":"Welfare Check","to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":107,"title":"Welfare Check","date":1765119441,"to":"Mina Palace"},{"amount":200,"from":"SYSTEM","type":"income","id":108,"date":1765119861,"title":"Welfare Check","to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":109,"title":"Welfare Check","date":1765120281,"to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":110,"date":1765120701,"title":"Welfare Check","to":"Mina Palace"},{"amount":200,"type":"income","from":"SYSTEM","id":111,"title":"Welfare Check","date":1765121121,"to":"Mina Palace"},{"amount":200,"from":"SYSTEM","type":"income","id":112,"date":1765121542,"title":"Welfare Check","to":"Mina Palace"},{"amount":200,"type":"income","to":"Mina Palace","id":113,"date":1765137071,"title":"Welfare Check","from":"SYSTEM"},{"amount":500,"type":"outcome","from":"Mina Palace","id":114,"title":"unknown","date":1765137754,"to":"SYSTEM"},{"amount":200,"type":"income","to":"Mina Palace","id":115,"date":1765137911,"title":"Welfare Check","from":"SYSTEM"},{"amount":200,"type":"income","from":"SYSTEM","id":116,"title":"Welfare Check","date":1765138331,"to":"Mina Palace"},{"amount":200,"type":"income","to":"Mina Palace","id":117,"date":1765138751,"title":"Welfare Check","from":"SYSTEM"},{"amount":200,"type":"income","from":"SYSTEM","id":118,"title":"Welfare Check","date":1765139171,"to":"Mina Palace"},{"amount":200,"type":"income","to":"Mina Palace","id":119,"date":1765139591,"title":"Welfare Check","from":"SYSTEM"},{"amount":200,"type":"income","from":"SYSTEM","id":120,"title":"Welfare Check","date":1765140011,"to":"Mina Palace"},{"amount":200,"type":"income","to":"Mina Palace","id":121,"date":1765140431,"title":"Welfare Check","from":"SYSTEM"},{"amount":200,"type":"income","from":"SYSTEM","id":122,"title":"Welfare Check","date":1765140851,"to":"Mina Palace"},{"amount":200,"type":"income","to":"Mina Palace","id":123,"date":1765141271,"title":"Welfare Check","from":"SYSTEM"},{"amount":200,"type":"income","from":"SYSTEM","id":124,"title":"Welfare Check","date":1765141692,"to":"Mina Palace"},{"amount":200,"type":"income","to":"Mina Palace","id":125,"date":1765142112,"title":"Welfare Check","from":"SYSTEM"},{"amount":200,"type":"income","from":"SYSTEM","id":126,"title":"Welfare Check","date":1765142532,"to":"Mina Palace"},{"amount":200,"type":"income","to":"Mina Palace","id":127,"date":1765142952,"title":"Welfare Check","from":"SYSTEM"},{"amount":200,"type":"income","from":"SYSTEM","id":128,"title":"Welfare Check","date":1765143372,"to":"Mina Palace"},{"amount":200,"type":"income","to":"Mina Palace","id":129,"date":1765143792,"title":"Welfare Check","from":"SYSTEM"},{"amount":200,"type":"income","title":"Welfare Check","id":130,"from":"SYSTEM","date":1765144212,"to":"Mina Palace"},{"amount":200,"type":"income","to":"Mina Palace","id":131,"from":"SYSTEM","date":1765144632,"title":"Welfare Check"}]', '[]'),
	('7667972900', 'e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Kevin miller', 51405, 'personal', 500, '[]', '[]', '[{"to":"Kevin miller","title":"Welfare Check","from":"SYSTEM","type":"income","date":1764153163,"id":1,"amount":200},{"to":"Kevin miller","title":"Welfare Check","from":"SYSTEM","type":"income","date":1764153583,"id":2,"amount":200},{"to":"SYSTEM","amount":400,"from":"Kevin miller","type":"outcome","date":1764167308,"id":3,"title":"unknown"},{"to":"SYSTEM","amount":120,"from":"Kevin miller","type":"outcome","date":1764167342,"id":4,"title":"unknown"}]', '[]'),
	('8162852120', 'society_taxi', 'Taxi', 0, 'society', 0, '[]', '[]', '[]', '[]'),
	('8330566212', 'char0:72e2349201e0683aa2540804c45f566df0755123', 'Dante Reyes', 60084150, 'personal', 500, '[]', '[]', '[{"title":"Dépôt au distributeur","id":47,"type":"income","to":"Dante Reyes","from":"Gobe Monpaf","amount":50000000,"date":1764707633},{"title":"Déposer","id":46,"type":"income","date":1764707616,"from":"Gobe Monpaf","amount":10000000,"to":"Dante Reyes"},{"title":"Welfare Check","id":1,"type":"income","date":1764504494,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":2,"type":"income","date":1764504914,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":3,"type":"income","date":1764514846,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"unknown","id":4,"type":"income","date":1764515003,"from":"SYSTEM","amount":10000000,"to":"Dante Reyes"},{"title":"Welfare Check","id":5,"type":"income","date":1764515266,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":6,"type":"income","date":1764515686,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":7,"type":"income","date":1764516375,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":8,"type":"income","date":1764516795,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":9,"type":"income","date":1764517215,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"unknown","id":10,"type":"outcome","date":1764517327,"from":"Dante Reyes","amount":15750,"to":"SYSTEM"},{"title":"Welfare Check","id":11,"type":"income","date":1764517636,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":12,"type":"income","date":1764518056,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":13,"type":"income","date":1764524918,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":14,"type":"income","date":1764526520,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":15,"type":"income","date":1764527360,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":16,"type":"income","date":1764527780,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":17,"type":"income","date":1764528200,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":18,"type":"income","date":1764528620,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":19,"type":"income","date":1764529040,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":20,"type":"income","date":1764529460,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":21,"type":"income","date":1764531007,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":22,"type":"income","date":1764531428,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":23,"type":"income","date":1764531848,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":24,"type":"income","date":1764532268,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":25,"type":"income","date":1764532688,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":26,"type":"income","date":1764533108,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":27,"type":"income","date":1764533528,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":28,"type":"income","date":1764533948,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":29,"type":"income","date":1764534368,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":30,"type":"income","date":1764534788,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":31,"type":"income","date":1764535208,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":32,"type":"income","date":1764535628,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":33,"type":"income","date":1764536048,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":34,"type":"income","date":1764536468,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":35,"type":"income","date":1764536888,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":36,"type":"income","date":1764537911,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":37,"type":"income","date":1764538331,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":38,"type":"income","date":1764539171,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":39,"type":"income","date":1764539591,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":40,"type":"income","date":1764540011,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":41,"type":"income","date":1764540968,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":42,"type":"income","date":1764541388,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":43,"type":"income","date":1764541808,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":44,"type":"income","date":1764542846,"from":"SYSTEM","amount":200,"to":"Dante Reyes"},{"title":"Welfare Check","id":45,"type":"income","date":1764543266,"from":"SYSTEM","amount":200,"to":"Dante Reyes"}]', '[{"player":"Gobe Monpaf","id":1,"type":"normal","action":"Le joueur a déposé 10000000 $","date":"21:33 02/12/2025"}]'),
	('8542828508', 'char0:2c04a8506e426a0867af88aada9d2698cebb7d18', 'Ginoxi Ginoxi', 15600, 'personal', 500, '[]', '[]', '[{"title":"Welfare Check","from":"SYSTEM","date":1764785936,"id":1,"type":"income","to":"Ginoxi Ginoxi","amount":200},{"title":"Welfare Check","from":"SYSTEM","date":1764786356,"id":2,"type":"income","to":"Ginoxi Ginoxi","amount":200},{"title":"Welfare Check","from":"SYSTEM","date":1764786776,"id":3,"type":"income","to":"Ginoxi Ginoxi","amount":200},{"title":"Welfare Check","from":"SYSTEM","date":1764787196,"id":4,"type":"income","to":"Ginoxi Ginoxi","amount":200},{"title":"Welfare Check","from":"SYSTEM","date":1764787616,"id":5,"type":"income","to":"Ginoxi Ginoxi","amount":200},{"title":"Welfare Check","from":"SYSTEM","date":1764788036,"id":6,"type":"income","to":"Ginoxi Ginoxi","amount":200},{"title":"Welfare Check","from":"SYSTEM","date":1764788456,"id":7,"type":"income","to":"Ginoxi Ginoxi","amount":200},{"title":"Welfare Check","from":"SYSTEM","date":1764788876,"id":8,"type":"income","to":"Ginoxi Ginoxi","amount":200},{"title":"Welfare Check","from":"SYSTEM","date":1764789296,"id":9,"type":"income","to":"Ginoxi Ginoxi","amount":200},{"title":"Welfare Check","from":"SYSTEM","date":1764790293,"to":"Ginoxi Ginoxi","amount":200,"type":"income","id":10},{"title":"Welfare Check","from":"SYSTEM","date":1764790713,"id":11,"type":"income","amount":200,"to":"Ginoxi Ginoxi"},{"title":"Welfare Check","from":"SYSTEM","date":1764791133,"to":"Ginoxi Ginoxi","amount":200,"type":"income","id":12},{"title":"Welfare Check","from":"SYSTEM","date":1764791553,"id":13,"type":"income","amount":200,"to":"Ginoxi Ginoxi"},{"title":"Welfare Check","from":"SYSTEM","date":1764791973,"to":"Ginoxi Ginoxi","amount":200,"type":"income","id":14},{"title":"Welfare Check","from":"SYSTEM","date":1764792393,"id":15,"type":"income","amount":200,"to":"Ginoxi Ginoxi"},{"title":"Welfare Check","from":"SYSTEM","date":1764792813,"to":"Ginoxi Ginoxi","amount":200,"type":"income","id":16},{"title":"Welfare Check","from":"SYSTEM","date":1764793653,"id":17,"type":"income","amount":200,"to":"Ginoxi Ginoxi"},{"title":"Welfare Check","from":"SYSTEM","date":1764794073,"to":"Ginoxi Ginoxi","amount":200,"type":"income","id":18},{"title":"Welfare Check","from":"SYSTEM","date":1764794493,"id":19,"type":"income","amount":200,"to":"Ginoxi Ginoxi"},{"title":"Welfare Check","from":"SYSTEM","date":1764794913,"to":"Ginoxi Ginoxi","amount":200,"type":"income","id":20},{"title":"Welfare Check","from":"SYSTEM","date":1764795333,"id":21,"type":"income","amount":200,"to":"Ginoxi Ginoxi"},{"title":"Welfare Check","from":"SYSTEM","date":1764795753,"to":"Ginoxi Ginoxi","amount":200,"type":"income","id":22},{"title":"Welfare Check","from":"SYSTEM","date":1764796173,"id":23,"type":"income","amount":200,"to":"Ginoxi Ginoxi"},{"title":"Welfare Check","from":"SYSTEM","date":1764796593,"to":"Ginoxi Ginoxi","amount":200,"type":"income","id":24},{"title":"Welfare Check","from":"SYSTEM","date":1764797013,"id":25,"type":"income","amount":200,"to":"Ginoxi Ginoxi"},{"title":"Welfare Check","from":"SYSTEM","date":1764797433,"to":"Ginoxi Ginoxi","amount":200,"type":"income","id":26},{"title":"Welfare Check","from":"SYSTEM","date":1764797853,"id":27,"type":"income","amount":200,"to":"Ginoxi Ginoxi"},{"title":"Welfare Check","from":"SYSTEM","date":1764798273,"to":"Ginoxi Ginoxi","amount":200,"type":"income","id":28}]', '[]'),
	('9364447274', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'Zak Dev', 4532928, 'personal', 500, '[]', '[]', '[{"amount":5000000,"id":32,"from":"Zak Dev","date":1764457043,"title":"Déposer","to":"Zak Dev","type":"income"},{"amount":200,"id":1,"from":"SYSTEM","date":1764288121,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":2,"from":"SYSTEM","date":1764288541,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":3,"from":"SYSTEM","date":1764288961,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":4,"from":"SYSTEM","date":1764289381,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":5,"from":"SYSTEM","date":1764289801,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":6,"from":"SYSTEM","date":1764290221,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":7,"from":"SYSTEM","date":1764349703,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":8,"from":"SYSTEM","date":1764350123,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":9,"from":"SYSTEM","date":1764350543,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":10,"from":"SYSTEM","date":1764350963,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":11,"from":"SYSTEM","date":1764351383,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":12,"from":"SYSTEM","date":1764351803,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":13,"from":"SYSTEM","date":1764352223,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":14,"from":"SYSTEM","date":1764352643,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":15,"from":"SYSTEM","date":1764353063,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":16,"from":"SYSTEM","date":1764353483,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":4500,"id":17,"from":"SYSTEM","date":1764354286,"title":"unknown","to":"Zak Dev","type":"income"},{"amount":200,"id":18,"from":"SYSTEM","date":1764363356,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":19,"from":"SYSTEM","date":1764363776,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":20,"from":"SYSTEM","date":1764364196,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":21,"from":"SYSTEM","date":1764364616,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":22,"from":"SYSTEM","date":1764365036,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":23,"from":"SYSTEM","date":1764366011,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":24,"from":"SYSTEM","date":1764368951,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":25,"from":"SYSTEM","date":1764369371,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":26,"from":"SYSTEM","date":1764369791,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":27,"from":"SYSTEM","date":1764370377,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":28,"from":"SYSTEM","date":1764370797,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":29,"from":"SYSTEM","date":1764440886,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":30,"from":"SYSTEM","date":1764441306,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":32,"id":31,"from":"Zak Dev","date":1764456942,"title":"unknown","to":"SYSTEM","type":"outcome"},{"amount":500000,"id":33,"from":"Zak Dev","date":1764457069,"title":"unknown","to":"SYSTEM","type":"outcome"},{"amount":5000,"id":34,"from":"Zak Dev","date":1764506340,"title":"unknown","to":"SYSTEM","type":"outcome"},{"amount":50000,"id":35,"from":"Zak Dev","date":1764506342,"title":"unknown","to":"SYSTEM","type":"outcome"},{"amount":200,"id":36,"from":"Zak Dev","date":1764506401,"title":"unknown","to":"SYSTEM","type":"outcome"},{"amount":200,"id":37,"from":"SYSTEM","date":1764706789,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":38,"from":"SYSTEM","date":1764707209,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":39,"from":"SYSTEM","date":1764707629,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":40,"from":"SYSTEM","date":1764708049,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":41,"from":"SYSTEM","date":1764708469,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":42,"from":"SYSTEM","date":1764708889,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":43,"from":"SYSTEM","date":1764709309,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":44,"from":"SYSTEM","date":1764709729,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":45,"from":"SYSTEM","date":1764710149,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":46,"from":"SYSTEM","date":1764710569,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":47,"from":"SYSTEM","date":1764710989,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":48,"from":"SYSTEM","date":1764711409,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":49,"from":"SYSTEM","date":1764711829,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":50,"from":"SYSTEM","date":1764712249,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":51,"from":"SYSTEM","date":1764712669,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":52,"from":"SYSTEM","date":1764716449,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":53,"from":"SYSTEM","date":1764716869,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":54,"from":"SYSTEM","date":1764782576,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":55,"from":"SYSTEM","date":1764782996,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":56,"from":"SYSTEM","date":1764783416,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":57,"from":"SYSTEM","date":1764783836,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":58,"from":"SYSTEM","date":1764784256,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":59,"from":"SYSTEM","date":1764784676,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":60,"from":"SYSTEM","date":1764785096,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":61,"from":"SYSTEM","date":1764785516,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":62,"from":"SYSTEM","date":1764785936,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":63,"from":"SYSTEM","date":1764786356,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":64,"from":"SYSTEM","date":1764786776,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":65,"from":"SYSTEM","date":1764787196,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":66,"from":"SYSTEM","date":1764787616,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":67,"from":"SYSTEM","date":1764788036,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":68,"from":"SYSTEM","date":1764788456,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":69,"from":"SYSTEM","date":1764788876,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":70,"from":"SYSTEM","date":1764789296,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":71,"from":"SYSTEM","date":1764789873,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":72,"from":"SYSTEM","date":1764790293,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":73,"from":"SYSTEM","date":1764790713,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":74,"from":"SYSTEM","date":1764791133,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":75,"from":"SYSTEM","date":1764791553,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":76,"from":"SYSTEM","date":1764791973,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":77,"from":"SYSTEM","date":1764792393,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":78,"from":"SYSTEM","date":1764792813,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":79,"from":"SYSTEM","date":1764793653,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":80,"from":"SYSTEM","date":1764794073,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":81,"from":"SYSTEM","date":1764794493,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":82,"from":"SYSTEM","date":1764794913,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":83,"from":"SYSTEM","date":1764795333,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":84,"from":"SYSTEM","date":1764795753,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":85,"from":"SYSTEM","date":1764796173,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":86,"from":"SYSTEM","date":1764796593,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":87,"from":"SYSTEM","date":1764797013,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":88,"from":"SYSTEM","date":1764797433,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":89,"from":"SYSTEM","date":1764797853,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":90,"from":"SYSTEM","date":1764798273,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":91,"from":"SYSTEM","date":1764798694,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":92,"from":"SYSTEM","date":1764799114,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":93,"from":"SYSTEM","date":1764799534,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":94,"from":"SYSTEM","date":1764800642,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":95,"from":"SYSTEM","date":1764801062,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":96,"from":"SYSTEM","date":1764801482,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":97,"from":"SYSTEM","date":1764801902,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":98,"from":"SYSTEM","date":1764802322,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":99,"from":"SYSTEM","date":1764802743,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":100,"from":"SYSTEM","date":1764803163,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":101,"from":"SYSTEM","date":1764803583,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":200,"id":102,"from":"SYSTEM","date":1764804003,"title":"Welfare Check","to":"Zak Dev","type":"income"},{"amount":50000,"id":103,"from":"Zak Dev","date":1764809175,"title":"unknown","to":"SYSTEM","type":"outcome"},{"amount":600,"id":104,"from":"Zak Dev","date":1764840756,"title":"unknown","to":"SYSTEM","type":"outcome"},{"amount":250,"id":105,"to":"SYSTEM","date":1764969936,"from":"Zak Dev","title":"unknown","type":"outcome"},{"amount":250,"id":106,"from":"Zak Dev","date":1764969959,"title":"unknown","to":"SYSTEM","type":"outcome"},{"amount":250,"id":107,"from":"Zak Dev","date":1764969989,"title":"unknown","to":"SYSTEM","type":"outcome"},{"amount":250,"id":108,"from":"Zak Dev","date":1764969998,"title":"unknown","to":"SYSTEM","type":"outcome"},{"amount":500,"id":109,"to":"Zak Dev","date":1765137754,"from":"SYSTEM","title":"unknown","type":"income"},{"amount":5000,"id":110,"title":"unknown","date":1765144393,"from":"SYSTEM","to":"Zak Dev","type":"income"},{"amount":525,"id":111,"to":"Zak Dev","date":1765221033,"from":"SYSTEM","title":"unknown","type":"income"}]', '[{"id":1,"action":"Le joueur a déposé 5000000 $","date":"23:57 29/11/2025","type":"normal","player":"Zak Dev"}]');

-- Listage de la structure de table zak. p_bank_cards
CREATE TABLE IF NOT EXISTS `p_bank_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iban` varchar(40) NOT NULL,
  `card_number` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.p_bank_cards : ~3 rows (environ)
INSERT INTO `p_bank_cards` (`id`, `iban`, `card_number`) VALUES
	(1, '5572334446', '7117218784766352'),
	(2, '7667972900', '4866043748641604'),
	(3, '9364447274', '3208193180498935'),
	(4, '8330566212', '4328833631128498');

-- Listage de la structure de table zak. p_bank_loans
CREATE TABLE IF NOT EXISTS `p_bank_loans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(60) NOT NULL,
  `name` varchar(40) NOT NULL,
  `amount` int(11) NOT NULL,
  `repayment` float NOT NULL,
  `duration` bigint(30) NOT NULL,
  `paid` int(11) NOT NULL DEFAULT 0,
  `last_payment` bigint(30) NOT NULL,
  `start_date` bigint(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.p_bank_loans : ~0 rows (environ)
INSERT INTO `p_bank_loans` (`id`, `player`, `name`, `amount`, `repayment`, `duration`, `paid`, `last_payment`, `start_date`) VALUES
	(1, 'fcb47b307801e586e8c95881bdfc98004f24d031', 'Bronze Loan', 10000, 1.2, 30, 4800, 1765212855, 1764125398);

-- Listage de la structure de table zak. p_dmv_schools
CREATE TABLE IF NOT EXISTS `p_dmv_schools` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  `type` varchar(10) NOT NULL,
  `blipSprite` int(5) NOT NULL,
  `blipColor` int(5) NOT NULL,
  `mainCoords` longtext NOT NULL,
  `theoryQuestions` longtext NOT NULL DEFAULT '[]',
  `practiceMap` longtext NOT NULL DEFAULT '[]',
  `start` longtext NOT NULL DEFAULT '[]',
  `tasks` longtext NOT NULL DEFAULT '[]',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.p_dmv_schools : ~0 rows (environ)
INSERT INTO `p_dmv_schools` (`name`, `label`, `type`, `blipSprite`, `blipColor`, `mainCoords`, `theoryQuestions`, `practiceMap`, `start`, `tasks`) VALUES
	('car_dmv_school', 'DMV Car School', 'car', 351, 0, '{"y":-1378.680908203125,"x":241.32968139648438,"z":33.82964706420898}', '[{"id":1756137284173,"question":"approaching a pedestrian crossing in Downtown Los Santos, the driver must","image":"","options":[{"correct":false,"value":"Speed up to avoid stopping traffic"},{"correct":true,"value":"Stop and give way to pedestrians"},{"correct":false,"value":"Use the horn to warn pedestrians"},{"correct":false,"value":"Continue driving if pedestrians have not yet stepped on the crossing"}]},{"id":1756137317350,"question":"At an intersection without traffic lights in Vespucci, who has the right of way?","image":"","options":[{"correct":true,"value":"The vehicle approaching from the right"},{"correct":false,"value":"The vehicle approaching from the left"},{"correct":false,"value":"The larger vehicle (e.g. a truck)"},{"correct":false,"value":"The driver who flashes headlights first"}]},{"id":1756137330028,"question":"What is the maximum speed limit on highways around Los Santos (e.g. Del Perro Freeway) ?","image":"https://r2.fivemanage.com/bZlDAHxOtiPhK54pEEKh1/theory_1.jpg","options":[{"correct":false,"value":"80 km/h (50 mph)"},{"correct":true,"value":"120 km/h (75 mph)"},{"correct":false,"value":"150 km/h (93 mph)"},{"correct":false,"value":"No speed limit"}]},{"id":1756137351102,"question":"While driving through Mirror Park, the traffic light turns yellow. The driver should:","image":"https://r2.fivemanage.com/bZlDAHxOtiPhK54pEEKh1/theory_2.jpg","options":[{"correct":false,"value":"Accelerate to pass before red"},{"correct":true,"value":"Stop if it is safe to do so"},{"correct":false,"value":"Ignore the signal and continue"},{"correct":false,"value":"Slow down but continue through"}]},{"id":1756137372432,"question":"When a police vehicle in Los Santos activates sirens and lights behind you, you must:","image":"","options":[{"correct":true,"value":"Pull over safely to the side of the road"},{"correct":false,"value":"Stop immediately in the middle of the road"},{"correct":false,"value":"Ignore it unless you committed a crime"},{"correct":false,"value":"Speed up to clear the way faster"}]},{"id":1756137396893,"question":"You are driving in Sandy Shores and see a stop sign. What must you do?","image":"https://r2.fivemanage.com/bZlDAHxOtiPhK54pEEKh1/theory_3.jpg","options":[{"correct":false,"value":"Slow down and continue if no one is coming"},{"correct":true,"value":"Stop completely and proceed only when safe"},{"correct":false,"value":"Ignore it if the road is empty"},{"correct":false,"value":"Stop only if police are nearby"}]},{"id":1756137406974,"question":"While driving at night in Grapeseed, when should you use high beam headlights?","image":"","options":[{"correct":false,"value":"On all roads at night, regardless of other traffic"},{"correct":true,"value":"Only on poorly lit roads, switching to low beam when another vehicle approaches"},{"correct":false,"value":"Never, only low beam is allowed"},{"correct":false,"value":"Only when driving on highways"}]},{"id":1756137420213,"question":"In Los Santos, who must wear a seatbelt?","image":"","options":[{"correct":false,"value":"Only the driver"},{"correct":false,"value":"Driver and front passenger"},{"correct":true,"value":"All occupants of the vehicle"},{"correct":false,"value":"No one, seatbelts are optional"}]},{"id":1756137432761,"question":"When approaching a school zone in Vinewood Hills, the driver must:","image":"","options":[{"correct":false,"value":"Increase speed to leave the area quickly"},{"correct":true,"value":"Drive carefully and reduce speed as indicated by signs"},{"correct":false,"value":"Overtake slower vehicles immediately"},{"correct":false,"value":"Use the horn to alert pedestrians"}]},{"id":1756137448306,"question":"You are about to make a left turn in Downtown Los Santos. What must you do first?","image":"","options":[{"correct":true,"value":"Signal left and check for oncoming traffic"},{"correct":false,"value":"Speed up to complete the turn quickly"},{"correct":false,"value":"Move into the right lane before turning"},{"correct":false,"value":"Use the horn to warn other drivers"}]}]', '[{"model":511519979,"coords":{"z":29.59611892700195,"x":242.21275329589845,"y":-1414.5421142578126},"rot":{"z":-123.99946594238281,"x":0.0,"y":-0.0}},{"model":511519979,"coords":{"z":29.59565734863281,"x":239.01332092285157,"y":-1412.740966796875},"rot":{"z":56.99991607666015,"x":0.0,"y":0.0}},{"model":1172303719,"coords":{"z":28.3293170928955,"x":215.4764862060547,"y":-1408.2794189453126},"rot":{"z":-124.2840576171875,"x":0.0,"y":-0.0}},{"model":511519979,"coords":{"z":28.65369415283203,"x":223.9017333984375,"y":-1406.7314453125},"rot":{"z":-124.96034240722656,"x":-0.82526421546936,"y":7.64587306976318}},{"model":511519979,"coords":{"z":29.2018985748291,"x":226.92654418945313,"y":-1403.052490234375},"rot":{"z":43.18274688720703,"x":0.52226793766021,"y":-4.39428997039794}},{"model":511519979,"coords":{"z":29.47229766845703,"x":229.80117797851563,"y":-1399.6510009765626},"rot":{"z":53.03396224975586,"x":0.0,"y":0.0}},{"model":511519979,"coords":{"z":29.59101104736328,"x":208.08041381835938,"y":-1375.3944091796876},"rot":{"z":-38.99994277954101,"x":-0.0,"y":-0.0}},{"model":511519979,"coords":{"z":29.59769439697265,"x":212.0878448486328,"y":-1377.894287109375},"rot":{"z":-21.99995040893554,"x":-0.0,"y":-0.0}},{"model":511519979,"coords":{"z":29.58328819274902,"x":216.6186065673828,"y":-1378.9044189453126},"rot":{"z":-3.99998235702514,"x":-0.0,"y":-0.0}},{"model":511519979,"coords":{"z":29.58950805664062,"x":216.87522888183595,"y":-1375.7432861328126},"rot":{"z":-4.99999189376831,"x":-0.0,"y":-0.0}},{"model":511519979,"coords":{"z":29.59769439697265,"x":212.78665161132813,"y":-1374.6239013671876},"rot":{"z":-26.99995613098144,"x":-0.0,"y":-0.0}},{"model":511519979,"coords":{"z":29.59769439697265,"x":209.3354949951172,"y":-1372.35888671875},"rot":{"z":-38.99994277954101,"x":-0.0,"y":-0.0}},{"model":-1036807324,"coords":{"z":29.51666069030761,"x":259.1002502441406,"y":-1396.2413330078126},"rot":{"z":-51.22225189208984,"x":-0.0,"y":-0.0}},{"model":-1036807324,"coords":{"z":30.22628211975097,"x":265.0194091796875,"y":-1389.6134033203126},"rot":{"z":-9.93899631500244,"x":3.19857025146484,"y":-2.87264347076416}},{"model":-1036807324,"coords":{"z":30.92025566101074,"x":270.964111328125,"y":-1383.2894287109376},"rot":{"z":-14.04090595245361,"x":4.15777254104614,"y":-2.57804155349731}},{"model":-1036807324,"coords":{"z":30.9347858428955,"x":273.6932067871094,"y":-1375.0048828125},"rot":{"z":-0.30795755982398,"x":-0.0,"y":-0.0}},{"model":-1036807324,"coords":{"z":30.93482971191406,"x":274.00726318359377,"y":-1363.7059326171876},"rot":{"z":0.0,"x":0.0,"y":-0.0}},{"model":-1036807324,"coords":{"z":30.9347858428955,"x":266.83319091796877,"y":-1352.8861083984376},"rot":{"z":0.0,"x":0.0,"y":-0.0}},{"model":-1036807324,"coords":{"z":30.92376708984375,"x":257.74578857421877,"y":-1345.4161376953126},"rot":{"z":0.0,"x":0.0,"y":-0.0}},{"model":-1036807324,"coords":{"z":30.16036033630371,"x":242.17324829101563,"y":-1341.7662353515626},"rot":{"z":-12.37147712707519,"x":6.64742565155029,"y":-6.88556671142578}},{"model":-1036807324,"coords":{"z":29.46747589111328,"x":233.04653930664063,"y":-1348.3741455078126},"rot":{"z":-1.72566413879394,"x":-0.0,"y":-0.0}},{"model":-1036807324,"coords":{"z":29.55078887939453,"x":224.21743774414063,"y":-1359.758056640625},"rot":{"z":0.0,"x":0.0,"y":-0.0}},{"model":0,"coords":{"z":0.0,"x":0.0,"y":0.0},"rot":{"z":0.0,"x":0.0,"y":0.0}},{"model":-1036807324,"coords":{"z":29.51531600952148,"x":223.18191528320313,"y":-1378.8673095703126},"rot":{"z":0.0,"x":0.0,"y":-0.0}}]', '{"model":"blista","spawn":{"x":250.56614685058595,"y":-1409.554931640625,"z":29.58750343322754,"w":49.0}}', '[{"variant":"seat_belt","task":"Fasten seat belt","id":1756139236496},{"points":{"x":241.78131103515626,"y":-1413.0958251953126,"z":29.58676528930664},"id":1756139244454,"task":"Park vehicle (front)","variant":"park_front"},{"points":[{"x":249.83302307128907,"y":-1402.4423828125,"z":29.57143020629882},{"x":257.17095947265627,"y":-1394.9842529296876,"z":29.48194122314453},{"x":266.81158447265627,"y":-1390.9434814453126,"z":30.27079200744629},{"x":269.17083740234377,"y":-1381.83740234375,"z":30.9110107421875},{"x":275.3103332519531,"y":-1372.6966552734376,"z":30.93264007568359},{"x":271.7658386230469,"y":-1362.0155029296876,"z":30.93400955200195},{"x":264.722900390625,"y":-1354.3912353515626,"z":30.93271446228027},{"x":255.57481384277345,"y":-1341.531005859375,"z":30.93305587768554},{"x":243.0689239501953,"y":-1343.96630859375,"z":30.09021377563476},{"x":231.11155700683595,"y":-1346.86328125,"z":29.47109031677246},{"x":225.4104461669922,"y":-1361.1162109375,"z":29.50660705566406},{"x":221.7725067138672,"y":-1371.340087890625,"z":29.50395965576172}],"id":1756140293169,"task":"Drive to next place","variant":"drive_through"},{"points":{"x":208.88751220703126,"y":-1373.9801025390626,"z":29.58750343322754},"id":1756140352257,"task":"Park vehicle (rear)","variant":"park_back"},{"points":[{"x":221.21217346191407,"y":-1377.784912109375,"z":29.54061889648437},{"x":226.9187469482422,"y":-1387.081298828125,"z":29.49702835083007},{"x":217.06883239746095,"y":-1411.7059326171876,"z":28.29207611083984}],"id":1756140366235,"task":"Drive out of building","variant":"drive_through"},{"variant":"look_around","task":"Look around","id":1756140416747},{"points":[{"x":209.75758361816407,"y":-1413.1141357421876,"z":28.24087142944336},{"x":198.34048461914063,"y":-1413.4351806640626,"z":28.3420181274414},{"x":175.46929931640626,"y":-1400.2178955078126,"z":28.34102058410644},{"x":146.027099609375,"y":-1376.7625732421876,"z":28.22259902954101},{"x":114.67180633544922,"y":-1354.09375,"z":28.26503372192382},{"x":85.54362487792969,"y":-1311.623291015625,"z":28.28642463684082},{"x":69.28788757324219,"y":-1271.9903564453126,"z":28.25609397888183},{"x":117.00261688232422,"y":-1263.79052734375,"z":32.1826171875},{"x":151.65328979492188,"y":-1247.32177734375,"z":36.14947509765625},{"x":189.93768310546876,"y":-1235.4852294921876,"z":37.25234985351562},{"x":230.3795928955078,"y":-1235.3502197265626,"z":37.24674606323242},{"x":317.0532531738281,"y":-1235.759521484375,"z":37.22847366333008},{"x":475.8197021484375,"y":-1233.5762939453126,"z":40.66044616699219},{"x":637.2628784179688,"y":-1243.5081787109376,"z":40.66636276245117},{"x":783.7872924804688,"y":-1245.53466796875,"z":25.50042152404785},{"x":795.0309448242188,"y":-1299.8577880859376,"z":25.32219886779785},{"x":786.7760009765625,"y":-1414.61376953125,"z":26.0817642211914},{"x":749.6732788085938,"y":-1429.224853515625,"z":28.26582145690918},{"x":669.0140991210938,"y":-1429.4698486328126,"z":29.90527725219726},{"x":573.7677001953125,"y":-1428.928466796875,"z":28.63420677185058},{"x":506.5872802734375,"y":-1427.62451171875,"z":28.34369087219238},{"x":466.151611328125,"y":-1424.6737060546876,"z":28.34161186218261},{"x":436.64715576171877,"y":-1441.7392578125,"z":28.34627723693847},{"x":342.9698486328125,"y":-1491.56298828125,"z":28.28921699523925},{"x":296.0589599609375,"y":-1518.8302001953126,"z":28.28080749511718},{"x":244.2755584716797,"y":-1539.0218505859376,"z":28.27564620971679}],"id":1756140422339,"task":"Drive through city","variant":"drive_through"},{"points":{"x":223.70729064941407,"y":-1527.6470947265626,"z":28.17160606384277},"id":1756140711460,"task":"Park vehicle (rear)","variant":"park_back"},{"points":[{"x":244.1154327392578,"y":-1543.5621337890626,"z":28.21501159667968},{"x":195.78970336914063,"y":-1576.78466796875,"z":28.28823280334472},{"x":153.3701629638672,"y":-1578.1639404296876,"z":28.30733871459961},{"x":92.61224365234375,"y":-1527.722900390625,"z":28.34393119812011},{"x":84.16264343261719,"y":-1493.8447265625,"z":28.27969169616699},{"x":144.9530487060547,"y":-1420.556884765625,"z":28.26145935058593},{"x":213.49684143066407,"y":-1435.3177490234376,"z":28.34059715270996},{"x":233.64962768554688,"y":-1443.727294921875,"z":28.33734512329101},{"x":225.4346923828125,"y":-1423.16064453125,"z":28.28030014038086},{"x":231.20309448242188,"y":-1403.26953125,"z":29.37518310546875}],"id":1756140723302,"task":"Drive through city","variant":"drive_through"},{"points":{"x":240.42172241210938,"y":-1413.9420166015626,"z":29.58541870117187},"id":1756140823944,"task":"Park vehicle (front)","variant":"park_front"}]');

-- Listage de la structure de table zak. pending_items
CREATE TABLE IF NOT EXISTS `pending_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_label` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL,
  `purchase_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.pending_items : ~1 rows (environ)
INSERT INTO `pending_items` (`id`, `identifier`, `category`, `item_name`, `item_label`, `quantity`, `price`, `purchase_date`) VALUES
	(18, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'vehicules', 'gbargento7f', 'Argento', 1, 600, '2025-12-07 15:03:40');

-- Listage de la structure de table zak. phone_app_store
CREATE TABLE IF NOT EXISTS `phone_app_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application` varchar(50) DEFAULT '0',
  `ratings` text DEFAULT '[]',
  `downloads` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.phone_app_store : ~7 rows (environ)
INSERT INTO `phone_app_store` (`id`, `application`, `ratings`, `downloads`) VALUES
	(1, 'garage', '[]', 4),
	(2, 'bank', '[]', 3),
	(3, 'state', '[]', 3),
	(4, 'twitter', '[]', 1),
	(5, 'tiktok', '[]', 1),
	(6, 'instagram', '[]', 1),
	(7, 'market', '[]', 1),
	(8, 'discord', '[]', 1);

-- Listage de la structure de table zak. phone_backups
CREATE TABLE IF NOT EXISTS `phone_backups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  `owner` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_backups : ~0 rows (environ)

-- Listage de la structure de table zak. phone_bills
CREATE TABLE IF NOT EXISTS `phone_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(46) NOT NULL DEFAULT '',
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `sender` varchar(50) NOT NULL DEFAULT '',
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.phone_bills : ~0 rows (environ)
INSERT INTO `phone_bills` (`id`, `price`, `identifier`, `timestamp`, `sender`, `label`) VALUES
	(1, 100, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '2025-12-02 17:23:06', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'test');

-- Listage de la structure de table zak. phone_blocked_phones
CREATE TABLE IF NOT EXISTS `phone_blocked_phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniqueId` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_blocked_phones : ~0 rows (environ)

-- Listage de la structure de table zak. phone_chatroom_messages
CREATE TABLE IF NOT EXISTS `phone_chatroom_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned DEFAULT NULL,
  `member_id` varchar(20) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `message` text NOT NULL,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.phone_chatroom_messages : ~0 rows (environ)

-- Listage de la structure de table zak. phone_chatrooms
CREATE TABLE IF NOT EXISTS `phone_chatrooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_code` varchar(10) NOT NULL,
  `room_name` varchar(15) NOT NULL,
  `room_owner_id` int(11) DEFAULT NULL,
  `room_owner_name` varchar(50) DEFAULT NULL,
  `room_members` text DEFAULT '{}',
  `room_pin` varchar(50) DEFAULT NULL,
  `unpaid_balance` decimal(10,2) DEFAULT 0.00,
  `is_masked` tinyint(1) DEFAULT 0,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `room_code` (`room_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.phone_chatrooms : ~3 rows (environ)
INSERT INTO `phone_chatrooms` (`id`, `room_code`, `room_name`, `room_owner_id`, `room_owner_name`, `room_members`, `room_pin`, `unpaid_balance`, `is_masked`, `is_pinned`, `created`) VALUES
	(1, '411', '411', -1, 'Government', '{}', NULL, 0.00, 0, 1, '2025-11-26 13:56:16'),
	(2, 'lounge', 'The Lounge', -1, 'Government', '{}', NULL, 0.00, 0, 1, '2025-11-26 13:56:16'),
	(3, 'events', 'Events', -1, 'Government', '{}', NULL, 0.00, 0, 1, '2025-11-26 13:56:16');

-- Listage de la structure de table zak. phone_clock_alarms
CREATE TABLE IF NOT EXISTS `phone_clock_alarms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `hours` int(2) NOT NULL DEFAULT 0,
  `minutes` int(2) NOT NULL DEFAULT 0,
  `label` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`,`phone_number`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_clock_alarms : ~0 rows (environ)

-- Listage de la structure de table zak. phone_crypto
CREATE TABLE IF NOT EXISTS `phone_crypto` (
  `id` varchar(100) NOT NULL,
  `coin` varchar(15) NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `invested` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`coin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_crypto : ~0 rows (environ)

-- Listage de la structure de table zak. phone_darkchat_accounts
CREATE TABLE IF NOT EXISTS `phone_darkchat_accounts` (
  `phone_number` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_darkchat_accounts : ~1 rows (environ)
INSERT INTO `phone_darkchat_accounts` (`phone_number`, `username`, `password`) VALUES
	('2059114866', 'test', '$2a$11$4XYYcCovNC6N0FtgnaDWguJ3JicyZk0nGylAiL1bTBCOxWgKDbRoG');

-- Listage de la structure de table zak. phone_darkchat_channels
CREATE TABLE IF NOT EXISTS `phone_darkchat_channels` (
  `name` varchar(50) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_darkchat_channels : ~1 rows (environ)
INSERT INTO `phone_darkchat_channels` (`name`, `password`) VALUES
	('596', NULL);

-- Listage de la structure de table zak. phone_darkchat_members
CREATE TABLE IF NOT EXISTS `phone_darkchat_members` (
  `channel_name` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`channel_name`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `1` FOREIGN KEY (`channel_name`) REFERENCES `phone_darkchat_channels` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`username`) REFERENCES `phone_darkchat_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_darkchat_members : ~1 rows (environ)
INSERT INTO `phone_darkchat_members` (`channel_name`, `username`) VALUES
	('596', 'test');

-- Listage de la structure de table zak. phone_darkchat_messages
CREATE TABLE IF NOT EXISTS `phone_darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(50) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`),
  KEY `sender` (`sender`),
  CONSTRAINT `1` FOREIGN KEY (`channel`) REFERENCES `phone_darkchat_channels` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`sender`) REFERENCES `phone_darkchat_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_darkchat_messages : ~3 rows (environ)
INSERT INTO `phone_darkchat_messages` (`id`, `channel`, `sender`, `content`, `timestamp`) VALUES
	(1, '596', 'test', 'dzqdqz', '2025-12-08 18:50:33'),
	(2, '596', 'test', '<!SENT-LOCATION-X=813.45Y=210.91!>', '2025-12-08 18:50:36'),
	(3, '596', 'test', '😚😚', '2025-12-08 18:50:40');

-- Listage de la structure de table zak. phone_favorite_contacts
CREATE TABLE IF NOT EXISTS `phone_favorite_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL DEFAULT '0',
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.phone_favorite_contacts : ~0 rows (environ)

-- Listage de la structure de table zak. phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `content` text NOT NULL,
  `type` varchar(15) NOT NULL DEFAULT '',
  `data` longtext NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `filter` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.phone_gallery : ~0 rows (environ)
INSERT INTO `phone_gallery` (`id`, `identifier`, `content`, `type`, `data`, `created_at`, `filter`) VALUES
	(1, '376424717', 'https://r2.fivemanage.com/WqNSCEwcQ72OYSKd92Za1/LcMUDrtQ8TrA.webm', 'video', '{"albums":["Camera"]}', '2025-11-27 19:50:29', NULL);

-- Listage de la structure de table zak. phone_instagram_accounts
CREATE TABLE IF NOT EXISTS `phone_instagram_accounts` (
  `display_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profile_image` varchar(500) DEFAULT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `post_count` int(11) NOT NULL DEFAULT 0,
  `story_count` int(11) NOT NULL DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `phone_number` varchar(15) NOT NULL,
  `private` tinyint(1) DEFAULT 0,
  `verified` tinyint(1) DEFAULT 0,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_instagram_accounts : ~1 rows (environ)
INSERT INTO `phone_instagram_accounts` (`display_name`, `username`, `password`, `profile_image`, `bio`, `post_count`, `story_count`, `follower_count`, `following_count`, `phone_number`, `private`, `verified`, `date_joined`) VALUES
	('zak', 'zakdev', '$2a$11$9mXRVFtFqNh95.AnQLhREeTgVzvCNKt7pJygbKY.ipNP0X9HRxC9y', NULL, NULL, 1, 0, 0, 0, '2059114866', 0, 0, '2025-12-08 18:46:18');

-- Listage de la structure de table zak. phone_instagram_comments
CREATE TABLE IF NOT EXISTS `phone_instagram_comments` (
  `id` varchar(10) NOT NULL,
  `post_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `comment` varchar(500) NOT NULL DEFAULT '',
  `like_count` int(11) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `username` (`username`),
  CONSTRAINT `1` FOREIGN KEY (`post_id`) REFERENCES `phone_instagram_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_instagram_comments : ~0 rows (environ)

-- Listage de la structure de table zak. phone_instagram_follow_requests
CREATE TABLE IF NOT EXISTS `phone_instagram_follow_requests` (
  `requester` varchar(20) NOT NULL,
  `requestee` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`requester`,`requestee`),
  KEY `requestee` (`requestee`),
  CONSTRAINT `1` FOREIGN KEY (`requester`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`requestee`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_instagram_follow_requests : ~0 rows (environ)

-- Listage de la structure de table zak. phone_instagram_follows
CREATE TABLE IF NOT EXISTS `phone_instagram_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  PRIMARY KEY (`followed`,`follower`),
  KEY `follower` (`follower`),
  CONSTRAINT `1` FOREIGN KEY (`followed`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`follower`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_instagram_follows : ~0 rows (environ)

-- Listage de la structure de table zak. phone_instagram_likes
CREATE TABLE IF NOT EXISTS `phone_instagram_likes` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `is_comment` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_instagram_likes : ~0 rows (environ)

-- Listage de la structure de table zak. phone_instagram_messages
CREATE TABLE IF NOT EXISTS `phone_instagram_messages` (
  `id` varchar(10) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `recipient` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `recipient` (`recipient`),
  CONSTRAINT `1` FOREIGN KEY (`sender`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`recipient`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_instagram_messages : ~0 rows (environ)

-- Listage de la structure de table zak. phone_instagram_notifications
CREATE TABLE IF NOT EXISTS `phone_instagram_notifications` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `post_id` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `from` (`from`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`from`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_instagram_notifications : ~0 rows (environ)

-- Listage de la structure de table zak. phone_instagram_posts
CREATE TABLE IF NOT EXISTS `phone_instagram_posts` (
  `id` varchar(10) NOT NULL,
  `media` text DEFAULT NULL,
  `caption` varchar(500) NOT NULL DEFAULT '',
  `location` varchar(50) DEFAULT NULL,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `comment_count` int(11) NOT NULL DEFAULT 0,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_instagram_posts : ~1 rows (environ)
INSERT INTO `phone_instagram_posts` (`id`, `media`, `caption`, `location`, `like_count`, `comment_count`, `username`, `timestamp`) VALUES
	('19MT5', '["https://zak52-8rv7l4.users.cfx.re/lb-upload/uploads/e3dc0ae1-adaa-4ff8-9ce3-ddea7cea3188.webp"]', 'CA ARRIVE FORT', NULL, 0, 0, 'zakdev', '2025-12-08 18:46:43');

-- Listage de la structure de table zak. phone_instagram_stories
CREATE TABLE IF NOT EXISTS `phone_instagram_stories` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `image` varchar(500) NOT NULL,
  `metadata` longtext DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_instagram_stories : ~0 rows (environ)

-- Listage de la structure de table zak. phone_instagram_stories_views
CREATE TABLE IF NOT EXISTS `phone_instagram_stories_views` (
  `story_id` varchar(50) NOT NULL,
  `viewer` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`story_id`,`viewer`),
  KEY `viewer` (`viewer`),
  CONSTRAINT `1` FOREIGN KEY (`story_id`) REFERENCES `phone_instagram_stories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`viewer`) REFERENCES `phone_instagram_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_instagram_stories_views : ~0 rows (environ)

-- Listage de la structure de table zak. phone_last_phone
CREATE TABLE IF NOT EXISTS `phone_last_phone` (
  `id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_last_phone : ~0 rows (environ)

-- Listage de la structure de table zak. phone_logged_in_accounts
CREATE TABLE IF NOT EXISTS `phone_logged_in_accounts` (
  `phone_number` varchar(15) NOT NULL,
  `app` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`phone_number`,`app`,`username`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_logged_in_accounts : ~5 rows (environ)
INSERT INTO `phone_logged_in_accounts` (`phone_number`, `app`, `username`, `active`) VALUES
	('2059114866', 'DarkChat', 'test', 1),
	('2059114866', 'Instagram', 'zakdev', 1),
	('2059114866', 'Mail', 'zak.dev@reviverp.fr', 1),
	('2059114866', 'TikTok', 'test', 1),
	('2059114866', 'Twitter', 'zakdev', 1);

-- Listage de la structure de table zak. phone_mail_accounts
CREATE TABLE IF NOT EXISTS `phone_mail_accounts` (
  `address` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_mail_accounts : ~1 rows (environ)
INSERT INTO `phone_mail_accounts` (`address`, `password`) VALUES
	('zak.dev@reviverp.fr', '$2a$11$2.F.HdF5/LSWWSK.HW0.EeZXOzNkh9Nrr2jKHzuqcxBYnvnk6AYYa');

-- Listage de la structure de table zak. phone_mail_deleted
CREATE TABLE IF NOT EXISTS `phone_mail_deleted` (
  `message_id` int(10) unsigned NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`message_id`,`address`),
  KEY `address` (`address`),
  CONSTRAINT `1` FOREIGN KEY (`message_id`) REFERENCES `phone_mail_messages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`address`) REFERENCES `phone_mail_accounts` (`address`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_mail_deleted : ~0 rows (environ)

-- Listage de la structure de table zak. phone_mail_messages
CREATE TABLE IF NOT EXISTS `phone_mail_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipient` varchar(100) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `attachments` longtext DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_recipient` (`recipient`),
  KEY `idx_sender` (`sender`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_mail_messages : ~1 rows (environ)
INSERT INTO `phone_mail_messages` (`id`, `recipient`, `sender`, `subject`, `content`, `attachments`, `actions`, `read`, `timestamp`) VALUES
	(1, 'zak.dev@reviverp.fr', 'System', 'Votre Adresse Mail', 'Salut,\n\nVotre adresse mail générée automatiquement est zak.dev@reviverp.fr et votre mot de passe est 85Cn4', NULL, NULL, 1, '2025-12-08 18:45:32');

-- Listage de la structure de table zak. phone_maps_locations
CREATE TABLE IF NOT EXISTS `phone_maps_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `x_pos` float NOT NULL,
  `y_pos` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_maps_locations : ~0 rows (environ)

-- Listage de la structure de table zak. phone_marketplace_posts
CREATE TABLE IF NOT EXISTS `phone_marketplace_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `attachments` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_marketplace_posts : ~0 rows (environ)

-- Listage de la structure de table zak. phone_message_channels
CREATE TABLE IF NOT EXISTS `phone_message_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_group` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `last_message` varchar(50) NOT NULL DEFAULT '',
  `last_message_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_message_channels : ~0 rows (environ)

-- Listage de la structure de table zak. phone_message_members
CREATE TABLE IF NOT EXISTS `phone_message_members` (
  `channel_id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `is_owner` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `unread` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`channel_id`,`phone_number`),
  KEY `idx_members_phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`channel_id`) REFERENCES `phone_message_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_message_members : ~0 rows (environ)

-- Listage de la structure de table zak. phone_message_messages
CREATE TABLE IF NOT EXISTS `phone_message_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `sender` varchar(15) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `1` FOREIGN KEY (`channel_id`) REFERENCES `phone_message_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_message_messages : ~0 rows (environ)

-- Listage de la structure de table zak. phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL DEFAULT '',
  `number` varchar(50) DEFAULT NULL,
  `messages` longtext DEFAULT NULL,
  `created` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `unreaded` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.phone_messages : ~2 rows (environ)
INSERT INTO `phone_messages` (`id`, `phone`, `number`, `messages`, `created`, `unreaded`) VALUES
	(150, 'Tweedle', '255454', '[{"owner":"Tweedle","read":1,"created":"2025-11-27 20:48:26","type":"message","message":"        <a class=\'blue_text cursor-pointer\' onclick=\\"copyValueToClipboard(\'552768\', true)\\">552768</a> Voici votre code Tweedle. Ne le partagez pas !    "}]', '2025-11-27 19:48:26', NULL),
	(151, 'TickTock', '376424717', '[{"owner":"TickTock","message":"        <a class=\'blue_text cursor-pointer\' onclick=\\"copyValueToClipboard(\'653277\', true)\\">653277</a> Voici votre code TickTock. Ne le partagez pas !    ","created":"2025-11-27 20:49:22","type":"message","read":0}]', '2025-11-27 19:49:28', NULL);

-- Listage de la structure de table zak. phone_metadata
CREATE TABLE IF NOT EXISTS `phone_metadata` (
  `owneridentifier` varchar(90) NOT NULL DEFAULT '',
  `metadata` longtext DEFAULT NULL,
  `phoneNumber` varchar(50) DEFAULT '',
  PRIMARY KEY (`owneridentifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_metadata : ~0 rows (environ)

-- Listage de la structure de table zak. phone_music_playlists
CREATE TABLE IF NOT EXISTS `phone_music_playlists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cover` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_music_playlists : ~0 rows (environ)

-- Listage de la structure de table zak. phone_music_saved_playlists
CREATE TABLE IF NOT EXISTS `phone_music_saved_playlists` (
  `playlist_id` int(10) unsigned NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`playlist_id`,`phone_number`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`playlist_id`) REFERENCES `phone_music_playlists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_music_saved_playlists : ~0 rows (environ)

-- Listage de la structure de table zak. phone_music_songs
CREATE TABLE IF NOT EXISTS `phone_music_songs` (
  `song_id` varchar(100) NOT NULL,
  `playlist_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`song_id`,`playlist_id`),
  KEY `playlist_id` (`playlist_id`),
  CONSTRAINT `1` FOREIGN KEY (`playlist_id`) REFERENCES `phone_music_playlists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_music_songs : ~0 rows (environ)

-- Listage de la structure de table zak. phone_notes
CREATE TABLE IF NOT EXISTS `phone_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` longtext DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_notes : ~0 rows (environ)

-- Listage de la structure de table zak. phone_notifications
CREATE TABLE IF NOT EXISTS `phone_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `app` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `thumbnail` varchar(500) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `show_avatar` tinyint(1) DEFAULT 0,
  `custom_data` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_notifications : ~0 rows (environ)

-- Listage de la structure de table zak. phone_notifies
CREATE TABLE IF NOT EXISTS `phone_notifies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) DEFAULT NULL,
  `msg_content` text DEFAULT NULL,
  `msg_head` varchar(50) NOT NULL DEFAULT '',
  `app_name` text DEFAULT NULL,
  `msg_time` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.phone_notifies : ~22 rows (environ)
INSERT INTO `phone_notifies` (`id`, `phone`, `msg_content`, `msg_head`, `app_name`, `msg_time`) VALUES
	(1, '376357798', 'Le mot de passe a été modifié avec succès', 'Paramètres', 'settings', '2025-11-26 13:20:04'),
	(2, '376357798', 'Cette application est en cours de téléchargement, veuillez patienter.', 'App Store', 'store', '2025-11-26 13:20:47'),
	(3, '376142096', 'Le mot de passe a été modifié avec succès', 'Paramètres', 'settings', '2025-11-26 13:35:22'),
	(4, '376130954', 'Le mot de passe a été modifié avec succès', 'Paramètres', 'settings', '2025-11-26 13:36:19'),
	(5, '376142096', 'Vous n\'avez pas de compte e-mail. Inscrivez-vous d\'abord dans l\'application Mail', 'E-mail', 'mail', '2025-11-26 13:43:05'),
	(6, '376142096', 'Vous avez un e-mail de Movistar Plus', 'E-mail', 'mail', '2025-11-26 13:43:05'),
	(7, '376130954', 'Utilisateur avec numéro de téléphone 376202630 Vous n\'êtes pas en ligne. Nous vous avons retiré de la conférence !', 'FaceTime', 'facetime', '2025-11-26 21:38:04'),
	(8, '376130954', 'Utilisateur avec numéro de téléphone 376202630 Vous n\'êtes pas en ligne. Nous vous avons retiré de la conférence !', 'FaceTime', 'facetime', '2025-11-26 21:38:05'),
	(9, '376424717', 'Le mot de passe a été modifié avec succès', 'Paramètres', 'settings', '2025-11-27 19:47:28'),
	(10, '376424717', 'Vous avez reçu un nouveau message texte', 'Messages', 'messages', '2025-11-27 19:49:22'),
	(11, '376424717', 'La vidéo a été enregistrée dans votre galerie.', 'Appareil photo', 'camera', '2025-11-27 19:50:30'),
	(12, '376424717', 'L\'emplacement du magasin de véhicules a été ajouté à votre carte.', 'iCar', 'garage', '2025-11-27 23:32:36'),
	(13, '5621', 'Le mot de passe a été modifié avec succès', 'Paramètres', 'settings', '2025-11-28 23:46:14'),
	(17, '5923', 'Le mot de passe a été modifié avec succès', 'Paramètres', 'settings', '2025-11-30 14:44:09'),
	(18, '5904', 'Le mot de passe a été modifié avec succès', 'Paramètres', 'settings', '2025-11-30 15:04:10'),
	(19, '5904', 'L\'emplacement du magasin de véhicules a été ajouté à votre carte.', 'iCar', 'garage', '2025-11-30 15:13:11'),
	(20, '5753', 'Le contact n\'est pas disponible', 'Téléphone', 'phone', '2025-11-30 16:52:01'),
	(21, '5753', 'L\'emplacement du magasin de véhicules a été ajouté à votre carte.', 'iCar', 'garage', '2025-11-30 20:55:20'),
	(23, '5621', 'Vous avez payé la facture', 'Banque centrale', 'bank', '2025-12-02 17:23:19'),
	(24, '5755', 'Le mot de passe a été modifié avec succès', 'Paramètres', 'settings', '2025-12-02 21:27:27'),
	(25, '5316', 'Si Face ID est activé, vous devez sélectionner un mot de passe de secours', 'Paramètres', 'settings', '2025-12-03 20:22:44'),
	(26, '5316', 'Si Face ID est activé, vous devez sélectionner un mot de passe de secours', 'Paramètres', 'settings', '2025-12-03 20:22:46'),
	(27, '5316', 'Si Face ID est activé, vous devez sélectionner un mot de passe de secours', 'Paramètres', 'settings', '2025-12-03 20:22:46'),
	(28, '5316', 'Le mot de passe a été modifié avec succès', 'Paramètres', 'settings', '2025-12-03 20:22:57'),
	(29, '5539', 'Le mot de passe a été modifié avec succès', 'Paramètres', 'settings', '2025-12-08 15:23:19');

-- Listage de la structure de table zak. phone_phone_blocked_numbers
CREATE TABLE IF NOT EXISTS `phone_phone_blocked_numbers` (
  `phone_number` varchar(15) NOT NULL,
  `blocked_number` varchar(15) NOT NULL,
  PRIMARY KEY (`phone_number`,`blocked_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_phone_blocked_numbers : ~0 rows (environ)

-- Listage de la structure de table zak. phone_phone_calls
CREATE TABLE IF NOT EXISTS `phone_phone_calls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caller` varchar(15) NOT NULL,
  `callee` varchar(15) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `answered` tinyint(1) DEFAULT 0,
  `hide_caller_id` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_calls_missed` (`callee`,`answered`),
  KEY `idx_calls_callee_id` (`callee`),
  KEY `idx_calls_caller_id` (`caller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_phone_calls : ~0 rows (environ)

-- Listage de la structure de table zak. phone_phone_contacts
CREATE TABLE IF NOT EXISTS `phone_phone_contacts` (
  `contact_phone_number` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `profile_image` varchar(500) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `favourite` tinyint(1) DEFAULT 0,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`contact_phone_number`,`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_phone_contacts : ~0 rows (environ)

-- Listage de la structure de table zak. phone_phone_voicemail
CREATE TABLE IF NOT EXISTS `phone_phone_voicemail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caller` varchar(15) NOT NULL,
  `callee` varchar(15) NOT NULL,
  `url` varchar(500) NOT NULL,
  `duration` int(11) NOT NULL,
  `hide_caller_id` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_phone_voicemail : ~0 rows (environ)

-- Listage de la structure de table zak. phone_phones
CREATE TABLE IF NOT EXISTS `phone_phones` (
  `id` varchar(100) NOT NULL,
  `owner_id` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pin` varchar(4) DEFAULT NULL,
  `face_id` varchar(100) DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `is_setup` tinyint(1) DEFAULT 0,
  `assigned` tinyint(1) DEFAULT 0,
  `battery` int(11) NOT NULL DEFAULT 100,
  `last_seen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_phones : ~2 rows (environ)
INSERT INTO `phone_phones` (`id`, `owner_id`, `phone_number`, `name`, `pin`, `face_id`, `settings`, `is_setup`, `assigned`, `battery`, `last_seen`) VALUES
	('char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', '9070528084', NULL, NULL, NULL, NULL, 0, 0, 100, '2025-12-08 19:06:14'),
	('char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '2059114866', 'Téléphone de Zak', '0910', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '{"sound":{"texttone":"default","volume":0.5,"silent":false,"callVolume":0.5,"ringtone":"default"},"version":"2.4.4","notifications":[],"lockscreen":{"layout":1,"color":"gradient","fontStyle":1},"phone":{"showCallerId":true},"doNotDisturb":false,"airplaneMode":false,"streamerMode":false,"apps":[["Phone","Messages","Camera","Photos"],["Settings","AppStore","Clock","Mail","Weather","Wallet","Garage","Home","Maps","Notes","Calculator","VoiceMemo","Music","Services","Twitter","Instagram","TikTok","DarkChat"]],"display":{"theme":"dark","size":0.7,"brightness":1,"automatic":false},"security":{"faceId":true,"pinCode":true},"time":{"twelveHourClock":false},"storage":{"total":128000000,"used":8833330.14},"locale":"fr","name":"Téléphone de Zak","weather":{"celcius":false},"latestVersion":"2.4.4","wallpaper":{"background":"cloud8","blur":false}}', 1, 0, 100, '2025-12-08 19:59:02');

-- Listage de la structure de table zak. phone_photo_album_members
CREATE TABLE IF NOT EXISTS `phone_photo_album_members` (
  `album_id` int(11) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`album_id`,`phone_number`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`album_id`) REFERENCES `phone_photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_photo_album_members : ~0 rows (environ)

-- Listage de la structure de table zak. phone_photo_album_photos
CREATE TABLE IF NOT EXISTS `phone_photo_album_photos` (
  `album_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  PRIMARY KEY (`album_id`,`photo_id`),
  KEY `photo_id` (`photo_id`),
  CONSTRAINT `1` FOREIGN KEY (`album_id`) REFERENCES `phone_photo_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`photo_id`) REFERENCES `phone_photos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_photo_album_photos : ~0 rows (environ)

-- Listage de la structure de table zak. phone_photo_albums
CREATE TABLE IF NOT EXISTS `phone_photo_albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(100) NOT NULL,
  `shared` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_photo_albums : ~0 rows (environ)

-- Listage de la structure de table zak. phone_photos
CREATE TABLE IF NOT EXISTS `phone_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `link` varchar(500) NOT NULL,
  `is_video` tinyint(1) DEFAULT 0,
  `size` float NOT NULL DEFAULT 0,
  `metadata` varchar(20) DEFAULT NULL,
  `is_favourite` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_photos : ~1 rows (environ)
INSERT INTO `phone_photos` (`id`, `phone_number`, `link`, `is_video`, `size`, `metadata`, `is_favourite`, `timestamp`) VALUES
	(1, '2059114866', 'https://zak52-8rv7l4.users.cfx.re/lb-upload/uploads/e3dc0ae1-adaa-4ff8-9ce3-ddea7cea3188.webp', 0, 299.14, 'selfie', 0, '2025-12-08 18:46:29');

-- Listage de la structure de table zak. phone_recipes
CREATE TABLE IF NOT EXISTS `phone_recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(50) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_recipes : ~0 rows (environ)

-- Listage de la structure de table zak. phone_services_channels
CREATE TABLE IF NOT EXISTS `phone_services_channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `company` varchar(50) NOT NULL,
  `last_message` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_services_channels : ~0 rows (environ)

-- Listage de la structure de table zak. phone_services_messages
CREATE TABLE IF NOT EXISTS `phone_services_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL,
  `sender` varchar(15) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `x_pos` int(11) DEFAULT NULL,
  `y_pos` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `1` FOREIGN KEY (`channel_id`) REFERENCES `phone_services_channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_services_messages : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tiktok_accounts
CREATE TABLE IF NOT EXISTS `phone_tiktok_accounts` (
  `name` varchar(30) NOT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `like_count` int(11) NOT NULL DEFAULT 0,
  `video_count` int(11) NOT NULL DEFAULT 0,
  `twitter` varchar(20) DEFAULT NULL,
  `instagram` varchar(20) DEFAULT NULL,
  `show_likes` tinyint(1) DEFAULT 1,
  `phone_number` varchar(15) NOT NULL,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tiktok_accounts : ~1 rows (environ)
INSERT INTO `phone_tiktok_accounts` (`name`, `bio`, `avatar`, `username`, `password`, `verified`, `follower_count`, `following_count`, `like_count`, `video_count`, `twitter`, `instagram`, `show_likes`, `phone_number`, `date_joined`) VALUES
	('test', NULL, NULL, 'test', '$2a$11$NHmOz5.YF6HWH9I69/0Zy.ZQcIip9nZHHKAwXtEHcr04Wgn4D7f3W', 0, 0, 0, 0, 0, NULL, NULL, 1, '2059114866', '2025-12-08 18:49:35');

-- Listage de la structure de table zak. phone_tiktok_channels
CREATE TABLE IF NOT EXISTS `phone_tiktok_channels` (
  `id` varchar(10) NOT NULL,
  `last_message` varchar(50) NOT NULL,
  `member_1` varchar(20) NOT NULL,
  `member_2` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_1` (`member_1`,`member_2`),
  KEY `member_2` (`member_2`),
  CONSTRAINT `1` FOREIGN KEY (`member_1`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`member_2`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tiktok_channels : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tiktok_comments
CREATE TABLE IF NOT EXISTS `phone_tiktok_comments` (
  `id` varchar(10) NOT NULL,
  `reply_to` varchar(10) DEFAULT NULL,
  `video_id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `comment` varchar(550) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `replies` int(11) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `video_id` (`video_id`),
  KEY `username` (`username`),
  KEY `reply_to` (`reply_to`),
  CONSTRAINT `1` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `3` FOREIGN KEY (`reply_to`) REFERENCES `phone_tiktok_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tiktok_comments : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tiktok_comments_likes
CREATE TABLE IF NOT EXISTS `phone_tiktok_comments_likes` (
  `username` varchar(20) NOT NULL,
  `comment_id` varchar(10) NOT NULL,
  PRIMARY KEY (`username`,`comment_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`comment_id`) REFERENCES `phone_tiktok_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tiktok_comments_likes : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tiktok_follows
CREATE TABLE IF NOT EXISTS `phone_tiktok_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  PRIMARY KEY (`followed`,`follower`),
  KEY `follower` (`follower`),
  CONSTRAINT `1` FOREIGN KEY (`followed`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`follower`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tiktok_follows : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tiktok_likes
CREATE TABLE IF NOT EXISTS `phone_tiktok_likes` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL,
  PRIMARY KEY (`username`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tiktok_likes : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tiktok_messages
CREATE TABLE IF NOT EXISTS `phone_tiktok_messages` (
  `id` varchar(10) NOT NULL,
  `channel_id` varchar(10) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  KEY `sender` (`sender`),
  CONSTRAINT `1` FOREIGN KEY (`channel_id`) REFERENCES `phone_tiktok_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`sender`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tiktok_messages : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tiktok_notifications
CREATE TABLE IF NOT EXISTS `phone_tiktok_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `video_id` varchar(10) DEFAULT NULL,
  `comment_id` varchar(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `from` (`from`),
  KEY `video_id` (`video_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`from`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `3` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `4` FOREIGN KEY (`comment_id`) REFERENCES `phone_tiktok_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tiktok_notifications : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tiktok_pinned_videos
CREATE TABLE IF NOT EXISTS `phone_tiktok_pinned_videos` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL,
  PRIMARY KEY (`username`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tiktok_pinned_videos : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tiktok_saves
CREATE TABLE IF NOT EXISTS `phone_tiktok_saves` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL,
  PRIMARY KEY (`username`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tiktok_saves : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tiktok_unread_messages
CREATE TABLE IF NOT EXISTS `phone_tiktok_unread_messages` (
  `username` varchar(20) NOT NULL,
  `channel_id` varchar(10) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`username`,`channel_id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`channel_id`) REFERENCES `phone_tiktok_channels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tiktok_unread_messages : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tiktok_videos
CREATE TABLE IF NOT EXISTS `phone_tiktok_videos` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `src` varchar(500) NOT NULL,
  `caption` varchar(100) DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `music` text DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `comments` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `saves` int(11) NOT NULL DEFAULT 0,
  `pinned_comment` varchar(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tiktok_videos : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tiktok_views
CREATE TABLE IF NOT EXISTS `phone_tiktok_views` (
  `username` varchar(20) NOT NULL,
  `video_id` varchar(10) NOT NULL,
  PRIMARY KEY (`username`,`video_id`),
  KEY `video_id` (`video_id`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_tiktok_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`video_id`) REFERENCES `phone_tiktok_videos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tiktok_views : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tinder_accounts
CREATE TABLE IF NOT EXISTS `phone_tinder_accounts` (
  `name` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `photos` text DEFAULT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `dob` date NOT NULL,
  `is_male` tinyint(1) NOT NULL,
  `interested_men` tinyint(1) NOT NULL,
  `interested_women` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `last_seen` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tinder_accounts : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tinder_matches
CREATE TABLE IF NOT EXISTS `phone_tinder_matches` (
  `phone_number_1` varchar(15) NOT NULL,
  `phone_number_2` varchar(15) NOT NULL,
  `latest_sender` varchar(15) DEFAULT NULL,
  `latest_message` varchar(1000) DEFAULT NULL,
  `latest_message_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `phone_number_1_has_unread` tinyint(1) NOT NULL DEFAULT 0,
  `phone_number_2_has_unread` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`phone_number_1`,`phone_number_2`),
  KEY `phone_number_2` (`phone_number_2`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number_1`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`phone_number_2`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tinder_matches : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tinder_messages
CREATE TABLE IF NOT EXISTS `phone_tinder_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(15) NOT NULL,
  `recipient` varchar(15) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `recipient` (`recipient`),
  CONSTRAINT `1` FOREIGN KEY (`sender`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`recipient`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tinder_messages : ~0 rows (environ)

-- Listage de la structure de table zak. phone_tinder_swipes
CREATE TABLE IF NOT EXISTS `phone_tinder_swipes` (
  `swiper` varchar(15) NOT NULL,
  `swipee` varchar(15) NOT NULL,
  `liked` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`swiper`,`swipee`),
  KEY `swipee` (`swipee`),
  CONSTRAINT `1` FOREIGN KEY (`swiper`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`swipee`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_tinder_swipes : ~0 rows (environ)

-- Listage de la structure de table zak. phone_twitter_accounts
CREATE TABLE IF NOT EXISTS `phone_twitter_accounts` (
  `display_name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `profile_image` varchar(500) DEFAULT NULL,
  `profile_header` varchar(500) DEFAULT NULL,
  `pinned_tweet` varchar(50) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `follower_count` int(11) NOT NULL DEFAULT 0,
  `following_count` int(11) NOT NULL DEFAULT 0,
  `private` tinyint(1) DEFAULT 0,
  `date_joined` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_twitter_accounts : ~1 rows (environ)
INSERT INTO `phone_twitter_accounts` (`display_name`, `username`, `password`, `phone_number`, `bio`, `profile_image`, `profile_header`, `pinned_tweet`, `verified`, `follower_count`, `following_count`, `private`, `date_joined`) VALUES
	('test', 'zakdev', '$2a$11$fjOP9Tu92ubZRjQMikW0m.wMPegbDsH0yeORnB1SxTUPxGOEHJAfW', '2059114866', NULL, NULL, NULL, NULL, 0, 0, 0, 0, '2025-12-08 18:46:06');

-- Listage de la structure de table zak. phone_twitter_follow_requests
CREATE TABLE IF NOT EXISTS `phone_twitter_follow_requests` (
  `requester` varchar(20) NOT NULL,
  `requestee` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`requester`,`requestee`),
  KEY `requestee` (`requestee`),
  CONSTRAINT `1` FOREIGN KEY (`requester`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`requestee`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_twitter_follow_requests : ~0 rows (environ)

-- Listage de la structure de table zak. phone_twitter_follows
CREATE TABLE IF NOT EXISTS `phone_twitter_follows` (
  `followed` varchar(20) NOT NULL,
  `follower` varchar(20) NOT NULL,
  `notifications` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`followed`,`follower`),
  KEY `follower` (`follower`),
  CONSTRAINT `1` FOREIGN KEY (`followed`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`follower`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_twitter_follows : ~0 rows (environ)

-- Listage de la structure de table zak. phone_twitter_hashtags
CREATE TABLE IF NOT EXISTS `phone_twitter_hashtags` (
  `hashtag` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `last_used` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`hashtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_twitter_hashtags : ~0 rows (environ)

-- Listage de la structure de table zak. phone_twitter_likes
CREATE TABLE IF NOT EXISTS `phone_twitter_likes` (
  `tweet_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`tweet_id`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_twitter_likes : ~0 rows (environ)

-- Listage de la structure de table zak. phone_twitter_messages
CREATE TABLE IF NOT EXISTS `phone_twitter_messages` (
  `id` varchar(10) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `recipient` varchar(20) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sender` (`sender`),
  KEY `recipient` (`recipient`),
  CONSTRAINT `1` FOREIGN KEY (`sender`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`recipient`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_twitter_messages : ~0 rows (environ)

-- Listage de la structure de table zak. phone_twitter_notifications
CREATE TABLE IF NOT EXISTS `phone_twitter_notifications` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `from` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `tweet_id` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `from` (`from`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`from`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_twitter_notifications : ~0 rows (environ)

-- Listage de la structure de table zak. phone_twitter_promoted
CREATE TABLE IF NOT EXISTS `phone_twitter_promoted` (
  `tweet_id` varchar(50) NOT NULL,
  `promotions` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tweet_id`),
  CONSTRAINT `1` FOREIGN KEY (`tweet_id`) REFERENCES `phone_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_twitter_promoted : ~0 rows (environ)

-- Listage de la structure de table zak. phone_twitter_retweets
CREATE TABLE IF NOT EXISTS `phone_twitter_retweets` (
  `tweet_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`tweet_id`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_twitter_retweets : ~0 rows (environ)

-- Listage de la structure de table zak. phone_twitter_tweets
CREATE TABLE IF NOT EXISTS `phone_twitter_tweets` (
  `id` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `content` varchar(280) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `reply_to` varchar(50) DEFAULT NULL,
  `like_count` int(11) DEFAULT 0,
  `reply_count` int(11) DEFAULT 0,
  `retweet_count` int(11) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `1` FOREIGN KEY (`username`) REFERENCES `phone_twitter_accounts` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_twitter_tweets : ~1 rows (environ)
INSERT INTO `phone_twitter_tweets` (`id`, `username`, `content`, `attachments`, `reply_to`, `like_count`, `reply_count`, `retweet_count`, `timestamp`) VALUES
	('63A35', 'zakdev', '☺️☺️☺️☺️', '["https://zak52-8rv7l4.users.cfx.re/lb-upload/uploads/e3dc0ae1-adaa-4ff8-9ce3-ddea7cea3188.webp"]', NULL, 0, 0, 0, '2025-12-08 18:47:05');

-- Listage de la structure de table zak. phone_voice_memos_recordings
CREATE TABLE IF NOT EXISTS `phone_voice_memos_recordings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_url` varchar(500) NOT NULL,
  `file_length` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_voice_memos_recordings : ~0 rows (environ)

-- Listage de la structure de table zak. phone_wallet_transactions
CREATE TABLE IF NOT EXISTS `phone_wallet_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `amount` int(11) NOT NULL,
  `company` varchar(50) NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `phone_number` (`phone_number`),
  CONSTRAINT `1` FOREIGN KEY (`phone_number`) REFERENCES `phone_phones` (`phone_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_wallet_transactions : ~1 rows (environ)
INSERT INTO `phone_wallet_transactions` (`id`, `phone_number`, `amount`, `company`, `logo`, `timestamp`) VALUES
	(1, '2059114866', 525, 'unknown', NULL, '2025-12-08 19:10:33');

-- Listage de la structure de table zak. phone_yellow_pages_posts
CREATE TABLE IF NOT EXISTS `phone_yellow_pages_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(15) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `attachment` varchar(500) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.phone_yellow_pages_posts : ~0 rows (environ)

-- Listage de la structure de table zak. phone_yellowpages
CREATE TABLE IF NOT EXISTS `phone_yellowpages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `price` int(11) DEFAULT 0,
  `created` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.phone_yellowpages : ~0 rows (environ)

-- Listage de la structure de table zak. piotreq_apps
CREATE TABLE IF NOT EXISTS `piotreq_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) NOT NULL,
  `app` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.piotreq_apps : ~0 rows (environ)

-- Listage de la structure de table zak. piotreq_control
CREATE TABLE IF NOT EXISTS `piotreq_control` (
  `identifier` varchar(46) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.piotreq_control : ~0 rows (environ)

-- Listage de la structure de table zak. piotreq_payouts
CREATE TABLE IF NOT EXISTS `piotreq_payouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) NOT NULL,
  `hours` int(11) NOT NULL,
  `job` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.piotreq_payouts : ~0 rows (environ)

-- Listage de la structure de table zak. player_boutique
CREATE TABLE IF NOT EXISTS `player_boutique` (
  `identifier` varchar(50) NOT NULL,
  `credits` int(11) DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.player_boutique : ~5 rows (environ)
INSERT INTO `player_boutique` (`identifier`, `credits`) VALUES
	('char0:72e2349201e0683aa2540804c45f566df0755123', 37720),
	('char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 0),
	('char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 525342),
	('char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 0),
	('char0:fcb47b307801e586e8c95881bdfc98004f24d031', 300);

-- Listage de la structure de table zak. player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  `display` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `pp` text DEFAULT NULL,
  `isBlocked` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.player_contacts : ~0 rows (environ)

-- Listage de la structure de table zak. player_garages
CREATE TABLE IF NOT EXISTS `player_garages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(80) DEFAULT NULL,
  `owner` varchar(80) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `coords` longtext DEFAULT NULL,
  `zone` longtext DEFAULT NULL,
  `shell` longtext DEFAULT NULL,
  `type` varchar(50) DEFAULT 'vehicle',
  `holders` text DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `isImpound` tinyint(1) DEFAULT NULL,
  `jobs` longtext DEFAULT NULL,
  `gangs` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `creator` (`creator`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.player_garages : ~6 rows (environ)
INSERT INTO `player_garages` (`id`, `creator`, `owner`, `name`, `price`, `coords`, `zone`, `shell`, `type`, `holders`, `available`, `isImpound`, `jobs`, `gangs`) VALUES
	(4, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', NULL, 'clinton avenue garage1', 0, '{"menuCoords":{"z":109.0220947265625,"x":96.00870513916016,"y":307.7271118164063},"spawnCoords":{"z":109.0219268798828,"w":340,"x":95.86551666259766,"y":307.7119140625}}', '{"points":[{"z":110,"x":83.76461029052735,"y":316.0972900390625},{"z":110,"x":128.11599731445313,"y":298.4414978027344},{"z":110,"x":120.27459716796877,"y":274.8528137207031},{"z":110,"x":101.9475326538086,"y":281.6475830078125},{"z":110,"x":93.73314666748049,"y":260.849609375},{"z":110,"x":55.7313003540039,"y":272.111572265625},{"z":110,"x":65.62194061279297,"y":297.2325744628906},{"z":110,"x":66.90790557861328,"y":300.3377685546875},{"z":110,"x":70.03422546386719,"y":303.6200866699219},{"z":110,"x":73.55099487304688,"y":307.3185119628906}],"thickness":25}', '{"shell":3}', 'vehicle', NULL, 1, 0, '[{"grades":[3,0,2,1,4,5],"name":"upnatom"}]', '[]'),
	(5, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', NULL, 'integrity way garage1', 1, '{"menuCoords":{"x":296.7813720703125,"y":-607.9088745117188,"z":42.2612075805664},"spawnCoords":{"w":70,"x":296.6161193847656,"y":-607.9004516601563,"z":42.25971221923828}}', '{"thickness":25,"points":[{"x":266.4154357910156,"y":-611.7006225585938,"z":43},{"x":271.8877563476563,"y":-612.79345703125,"z":43},{"x":291.3074035644531,"y":-616.5023193359375,"z":43},{"x":298.0038757324219,"y":-614.0830078125,"z":43},{"x":308.79833984375,"y":-604.6560668945313,"z":43},{"x":310.9881591796875,"y":-605.5206909179688,"z":43},{"x":313.0216369628906,"y":-600.4992065429688,"z":43},{"x":329.9978942871094,"y":-606.4564819335938,"z":43},{"x":363.2547607421875,"y":-621.843017578125,"z":43},{"x":394.1797790527344,"y":-569.6072387695313,"z":43},{"x":347.4915466308594,"y":-556.9998779296875,"z":43},{"x":330.94140625,"y":-555.0240478515625,"z":43},{"x":296.7851867675781,"y":-556.043701171875,"z":43},{"x":286.14862060546877,"y":-565.7548217773438,"z":43}]}', '{"shell":12}', 'vehicle', NULL, 1, 0, '[{"grades":[3,0,1,2],"name":"ambulance"}]', '[]'),
	(6, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', NULL, 'great ocean highway garage1', 1, '{"spawnCoords":{"w":334,"z":23.87686157226562,"y":6463.05126953125,"x":1574.5943603515626},"menuCoords":{"z":23.82303428649902,"y":6463.5458984375,"x":1574.095458984375}}', '{"points":[{"z":25,"y":6442.41162109375,"x":1557.4376220703126},{"z":25,"y":6476.162109375,"x":1569.6160888671876},{"z":25,"y":6459.92626953125,"x":1602.021240234375},{"z":25,"y":6425.91796875,"x":1597.1824951171876}],"thickness":25}', '{"shell":3}', 'vehicle', NULL, 1, 0, '[{"grades":[5,4,3,2,1,0],"name":"pops"}]', 'null'),
	(8, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', NULL, 'dorset drive garage1', 1, '{"menuCoords":{"y":318.3103332519531,"z":82.08597564697266,"x":-702.0067749023438},"spawnCoords":{"y":311.7194519042969,"z":81.96944427490235,"w":160,"x":-700.4949951171875}}', '{"points":[{"y":318.9541015625,"z":83,"x":-702.36767578125},{"y":301.6543273925781,"z":83,"x":-703.8629760742188},{"y":300.3681335449219,"z":83,"x":-676.9976806640625},{"y":309.6084899902344,"z":83,"x":-679.2731323242188}],"thickness":25}', '{"shell":15}', 'vehicle', NULL, 1, 0, '[{"name":"realestate","grades":[2,1,0,3]}]', '[]'),
	(10, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', NULL, 'strawberry avenue garage1', 0, '{"menuCoords":{"x":167.77525329589845,"z":29.48853302001953,"y":-1284.8553466796876},"spawnCoords":{"x":162.63262939453126,"w":146,"z":28.22944450378418,"y":-1285.2591552734376}}', '{"thickness":25,"points":[{"x":189.69647216796876,"z":29,"y":-1300.63720703125},{"x":213.69387817382813,"z":29,"y":-1289.2548828125},{"x":162.7157745361328,"z":29,"y":-1275.4853515625},{"x":154.63455200195313,"z":29,"y":-1286.5966796875}]}', '{"shell":14}', 'vehicle', NULL, 1, 0, 'null', 'null'),
	(11, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', NULL, 'strawberry avenue garage2', 0, '{"menuCoords":{"x":165.67330932617188,"z":29.51670455932617,"y":-1306.1932373046876},"spawnCoords":{"x":160.5677032470703,"w":147,"z":28.16511917114257,"y":-1297.2022705078126}}', '{"thickness":25,"points":[{"x":158.8444366455078,"z":29,"y":-1306.128173828125},{"x":182.84829711914066,"z":29,"y":-1317.5364990234376},{"x":189.5935516357422,"z":29,"y":-1301.020751953125},{"x":156.55459594726563,"z":29,"y":-1287.88720703125}]}', '{"shell":15}', 'vehicle', NULL, 1, 0, 'null', 'null');

-- Listage de la structure de table zak. player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  `decorateStash` text DEFAULT NULL,
  `charge` text DEFAULT NULL,
  `credit` varchar(50) DEFAULT NULL,
  `creditPrice` varchar(50) DEFAULT NULL,
  `console` text DEFAULT NULL,
  `decorateCoords` text DEFAULT NULL,
  `rented` int(11) DEFAULT NULL,
  `rentPrice` int(11) DEFAULT NULL,
  `rentable` int(11) DEFAULT NULL,
  `purchasable` int(11) DEFAULT NULL,
  `vaultCodes` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `house` (`house`) USING BTREE,
  KEY `owner` (`owner`) USING BTREE,
  KEY `citizenid` (`citizenid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.player_houses : ~0 rows (environ)

-- Listage de la structure de table zak. player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taker` varchar(46) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  `medias` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`taker`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.player_mails : ~0 rows (environ)

-- Listage de la structure de table zak. player_outfit_codes
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.player_outfit_codes : ~0 rows (environ)

-- Listage de la structure de table zak. player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.player_outfits : ~0 rows (environ)

-- Listage de la structure de table zak. player_simcards
CREATE TABLE IF NOT EXISTS `player_simcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `number` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.player_simcards : ~2 rows (environ)
INSERT INTO `player_simcards` (`id`, `owner`, `number`) VALUES
	(1, 'fcb47b307801e586e8c95881bdfc98004f24d031', '376225622'),
	(2, 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', '5716');

-- Listage de la structure de table zak. playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table zak.playerskins : ~0 rows (environ)

-- Listage de la structure de table zak. police_evidences
CREATE TABLE IF NOT EXISTS `police_evidences` (
  `id` varchar(20) NOT NULL,
  `item` longtext NOT NULL,
  `time` bigint(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.police_evidences : ~0 rows (environ)

-- Listage de la structure de table zak. police_impound
CREATE TABLE IF NOT EXISTS `police_impound` (
  `officer` varchar(60) NOT NULL,
  `officer_name` varchar(100) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `plate` varchar(10) NOT NULL,
  `vehicle` longtext NOT NULL,
  `location` varchar(60) NOT NULL,
  `reason` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `duration` bigint(30) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.police_impound : ~0 rows (environ)

-- Listage de la structure de table zak. police_mugshots
CREATE TABLE IF NOT EXISTS `police_mugshots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suspect` varchar(60) NOT NULL,
  `dob` varchar(30) NOT NULL,
  `officer` varchar(60) NOT NULL,
  `description` varchar(150) NOT NULL,
  `url` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.police_mugshots : ~0 rows (environ)

-- Listage de la structure de table zak. police_outfits
CREATE TABLE IF NOT EXISTS `police_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(30) NOT NULL,
  `grade` longtext NOT NULL,
  `label` varchar(60) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `license` longtext DEFAULT 'none',
  `requirements` varchar(50) NOT NULL,
  `skin` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.police_outfits : ~0 rows (environ)

-- Listage de la structure de table zak. printers
CREATE TABLE IF NOT EXISTS `printers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext NOT NULL,
  `printer` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.printers : ~0 rows (environ)

-- Listage de la structure de table zak. purchase_history
CREATE TABLE IF NOT EXISTS `purchase_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_label` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `purchase_date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.purchase_history : ~18 rows (environ)
INSERT INTO `purchase_history` (`id`, `identifier`, `item_name`, `item_label`, `price`, `purchase_date`) VALUES
	(1, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'sultan', 'Sultan', 2500, '2025-12-02 20:00:38'),
	(2, 'char0:72e2349201e0683aa2540804c45f566df0755123', 'sultan', 'Sultan', 2500, '2025-12-02 20:03:52'),
	(3, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'bread', 'Pain', 100, '2025-12-02 20:07:23'),
	(4, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'bread', 'Pain', 100, '2025-12-02 20:07:24'),
	(5, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'bread', 'Pain', 100, '2025-12-02 20:07:24'),
	(6, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'bread', 'Pain', 100, '2025-12-02 20:07:24'),
	(7, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'bread', 'Pain', 100, '2025-12-02 20:07:25'),
	(8, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'bread', 'Pain', 100, '2025-12-02 20:07:25'),
	(9, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'bread', 'Pain', 100, '2025-12-02 20:07:25'),
	(10, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'bread', 'Pain', 100, '2025-12-02 20:07:25'),
	(11, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'bread', 'Pain', 100, '2025-12-02 20:07:26'),
	(12, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'water', 'Eau', 50, '2025-12-02 20:07:26'),
	(13, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'water', 'Eau', 50, '2025-12-02 20:07:26'),
	(14, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'water', 'Eau', 50, '2025-12-02 20:07:26'),
	(15, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'water', 'Eau', 50, '2025-12-02 20:07:27'),
	(16, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'water', 'Eau', 50, '2025-12-02 20:07:27'),
	(17, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'water', 'Eau', 50, '2025-12-02 20:07:27'),
	(18, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'gbargento7f', 'Argento', 600, '2025-12-07 15:03:40');

-- Listage de la structure de table zak. qs_admin_permissions
CREATE TABLE IF NOT EXISTS `qs_admin_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discord_id` varchar(50) NOT NULL,
  `app_name` varchar(50) NOT NULL,
  `app_enabled` tinyint(1) DEFAULT 1,
  `permission_id` varchar(100) NOT NULL,
  `permission_name` varchar(100) NOT NULL,
  `enabled` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `discord_id` (`discord_id`,`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_admin_permissions : ~17 rows (environ)
INSERT INTO `qs_admin_permissions` (`id`, `discord_id`, `app_name`, `app_enabled`, `permission_id`, `permission_name`, `enabled`) VALUES
	(1, '1444309717517336627', 'Dashboard', 1, 'dashboard.view', 'View Dashboard', 1),
	(2, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.server.players', 'View Server Players', 1),
	(3, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.server.uptime', 'View Server Uptime', 1),
	(4, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.server.name', 'View Server Name', 1),
	(5, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.server.status', 'View Server Status', 1),
	(6, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.actions.serverconsole', 'Access Server Console', 1),
	(7, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.actions.resourcemonitor', 'View Resource Monitor', 1),
	(8, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.actions.permissions', 'Manage Permissions', 1),
	(9, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.actions.entitycontrol', 'Control Entities', 1),
	(10, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.actions.adminjail', 'Access Admin Jail', 1),
	(11, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.admintag', 'Use Admin Tag', 1),
	(12, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.copycoords', 'Copy Coordinates', 1),
	(13, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.fixvehicle', 'Fix Vehicle', 1),
	(14, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.godmode', 'Toggle Godmode', 1),
	(15, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.infiniteammo', 'Toggle Infinite Ammo', 1),
	(16, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.noclip', 'Toggle Noclip', 1),
	(17, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.reviveall', 'Revive All Players', 1),
	(18, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.tooglenames', 'Toggle Player Names', 1),
	(19, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.reviveradius', 'Use Revive Radius', 1),
	(20, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.tooglecoords', 'Toggle Coordinates Display', 1),
	(21, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.devmode', 'Toggle Dev Mode', 1),
	(22, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.announce', 'Send Announcement', 1),
	(23, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.changeweather', 'Change Weather', 1),
	(24, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.clearareapeds', 'Clear Area Peds', 1),
	(25, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.clearnearbyvehicles', 'Clear Nearby Vehicles', 1),
	(26, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.adminoverview.resetworldarea', 'Reset World Area', 1),
	(27, '1444309717517336627', 'Dashboard', 1, 'dashboard.view.playeractivity', 'View Player Activity', 1),
	(28, '1444309717517336627', 'Players', 1, 'players.view', 'View Players', 1),
	(29, '1444309717517336627', 'Resource Monitor', 1, 'resources.view', 'View Resources', 1),
	(30, '1444309717517336627', 'Settings', 1, 'settings.view', 'View Settings', 1),
	(31, '1444309717517336627', 'Editor', 1, 'editor.view', 'View Editor', 1),
	(32, '1444309717517336627', 'Players', 1, 'players.view.management.players', 'View Management Players', 1),
	(33, '1444309717517336627', 'Players', 1, 'players.view.management.bans', 'View Management Bans', 1),
	(34, '1444309717517336627', 'Players', 1, 'players.view.players.information.id', 'View Players Information ID', 1),
	(35, '1444309717517336627', 'Players', 1, 'players.view.players.information.name', 'View Players Information Name', 1),
	(36, '1444309717517336627', 'Players', 1, 'players.view.players.information.ping', 'View Players Information Ping', 1),
	(37, '1444309717517336627', 'Players', 1, 'players.view.players.information.license', 'View Players Information License', 1),
	(38, '1444309717517336627', 'Players', 1, 'players.view.players.information.discordId', 'View Players Information Discord ID', 1),
	(39, '1444309717517336627', 'Players', 1, 'players.view.character.details.cash', 'View Character Details Cash', 1),
	(40, '1444309717517336627', 'Players', 1, 'players.view.character.details.bank', 'View Character Details Bank', 1),
	(41, '1444309717517336627', 'Players', 1, 'players.view.character.details.job', 'View Character Details Job', 1),
	(42, '1444309717517336627', 'Players', 1, 'players.view.actions.goto', 'View Players Actions Goto', 1),
	(43, '1444309717517336627', 'Players', 1, 'players.view.actions.bring', 'View Players Actions Bring', 1),
	(44, '1444309717517336627', 'Players', 1, 'players.view.actions.sendback', 'View Players Actions Send Back', 1),
	(45, '1444309717517336627', 'Players', 1, 'players.view.actions.spectate', 'View Players Actions Spectate', 1),
	(46, '1444309717517336627', 'Players', 1, 'players.view.actions.spy', 'View Players Actions Spy', 1),
	(47, '1444309717517336627', 'Players', 1, 'players.view.actions.kick', 'View Players Actions Kick', 1),
	(48, '1444309717517336627', 'Players', 1, 'players.view.actions.freeze', 'View Players Actions Freeze', 1),
	(49, '1444309717517336627', 'Players', 1, 'players.view.actions.ban', 'View Players Actions Ban', 1),
	(50, '1444309717517336627', 'Players', 1, 'players.view.actions.warn', 'View Players Actions Warn', 1),
	(51, '1444309717517336627', 'Players', 1, 'players.view.actions.openinventory', 'View Players Actions Open Inventory', 1),
	(52, '1444309717517336627', 'Players', 1, 'players.view.actions.changeped', 'View Players Actions Change Ped', 1),
	(53, '1444309717517336627', 'Players', 1, 'players.view.actions.clothingmenu', 'View Players Actions Clothing Menu', 1),
	(54, '1444309717517336627', 'Players', 1, 'players.view.actions.givemoney', 'View Players Actions Give Money', 1),
	(55, '1444309717517336627', 'Players', 1, 'players.view.actions.giveitem', 'Give Items', 1),
	(56, '1444309717517336627', 'Players', 1, 'players.view.actions.revive', 'View Players Actions Revive', 1),
	(57, '1444309717517336627', 'Players', 1, 'players.view.actions.givecar', 'View Players Actions Give Car', 1),
	(58, '1444309717517336627', 'Players', 1, 'players.view.actions.setjob', 'View Players Actions Set Job', 1),
	(59, '1444309717517336627', 'Players', 1, 'players.view.actions.setgang', 'View Players Actions Set Gang', 1),
	(60, '1444309717517336627', 'Players', 1, 'players.view.actions.jail', 'View Players Actions Jail', 1),
	(61, '1444309717517336627', 'Reports', 1, 'reports.view', 'View Reports', 1),
	(62, '1444309717517336627', 'Vehicles', 1, 'vehicles.view', 'View Vehicles', 1),
	(63, '1444309717517336627', 'Garages', 1, 'garages.view', 'View Garages', 1),
	(64, '1444309717517336627', 'Server Console', 1, 'server.view', 'View Server Console', 1),
	(65, '1444309684013105172', 'Dashboard', 1, 'dashboard.view.server.players', 'dashboard.view.server.players', 1),
	(66, '1444309684013105172', 'Dashboard', 1, 'dashboard.view.server.name', 'dashboard.view.server.name', 1),
	(67, '1444309684013105172', 'Dashboard', 1, 'dashboard.view.server.status', 'dashboard.view.server.status', 1),
	(68, '1444309684013105172', 'Dashboard', 1, 'dashboard.view.server.uptime', 'dashboard.view.server.uptime', 1),
	(69, '1444309684013105172', 'Dashboard', 1, 'dashboard.view.adminoverview.clearareapeds', 'dashboard.view.adminoverview.clearareapeds', 1),
	(70, '1444309684013105172', 'Dashboard', 1, 'dashboard.view.adminoverview.announce', 'dashboard.view.adminoverview.announce', 1),
	(71, '1444309684013105172', 'Dashboard', 1, 'dashboard.view.adminoverview.clearnearbyvehicles', 'dashboard.view.adminoverview.clearnearbyvehicles', 1),
	(72, '1444309684013105172', 'Dashboard', 1, 'dashboard.view.adminoverview.resetworldarea', 'dashboard.view.adminoverview.resetworldarea', 1),
	(73, '1444309684013105172', 'Dashboard', 1, 'dashboard.view.playeractivity', 'dashboard.view.playeractivity', 1),
	(74, '1444309684013105172', 'Dashboard', 1, 'dashboard.view.adminoverview.tooglenames', 'dashboard.view.adminoverview.tooglenames', 1),
	(75, '1444309684013105172', 'Dashboard', 1, 'dashboard.view.adminoverview.admintag', 'dashboard.view.adminoverview.admintag', 1),
	(76, '1444309684013105172', 'Dashboard', 1, 'dashboard.view.actions.adminjail', 'dashboard.view.actions.adminjail', 1),
	(77, '1444309684013105172', 'Players', 1, 'players.view', 'players.view', 1),
	(78, '1444309684013105172', 'Players', 1, 'players.view.management.players', 'players.view.management.players', 1),
	(79, '1444309684013105172', 'Players', 1, 'players.view.actions.giveitem', 'players.view.actions.giveitem', 1),
	(80, '1444309684013105172', 'Players', 1, 'players.view.management.bans', 'players.view.management.bans', 1),
	(81, '1444309684013105172', 'Players', 1, 'players.view.players.information.id', 'players.view.players.information.id', 1),
	(82, '1444309684013105172', 'Players', 1, 'players.view.players.information.name', 'players.view.players.information.name', 1),
	(83, '1444309684013105172', 'Players', 1, 'players.view.players.information.ping', 'players.view.players.information.ping', 1),
	(84, '1444309684013105172', 'Players', 1, 'players.view.players.information.license', 'players.view.players.information.license', 1),
	(85, '1444309684013105172', 'Players', 1, 'players.view.players.information.discordId', 'players.view.players.information.discordId', 1),
	(86, '1444309684013105172', 'Players', 1, 'players.view.character.details.cash', 'players.view.character.details.cash', 1),
	(87, '1444309684013105172', 'Players', 1, 'players.view.character.details.bank', 'players.view.character.details.bank', 1),
	(88, '1444309684013105172', 'Players', 1, 'players.view.character.details.job', 'players.view.character.details.job', 1),
	(89, '1444309684013105172', 'Players', 1, 'players.view.actions.goto', 'players.view.actions.goto', 1),
	(90, '1444309684013105172', 'Players', 1, 'players.view.actions.bring', 'players.view.actions.bring', 1),
	(91, '1444309684013105172', 'Players', 1, 'players.view.actions.sendback', 'players.view.actions.sendback', 1),
	(92, '1444309684013105172', 'Players', 1, 'players.view.actions.spectate', 'players.view.actions.spectate', 1),
	(93, '1444309684013105172', 'Players', 1, 'players.view.actions.spy', 'players.view.actions.spy', 1),
	(94, '1444309684013105172', 'Players', 1, 'players.view.actions.kick', 'players.view.actions.kick', 1),
	(95, '1444309684013105172', 'Players', 1, 'players.view.actions.freeze', 'players.view.actions.freeze', 1),
	(96, '1444309684013105172', 'Players', 1, 'players.view.actions.ban', 'players.view.actions.ban', 1),
	(97, '1444309684013105172', 'Players', 1, 'players.view.actions.warn', 'players.view.actions.warn', 1),
	(98, '1444309684013105172', 'Players', 1, 'players.view.actions.openinventory', 'players.view.actions.openinventory', 1),
	(99, '1444309684013105172', 'Players', 1, 'players.view.actions.changeped', 'players.view.actions.changeped', 1),
	(100, '1444309684013105172', 'Players', 1, 'players.view.actions.clothingmenu', 'players.view.actions.clothingmenu', 1),
	(101, '1444309684013105172', 'Players', 1, 'players.view.actions.givemoney', 'players.view.actions.givemoney', 1),
	(102, '1444309684013105172', 'Players', 1, 'players.view.actions.revive', 'players.view.actions.revive', 1),
	(103, '1444309684013105172', 'Players', 1, 'players.view.actions.givecar', 'players.view.actions.givecar', 1),
	(104, '1444309684013105172', 'Players', 1, 'players.view.actions.setjob', 'players.view.actions.setjob', 1),
	(105, '1444309684013105172', 'Players', 1, 'players.view.actions.setgang', 'players.view.actions.setgang', 1),
	(106, '1444309684013105172', 'Players', 1, 'players.view.actions.jail', 'players.view.actions.jail', 1),
	(107, '1444309684013105172', 'Vehicles', 1, 'vehicles.view', 'vehicles.view', 1),
	(108, '1444309684013105172', 'Garages', 1, 'garages.view', 'garages.view', 1);

-- Listage de la structure de table zak. qs_admin_ranks
CREATE TABLE IF NOT EXISTS `qs_admin_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(50) NOT NULL,
  `discord_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `discord_id` (`discord_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_admin_ranks : ~2 rows (environ)
INSERT INTO `qs_admin_ranks` (`id`, `rank_name`, `discord_id`) VALUES
	(1, 'God', '1444309717517336627'),
	(2, 'GM', '1444309684013105172');

-- Listage de la structure de table zak. qs_admin_settings
CREATE TABLE IF NOT EXISTS `qs_admin_settings` (
  `license` varchar(64) NOT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `themeUrl` text DEFAULT NULL,
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.qs_admin_settings : ~7 rows (environ)
INSERT INTO `qs_admin_settings` (`license`, `theme`, `themeUrl`) VALUES
	('license:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 'default', NULL),
	('license:28a24dc4b57feb9580c57626e3c03439a900f876', 'default', NULL),
	('license:2c04a8506e426a0867af88aada9d2698cebb7d18', 'default', NULL),
	('license:72e2349201e0683aa2540804c45f566df0755123', 'default', NULL),
	('license:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 'default', NULL),
	('license:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'aurora', NULL),
	('license:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 'default', NULL),
	('license:fcb47b307801e586e8c95881bdfc98004f24d031', 'midnight', NULL);

-- Listage de la structure de table zak. qs_dog_walker
CREATE TABLE IF NOT EXISTS `qs_dog_walker` (
  `identifier` varchar(46) NOT NULL,
  `level` int(10) unsigned NOT NULL DEFAULT 1,
  `experience` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_dog_walker : ~10 rows (environ)
INSERT INTO `qs_dog_walker` (`identifier`, `level`, `experience`) VALUES
	('char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 1, 130),
	('char0:28a24dc4b57feb9580c57626e3c03439a900f876', 1, 0),
	('char0:2c04a8506e426a0867af88aada9d2698cebb7d18', 1, 0),
	('char0:72e2349201e0683aa2540804c45f566df0755123', 1, 0),
	('char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 1, 0),
	('char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 1, 0),
	('char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 1, 0),
	('char0:fcb47b307801e586e8c95881bdfc98004f24d031', 1, 0),
	('e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 1, 0),
	('fcb47b307801e586e8c95881bdfc98004f24d031', 1, 0);

-- Listage de la structure de table zak. qs_garage_decorations
CREATE TABLE IF NOT EXISTS `qs_garage_decorations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `insideId` varchar(50) DEFAULT NULL,
  `creator` varchar(70) NOT NULL DEFAULT '0',
  `modelName` varchar(50) NOT NULL DEFAULT '0',
  `coords` text DEFAULT NULL,
  `rotation` text NOT NULL DEFAULT '',
  `inStash` tinyint(1) NOT NULL DEFAULT 0,
  `inside` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `uniq` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `lightData` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`insideId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.qs_garage_decorations : ~0 rows (environ)

-- Listage de la structure de table zak. qs_garage_furnitures
CREATE TABLE IF NOT EXISTS `qs_garage_furnitures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(80) DEFAULT NULL,
  `category_key` varchar(100) NOT NULL,
  `object` varchar(200) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `img` text DEFAULT NULL,
  `colorlabel` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `stash` longtext DEFAULT NULL,
  `offset` longtext DEFAULT NULL,
  `colors` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `creator` (`creator`) USING BTREE,
  KEY `category_key` (`category_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.qs_garage_furnitures : ~0 rows (environ)

-- Listage de la structure de table zak. qs_housing_furnitures
CREATE TABLE IF NOT EXISTS `qs_housing_furnitures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(80) DEFAULT NULL,
  `category_key` varchar(100) NOT NULL,
  `object` varchar(200) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `img` text DEFAULT NULL,
  `colorlabel` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `stash` longtext DEFAULT NULL,
  `offset` longtext DEFAULT NULL,
  `colors` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `creator` (`creator`) USING BTREE,
  KEY `category_key` (`category_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.qs_housing_furnitures : ~0 rows (environ)

-- Listage de la structure de table zak. qs_hunter
CREATE TABLE IF NOT EXISTS `qs_hunter` (
  `identifier` varchar(46) NOT NULL,
  `level` int(10) unsigned NOT NULL DEFAULT 1,
  `experience` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_hunter : ~10 rows (environ)
INSERT INTO `qs_hunter` (`identifier`, `level`, `experience`) VALUES
	('char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 1, 0),
	('char0:28a24dc4b57feb9580c57626e3c03439a900f876', 1, 0),
	('char0:2c04a8506e426a0867af88aada9d2698cebb7d18', 1, 0),
	('char0:72e2349201e0683aa2540804c45f566df0755123', 1, 200),
	('char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 1, 0),
	('char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 1, 0),
	('char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 1, 0),
	('char0:fcb47b307801e586e8c95881bdfc98004f24d031', 1, 100),
	('e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 1, 0),
	('fcb47b307801e586e8c95881bdfc98004f24d031', 1, 0);

-- Listage de la structure de table zak. qs_lumberjack
CREATE TABLE IF NOT EXISTS `qs_lumberjack` (
  `identifier` varchar(46) NOT NULL,
  `level` int(10) unsigned NOT NULL DEFAULT 1,
  `experience` int(10) unsigned NOT NULL DEFAULT 0,
  `total_experience` int(10) unsigned NOT NULL DEFAULT 0,
  `total_earnings` int(10) unsigned NOT NULL DEFAULT 0,
  `season_experience` int(10) unsigned NOT NULL DEFAULT 0,
  `season_earnings` int(10) unsigned NOT NULL DEFAULT 0,
  `daily_experience` int(10) unsigned NOT NULL DEFAULT 0,
  `daily_earnings` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_lumberjack : ~10 rows (environ)
INSERT INTO `qs_lumberjack` (`identifier`, `level`, `experience`, `total_experience`, `total_earnings`, `season_experience`, `season_earnings`, `daily_experience`, `daily_earnings`) VALUES
	('char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 1, 900, 900, 0, 900, 0, 900, 0),
	('char0:28a24dc4b57feb9580c57626e3c03439a900f876', 1, 0, 0, 0, 0, 0, 0, 0),
	('char0:2c04a8506e426a0867af88aada9d2698cebb7d18', 1, 0, 0, 0, 0, 0, 0, 0),
	('char0:72e2349201e0683aa2540804c45f566df0755123', 1, 0, 0, 0, 0, 0, 0, 0),
	('char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 1, 0, 0, 0, 0, 0, 0, 0),
	('char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 1, 0, 0, 0, 0, 0, 0, 0),
	('char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 1, 0, 0, 0, 0, 0, 0, 0),
	('char0:fcb47b307801e586e8c95881bdfc98004f24d031', 1, 0, 0, 0, 0, 0, 0, 0),
	('e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 1, 0, 0, 0, 0, 0, 0, 0),
	('fcb47b307801e586e8c95881bdfc98004f24d031', 1, 900, 900, 0, 900, 0, 900, 0);

-- Listage de la structure de table zak. qs_lumberjack_leaderboard_winners
CREATE TABLE IF NOT EXISTS `qs_lumberjack_leaderboard_winners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `reward_amount` int(11) NOT NULL,
  `reward_type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `position` (`position`,`reward_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_lumberjack_leaderboard_winners : ~0 rows (environ)

-- Listage de la structure de table zak. qs_lumberjack_resets
CREATE TABLE IF NOT EXISTS `qs_lumberjack_resets` (
  `identifier` varchar(46) NOT NULL,
  `last_daily_reset` datetime NOT NULL DEFAULT current_timestamp(),
  `last_season_reset` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_lumberjack_resets : ~0 rows (environ)
INSERT INTO `qs_lumberjack_resets` (`identifier`, `last_daily_reset`, `last_season_reset`) VALUES
	('default_identifier', '2025-11-26 17:04:16', '2025-11-26 17:04:16');

-- Listage de la structure de table zak. qs_lumberjack_rewards
CREATE TABLE IF NOT EXISTS `qs_lumberjack_rewards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `reward_type` varchar(50) NOT NULL,
  `reward_amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_lumberjack_rewards : ~0 rows (environ)

-- Listage de la structure de table zak. qs_mechanic_config
CREATE TABLE IF NOT EXISTS `qs_mechanic_config` (
  `id` varchar(64) NOT NULL,
  `config` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_mechanic_config : ~3 rows (environ)
INSERT INTO `qs_mechanic_config` (`id`, `config`) VALUES
	('heatedbrakes', '{"enabled":false,"temperatureDecrease":{"brakeUpgrade":{"-1":1,"0":1,"1":1,"2":1},"classes":[]},"temperatureIncrease":{"brakeUpgrade":{"-1":1,"0":1,"1":1,"2":1},"classes":[]},"temperatureRate":1,"vehicleOverrides":{},"coolingRate":1,"blacklistedVehicles":[],"visual":{"glow":{"enabled":true,"strength":1}},"performanceLoss":1}'),
	('offroadsystem', '{"excludedZones":[],"sinkSpeed":100,"tractionLoss":50,"enabled":false,"blacklistedVehicles":["rcbandito","monster","rhino","scarab","khanjali"],"surfaceDifficulty":100,"wheelBenefits":{"tuner":{"enabled":false,"hardGrip":0,"softGrip":0,"sinkReduction":0},"street":{"enabled":false,"hardGrip":0,"softGrip":0,"sinkReduction":0},"suv":{"enabled":true,"hardGrip":-3,"softGrip":8,"sinkReduction":15},"offroad":{"enabled":true,"hardGrip":-8,"softGrip":18,"sinkReduction":32}}}'),
	('wheeldamage', '{"enabled":false,"blacklist":{"classes":[],"models":[]},"crashBreak":{"wheels":[0,1,4,5],"speed":180,"enabled":true,"cooldown":5000,"chance":100}}');

-- Listage de la structure de table zak. qs_mechanic_estock
CREATE TABLE IF NOT EXISTS `qs_mechanic_estock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mechanicId` varchar(64) DEFAULT NULL,
  `engineId` int(11) DEFAULT NULL,
  `engineName` varchar(128) DEFAULT NULL,
  `enginePower` varchar(32) DEFAULT NULL,
  `engineTorque` varchar(32) DEFAULT NULL,
  `engineData` longtext DEFAULT NULL,
  `purchasePrice` int(11) DEFAULT NULL,
  `onPallet` tinyint(1) DEFAULT 0,
  `purchased_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_estock_mechanic` (`mechanicId`,`purchased_at` DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_mechanic_estock : ~0 rows (environ)

-- Listage de la structure de table zak. qs_mechanic_evehicles
CREATE TABLE IF NOT EXISTS `qs_mechanic_evehicles` (
  `plate` varchar(50) NOT NULL,
  `engine_sound` varchar(100) DEFAULT NULL,
  `handling_json` longtext DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_mechanic_evehicles : ~0 rows (environ)

-- Listage de la structure de table zak. qs_mechanic_orders
CREATE TABLE IF NOT EXISTS `qs_mechanic_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mechanicId` varchar(64) DEFAULT NULL,
  `customerLicense` varchar(64) DEFAULT NULL,
  `customerName` varchar(128) DEFAULT NULL,
  `vehicleModel` varchar(64) DEFAULT NULL,
  `vehiclePlate` varchar(16) DEFAULT NULL,
  `vehicleProperties` longtext DEFAULT NULL,
  `modificationsList` longtext DEFAULT NULL,
  `totalCost` int(11) DEFAULT 0,
  `status` enum('pending','in_progress','completed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `completed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mechanic_created` (`mechanicId`,`created_at` DESC),
  KEY `idx_status` (`status`),
  KEY `idx_customer` (`customerLicense`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_mechanic_orders : ~6 rows (environ)
INSERT INTO `qs_mechanic_orders` (`id`, `mechanicId`, `customerLicense`, `customerName`, `vehicleModel`, `vehiclePlate`, `vehicleProperties`, `modificationsList`, `totalCost`, `status`, `created_at`, `completed_at`) VALUES
	(1, '439522', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', '[INDE] Adrien Miller', 'TAILGATER2', '78166764', '{"modHydraulics":false,"tyreSmokeColor":[255,255,255],"modPlateHolder":-1,"modTrimB":-1,"modRightFender":-1,"neonColor":[255,0,255],"modRoofLivery":-1,"color2":2,"modShifterLeavers":-1,"modHydrolic":-1,"modTurbo":true,"wheels":7,"model":-1244461404,"modXenon":false,"plate":"78166764","pearlescentColor":4,"windowTint":0,"dirtLevel":2,"modHorns":-1,"paintType2":7,"modNitrous":-1,"wheelColor":156,"modEngineBlock":-1,"paintType1":7,"tyres":[],"modSubwoofer":-1,"interiorColor":5,"modRearBumper":-1,"bodyHealth":973,"modFender":-1,"bulletProofTyres":true,"extras":[1,0],"modFrame":-1,"windows":[4,5],"plateIndex":0,"modAerials":-1,"modTrunk":-1,"modOrnaments":-1,"modFrontBumper":-1,"modDial":-1,"wheelSize":1.0,"modSuspension":3,"oilLevel":5,"modLightbar":-1,"modSmokeEnabled":false,"xenonColor":255,"modVanityPlate":-1,"modArchCover":-1,"modTrimA":-1,"driftTyres":false,"dashboardColor":111,"modLivery":-1,"modDashboard":-1,"modSteeringWheel":-1,"modTransmission":2,"modDoorSpeaker":-1,"modSpoilers":-1,"modArmor":-1,"tankHealth":999,"modDoorR":-1,"modFrontWheels":-1,"fuelLevel":65,"modGrille":-1,"modBrakes":2,"modAPlate":-1,"livery":-1,"modBackWheels":-1,"modCustomTiresF":false,"modEngine":3,"modAirFilter":-1,"doors":[],"modSpeakers":-1,"engineHealth":987,"modTank":-1,"wheelWidth":1.0,"modRoof":-1,"modStruts":-1,"modWindows":-1,"modSideSkirt":-1,"modSeats":-1,"neonEnabled":[false,false,false,false],"modExhaust":-1,"modCustomTiresR":false,"modHood":-1,"color1":4}', '{"12":{"label":"12","value":2,"price":4500,"name":"12"},"18":{"label":"18","value":true,"price":10000,"name":"18"},"11":{"label":"11","value":3,"price":12500,"name":"11"},"15":{"label":"15","value":3,"price":7000,"name":"15"},"13":{"label":"13","value":2,"price":6000,"name":"13"},"fullRepair":{"label":"fullRepair","value":"full","price":5000,"name":"fullRepair"}}', 45000, 'pending', '2025-11-28 18:20:40', NULL),
	(2, '866698', 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Yanis', 'TAILGATER2', '78166764', '{"modHydraulics":false,"tyreSmokeColor":[255,255,255],"modPlateHolder":-1,"modTrimB":-1,"modRightFender":-1,"modWindows":-1,"modRoofLivery":-1,"color2":2,"modShifterLeavers":-1,"modHydrolic":-1,"modTurbo":true,"wheels":7,"model":-1244461404,"modXenon":false,"plate":"78166764","pearlescentColor":4,"windowTint":0,"dirtLevel":2,"modHorns":-1,"modSeats":-1,"modNitrous":-1,"wheelColor":156,"neonEnabled":[false,false,false,false],"paintType1":7,"tyres":[],"modStruts":-1,"interiorColor":5,"modRearBumper":-1,"bodyHealth":990,"modFender":1,"modAirFilter":-1,"extras":[1,0],"modFrame":4,"windows":[3,4,5,7],"plateIndex":0,"modAerials":-1,"modTrunk":-1,"modOrnaments":-1,"modFrontBumper":-1,"modDial":-1,"wheelSize":1.0,"modSuspension":-1,"oilLevel":5,"modDoorR":-1,"modGrille":0,"modSpoilers":-1,"modVanityPlate":-1,"modArchCover":-1,"engineHealth":987,"modEngine":3,"dashboardColor":107,"modLivery":-1,"modEngineBlock":-1,"modRoof":-1,"modAPlate":-1,"modDashboard":-1,"modTrimA":-1,"modHood":-1,"tankHealth":999,"modLightbar":-1,"modFrontWheels":-1,"modArmor":-1,"neonColor":[255,0,255],"modTransmission":1,"color1":[255,0,255],"livery":-1,"modSideSkirt":-1,"modCustomTiresF":false,"paintType2":7,"modSmokeEnabled":false,"doors":[],"xenonColor":255,"modDoorSpeaker":-1,"modTank":-1,"wheelWidth":1.0,"modSteeringWheel":-1,"driftTyres":false,"modBrakes":-1,"fuelLevel":65,"bulletProofTyres":true,"modSubwoofer":-1,"modExhaust":-1,"modCustomTiresR":false,"modBackWheels":-1,"modSpeakers":-1}', '{"13":{"label":"13","value":1,"price":4000,"name":"13"},"18":{"label":"18","value":true,"price":10000,"name":"18"},"11":{"label":"11","value":3,"price":12500,"name":"11"},"5":{"label":"5","value":4,"price":500,"name":"5"},"6":{"label":"6","value":0,"price":750,"name":"6"},"dashboardColor":{"label":"dashboardColor","value":{"index":107},"price":750,"name":"dashboardColor"},"8":{"label":"8","value":1,"price":500,"name":"8"},"primaryColor":{"label":"primaryColor","value":{"r":255,"g":0,"material":"metallic","b":255},"price":1000,"name":"primaryColor"}}', 30000, 'completed', '2025-11-28 18:22:36', '2025-11-28 18:24:46'),
	(3, '866698', 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', '[INDE]  Luca Paccioli', 'ALPHA', '1K84VE1T', '{"modDoorSpeaker":-1,"modLightbar":-1,"wheelSize":1.0,"plateIndex":0,"bulletProofTyres":true,"modVanityPlate":-1,"modFrame":-1,"modRightFender":-1,"modAPlate":-1,"modCustomTiresR":false,"modShifterLeavers":-1,"wheelColor":156,"driftTyres":false,"neonColor":[255,0,255],"color2":0,"modLivery":-1,"modTrimB":-1,"modSpoilers":-1,"color1":6,"windows":[4,5],"modDoorR":-1,"modHydrolic":-1,"modSuspension":3,"fuelLevel":62,"wheelWidth":1.0,"modRearBumper":-1,"modCustomTiresF":false,"modSeats":-1,"modDial":-1,"modDashboard":-1,"modFender":-1,"engineHealth":1000,"windowTint":0,"modSideSkirt":-1,"plate":"1K84VE1T","model":767087018,"modStruts":-1,"modTurbo":true,"modFrontBumper":-1,"modAirFilter":-1,"doors":[],"tyres":[],"modFrontWheels":-1,"modTrunk":-1,"pearlescentColor":111,"modTank":-1,"modHydraulics":false,"livery":-1,"xenonColor":255,"modBackWheels":-1,"wheels":7,"tankHealth":1000,"modGrille":-1,"dirtLevel":0,"oilLevel":5,"modArchCover":-1,"modHood":-1,"modRoofLivery":-1,"tyreSmokeColor":[255,255,255],"modTrimA":-1,"modPlateHolder":-1,"modEngine":3,"modSubwoofer":-1,"modNitrous":-1,"extras":{"12":1,"10":1,"11":1},"paintType2":7,"dashboardColor":0,"modOrnaments":-1,"modBrakes":2,"neonEnabled":[false,false,false,false],"modTransmission":2,"modXenon":false,"modSteeringWheel":-1,"modWindows":-1,"modAerials":-1,"modEngineBlock":-1,"bodyHealth":1000,"interiorColor":0,"modSpeakers":-1,"modExhaust":-1,"modRoof":-1,"modHorns":-1,"modSmokeEnabled":false,"paintType1":7,"modArmor":-1}', '{"15":{"name":"15","value":3,"price":7000,"label":"15"},"18":{"name":"18","value":true,"price":10000,"label":"18"},"13":{"name":"13","value":2,"price":6000,"label":"13"},"12":{"name":"12","value":2,"price":4500,"label":"12"},"11":{"name":"11","value":3,"price":12500,"label":"11"}}', 40000, 'pending', '2025-11-30 13:27:03', NULL),
	(4, '866698', 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', '[INDE] Yara Morales', 'COMET2', '9O476B6J', '{"color2":0,"bodyHealth":557,"modEngine":3,"modOrnaments":-1,"livery":-1,"extras":[],"pearlescentColor":0,"wheelSize":1.0,"modLightbar":-1,"modArchCover":-1,"modAerials":-1,"modEngineBlock":-1,"modBrakes":2,"modSuspension":3,"modRoof":-1,"tankHealth":995,"windows":[4,5],"wheelWidth":1.0,"driftTyres":false,"modAPlate":-1,"model":-1045541610,"modSideSkirt":-1,"plateIndex":0,"modAirFilter":-1,"dirtLevel":0,"modDoorR":-1,"modBackWheels":-1,"modTank":-1,"modFender":-1,"modNitrous":-1,"modLivery":-1,"paintType1":7,"neonEnabled":[false,false,false,false],"plate":"9O476B6J","tyres":[],"fuelLevel":58,"modSteeringWheel":-1,"modDashboard":-1,"modSubwoofer":-1,"modArmor":-1,"modShifterLeavers":-1,"wheelColor":156,"modGrille":-1,"modDoorSpeaker":-1,"modRoofLivery":-1,"dashboardColor":0,"modFrontWheels":-1,"modHydrolic":-1,"paintType2":7,"modStruts":-1,"engineHealth":720,"doors":[],"modDial":-1,"modWindows":-1,"neonColor":[255,0,255],"modFrontBumper":-1,"modTrimB":-1,"modExhaust":-1,"modHydraulics":false,"modTrimA":-1,"modFrame":-1,"windowTint":0,"modXenon":false,"modRearBumper":-1,"oilLevel":5,"modVanityPlate":-1,"modRightFender":-1,"modCustomTiresR":false,"modHorns":-1,"modTurbo":true,"bulletProofTyres":true,"color1":0,"tyreSmokeColor":[255,255,255],"modSmokeEnabled":false,"interiorColor":0,"modTransmission":2,"modCustomTiresF":false,"wheels":0,"modSpoilers":-1,"modSeats":-1,"modSpeakers":-1,"modTrunk":-1,"modPlateHolder":-1,"modHood":-1,"xenonColor":255}', '{"18":{"value":true,"price":10000,"name":"18","label":"18"},"fullRepair":{"value":"full","price":5000,"name":"fullRepair","label":"fullRepair"},"13":{"value":2,"price":6000,"name":"13","label":"13"},"12":{"value":2,"price":4500,"name":"12","label":"12"},"11":{"value":3,"price":12500,"name":"11","label":"11"},"15":{"value":3,"price":7000,"name":"15","label":"15"}}', 45000, 'pending', '2025-12-07 21:26:26', NULL),
	(5, '866698', 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 'LeR | Tooko Pea', 's1000RR', 'DRW9697J', '{"doors":[],"modXenon":false,"modSeats":-1,"modSteeringWheel":-1,"modTrimB":-1,"modExhaust":-1,"color2":112,"modFrontBumper":-1,"interiorColor":0,"pearlescentColor":112,"modEngineBlock":-1,"tyres":[],"modBrakes":-1,"livery":1,"modTank":-1,"modDashboard":-1,"dirtLevel":6,"paintType2":0,"windows":[0,1,2,3,4,5,6,7],"modDial":-1,"modAirFilter":-1,"tyreSmokeColor":[255,255,255],"modTurbo":false,"model":716947012,"dashboardColor":0,"modHydraulics":false,"modLightbar":-1,"modGrille":-1,"extras":[0],"modFrame":-1,"modSpeakers":-1,"engineHealth":954,"modEngine":-1,"modFender":-1,"plateIndex":0,"modShifterLeavers":-1,"modRoof":-1,"wheelColor":159,"oilLevel":5,"modAerials":-1,"paintType1":0,"modSuspension":-1,"plate":"DRW9697J","modWindows":-1,"modDoorSpeaker":-1,"modNitrous":-1,"modArmor":-1,"modHorns":-1,"modStruts":-1,"bulletProofTyres":true,"modCustomTiresR":false,"modBackWheels":-1,"fuelLevel":61,"modPlateHolder":-1,"modTransmission":-1,"modSubwoofer":-1,"modAPlate":-1,"windowTint":0,"modSideSkirt":-1,"modSmokeEnabled":false,"modOrnaments":-1,"modHydrolic":-1,"modDoorR":-1,"bodyHealth":960,"driftTyres":false,"modArchCover":-1,"neonColor":[255,0,255],"modVanityPlate":-1,"tankHealth":986,"modRoofLivery":-1,"modHood":-1,"wheelWidth":0.0,"xenonColor":255,"modRightFender":-1,"modFrontWheels":-1,"modTrimA":-1,"modCustomTiresF":false,"color1":[255,255,255],"modLivery":-1,"wheels":6,"wheelSize":0.0,"modSpoilers":-1,"neonEnabled":[false,false,false,false],"modTrunk":-1,"modRearBumper":-1}', '{"primaryColor":{"name":"primaryColor","value":{"g":255,"r":255,"material":"metallic","b":255},"price":1000,"label":"primaryColor"},"pearlescentColor":{"name":"pearlescentColor","value":158,"price":500,"label":"pearlescentColor"},"secondaryColor":{"name":"secondaryColor","value":{"g":60,"b":164,"material":"metallic","r":230},"price":1000,"label":"secondaryColor"}}', 3500, 'completed', '2025-12-08 19:08:52', '2025-12-08 19:10:33'),
	(6, '866698', 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 'LeR | Tooko Pea', 'SULTAN', '4TF65907', '{"doors":[],"modXenon":false,"modSeats":-1,"modSteeringWheel":-1,"modTrimB":-1,"modExhaust":-1,"color2":1,"modFrontBumper":-1,"interiorColor":38,"pearlescentColor":5,"modEngineBlock":-1,"tyres":[],"modBrakes":-1,"livery":-1,"modTank":-1,"modDashboard":-1,"dirtLevel":7,"paintType2":7,"windows":[4,5],"modDial":-1,"modAirFilter":-1,"tyreSmokeColor":[255,255,255],"modTurbo":false,"model":970598228,"dashboardColor":0,"modHydraulics":false,"modLightbar":-1,"modGrille":-1,"extras":{"10":0,"12":1},"modFrame":-1,"modSpeakers":-1,"engineHealth":1000,"modEngine":-1,"modFender":-1,"plateIndex":3,"modShifterLeavers":-1,"modRoof":-1,"wheelColor":156,"oilLevel":5,"modAerials":-1,"paintType1":7,"modSuspension":-1,"plate":"4TF65907","modWindows":-1,"modDoorSpeaker":-1,"modNitrous":-1,"modArmor":-1,"modHorns":-1,"modStruts":-1,"bulletProofTyres":true,"modCustomTiresR":false,"modBackWheels":-1,"fuelLevel":64,"modPlateHolder":-1,"modTransmission":-1,"modSubwoofer":-1,"modAPlate":-1,"windowTint":0,"modSideSkirt":-1,"modSmokeEnabled":false,"modOrnaments":-1,"modHydrolic":-1,"modDoorR":-1,"bodyHealth":995,"driftTyres":false,"modArchCover":-1,"neonColor":[255,0,255],"modVanityPlate":-1,"tankHealth":1000,"modRoofLivery":-1,"modHood":-1,"wheelWidth":1.0,"xenonColor":255,"modRightFender":-1,"modFrontWheels":-1,"modTrimA":-1,"modCustomTiresF":false,"color1":[255,255,0],"modLivery":-1,"wheels":0,"wheelSize":1.0,"modSpoilers":-1,"neonEnabled":[false,false,false,false],"modTrunk":-1,"modRearBumper":-1}', '{"primaryColor":{"name":"primaryColor","value":{"g":255,"r":255,"material":"metallic","b":0},"price":1000,"label":"primaryColor"},"interiorColor":{"name":"interiorColor","value":{"index":38},"price":750,"label":"interiorColor"}}', 1750, 'in_progress', '2025-12-08 19:11:14', NULL);

-- Listage de la structure de table zak. qs_mechanics
CREATE TABLE IF NOT EXISTS `qs_mechanics` (
  `id` varchar(64) NOT NULL,
  `job` varchar(64) DEFAULT NULL,
  `jobGrade` int(11) DEFAULT NULL,
  `bossGrade` int(11) DEFAULT 0,
  `shopConfig` longtext DEFAULT NULL,
  `created_at` varchar(32) DEFAULT NULL,
  `balance` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_job` (`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_mechanics : ~2 rows (environ)
INSERT INTO `qs_mechanics` (`id`, `job`, `jobGrade`, `bossGrade`, `shopConfig`, `created_at`, `balance`) VALUES
	('439522', 'harmony', 0, 4, '{"carlift":{"enabled":true,"coords":{"y":2639.795166015625,"x":1175.155029296875,"w":183.99671936035157,"z":36.74110794067383},"locations":[{"y":2639.795166015625,"x":1175.155029296875,"w":183.99671936035157,"z":36.74110794067383}]},"job":"harmony","categorys":{"cosmetics":true,"performance":true,"repairs":true,"wheels":true,"respray":true},"tuneshopLocations":[{"z":37.32801818847656,"y":2638.82666015625,"x":1178.6702880859376,"w":176.4890289306641,"categorys":{"cosmetics":true,"performance":true,"repairs":true,"wheels":true,"respray":true}},{"z":37.32802581787109,"y":2640.419189453125,"x":1183.1298828125,"w":181.700927734375,"categorys":{"cosmetics":true,"performance":true,"repairs":true,"wheels":true,"respray":true}}],"bossGrade":4,"shops":{"enabled":false,"locations":[]},"stashes":{"enabled":true,"locations":[{"y":2643.811279296875,"x":1189.583251953125,"w":292.2214965820313,"z":37.4020767211914}]},"garages":{"enabled":false,"locations":[]},"coords":{"y":2638.82666015625,"x":1178.6702880859376,"w":176.4890289306641,"z":37.32801818847656},"blip":{"coords":{"y":2641.351806640625,"x":1176.2757568359376,"w":149.9890289306641,"z":36.75397872924805},"color":81,"name":"Harmony\'S Repair","sprite":544,"scale":0.8},"jobGrade":0,"engineSwap":{"enabled":false}}', '2025-11-28 19:03:35', 0),
	('866698', 'mechanic', 0, 4, '{"job":"mechanic","categorys":{"respray":true,"wheels":true,"cosmetics":true,"repairs":true,"performance":true},"carlift":{"locations":[{"w":269.623779296875,"x":832.053955078125,"y":-818.8767700195313,"z":25.31985473632812}],"coords":{"w":269.623779296875,"x":832.053955078125,"y":-818.8767700195313,"z":25.31985473632812},"enabled":true},"stashes":{"enabled":true,"locations":[{"w":160.5569610595703,"x":841.8800659179688,"y":-824.760498046875,"z":25.33272552490234}]},"bossGrade":4,"tuneshopLocations":[{"w":262.7344970703125,"x":833.4800415039063,"categorys":{"respray":true,"wheels":true,"cosmetics":true,"repairs":true,"performance":true},"y":-804.792724609375,"z":25.90678024291992},{"w":260.3505554199219,"x":833.867431640625,"categorys":{"respray":true,"wheels":true,"cosmetics":true,"repairs":true,"performance":true},"y":-812.1804809570313,"z":25.90678215026855},{"w":277.4942932128906,"x":805.8485107421875,"categorys":{"respray":false,"wheels":false,"cosmetics":false,"repairs":false,"performance":false},"y":-820.1038208007813,"z":25.75674629211425}],"engineSwap":{"enabled":false},"shops":{"enabled":false,"locations":[]},"garages":{"enabled":false,"locations":[]},"blip":{"name":"Otto\'S Repair","sprite":544,"scale":0.8,"coords":{"w":90.46196746826172,"x":827.4332885742188,"y":-819.2990112304688,"z":25.33272552490234},"color":81},"coords":{"w":262.7344970703125,"x":833.4800415039063,"y":-804.792724609375,"z":25.90678024291992},"jobGrade":0}', '2025-11-27 18:53:42', 0);

-- Listage de la structure de table zak. qs_miner
CREATE TABLE IF NOT EXISTS `qs_miner` (
  `identifier` varchar(46) NOT NULL,
  `level` int(10) unsigned NOT NULL DEFAULT 1,
  `experience` int(10) unsigned NOT NULL DEFAULT 0,
  `total_experience` int(10) unsigned NOT NULL DEFAULT 0,
  `total_earnings` int(10) unsigned NOT NULL DEFAULT 0,
  `season_experience` int(10) unsigned NOT NULL DEFAULT 0,
  `season_earnings` int(10) unsigned NOT NULL DEFAULT 0,
  `daily_experience` int(10) unsigned NOT NULL DEFAULT 0,
  `daily_earnings` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_miner : ~10 rows (environ)
INSERT INTO `qs_miner` (`identifier`, `level`, `experience`, `total_experience`, `total_earnings`, `season_experience`, `season_earnings`, `daily_experience`, `daily_earnings`) VALUES
	('char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 1, 1250, 1250, 630, 1250, 630, 1250, 630),
	('char0:28a24dc4b57feb9580c57626e3c03439a900f876', 2, 725, 4225, 200, 4225, 200, 4225, 200),
	('char0:2c04a8506e426a0867af88aada9d2698cebb7d18', 1, 0, 0, 0, 0, 0, 0, 0),
	('char0:72e2349201e0683aa2540804c45f566df0755123', 1, 0, 0, 0, 0, 0, 0, 0),
	('char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 1, 0, 0, 0, 0, 0, 0, 0),
	('char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 1, 545, 545, 500, 545, 500, 545, 500),
	('char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 1, 0, 0, 0, 0, 0, 0, 0),
	('char0:fcb47b307801e586e8c95881bdfc98004f24d031', 1, 0, 0, 0, 0, 0, 0, 0),
	('e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 1, 0, 0, 0, 0, 0, 0, 0),
	('fcb47b307801e586e8c95881bdfc98004f24d031', 1, 475, 475, 130, 475, 130, 475, 130);

-- Listage de la structure de table zak. qs_miner_leaderboard_winners
CREATE TABLE IF NOT EXISTS `qs_miner_leaderboard_winners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `reward_amount` int(11) NOT NULL,
  `reward_type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `position` (`position`,`reward_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_miner_leaderboard_winners : ~0 rows (environ)

-- Listage de la structure de table zak. qs_miner_resets
CREATE TABLE IF NOT EXISTS `qs_miner_resets` (
  `identifier` varchar(46) NOT NULL,
  `last_daily_reset` datetime NOT NULL DEFAULT current_timestamp(),
  `last_season_reset` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_miner_resets : ~0 rows (environ)
INSERT INTO `qs_miner_resets` (`identifier`, `last_daily_reset`, `last_season_reset`) VALUES
	('default_identifier', '2025-11-26 17:04:16', '2025-11-26 17:04:16');

-- Listage de la structure de table zak. qs_miner_rewards
CREATE TABLE IF NOT EXISTS `qs_miner_rewards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `reward_type` varchar(50) NOT NULL,
  `reward_amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_miner_rewards : ~0 rows (environ)

-- Listage de la structure de table zak. qs_multicharacter_slots
CREATE TABLE IF NOT EXISTS `qs_multicharacter_slots` (
  `license` varchar(80) NOT NULL,
  `activated_slots` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`license`) USING BTREE,
  UNIQUE KEY `license_UNIQUE` (`license`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table zak.qs_multicharacter_slots : ~8 rows (environ)
INSERT INTO `qs_multicharacter_slots` (`license`, `activated_slots`) VALUES
	('09e089f17095e762c4d5fa0c760cb95ff555a4e6', NULL),
	('28a24dc4b57feb9580c57626e3c03439a900f876', NULL),
	('2c04a8506e426a0867af88aada9d2698cebb7d18', NULL),
	('72e2349201e0683aa2540804c45f566df0755123', NULL),
	('d80bf51e74a6e4cc571852f5de48f019df1f37ff', NULL),
	('e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', NULL),
	('ed3f34298dc055c8fc569b00d32aa06a9eed7da7', NULL),
	('fcb47b307801e586e8c95881bdfc98004f24d031', NULL);

-- Listage de la structure de table zak. qs_multicharacter_transactions
CREATE TABLE IF NOT EXISTS `qs_multicharacter_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(70) NOT NULL DEFAULT '0',
  `license` varchar(90) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table zak.qs_multicharacter_transactions : ~0 rows (environ)

-- Listage de la structure de table zak. qs_multijob
CREATE TABLE IF NOT EXISTS `qs_multijob` (
  `identifier` varchar(46) NOT NULL,
  `job` varchar(100) NOT NULL,
  `grade` int(10) NOT NULL DEFAULT 0,
  `badges` text DEFAULT NULL,
  PRIMARY KEY (`identifier`,`job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_multijob : ~14 rows (environ)
INSERT INTO `qs_multijob` (`identifier`, `job`, `grade`, `badges`) VALUES
	('char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 'mechanic', 4, '[]'),
	('char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 'realestate', 3, '[]'),
	('char0:28a24dc4b57feb9580c57626e3c03439a900f876', 'cardealer', 3, '[]'),
	('char0:28a24dc4b57feb9580c57626e3c03439a900f876', 'police', 0, '[]'),
	('char0:28a24dc4b57feb9580c57626e3c03439a900f876', 'realestate', 3, '[]'),
	('char0:72e2349201e0683aa2540804c45f566df0755123', 'concess', 2, '[]'),
	('char0:72e2349201e0683aa2540804c45f566df0755123', 'taxi', 0, '[]'),
	('char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 'concess', 2, '[]'),
	('char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'police', 4, '[]'),
	('char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'realestate', 2, '[]'),
	('char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 'police', 0, '[]'),
	('char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'mechanic', 1, '[]'),
	('e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'ambulance', 3, '[]'),
	('e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'police', 4, '[]');

-- Listage de la structure de table zak. qs_newspaper
CREATE TABLE IF NOT EXISTS `qs_newspaper` (
  `identifier` varchar(46) NOT NULL,
  `level` int(10) unsigned NOT NULL DEFAULT 1,
  `experience` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_newspaper : ~10 rows (environ)
INSERT INTO `qs_newspaper` (`identifier`, `level`, `experience`) VALUES
	('char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 1, 0),
	('char0:28a24dc4b57feb9580c57626e3c03439a900f876', 1, 0),
	('char0:2c04a8506e426a0867af88aada9d2698cebb7d18', 1, 0),
	('char0:72e2349201e0683aa2540804c45f566df0755123', 1, 0),
	('char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 2, 500),
	('char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 1, 0),
	('char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 1, 0),
	('char0:fcb47b307801e586e8c95881bdfc98004f24d031', 1, 0),
	('e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 1, 0),
	('fcb47b307801e586e8c95881bdfc98004f24d031', 1, 0);

-- Listage de la structure de table zak. qs_shops
CREATE TABLE IF NOT EXISTS `qs_shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(70) NOT NULL DEFAULT '0',
  `label` varchar(50) DEFAULT '0',
  `shop_type` varchar(30) DEFAULT NULL,
  `zone` longtext DEFAULT NULL,
  `ped` longtext DEFAULT NULL,
  `blip` longtext DEFAULT NULL,
  `items` longtext DEFAULT NULL,
  `buyable_items` longtext DEFAULT NULL,
  `categories` longtext DEFAULT NULL,
  `sellable_items` longtext DEFAULT NULL,
  `job` varchar(30) DEFAULT NULL,
  `job_grades` longtext DEFAULT NULL,
  `gang` varchar(30) DEFAULT NULL,
  `gang_grades` longtext DEFAULT NULL,
  `societies` longtext DEFAULT NULL,
  `ownership` longtext DEFAULT NULL,
  `required_items` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_open` tinyint(1) DEFAULT 1,
  `balance` float DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `shop_type` (`shop_type`),
  KEY `creator` (`creator`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.qs_shops : ~31 rows (environ)
INSERT INTO `qs_shops` (`id`, `creator`, `label`, `shop_type`, `zone`, `ped`, `blip`, `items`, `buyable_items`, `categories`, `sellable_items`, `job`, `job_grades`, `gang`, `gang_grades`, `societies`, `ownership`, `required_items`, `created_at`, `updated_at`, `is_open`, `balance`) VALUES
	(1, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '24/7 Supermarket', 'store', '{"thickness":25,"points":[{"x":19.5457763671875,"z":29,"y":-1349.4512939453126},{"x":49.47792816162109,"z":29,"y":-1348.9949951171876},{"x":48.41528701782226,"z":29,"y":-1323.58544921875},{"x":19.53934097290039,"z":29,"y":-1316.08642578125}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":24.47056579589843,"w":273,"z":28.49703216552734,"y":-1346.552490234375},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":29.12844467163086,"z":29.95085716247558,"y":-1349.2176513671876},"sprite":59,"label":"24/7 Supermarket","scale":0.5,"enable":true,"color":2}', '[{"stock":100,"name":"bread","price":200,"category":"food","image":"nui://ox_inventory/web/images/bread.png","description":""},{"stock":10,"name":"radio","price":1000,"category":"electronics","image":"nui://ox_inventory/web/images/radio.png","description":""},{"stock":-1,"name":"phone","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/phone.png","description":""},{"stock":50,"name":"WEAPON_PETROLCAN","price":300,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":""},{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"burger","price":400,"category":"food","image":"nui://ox_inventory/web/images/burger.png","description":""},{"stock":50,"name":"coca","price":300,"category":"food","image":"nui://ox_inventory/web/images/coca.png","description":""},{"stock":50,"name":"ice_tea","price":300,"category":"food","image":"nui://ox_inventory/web/images/ice_tea.png","description":""},{"stock":10,"name":"powerbank","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/powerbank.png","description":""}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 02:56:59', '2025-11-28 22:56:52', 1, 0),
	(2, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'LTD Gasoline', 'store', '{"thickness":25,"points":[{"x":-59.81517028808594,"z":29,"y":-1751.097900390625},{"x":-47.20943832397461,"z":29,"y":-1761.48291015625},{"x":-38.3992805480957,"z":29,"y":-1751.2235107421876},{"x":-50.62450790405273,"z":29,"y":-1740.4112548828126}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":-46.99421310424805,"w":46,"z":28.42100524902343,"y":-1758.2464599609376},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":-53.04525375366211,"z":30.14521789550781,"y":-1756.5491943359376},"sprite":59,"label":"LTD Gasoline","scale":0.5,"enable":true,"color":2}', '[{"stock":100,"name":"water","price":200,"category":"food","image":"nui://ox_inventory/web/images/water.png","description":""},{"stock":100,"name":"bread","price":200,"category":"food","image":"nui://ox_inventory/web/images/bread.png","description":""},{"stock":-1,"name":"phone","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/phone.png","description":""},{"stock":10,"name":"radio","price":1000,"category":"electronics","image":"nui://ox_inventory/web/images/radio.png","description":""},{"stock":50,"name":"WEAPON_PETROLCAN","price":300,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":""},{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"burger","price":400,"category":"food","image":"nui://ox_inventory/web/images/burger.png","description":""},{"stock":50,"name":"coca","price":300,"category":"food","image":"nui://ox_inventory/web/images/coca.png","description":""},{"stock":50,"name":"ice_tea","price":300,"category":"food","image":"nui://ox_inventory/web/images/ice_tea.png","description":""},{"stock":10,"name":"powerbank","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/powerbank.png","description":""}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 02:58:35', '2025-11-28 23:05:49', 1, 0),
	(3, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Ammunation', 'store', '{"thickness":25,"points":[{"x":829.9503784179688,"z":29,"y":-2148.0185546875},{"x":805.986328125,"z":29,"y":-2148.033935546875},{"x":804.0986328125,"z":29,"y":-2196.477783203125},{"x":830.3529663085938,"z":29,"y":-2196.2744140625}]}', '{"enable":true,"visibility":true,"distance":5,"model":"s_m_y_ammucity_01","coords":{"x":809.6917114257813,"w":0,"z":28.61900520324707,"y":-2159.16064453125},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":811.8255615234375,"z":29.98397636413574,"y":-2148.319580078125},"sprite":110,"label":"Ammunation","scale":0.5,"enable":true,"color":76}', '[{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"WEAPON_KNIFE","price":8000,"category":"weapons","image":"nui://ox_inventory/web/images/WEAPON_KNIFE.png","description":""}]', NULL, '[{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"},{"description":"Firearms, melee weapons, and ammunition","name":"Weapons","icon":"Fa6Gun","borderColor":"border-red-500/30","id":"weapons","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:01:01', '2025-11-28 22:59:51', 1, 0),
	(4, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Ammunation', 'store', '{"thickness":25,"points":[{"x":835.519775390625,"z":27,"y":-1024.40771484375},{"x":835.5563354492188,"z":27,"y":-1041.765869140625},{"x":857.6919555664063,"z":27,"y":-1041.5875244140626},{"x":857.7210693359375,"z":27,"y":-1024.4248046875}]}', '{"enable":true,"visibility":true,"distance":5,"model":"s_m_y_ammucity_01","coords":{"x":842.0787963867188,"w":0,"z":27.19485282897949,"y":-1035.3570556640626},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":844.0233154296875,"z":28.34489250183105,"y":-1024.5892333984376},"sprite":110,"label":"Ammunation","scale":0.5,"enable":true,"color":76}', '[{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"WEAPON_KNIFE","price":8000,"category":"weapons","image":"nui://ox_inventory/web/images/WEAPON_KNIFE.png","description":""}]', NULL, '[{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"},{"description":"Firearms, melee weapons, and ammunition","name":"Weapons","icon":"Fa6Gun","borderColor":"border-red-500/30","id":"weapons","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:05:33', '2025-11-28 23:00:11', 1, 0),
	(5, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Robs Liquor', 'store', '{"thickness":25,"points":[{"x":1140.8775634765626,"z":47,"y":-976.2840576171876},{"x":1143.57421875,"z":47,"y":-995.1400756835938},{"x":1131.608642578125,"z":47,"y":-996.8450317382813},{"x":1130.2447509765626,"z":47,"y":-987.1415405273438},{"x":1120.630859375,"z":47,"y":-988.485107421875},{"x":1119.273193359375,"z":47,"y":-979.3589477539064}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":1134.1348876953126,"w":273,"z":45.41582489013672,"y":-982.8303833007813},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":1141.191162109375,"z":46.53216934204101,"y":-981.1019897460938},"sprite":59,"label":"Robs Liquor","scale":0.5,"enable":true,"color":2}', '[{"stock":100,"name":"bread","price":200,"category":"food","image":"nui://ox_inventory/web/images/bread.png","description":""},{"stock":10,"name":"radio","price":1000,"category":"electronics","image":"nui://ox_inventory/web/images/radio.png","description":""},{"stock":-1,"name":"phone","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/phone.png","description":""},{"stock":50,"name":"WEAPON_PETROLCAN","price":300,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":""},{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"burger","price":400,"category":"food","image":"nui://ox_inventory/web/images/burger.png","description":""},{"stock":50,"name":"coca","price":300,"category":"food","image":"nui://ox_inventory/web/images/coca.png","description":""},{"stock":50,"name":"ice_tea","price":300,"category":"food","image":"nui://ox_inventory/web/images/ice_tea.png","description":""},{"stock":10,"name":"powerbank","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/powerbank.png","description":""}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:07:43', '2025-11-28 23:08:33', 1, 0),
	(6, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'LTD Gasoline', 'store', '{"thickness":25,"points":[{"x":1151.156982421875,"z":69,"y":-328.3247375488281},{"x":1167.130126953125,"z":69,"y":-325.35784912109377},{"x":1164.726318359375,"z":69,"y":-311.6214294433594},{"x":1148.70263671875,"z":69,"y":-314.4093017578125}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":1164.7037353515626,"w":100,"z":68.2051010131836,"y":-322.8495788574219},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":1159.651611328125,"z":69.97684478759766,"y":-326.6385498046875},"sprite":59,"label":"LTD Gasoline","scale":0.5,"enable":true,"color":2}', '[{"stock":100,"name":"bread","price":200,"category":"food","image":"nui://ox_inventory/web/images/bread.png","description":""},{"stock":10,"name":"radio","price":1000,"category":"electronics","image":"nui://ox_inventory/web/images/radio.png","description":""},{"stock":-1,"name":"phone","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/phone.png","description":""},{"stock":50,"name":"WEAPON_PETROLCAN","price":300,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":""},{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"burger","price":400,"category":"food","image":"nui://ox_inventory/web/images/burger.png","description":""},{"stock":50,"name":"coca","price":300,"category":"food","image":"nui://ox_inventory/web/images/coca.png","description":""},{"stock":50,"name":"ice_tea","price":300,"category":"food","image":"nui://ox_inventory/web/images/ice_tea.png","description":""},{"stock":10,"name":"powerbank","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/powerbank.png","description":""}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:09:16', '2025-11-28 23:06:05', 1, 0),
	(7, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '24/7 Supermarket', 'store', '{"thickness":25,"points":[{"x":368.5384521484375,"z":103,"y":325.1864929199219},{"x":384.5440673828125,"z":103,"y":321.2618713378906},{"x":394.20550537109377,"z":103,"y":352.648193359375},{"x":377.2201843261719,"z":103,"y":357.08343505859377}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":372.64312744140627,"w":251,"z":102.56641387939452,"y":326.9703674316406},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":376.6477966308594,"z":103.87000274658205,"y":323.4255981445313},"sprite":59,"label":"24/7 Supermarket","scale":0.5,"enable":true,"color":2}', '[{"stock":100,"name":"bread","price":200,"category":"food","image":"nui://ox_inventory/web/images/bread.png","description":""},{"stock":10,"name":"radio","price":1000,"category":"electronics","image":"nui://ox_inventory/web/images/radio.png","description":""},{"stock":-1,"name":"phone","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/phone.png","description":""},{"stock":50,"name":"WEAPON_PETROLCAN","price":300,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":""},{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"burger","price":400,"category":"food","image":"nui://ox_inventory/web/images/burger.png","description":""},{"stock":50,"name":"coca","price":300,"category":"food","image":"nui://ox_inventory/web/images/coca.png","description":""},{"stock":50,"name":"ice_tea","price":300,"category":"food","image":"nui://ox_inventory/web/images/ice_tea.png","description":""},{"stock":10,"name":"powerbank","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/powerbank.png","description":""}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:10:27', '2025-11-28 22:57:07', 1, 0),
	(8, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Ammunation', 'store', '{"thickness":25,"points":[{"x":246.2093048095703,"z":70,"y":-39.98151016235352},{"x":276.85174560546877,"z":70,"y":-50.38654708862305},{"x":271.248779296875,"z":70,"y":-62.82939147949219},{"x":242.10153198242188,"z":70,"y":-51.94028854370117}]}', '{"enable":true,"visibility":true,"distance":5,"model":"s_m_y_ammucity_01","coords":{"x":253.7380523681641,"w":74,"z":68.94110107421875,"y":-50.84069442749023},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":244.65737915039066,"z":68.94105529785156,"y":-45.52584838867187},"sprite":110,"label":"Ammunation","scale":0.5,"enable":true,"color":76}', '[{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"WEAPON_KNIFE","price":8000,"category":"weapons","image":"nui://ox_inventory/web/images/WEAPON_KNIFE.png","description":""}]', NULL, '[{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"},{"description":"Firearms, melee weapons, and ammunition","name":"Weapons","icon":"Fa6Gun","borderColor":"border-red-500/30","id":"weapons","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:13:10', '2025-11-28 23:00:38', 1, 0),
	(9, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Robs Liquor', 'store', '{"thickness":25,"points":[{"x":-1495.872314453125,"z":40,"y":-378.3612365722656},{"x":-1482.8651123046876,"z":40,"y":-391.4000244140625},{"x":-1468.502685546875,"z":40,"y":-372.3566284179687},{"x":-1476.551025390625,"z":40,"y":-362.583251953125}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":-1486.5616455078126,"w":130,"z":39.16341018676758,"y":-377.6849060058594},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":-1490.601318359375,"z":39.18024063110352,"y":-383.01568603515627},"sprite":59,"label":"Robs Liquor","scale":0.5,"enable":true,"color":2}', '[{"stock":100,"name":"water","price":200,"category":"food","image":"nui://ox_inventory/web/images/water.png","description":""},{"stock":100,"name":"bread","price":200,"category":"food","image":"nui://ox_inventory/web/images/bread.png","description":""},{"stock":10,"name":"radio","price":1000,"category":"electronics","image":"nui://ox_inventory/web/images/radio.png","description":""},{"stock":-1,"name":"phone","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/phone.png","description":""},{"stock":50,"name":"WEAPON_PETROLCAN","price":300,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":""},{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"burger","price":400,"category":"food","image":"nui://ox_inventory/web/images/burger.png","description":""},{"stock":50,"name":"coca","price":300,"category":"food","image":"nui://ox_inventory/web/images/coca.png","description":""},{"stock":50,"name":"ice_tea","price":300,"category":"food","image":"nui://ox_inventory/web/images/ice_tea.png","description":""},{"stock":10,"name":"powerbank","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/powerbank.png","description":""}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:15:27', '2025-11-28 23:08:49', 1, 0),
	(10, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Robs Liquor', 'store', '{"thickness":25,"points":[{"x":-1232.4578857421876,"z":13,"y":-906.2232666015624},{"x":-1221.156494140625,"z":13,"y":-898.2681274414063},{"x":-1205.2591552734376,"z":13,"y":-921.1434326171876},{"x":-1218.6517333984376,"z":13,"y":-929.2984619140624}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":-1221.5682373046876,"w":35,"z":11.32635116577148,"y":-908.1322631835938},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":-1226.36962890625,"z":12.45345687866211,"y":-902.830078125},"sprite":59,"label":"Robs Liquor","scale":0.5,"enable":true,"color":2}', '[{"stock":100,"name":"bread","price":200,"category":"food","image":"nui://ox_inventory/web/images/bread.png","description":""},{"stock":10,"name":"radio","price":1000,"category":"electronics","image":"nui://ox_inventory/web/images/radio.png","description":""},{"stock":-1,"name":"phone","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/phone.png","description":""},{"stock":50,"name":"WEAPON_PETROLCAN","price":300,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":""},{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"burger","price":400,"category":"food","image":"nui://ox_inventory/web/images/burger.png","description":""},{"stock":50,"name":"coca","price":300,"category":"food","image":"nui://ox_inventory/web/images/coca.png","description":""},{"stock":50,"name":"ice_tea","price":300,"category":"food","image":"nui://ox_inventory/web/images/ice_tea.png","description":""},{"stock":10,"name":"powerbank","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/powerbank.png","description":""}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:16:26', '2025-11-28 23:09:06', 1, 0),
	(11, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'LTD Gasoline', 'store', '{"thickness":25,"points":[{"x":-720.4861450195313,"z":19,"y":-916.8019409179688},{"x":-719.3689575195313,"z":19,"y":-879.7001342773438},{"x":-691.5964965820313,"z":19,"y":-881.6516723632813},{"x":-697.02783203125,"z":19,"y":-916.6630859375}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":-706.0650634765625,"w":100,"z":18.21559906005859,"y":-913.8833618164064},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":-711.8024291992188,"z":19.35943031311035,"y":-916.5892944335938},"sprite":59,"label":"LTD Gasoline","scale":0.5,"enable":true,"color":2}', '[{"stock":100,"name":"bread","price":200,"category":"food","image":"nui://ox_inventory/web/images/bread.png","description":""},{"stock":10,"name":"radio","price":1000,"category":"electronics","image":"nui://ox_inventory/web/images/radio.png","description":""},{"stock":-1,"name":"phone","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/phone.png","description":""},{"stock":50,"name":"WEAPON_PETROLCAN","price":300,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":""},{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"burger","price":400,"category":"food","image":"nui://ox_inventory/web/images/burger.png","description":""},{"stock":50,"name":"coca","price":300,"category":"food","image":"nui://ox_inventory/web/images/coca.png","description":""},{"stock":50,"name":"ice_tea","price":300,"category":"food","image":"nui://ox_inventory/web/images/ice_tea.png","description":""},{"stock":10,"name":"powerbank","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/powerbank.png","description":""}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:19:46', '2025-11-28 23:07:21', 1, 0),
	(12, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Ammunation', 'store', '{"thickness":25,"points":[{"x":-666.7711791992188,"z":22,"y":-945.2850341796876},{"x":-655.4292602539063,"z":22,"y":-945.2899780273438},{"x":-655.5523071289063,"z":22,"y":-922.4465942382813},{"x":-677.8963623046875,"z":22,"y":-922.46240234375}]}', '{"enable":true,"visibility":true,"distance":5,"model":"s_m_y_ammucity_01","coords":{"x":-662.1499633789063,"w":190,"z":20.82922554016113,"y":-933.5098266601564},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":-663.979248046875,"z":21.99813270568847,"y":-944.2755737304688},"sprite":110,"label":"Ammunation","scale":0.5,"enable":true,"color":76}', '[{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"WEAPON_KNIFE","price":8000,"category":"weapons","image":"nui://ox_inventory/web/images/WEAPON_KNIFE.png","description":""}]', NULL, '[{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"},{"description":"Firearms, melee weapons, and ammunition","name":"Weapons","icon":"Fa6Gun","borderColor":"border-red-500/30","id":"weapons","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:21:04', '2025-11-28 23:01:21', 1, 0),
	(13, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Robs Liquor', 'store', '{"thickness":25,"points":[{"x":-2973.314697265625,"z":15,"y":397.2532348632813},{"x":-2974.528564453125,"z":15,"y":378.0843811035156},{"x":-2957.2080078125,"z":15,"y":376.8941650390625},{"x":-2955.939697265625,"z":15,"y":395.9798278808594}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":-2966.380859375,"w":79,"z":14.04330825805664,"y":391.3348388671875},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":-2973.451171875,"z":15.17798042297363,"y":390.6714782714844},"sprite":59,"label":"Robs Liquor","scale":0.5,"enable":true,"color":2}', '[{"stock":100,"name":"water","price":200,"category":"food","image":"nui://ox_inventory/web/images/water.png","description":""},{"stock":100,"name":"bread","price":200,"category":"food","image":"nui://ox_inventory/web/images/bread.png","description":""},{"stock":10,"name":"radio","price":1000,"category":"electronics","image":"nui://ox_inventory/web/images/radio.png","description":""},{"stock":-1,"name":"phone","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/phone.png","description":""},{"stock":50,"name":"WEAPON_PETROLCAN","price":300,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":""},{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"burger","price":400,"category":"food","image":"nui://ox_inventory/web/images/burger.png","description":""},{"stock":50,"name":"coca","price":300,"category":"food","image":"nui://ox_inventory/web/images/coca.png","description":""},{"stock":50,"name":"ice_tea","price":300,"category":"food","image":"nui://ox_inventory/web/images/ice_tea.png","description":""},{"stock":10,"name":"powerbank","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/powerbank.png","description":""}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:22:31', '2025-11-28 23:11:44', 1, 0),
	(14, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '24/7 Supermarket', 'store', '{"thickness":25,"points":[{"x":-3036.66845703125,"z":8,"y":583.8246459960938},{"x":-3040.29736328125,"z":8,"y":595.2843627929688},{"x":-3047.34375,"z":8,"y":592.9635009765625},{"x":-3046.576171875,"z":8,"y":590.1170654296875},{"x":-3054.232666015625,"z":8,"y":586.4769897460938},{"x":-3052.2119140625,"z":8,"y":579.8822631835938}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":-3039.541259765625,"w":14,"z":6.90893173217773,"y":584.3851318359375},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":-3038.663818359375,"z":8.05318450927734,"y":589.4774169921875},"sprite":59,"label":"24/7 Supermarket","scale":0.5,"enable":true,"color":2}', '[{"stock":100,"name":"bread","price":200,"category":"food","image":"nui://ox_inventory/web/images/bread.png","description":""},{"stock":10,"name":"radio","price":1000,"category":"electronics","image":"nui://ox_inventory/web/images/radio.png","description":""},{"stock":-1,"name":"phone","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/phone.png","description":""},{"stock":50,"name":"WEAPON_PETROLCAN","price":300,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":""},{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"burger","price":400,"category":"food","image":"nui://ox_inventory/web/images/burger.png","description":""},{"stock":50,"name":"coca","price":300,"category":"food","image":"nui://ox_inventory/web/images/coca.png","description":""},{"stock":50,"name":"ice_tea","price":300,"category":"food","image":"nui://ox_inventory/web/images/ice_tea.png","description":""},{"stock":10,"name":"powerbank","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/powerbank.png","description":""}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:23:49', '2025-11-28 22:57:30', 1, 0),
	(15, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '24/7 Supermarket', 'store', '{"thickness":25,"points":[{"x":-3239.560791015625,"z":12,"y":1010.0498046875},{"x":-3240.4873046875,"z":12,"y":998.9927368164064},{"x":-3242.692626953125,"z":12,"y":997.2202758789064},{"x":-3253.76611328125,"z":12,"y":998.0797119140624},{"x":-3252.897216796875,"z":12,"y":1007.6017456054688},{"x":-3246.709716796875,"z":12,"y":1012.6519165039064},{"x":-3241.373291015625,"z":12,"y":1012.161865234375}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":-3242.964111328125,"w":0,"z":11.83071136474609,"y":1000.02587890625},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":-3240.058837890625,"z":13.10819911956787,"y":1004.5262451171876},"sprite":59,"label":"24/7 Supermarket","scale":0.5,"enable":true,"color":2}', '[{"image":"nui://ox_inventory/web/images/bread.png","description":"","category":"food","name":"bread","price":200,"stock":100,"label":"Bread"},{"image":"nui://ox_inventory/web/images/radio.png","description":"","category":"electronics","name":"radio","price":1000,"stock":10,"label":"Radio"},{"image":"nui://ox_inventory/web/images/phone.png","description":"","category":"electronics","name":"phone","price":500,"stock":-1,"label":"Classic Phone"},{"image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":"","category":"misc","name":"WEAPON_PETROLCAN","price":300,"stock":50,"label":"Jerry Can"},{"image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":"","category":"misc","name":"WEAPON_FLASHLIGHT","price":500,"stock":10,"label":"Flashlight"},{"image":"nui://ox_inventory/web/images/burger.png","description":"","category":"food","name":"burger","price":400,"stock":45,"label":"Burger"},{"image":"nui://ox_inventory/web/images/coca.png","description":"","category":"food","name":"coca","price":300,"stock":44,"label":"Coca"},{"image":"nui://ox_inventory/web/images/ice_tea.png","description":"","category":"food","name":"ice_tea","price":300,"stock":50,"label":"Ice Tea"},{"image":"nui://ox_inventory/web/images/powerbank.png","description":"","category":"electronics","name":"powerbank","price":500,"stock":10,"label":"Power Bank"}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:24:54', '2025-12-02 17:17:06', 1, 0),
	(16, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Ammunation', 'store', '{"thickness":25,"points":[{"x":-3176.109375,"z":22,"y":1094.4124755859376},{"x":-3161.41357421875,"z":22,"y":1088.049072265625},{"x":-3165.30078125,"z":22,"y":1079.854736328125},{"x":-3176.2802734375,"z":22,"y":1084.580322265625}]}', '{"enable":true,"visibility":true,"distance":5,"model":"s_m_y_ammucity_01","coords":{"x":-3173.333984375,"w":253,"z":19.83873558044433,"y":1088.791748046875},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":-3164.238525390625,"z":20.89350891113281,"y":1082.6671142578126},"sprite":110,"label":"Ammunation","scale":0.5,"enable":true,"color":76}', '[{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"WEAPON_KNIFE","price":8000,"category":"weapons","image":"nui://ox_inventory/web/images/WEAPON_KNIFE.png","description":""}]', NULL, '[{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"},{"description":"Firearms, melee weapons, and ammunition","name":"Weapons","icon":"Fa6Gun","borderColor":"border-red-500/30","id":"weapons","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:26:33', '2025-11-28 23:03:15', 1, 0),
	(17, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Ammunation', 'store', '{"thickness":25,"points":[{"x":-1123.0579833984376,"z":19,"y":2697.464599609375},{"x":-1115.25830078125,"z":19,"y":2688.5048828125},{"x":-1109.08740234375,"z":19,"y":2694.026611328125},{"x":-1123.8387451171876,"z":19,"y":2710.800048828125}]}', '{"enable":true,"visibility":true,"distance":5,"model":"s_m_y_ammucity_01","coords":{"x":-1118.6810302734376,"w":230,"z":17.55413818359375,"y":2699.970458984375},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":-1113.0419921875,"z":18.65157127380371,"y":2690.702392578125},"sprite":110,"label":"Ammunation","scale":0.5,"enable":true,"color":76}', '[{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"WEAPON_KNIFE","price":8000,"category":"weapons","image":"nui://ox_inventory/web/images/WEAPON_KNIFE.png","description":""}]', NULL, '[{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"},{"description":"Firearms, melee weapons, and ammunition","name":"Weapons","icon":"Fa6Gun","borderColor":"border-red-500/30","id":"weapons","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:28:19', '2025-11-28 23:03:49', 1, 0),
	(18, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '24/7 Supermarket', 'store', '{"thickness":25,"points":[{"x":538.2492065429688,"z":42,"y":2672.052734375},{"x":539.338134765625,"z":42,"y":2664.33984375},{"x":542.2574462890625,"z":42,"y":2664.688720703125},{"x":544.075927734375,"z":42,"y":2656.06298828125},{"x":552.2081298828125,"z":42,"y":2657.045166015625},{"x":551.273193359375,"z":42,"y":2664.392333984375},{"x":561.3602905273438,"z":42,"y":2665.71875},{"x":560.18359375,"z":42,"y":2674.234619140625}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":549.1151733398438,"w":101,"z":41.15651321411133,"y":2670.88037109375},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":544.221435546875,"z":42.33672332763672,"y":2672.62548828125},"sprite":59,"label":"24/7 Supermarket","scale":0.5,"enable":true,"color":2}', '[{"stock":100,"name":"bread","price":200,"category":"food","image":"nui://ox_inventory/web/images/bread.png","description":""},{"stock":10,"name":"radio","price":1000,"category":"electronics","image":"nui://ox_inventory/web/images/radio.png","description":""},{"stock":-1,"name":"phone","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/phone.png","description":""},{"stock":50,"name":"WEAPON_PETROLCAN","price":300,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":""},{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"burger","price":400,"category":"food","image":"nui://ox_inventory/web/images/burger.png","description":""},{"stock":50,"name":"coca","price":300,"category":"food","image":"nui://ox_inventory/web/images/coca.png","description":""},{"stock":50,"name":"ice_tea","price":300,"category":"food","image":"nui://ox_inventory/web/images/ice_tea.png","description":""},{"stock":10,"name":"powerbank","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/powerbank.png","description":""}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:32:11', '2025-11-28 22:56:36', 1, 0),
	(19, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Robs Liquor', 'store', '{"thickness":25,"points":[{"x":1158.37548828125,"z":38,"y":2703.009765625},{"x":1158.382568359375,"z":38,"y":2721.75244140625},{"x":1170.50244140625,"z":38,"y":2721.453369140625},{"x":1170.2156982421876,"z":38,"y":2702.95263671875}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":1165.1143798828126,"w":187,"z":37.15768814086914,"y":2710.842041015625},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":1166.28759765625,"z":38.4437026977539,"y":2703.777587890625},"sprite":59,"label":"Robs Liquor","scale":0.5,"enable":true,"color":2}', '[{"stock":98,"name":"bread","image":"nui://ox_inventory/web/images/bread.png","category":"food","description":"","label":"Bread","price":200},{"stock":10,"name":"radio","image":"nui://ox_inventory/web/images/radio.png","category":"electronics","description":"","label":"Radio","price":1000},{"stock":-1,"name":"phone","image":"nui://ox_inventory/web/images/phone.png","category":"electronics","description":"","label":"Classic Phone","price":500},{"stock":50,"name":"WEAPON_PETROLCAN","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","category":"misc","description":"","label":"Jerry Can","price":300},{"stock":10,"name":"WEAPON_FLASHLIGHT","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","category":"misc","description":"","label":"Flashlight","price":500},{"stock":47,"name":"burger","image":"nui://ox_inventory/web/images/burger.png","category":"food","description":"","label":"Burger","price":400},{"stock":50,"name":"coca","image":"nui://ox_inventory/web/images/coca.png","category":"food","description":"","label":"Coca","price":300},{"stock":47,"name":"ice_tea","image":"nui://ox_inventory/web/images/ice_tea.png","category":"food","description":"","label":"Ice Tea","price":300},{"stock":9,"name":"powerbank","image":"nui://ox_inventory/web/images/powerbank.png","category":"electronics","description":"","label":"Power Bank","price":500}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"coords":{"x":1167.7041015625,"z":38.51602554321289,"y":2713.169677734375},"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":true,"maxTotalStock":-1,"items":["water","bread","black_phone","green_phone","phone","white_phone","red_phone","yellow_phone","radio"]},"resellPercentage":70}', NULL, '2025-10-22 03:34:05', '2025-12-02 21:24:08', 1, 400),
	(20, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '24/7 Supermarket', 'store', '{"thickness":25,"points":[{"x":1960.087890625,"z":32,"y":3737.537841796875},{"x":1970.35888671875,"z":32,"y":3743.47314453125},{"x":1966.44287109375,"z":32,"y":3750.23193359375},{"x":1963.8160400390626,"z":32,"y":3748.748046875},{"x":1958.8623046875,"z":32,"y":3756.033935546875},{"x":1951.5745849609376,"z":32,"y":3751.956298828125}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":1959.81884765625,"w":295,"z":31.34376144409179,"y":3740.5341796875},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":1965.0732421875,"z":32.98657608032226,"y":3740.6865234375},"sprite":59,"label":"24/7 Supermarket","scale":0.5,"enable":true,"color":2}', '[{"image":"nui://ox_inventory/web/images/bread.png","description":"","category":"food","name":"bread","price":200,"stock":100,"label":"Bread"},{"image":"nui://ox_inventory/web/images/radio.png","description":"","category":"electronics","name":"radio","price":1000,"stock":10,"label":"Radio"},{"image":"nui://ox_inventory/web/images/phone.png","description":"","category":"electronics","name":"phone","price":500,"stock":-1,"label":"Classic Phone"},{"image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":"","category":"misc","name":"WEAPON_PETROLCAN","price":300,"stock":50,"label":"Jerry Can"},{"image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":"","category":"misc","name":"WEAPON_FLASHLIGHT","price":500,"stock":10,"label":"Flashlight"},{"image":"nui://ox_inventory/web/images/burger.png","description":"","category":"food","name":"burger","price":400,"stock":50,"label":"Burger"},{"image":"nui://ox_inventory/web/images/coca.png","description":"","category":"food","name":"coca","price":300,"stock":49,"label":"Coca"},{"image":"nui://ox_inventory/web/images/ice_tea.png","description":"","category":"food","name":"ice_tea","price":300,"stock":50,"label":"Ice Tea"},{"image":"nui://ox_inventory/web/images/powerbank.png","description":"","category":"electronics","name":"powerbank","price":500,"stock":10,"label":"Power Bank"}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:35:03', '2025-12-02 18:35:49', 1, 0),
	(21, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'LTD Gasoline', 'store', '{"thickness":25,"points":[{"x":1693.7535400390626,"z":42,"y":4921.92333984375},{"x":1700.79345703125,"z":42,"y":4916.9130859375},{"x":1701.8280029296876,"z":42,"y":4918.17529296875},{"x":1707.536376953125,"z":42,"y":4914.52294921875},{"x":1717.558837890625,"z":42,"y":4928.416015625},{"x":1704.931884765625,"z":42,"y":4937.98828125}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":1697.943359375,"w":329,"z":41.06365585327148,"y":4922.9150390625},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":1698.609375,"z":42.65327072143555,"y":4928.8017578125},"sprite":59,"label":"LTD Gasoline","scale":0.5,"enable":true,"color":2}', '[{"stock":100,"name":"bread","price":200,"category":"food","image":"nui://ox_inventory/web/images/bread.png","description":""},{"stock":10,"name":"radio","price":1000,"category":"electronics","image":"nui://ox_inventory/web/images/radio.png","description":""},{"stock":-1,"name":"phone","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/phone.png","description":""},{"stock":50,"name":"WEAPON_PETROLCAN","price":300,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":""},{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"burger","price":400,"category":"food","image":"nui://ox_inventory/web/images/burger.png","description":""},{"stock":50,"name":"coca","price":300,"category":"food","image":"nui://ox_inventory/web/images/coca.png","description":""},{"stock":50,"name":"ice_tea","price":300,"category":"food","image":"nui://ox_inventory/web/images/ice_tea.png","description":""},{"stock":10,"name":"powerbank","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/powerbank.png","description":""}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:36:15', '2025-11-28 23:07:32', 1, 0),
	(22, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Ammunation', 'store', '{"thickness":25,"points":[{"x":-328.7646179199219,"z":31,"y":6072.435546875},{"x":-347.98388671875,"z":31,"y":6091.60302734375},{"x":-339.5866394042969,"z":31,"y":6099.91259765625},{"x":-320.4949340820313,"z":31,"y":6080.91796875}]}', '{"enable":true,"visibility":true,"distance":5,"model":"s_m_y_ammucity_01","coords":{"x":-331.3025817871094,"w":232,"z":30.45477485656738,"y":6085.2685546875},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":-325.2401428222656,"z":31.67239379882812,"y":6076.07177734375},"sprite":110,"label":"Ammunation","scale":0.5,"enable":true,"color":76}', '[{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"WEAPON_KNIFE","price":8000,"category":"weapons","image":"nui://ox_inventory/web/images/WEAPON_KNIFE.png","description":""}]', NULL, '[{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"},{"description":"Firearms, melee weapons, and ammunition","name":"Weapons","icon":"Fa6Gun","borderColor":"border-red-500/30","id":"weapons","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:37:29', '2025-11-28 23:02:25', 1, 0),
	(23, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'LTD Gasoline', 'store', '{"thickness":25,"points":[{"x":-1828.5712890625,"z":138,"y":782.2057495117188},{"x":-1816.66796875,"z":138,"y":793.3243408203125},{"x":-1826.0836181640626,"z":138,"y":803.6114501953125},{"x":-1838.0828857421876,"z":138,"y":792.591064453125}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":-1820.0667724609376,"w":138,"z":137.08958435058598,"y":794.0386352539063},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":-1822.39208984375,"z":138.31956481933598,"y":788.2682495117188},"sprite":59,"label":"LTD Gasoline","scale":0.5,"enable":true,"color":2}', '[{"stock":100,"name":"bread","price":200,"category":"food","image":"nui://ox_inventory/web/images/bread.png","description":""},{"stock":10,"name":"radio","price":1000,"category":"electronics","image":"nui://ox_inventory/web/images/radio.png","description":""},{"stock":-1,"name":"phone","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/phone.png","description":""},{"stock":50,"name":"WEAPON_PETROLCAN","price":300,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":""},{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"burger","price":400,"category":"food","image":"nui://ox_inventory/web/images/burger.png","description":""},{"stock":50,"name":"coca","price":300,"category":"food","image":"nui://ox_inventory/web/images/coca.png","description":""},{"stock":50,"name":"ice_tea","price":300,"category":"food","image":"nui://ox_inventory/web/images/ice_tea.png","description":""},{"stock":10,"name":"powerbank","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/powerbank.png","description":""}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:38:39', '2025-11-28 23:10:14', 1, 0),
	(24, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Ammunation', 'store', '{"thickness":25,"points":[{"x":1702.698486328125,"z":34,"y":3756.341064453125},{"x":1695.746826171875,"z":34,"y":3748.80322265625},{"x":1681.831787109375,"z":34,"y":3761.620849609375},{"x":1688.862548828125,"z":34,"y":3769.21826171875}]}', '{"enable":true,"visibility":true,"distance":5,"model":"s_m_y_ammucity_01","coords":{"x":1692.6180419921876,"w":244,"z":33.70533752441406,"y":3761.31494140625},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":1699.17431640625,"z":35.07268905639648,"y":3752.5732421875},"sprite":110,"label":"Ammunation","scale":0.5,"enable":true,"color":76}', '[{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"WEAPON_KNIFE","price":8000,"category":"weapons","image":"nui://ox_inventory/web/images/WEAPON_KNIFE.png","description":""}]', NULL, '[{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"},{"description":"Firearms, melee weapons, and ammunition","name":"Weapons","icon":"Fa6Gun","borderColor":"border-red-500/30","id":"weapons","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:41:24', '2025-11-28 23:02:46', 1, 0),
	(25, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Ammunation', 'store', '{"thickness":25,"points":[{"x":2578.46826171875,"z":108,"y":303.9583740234375},{"x":2578.478271484375,"z":108,"y":279.6412658691406},{"x":2559.061279296875,"z":108,"y":279.6412658691406},{"x":2559.088623046875,"z":108,"y":303.9190979003906}]}', '{"enable":true,"visibility":true,"distance":5,"model":"s_m_y_ammucity_01","coords":{"x":2567.62646484375,"w":0,"z":107.73489379882813,"y":292.58544921875},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":2569.4658203125,"z":108.7861328125,"y":303.3674011230469},"sprite":110,"label":"Ammunation","scale":0.5,"enable":true,"color":76}', '[{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"WEAPON_KNIFE","price":8000,"category":"weapons","image":"nui://ox_inventory/web/images/WEAPON_KNIFE.png","description":""}]', NULL, '[{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"},{"description":"Firearms, melee weapons, and ammunition","name":"Weapons","icon":"Fa6Gun","borderColor":"border-red-500/30","id":"weapons","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:42:27', '2025-11-28 23:11:07', 1, 0),
	(26, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '24/7 Supermarket', 'store', '{"thickness":25,"points":[{"x":2546.6044921875,"z":108,"y":379.8032531738281},{"x":2547.18310546875,"z":108,"y":391.9217224121094},{"x":2559.61572265625,"z":108,"y":392.3309020996094},{"x":2559.05810546875,"z":108,"y":379.3831176757813}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":2556.690185546875,"w":0,"z":107.62298583984377,"y":380.8782958984375},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":2559.2998046875,"z":108.95225524902344,"y":385.3462219238281},"sprite":59,"label":"24/7 Supermarket","scale":0.5,"enable":true,"color":2}', '[{"stock":100,"name":"bread","price":200,"category":"food","image":"nui://ox_inventory/web/images/bread.png","description":""},{"stock":10,"name":"radio","price":1000,"category":"electronics","image":"nui://ox_inventory/web/images/radio.png","description":""},{"stock":-1,"name":"phone","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/phone.png","description":""},{"stock":50,"name":"WEAPON_PETROLCAN","price":300,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":""},{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"burger","price":400,"category":"food","image":"nui://ox_inventory/web/images/burger.png","description":""},{"stock":50,"name":"coca","price":300,"category":"food","image":"nui://ox_inventory/web/images/coca.png","description":""},{"stock":50,"name":"ice_tea","price":300,"category":"food","image":"nui://ox_inventory/web/images/ice_tea.png","description":""},{"stock":10,"name":"powerbank","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/powerbank.png","description":""}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:43:54', '2025-11-28 22:58:35', 1, 0),
	(27, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'Ammunation', 'store', '{"thickness":25,"points":[{"x":53.48984909057617,"z":28,"y":-1052.02880859375},{"x":13.99532794952392,"z":28,"y":-1038.13427734375},{"x":-10.05049800872802,"z":28,"y":-1105.7127685546876},{"x":20.66303443908691,"z":28,"y":-1116.8336181640626}]}', '{"enable":true,"visibility":true,"distance":5,"model":"s_m_y_ammucity_01","coords":{"x":22.90396881103515,"w":173,"z":28.79701805114746,"y":-1105.6142578125},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":17.23102569580078,"z":30.13149261474609,"y":-1115.060302734375},"sprite":110,"label":"Ammunation","scale":0.5,"enable":true,"color":76}', '[{"label":"Flashlight","description":"","price":500,"category":"misc","stock":10,"image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","name":"WEAPON_FLASHLIGHT"},{"label":"Knife","description":"","price":8000,"category":"weapons","stock":49,"image":"nui://ox_inventory/web/images/WEAPON_KNIFE.png","name":"WEAPON_KNIFE"}]', NULL, '[{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"},{"description":"Firearms, melee weapons, and ammunition","name":"Weapons","icon":"Fa6Gun","borderColor":"border-red-500/30","id":"weapons","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:45:38', '2025-12-01 12:46:52', 1, 0),
	(28, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'Ammunation', 'store', '{"points":[{"x":-1310.6717529296876,"y":-377.7986755371094,"z":37},{"x":-1315.6905517578126,"y":-395.5791931152344,"z":37},{"x":-1307.1973876953126,"y":-402.09869384765627,"z":37},{"x":-1296.8765869140626,"y":-395.8184814453125,"z":37}],"thickness":25}', '{"model":"s_m_y_ammucity_01","visibility":true,"animationName":"base","enable":true,"distance":5,"coords":{"w":85,"x":-1304.1673583984376,"y":-394.9655456542969,"z":35.69578552246094},"animationDict":"mini@strip_club@idles@bouncer@base"}', '{"enable":true,"label":"Ammunation","scale":0.5,"color":76,"coords":{"x":-1314.23193359375,"y":-390.6793823242187,"z":37.09268569946289},"sprite":110}', '[{"description":"","name":"WEAPON_FLASHLIGHT","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","category":"misc","stock":10,"price":500},{"description":"","name":"WEAPON_KNIFE","image":"nui://ox_inventory/web/images/WEAPON_KNIFE.png","category":"weapons","stock":50,"price":8000}]', NULL, '[{"description":" ","borderColor":"border-red-500/30","icon":"FaStore","name":"Divers","id":"misc","color":"from-red-500/20 to-orange-500/20"},{"description":"Firearms, melee weapons, and ammunition","borderColor":"border-red-500/30","icon":"Fa6Gun","name":"Weapons","id":"weapons","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"resellPercentage":70,"restrictions":{"type":"whitelist","maxTotalStock":-1,"enabled":false,"items":[],"maxStockPerItem":-1},"price":100000}', NULL, '2025-10-22 03:48:13', '2025-11-30 14:14:33', 1, 0),
	(29, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '24/7 Supermarket', 'store', '{"thickness":25,"points":[{"x":1726.0242919921876,"z":34,"y":6413.70849609375},{"x":1739.36767578125,"z":34,"y":6407.09326171875},{"x":1744.7392578125,"z":34,"y":6417.56591796875},{"x":1727.742431640625,"z":34,"y":6425.95361328125}]}', '{"enable":true,"visibility":true,"distance":5,"model":"mp_m_shopkeep_01","coords":{"x":1728.043212890625,"w":237,"z":34.0372428894043,"y":6415.6103515625},"animationDict":"mini@strip_club@idles@bouncer@base","animationName":"base"}', '{"coords":{"x":1731.4857177734376,"z":35.58304595947265,"y":6411.33056640625},"sprite":59,"label":"24/7 Supermarket","scale":0.5,"enable":true,"color":2}', '[{"stock":100,"name":"bread","price":200,"category":"food","image":"nui://ox_inventory/web/images/bread.png","description":""},{"stock":10,"name":"radio","price":1000,"category":"electronics","image":"nui://ox_inventory/web/images/radio.png","description":""},{"stock":-1,"name":"phone","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/phone.png","description":""},{"stock":50,"name":"WEAPON_PETROLCAN","price":300,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":""},{"stock":10,"name":"WEAPON_FLASHLIGHT","price":500,"category":"misc","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":""},{"stock":50,"name":"burger","price":400,"category":"food","image":"nui://ox_inventory/web/images/burger.png","description":""},{"stock":50,"name":"coca","price":300,"category":"food","image":"nui://ox_inventory/web/images/coca.png","description":""},{"stock":50,"name":"ice_tea","price":300,"category":"food","image":"nui://ox_inventory/web/images/ice_tea.png","description":""},{"stock":10,"name":"powerbank","price":500,"category":"electronics","image":"nui://ox_inventory/web/images/powerbank.png","description":""}]', NULL, '[{"description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","borderColor":"border-red-500/30","id":"food","color":"from-red-500/20 to-orange-500/20"},{"description":"  ","name":"Informatique","icon":"FaStore","borderColor":"border-red-500/30","id":"electronics","color":"from-red-500/20 to-orange-500/20"},{"description":" ","name":"Divers","icon":"FaStore","borderColor":"border-red-500/30","id":"misc","color":"from-red-500/20 to-orange-500/20"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"distance":5,"price":100000,"restrictions":{"type":"whitelist","maxStockPerItem":-1,"enabled":false,"maxTotalStock":-1,"items":[]},"resellPercentage":70}', NULL, '2025-10-22 03:49:27', '2025-11-28 22:59:06', 1, 0),
	(30, 'char0:72e2349201e0683aa2540804c45f566df0755123', 'Matériel de chasse', 'store', '{"thickness":25,"points":[{"y":5420.9248046875,"x":-863.9213256835938,"z":35},{"y":5441.34326171875,"x":-891.9967651367188,"z":35},{"y":5360.7783203125,"x":-843.1720581054688,"z":35},{"y":5377.8876953125,"x":-762.0136108398438,"z":35},{"y":5508.87060546875,"x":-794.9512329101563,"z":35}]}', '{"enable":true,"distance":5,"animationName":"base","animationDict":"mini@strip_club@idles@bouncer@base","model":"s_m_y_ammucity_01","visibility":true,"coords":{"y":5404.05810546875,"x":-840.0736694335938,"w":0,"z":33.61519241333008}}', '{"color":3,"enable":true,"sprite":59,"scale":0.5,"label":"Magasin de chasse","coords":{"y":5404.06787109375,"x":-840.1866455078125,"z":33.61519241333008}}', '[]', NULL, '[{"color":"from-red-500/20 to-orange-500/20","description":"Firearms, melee weapons, and ammunition","icon":"Fa6Gun","name":"Weapons","borderColor":"border-red-500/30","id":"weapons"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"enable":false,"restrictions":{"maxTotalStock":-1,"items":[],"enabled":false,"maxStockPerItem":-1,"type":"whitelist"},"price":100000,"resellPercentage":70,"distance":5}', '[]', '2025-11-29 16:07:36', '2025-11-30 21:12:50', 1, 0),
	(31, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 'Documents', 'store', '{"thickness":25,"points":[{"x":-547.1474609375,"y":-185.77700805664066,"z":38},{"x":-545.1572875976563,"y":-200.21499633789066,"z":38},{"x":-553.5771484375,"y":-204.51744079589845,"z":38},{"x":-561.796875,"y":-187.40562438964845,"z":38}]}', '{"animationDict":"mini@strip_club@idles@bouncer@base","enable":true,"animationName":"base","visibility":true,"distance":5,"model":"s_f_y_airhostess_01","coords":{"w":0,"x":-551.5298461914063,"y":-202.8323516845703,"z":37.23928833007812}}', '{"enable":false,"scale":0.8,"sprite":59,"color":3,"label":""}', '[{"price":0,"description":"","stock":-1,"name":"identification","image":"nui://ox_inventory/web/images/card_id.png","category":"1764803341688","label":"Identification"}]', NULL, '[{"description":"Documents obligatoires en tant que citoyen.","id":"1764803341688","name":"Documents","borderColor":"border-yellow-500/30","color":"from-yellow-500/20 to-amber-500/20","icon":"FaBook"}]', '[]', NULL, NULL, NULL, NULL, NULL, '{"price":100000,"resellPercentage":70,"distance":5,"enable":false,"restrictions":{"enabled":false,"maxTotalStock":-1,"items":[],"type":"whitelist","maxStockPerItem":-1}}', '[]', '2025-12-03 23:10:41', '2025-12-03 23:14:49', 1, 0);

-- Listage de la structure de table zak. qs_shops_employees
CREATE TABLE IF NOT EXISTS `qs_shops_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `identifier` varchar(80) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `permissions` longtext NOT NULL DEFAULT '[]',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`),
  KEY `idx_shop_employees` (`shop_id`),
  KEY `idx_unique_employee` (`identifier`,`shop_id`),
  CONSTRAINT `shop_id` FOREIGN KEY (`shop_id`) REFERENCES `qs_shops` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.qs_shops_employees : ~0 rows (environ)

-- Listage de la structure de table zak. qs_shops_finance
CREATE TABLE IF NOT EXISTS `qs_shops_finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `total_balance` float NOT NULL DEFAULT 0,
  `available_balance` float NOT NULL DEFAULT 0,
  `daily_revenue` float NOT NULL DEFAULT 0,
  `weekly_revenue` float NOT NULL DEFAULT 0,
  `monthly_revenue` float NOT NULL DEFAULT 0,
  `net_profit` float NOT NULL DEFAULT 0,
  `profit_margin` float NOT NULL DEFAULT 0,
  `cash_flow` float NOT NULL DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_id` (`shop_id`),
  CONSTRAINT `qs_shops_finance_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `qs_shops` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.qs_shops_finance : ~0 rows (environ)

-- Listage de la structure de table zak. qs_shops_owners
CREATE TABLE IF NOT EXISTS `qs_shops_owners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `purchase_price` float NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_id` (`shop_id`),
  KEY `identifier` (`identifier`),
  CONSTRAINT `qs_shops_owners_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `qs_shops` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.qs_shops_owners : ~0 rows (environ)
INSERT INTO `qs_shops_owners` (`id`, `shop_id`, `identifier`, `name`, `purchase_price`, `created_at`, `updated_at`) VALUES
	(1, 19, 'fcb47b307801e586e8c95881bdfc98004f24d031', 'Zak Dev', 100000, '2025-11-27 23:10:24', '2025-11-27 23:10:24');

-- Listage de la structure de table zak. qs_shops_promotions
CREATE TABLE IF NOT EXISTS `qs_shops_promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('discount','fixed_amount') NOT NULL DEFAULT 'discount',
  `value` float NOT NULL DEFAULT 0,
  `target_type` enum('all_items','categories','specific_items') NOT NULL DEFAULT 'all_items',
  `target_data` longtext DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `min_purchase_amount` float NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `shop_id` (`shop_id`) USING BTREE,
  KEY `is_active` (`is_active`) USING BTREE,
  KEY `start_date` (`start_date`) USING BTREE,
  KEY `end_date` (`end_date`) USING BTREE,
  CONSTRAINT `qs_shops_promotions_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `qs_shops` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.qs_shops_promotions : ~0 rows (environ)

-- Listage de la structure de table zak. qs_shops_sell_history
CREATE TABLE IF NOT EXISTS `qs_shops_sell_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(80) NOT NULL DEFAULT '0',
  `item` varchar(50) NOT NULL DEFAULT '0',
  `category` varchar(50) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT 0,
  `item_price` int(11) NOT NULL DEFAULT 0,
  `total_price` int(11) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.qs_shops_sell_history : ~0 rows (environ)

-- Listage de la structure de table zak. qs_shops_store_history
CREATE TABLE IF NOT EXISTS `qs_shops_store_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(80) NOT NULL,
  `store` int(11) NOT NULL,
  `item` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `item_price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `society_revenue` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_identifier_store` (`identifier`,`store`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.qs_shops_store_history : ~23 rows (environ)
INSERT INTO `qs_shops_store_history` (`id`, `identifier`, `store`, `item`, `category`, `quantity`, `item_price`, `total_price`, `timestamp`, `society_revenue`) VALUES
	(1, 'fcb47b307801e586e8c95881bdfc98004f24d031', 19, 'water', 'food', 1, 200, 200, '2025-11-27 23:16:21', 0),
	(2, 'fcb47b307801e586e8c95881bdfc98004f24d031', 19, 'water', 'food', 1, 200, 200, '2025-11-27 23:16:26', 0),
	(3, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 30, 'ammo-musket', 'weapons', 3, 1000, 3000, '2025-11-29 16:08:26', 0),
	(4, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 30, 'WEAPON_MUSKET', 'weapons', 1, 150000, 150000, '2025-11-29 16:08:26', 0),
	(5, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 30, 'ammo-musket', 'weapons', 3, 1000, 3000, '2025-11-29 16:08:47', 0),
	(6, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 30, 'WEAPON_MUSKET', 'weapons', 1, 150000, 150000, '2025-11-29 16:08:47', 0),
	(7, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 30, 'WEAPON_MUSKET', 'weapons', 1, 150000, 150000, '2025-11-29 16:21:07', 0),
	(8, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 30, 'ammo-musket', 'weapons', 2, 1000, 2000, '2025-11-29 16:21:07', 0),
	(9, 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 30, 'WEAPON_MUSKET', 'weapons', 1, 150000, 150000, '2025-11-30 15:17:08', 0),
	(10, 'char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 30, 'ammo-musket', 'weapons', 100, 1, 100, '2025-11-30 15:17:08', 0),
	(11, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 30, 'ammo-musket', 'weapons', 5000, 1, 5000, '2025-11-30 18:33:13', 0),
	(12, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 30, 'WEAPON_MUSKET', 'weapons', 1, 150000, 150000, '2025-11-30 18:33:13', 0),
	(13, 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 30, 'ammo-musket', 'weapons', 500, 1, 500, '2025-11-30 18:34:00', 0),
	(14, 'char0:72e2349201e0683aa2540804c45f566df0755123', 30, 'WEAPON_MUSKET', 'weapons', 1, 150000, 150000, '2025-11-30 20:45:51', 0),
	(15, 'char0:72e2349201e0683aa2540804c45f566df0755123', 30, 'ammo-musket', 'weapons', 1000, 1, 1000, '2025-11-30 20:45:51', 0),
	(16, 'char0:72e2349201e0683aa2540804c45f566df0755123', 30, 'ammo-musket', 'weapons', 50, 1, 50, '2025-11-30 20:46:18', 0),
	(17, 'char0:28a24dc4b57feb9580c57626e3c03439a900f876', 27, 'WEAPON_KNIFE', 'weapons', 1, 8000, 8000, '2025-12-01 12:46:52', 0),
	(18, 'char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 15, 'burger', 'food', 5, 400, 2000, '2025-12-02 17:17:06', 0),
	(19, 'char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 15, 'coca', 'food', 6, 300, 1800, '2025-12-02 17:17:06', 0),
	(20, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 20, 'coca', 'food', 1, 300, 300, '2025-12-02 18:35:49', 0),
	(21, 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 19, 'powerbank', 'electronics', 1, 500, 500, '2025-12-02 21:24:08', 0),
	(22, 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 19, 'phone', 'electronics', 1, 500, 500, '2025-12-02 21:24:08', 0),
	(23, 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 19, 'ice_tea', 'food', 3, 300, 900, '2025-12-02 21:24:08', 0),
	(24, 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 19, 'burger', 'food', 3, 400, 1200, '2025-12-02 21:24:08', 0),
	(25, 'char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 19, 'bread', 'food', 2, 200, 400, '2025-12-02 21:24:08', 0),
	(26, 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', 31, 'identification', '1764803341688', 1, 0, 0, '2025-12-03 23:14:49', 0);

-- Listage de la structure de table zak. qs_shops_templates
CREATE TABLE IF NOT EXISTS `qs_shops_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `creator` varchar(255) NOT NULL,
  `shop_type` varchar(30) NOT NULL DEFAULT 'store',
  `items` longtext NOT NULL,
  `categories` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  `usage_count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `creator` (`creator`),
  KEY `shop_type` (`shop_type`),
  KEY `is_public` (`is_public`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.qs_shops_templates : ~3 rows (environ)
INSERT INTO `qs_shops_templates` (`id`, `name`, `description`, `creator`, `shop_type`, `items`, `categories`, `created_at`, `updated_at`, `is_public`, `usage_count`) VALUES
	(1, 'rpbs', '', 'fcb47b307801e586e8c95881bdfc98004f24d031', 'store', '[{"label":"Water","stock":100,"image":"nui://ox_inventory/web/images/water.png","price":200,"name":"water","category":"food","description":""},{"label":"Bread","stock":100,"image":"nui://ox_inventory/web/images/bread.png","price":200,"name":"bread","category":"food","description":""},{"label":"Radio","stock":10,"image":"nui://ox_inventory/web/images/radio.png","price":1000,"name":"radio","category":"electronics","description":""},{"label":"Classic Phone","stock":-1,"image":"nui://ox_inventory/web/images/phone.png","price":500,"name":"phone","category":"electronics","description":""}]', '[{"id":"food","borderColor":"border-red-500/30","description":"C\'est meilleur au restaurant !!!!!!","name":"Alimentaire","icon":"FaStore","color":"from-red-500/20 to-orange-500/20"},{"id":"electronics","borderColor":"border-red-500/30","description":"  ","name":"Informatique","icon":"FaStore","color":"from-red-500/20 to-orange-500/20"}]', '2025-11-27 23:07:21', '2025-11-27 23:07:21', 0, 0),
	(2, 'shop', '', 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'store', '[{"label":"Bread","image":"nui://ox_inventory/web/images/bread.png","description":"","price":200,"name":"bread","stock":100,"category":"food"},{"label":"Radio","image":"nui://ox_inventory/web/images/radio.png","description":"","price":1000,"name":"radio","stock":10,"category":"electronics"},{"label":"Classic Phone","image":"nui://ox_inventory/web/images/phone.png","description":"","price":500,"name":"phone","stock":-1,"category":"electronics"},{"label":"Jerry Can","image":"nui://ox_inventory/web/images/WEAPON_PETROLCAN.png","description":"","price":300,"name":"WEAPON_PETROLCAN","stock":50,"category":"misc"},{"label":"Flashlight","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":"","price":500,"name":"WEAPON_FLASHLIGHT","stock":10,"category":"misc"},{"label":"Burger","image":"nui://ox_inventory/web/images/burger.png","description":"","price":400,"name":"burger","stock":50,"category":"food"},{"label":"Coca","image":"nui://ox_inventory/web/images/coca.png","description":"","price":300,"name":"coca","stock":50,"category":"food"},{"label":"Ice Tea","image":"nui://ox_inventory/web/images/ice_tea.png","description":"","price":300,"name":"ice_tea","stock":50,"category":"food"},{"label":"Power Bank","image":"nui://ox_inventory/web/images/powerbank.png","description":"","price":500,"name":"powerbank","stock":10,"category":"electronics"}]', '[{"color":"from-red-500/20 to-orange-500/20","borderColor":"border-red-500/30","id":"food","name":"Alimentaire","icon":"FaStore","description":"C\'est meilleur au restaurant !!!!!!"},{"color":"from-red-500/20 to-orange-500/20","borderColor":"border-red-500/30","id":"electronics","name":"Informatique","icon":"FaStore","description":"  "},{"color":"from-red-500/20 to-orange-500/20","borderColor":"border-red-500/30","id":"misc","name":"Divers","icon":"FaStore","description":" "}]', '2025-11-28 17:28:31', '2025-11-28 17:28:31', 0, 0),
	(3, 'ammu', '', 'char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 'store', '[{"label":"Flashlight","image":"nui://ox_inventory/web/images/WEAPON_FLASHLIGHT.png","description":"","price":500,"name":"WEAPON_FLASHLIGHT","stock":10,"category":"misc"},{"label":"Knife","image":"nui://ox_inventory/web/images/WEAPON_KNIFE.png","buyOnAdd":false,"name":"WEAPON_KNIFE","category":"weapons","buyPrice":0,"description":"","stock":50,"price":8000}]', '[{"color":"from-red-500/20 to-orange-500/20","borderColor":"border-red-500/30","id":"food","name":"Alimentaire","icon":"FaStore","description":"C\'est meilleur au restaurant !!!!!!"},{"color":"from-red-500/20 to-orange-500/20","borderColor":"border-red-500/30","id":"electronics","name":"Informatique","icon":"FaStore","description":"  "},{"color":"from-red-500/20 to-orange-500/20","borderColor":"border-red-500/30","id":"misc","name":"Divers","icon":"FaStore","description":" "},{"color":"from-red-500/20 to-orange-500/20","borderColor":"border-red-500/30","id":"weapons","name":"Weapons","icon":"Fa6Gun","description":"Firearms, melee weapons, and ammunition"}]', '2025-11-28 17:43:19', '2025-11-28 17:43:19', 0, 0);

-- Listage de la structure de table zak. qs_shops_transactions
CREATE TABLE IF NOT EXISTS `qs_shops_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `type` enum('deposit','withdraw','sale','expense') NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `original_amount` float NOT NULL DEFAULT 0,
  `description` varchar(255) NOT NULL,
  `identifier` varchar(80) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `status` enum('completed','pending','failed','cancelled') NOT NULL DEFAULT 'pending',
  `metadata` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `shop_id` (`shop_id`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`),
  CONSTRAINT `qs_shops_transactions_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `qs_shops` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.qs_shops_transactions : ~2 rows (environ)
INSERT INTO `qs_shops_transactions` (`id`, `shop_id`, `transaction_id`, `type`, `amount`, `original_amount`, `description`, `identifier`, `name`, `reference`, `status`, `metadata`, `created_at`, `updated_at`) VALUES
	(1, 19, 'TXN-1764285381-2949', 'sale', 200, 200, 'Vente d\'article', 'fcb47b307801e586e8c95881bdfc98004f24d031', 'Zak Dev', NULL, 'completed', NULL, '2025-11-27 23:16:21', '2025-11-27 23:16:21'),
	(2, 19, 'TXN-1764285386-1383', 'sale', 200, 200, 'Vente d\'article', 'fcb47b307801e586e8c95881bdfc98004f24d031', 'Zak Dev', NULL, 'completed', NULL, '2025-11-27 23:16:26', '2025-11-27 23:16:26');

-- Listage de la structure de table zak. qs_taxijob
CREATE TABLE IF NOT EXISTS `qs_taxijob` (
  `identifier` varchar(46) NOT NULL,
  `level` int(10) unsigned NOT NULL DEFAULT 1,
  `experience` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.qs_taxijob : ~9 rows (environ)
INSERT INTO `qs_taxijob` (`identifier`, `level`, `experience`) VALUES
	('char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', 1, 0),
	('char0:28a24dc4b57feb9580c57626e3c03439a900f876', 1, 0),
	('char0:2c04a8506e426a0867af88aada9d2698cebb7d18', 1, 0),
	('char0:72e2349201e0683aa2540804c45f566df0755123', 2, 170),
	('char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', 1, 0),
	('char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', 1, 0),
	('char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', 20, 5726),
	('char0:fcb47b307801e586e8c95881bdfc98004f24d031', 1, 0),
	('fcb47b307801e586e8c95881bdfc98004f24d031', 1, 0);

-- Listage de la structure de table zak. qs_vehicleshop
CREATE TABLE IF NOT EXISTS `qs_vehicleshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT 'Vehicleshop',
  `description` varchar(255) DEFAULT 'Description',
  `poly` longtext DEFAULT NULL,
  `height` int(11) DEFAULT 25,
  `spawn_coords` varchar(255) DEFAULT NULL,
  `menu_coords` varchar(255) DEFAULT NULL,
  `show_vehicles` longtext DEFAULT NULL,
  `money` int(255) DEFAULT NULL,
  `shop_job` varchar(50) DEFAULT NULL,
  `boss_id` varchar(50) DEFAULT NULL,
  `up_price_percentage` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_job` (`shop_job`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.qs_vehicleshop : ~1 rows (environ)
INSERT INTO `qs_vehicleshop` (`id`, `name`, `description`, `poly`, `height`, `spawn_coords`, `menu_coords`, `show_vehicles`, `money`, `shop_job`, `boss_id`, `up_price_percentage`) VALUES
	(1, 'dzqdqz', 'dqzdqz', '[{"x":1906.572509765625,"y":3736.222412109375,"z":32.0},{"x":1894.8896484375,"y":3721.312255859375,"z":32.0},{"x":1884.2252197265626,"y":3738.629150390625,"z":32.0},{"x":1897.8778076171876,"y":3744.415283203125,"z":32.0}]', 25, '{"y":3737.50341796875,"x":1897.841552734375,"w":359.99468994140627,"z":31.2386302947998}', '{"x":1894.3138427734376,"y":3739.975830078125,"z":32.41061401367187}', NULL, NULL, 'concess', '2', NULL);

-- Listage de la structure de table zak. qs_vehicleshop_mission_data
CREATE TABLE IF NOT EXISTS `qs_vehicleshop_mission_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_model` varchar(255) DEFAULT NULL,
  `vehicle_coords` varchar(255) NOT NULL,
  `vehicle_health` int(11) NOT NULL,
  `fuel_level` float NOT NULL,
  `delivery_coords` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `assigned_job` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.qs_vehicleshop_mission_data : ~0 rows (environ)

-- Listage de la structure de table zak. qs_vehicleshop_showcase
CREATE TABLE IF NOT EXISTS `qs_vehicleshop_showcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL DEFAULT 0,
  `x` int(50) DEFAULT NULL,
  `y` int(50) DEFAULT NULL,
  `z` int(50) DEFAULT NULL,
  `h` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vehicle_id` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.qs_vehicleshop_showcase : ~0 rows (environ)

-- Listage de la structure de table zak. qs_vehicleshop_stock
CREATE TABLE IF NOT EXISTS `qs_vehicleshop_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleshop_id` int(11) NOT NULL,
  `vehicle_model` varchar(255) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `stock` int(11) unsigned zerofill DEFAULT 00000000000,
  `unlimited_stock` int(11) DEFAULT 0,
  `discount` int(11) DEFAULT 0,
  `hidden` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.qs_vehicleshop_stock : ~0 rows (environ)
INSERT INTO `qs_vehicleshop_stock` (`id`, `vehicleshop_id`, `vehicle_model`, `price`, `stock`, `unlimited_stock`, `discount`, `hidden`) VALUES
	(1, 1, 'adder', 500, 00000000000, 0, 0, 0);

-- Listage de la structure de table zak. qs_vehicleshop_transactions
CREATE TABLE IF NOT EXISTS `qs_vehicleshop_transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `vehicle_model` varchar(100) DEFAULT NULL,
  `buyer_id` varchar(255) DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `purchase_date` datetime DEFAULT current_timestamp(),
  `payment_method` varchar(50) DEFAULT NULL,
  `vehicle_props` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.qs_vehicleshop_transactions : ~0 rows (environ)

-- Listage de la structure de table zak. qs_vehicleshop_vehicles
CREATE TABLE IF NOT EXISTS `qs_vehicleshop_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_model` varchar(255) DEFAULT 'zentorno',
  `default_description` text DEFAULT 'This vehicle combines modern design with exceptional performance. With an efficient engine and smooth transmission, it offers a pleasant and agile driving experience. Its interior is spacious and comfortable, ideal for long trips or daily commutes. Equipped with advanced technology and safety features, it guarantees peace of mind on every journey. Perfect for those looking for versatility and style in one package.',
  `min_price` int(255) DEFAULT 1000000,
  `max_price` int(255) DEFAULT 3000000,
  `buy_price` int(255) DEFAULT 1000000,
  `hidden` int(11) DEFAULT 0,
  `is_crypto` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vehicle_model` (`vehicle_model`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.qs_vehicleshop_vehicles : ~0 rows (environ)
INSERT INTO `qs_vehicleshop_vehicles` (`id`, `vehicle_model`, `default_description`, `min_price`, `max_price`, `buy_price`, `hidden`, `is_crypto`) VALUES
	(1, 'adder', 'hfthft', 500, 1000, 500, 0, 0);

-- Listage de la structure de table zak. rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.rented_vehicles : ~0 rows (environ)

-- Listage de la structure de table zak. report_messages
CREATE TABLE IF NOT EXISTS `report_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `sender_id` varchar(50) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `messages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`messages`)),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`),
  CONSTRAINT `1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.report_messages : ~0 rows (environ)

-- Listage de la structure de table zak. report_user_preferences
CREATE TABLE IF NOT EXISTS `report_user_preferences` (
  `player_id` varchar(255) NOT NULL,
  `theme` enum('light','dark') DEFAULT 'light',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.report_user_preferences : ~0 rows (environ)

-- Listage de la structure de table zak. reports
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` varchar(50) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `reported_id` varchar(50) DEFAULT NULL,
  `reported_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('open','in_progress','closed') DEFAULT 'open',
  `priority` enum('low','medium','high') DEFAULT 'medium',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Listage des données de la table zak.reports : ~0 rows (environ)

-- Listage de la structure de table zak. restaurants_menus
CREATE TABLE IF NOT EXISTS `restaurants_menus` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(100) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.restaurants_menus : ~0 rows (environ)

-- Listage de la structure de table zak. restaurants_recipes
CREATE TABLE IF NOT EXISTS `restaurants_recipes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `ingredients` longtext DEFAULT NULL,
  `animation` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `stations` longtext DEFAULT NULL,
  `active` int(10) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.restaurants_recipes : ~0 rows (environ)

-- Listage de la structure de table zak. society
CREATE TABLE IF NOT EXISTS `society` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `money` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.society : ~0 rows (environ)

-- Listage de la structure de table zak. society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.society_moneywash : ~0 rows (environ)

-- Listage de la structure de table zak. society_transactions
CREATE TABLE IF NOT EXISTS `society_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `society` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `employee` varchar(255) DEFAULT NULL,
  `executor` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `society_index` (`society`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.society_transactions : ~0 rows (environ)

-- Listage de la structure de table zak. tiktok_users
CREATE TABLE IF NOT EXISTS `tiktok_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `pp` text DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `bio` text NOT NULL DEFAULT '',
  `birthday` varchar(50) NOT NULL DEFAULT '0',
  `videos` text NOT NULL DEFAULT '{}',
  `followers` text NOT NULL,
  `following` text NOT NULL,
  `liked` text NOT NULL,
  `verified` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.tiktok_users : ~0 rows (environ)
INSERT INTO `tiktok_users` (`id`, `owner`, `username`, `password`, `phone`, `pp`, `name`, `bio`, `birthday`, `videos`, `followers`, `following`, `liked`, `verified`) VALUES
	(1, 'fcb47b307801e586e8c95881bdfc98004f24d031', 'ezezezez', 'azerty', '376424717', './img/default.png', 'zakzzeze', '', '2001-09-10', '[]', '[]', '[]', '[]', NULL);

-- Listage de la structure de table zak. tiktok_videos
CREATE TABLE IF NOT EXISTS `tiktok_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.tiktok_videos : ~0 rows (environ)

-- Listage de la structure de table zak. tinder_accounts
CREATE TABLE IF NOT EXISTS `tinder_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `owner` varchar(70) NOT NULL DEFAULT '0',
  `photos` text DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `interested` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.tinder_accounts : ~0 rows (environ)

-- Listage de la structure de table zak. tinder_messages
CREATE TABLE IF NOT EXISTS `tinder_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unread` int(11) NOT NULL DEFAULT 0,
  `sender` int(11) NOT NULL DEFAULT 0,
  `receiver` int(11) NOT NULL DEFAULT 0,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.tinder_messages : ~0 rows (environ)

-- Listage de la structure de table zak. tinder_swipers
CREATE TABLE IF NOT EXISTS `tinder_swipers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT 0,
  `targetId` int(11) NOT NULL DEFAULT 0,
  `liked` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.tinder_swipers : ~0 rows (environ)

-- Listage de la structure de table zak. twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(46) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `phone` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `verified` int(11) DEFAULT NULL,
  `background` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.twitter_accounts : ~0 rows (environ)

-- Listage de la structure de table zak. twitter_follow
CREATE TABLE IF NOT EXISTS `twitter_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follower` int(11) DEFAULT NULL,
  `following` int(11) DEFAULT NULL,
  `updatedDate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.twitter_follow : ~0 rows (environ)

-- Listage de la structure de table zak. twitter_messages
CREATE TABLE IF NOT EXISTS `twitter_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `messages` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.twitter_messages : ~0 rows (environ)

-- Listage de la structure de table zak. twitter_notifications
CREATE TABLE IF NOT EXISTS `twitter_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT 0,
  `targetUserId` int(11) NOT NULL DEFAULT 0,
  `type` varchar(50) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.twitter_notifications : ~0 rows (environ)

-- Listage de la structure de table zak. twitter_retweets
CREATE TABLE IF NOT EXISTS `twitter_retweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT 0,
  `tweetId` int(11) NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.twitter_retweets : ~0 rows (environ)

-- Listage de la structure de table zak. twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `text` text DEFAULT NULL,
  `media` text DEFAULT NULL,
  `likes` text DEFAULT '[]',
  `mentions` text DEFAULT '[]',
  `comments` text DEFAULT '[]',
  `retweets` text DEFAULT '[]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.twitter_tweets : ~0 rows (environ)

-- Listage de la structure de table zak. uber_rider_last_transactions
CREATE TABLE IF NOT EXISTS `uber_rider_last_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `target` varchar(80) DEFAULT NULL,
  `targetName` varchar(50) DEFAULT NULL,
  `plate` varchar(80) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.uber_rider_last_transactions : ~0 rows (environ)

-- Listage de la structure de table zak. user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.user_licenses : ~0 rows (environ)
INSERT INTO `user_licenses` (`id`, `type`, `owner`, `name`) VALUES
	(3, 'real_estate', 'char0:fcb47b307801e586e8c95881bdfc98004f24d031', NULL);

-- Listage de la structure de table zak. users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(60) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `position` longtext DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `phone_number` varchar(20) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `badge` int(11) DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT 0,
  `dutyTime` int(11) NOT NULL DEFAULT 0,
  `gmtPhoto` longtext DEFAULT NULL,
  `gmtWorkerPhoto` longtext DEFAULT NULL,
  `jobJoined` varchar(40) DEFAULT NULL,
  `lastActive` varchar(46) DEFAULT NULL,
  `ambulanceData` longtext NOT NULL DEFAULT '{"health": 200, "armor": 0, "type": "none", "damages": "{}"}',
  `blood` varchar(20) DEFAULT NULL,
  `blood_type` varchar(20) DEFAULT NULL,
  `finger` varchar(20) DEFAULT NULL,
  `gptPhoto` longtext DEFAULT NULL,
  `gptOfficerPhoto` longtext DEFAULT NULL,
  `lstEmployeePhoto` longtext DEFAULT NULL,
  `shell_garage` text DEFAULT '',
  `cryptocurrency` longtext NOT NULL DEFAULT '',
  `crypto_wallet` int(11) DEFAULT 0,
  `inside` varchar(50) DEFAULT '',
  `inside_lab` varchar(50) DEFAULT NULL,
  `cd_identity` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{"placeofbirth":"Los Santos","dateofissue":"01/01/2021","dateofexpiry":"01/01/2031","nationality":"USA"}',
  `crafting_skill` longtext DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.users : ~8 rows (environ)
INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `metadata`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `is_dead`, `id`, `disabled`, `last_property`, `created_at`, `last_seen`, `phone_number`, `pincode`, `badge`, `jail`, `dutyTime`, `gmtPhoto`, `gmtWorkerPhoto`, `jobJoined`, `lastActive`, `ambulanceData`, `blood`, `blood_type`, `finger`, `gptPhoto`, `gptOfficerPhoto`, `lstEmployeePhoto`, `shell_garage`, `cryptocurrency`, `crypto_wallet`, `inside`, `inside_lab`, `cd_identity`, `crafting_skill`, `last_updated`) VALUES
	('char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6', '{"bank":24000,"money":867179,"black_money":0}', 'admin', '[{"metadata":{"components":[],"ammo":0,"durability":100,"registered":"Luca Papapaqpa","serial":"840227WVU153508"},"name":"WEAPON_PUMPSHOTGUN","count":1,"slot":1},{"metadata":{"description":"TORNADO B1MQ2DG2","model":"TORNADO","plate":"B1MQ2DG2"},"name":"vehiclekeys","count":1,"slot":2},{"name":"radio","count":1,"slot":3},{"metadata":{"components":[],"ammo":1,"durability":88.5,"registered":"Luca Papapaqpa","serial":"603103ELS726968"},"name":"WEAPON_MUSKET","count":1,"slot":4},{"name":"ammo-musket","count":76,"slot":5},{"name":"money","count":867179,"slot":6},{"metadata":{"durability":94.20000000000025,"components":[]},"name":"WEAPON_KNIFE","count":1,"slot":7},{"name":"ufe_telerod_370","count":1,"slot":8},{"name":"ufe_canta_1000","count":1,"slot":9},{"name":"ufa_bait_hook","count":1,"slot":10},{"name":"bread","count":98,"slot":11},{"name":"express_fishing_super_line","count":1,"slot":12},{"metadata":{"charinfo":{"lastname":"Papapaqpa","firstname":"Luca","phone":"5897"},"phoneNumber":"5897","owneridentifier":"char0:09e089f17095e762c4d5fa0c760cb95ff555a4e6","uniqueId":402852510,"metadata":{"battery":99.996,"steps":224,"first_screen_showed":true,"apps":[{"app":"phone","label":"Phone","job":false,"blockedJobs":[],"hideInSettingsNotifications":true,"notificationSound":"","category":"Social","image":"img/apps/phone.png","slot":"0:0"},{"job":false,"blockedJobs":[],"label":"Messages","category":"Social","app":"messages","image":"img/apps/messages.png","slot":"0:1"},{"job":false,"blockedJobs":[],"blockBadge":true,"label":"Settings","category":"Utilities","app":"settings","image":"img/apps/settings.png","slot":"0:2"},{"job":false,"blockedJobs":[],"label":"Camera","category":"Creativity","app":"camera","image":"img/apps/camera.png","slot":"0:3"},{"job":false,"blockedJobs":[],"label":"Contacts","category":"Social","app":"contacts","image":"img/apps/contacts.png","slot":"1:0"},{"job":false,"blockedJobs":[],"label":"Mail","category":"Productivity & Finance","app":"mail","image":"img/apps/mail.png","slot":"1:1"},{"job":false,"blockedJobs":[],"label":"Weather","category":"Information & Reading","app":"weather","image":"img/apps/weather.png","slot":"1:2"},{"job":false,"blockedJobs":[],"label":"Calendar","category":"Productivity & Finance","app":"calendar","image":"img/apps/calendar.png","slot":"1:3"},{"job":false,"blockedJobs":[],"label":"Reminders","category":"Productivity & Finance","app":"reminder","image":"img/apps/reminders.png","slot":"1:4"},{"job":false,"blockedJobs":[],"label":"Gallery","category":"Creativity","app":"gallery","image":"img/apps/gallery.png","slot":"1:5"},{"job":false,"blockedJobs":[],"label":"Health","category":"Creativity","app":"health","image":"img/apps/health.png","slot":"1:6"},{"job":false,"blockedJobs":[],"hideInSettingsNotifications":true,"label":"Notes","category":"Productivity & Finance","app":"notes","image":"img/apps/notes.png","slot":"1:7"},{"job":false,"blockedJobs":[],"hideInSettingsNotifications":true,"label":"Calculator","category":"Utilities","app":"calculator","image":"img/apps/calculator.png","slot":"1:8"},{"job":false,"blockedJobs":[],"label":"App Store","category":"Utilities","app":"store","image":"img/apps/store.png","slot":"1:9"},{"job":false,"blockedJobs":[],"label":"Stock","category":"Productivity & Finance","app":"crypto","image":"img/apps/stock.png","slot":"1:10"},{"job":false,"blockedJobs":[],"label":"Clock","category":"Utilities","app":"clock","image":"img/apps/clock.png","slot":"1:11"},{"job":false,"blockedJobs":[],"label":"Home","category":"Utilities","app":"houses","image":"img/apps/houses.png","slot":"1:12"},{"job":false,"blockedJobs":[],"label":"News","category":"Other","app":"weazel","image":"img/apps/news.png","slot":"1:13"},{"blockedJobs":[],"label":"Maps","category":"Utilities","app":"map","image":"img/apps/maps.png","slot":"1:14"},{"blockedJobs":[],"game":{"iframe":"https://yep.com","name":"safari","rotate":false,"css":{"border":"none","position":"absolute","width":"100%","height":"100%","top":"0"}},"label":"Safari","category":"Utilities","app":"safari","image":"img/apps/safari.png","slot":"1:15"},{"job":false,"blockedJobs":[],"label":"FaceTime","category":"Social","app":"facetime","image":"img/apps/facetime.png","slot":"1:16"}],"faceid":false,"darkMode":true,"lockscreen":true,"blur_disabled":true},"description":"Numéro de téléphone : 5897"},"name":"phone","count":1,"slot":13},{"metadata":{"description":"MANANA KDGFB6IJ","model":"MANANA","plate":"KDGFB6IJ"},"name":"vehiclekeys","count":1,"slot":14},{"metadata":{"description":"BIFF C838T1F5","model":"BIFF","plate":"C838T1F5"},"name":"vehiclekeys","count":1,"slot":15},{"name":"water","count":10,"slot":16},{"name":"mechanic_tablet","count":1,"slot":17},{"metadata":{"pants_2":0,"pants_1":3},"name":"clothes_pants","count":1,"slot":56},{"metadata":{"shoes_1":4,"shoes_2":0},"name":"clothes_shoes","count":1,"slot":57},{"metadata":{"tshirt_2":0,"tshirt_1":28},"name":"clothes_tshirt","count":1,"slot":53},{"metadata":{"bags_1":45,"bags_2":0},"name":"clothes_bag","count":1,"slot":61},{"metadata":{"arms_2":0,"arms":"112_0"},"name":"clothes_arms","count":1,"slot":55},{"metadata":{"torso_1":102,"torso_2":0},"name":"clothes_torso","count":1,"slot":54}]', 'mechanic', 4, '[]', '{"lastPlaytime":16266,"armor":0,"jobDuty":true,"health":115}', '{"x":94.4967041015625,"heading":269.2913513183594,"z":55.009521484375,"y":-154.8131866455078}', 'Luca', 'Papapaqpa', '11/02/1997', 'm', 196, '{"model":"mp_m_freemode_01","pedScale":1.0,"headOverlays":{"lipstick":{"secondColor":0,"style":0,"opacity":0,"color":0},"moleAndFreckles":{"secondColor":0,"style":0,"opacity":0,"color":0},"beard":{"secondColor":0,"style":9,"opacity":1.0,"color":29},"blemishes":{"secondColor":0,"style":16,"opacity":1.0,"color":0},"ageing":{"secondColor":0,"style":12,"opacity":1.0,"color":0},"sunDamage":{"secondColor":0,"style":0,"opacity":0,"color":0},"complexion":{"secondColor":0,"style":0,"opacity":0,"color":0},"eyebrows":{"secondColor":0,"style":3,"opacity":1.0,"color":29},"chestHair":{"secondColor":0,"style":0,"opacity":0,"color":0},"blush":{"secondColor":0,"style":0,"opacity":0,"color":0},"bodyBlemishes":{"secondColor":0,"style":0,"opacity":0,"color":0},"makeUp":{"secondColor":0,"style":17,"opacity":1.0,"color":1}},"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":0,"drawable":0,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"tattoos":[],"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":79},{"texture":0,"component_id":3,"drawable":112},{"texture":0,"component_id":4,"drawable":3},{"texture":0,"component_id":5,"drawable":45},{"texture":0,"component_id":6,"drawable":4},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":28},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":5},{"texture":0,"component_id":11,"drawable":102},{"texture":0,"component_id":99,"drawable":"112_0"}],"hair":{"style":79,"texture":0,"highlight":29,"color":29},"headBlend":{"skinMix":0.4,"shapeSecond":14,"shapeMix":0.4,"skin":"4_8","shape":"19_14","skinSecond":8,"shapeThird":0,"skinThird":0,"shapeFirst":19,"skinFirst":4,"thirdMix":0.0},"eyeColor":-1,"faceFeatures":{"noseWidth":1.0,"neckThickness":1.0,"chinBoneSize":1.0,"cheeksBoneHigh":1.0,"cheeksWidth":1.0,"eyesOpening":1.0,"nosePeakSize":1.0,"eyeBrownForward":1.0,"nosePeakHigh":1.0,"jawBoneBackSize":1.0,"jawBoneWidth":1.0,"nosePeakLowering":1.0,"cheeksBoneWidth":1.0,"chinHole":1.0,"lipsThickness":1.0,"chinBoneLenght":1.0,"chinBoneLowering":1.0,"noseBoneHigh":1.0,"eyeBrownHigh":1.0,"noseBoneTwist":1.0}}', '[{"name":"hunger","val":756400,"percent":75.64},{"name":"thirst","val":817300,"percent":81.73}]', 0, 18, 0, NULL, '2025-11-30 12:02:07', '2025-12-08 19:15:29', '5161', NULL, NULL, 0, 0, NULL, NULL, NULL, '20:15 08/12/2025', '{"damages":{"rightLeg":{"bodyPart":"rightLeg","injuries":{"-1553120962":{"weapon":-1553120962,"data":{"items":{"blood_bag_500":1,"suture_kit":1,"morphine":2},"label":"Massive Trauma","color":"red.9"},"hits":11}}}},"bloodType":"A-","type":"none","health":115,"armour":0}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, '{"placeofbirth":"Los Santos","dateofissue":"01/01/2021","dateofexpiry":"01/01/2031","nationality":"USA"}', NULL, '2025-12-08 19:15:29'),
	('char0:28a24dc4b57feb9580c57626e3c03439a900f876', '{"money":65150,"bank":55300,"black_money":0}', 'admin', '[{"slot":1,"metadata":{"components":[],"serial":"237715ABX482418","registered":"Jessy Jhon","durability":96.10000000000004,"ammo":6},"count":1,"name":"WEAPON_PUMPSHOTGUN"},{"slot":2,"count":1,"name":"boar_meat"},{"slot":3,"metadata":{"components":[],"durability":90.40000000000008},"count":1,"name":"WEAPON_KNIFE"},{"slot":4,"metadata":{"components":[],"serial":"787175BPV548832","registered":"Y Dv","durability":40.00000000000011,"ammo":0},"count":1,"name":"WEAPON_PISTOL"},{"slot":5,"metadata":{"components":[],"serial":"146365EWN974092","registered":"Jessy Jhon","durability":100,"ammo":0},"count":1,"name":"WEAPON_ASSAULTRIFLE"},{"slot":6,"count":65150,"name":"money"},{"slot":7,"metadata":{"owneridentifier":"char0:28a24dc4b57feb9580c57626e3c03439a900f876","uniqueId":219169163,"charinfo":{"phone":"5923","firstname":"Jessy","lastname":"Jhon"},"phoneNumber":"5923","metadata":{"blur_disabled":true,"battery":99.86699999999976,"apps":[{"job":false,"slot":"0:0","hideInSettingsNotifications":true,"category":"Social","notificationSound":"","image":"img/apps/phone.png","blockedJobs":[],"app":"phone","label":"Phone"},{"image":"img/apps/messages.png","slot":"0:1","job":false,"blockedJobs":[],"app":"messages","category":"Social","label":"Messages"},{"job":false,"image":"img/apps/settings.png","blockBadge":true,"slot":"0:2","blockedJobs":[],"app":"settings","category":"Utilities","label":"Settings"},{"image":"img/apps/camera.png","slot":"0:3","job":false,"blockedJobs":[],"app":"camera","category":"Creativity","label":"Camera"},{"image":"img/apps/contacts.png","slot":"1:0","job":false,"blockedJobs":[],"app":"contacts","category":"Social","label":"Contacts"},{"image":"img/apps/mail.png","slot":"1:1","job":false,"blockedJobs":[],"app":"mail","category":"Productivity & Finance","label":"Mail"},{"image":"img/apps/weather.png","slot":"1:2","job":false,"blockedJobs":[],"app":"weather","category":"Information & Reading","label":"Weather"},{"image":"img/apps/calendar.png","slot":"1:3","job":false,"blockedJobs":[],"app":"calendar","category":"Productivity & Finance","label":"Calendar"},{"image":"img/apps/reminders.png","slot":"1:4","job":false,"blockedJobs":[],"app":"reminder","category":"Productivity & Finance","label":"Reminders"},{"image":"img/apps/gallery.png","slot":"1:5","job":false,"blockedJobs":[],"app":"gallery","category":"Creativity","label":"Gallery"},{"image":"img/apps/health.png","slot":"1:6","job":false,"blockedJobs":[],"app":"health","category":"Creativity","label":"Health"},{"job":false,"image":"img/apps/notes.png","slot":"1:7","hideInSettingsNotifications":true,"blockedJobs":[],"app":"notes","category":"Productivity & Finance","label":"Notes"},{"job":false,"image":"img/apps/calculator.png","slot":"1:8","hideInSettingsNotifications":true,"blockedJobs":[],"app":"calculator","category":"Utilities","label":"Calculator"},{"image":"img/apps/store.png","slot":"1:9","job":false,"blockedJobs":[],"app":"store","category":"Utilities","label":"App Store"},{"image":"img/apps/stock.png","slot":"1:10","job":false,"blockedJobs":[],"app":"crypto","category":"Productivity & Finance","label":"Stock"},{"image":"img/apps/clock.png","slot":"1:11","job":false,"blockedJobs":[],"app":"clock","category":"Utilities","label":"Clock"},{"image":"img/apps/houses.png","slot":"1:12","job":false,"blockedJobs":[],"app":"houses","category":"Utilities","label":"Home"},{"image":"img/apps/news.png","slot":"1:13","job":false,"blockedJobs":[],"app":"weazel","category":"Other","label":"News"},{"image":"img/apps/maps.png","slot":"1:14","blockedJobs":[],"app":"map","category":"Utilities","label":"Maps"},{"game":{"iframe":"https://yep.com","css":{"width":"100%","top":"0","border":"none","position":"absolute","height":"100%"},"name":"safari","rotate":false},"image":"img/apps/safari.png","slot":"1:15","blockedJobs":[],"app":"safari","category":"Utilities","label":"Safari"},{"image":"img/apps/facetime.png","slot":"1:16","job":false,"blockedJobs":[],"app":"facetime","category":"Social","label":"FaceTime"}],"steps":157,"faceid":true,"lockscreen":true,"Pincode":"0119","first_screen_showed":true,"darkMode":true},"description":"Numéro de téléphone : 5923"},"count":1,"name":"phone"},{"slot":8,"count":1033,"name":"ammo-shotgun"},{"slot":9,"metadata":{"components":[],"serial":"139349UFN263079","registered":"Jessy Jhon","durability":0,"ammo":7},"count":1,"name":"WEAPON_PUMPSHOTGUN"},{"slot":56,"metadata":{"pants_1":0,"pants_2":0},"count":1,"name":"clothes_pants"},{"slot":57,"metadata":{"shoes_2":0,"shoes_1":0},"count":1,"name":"clothes_shoes"},{"slot":53,"metadata":{"tshirt_1":0,"tshirt_2":0},"count":1,"name":"clothes_tshirt"},{"slot":54,"metadata":{"torso_1":0,"torso_2":0},"count":1,"name":"clothes_torso"},{"slot":55,"metadata":{"arms_2":0,"arms":"198_0"},"count":1,"name":"clothes_arms"}]', 'unemployed', 0, '[]', '{"lastPlaytime":28866,"jobDuty":false,"armor":0,"health":200}', '{"x":912.5010986328125,"heading":195.59054565429688,"z":60.7890625,"y":-473.063720703125}', 'Jessy', 'Jhon', '26/02/2002', 'm', 177, '{"hair":{"color":0,"texture":0,"style":0,"highlight":0},"headOverlays":{"moleAndFreckles":{"color":0,"secondColor":0,"style":0,"opacity":0},"blush":{"color":0,"secondColor":0,"style":0,"opacity":0},"blemishes":{"color":0,"secondColor":0,"style":0,"opacity":0},"beard":{"color":0,"secondColor":0,"style":0,"opacity":0},"makeUp":{"color":0,"secondColor":0,"style":0,"opacity":0},"ageing":{"color":0,"secondColor":0,"style":0,"opacity":0},"complexion":{"color":0,"secondColor":0,"style":0,"opacity":0},"chestHair":{"color":0,"secondColor":0,"style":0,"opacity":0},"eyebrows":{"color":0,"secondColor":0,"style":0,"opacity":0},"bodyBlemishes":{"color":0,"secondColor":0,"style":0,"opacity":0},"sunDamage":{"color":0,"secondColor":0,"style":0,"opacity":0},"lipstick":{"color":0,"secondColor":0,"style":0,"opacity":0}},"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":0,"drawable":0,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":198},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0},{"component_id":99,"texture":0,"drawable":"198_0"}],"headBlend":{"shapeMix":0.0,"shapeFirst":0,"skinSecond":0,"skinFirst":0,"thirdMix":0.0,"shape":"0_0","shapeSecond":0,"skin":"0_0","skinThird":0,"skinMix":0.0,"shapeThird":0},"tattoos":[],"eyeColor":-1,"pedScale":1.0,"model":"mp_m_freemode_01","faceFeatures":{"chinBoneLowering":0.0,"eyeBrownForward":0.0,"nosePeakSize":0.0,"chinHole":0.0,"cheeksBoneWidth":0.0,"lipsThickness":0.0,"chinBoneSize":0.0,"nosePeakHigh":0.0,"nosePeakLowering":0.0,"noseBoneTwist":0.0,"eyesOpening":0.0,"jawBoneBackSize":0.0,"noseBoneHigh":0.0,"jawBoneWidth":0.0,"cheeksWidth":0.0,"cheeksBoneHigh":0.0,"noseWidth":0.0,"neckThickness":0.0,"chinBoneLenght":0.0,"eyeBrownHigh":0.0}}', '[{"name":"hunger","val":497600,"percent":49.76},{"name":"thirst","val":498200,"percent":49.82}]', 0, 21, 0, NULL, '2025-11-30 14:09:27', '2025-12-08 16:08:54', '5646', NULL, NULL, 0, 0, NULL, NULL, NULL, '17:08 08/12/2025', '{"bloodType":"O+","armour":0,"health":200,"type":"none","damages":[]}', NULL, NULL, NULL, NULL, NULL, NULL, '', '', 0, '', NULL, '{"placeofbirth":"Los Santos","dateofissue":"01/01/2021","dateofexpiry":"01/01/2031","nationality":"USA"}', NULL, '2025-12-08 16:08:54'),
	('char0:2c04a8506e426a0867af88aada9d2698cebb7d18', '{"black_money":0,"money":10000,"bank":15600}', 'admin', '[{"count":10000,"name":"money","slot":1},{"count":1,"name":"phone","metadata":{"description":"Numéro de téléphone : 5316","metadata":{"darkMode":true,"blur_disabled":true,"lockscreen":true,"first_screen_showed":true,"Pincode":"0000","faceid":true,"bluetooth":false,"steps":30,"apps":[{"hideInSettingsNotifications":true,"blockedJobs":[],"app":"phone","slot":"0:0","job":false,"category":"Social","label":"Phone","notificationSound":"","image":"img/apps/phone.png"},{"category":"Social","blockedJobs":[],"image":"img/apps/messages.png","app":"messages","slot":"0:1","label":"Messages","job":false},{"category":"Utilities","image":"img/apps/settings.png","blockedJobs":[],"blockBadge":true,"app":"settings","slot":"0:2","label":"Settings","job":false},{"category":"Creativity","blockedJobs":[],"image":"img/apps/camera.png","app":"camera","slot":"0:3","label":"Camera","job":false},{"category":"Social","blockedJobs":[],"image":"img/apps/contacts.png","app":"contacts","slot":"1:0","label":"Contacts","job":false},{"category":"Productivity & Finance","blockedJobs":[],"image":"img/apps/mail.png","app":"mail","slot":"1:1","label":"Mail","job":false},{"category":"Information & Reading","blockedJobs":[],"image":"img/apps/weather.png","app":"weather","slot":"1:2","label":"Weather","job":false},{"category":"Productivity & Finance","blockedJobs":[],"image":"img/apps/calendar.png","app":"calendar","slot":"1:3","label":"Calendar","job":false},{"category":"Productivity & Finance","blockedJobs":[],"image":"img/apps/reminders.png","app":"reminder","slot":"1:4","label":"Reminders","job":false},{"category":"Creativity","blockedJobs":[],"image":"img/apps/gallery.png","app":"gallery","slot":"1:5","label":"Gallery","job":false},{"category":"Creativity","blockedJobs":[],"image":"img/apps/health.png","app":"health","slot":"1:6","label":"Health","job":false},{"category":"Productivity & Finance","hideInSettingsNotifications":true,"blockedJobs":[],"image":"img/apps/notes.png","app":"notes","slot":"1:7","label":"Notes","job":false},{"category":"Utilities","hideInSettingsNotifications":true,"blockedJobs":[],"image":"img/apps/calculator.png","app":"calculator","slot":"1:8","label":"Calculator","job":false},{"category":"Utilities","blockedJobs":[],"image":"img/apps/store.png","app":"store","slot":"1:9","label":"App Store","job":false},{"category":"Productivity & Finance","blockedJobs":[],"image":"img/apps/stock.png","app":"crypto","slot":"1:10","label":"Stock","job":false},{"category":"Utilities","blockedJobs":[],"image":"img/apps/clock.png","app":"clock","slot":"1:11","label":"Clock","job":false},{"category":"Utilities","blockedJobs":[],"image":"img/apps/houses.png","app":"houses","slot":"1:12","label":"Home","job":false},{"category":"Other","blockedJobs":[],"image":"img/apps/news.png","app":"weazel","slot":"1:13","label":"News","job":false},{"category":"Utilities","label":"Maps","app":"map","slot":"1:14","image":"img/apps/maps.png","blockedJobs":[]},{"category":"Utilities","label":"Safari","image":"img/apps/safari.png","app":"safari","slot":"1:15","blockedJobs":[],"game":{"rotate":false,"css":{"border":"none","top":"0","position":"absolute","width":"100%","height":"100%"},"iframe":"https://yep.com","name":"safari"}},{"category":"Social","blockedJobs":[],"image":"img/apps/facetime.png","app":"facetime","slot":"1:16","label":"FaceTime","job":false}],"battery":99.72299999999884},"owneridentifier":"char0:2c04a8506e426a0867af88aada9d2698cebb7d18","charinfo":{"phone":"5316","lastname":"Ginoxi","firstname":"Ginoxi"},"phoneNumber":"5316","uniqueId":456770650},"slot":2}]', 'unemployed', 0, '[]', '{"lastPlaytime":13312,"health":188,"armor":0,"jobDuty":false}', '{"y":470.1230773925781,"z":145.79638671875,"heading":246.61416625976563,"x":-3.00658798217773}', 'Ginoxi', 'Ginoxi', '02/01/2000', 'm', 196, '{"model":"mp_m_freemode_01","components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0},{"component_id":99,"texture":0,"drawable":"198_0"},{"component_id":3,"key":"hands","texture":0,"drawable":198,"type":"drawable"}],"hair":{"style":0,"texture":0,"highlight":0,"color":0},"headOverlays":{"moleAndFreckles":{"opacity":0,"secondColor":0,"style":0,"color":0},"ageing":{"opacity":0,"secondColor":0,"style":0,"color":0},"sunDamage":{"opacity":0,"secondColor":0,"style":0,"color":0},"blemishes":{"opacity":0,"secondColor":0,"style":0,"color":0},"lipstick":{"opacity":0,"secondColor":0,"style":0,"color":0},"blush":{"opacity":0,"secondColor":0,"style":0,"color":0},"makeUp":{"opacity":0,"secondColor":0,"style":0,"color":0},"chestHair":{"opacity":0,"secondColor":0,"style":0,"color":0},"eyebrows":{"opacity":0,"secondColor":0,"style":0,"color":0},"complexion":{"opacity":0,"secondColor":0,"style":0,"color":0},"beard":{"opacity":0,"secondColor":0,"style":0,"color":0},"bodyBlemishes":{"opacity":0,"secondColor":0,"style":0,"color":0}},"pedScale":1,"faceFeatures":{"nosePeakSize":0,"cheeksBoneWidth":0,"cheeksWidth":0,"nosePeakHigh":0,"chinBoneLenght":0,"noseBoneTwist":0,"cheeksBoneHigh":0,"chinBoneSize":0,"nosePeakLowering":0,"neckThickness":0,"lipsThickness":0,"chinBoneLowering":0,"noseBoneHigh":0,"chinHole":0,"eyeBrownHigh":0,"eyesOpening":0,"eyeBrownForward":0,"jawBoneWidth":0,"jawBoneBackSize":0,"noseWidth":0},"headBlend":{"shape":"0_0","shapeSecond":0,"skin":"0_0","skinThird":0,"thirdMix":0,"shapeThird":0,"skinFirst":0,"skinSecond":0,"skinMix":0,"shapeMix":0,"shapeFirst":0},"tattoos":[],"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"eyeColor":-1}', '[{"percent":45.33,"val":453300,"name":"hunger"},{"percent":58.9975,"val":589975,"name":"thirst"}]', 0, 31, 0, NULL, '2025-12-03 18:17:24', '2025-12-04 13:51:14', '5845', NULL, NULL, 0, 0, NULL, NULL, NULL, '22:50 03/12/2025', '{"bloodType":"O+","armour":0,"health":188,"type":"none","damages":{"leftLeg":{"injuries":{"-1553120962":{"weapon":-1553120962,"data":{"color":"red.9","label":"Massive Trauma","items":{"blood_bag_500":1,"suture_kit":1,"morphine":2}},"hits":7}},"bodyPart":"leftLeg"},"rightLeg":{"injuries":{"-1553120962":{"weapon":-1553120962,"data":{"color":"red.6","label":"Road Rash","items":{"disinfectant":1,"bandage":2}},"hits":1}},"bodyPart":"rightLeg"}}}', NULL, NULL, NULL, NULL, NULL, NULL, '', '', 0, '', NULL, '{"placeofbirth":"Los Santos","dateofissue":"01/01/2021","dateofexpiry":"01/01/2031","nationality":"USA"}', NULL, '2025-12-07 22:09:52'),
	('char0:72e2349201e0683aa2540804c45f566df0755123', '{"money":40048095,"bank":60127650,"black_money":11780}', 'admin', '[{"metadata":{"ammo":12,"durability":97.60000000000002,"components":[],"registered":"Gobe Monpaf","serial":"795695VPV553073"},"count":1,"name":"WEAPON_PISTOL","slot":1},{"count":3500,"name":"iron_ore","slot":2},{"metadata":{"ammo":5,"durability":74.50000000000002,"components":[],"registered":"Gobe Monpaf","serial":"613750VND670698"},"count":1,"name":"WEAPON_HEAVYRIFLE","slot":3},{"metadata":{"ammo":30,"durability":64.90000000000009,"components":[],"registered":"Gobe Monpaf","serial":"275790WSY183988"},"count":1,"name":"WEAPON_ADVANCEDRIFLE","slot":4},{"metadata":{"durability":100,"components":[]},"count":1,"name":"WEAPON_STICKYBOMB","slot":5},{"metadata":{"code":"453711"},"count":1,"name":"jewelry_code","slot":6},{"metadata":{"ammo":0,"durability":100,"components":[],"registered":"Gobe Monpaf","serial":"491296BRV312810"},"count":1,"name":"WEAPON_ADVANCEDRIFLE","slot":7},{"count":1,"name":"grinder","slot":9},{"count":860,"name":"ammo-9","slot":10},{"metadata":{"card_number":"4328833631128498","iban":"8330566212"},"count":1,"name":"bank_card","slot":11},{"metadata":{"metadata":{"steps":39,"apps":[{"app":"phone","blockedJobs":[],"notificationSound":"","label":"Phone","image":"img/apps/phone.png","job":false,"slot":"0:0","hideInSettingsNotifications":true,"category":"Social"},{"app":"messages","blockedJobs":[],"slot":"0:1","image":"img/apps/messages.png","label":"Messages","job":false,"category":"Social"},{"app":"settings","blockedJobs":[],"blockBadge":true,"label":"Settings","image":"img/apps/settings.png","category":"Utilities","job":false,"slot":"0:2"},{"app":"camera","blockedJobs":[],"slot":"0:3","image":"img/apps/camera.png","label":"Camera","job":false,"category":"Creativity"},{"app":"contacts","blockedJobs":[],"slot":"1:0","image":"img/apps/contacts.png","label":"Contacts","job":false,"category":"Social"},{"app":"mail","blockedJobs":[],"slot":"1:1","image":"img/apps/mail.png","label":"Mail","job":false,"category":"Productivity & Finance"},{"app":"weather","blockedJobs":[],"slot":"1:2","image":"img/apps/weather.png","label":"Weather","job":false,"category":"Information & Reading"},{"app":"calendar","blockedJobs":[],"slot":"1:3","image":"img/apps/calendar.png","label":"Calendar","job":false,"category":"Productivity & Finance"},{"app":"reminder","blockedJobs":[],"slot":"1:4","image":"img/apps/reminders.png","label":"Reminders","job":false,"category":"Productivity & Finance"},{"app":"gallery","blockedJobs":[],"slot":"1:5","image":"img/apps/gallery.png","label":"Gallery","job":false,"category":"Creativity"},{"app":"health","blockedJobs":[],"slot":"1:6","image":"img/apps/health.png","label":"Health","job":false,"category":"Creativity"},{"hideInSettingsNotifications":true,"blockedJobs":[],"slot":"1:7","label":"Notes","image":"img/apps/notes.png","category":"Productivity & Finance","job":false,"app":"notes"},{"hideInSettingsNotifications":true,"blockedJobs":[],"slot":"1:8","label":"Calculator","image":"img/apps/calculator.png","category":"Utilities","job":false,"app":"calculator"},{"app":"store","blockedJobs":[],"slot":"1:9","image":"img/apps/store.png","label":"App Store","job":false,"category":"Utilities"},{"app":"crypto","blockedJobs":[],"slot":"1:10","image":"img/apps/stock.png","label":"Stock","job":false,"category":"Productivity & Finance"},{"app":"clock","blockedJobs":[],"slot":"1:11","image":"img/apps/clock.png","label":"Clock","job":false,"category":"Utilities"},{"app":"houses","blockedJobs":[],"slot":"1:12","image":"img/apps/houses.png","label":"Home","job":false,"category":"Utilities"},{"app":"weazel","blockedJobs":[],"slot":"1:13","image":"img/apps/news.png","label":"News","job":false,"category":"Other"},{"app":"map","blockedJobs":[],"slot":"1:14","image":"img/apps/maps.png","category":"Utilities","label":"Maps"},{"app":"safari","blockedJobs":[],"slot":"1:15","image":"img/apps/safari.png","category":"Utilities","game":{"css":{"top":"0","border":"none","height":"100%","position":"absolute","width":"100%"},"name":"safari","iframe":"https://yep.com","rotate":false},"label":"Safari"},{"app":"facetime","blockedJobs":[],"slot":"1:16","image":"img/apps/facetime.png","label":"FaceTime","job":false,"category":"Social"}],"battery":99.98999999999997,"blur_disabled":true,"lockscreen":true},"uniqueId":662904438,"charinfo":{"phone":"5658","firstname":"Gobe","lastname":"Monpaf"},"phoneNumber":"5658","owneridentifier":"char0:72e2349201e0683aa2540804c45f566df0755123","description":"Numéro de téléphone : 5658"},"count":1,"name":"phone","slot":12},{"count":990,"name":"ammo-sniper","slot":13},{"metadata":{"ammo":0,"durability":100,"components":[],"registered":"Gobe Monpaf","serial":"123521ZFG527583"},"count":1,"name":"WEAPON_ADVANCEDRIFLE","slot":14},{"metadata":{"ammo":0,"durability":100,"components":[],"registered":"Gobe Monpaf","serial":"403724BGJ816029"},"count":1,"name":"WEAPON_ADVANCEDRIFLE","slot":15},{"metadata":{"ammo":0,"durability":100,"components":[],"registered":"Gobe Monpaf","serial":"768587QDS528741"},"count":1,"name":"WEAPON_ADVANCEDRIFLE","slot":16},{"count":40048095,"name":"money","slot":17},{"metadata":{"ammo":0,"durability":100,"components":[],"registered":"Gobe Monpaf","serial":"581559DMM509572"},"count":1,"name":"WEAPON_ADVANCEDRIFLE","slot":18},{"metadata":{"ammo":1,"durability":95.5,"components":[],"registered":"Gobe Monpaf","serial":"713808QRC413018"},"count":1,"name":"WEAPON_SNIPERRIFLE","slot":19},{"metadata":{"ammo":0,"durability":100,"components":[],"registered":"Gobe Monpaf","serial":"399155LUD579150"},"count":1,"name":"WEAPON_ADVANCEDRIFLE","slot":20},{"metadata":{"ammo":0,"durability":100,"components":[],"registered":"Gobe Monpaf","serial":"982933BCE425333"},"count":1,"name":"WEAPON_ADVANCEDRIFLE","slot":21},{"count":1000,"name":"ammo-rifle2","slot":22},{"count":11780,"name":"black_money","slot":23},{"count":4949,"name":"ammo-rifle","slot":24},{"count":2000,"name":"ammo-heavysniper","slot":25},{"metadata":{"durability":100,"components":[],"weight":15000.0,"ammo":100},"count":1,"name":"WEAPON_PETROLCAN","slot":26},{"metadata":{"ammo":0,"durability":100,"components":[],"registered":"Gobe Monpaf","serial":"498370QNM341376"},"count":1,"name":"WEAPON_ADVANCEDRIFLE","slot":27},{"metadata":{"pants_2":0,"pants_1":0},"count":1,"name":"clothes_pants","slot":56},{"metadata":{"shoes_1":0,"shoes_2":0},"count":1,"name":"clothes_shoes","slot":57},{"metadata":{"tshirt_1":0,"tshirt_2":0},"count":1,"name":"clothes_tshirt","slot":53},{"metadata":{"torso_2":0,"torso_1":0},"count":1,"name":"clothes_torso","slot":54},{"metadata":{"arms_2":0,"arms":"198_0"},"count":1,"name":"clothes_arms","slot":55}]', 'concess', 2, '[]', '{"jobDuty":true,"lastPlaytime":53090,"armor":0,"health":200}', '{"x":401.5120849609375,"y":3516.17138671875,"z":34.065185546875,"heading":87.87401580810547}', 'Gobe', 'Monpaf', '06/12/1994', 'm', 171, '{"pedScale":1.0,"model":"mp_m_freemode_01","hair":{"color":0,"highlight":0,"style":0,"texture":0},"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":198,"component_id":3},{"texture":0,"drawable":0,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":0,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":0,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":0,"drawable":0,"component_id":11},{"texture":0,"drawable":"198_0","component_id":99}],"headOverlays":{"chestHair":{"color":0,"secondColor":0,"style":0,"opacity":0},"lipstick":{"color":0,"secondColor":0,"style":0,"opacity":0},"sunDamage":{"color":0,"secondColor":0,"style":0,"opacity":0},"moleAndFreckles":{"color":0,"secondColor":0,"style":0,"opacity":0},"beard":{"color":0,"secondColor":0,"style":0,"opacity":0},"makeUp":{"color":0,"secondColor":0,"style":0,"opacity":0},"bodyBlemishes":{"color":0,"secondColor":0,"style":0,"opacity":0},"ageing":{"color":0,"secondColor":0,"style":0,"opacity":0},"blush":{"color":0,"secondColor":0,"style":0,"opacity":0},"complexion":{"color":0,"secondColor":0,"style":0,"opacity":0},"eyebrows":{"color":0,"secondColor":0,"style":0,"opacity":0},"blemishes":{"color":0,"secondColor":0,"style":0,"opacity":0}},"tattoos":[],"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":0,"prop_id":1,"texture":0},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"faceFeatures":{"eyeBrownHigh":0.0,"chinBoneSize":0.0,"jawBoneBackSize":0.0,"eyesOpening":0.0,"noseWidth":0.0,"nosePeakHigh":0.0,"lipsThickness":0.0,"chinBoneLowering":0.0,"eyeBrownForward":0.0,"neckThickness":0.0,"nosePeakLowering":0.0,"jawBoneWidth":0.0,"noseBoneHigh":0.0,"cheeksWidth":0.0,"chinBoneLenght":0.0,"cheeksBoneWidth":0.0,"nosePeakSize":0.0,"cheeksBoneHigh":0.0,"chinHole":0.0,"noseBoneTwist":0.0},"headBlend":{"shapeFirst":0,"skinMix":0.0,"shapeSecond":0,"shapeThird":0,"skinSecond":0,"thirdMix":0.0,"shape":"0_0","shapeMix":0.0,"skin":"0_0","skinThird":0,"skinFirst":0},"eyeColor":-1}', '[{"name":"hunger","percent":96.25,"val":962500},{"name":"thirst","percent":97.1875,"val":971875}]', 0, 30, 0, NULL, '2025-11-30 22:43:46', '2025-12-08 17:42:35', '5579', NULL, NULL, 0, 0, NULL, NULL, NULL, '18:42 08/12/2025', '{"damages":[],"health":200,"armour":0,"type":"none","bloodType":"AB-"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', NULL, '{"placeofbirth":"Los Santos","dateofissue":"01/01/2021","dateofexpiry":"01/01/2031","nationality":"USA"}', '{"level":1,"xp":0}', '2025-12-08 17:42:35'),
	('char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff', '{"bank":962400,"money":800005334,"black_money":4000}', 'admin', '[{"metadata":{"issuer":"Zak Dev","societe":"SASP","reason":"kkkk","amount":500,"payer":"Mina Palace","date":"07/12/2025 21:02","job":"police"},"count":1,"slot":1,"name":"ticket_caisse"},{"count":800005334,"slot":2,"name":"money"},{"metadata":{"durability":0,"components":[],"registered":"Mina Palace","serial":"557003XBS610892","ammo":1},"count":1,"slot":3,"name":"WEAPON_PISTOL"},{"metadata":{"description":"Numéro de téléphone : 5755","charinfo":{"lastname":"Palace","phone":"5755","firstname":"Mina"},"owneridentifier":"char0:d80bf51e74a6e4cc571852f5de48f019df1f37ff","phoneNumber":"5755","uniqueId":892158735,"metadata":{"steps":334,"darkMode":true,"blur_disabled":true,"battery":99.99599999999998,"lockscreen":true,"faceid":true,"apps":[{"image":"img/apps/phone.png","label":"Phone","blockedJobs":[],"slot":"0:0","notificationSound":"","app":"phone","category":"Social","hideInSettingsNotifications":true,"job":false},{"category":"Social","slot":"0:1","image":"img/apps/messages.png","app":"messages","blockedJobs":[],"label":"Messages","job":false},{"blockBadge":true,"blockedJobs":[],"slot":"0:2","image":"img/apps/settings.png","app":"settings","category":"Utilities","label":"Settings","job":false},{"category":"Creativity","slot":"0:3","image":"img/apps/camera.png","app":"camera","blockedJobs":[],"label":"Camera","job":false},{"category":"Social","slot":"1:0","image":"img/apps/contacts.png","app":"contacts","blockedJobs":[],"label":"Contacts","job":false},{"category":"Productivity & Finance","slot":"1:1","image":"img/apps/mail.png","app":"mail","blockedJobs":[],"label":"Mail","job":false},{"category":"Information & Reading","slot":"1:2","image":"img/apps/weather.png","app":"weather","blockedJobs":[],"label":"Weather","job":false},{"category":"Productivity & Finance","slot":"1:3","image":"img/apps/calendar.png","app":"calendar","blockedJobs":[],"label":"Calendar","job":false},{"category":"Productivity & Finance","slot":"1:4","image":"img/apps/reminders.png","app":"reminder","blockedJobs":[],"label":"Reminders","job":false},{"category":"Creativity","slot":"1:5","image":"img/apps/gallery.png","app":"gallery","blockedJobs":[],"label":"Gallery","job":false},{"category":"Creativity","slot":"1:6","image":"img/apps/health.png","app":"health","blockedJobs":[],"label":"Health","job":false},{"category":"Productivity & Finance","blockedJobs":[],"slot":"1:7","image":"img/apps/notes.png","app":"notes","label":"Notes","hideInSettingsNotifications":true,"job":false},{"category":"Utilities","blockedJobs":[],"slot":"1:8","image":"img/apps/calculator.png","app":"calculator","label":"Calculator","hideInSettingsNotifications":true,"job":false},{"category":"Utilities","slot":"1:9","image":"img/apps/store.png","app":"store","blockedJobs":[],"label":"App Store","job":false},{"category":"Productivity & Finance","slot":"1:10","image":"img/apps/stock.png","app":"crypto","blockedJobs":[],"label":"Stock","job":false},{"category":"Utilities","slot":"1:11","image":"img/apps/clock.png","app":"clock","blockedJobs":[],"label":"Clock","job":false},{"category":"Utilities","slot":"1:12","image":"img/apps/houses.png","app":"houses","blockedJobs":[],"label":"Home","job":false},{"category":"Other","slot":"1:13","image":"img/apps/news.png","app":"weazel","blockedJobs":[],"label":"News","job":false},{"slot":"1:14","image":"img/apps/maps.png","app":"map","category":"Utilities","label":"Maps","blockedJobs":[]},{"label":"Safari","slot":"1:15","image":"img/apps/safari.png","app":"safari","blockedJobs":[],"game":{"iframe":"https://yep.com","css":{"border":"none","height":"100%","position":"absolute","width":"100%","top":"0"},"rotate":false,"name":"safari"},"category":"Utilities"},{"category":"Social","slot":"1:16","image":"img/apps/facetime.png","app":"facetime","blockedJobs":[],"label":"FaceTime","job":false}],"first_screen_showed":true,"Pincode":"0000"}},"count":1,"slot":4,"name":"phone"},{"count":3,"slot":5,"name":"ice_tea"},{"count":2,"slot":6,"name":"burger"},{"count":2,"slot":7,"name":"bread"},{"count":1,"slot":8,"name":"ristretto"},{"metadata":{"durability":100,"components":[],"registered":"Mina Palace","serial":"420006BKX382623","ammo":0},"count":1,"slot":9,"name":"WEAPON_SMG"},{"count":665,"slot":11,"name":"ammo-9"},{"count":4000,"slot":12,"name":"black_money"},{"metadata":{"pants_2":0,"pants_1":0},"count":1,"slot":56,"name":"clothes_pants"},{"metadata":{"shoes_1":0,"shoes_2":0},"count":1,"slot":57,"name":"clothes_shoes"},{"metadata":{"tshirt_1":0,"tshirt_2":0},"count":1,"slot":53,"name":"clothes_tshirt"},{"metadata":{"torso_2":0,"torso_1":0},"count":1,"slot":54,"name":"clothes_torso"},{"metadata":{"arms":"0_0","arms_2":0},"count":1,"slot":55,"name":"clothes_arms"}]', 'unemployed', 0, '[]', '{"lastPlaytime":60877,"armor":0,"jobDuty":false,"health":200}', '{"y":-1033.068115234375,"x":251.23516845703126,"heading":51.02362442016601,"z":29.2967529296875}', 'Mina', 'Palace', '02/11/1996', 'f', 163, '{"model":"u_m_y_smugmech_01","tattoos":[],"pedScale":1.0,"eyeColor":-1,"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"headBlend":{"skin":"0_0","skinFirst":0,"shapeThird":0,"skinSecond":0,"shape":"0_0","thirdMix":0.0,"shapeMix":0.0,"skinThird":0,"shapeSecond":0,"skinMix":0.0,"shapeFirst":0},"components":[{"texture":0,"component_id":0,"drawable":0},{"texture":0,"component_id":1,"drawable":0},{"texture":0,"component_id":2,"drawable":0},{"texture":0,"component_id":3,"drawable":0},{"texture":0,"component_id":4,"drawable":0},{"texture":0,"component_id":5,"drawable":0},{"texture":0,"component_id":6,"drawable":0},{"texture":0,"component_id":7,"drawable":0},{"texture":0,"component_id":8,"drawable":0},{"texture":0,"component_id":9,"drawable":0},{"texture":0,"component_id":10,"drawable":0},{"texture":0,"component_id":11,"drawable":0},{"texture":0,"component_id":99,"drawable":"0_0"}],"faceFeatures":{"eyesOpening":0.0,"jawBoneBackSize":0.0,"noseBoneTwist":0.0,"lipsThickness":0.0,"cheeksWidth":0.0,"chinBoneLenght":0.0,"eyeBrownHigh":0.0,"jawBoneWidth":0.0,"cheeksBoneHigh":0.0,"eyeBrownForward":0.0,"cheeksBoneWidth":0.0,"chinHole":0.0,"chinBoneSize":0.0,"chinBoneLowering":0.0,"noseWidth":0.0,"neckThickness":0.0,"nosePeakHigh":0.0,"noseBoneHigh":0.0,"nosePeakSize":0.0,"nosePeakLowering":0.0},"headOverlays":{"eyebrows":{"opacity":0.0,"color":0,"style":0,"secondColor":0},"moleAndFreckles":{"opacity":0.0,"color":0,"style":0,"secondColor":0},"ageing":{"opacity":0.0,"color":0,"style":0,"secondColor":0},"makeUp":{"opacity":0.0,"color":0,"style":0,"secondColor":0},"lipstick":{"opacity":0.0,"color":0,"style":0,"secondColor":0},"blush":{"opacity":0.0,"color":0,"style":0,"secondColor":0},"bodyBlemishes":{"opacity":0.0,"color":0,"style":0,"secondColor":0},"complexion":{"opacity":0.0,"color":0,"style":0,"secondColor":0},"chestHair":{"opacity":0.0,"color":0,"style":0,"secondColor":0},"beard":{"opacity":0.0,"color":0,"style":0,"secondColor":0},"blemishes":{"opacity":0.0,"color":0,"style":0,"secondColor":0},"sunDamage":{"opacity":0.0,"color":0,"style":0,"secondColor":0}},"hair":{"style":0,"texture":0,"color":-1,"highlight":-1}}', '[{"percent":29.54,"val":295400,"name":"hunger"},{"percent":34.655,"val":346550,"name":"thirst"}]', 0, 20, 0, NULL, '2025-11-30 13:23:29', '2025-12-07 22:01:40', '5438', NULL, NULL, 0, 0, NULL, NULL, NULL, '23:01 07/12/2025', '{"armour":0,"bloodType":"O+","health":200,"damages":[],"type":"none"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, '', NULL, '{"placeofbirth":"Los Santos","dateofissue":"01/01/2021","dateofexpiry":"01/01/2031","nationality":"USA"}', NULL, '2025-12-07 22:09:52'),
	('char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6', '{"money":125648948816089,"bank":625150,"black_money":19386}', 'admin', '[{"slot":1,"metadata":{"durability":66.40000000000004,"serial":"385423YUK951695","components":[],"ammo":0,"registered":"Y Dv"},"name":"WEAPON_PISTOL","count":1},{"slot":2,"metadata":{"durability":0,"serial":"210751GGK116041","components":[],"ammo":9,"registered":"Y Dv"},"name":"WEAPON_MACHINEPISTOL","count":1},{"slot":3,"name":"spy_gadget","count":1},{"slot":4,"metadata":{"description":"GRANGER C72V5IUS","plate":"C72V5IUS","model":"GRANGER"},"name":"vehiclekeys","count":1},{"slot":5,"name":"scuba","count":1},{"slot":6,"metadata":{"description":"CAVCADE RJK0O0P7","plate":"RJK0O0P7","model":"CAVCADE"},"name":"vehiclekeys","count":1},{"slot":7,"metadata":{"durability":0,"serial":"506485LAB902278","components":[],"ammo":15,"registered":"Y Dv"},"name":"WEAPON_TACTICALRIFLE","count":1},{"slot":8,"metadata":{"components":[],"durability":100},"name":"WEAPON_RAYPISTOL","count":1},{"slot":9,"name":"handcuffs","count":1},{"slot":10,"metadata":{"description":"POLICE D724WC11","plate":"D724WC11","model":"POLICE"},"name":"vehiclekeys","count":1},{"slot":11,"name":"enchanted_jewel","count":3},{"slot":12,"metadata":{"charinfo":{"phone":"5539","firstname":"Y","lastname":"Dv"},"metadata":{"darkMode":true,"Pincode":"2580","apps":[{"image":"img/apps/phone.png","notificationSound":"","app":"phone","label":"Phone","blockedJobs":[],"hideInSettingsNotifications":true,"category":"Social","job":false,"slot":"0:0"},{"blockedJobs":[],"slot":"0:1","image":"img/apps/messages.png","app":"messages","category":"Social","job":false,"label":"Messages"},{"blockedJobs":[],"image":"img/apps/settings.png","job":false,"category":"Utilities","app":"settings","blockBadge":true,"slot":"0:2","label":"Settings"},{"blockedJobs":[],"slot":"0:3","image":"img/apps/camera.png","app":"camera","category":"Creativity","job":false,"label":"Camera"},{"blockedJobs":[],"slot":"1:0","image":"img/apps/contacts.png","app":"contacts","category":"Social","job":false,"label":"Contacts"},{"blockedJobs":[],"slot":"1:1","image":"img/apps/mail.png","app":"mail","category":"Productivity & Finance","job":false,"label":"Mail"},{"blockedJobs":[],"slot":"1:2","image":"img/apps/weather.png","app":"weather","category":"Information & Reading","job":false,"label":"Weather"},{"blockedJobs":[],"slot":"1:3","image":"img/apps/calendar.png","app":"calendar","category":"Productivity & Finance","job":false,"label":"Calendar"},{"blockedJobs":[],"slot":"1:4","image":"img/apps/reminders.png","app":"reminder","category":"Productivity & Finance","job":false,"label":"Reminders"},{"blockedJobs":[],"slot":"1:5","image":"img/apps/gallery.png","app":"gallery","category":"Creativity","job":false,"label":"Gallery"},{"blockedJobs":[],"slot":"1:6","image":"img/apps/health.png","app":"health","category":"Creativity","job":false,"label":"Health"},{"blockedJobs":[],"hideInSettingsNotifications":true,"job":false,"category":"Productivity & Finance","app":"notes","image":"img/apps/notes.png","slot":"1:7","label":"Notes"},{"blockedJobs":[],"hideInSettingsNotifications":true,"job":false,"category":"Utilities","app":"calculator","image":"img/apps/calculator.png","slot":"1:8","label":"Calculator"},{"blockedJobs":[],"slot":"1:9","image":"img/apps/store.png","app":"store","category":"Utilities","job":false,"label":"App Store"},{"blockedJobs":[],"slot":"1:10","image":"img/apps/stock.png","app":"crypto","category":"Productivity & Finance","job":false,"label":"Stock"},{"blockedJobs":[],"slot":"1:11","image":"img/apps/clock.png","app":"clock","category":"Utilities","job":false,"label":"Clock"},{"blockedJobs":[],"slot":"1:12","image":"img/apps/houses.png","app":"houses","category":"Utilities","job":false,"label":"Home"},{"blockedJobs":[],"slot":"1:13","image":"img/apps/news.png","app":"weazel","category":"Other","job":false,"label":"News"},{"image":"img/apps/maps.png","category":"Utilities","app":"map","slot":"1:14","blockedJobs":[],"label":"Maps"},{"image":"img/apps/safari.png","category":"Utilities","blockedJobs":[],"app":"safari","slot":"1:15","label":"Safari","game":{"css":{"top":"0","border":"none","position":"absolute","height":"100%","width":"100%"},"iframe":"https://yep.com","name":"safari","rotate":false}},{"blockedJobs":[],"slot":"1:16","image":"img/apps/facetime.png","app":"facetime","category":"Social","job":false,"label":"FaceTime"}],"lockscreen":true,"blur_disabled":true,"first_screen_showed":true,"steps":0,"battery":99.94899999999976,"faceid":true},"uniqueId":540581980,"description":"Numéro de téléphone : 5539","owneridentifier":"char0:e77920ab12fe59bdbe1adc0a87ce3a817b1610a6","phoneNumber":"5539"},"name":"phone","count":1},{"slot":13,"name":"money","count":125648948816089},{"slot":14,"metadata":{"description":"POLICE 5075SC0Z","plate":"5075SC0Z","model":"POLICE"},"name":"vehiclekeys","count":1},{"slot":15,"name":"black_money","count":19386},{"slot":16,"name":"ammo-sniper","count":84},{"slot":17,"metadata":{"durability":0,"serial":"932721SLF227486","components":[],"ammo":11,"registered":"Y Dv"},"name":"WEAPON_PISTOL","count":1},{"slot":18,"name":"ammo-rifle","count":651},{"slot":20,"name":"ammo-22","count":496},{"slot":21,"metadata":{"durability":100,"serial":"132773CBA453086","components":[],"ammo":0,"registered":"Y Dv"},"name":"WEAPON_PISTOL","count":1},{"slot":22,"name":"c4_explosive","count":1},{"slot":23,"name":"c4_explosive","count":1},{"slot":24,"name":"c4_explosive","count":1},{"slot":25,"name":"c4_explosive","count":1},{"slot":26,"name":"c4_explosive","count":1},{"slot":27,"name":"c4_explosive","count":1},{"slot":28,"name":"c4_explosive","count":1},{"slot":56,"metadata":{"pants_1":0,"pants_2":0},"name":"clothes_pants","count":1},{"slot":57,"metadata":{"shoes_1":0,"shoes_2":0},"name":"clothes_shoes","count":1},{"slot":53,"metadata":{"tshirt_2":0,"tshirt_1":0},"name":"clothes_tshirt","count":1},{"slot":54,"metadata":{"torso_2":0,"torso_1":0},"name":"clothes_torso","count":1},{"slot":55,"metadata":{"arms_2":0,"arms":"0_0"},"name":"clothes_arms","count":1}]', 'police', 4, '[]', '{"armor":0,"jobDuty":true,"health":200,"lastPlaytime":81285}', '{"z":20.4000244140625,"heading":85.03936767578125,"x":-3101.72314453125,"y":1150.2593994140626}', 'Y', 'Dv', '12/12/1912', 'f', 171, '{"tattoos":[],"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":0,"drawable":0},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"headOverlays":{"lipstick":{"style":0,"secondColor":0,"opacity":0,"color":0},"sunDamage":{"style":0,"secondColor":0,"opacity":0,"color":0},"complexion":{"style":0,"secondColor":0,"opacity":0,"color":0},"blemishes":{"style":0,"secondColor":0,"opacity":0,"color":0},"ageing":{"style":0,"secondColor":0,"opacity":0,"color":0},"blush":{"style":0,"secondColor":0,"opacity":0,"color":0},"moleAndFreckles":{"style":0,"secondColor":0,"opacity":0,"color":0},"chestHair":{"style":0,"secondColor":0,"opacity":0,"color":0},"eyebrows":{"style":0,"secondColor":0,"opacity":0,"color":0},"bodyBlemishes":{"style":0,"secondColor":0,"opacity":0,"color":0},"beard":{"style":0,"secondColor":0,"opacity":0,"color":0},"makeUp":{"style":0,"secondColor":0,"opacity":0,"color":0}},"headBlend":{"skinSecond":0,"shapeSecond":0,"shape":"0_0","thirdMix":0.0,"shapeMix":0.0,"skinThird":0,"skinMix":0.0,"skin":"0_0","skinFirst":0,"shapeThird":0,"shapeFirst":0},"hair":{"highlight":0,"style":0,"texture":0,"color":0},"faceFeatures":{"nosePeakHigh":0.0,"cheeksWidth":0.0,"cheeksBoneHigh":0.0,"chinBoneLowering":0.0,"eyesOpening":0.0,"nosePeakSize":0.0,"noseWidth":0.0,"jawBoneBackSize":0.0,"cheeksBoneWidth":0.0,"noseBoneTwist":0.0,"chinHole":0.0,"noseBoneHigh":0.0,"chinBoneSize":0.0,"jawBoneWidth":0.0,"eyeBrownHigh":0.0,"eyeBrownForward":0.0,"neckThickness":0.0,"lipsThickness":0.0,"chinBoneLenght":0.0,"nosePeakLowering":0.0},"pedScale":1.0,"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":0},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0},{"component_id":99,"texture":0,"drawable":"0_0"}],"model":"mp_m_freemode_01","eyeColor":-1}', '[{"val":494600,"name":"hunger","percent":49.46},{"val":495950,"name":"thirst","percent":49.595}]', 0, 26, 0, NULL, '2025-11-30 18:10:17', '2025-12-08 17:36:10', '5699', NULL, NULL, 0, 0, NULL, NULL, NULL, '18:36 08/12/2025', '{"type":"none","health":200,"damages":[],"bloodType":"AB+","armour":0}', NULL, NULL, NULL, NULL, NULL, NULL, '', '', 0, '', NULL, '{"placeofbirth":"Los Santos","dateofissue":"01/01/2021","dateofexpiry":"01/01/2031","nationality":"USA"}', NULL, '2025-12-08 17:36:10'),
	('char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7', '{"money":53607,"bank":90229,"black_money":0}', 'admin', '[{"slot":1,"name":"money","count":53607},{"slot":2,"metadata":{"charinfo":{"phone":"5702","firstname":"Karl","lastname":"Miller"},"metadata":{"blur_disabled":true,"steps":0,"lockscreen":true,"battery":99.98799999999996,"apps":[{"image":"img/apps/phone.png","notificationSound":"","app":"phone","label":"Phone","blockedJobs":[],"hideInSettingsNotifications":true,"category":"Social","job":false,"slot":"0:0"},{"blockedJobs":[],"slot":"0:1","image":"img/apps/messages.png","app":"messages","category":"Social","job":false,"label":"Messages"},{"blockedJobs":[],"image":"img/apps/settings.png","job":false,"category":"Utilities","app":"settings","blockBadge":true,"slot":"0:2","label":"Settings"},{"blockedJobs":[],"slot":"0:3","image":"img/apps/camera.png","app":"camera","category":"Creativity","job":false,"label":"Camera"},{"blockedJobs":[],"slot":"1:0","image":"img/apps/contacts.png","app":"contacts","category":"Social","job":false,"label":"Contacts"},{"blockedJobs":[],"slot":"1:1","image":"img/apps/mail.png","app":"mail","category":"Productivity & Finance","job":false,"label":"Mail"},{"blockedJobs":[],"slot":"1:2","image":"img/apps/weather.png","app":"weather","category":"Information & Reading","job":false,"label":"Weather"},{"blockedJobs":[],"slot":"1:3","image":"img/apps/calendar.png","app":"calendar","category":"Productivity & Finance","job":false,"label":"Calendar"},{"blockedJobs":[],"slot":"1:4","image":"img/apps/reminders.png","app":"reminder","category":"Productivity & Finance","job":false,"label":"Reminders"},{"blockedJobs":[],"slot":"1:5","image":"img/apps/gallery.png","app":"gallery","category":"Creativity","job":false,"label":"Gallery"},{"blockedJobs":[],"slot":"1:6","image":"img/apps/health.png","app":"health","category":"Creativity","job":false,"label":"Health"},{"blockedJobs":[],"hideInSettingsNotifications":true,"job":false,"category":"Productivity & Finance","app":"notes","image":"img/apps/notes.png","slot":"1:7","label":"Notes"},{"blockedJobs":[],"hideInSettingsNotifications":true,"job":false,"category":"Utilities","app":"calculator","image":"img/apps/calculator.png","slot":"1:8","label":"Calculator"},{"blockedJobs":[],"slot":"1:9","image":"img/apps/store.png","app":"store","category":"Utilities","job":false,"label":"App Store"},{"blockedJobs":[],"slot":"1:10","image":"img/apps/stock.png","app":"crypto","category":"Productivity & Finance","job":false,"label":"Stock"},{"blockedJobs":[],"slot":"1:11","image":"img/apps/clock.png","app":"clock","category":"Utilities","job":false,"label":"Clock"},{"blockedJobs":[],"slot":"1:12","image":"img/apps/houses.png","app":"houses","category":"Utilities","job":false,"label":"Home"},{"blockedJobs":[],"slot":"1:13","image":"img/apps/news.png","app":"weazel","category":"Other","job":false,"label":"News"},{"image":"img/apps/maps.png","category":"Utilities","app":"map","slot":"1:14","blockedJobs":[],"label":"Maps"},{"image":"img/apps/safari.png","category":"Utilities","blockedJobs":[],"app":"safari","slot":"1:15","label":"Safari","game":{"css":{"top":"0","border":"none","position":"absolute","height":"100%","width":"100%"},"iframe":"https://yep.com","name":"safari","rotate":false}},{"blockedJobs":[],"slot":"1:16","image":"img/apps/facetime.png","app":"facetime","category":"Social","job":false,"label":"FaceTime"}]},"uniqueId":573719335,"description":"Numéro de téléphone : 5702","owneridentifier":"char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7","phoneNumber":"5702"},"name":"phone","count":1},{"slot":3,"metadata":{"charinfo":{"phone":"5909","firstname":"Karl","lastname":"Miller"},"metadata":{"blur_disabled":true,"steps":0,"lockscreen":true,"battery":99.98799999999996,"apps":[{"image":"img/apps/phone.png","notificationSound":"","app":"phone","label":"Phone","blockedJobs":[],"hideInSettingsNotifications":true,"category":"Social","job":false,"slot":"0:0"},{"blockedJobs":[],"slot":"0:1","image":"img/apps/messages.png","app":"messages","category":"Social","job":false,"label":"Messages"},{"blockedJobs":[],"image":"img/apps/settings.png","job":false,"category":"Utilities","app":"settings","blockBadge":true,"slot":"0:2","label":"Settings"},{"blockedJobs":[],"slot":"0:3","image":"img/apps/camera.png","app":"camera","category":"Creativity","job":false,"label":"Camera"},{"blockedJobs":[],"slot":"1:0","image":"img/apps/contacts.png","app":"contacts","category":"Social","job":false,"label":"Contacts"},{"blockedJobs":[],"slot":"1:1","image":"img/apps/mail.png","app":"mail","category":"Productivity & Finance","job":false,"label":"Mail"},{"blockedJobs":[],"slot":"1:2","image":"img/apps/weather.png","app":"weather","category":"Information & Reading","job":false,"label":"Weather"},{"blockedJobs":[],"slot":"1:3","image":"img/apps/calendar.png","app":"calendar","category":"Productivity & Finance","job":false,"label":"Calendar"},{"blockedJobs":[],"slot":"1:4","image":"img/apps/reminders.png","app":"reminder","category":"Productivity & Finance","job":false,"label":"Reminders"},{"blockedJobs":[],"slot":"1:5","image":"img/apps/gallery.png","app":"gallery","category":"Creativity","job":false,"label":"Gallery"},{"blockedJobs":[],"slot":"1:6","image":"img/apps/health.png","app":"health","category":"Creativity","job":false,"label":"Health"},{"blockedJobs":[],"hideInSettingsNotifications":true,"job":false,"category":"Productivity & Finance","app":"notes","image":"img/apps/notes.png","slot":"1:7","label":"Notes"},{"blockedJobs":[],"hideInSettingsNotifications":true,"job":false,"category":"Utilities","app":"calculator","image":"img/apps/calculator.png","slot":"1:8","label":"Calculator"},{"blockedJobs":[],"slot":"1:9","image":"img/apps/store.png","app":"store","category":"Utilities","job":false,"label":"App Store"},{"blockedJobs":[],"slot":"1:10","image":"img/apps/stock.png","app":"crypto","category":"Productivity & Finance","job":false,"label":"Stock"},{"blockedJobs":[],"slot":"1:11","image":"img/apps/clock.png","app":"clock","category":"Utilities","job":false,"label":"Clock"},{"blockedJobs":[],"slot":"1:12","image":"img/apps/houses.png","app":"houses","category":"Utilities","job":false,"label":"Home"},{"blockedJobs":[],"slot":"1:13","image":"img/apps/news.png","app":"weazel","category":"Other","job":false,"label":"News"},{"image":"img/apps/maps.png","category":"Utilities","app":"map","slot":"1:14","blockedJobs":[],"label":"Maps"},{"image":"img/apps/safari.png","category":"Utilities","blockedJobs":[],"app":"safari","slot":"1:15","label":"Safari","game":{"css":{"top":"0","border":"none","position":"absolute","height":"100%","width":"100%"},"iframe":"https://yep.com","name":"safari","rotate":false}},{"blockedJobs":[],"slot":"1:16","image":"img/apps/facetime.png","app":"facetime","category":"Social","job":false,"label":"FaceTime"}]},"uniqueId":401211752,"description":"Numéro de téléphone : 5909","owneridentifier":"char0:ed3f34298dc055c8fc569b00d32aa06a9eed7da7","phoneNumber":"5909"},"name":"phone","count":1},{"slot":4,"name":"ide","count":1},{"slot":5,"name":"predatek_fast_perch_210","count":1},{"slot":6,"name":"simmons_mono_original","count":1},{"slot":7,"name":"ufa_sproat_g_hook","count":1},{"slot":8,"name":"caddis_fly","count":99},{"slot":9,"name":"bandage","count":1},{"slot":10,"name":"water","count":3},{"slot":11,"name":"scuba","count":1},{"slot":12,"name":"sakura_alpax_8508","count":1},{"slot":16,"name":"syberia_indiana_white","count":1},{"slot":17,"name":"burger","count":5},{"slot":18,"name":"coca","count":6},{"slot":19,"metadata":{"arms_2":0,"arms":"6_0"},"name":"clothes_arms","count":1},{"slot":21,"metadata":{"durability":100,"serial":"406463JGF411756","components":[],"ammo":0,"registered":"Karl Miller"},"name":"WEAPON_ASSAULTRIFLE","count":1},{"slot":22,"name":"ammo-shotgun","count":145},{"slot":23,"metadata":{"durability":24.70000000000054,"serial":"903132QPZ782692","components":[],"ammo":3,"registered":"Karl Miller"},"name":"WEAPON_PUMPSHOTGUN","count":1},{"slot":56,"metadata":{"pants_1":0,"pants_2":0},"name":"clothes_pants","count":1},{"slot":57,"metadata":{"shoes_1":0,"shoes_2":0},"name":"clothes_shoes","count":1},{"slot":53,"metadata":{"tshirt_2":0,"tshirt_1":0},"name":"clothes_tshirt","count":1},{"slot":54,"metadata":{"torso_2":0,"torso_1":0},"name":"clothes_torso","count":1},{"slot":55,"metadata":{"arms_2":0,"arms":"15_0"},"name":"clothes_arms","count":1}]', 'police', 0, '[]', '{"armor":0,"jobDuty":true,"health":200,"lastPlaytime":45622}', '{"z":31.8916015625,"heading":172.91339111328126,"x":1306.7076416015626,"y":4053.257080078125}', 'Karl', 'Miller', '14/09/1981', 'm', 172, '{"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":0,"texture":0,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"headBlend":{"skinThird":0,"skin":"0_0","skinMix":0.0,"skinFirst":0,"skinSecond":0,"shapeSecond":0,"shapeFirst":0,"thirdMix":0.0,"shape":"0_0","shapeMix":0.0,"shapeThird":0},"eyeColor":-1,"hair":{"color":0,"highlight":0,"texture":0,"style":0},"pedScale":1.0,"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":0,"texture":0,"component_id":1},{"drawable":0,"texture":0,"component_id":2},{"drawable":15,"texture":0,"component_id":3},{"drawable":0,"texture":0,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":6},{"drawable":0,"texture":0,"component_id":7},{"drawable":0,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":0,"texture":0,"component_id":11},{"drawable":"15_0","texture":0,"component_id":99}],"model":"mp_m_freemode_01","headOverlays":{"chestHair":{"color":0,"secondColor":0,"style":0,"opacity":0},"lipstick":{"color":0,"secondColor":0,"style":0,"opacity":0},"blush":{"color":0,"secondColor":0,"style":0,"opacity":0},"bodyBlemishes":{"color":0,"secondColor":0,"style":0,"opacity":0},"beard":{"color":0,"secondColor":0,"style":0,"opacity":0},"blemishes":{"color":0,"secondColor":0,"style":0,"opacity":0},"makeUp":{"color":0,"secondColor":0,"style":0,"opacity":0},"sunDamage":{"color":0,"secondColor":0,"style":0,"opacity":0},"moleAndFreckles":{"color":0,"secondColor":0,"style":0,"opacity":0},"ageing":{"color":0,"secondColor":0,"style":0,"opacity":0},"eyebrows":{"color":0,"secondColor":0,"style":0,"opacity":0},"complexion":{"color":0,"secondColor":0,"style":0,"opacity":0}},"faceFeatures":{"cheeksBoneWidth":0.0,"nosePeakLowering":0.0,"noseBoneTwist":0.0,"cheeksWidth":0.0,"cheeksBoneHigh":0.0,"jawBoneWidth":0.0,"neckThickness":0.0,"eyeBrownHigh":0.0,"noseWidth":0.0,"jawBoneBackSize":0.0,"eyeBrownForward":0.0,"nosePeakHigh":0.0,"lipsThickness":0.0,"chinBoneSize":0.0,"chinHole":0.0,"noseBoneHigh":0.0,"eyesOpening":0.0,"chinBoneLowering":0.0,"chinBoneLenght":0.0,"nosePeakSize":0.0},"tattoos":[]}', '[{"val":486300,"name":"hunger","percent":48.63},{"val":489725,"name":"thirst","percent":48.9725}]', 0, 22, 0, NULL, '2025-11-30 15:54:56', '2025-12-08 17:31:22', '5608', NULL, NULL, 0, 0, NULL, NULL, NULL, '18:31 08/12/2025', '{"type":"none","health":200,"damages":[],"bloodType":"A-","armour":0}', NULL, NULL, NULL, NULL, NULL, NULL, '', '', 0, '', NULL, '{"placeofbirth":"Los Santos","dateofissue":"01/01/2021","dateofexpiry":"01/01/2031","nationality":"USA"}', NULL, '2025-12-08 17:31:22'),
	('char0:fcb47b307801e586e8c95881bdfc98004f24d031', '{"bank":4533048,"money":1293,"black_money":0}', 'admin', '[{"metadata":{"components":[],"ammo":0,"durability":40.00000000000013,"registered":"Zak Dev","serial":"725402RXF549906"},"name":"WEAPON_PISTOL","count":1,"slot":1},{"name":"money","count":1293,"slot":2},{"metadata":{"description":"POLICE 691UW6MQ","model":"POLICE","plate":"691UW6MQ"},"name":"vehiclekeys","count":1,"slot":3},{"metadata":{"description":"POLICE2 89V93OLF","model":"POLICE2","plate":"89V93OLF"},"name":"vehiclekeys","count":1,"slot":4},{"metadata":{"components":[],"ammo":7,"durability":0,"registered":"Zak Dev","serial":"663704HUX995474"},"name":"WEAPON_HEAVYRIFLE","count":1,"slot":5},{"metadata":{"description":"POLICE2 GC13Q1W3","model":"POLICE2","plate":"GC13Q1W3"},"name":"vehiclekeys","count":1,"slot":6},{"metadata":{"description":"POLICE2 N2XQIO95","model":"POLICE2","plate":"N2XQIO95"},"name":"vehiclekeys","count":1,"slot":7},{"metadata":{"charinfo":{"lastname":"Dev","firstname":"Zak","phone":"5949"},"phoneNumber":"5949","owneridentifier":"char0:fcb47b307801e586e8c95881bdfc98004f24d031","uniqueId":791398681,"metadata":{"lockscreen":true,"apps":[{"job":false,"app":"phone","hideInSettingsNotifications":true,"label":"Phone","category":"Social","notificationSound":"","image":"img/apps/phone.png","blockedJobs":[]},{"job":false,"blockedJobs":[],"label":"Messages","category":"Social","image":"img/apps/messages.png","app":"messages"},{"job":false,"blockedJobs":[],"label":"Settings","category":"Utilities","blockBadge":true,"image":"img/apps/settings.png","app":"settings"},{"job":false,"blockedJobs":[],"label":"Camera","category":"Creativity","image":"img/apps/camera.png","app":"camera"},{"job":false,"blockedJobs":[],"label":"Contacts","category":"Social","image":"img/apps/contacts.png","app":"contacts"},{"job":false,"blockedJobs":[],"label":"Mail","category":"Productivity & Finance","image":"img/apps/mail.png","app":"mail"},{"job":false,"blockedJobs":[],"label":"Weather","category":"Information & Reading","image":"img/apps/weather.png","app":"weather"},{"job":false,"blockedJobs":[],"label":"Calendar","category":"Productivity & Finance","image":"img/apps/calendar.png","app":"calendar"},{"job":false,"blockedJobs":[],"label":"Reminders","category":"Productivity & Finance","image":"img/apps/reminders.png","app":"reminder"},{"job":false,"blockedJobs":[],"label":"Gallery","category":"Creativity","image":"img/apps/gallery.png","app":"gallery"},{"job":false,"blockedJobs":[],"label":"Health","category":"Creativity","image":"img/apps/health.png","app":"health"},{"job":false,"blockedJobs":[],"hideInSettingsNotifications":true,"label":"Notes","category":"Productivity & Finance","image":"img/apps/notes.png","app":"notes"},{"job":false,"blockedJobs":[],"hideInSettingsNotifications":true,"label":"Calculator","category":"Utilities","image":"img/apps/calculator.png","app":"calculator"},{"job":false,"blockedJobs":[],"label":"App Store","category":"Utilities","image":"img/apps/store.png","app":"store"},{"job":false,"blockedJobs":[],"label":"Stock","category":"Productivity & Finance","image":"img/apps/stock.png","app":"crypto"},{"job":false,"blockedJobs":[],"label":"Clock","category":"Utilities","image":"img/apps/clock.png","app":"clock"},{"job":false,"blockedJobs":[],"label":"Home","category":"Utilities","image":"img/apps/houses.png","app":"houses"},{"job":false,"blockedJobs":[],"label":"News","category":"Other","image":"img/apps/news.png","app":"weazel"},{"blockedJobs":[],"label":"Maps","category":"Utilities","image":"img/apps/maps.png","app":"map"},{"blockedJobs":[],"label":"Safari","category":"Utilities","game":{"iframe":"https://yep.com","name":"safari","css":{"border":"none","position":"absolute","width":"100%","height":"100%","top":"0"},"rotate":false},"image":"img/apps/safari.png","app":"safari"},{"job":false,"blockedJobs":[],"label":"FaceTime","category":"Social","image":"img/apps/facetime.png","app":"facetime"}],"blur_disabled":true},"description":"Numéro de téléphone : 5949"},"name":"phone","count":1,"slot":8},{"metadata":{"job":"unicorn","societe":"Unicorn Night Club","date":"07/12/2025 22:53","issuer":"Zak Dev","payer":"Zak Dev","reason":"500","amount":5000},"name":"ticket_caisse","count":1,"slot":9},{"metadata":{"description":"POLICE 9D55ID4R","model":"POLICE","plate":"9D55ID4R"},"name":"vehiclekeys","count":1,"slot":10},{"metadata":{"description":"AMBULAN EMSJB90E","model":"AMBULAN","plate":"EMSJB90E"},"name":"vehiclekeys","count":1,"slot":11},{"name":"phone","count":1,"slot":12},{"name":"mechanic_tablet","count":1,"slot":13},{"name":"ammo-rifle","count":4659,"slot":49},{"metadata":{"shoes_1":0,"shoes_2":0},"name":"clothes_shoes","count":1,"slot":57},{"metadata":{"pants_2":0,"pants_1":0},"name":"clothes_pants","count":1,"slot":56},{"metadata":{"arms_2":0,"arms":"198_0"},"name":"clothes_arms","count":1,"slot":55},{"metadata":{"tshirt_2":0,"tshirt_1":0},"name":"clothes_tshirt","count":1,"slot":53},{"metadata":{"arms_2":0,"arms":"15_0"},"name":"clothes_arms","count":1,"slot":47},{"name":"vote","count":1,"slot":48},{"metadata":{"torso_1":0,"torso_2":0},"name":"clothes_torso","count":1,"slot":54}]', 'mechanic', 1, '[]', '{"lastPlaytime":215787,"armor":0,"jobDuty":true,"health":200}', '{"x":835.6351928710938,"heading":274.96063232421877,"z":26.836669921875,"y":-831.4417724609375}', 'Zak', 'Dev', '10/09/2001', 'm', 196, '{"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":198},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0},{"component_id":99,"texture":0,"drawable":"198_0"}],"hair":{"style":0,"color":0,"texture":0,"highlight":0},"props":[{"prop_id":0,"texture":-1,"drawable":-1},{"prop_id":1,"texture":0,"drawable":0},{"prop_id":2,"texture":-1,"drawable":-1},{"prop_id":6,"texture":-1,"drawable":-1},{"prop_id":7,"texture":-1,"drawable":-1}],"pedScale":1.0,"tattoos":[],"model":"mp_m_freemode_01","headOverlays":{"makeUp":{"style":0,"opacity":0,"secondColor":0,"color":0},"blush":{"style":0,"opacity":0,"secondColor":0,"color":0},"bodyBlemishes":{"style":0,"opacity":0,"secondColor":0,"color":0},"chestHair":{"style":0,"opacity":0,"secondColor":0,"color":0},"eyebrows":{"style":0,"opacity":0,"secondColor":0,"color":0},"sunDamage":{"style":0,"opacity":0,"secondColor":0,"color":0},"beard":{"style":0,"opacity":0,"secondColor":0,"color":0},"complexion":{"style":0,"opacity":0,"secondColor":0,"color":0},"lipstick":{"style":0,"opacity":0,"secondColor":0,"color":0},"ageing":{"style":0,"opacity":0,"secondColor":0,"color":0},"moleAndFreckles":{"style":0,"opacity":0,"secondColor":0,"color":0},"blemishes":{"style":0,"opacity":0,"secondColor":0,"color":0}},"faceFeatures":{"neckThickness":0.0,"eyeBrownHigh":0.0,"noseBoneTwist":0.0,"cheeksBoneWidth":0.0,"jawBoneBackSize":0.0,"nosePeakSize":0.0,"chinBoneLowering":0.0,"noseBoneHigh":0.0,"eyesOpening":0.0,"nosePeakLowering":0.0,"nosePeakHigh":0.0,"jawBoneWidth":0.0,"noseWidth":0.0,"cheeksBoneHigh":0.0,"lipsThickness":0.0,"chinHole":0.0,"eyeBrownForward":0.0,"chinBoneSize":0.0,"cheeksWidth":0.0,"chinBoneLenght":0.0},"eyeColor":-1,"headBlend":{"skinSecond":0,"skinFirst":0,"shape":"0_0","shapeThird":0,"thirdMix":0.0,"skin":"0_0","shapeMix":0.0,"shapeSecond":0,"shapeFirst":0,"skinThird":0,"skinMix":0.0}}', '[{"name":"hunger","val":58400,"percent":5.84},{"name":"thirst","val":168800,"percent":16.88}]', 0, 17, 0, NULL, '2025-11-27 23:56:10', '2025-12-08 19:45:25', '5971', NULL, NULL, 0, 715, NULL, NULL, NULL, '20:42 08/12/2025', '{"damages":[],"bloodType":"B+","type":"none","health":200,"armour":0}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 0, NULL, NULL, '{"placeofbirth":"Los Santos","dateofissue":"01/01/2021","dateofexpiry":"01/01/2031","nationality":"USA"}', '{"xp":0,"level":1}', '2025-12-08 19:45:25');

-- Listage de la structure de table zak. vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.vehicle_categories : ~11 rows (environ)
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupés'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');

-- Listage de la structure de table zak. vehicle_keys
CREATE TABLE IF NOT EXISTS `vehicle_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `plate` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.vehicle_keys : ~0 rows (environ)

-- Listage de la structure de table zak. vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.vehicle_sold : ~0 rows (environ)

-- Listage de la structure de table zak. vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.vehicles : ~240 rows (environ)
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 900000, 'super'),
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');

-- Listage de la structure de table zak. weazel
CREATE TABLE IF NOT EXISTS `weazel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(46) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.weazel : ~0 rows (environ)

-- Listage de la structure de table zak. whatsapp_accounts
CREATE TABLE IF NOT EXISTS `whatsapp_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `avatar` text NOT NULL DEFAULT '',
  `bio` varchar(50) NOT NULL DEFAULT '',
  `group_creator` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT current_timestamp(),
  `hide_receipts` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.whatsapp_accounts : ~0 rows (environ)

-- Listage de la structure de table zak. whatsapp_call_history
CREATE TABLE IF NOT EXISTS `whatsapp_call_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caller` int(11) NOT NULL DEFAULT 0,
  `calledId` int(11) DEFAULT NULL,
  `time` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.whatsapp_call_history : ~0 rows (environ)

-- Listage de la structure de table zak. whatsapp_call_history_users
CREATE TABLE IF NOT EXISTS `whatsapp_call_history_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT 0,
  `callId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.whatsapp_call_history_users : ~0 rows (environ)

-- Listage de la structure de table zak. whatsapp_chats
CREATE TABLE IF NOT EXISTS `whatsapp_chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL DEFAULT 0,
  `receiver` int(11) NOT NULL DEFAULT 0,
  `wallpaper` text DEFAULT NULL,
  `isGroup` varchar(50) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.whatsapp_chats : ~0 rows (environ)

-- Listage de la structure de table zak. whatsapp_group_admins
CREATE TABLE IF NOT EXISTS `whatsapp_group_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT 0,
  `groupId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.whatsapp_group_admins : ~0 rows (environ)

-- Listage de la structure de table zak. whatsapp_group_members
CREATE TABLE IF NOT EXISTS `whatsapp_group_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT 0,
  `groupId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.whatsapp_group_members : ~0 rows (environ)

-- Listage de la structure de table zak. whatsapp_status
CREATE TABLE IF NOT EXISTS `whatsapp_status` (
  `userId` int(11) NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table zak.whatsapp_status : ~0 rows (environ)

-- Listage de la structure de table zak. whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `identifier` varchar(60) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table zak.whitelist : ~0 rows (environ)

-- Listage de la structure de table zak. zdrugs_logs
CREATE TABLE IF NOT EXISTS `zdrugs_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(60) NOT NULL,
  `action` varchar(100) NOT NULL,
  `drug_type` varchar(50) NOT NULL,
  `details` text DEFAULT NULL,
  `timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player` (`player`),
  KEY `action` (`action`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.zdrugs_logs : ~0 rows (environ)

-- Listage de la structure de table zak. zdrugs_plants
CREATE TABLE IF NOT EXISTS `zdrugs_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(60) NOT NULL,
  `drug_type` varchar(50) NOT NULL,
  `coords` text NOT NULL,
  `growth_state` int(11) NOT NULL DEFAULT 0,
  `growth_percent` float NOT NULL DEFAULT 0,
  `watered` tinyint(1) NOT NULL DEFAULT 0,
  `fertilized` tinyint(1) NOT NULL DEFAULT 0,
  `planted_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL,
  `ready_for_harvest` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `drug_type` (`drug_type`),
  KEY `planted_at` (`planted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table zak.zdrugs_plants : ~0 rows (environ)

-- Listage de la structure de déclencheur zak. instagram_decrement_comment_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `instagram_decrement_comment_count` AFTER DELETE ON `instagram_post_comments` FOR EACH ROW BEGIN
    UPDATE instagram_posts SET commentCount = commentCount + 1 WHERE id = OLD.postId;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. instagram_increment_comment_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `instagram_increment_comment_count` AFTER INSERT ON `instagram_post_comments` FOR EACH ROW BEGIN
    UPDATE instagram_posts SET commentCount = commentCount + 1 WHERE id = NEW.postId;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_instagram_decrement_comment_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_decrement_comment_count
AFTER DELETE ON phone_instagram_comments
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_posts
    SET comment_count = comment_count - 1
    WHERE id = OLD.post_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_instagram_decrement_like_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_decrement_like_count
AFTER DELETE ON phone_instagram_likes
FOR EACH ROW
BEGIN
    IF OLD.is_comment = 0 THEN
        UPDATE phone_instagram_posts
        SET like_count = like_count - 1
        WHERE id = OLD.id;
    ELSE
        UPDATE phone_instagram_comments
        SET like_count = like_count - 1
        WHERE id = OLD.id;
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_instagram_decrement_post_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_decrement_post_count
AFTER DELETE ON phone_instagram_posts
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET post_count = post_count - 1
    WHERE username = OLD.username;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_instagram_decrement_story_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_decrement_story_count
AFTER DELETE ON phone_instagram_stories
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET story_count = story_count - 1
    WHERE username = OLD.username;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_instagram_increment_comment_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_increment_comment_count
AFTER INSERT ON phone_instagram_comments
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_posts
    SET comment_count = comment_count + 1
    WHERE id = NEW.post_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_instagram_increment_like_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_increment_like_count
AFTER INSERT ON phone_instagram_likes
FOR EACH ROW
BEGIN
    IF NEW.is_comment = 0 THEN
        UPDATE phone_instagram_posts
        SET like_count = like_count + 1
        WHERE id = NEW.id;
    ELSE
        UPDATE phone_instagram_comments
        SET like_count = like_count + 1
        WHERE id = NEW.id;
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_instagram_increment_post_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_increment_post_count
AFTER INSERT ON phone_instagram_posts
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET post_count = post_count + 1
    WHERE username = NEW.username;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_instagram_increment_story_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_increment_story_count
AFTER INSERT ON phone_instagram_stories
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET story_count = story_count + 1
    WHERE username = NEW.username;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_instagram_update_counts_after_follow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_update_counts_after_follow
AFTER INSERT ON phone_instagram_follows
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET follower_count = follower_count + 1
    WHERE username = NEW.followed;

    UPDATE phone_instagram_accounts
    SET following_count = following_count + 1
    WHERE username = NEW.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_instagram_update_counts_after_unfollow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_instagram_update_counts_after_unfollow
AFTER DELETE ON phone_instagram_follows
FOR EACH ROW
BEGIN
    UPDATE phone_instagram_accounts
    SET follower_count = follower_count - 1
    WHERE username = OLD.followed;

    UPDATE phone_instagram_accounts
    SET following_count = following_count - 1
    WHERE username = OLD.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_tiktok_decrement_account_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_decrement_account_likes
AFTER DELETE ON phone_tiktok_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_accounts
    JOIN phone_tiktok_videos ON phone_tiktok_videos.username = phone_tiktok_accounts.username
    SET phone_tiktok_accounts.like_count = phone_tiktok_accounts.like_count - 1
    WHERE phone_tiktok_videos.id = OLD.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_tiktok_decrement_comment_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_decrement_comment_likes
AFTER DELETE ON phone_tiktok_comments_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_comments
    SET likes = likes - 1
    WHERE id = OLD.comment_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_tiktok_decrement_video_comments
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_decrement_video_comments
BEFORE DELETE ON phone_tiktok_comments
FOR EACH ROW
BEGIN
    DECLARE v_replies_count INT;

    -- Count the replies for the comment
    SELECT COUNT(*) INTO v_replies_count
    FROM phone_tiktok_comments
    WHERE reply_to = OLD.id;

    -- Update the video's comments count
    UPDATE phone_tiktok_videos
    SET comments = comments - (1 + v_replies_count)
    WHERE id = OLD.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_tiktok_decrement_video_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_decrement_video_likes
AFTER DELETE ON phone_tiktok_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET likes = likes - 1
    WHERE id = OLD.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_tiktok_decrement_video_saves
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_decrement_video_saves
AFTER DELETE ON phone_tiktok_saves
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET saves = saves - 1
    WHERE id = OLD.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_tiktok_increment_account_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_account_likes
AFTER INSERT ON phone_tiktok_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_accounts
    JOIN phone_tiktok_videos ON phone_tiktok_videos.username = phone_tiktok_accounts.username
    SET phone_tiktok_accounts.like_count = phone_tiktok_accounts.like_count + 1
    WHERE phone_tiktok_videos.id = NEW.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_tiktok_increment_comment_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_comment_likes
AFTER INSERT ON phone_tiktok_comments_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_comments
    SET likes = likes + 1
    WHERE id = NEW.comment_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_tiktok_increment_video_comments
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_video_comments
AFTER INSERT ON phone_tiktok_comments
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET comments = comments + 1
    WHERE id = NEW.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_tiktok_increment_video_count
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_video_count
AFTER INSERT ON phone_tiktok_videos
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_accounts
    SET video_count = video_count + 1
    WHERE username = NEW.username;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_tiktok_increment_video_likes
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_video_likes
AFTER INSERT ON phone_tiktok_likes
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET likes = likes + 1
    WHERE id = NEW.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_tiktok_increment_video_saves
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_video_saves
AFTER INSERT ON phone_tiktok_saves
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET saves = saves + 1
    WHERE id = NEW.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_tiktok_increment_video_views
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_increment_video_views
AFTER INSERT ON phone_tiktok_views
FOR EACH ROW
BEGIN
    UPDATE phone_tiktok_videos
    SET views = views + 1
    WHERE id = NEW.video_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_tiktok_update_counts_after_follow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_update_counts_after_follow
AFTER INSERT ON phone_tiktok_follows
FOR EACH ROW
BEGIN
    -- Increment the follower_count for the followed user
    UPDATE phone_tiktok_accounts
    SET follower_count = follower_count + 1
    WHERE username = NEW.followed;

    -- Increment the following_count for the follower user
    UPDATE phone_tiktok_accounts
    SET following_count = following_count + 1
    WHERE username = NEW.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_tiktok_update_counts_after_unfollow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_update_counts_after_unfollow
AFTER DELETE ON phone_tiktok_follows
FOR EACH ROW
BEGIN
    -- Decrement the follower_count for the followed user
    UPDATE phone_tiktok_accounts
    SET follower_count = follower_count - 1
    WHERE username = OLD.followed;

    -- Decrement the following_count for the follower user
    UPDATE phone_tiktok_accounts
    SET following_count = following_count - 1
    WHERE username = OLD.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_tiktok_update_last_message
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_tiktok_update_last_message
AFTER INSERT ON phone_tiktok_messages
FOR EACH ROW
BEGIN
    DECLARE modified_content TEXT CHARACTER SET utf8mb4;

    IF NEW.content LIKE '<!SHARED-VIDEO-URL%' THEN
        SET modified_content = 'Shared a video';
    ELSEIF LENGTH(NEW.content) > 50 THEN
        SET modified_content = CONCAT(SUBSTR(NEW.content, 1, 17), '...');
    ELSE
        SET modified_content = NEW.content;
    END IF;

    UPDATE phone_tiktok_channels
    SET last_message = modified_content
    WHERE id = NEW.channel_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_twitter_update_counts_after_follow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_counts_after_follow
AFTER INSERT ON phone_twitter_follows
FOR EACH ROW
BEGIN
    -- Increment the follower_count for the followed user
    UPDATE phone_twitter_accounts
    SET follower_count = follower_count + 1
    WHERE username = NEW.followed;

    -- Increment the following_count for the follower user
    UPDATE phone_twitter_accounts
    SET following_count = following_count + 1
    WHERE username = NEW.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_twitter_update_counts_after_unfollow
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_counts_after_unfollow
AFTER DELETE ON phone_twitter_follows
FOR EACH ROW
BEGIN
    -- Decrement the follower_count for the followed user
    UPDATE phone_twitter_accounts
    SET follower_count = follower_count - 1
    WHERE username = OLD.followed;

    -- Decrement the following_count for the follower user
    UPDATE phone_twitter_accounts
    SET following_count = following_count - 1
    WHERE username = OLD.follower;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_twitter_update_like_count_after_like
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_like_count_after_like
AFTER INSERT ON phone_twitter_likes
FOR EACH ROW
BEGIN
    UPDATE phone_twitter_tweets
    SET like_count = like_count + 1
    WHERE id = NEW.tweet_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_twitter_update_like_count_after_unlike
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_like_count_after_unlike
AFTER DELETE ON phone_twitter_likes
FOR EACH ROW
BEGIN
    UPDATE phone_twitter_tweets
    SET like_count = like_count - 1
    WHERE id = OLD.tweet_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_twitter_update_retweet_count_after_retweet
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_retweet_count_after_retweet
AFTER INSERT ON phone_twitter_retweets
FOR EACH ROW
BEGIN
    UPDATE phone_twitter_tweets
    SET retweet_count = retweet_count + 1
    WHERE id = NEW.tweet_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur zak. phone_twitter_update_retweet_count_after_unretweet
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER IF NOT EXISTS phone_twitter_update_retweet_count_after_unretweet
AFTER DELETE ON phone_twitter_retweets
FOR EACH ROW
BEGIN
    UPDATE phone_twitter_tweets
    SET retweet_count = retweet_count - 1
    WHERE id = OLD.tweet_id;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
