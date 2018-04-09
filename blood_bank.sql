-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2018 at 02:38 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
 
--
-- Database: `blood_bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood`
--

CREATE TABLE `blood` (
  `blood_id` int(11) NOT NULL,
  `blood` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='data of all available blood group';

--
-- Dumping data for table `blood`
--

INSERT INTO `blood` (`blood_id`, `blood`, `detail`, `status`) VALUES
(1, 'A+', '', 1),
(2, 'A-', '', 1),
(3, 'B+', '', 1),
(4, 'B-', '', 1),
(5, 'AB+', '', 1),
(6, 'AB-', '', 1),
(7, 'O+', '', 1),
(8, 'O-', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospital_id` int(11) NOT NULL,
  `hospital_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `datetime` datetime NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='store the details of hospital data';

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hospital_id`, `hospital_name`, `username`, `password`, `mobile`, `datetime`, `status`) VALUES
(1, 'Apolo', 'ApoloApolo', 'ApoloApolo', 1234556790, '2018-04-07 17:05:06', 1),
(2, 'AIMS', 'AIMS', 'AIMSAIMS', 1234123412, '2018-04-07 17:05:35', 1),
(3, 'Fortis', 'Fortis', 'FortisFortis', 1234512345, '2018-04-07 17:06:07', 1),
(4, 'Max', 'MaxMax', 'MaxMax', 1231231231, '2018-04-07 17:07:34', 1),
(5, 'medifee', 'medifee', 'medifee', 1234123412, '2018-04-07 17:15:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `blood_id` int(11) NOT NULL,
  `volume` int(11) NOT NULL COMMENT 'in ml',
  `datetime` datetime NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='request detail by user to the hospital';

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`request_id`, `user_id`, `hospital_id`, `blood_id`, `volume`, `datetime`, `status`) VALUES
(1, 4, 4, 2, 50, '2018-04-07 17:27:21', 1),
(2, 5, 4, 1, 100, '2018-04-07 17:40:25', 1),
(3, 5, 1, 4, 100, '2018-04-07 17:40:32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `blood_id` int(11) NOT NULL,
  `volume` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='blood stock available in the hospital';

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `hospital_id`, `blood_id`, `volume`, `status`) VALUES
(1, 4, 1, 200, 1),
(2, 4, 2, 200, 1),
(3, 4, 3, 2003, 1),
(4, 1, 7, 333, 1),
(5, 1, 5, 3332, 1),
(6, 1, 4, 33321, 1),
(7, 3, 4, 444, 1),
(8, 3, 6, 1332, 1),
(9, 3, 3, 444, 1),
(10, 3, 7, 444, 1),
(11, 5, 5, 78, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `blood_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `datetime` datetime NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='all data of reciever';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `blood_id`, `first_name`, `last_name`, `username`, `password`, `mobile`, `datetime`, `status`) VALUES
(1, 1, 'aaaaaaaaa', 'aaaaaaaaa', 'aaaaaaaaa', 'aaaaaaaaa', 1234567890, '2018-04-07 17:03:39', 1),
(2, 2, 'aaaaaaaaa2', 'aaaaaaaaa2', 'aaaaaaaaa2', 'aaaaaaaaa', 1234123412, '2018-04-07 17:04:12', 1),
(3, 5, 'aaaaaaaaa3', 'aaaaaaaaa3', 'aaaaaaaaa3', 'aaaaaaaaa', 1234123412, '2018-04-07 17:04:38', 1),
(4, 7, 'Maaz', 'Maaz', 'MaazMaaz', 'MaazMaaz', 1234123412, '2018-04-07 17:17:05', 1),
(5, 5, 'maazsofttech', 'maazsofttech', 'maazsofttech', 'maazsofttech', 1234123412, '2018-04-07 17:40:08', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood`
--
ALTER TABLE `blood`
  ADD PRIMARY KEY (`blood_id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospital_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blood`
--
ALTER TABLE `blood`
  MODIFY `blood_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospital_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
