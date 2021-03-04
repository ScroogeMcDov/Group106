-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 04, 2021 at 06:20 PM
-- Server version: 10.4.17-MariaDB-log
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_shermado`
--

-- --------------------------------------------------------

--
-- Table structure for table `GuideClimates`
--

CREATE TABLE `GuideClimates` (
  `userID` int(11) NOT NULL,
  `locationID` int(11) DEFAULT NULL,
  `climate` varchar(255) DEFAULT NULL,
  `temperature` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GuideClimates`
--

INSERT INTO `GuideClimates` (`userID`, `locationID`, `climate`, `temperature`) VALUES
(2, 2, 'Highlands', 41),
(3, 3, 'Subtropical', 50),
(1, 1, 'Polar', 23),
(4, 4, 'Temperate', 2),
(5, 5, 'Tropical', 23);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `GuideClimates`
--
ALTER TABLE `GuideClimates`
  ADD KEY `userID` (`userID`),
  ADD KEY `locationID` (`locationID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `GuideClimates`
--
ALTER TABLE `GuideClimates`
  ADD CONSTRAINT `GuideClimates_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `GuideRegistrations` (`userID`),
  ADD CONSTRAINT `GuideClimates_ibfk_2` FOREIGN KEY (`locationID`) REFERENCES `GuideLocations` (`locationID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
