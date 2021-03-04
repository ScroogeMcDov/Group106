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
-- Table structure for table `GuideLocations`
--

CREATE TABLE `GuideLocations` (
  `locationID` int(11) NOT NULL,
  `zipCode` int(11) NOT NULL,
  `dateID` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GuideLocations`
--

INSERT INTO `GuideLocations` (`locationID`, `zipCode`, `dateID`) VALUES
(1, 1234, '2020-11-09'),
(2, 1234, '2020-12-09'),
(3, 1234, '2020-12-09'),
(4, 2832, '2021-03-04'),
(5, 1234, '2021-03-11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `GuideLocations`
--
ALTER TABLE `GuideLocations`
  ADD PRIMARY KEY (`locationID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
