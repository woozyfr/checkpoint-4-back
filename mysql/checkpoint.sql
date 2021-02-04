-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Listage de la structure de la table checkpoint. bars
CREATE TABLE IF NOT EXISTS `bars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `secret_code` varchar(128) DEFAULT NULL,
  `description` text,
  `code_postal` varchar(8) DEFAULT NULL,
  `address` varchar(196) DEFAULT NULL,
  `longitude` varchar(128) DEFAULT NULL,
  `latitude` varchar(128) DEFAULT NULL,
  `is_beer` int(1) DEFAULT NULL,
  `is_vodka` int(1) DEFAULT NULL,
  `is_whisky` int(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Listage des données de la table checkpoint.bars : ~4 rows (environ)
/*!40000 ALTER TABLE `bars` DISABLE KEYS */;
INSERT INTO `bars` (`id`, `name`, `city`, `secret_code`, `description`, `code_postal`, `address`, `longitude`, `latitude`, `is_beer`, `is_vodka`, `is_whisky`, `created_at`, `updated_at`) VALUES
	(9, 'Coconuts', 'Marseille', NULL, 'Petit bar sympas avec de bonnes biere', '13006', '87 rue de la Palud', '5.38079156', '43.29172391', 0, 1, 0, '2021-02-03 11:45:46', '2021-01-03 11:45:46'),
	(10, 'Buns Bar', 'Marseille', 'cigarito', 'Bar a whisky et gros cigar', '13006', '2 rue d\'italie', '5.381488', '43.2907399', 1, 1, 0, '2021-02-03 11:45:46', '2021-02-03 11:45:46'),
	(11, 'Fucking Blue Boys', 'Marseille', 'moustache', 'Petit bar a moustache', '13006', '11 rue Saint-Jaque', '5.3808130', '43.28909214', 1, 0, 1, '2021-02-03 11:45:46', '2021-01-03 11:45:46'),
	(12, 'Miguelito bario', 'Bassan', 'IVO', 'Petit bar portuGay', '34290', '1 place du chateau', '3.253435535', '43.410799682', NULL, NULL, NULL, '2021-02-03 11:45:46', '2021-02-03 11:45:46');
/*!40000 ALTER TABLE `bars` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
