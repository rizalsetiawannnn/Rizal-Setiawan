-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2025 at 03:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apart-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartements`
--

CREATE TABLE `apartements` (
  `apartement_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apartements`
--

INSERT INTO `apartements` (`apartement_id`, `name`, `address`, `city`, `created_at`) VALUES
(1, 'Easton Park Residence Jatinangor', 'Jl. Raya Jatinangor No.78, Cibeusi, Kec. Jatinangor,Kabupaten Sumedang, Jawa Barat 45363', 'Sumedang', '2025-08-11 13:59:05');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `apartement_id` int(11) NOT NULL DEFAULT 1,
  `unit_number` varchar(10) NOT NULL,
  `floor_number` int(11) NOT NULL,
  `bedrooms` int(11) NOT NULL,
  `bathrooms` int(11) NOT NULL,
  `size_sq_m` decimal(6,2) DEFAULT NULL,
  `status` enum('Available','Occupied','Maintenance') DEFAULT 'Available',
  `monthly_rent` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_id`, `apartement_id`, `unit_number`, `floor_number`, `bedrooms`, `bathrooms`, `size_sq_m`, `status`, `monthly_rent`, `created_at`) VALUES
(2, 1, 'C1701A_Upd', 17, 2, 1, 39.00, 'Available', 5000000.00, '2025-08-11 14:04:40'),
(3, 1, 'C1702B', 17, 2, 1, 39.00, 'Maintenance', 5000000.00, '2025-08-11 14:04:40'),
(4, 1, 'C1702A', 17, 2, 1, 39.00, 'Maintenance', 5000000.00, '2025-08-11 14:05:47'),
(5, 1, 'C1703B', 17, 2, 1, 39.00, 'Available', 5000000.00, '2025-08-11 14:05:47'),
(9, 1, 'C1703A', 17, 2, 2, 40.00, 'Available', 5000000.00, '2025-08-11 18:31:38'),
(10, 1, 'C1704A', 17, 2, 2, 40.00, 'Available', 5000000.00, '2025-08-11 18:33:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` char(32) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `role` enum('admin','manager','tenant') DEFAULT 'tenant',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`, `phone_number`, `role`, `created_at`) VALUES
(1, 'Budi Santoso', 'budi@example.com', '482c811da5d5b4bc6d497ffa98491e38', '08123456789', 'tenant', '2025-08-11 12:13:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartements`
--
ALTER TABLE `apartements`
  ADD PRIMARY KEY (`apartement_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`),
  ADD KEY `fk_units_apartments` (`apartement_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartements`
--
ALTER TABLE `apartements`
  MODIFY `apartement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `fk_units_apartments` FOREIGN KEY (`apartement_id`) REFERENCES `apartements` (`apartement_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
