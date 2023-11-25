-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2023 at 08:10 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cdsms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `enrollee_list`
--

CREATE TABLE `enrollee_list` (
  `id` int(30) NOT NULL,
  `reg_no` varchar(50) NOT NULL,
  `package_id` int(30) NOT NULL,
  `cost` float NOT NULL DEFAULT 0,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `email` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `start_date` date NOT NULL,
  `time` varchar(250) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0= pending,1=verified,2=in session, 3=completed,4 = cancelled',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enrollee_list`
--

INSERT INTO `enrollee_list` (`id`, `reg_no`, `package_id`, `cost`, `firstname`, `middlename`, `lastname`, `gender`, `dob`, `email`, `contact`, `address`, `start_date`, `time`, `status`, `date_created`, `date_updated`) VALUES
(7, '2023030001', 1, 5200, 'akshay', 'anil', 'Devrukhakar', 'Male', '2002-01-01', 'akshaydevrukhakar42600@gmail.com', '9403247568', 'At post Taral Rajapur\r\nAT Post Devrukh sangmeshwar', '2023-03-01', '08:00 AM - 09:30 AM', 0, '2023-03-08 12:22:18', NULL),
(8, '2023030002', 1, 5200, 'nikhil', 'narendra ', 'pawar', 'Male', '2002-05-21', 'nikhil@gmail.com', '9322772889', 'At post Taral Rajapur\r\nAT Post Devrukh sangmeshwar', '2023-03-08', '08:00 AM - 09:30 AM', 3, '2023-03-08 22:03:31', '2023-03-08 23:16:40'),
(9, '2023030003', 2, 5200, 'prasad ', 'akshay', 'devrukhakar', 'Male', '1996-12-31', 'nikhil@gmail.com', '12364353777', 'At post Taral Rajapur\r\nAT Post Devrukh sangmeshwar', '2023-03-09', '08:00 AM - 09:30 AM', 2, '2023-03-08 23:13:52', '2023-03-09 13:46:31'),
(10, '2023110001', 1, 5200, 'sahil ', '', 'chavan', 'Male', '1999-12-28', 'sahil@gmail.com', '164641316894', 'nsdkviufhlls', '2023-11-01', '08:00 AM - 09:30 AM', 3, '2023-11-25 12:37:54', '2023-11-25 12:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `package_list`
--

CREATE TABLE `package_list` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `training_duration` varchar(100) NOT NULL,
  `cost` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package_list`
--

INSERT INTO `package_list` (`id`, `name`, `description`, `training_duration`, `cost`, `status`, `date_created`) VALUES
(1, 'Automatic Car Training', 'This package is a sample car training package for automatic  transmission.', '30 Days', 5200, 1, '2021-12-03 09:37:17'),
(2, 'Manual Car Training', 'This is a sample car driving training package for manual transmission.', '30 Days', 5200, 1, '2021-12-03 09:41:21'),
(4, 'auto car', 'bijhpig', '5', 5000, 1, '2023-04-08 09:34:16');

-- --------------------------------------------------------

--
-- Table structure for table `payment_list`
--

CREATE TABLE `payment_list` (
  `id` int(30) NOT NULL,
  `enrollee_id` int(30) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_list`
--

INSERT INTO `payment_list` (`id`, `enrollee_id`, `amount`, `remarks`, `date_created`) VALUES
(1, 1, 1200, 'First Payment', '2021-12-03 14:47:31'),
(3, 1, 1000, 'Sample', '2021-12-03 15:00:33'),
(4, 1, 3000, 'Sample Completed Payment', '2021-12-03 15:00:52'),
(6, 5, 1500, 'Sample', '2021-12-03 15:32:16'),
(7, 3, 1200, 'Test', '2021-12-03 15:32:32'),
(8, 3, 800, 'Test123', '2021-12-03 15:32:43'),
(9, 9, 0, 'f', '2023-03-08 23:15:13'),
(10, 8, 500, 'cs', '2023-03-08 23:17:36'),
(11, 8, 4700, 'c', '2023-03-08 23:18:50'),
(12, 2, 2000, 'first payment', '2023-03-09 10:53:02'),
(13, 2, 3000, '', '2023-03-09 10:54:19'),
(14, 9, 1000, 'a', '2023-03-09 13:46:17'),
(15, 10, 5200, 'com\r\n', '2023-11-25 12:38:57');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Car Driving School Management System - PHP'),
(6, 'short_name', 'CDSMS - PHP'),
(11, 'logo', 'uploads/logo-1638498556.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1638495217.png'),
(15, 'content', 'Array'),
(16, 'email', 'akshaydevrukhakar1@gmail.com'),
(17, 'contact', '+91 9403247568'),
(18, 'from_time', '11:00'),
(19, 'to_time', '21:30'),
(20, 'address', 'Near By Asp College Devrukh, Ratnagiri');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1635556826', NULL, 1, 1, '2021-01-20 14:02:37', '2021-11-27 13:39:11'),
(5, 'Rahul ', NULL, 'Khedekar', 'adminr', '170c7695ef62a82992f1f31b106e8403', 'uploads/avatar-5.png?v=1678261027', NULL, 2, 1, '2023-03-08 13:07:07', '2023-03-08 13:07:07'),
(6, 'nikhil', NULL, 'Devrukhakar', 'nikhil', '202cb962ac59075b964b07152d234b70', 'uploads/avatar-6.png?v=1678338375', NULL, 2, 1, '2023-03-09 10:36:14', '2023-03-09 10:36:15'),
(7, 'ak', NULL, 'dev', 'ak', '202cb962ac59075b964b07152d234b70', 'uploads/avatar-7.png?v=1680926735', NULL, 2, 1, '2023-04-08 09:35:35', '2023-04-08 09:35:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `enrollee_list`
--
ALTER TABLE `enrollee_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `package_list`
--
ALTER TABLE `package_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_list`
--
ALTER TABLE `payment_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `enrollee_list`
--
ALTER TABLE `enrollee_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `package_list`
--
ALTER TABLE `package_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_list`
--
ALTER TABLE `payment_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrollee_list`
--
ALTER TABLE `enrollee_list`
  ADD CONSTRAINT `enrollee_list_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `package_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
