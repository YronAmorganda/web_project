-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 14, 2024 at 02:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` text NOT NULL,
  `payment` int(11) NOT NULL,
  `change` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `date`, `status`, `payment`, `change`) VALUES
(1, 36, 1, '2024-09-28 23:42:04', '', 0, 0),
(2, 36, 64, '2024-09-28 23:46:59', '', 0, 0),
(3, 37, 17, '2024-09-29 01:14:32', '', 0, 0),
(4, 37, 56, '2024-09-29 01:15:18', '', 0, 0),
(5, 37, 14, '2024-09-29 01:16:09', '', 0, 0),
(6, 37, 56, '2024-09-29 01:32:41', '', 0, 0),
(21, 36, 10, '2024-09-29 02:56:58', '', 0, 0),
(35, 46, 16, '2024-10-04 11:27:45', '', 0, 0),
(36, 46, 13, '2024-10-04 11:28:41', '', 0, 0),
(37, 46, 10, '2024-10-04 11:32:00', '', 0, 0),
(38, 36, 3, '2024-10-04 11:39:47', '', 0, 0),
(39, 36, 13, '2024-09-24 11:55:58', 'completed', 0, 0),
(40, 36, 13, '2024-10-04 13:01:44', 'completed', 0, 0),
(41, 36, 10, '2024-10-04 13:22:55', 'completed', 0, 0),
(42, 36, 55, '2024-09-11 13:23:22', 'completed', 0, 0),
(43, 36, 10, '2024-10-04 13:53:40', 'Pending', 0, 0),
(44, 36, 20, '2024-10-04 14:09:28', 'completed', 0, 0),
(45, 36, 5, '2024-10-04 14:09:33', 'Pending', 0, 0),
(46, 47, 10, '2024-10-04 14:36:22', 'completed', 0, 0),
(47, 36, 30, '2024-10-06 09:04:31', 'completed', 0, 0),
(48, 36, 40, '2024-10-06 09:05:03', 'completed', 0, 0),
(49, 36, 10, '2024-10-06 09:06:17', 'completed', 0, 0),
(50, 36, 20, '2024-10-06 09:06:33', 'completed', 0, 0),
(51, 36, 10, '2024-10-06 09:11:29', 'completed', 0, 0),
(52, 36, 20, '2024-10-06 10:34:36', 'completed', 0, 0),
(53, 36, 3, '2024-10-06 11:16:47', 'completed', 0, 0),
(54, 36, 10, '2024-10-06 11:49:36', 'completed', 0, 0),
(55, 36, 30, '2024-10-06 11:50:00', 'completed', 0, 0),
(56, 36, 3, '2024-10-06 11:50:29', 'completed', 0, 0),
(57, 36, 18, '2024-10-06 11:50:53', 'completed', 0, 0),
(58, 36, 3, '2024-10-06 11:56:57', 'completed', 0, 0),
(59, 36, 3, '2024-10-06 11:57:42', 'completed', 0, 0),
(60, 36, 5, '2024-10-06 11:59:37', 'completed', 0, 0),
(61, 36, 10, '2024-10-06 12:00:02', 'Pending', 0, 0),
(62, 36, 10, '2024-10-06 13:29:56', 'completed', 0, 0),
(63, 36, 10, '2024-10-06 13:37:13', 'completed', 0, 0),
(64, 36, 10, '2024-10-06 13:37:29', 'completed', 0, 0),
(65, 36, 5, '2024-10-06 13:41:45', 'completed', 0, 0),
(66, 36, 3, '2024-10-06 13:53:51', 'completed', 0, 0),
(67, 36, 3, '2024-10-06 13:54:20', 'completed', 0, 0),
(68, 36, 3, '2024-10-06 13:55:34', 'completed', 0, 0),
(69, 36, 3, '2024-10-06 14:05:51', 'completed', 0, 0),
(70, 36, 23, '2024-10-06 14:13:39', 'completed', 0, 0),
(71, 36, 20, '2024-10-06 14:27:37', 'completed', 0, 0),
(72, 36, 15, '2024-10-06 14:31:36', 'completed', 0, 0),
(73, 36, 5, '2024-10-06 14:36:56', 'completed', 0, 0),
(74, 36, 5, '2024-10-06 14:37:59', 'completed', 0, 0),
(75, 36, 5, '2024-10-06 14:39:44', 'completed', 0, 0),
(76, 36, 10, '2024-10-07 07:52:12', 'Pending', 0, 0),
(77, 47, 13, '2024-10-07 08:47:33', 'completed', 0, 0),
(78, 36, 30, '2024-10-07 09:28:51', 'completed', 0, 0),
(79, 36, 10, '2024-10-07 09:29:16', 'completed', 0, 0),
(80, 36, 3, '2024-10-07 09:29:27', 'completed', 0, 0),
(81, 36, 3, '2024-10-07 09:29:42', 'completed', 0, 0),
(82, 36, 10, '2024-10-07 11:39:07', 'completed', 0, 0),
(83, 36, 10, '2024-10-07 11:49:01', 'Pending', 0, 0),
(84, 36, 20, '2024-10-07 15:28:46', 'completed', 0, 0),
(85, 36, 10, '2024-10-07 15:29:04', 'completed', 0, 0),
(86, 36, 5, '2024-10-07 15:30:17', 'completed', 0, 0),
(87, 36, 5, '2024-10-07 15:33:01', 'completed', 0, 0),
(88, 36, 5, '2024-10-07 15:35:01', 'completed', 0, 0),
(89, 36, 10, '2024-10-07 15:35:43', 'completed', 0, 0),
(90, 36, 10, '2024-10-07 15:36:42', 'completed', 0, 0),
(91, 36, 3, '2024-10-07 15:42:31', 'completed', 0, 0),
(92, 36, 5, '2024-10-07 15:47:38', 'completed', 0, 0),
(93, 36, 20, '2024-10-07 15:49:46', 'completed', 0, 0),
(94, 36, 10, '2024-10-07 15:51:04', 'completed', 0, 0),
(95, 36, 9, '2024-10-07 15:52:26', 'completed', 0, 0),
(96, 36, 24, '2024-10-07 15:52:51', 'completed', 0, 0),
(97, 36, 10, '2024-10-07 15:54:27', 'completed', 0, 0),
(98, 36, 5, '2024-10-07 15:55:55', 'completed', 0, 0),
(99, 47, 10, '2024-10-11 08:35:27', 'Pending', 0, 0),
(100, 36, 10, '2024-10-11 09:20:51', 'completed', 0, 0),
(101, 36, 3, '2024-10-11 09:21:08', 'completed', 0, 0),
(102, 36, 5, '2024-10-11 09:21:47', 'completed', 0, 0),
(103, 36, 30, '2024-10-11 10:50:44', 'Pending', 0, 0),
(104, 36, 10, '2024-10-11 10:52:15', 'completed', 0, 0),
(105, 36, 10, '2024-10-11 11:07:20', 'completed', 0, 0),
(106, 36, 3, '2024-10-11 11:08:25', 'completed', 0, 0),
(107, 36, 30, '2024-10-11 11:29:09', 'completed', 0, 0),
(108, 36, 3, '2024-10-11 11:37:49', 'Pending', 0, 0),
(109, 36, 3, '2024-10-11 13:15:38', 'completed', 0, 0),
(110, 36, 3, '2024-10-11 13:42:41', 'completed', 0, 0),
(111, 36, 10, '2024-10-12 05:24:38', 'Pending', 0, 0),
(112, 36, 3, '2024-10-12 06:44:29', 'completed', 0, 0),
(113, 36, 10, '2024-10-12 08:04:09', 'Pending', 0, 0),
(114, 36, 10, '2024-10-12 08:15:43', 'Pending', 0, 0),
(115, 36, 3, '2024-10-12 10:21:53', 'completed', 0, 0),
(116, 36, 30, '2024-10-12 10:23:15', 'completed', 0, 0),
(117, 36, 13, '2024-10-13 11:31:56', 'completed', 0, 0),
(118, 36, 3, '2024-10-13 15:15:20', 'completed', 0, 0),
(119, 36, 3, '2024-10-13 15:16:46', 'completed', 0, 0),
(120, 36, 3, '2024-10-13 15:18:03', 'completed', 0, 0),
(121, 36, 3, '2024-10-13 15:21:31', 'completed', 0, 0),
(122, 36, 5, '2024-10-13 15:25:09', 'completed', 0, 0),
(123, 36, 5, '2024-10-13 15:25:20', 'completed', 0, 0),
(124, 36, 10, '2024-10-13 15:26:14', 'completed', 0, 0),
(125, 36, 10, '2024-10-13 15:26:35', 'completed', 0, 0),
(126, 36, 10, '2024-10-13 15:40:08', 'completed', 0, 0),
(127, 36, 15, '2024-10-13 15:41:59', 'completed', 0, 0),
(128, 36, 20, '2024-10-13 15:49:26', 'completed', 0, 0),
(129, 36, 30, '2024-10-14 07:49:33', 'completed', 40, 40),
(130, 36, 45, '2024-10-14 07:51:54', 'completed', 50, 50),
(131, 36, 25, '2024-10-14 07:57:13', 'completed', 30, 30),
(132, 36, 20, '2024-10-14 07:59:49', 'completed', 30, 30),
(133, 36, 10, '2024-10-14 08:01:23', 'completed', 20, 20),
(134, 36, 20, '2024-10-14 08:03:23', 'completed', 50, 50),
(135, 36, 20, '2024-10-14 08:04:36', 'completed', 30, 30),
(136, 36, 10, '2024-10-14 08:04:47', 'completed', 30, 30),
(137, 36, 10, '2024-10-14 08:05:08', 'completed', 40, 40),
(138, 36, 20, '2024-10-14 08:06:57', 'completed', 30, 30),
(139, 36, 15, '2024-10-14 08:15:56', 'completed', 30, 30),
(140, 36, 15, '2024-10-14 08:23:32', 'completed', 30, 30),
(141, 36, 20, '2024-10-14 08:45:23', 'completed', 100, 100),
(142, 36, 40, '2024-10-14 11:31:44', 'completed', 0, 0),
(143, 36, 15, '2024-10-14 11:34:16', 'completed', 40, 40),
(144, 36, 15, '2024-10-14 11:36:34', 'completed', 40, 40),
(145, 36, 40, '2024-10-14 11:37:10', 'completed', 50, 50),
(146, 36, 30, '2024-10-14 11:37:21', 'completed', 50, 50),
(147, 36, 20, '2024-10-14 11:49:56', 'completed', 30, 30),
(148, 36, 120, '2024-10-14 12:42:25', 'completed', 100, 100);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 21, 1),
(20, 2, 2, 2),
(21, 2, 22, 1),
(22, 2, 24, 3),
(100, 35, 18, 2),
(101, 35, 21, 1),
(102, 36, 18, 1),
(103, 36, 21, 1),
(104, 37, 21, 1),
(105, 38, 18, 1),
(108, 39, 18, 1),
(109, 39, 21, 1),
(110, 40, 17, 2),
(111, 40, 18, 1),
(114, 41, 21, 1),
(115, 42, 21, 4),
(116, 42, 24, 3),
(117, 43, 2, 1),
(121, 44, 2, 2),
(124, 45, 24, 1),
(125, 46, 2, 1),
(126, 47, 21, 3),
(127, 48, 21, 4),
(128, 49, 21, 1),
(129, 50, 21, 2),
(130, 51, 21, 1),
(131, 52, 21, 2),
(132, 53, 18, 1),
(133, 54, 21, 1),
(134, 55, 21, 3),
(135, 56, 18, 1),
(136, 57, 18, 6),
(137, 58, 18, 1),
(138, 59, 18, 1),
(139, 60, 17, 1),
(140, 61, 21, 1),
(142, 62, 21, 1),
(143, 63, 21, 1),
(144, 64, 21, 1),
(145, 65, 17, 1),
(146, 66, 18, 1),
(147, 67, 18, 1),
(148, 68, 18, 1),
(149, 69, 18, 1),
(150, 70, 18, 1),
(151, 70, 21, 1),
(152, 70, 17, 2),
(153, 71, 21, 2),
(154, 72, 17, 3),
(155, 73, 17, 1),
(156, 74, 17, 1),
(157, 75, 17, 1),
(159, 77, 18, 1),
(160, 77, 21, 1),
(161, 78, 21, 3),
(162, 79, 21, 1),
(163, 80, 18, 1),
(164, 81, 18, 1),
(166, 82, 17, 2),
(167, 83, 17, 2),
(168, 84, 17, 3),
(169, 84, 24, 1),
(170, 85, 17, 2),
(171, 86, 17, 1),
(172, 87, 17, 1),
(173, 88, 17, 1),
(174, 89, 21, 1),
(175, 90, 21, 1),
(176, 91, 18, 1),
(177, 92, 17, 1),
(178, 93, 21, 2),
(179, 94, 21, 1),
(180, 95, 18, 3),
(181, 96, 18, 8),
(182, 97, 17, 1),
(183, 97, 23, 1),
(184, 98, 17, 1),
(185, 99, 2, 1),
(186, 100, 2, 1),
(187, 101, 18, 1),
(188, 102, 17, 1),
(189, 103, 2, 3),
(190, 104, 17, 1),
(191, 104, 24, 1),
(192, 105, 21, 1),
(193, 106, 18, 1),
(194, 107, 24, 3),
(195, 107, 23, 1),
(196, 107, 21, 1),
(200, 108, 18, 1),
(201, 109, 18, 1),
(202, 110, 18, 1),
(203, 111, 2, 1),
(204, 112, 18, 1),
(206, 113, 21, 1),
(208, 115, 18, 1),
(209, 116, 17, 3),
(210, 116, 23, 3),
(211, 117, 18, 1),
(212, 117, 21, 1),
(213, 118, 18, 1),
(214, 119, 18, 1),
(215, 120, 18, 1),
(216, 121, 18, 1),
(217, 122, 17, 1),
(218, 123, 17, 1),
(219, 124, 24, 1),
(220, 124, 23, 1),
(221, 125, 23, 1),
(222, 125, 22, 1),
(223, 126, 23, 1),
(224, 126, 22, 1),
(225, 127, 23, 1),
(226, 127, 2, 1),
(227, 128, 21, 1),
(229, 128, 2, 1),
(231, 129, 17, 2),
(232, 129, 2, 2),
(233, 130, 2, 4),
(234, 130, 17, 1),
(235, 131, 2, 2),
(236, 131, 17, 1),
(237, 132, 2, 2),
(238, 133, 2, 1),
(239, 134, 2, 2),
(240, 135, 2, 2),
(241, 136, 2, 1),
(242, 137, 2, 1),
(243, 138, 2, 2),
(244, 139, 2, 1),
(245, 139, 22, 1),
(246, 140, 2, 1),
(247, 140, 22, 1),
(266, 141, 21, 1),
(267, 141, 2, 1),
(273, 142, 2, 2),
(274, 142, 22, 4),
(277, 143, 2, 1),
(278, 143, 22, 1),
(279, 144, 2, 1),
(280, 144, 22, 1),
(281, 145, 2, 4),
(282, 146, 2, 1),
(283, 146, 22, 4),
(284, 147, 17, 2),
(285, 147, 2, 1),
(305, 148, 2, 8),
(306, 148, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` longblob NOT NULL,
  `description` varchar(1000) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `price`, `image`, `description`, `quantity`) VALUES
(2, 'Mango Muffin', 10.00, 0x2e2e2f496d6167652f332e6a7067, ' \r\n                                                                                                                                                                          ', 23),
(17, 'Butsi 1', 5.00, 0x2e2e2f496d6167652f312e4a5047, ' \r\n                                        Indulge in our freshly baked bread                                    ', 3),
(18, 'pandesal', 3.00, 0x2e2e2f496d6167652f612e6a7067, 'Mango muffins are a delicious blend                     ', 51),
(21, 'Coconut Tarts', 10.00, 0x2e2e2f496d6167652f622e6a7067, 'a', 37),
(22, 'Spanish Bread', 5.00, 0x2e2e2f496d6167652f632e6a706567, 'ds', 14),
(23, 'Ensaymada', 5.00, 0x2e2e2f496d6167652f642e6a7067, 'asdad', 30),
(24, 'Pan de coco', 5.00, 0x2e2e2f496d6167652f652e6a706567, 'asd', 2),
(25, 'Hopia', 5.00, 0x2e2e2f496d6167652f662e6a706567, 'das', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales_reports`
--

CREATE TABLE `sales_reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_sales` int(11) NOT NULL,
  `total_items_sold` int(11) NOT NULL,
  `report_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stocks_quantity`
--

CREATE TABLE `stocks_quantity` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity_added` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stocks_quantity`
--

INSERT INTO `stocks_quantity` (`id`, `product_id`, `user_id`, `quantity_added`, `date`) VALUES
(2, 2, 36, 10, '2024-10-04 22:47:34'),
(3, 2, 36, 5, '2024-10-04 22:49:26'),
(5, 18, 36, 20, '2024-10-07 23:54:53'),
(7, 18, 36, 50, '2024-10-14 20:39:49');

-- --------------------------------------------------------

--
-- Table structure for table `total_sales`
--

CREATE TABLE `total_sales` (
  `id` int(11) NOT NULL,
  `total_sales` int(11) NOT NULL,
  `report_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ifadmin` int(11) NOT NULL,
  `role` enum('admin','staff','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `password`, `ifadmin`, `role`) VALUES
(36, 'jessie james', 'parajes', 'admin', '$2y$10$BCDnqcn6Q.uPd8dWbJc6DugLH.rannVBY2tQfzDGiVNox9UVC4ORe', 1, 'admin'),
(37, 'Test', 'Admin', 'Test', 'staff4213', 0, 'admin'),
(46, 'Thomas ', 'Bishop ', 'jj', '$2y$10$f0n1b4IggvWLHurP8Rd4cuh01ScmbNouD9WrWjBD9C9MZMvu6K6tO', 0, 'staff'),
(47, 'Scarlett', 'Case', 'staff', '$2y$10$gL3/9YJCE1qa3cWJr0Uxy.ZJIRVVx.Yb6dRtsK6U7oVop04Fp1P7a', 0, 'staff'),
(48, 'Lila', 'Todd', 'staff1', '$2y$10$q/FkXDzUhBC9SZvbqkaSvucNRVgdxvc1dWZyIpJXT.t1uCZzrQM4e', 0, 'staff');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `customer_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `sales_reports`
--
ALTER TABLE `sales_reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_ids` (`user_id`);

--
-- Indexes for table `stocks_quantity`
--
ALTER TABLE `stocks_quantity`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `total_sales`
--
ALTER TABLE `total_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sales_reports`
--
ALTER TABLE `sales_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stocks_quantity`
--
ALTER TABLE `stocks_quantity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `total_sales`
--
ALTER TABLE `total_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `sales_reports`
--
ALTER TABLE `sales_reports`
  ADD CONSTRAINT `user_ids` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `stocks_quantity`
--
ALTER TABLE `stocks_quantity`
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
