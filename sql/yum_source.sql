# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Database: yum_source
# Generation Time: 2018-03-14 13:36:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table standard
# ------------------------------------------------------------

DROP TABLE IF EXISTS `standard`;

CREATE TABLE `standard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `node_field__uuid__value` (`uuid`),
  KEY `node_field__type__target_id` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for node entities.';

LOCK TABLES `standard` WRITE;
/*!40000 ALTER TABLE `standard` DISABLE KEYS */;

INSERT INTO `standard` (`id`, `title`, `type`, `uuid`, `langcode`)
VALUES
	(1,'Kitchen Sink','standard','b782487e-e4bb-42fa-9c6e-2cb80bd45366','en'),
	(2,'Double Down','standard','63f1c648-4f82-4012-a4a7-4779841c2464','en');

/*!40000 ALTER TABLE `standard` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table standard_body
# ------------------------------------------------------------

DROP TABLE IF EXISTS `standard_body`;

CREATE TABLE `standard_body` (
  `standard_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `standard_item_id` int(10) unsigned NOT NULL COMMENT 'The ID of the target entity.',
  PRIMARY KEY (`standard_id`,`delta`),
  KEY `field_body_target_id` (`standard_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data storage for node field field_body.';

LOCK TABLES `standard_body` WRITE;
/*!40000 ALTER TABLE `standard_body` DISABLE KEYS */;

INSERT INTO `standard_body` (`standard_id`, `delta`, `standard_item_id`)
VALUES
	(1,0,1),
	(1,1,2),
	(1,2,3),
	(1,3,4),
	(1,4,5),
	(1,5,6),
	(1,6,7),
	(1,7,8),
	(1,8,9),
	(1,9,10),
	(1,10,11),
	(1,11,12),
	(1,12,13),
	(1,13,14),
	(1,14,15),
	(2,0,16),
	(2,1,17),
	(2,2,18),
	(2,3,19),
	(2,4,20),
	(2,5,21),
	(2,6,22),
	(2,7,23),
	(2,8,24),
	(2,9,25),
	(2,10,26),
	(2,11,27),
	(2,12,28),
	(2,13,29),
	(2,14,30),
	(2,15,31),
	(2,16,32),
	(2,17,33),
	(2,18,34),
	(2,19,35),
	(2,20,36),
	(2,21,37),
	(2,22,38),
	(2,23,39),
	(2,24,40),
	(2,25,41),
	(2,26,42),
	(2,27,43),
	(2,28,44),
	(2,29,45),
	(2,30,46),
	(2,31,47),
	(2,32,48),
	(2,33,49),
	(2,34,50),
	(2,35,51),
	(2,36,52),
	(2,37,53),
	(2,38,54),
	(2,39,55),
	(2,40,56),
	(2,41,57),
	(2,42,58),
	(2,43,59),
	(2,44,60),
	(2,45,61),
	(2,46,62),
	(2,47,63),
	(2,48,64),
	(2,49,65),
	(2,50,66),
	(2,51,67),
	(2,52,68),
	(2,53,69),
	(2,54,70),
	(2,55,71),
	(2,56,72),
	(2,57,73),
	(2,58,74),
	(2,59,75),
	(2,60,76),
	(2,61,77),
	(2,62,78),
	(2,63,79),
	(2,64,80),
	(2,65,81),
	(2,66,82),
	(2,67,83),
	(2,68,84),
	(2,69,85),
	(2,70,86),
	(2,71,87),
	(2,72,88),
	(2,73,89),
	(2,74,90),
	(2,75,91),
	(2,76,92),
	(2,77,93),
	(3,0,94),
	(4,0,95),
	(5,0,96);

/*!40000 ALTER TABLE `standard_body` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table standard_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `standard_item`;

CREATE TABLE `standard_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  PRIMARY KEY (`id`),
  KEY `paragraph_field__type__target_id` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for paragraph entities.';

LOCK TABLES `standard_item` WRITE;
/*!40000 ALTER TABLE `standard_item` DISABLE KEYS */;

INSERT INTO `standard_item` (`id`, `type`)
VALUES
	(13,'audio'),
	(4,'callout'),
	(5,'callout'),
	(6,'callout'),
	(7,'callout'),
	(23,'callout'),
	(24,'callout'),
	(25,'callout'),
	(26,'callout'),
	(27,'callout'),
	(35,'callout'),
	(37,'callout'),
	(41,'callout'),
	(43,'callout'),
	(53,'callout'),
	(75,'callout'),
	(78,'callout'),
	(79,'callout'),
	(88,'callout'),
	(93,'callout'),
	(12,'document'),
	(1,'heading'),
	(3,'heading'),
	(8,'heading'),
	(16,'heading'),
	(17,'heading'),
	(19,'heading'),
	(22,'heading'),
	(28,'heading'),
	(29,'heading'),
	(30,'heading'),
	(32,'heading'),
	(34,'heading'),
	(38,'heading'),
	(45,'heading'),
	(48,'heading'),
	(51,'heading'),
	(55,'heading'),
	(58,'heading'),
	(61,'heading'),
	(64,'heading'),
	(67,'heading'),
	(73,'heading'),
	(76,'heading'),
	(80,'heading'),
	(81,'heading'),
	(83,'heading'),
	(85,'heading'),
	(87,'heading'),
	(89,'heading'),
	(91,'heading'),
	(9,'image'),
	(40,'image'),
	(44,'image'),
	(47,'image'),
	(50,'image'),
	(54,'image'),
	(57,'image'),
	(60,'image'),
	(63,'image'),
	(66,'image'),
	(69,'image'),
	(71,'image'),
	(10,'list_ordered'),
	(11,'list_unordered'),
	(39,'list_unordered'),
	(65,'list_unordered'),
	(15,'table'),
	(21,'table'),
	(82,'table'),
	(84,'table'),
	(86,'table'),
	(90,'table'),
	(92,'table'),
	(2,'text'),
	(18,'text'),
	(20,'text'),
	(31,'text'),
	(33,'text'),
	(36,'text'),
	(42,'text'),
	(46,'text'),
	(49,'text'),
	(52,'text'),
	(56,'text'),
	(59,'text'),
	(62,'text'),
	(68,'text'),
	(70,'text'),
	(72,'text'),
	(74,'text'),
	(77,'text'),
	(94,'text'),
	(95,'text'),
	(96,'text'),
	(14,'video');

/*!40000 ALTER TABLE `standard_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table standard_item_text
# ------------------------------------------------------------

DROP TABLE IF EXISTS `standard_item_text`;

CREATE TABLE `standard_item_text` (
  `id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data storage for paragraph field field_paragraph_body.';

LOCK TABLES `standard_item_text` WRITE;
/*!40000 ALTER TABLE `standard_item_text` DISABLE KEYS */;

INSERT INTO `standard_item_text` (`id`, `value`)
VALUES
	(2,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n'),
	(18,'<p>The Double Down is a delicious combination of two Original Recipe Filets, Pepper Jack and Monterey Jack cheeses, Colonel’s Sauce and bacon.</p>\r\n'),
	(20,'<p>Gather smallwares before assembling the Double Down.</p>\r\n'),
	(31,'<p>For more information on preparing Original Recipe® Filets, see Original Recipe® Filet procedures.</p>\r\n'),
	(33,'<p>For more information on preparing Bacon Slices, Pepper Jack and Monterey Jack cheeses and Colonel\'s Sauce, see the Prepping Ingredients procedure.</p>\r\n'),
	(36,'<p>Using tongs, the sandwich maker can move filets from the upright holding cabinet onto the empty side of the half rack in the warmer or to the sandwich assembly area located at or near the sandwich assembly area. If moving a microwaveable pan of filets, use clean, dry yellow towels.</p>\r\n'),
	(42,'<p>Place filets side by side on spatula with the thin ends of each filet pointing towards you.</p>\r\n'),
	(46,'<p>Using the squeeze bottle, make a stripe of Colonel\'s Sauce that is pencil width thick (1/4 oz.) down the middle of filet furthest from the handle.</p>\r\n'),
	(49,'<p>Add 1 slice of Pepper Jack cheese to filet with sauce. When placed correctly, cheese will be diamond-shaped on filet.</p>\r\n'),
	(52,'<p>Place 2 half slices (1 full slice broken in half) of bacon on top of Pepper Jack cheese.</p>\r\n'),
	(56,'<p>Add 1 slice of Monterey Jack cheese on top of bacon. When placed correctly, cheese will be diamond-shaped on filet.</p>\r\n'),
	(59,'<p>Using the squeeze bottle, make a stripe of Colonel\'s Sauce that is pencil width thick (1/4 oz.) down the middle of the Monterey Jack cheese.</p>\r\n'),
	(62,'<p>Using tongs, place second filet on top of Monterey Jack cheese. When placing second filet, make sure both filets are lined up thin end to thin end.</p>\r\n'),
	(68,'<p>Double Down sandwiches should be packed in a Clamshell. Place Double Down (in pocket) in clamshell. Make sure clamshell is properly closed to avoid clamshell from coming open in bag.</p>\r\n'),
	(70,'<p>Place clamshell flat into a #12 bag to avoid Double Down from moving around in clamshell.</p>\r\n'),
	(72,'<p>When packing combos, place side item in #12 bag. If packing wedges, place them standing up next to clamshell. For all other sides, place on top of clamshell.</p>\r\n'),
	(74,'<p>Build multiple Down Down sandwiches by using the same assembly method as building 1 Double Down. Assemble up to 4 Double Down sandwiches on a wire half rack and half size sheet pan, cutting board, or other clean and sanitized surface. Using spatula, transfer fully assembled Double Down to Double Down pocket.</p>\r\n'),
	(77,'<p>Make Double Down to order and serve. DO NOT hold for 10 minutes.</p>\r\n'),
	(94,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n'),
	(95,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n'),
	(96,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n');

/*!40000 ALTER TABLE `standard_item_text` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
