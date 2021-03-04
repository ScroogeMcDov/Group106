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
-- Table structure for table `GuideRegistrations`
--

CREATE TABLE `GuideRegistrations` (
  `userID` int(11) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `zipCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GuideRegistrations`
--

INSERT INTO `GuideRegistrations` (`userID`, `lastName`, `firstName`, `password`, `email`, `zipCode`) VALUES
(1, 'Ryan', 'Davis', '8583495076', '2235@gmail.com', 1234),
(2, 'Ryan', 'Davis', '8583495076', '2235@gmail.com', 1234),
(3, 'Ryan', 'Davis', '8583495076', '2235@gmail.com', 1234),
(4, 'Ryan', 'Davis', '8583495076', '2235@gmail.com', 1234),
(5, 'Freckle', 'Balthazar', '2342342355', '2@gmail.com', 2343);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `GuideRegistrations`
--
ALTER TABLE `GuideRegistrations`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `GuideRegistrations`
--
ALTER TABLE `GuideRegistrations`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
