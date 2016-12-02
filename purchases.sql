-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 02, 2016 at 11:32 AM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cs3220stu27`
--

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE IF NOT EXISTS `purchases` (
  `name` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` double NOT NULL,
  `order_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`name`, `quantity`, `total`, `order_number`) VALUES
('NES Mini', 1, 150, 2565),
('FlashDrive Elite', 1, 9.99, 2627),
('FlashDrive Elite', 1, 9.99, 3409),
('NES Mini', 1, 150, 2857),
('NES Mini', 2, 300, 3904),
('Chocolate Bar', 1, 0.99, 4611),
('NES Mini', 1, 150, 1644),
('NES Mini', 1, 150, 2682),
('NES Mini', 1, 150, 1566),
('NES Mini', 1, 150, 1477),
('NES Mini', 1, 150, 2862),
('NES Mini', 1, 150, 1505),
('Samsung S5', 1, 99, 1505),
('Chocolate Bar', 1, 0.99, 1505),
('Chocolate Bar', 1, 0.99, 1848),
('NES Mini', 1, 150, 1395),
('Samsung S5', 2, 198, 1350),
('Pizza', 25, 8750, 1783),
('Italian bread', 2, 68.9, 1362),
('Chocolate Bar', 3, 2.97, 1856),
('Chocolate Bar', 3, 2.97, 1618),
('Chocolate Bar', 3, 2.97, 2697),
('Samsung S5', 1, 99, 2407),
('Chocolate Bar', 1, 0.99, 2407),
('Italian bread', 1, 34.45, 2407),
('Pizza', 1, 350, 2407);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
