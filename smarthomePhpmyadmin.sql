-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2019 at 05:09 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smarthome`
--
CREATE DATABASE IF NOT EXISTS `smarthome` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `smarthome`;

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `UserID` int(11) NOT NULL,
  `SwitchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `access`
--

TRUNCATE TABLE `access`;
-- --------------------------------------------------------

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `EName` varchar(255) NOT NULL,
  `EndpointIP` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `area`
--

TRUNCATE TABLE `area`;
--
-- Dumping data for table `area`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `switch`
--

DROP TABLE IF EXISTS `switch`;
CREATE TABLE `switch` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `EName` varchar(255) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `AreaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `switch`
--

TRUNCATE TABLE `switch`;
--
-- Dumping data for table `switch`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `user`
--

TRUNCATE TABLE `user`;
--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `Name`, `Password`, `Token`) VALUES
(1, 'MaxLye', 'MaxLye934512', 'abc123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD KEY `SwitchID` (`SwitchID`),
  ADD KEY `UserID` (`UserID`) USING BTREE;

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `switch`
--
ALTER TABLE `switch`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AreaID` (`AreaID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `switch`
--
ALTER TABLE `switch`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access`
--
ALTER TABLE `access`
  ADD CONSTRAINT `access_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `access_ibfk_2` FOREIGN KEY (`SwitchID`) REFERENCES `switch` (`ID`);

--
-- Constraints for table `switch`
--
ALTER TABLE `switch`
  ADD CONSTRAINT `switch_ibfk_1` FOREIGN KEY (`AreaID`) REFERENCES `area` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
