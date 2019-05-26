-- --------------------------------------------------------
-- Host:                         192.168.31.16
-- Server version:               10.1.38-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for smarthome
DROP DATABASE IF EXISTS `smarthome`;
CREATE DATABASE IF NOT EXISTS `smarthome` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `smarthome`;

-- Dumping structure for table smarthome.access
DROP TABLE IF EXISTS `access`;
CREATE TABLE IF NOT EXISTS `access` (
  `UserID` int(11) NOT NULL,
  `SwitchID` int(11) NOT NULL,
  KEY `SwitchID` (`SwitchID`),
  KEY `UserID` (`UserID`) USING BTREE,
  CONSTRAINT `access_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`),
  CONSTRAINT `access_ibfk_2` FOREIGN KEY (`SwitchID`) REFERENCES `switch` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table smarthome.access: ~0 rows (approximately)
DELETE FROM `access`;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
/*!40000 ALTER TABLE `access` ENABLE KEYS */;

-- Dumping structure for table smarthome.area
DROP TABLE IF EXISTS `area`;
CREATE TABLE IF NOT EXISTS `area` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `EName` varchar(255) NOT NULL,
  `EndpointIP` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table smarthome.area: ~10 rows (approximately)
DELETE FROM `area`;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` (`ID`, `Name`, `EName`, `EndpointIP`) VALUES
	(1, '客廳', 'livingroom', '962d26a4.ngrok.io'),
	(2, '廚房', 'kitchen', '192.168.1.102'),
	(3, '飯廳', 'diningroom', '192.168.1.103'),
	(4, '大房', 'room1', '192.168.1.104'),
	(5, '小房', 'room2', '192.168.1.105'),
	(6, '走廊', 'walkway', '192.168.1.106'),
	(7, '茶房', 'guestroom', '192.168.1.107'),
	(8, '公浴室', 'privatebathroom', '192.168.1.108'),
	(9, '私浴室', 'publicbathroom', '192.168.1.109'),
	(10, '儲藏室', 'storeroom', '192.168.1.110');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;

-- Dumping structure for table smarthome.switch
DROP TABLE IF EXISTS `switch`;
CREATE TABLE IF NOT EXISTS `switch` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `EName` varchar(255) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `AreaID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AreaID` (`AreaID`),
  CONSTRAINT `switch_ibfk_1` FOREIGN KEY (`AreaID`) REFERENCES `area` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- Dumping data for table smarthome.switch: ~39 rows (approximately)
DELETE FROM `switch`;
/*!40000 ALTER TABLE `switch` DISABLE KEYS */;
INSERT INTO `switch` (`ID`, `Name`, `EName`, `Status`, `AreaID`) VALUES
	(1, '壁燈1', 'light1', 0, 1),
	(2, '壁燈2', 'light2', 0, 1),
	(3, '壁燈3', 'light3', 0, 1),
	(4, '電視組', 'tvset', 0, 1),
	(5, '壁扇', 'fan', 0, 1),
	(6, '空調', 'aircon', 1, 1),
	(7, '壁燈1', 'light1', 0, 2),
	(8, '壁燈2', 'light2', 0, 2),
	(9, '壁燈3', 'light3', 0, 2),
	(10, '抽油煙機', 'oilsucker', 0, 2),
	(11, '瓦斯', 'gas', 1, 2),
	(12, '壁燈1', 'light1', 0, 3),
	(13, '壁燈2', 'light2', 0, 3),
	(14, '桌上燈', 'tablelight', 0, 3),
	(15, '壁扇', 'fan', 0, 3),
	(16, '壁灯1', 'light1', 0, 4),
	(17, '壁燈2', 'light2', 0, 4),
	(18, '空調', 'aircon', 0, 4),
	(19, '梳妝台燈', 'makeuplight', 0, 4),
	(20, '床燈', 'bedlight', 0, 4),
	(21, '更衣室', 'fittingroom', 0, 4),
	(22, '桌凳', 'light', 0, 5),
	(23, '壁燈', 'light', 0, 5),
	(24, '壁扇', 'fan', 0, 5),
	(25, '空調', 'aircon', 0, 5),
	(26, '更衣室', 'fittingroom', 0, 5),
	(27, '頂燈1', 'light1', 1, 6),
	(28, '頂燈2', 'light2', 1, 6),
	(29, '壁燈1', 'light1', 0, 7),
	(30, '壁燈2', 'light2', 0, 7),
	(31, '壁扇', 'fan', 0, 7),
	(32, '空調', 'aircon', 0, 7),
	(33, '浴盆燈', 'bathroomlight', 0, 8),
	(34, '抽風機', 'vacum', 0, 8),
	(35, '壁燈', 'light', 0, 8),
	(36, '壁燈', 'light', 0, 9),
	(37, '浴盆燈', 'bathroomlight', 0, 9),
	(38, '抽風機', 'vacum', 0, 9),
	(39, '壁燈', 'light', 0, 10);
/*!40000 ALTER TABLE `switch` ENABLE KEYS */;

-- Dumping structure for table smarthome.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Token` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table smarthome.user: ~0 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`ID`, `Name`, `Password`, `Token`) VALUES
	(1, 'MaxLye', 'MaxLye934512', 'abc123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
