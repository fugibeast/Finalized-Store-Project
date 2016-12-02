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
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `name` text NOT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`name`, `description`, `quantity`, `price`, `id`) VALUES
('Samsung S5', 'Used, but still work', 0, 60, 25),
('FlashDrive Elite', '31G space', 0, 9.99, 26),
('Samsung S5', 'Good Condition, Like New', 0, 99, 28),
('Chocolate Bar', 'Hershey brand chocolate bar', 32, 0.99, 29),
('Italian bread', 'seasoned to perfection bread roasted in the mountains of Italy', 344, 34.45, 30),
('Pizza', 'Italian Pizza', 24, 350, 31);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
