-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2019 at 12:20 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gopedal`
--

-- --------------------------------------------------------

--
CREATE TABLE `addresses` (
  `address_id` int(11) PRIMARY KEY NOT NULL,
  `house_no` int(11) DEFAULT NULL,
  `road_no` int(11) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `postal_code` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `house_no`, `road_no`, `area`, `postal_code`) VALUES
(101, 12, 17, 'Dhaka GPO', '1200'),
(102, 12, 8, 'Mirpur', '1216'),
(103, 17, 13, 'Uttara', '1231'),
(104, 15, 10, 'Kafrul', '1206'),
(105, 10, 2, 'Dhaka Cantonment', '1206'),
(106, 21, 1, 'Wari', '1203'),
(107, 23, 19, 'Khilgoad', '1219'),
(108, 15, 15, 'Dhanmondi', '1219'),
(109, 1, 11, 'Basabo', '1214'),
(110, 9, 16, 'Banani', '1213');

-- Table structure for table `customers`
--


CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone_no` char(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `nid_number` varchar(15) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `date_of_birth`, `email`, `phone_no`, `address_id`, `nid_number`, `pass`) VALUES
(100001, 'Tamim', 'Iqbal', '1990-12-16', 'aaa@gmail.com', '01900000000', 107, NULL, 'tam'),
(100002, 'Liton', 'Das', '1992-11-01', 'bbb@gmail.com', '01900000002', 106, NULL, 'lit'),
(100003, 'Soumyo', 'Sarkar', '1992-10-11', 'ccc@gmail.com', '01900000003', 101, NULL, 'sou'),
(100004, 'Imrul', 'Kayes', '1990-05-01', 'ddd@gmail.com', '01900000004', 102, NULL, 'imr'),
(100005, 'Musfiquer', 'Rahim', '1988-07-20', 'eee@gmail.com', '01900000005', 105, NULL, 'mus'),
(100006, 'Sakib', 'Al-Hasan', '1985-09-30', 'fff@gmail.com', '01900000006', 103, NULL, 'sak'),
(100007, 'Mashrafee', 'Bin-Mortuza', '1984-10-13', 'ggg@gmail.com', '01900000007', 110, NULL, 'mash'),
(100034, 'sddsds', 'sdsds', '2019-12-15', 'sdsdsds@g', '01900050007', 110, NULL, 'sdsd');

-- --------------------------------------------------------

--
-- Table structure for table `cycles`
--

CREATE TABLE `cycles` (
  `cycle_id` int(11) NOT NULL,
  `fare_rate` double DEFAULT NULL,
  `color` varchar(15) DEFAULT NULL,
  `availability` bit(1) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cycle_image` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cycles`
--

INSERT INTO `cycles` (`cycle_id`, `fare_rate`, `color`, `availability`, `description`, `cycle_image`) VALUES
(1001, 100, 'Black', b'1', 'This\ncycle\nbelongs\nto\nMountain\nBikes', NULL),
(1002, 50, 'White', b'1', 'This\ncycle\nbelongs\nto\nRoad\nBikes', NULL),
(1003, 50, 'Yellow', b'1', 'This\ncycle\nbelongs\nto\nHybrid\nBikes', NULL),
(1004, 100, 'Black', b'1', 'This\ncycle\nbelongs\nto\nFolding\nBikes', NULL),
(1005, 100, 'Green', b'1', 'This\ncycle\nbelongs\nto\nFixies\nBikes', NULL),
(1006, 120, 'Red', b'1', 'This\ncycle\nbelongs\nto\nBMX\nBikes', NULL),
(1007, 50, 'White', b'1', 'This\ncycle\nbelongs\nto\nCrusiers\nBikes', NULL),
(1008, 150, 'Black', b'1', 'This\ncycle\nbelongs\nto\nElectric\nBikes', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rentals`
--

CREATE TABLE `rentals` (
  `rental_id` int(11) NOT NULL,
  `cycle_id` int(11) DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rentals`
--

INSERT INTO `rentals` (`rental_id`, `cycle_id`, `station_id`, `customer_id`, `start_time`, `end_time`) VALUES
(1, 1002, 1, NULL, NULL, NULL),
(2, 1006, 1, NULL, NULL, NULL),
(3, 1002, 2, NULL, NULL, NULL),
(4, 1003, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `station_id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`station_id`, `name`, `address_id`) VALUES
(1, 'Hydrogen', 101),
(2, 'Helium', 102),
(3, 'Lithium', 103),
(4, 'Beryllium', 104),
(5, 'Boron', 105),
(6, 'Carbon', 106),
(7, 'Nitrogen', 107),
(8, 'Oxygen', 108),
(9, 'Fluorine', 109),
(10, 'Neon', 110);

--

-- Indexes for dumped tables
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `cycle_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `review` text,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `cycle_id`, `customer_id`, `review`, `rating`) VALUES
(1, 1006, 100001, 'well done gopedal', 4),
(2, 1003, 100010, 'valana', 4),
(3, 1002, 100009, 'error dekhay kn', 3),
(4, 1002, 100009, 'error dekhay na to ekhn', 5),
(5, 1002, 100009, 'go ahed', 5),
(6, 1006, 100012, 'hi am partho,its good', 3),
(7, 1002, 100001, 'well done', 5),
(8, 1002, 100016, 'not bad', 5),
(9, 1002, 100016, 'Fine ', 5),
(10, 1015, 100016, 'This cycle was good', 5),
(11, 1015, 100019, 'kia bat', 5),
(12, 1016, 100020, 'OWAO', 4),
(13, 1001, 100016, 'well done gopedal', 4),
(14, 1004, 100021, 'very good', 5),
(15, 1016, 100016, 'well done gopedal', 4);





--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_no` (`phone_no`),
  ADD UNIQUE KEY `nid_number` (`nid_number`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `cycles`
--
ALTER TABLE `cycles`
  ADD PRIMARY KEY (`cycle_id`);

--
-- Indexes for table `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`rental_id`),
  ADD KEY `cycle_id` (`cycle_id`),
  ADD KEY `station_id` (`station_id`),
  ADD KEY `customer_id` (`customer_id`);


ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `cycle_id` (`cycle_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`station_id`),
  ADD KEY `address_id` (`address_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100040;

--
-- AUTO_INCREMENT for table `cycles`
--
ALTER TABLE `cycles`
  MODIFY `cycle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;

--
-- AUTO_INCREMENT for table `rentals`
--
ALTER TABLE `rentals`
  MODIFY `rental_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
  MODIFY `station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rentals`
--
ALTER TABLE `rentals`
  ADD CONSTRAINT `rentals_ibfk_1` FOREIGN KEY (`cycle_id`) REFERENCES `cycles` (`cycle_id`),
  ADD CONSTRAINT `rentals_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `stations` (`station_id`),
  ADD CONSTRAINT `rentals_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);


ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`);

--
-- Constraints for table `stations`
--
ALTER TABLE `stations`
  ADD CONSTRAINT `stations_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`);



ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`cycle_id`) REFERENCES `cycles` (`cycle_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);


COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
