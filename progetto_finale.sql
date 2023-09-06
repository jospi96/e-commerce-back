-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Set 06, 2023 alle 06:13
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `progetto_finale`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `brand_name` varchar(25) DEFAULT NULL,
  `brand_description` longtext DEFAULT NULL,
  `brand_img_url` longtext DEFAULT NULL,
  `brand_meta_title` varchar(30) DEFAULT NULL,
  `brand_meta_description` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `brand`
--

INSERT INTO `brand` (`id`, `brand_name`, `brand_description`, `brand_img_url`, `brand_meta_title`, `brand_meta_description`) VALUES
(1, 'eddf', NULL, 'product_img/adidas.jpg', NULL, NULL),
(2, 'Lacoste', 'this is a brand 2', 'product_img/lacoste.jpg', 'this is a brand 2', 'this is a brand 2'),
(3, ' brand 2', 'this is a brand 2', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `total` double NOT NULL DEFAULT 0,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `total`, `created_at`, `updated_at`) VALUES
(1, 3, 0, NULL, NULL),
(2, 19, 0, '2023-05-02', '2023-05-02'),
(3, 21, 0, '2023-05-02', '2023-05-02'),
(18, 22, 0, '2023-08-31', '2023-08-31'),
(19, 23, 0, '2023-09-05', '2023-09-05');

-- --------------------------------------------------------

--
-- Struttura della tabella `cart_discount`
--

CREATE TABLE `cart_discount` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `cart_discount`
--

INSERT INTO `cart_discount` (`id`, `cart_id`, `discount_id`) VALUES
(1, 1, 2),
(2, 1, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `cart_product`
--

CREATE TABLE `cart_product` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_product` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `cart_product`
--

INSERT INTO `cart_product` (`cart_id`, `product_id`, `quantity_product`, `id`) VALUES
(1, 156, 3, 105),
(1, 157, 1, 106),
(1, 155, 1, 107),
(1, 159, 1, 109),
(2, 155, 1, 110),
(2, 157, 1, 111);

-- --------------------------------------------------------

--
-- Struttura della tabella `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `meta_title` varchar(30) DEFAULT NULL,
  `meta_description` varchar(60) DEFAULT NULL,
  `img_url` longtext DEFAULT NULL,
  `description` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `category`
--

INSERT INTO `category` (`id`, `name`, `meta_title`, `meta_description`, `img_url`, `description`) VALUES
(0, 'Discount', NULL, NULL, NULL, ''),
(1, 'VESTITI', 'VESTITI', 'VESTITI', NULL, ''),
(2, 'SCARPE', 'SCARPE', 'SCARPE', NULL, ''),
(3, 'Pantaloni', 'Pantaloni', 'Pantaloni', 'Pantaloni', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `category_product`
--

CREATE TABLE `category_product` (
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `category_product`
--

INSERT INTO `category_product` (`product_id`, `category_id`, `id`) VALUES
(156, 3, 7),
(154, 1, 8),
(154, 3, 9),
(157, 0, 10),
(156, 0, 11);

-- --------------------------------------------------------

--
-- Struttura della tabella `costumer_order`
--

CREATE TABLE `costumer_order` (
  `id_costumer` int(11) DEFAULT NULL,
  `id_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `discount_code`
--

CREATE TABLE `discount_code` (
  `id` int(11) NOT NULL,
  `code` varchar(15) NOT NULL,
  `description` longtext DEFAULT NULL,
  `date_start` date DEFAULT curdate(),
  `date_end` date DEFAULT NULL,
  `discont_percentual` double DEFAULT NULL,
  `permitted_uses` int(11) DEFAULT 99999999,
  `uses_made` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `discount_code`
--

INSERT INTO `discount_code` (`id`, `code`, `description`, `date_start`, `date_end`, `discont_percentual`, `permitted_uses`, `uses_made`) VALUES
(2, 'pascqua2023', '#pascqua2023 5% di sconto su tutto il nostro catalogo', '2023-04-01', '2023-12-30', 10, 125000000, 0),
(3, 'prova2', NULL, '2023-04-02', '2031-12-30', 20, 99999999, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `data_order` datetime DEFAULT current_timestamp(),
  `data_shipping` datetime DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `id_shipping_class` int(11) DEFAULT NULL,
  `id_discount_code` int(11) DEFAULT NULL,
  `shipping_address` varchar(100) NOT NULL,
  `shipping_postal_code` int(11) NOT NULL,
  `shipping_country` varchar(15) NOT NULL,
  `shipping_city` varchar(15) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `shipped_on` datetime DEFAULT NULL,
  `expected_delivery` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `order`
--

INSERT INTO `order` (`id`, `id_customer`, `data_order`, `data_shipping`, `status`, `total`, `id_shipping_class`, `id_discount_code`, `shipping_address`, `shipping_postal_code`, `shipping_country`, `shipping_city`, `updated_at`, `created_at`, `shipped_on`, `expected_delivery`) VALUES
(47, 1, '2023-05-11 10:38:27', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-11 08:38:27', '2023-05-11 08:38:27', NULL, NULL),
(48, 1, '2023-05-11 10:49:03', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-11 08:49:02', '2023-05-11 08:49:02', NULL, NULL),
(49, 1, '2023-05-11 10:49:41', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-11 08:49:41', '2023-05-11 08:49:41', NULL, NULL),
(50, 1, '2023-05-11 10:53:06', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-11 08:53:06', '2023-05-11 08:53:06', NULL, NULL),
(51, 1, '2023-05-11 11:01:21', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-11 09:01:21', '2023-05-11 09:01:21', NULL, NULL),
(52, 1, '2023-05-11 11:03:24', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-11 09:03:24', '2023-05-11 09:03:24', NULL, NULL),
(53, 1, '2023-05-11 11:14:03', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-11 09:14:03', '2023-05-11 09:14:03', NULL, NULL),
(54, 1, '2023-05-11 11:16:08', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-11 09:16:08', '2023-05-11 09:16:08', NULL, NULL),
(55, 1, '2023-05-11 11:16:23', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-11 09:16:23', '2023-05-11 09:16:23', NULL, NULL),
(56, 1, '2023-05-11 11:16:50', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-11 09:16:50', '2023-05-11 09:16:50', NULL, NULL),
(57, 1, '2023-05-11 11:19:12', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-11 09:19:12', '2023-05-11 09:19:12', NULL, NULL),
(58, 1, '2023-05-11 11:19:43', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-11 09:19:43', '2023-05-11 09:19:43', NULL, NULL),
(59, 1, '2023-05-11 11:20:07', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-11 09:20:07', '2023-05-11 09:20:07', NULL, NULL),
(60, 1, '2023-05-11 15:06:26', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-11 13:06:26', '2023-05-11 13:06:26', NULL, NULL),
(61, 1, '2023-05-16 14:41:25', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 12:41:25', '2023-05-16 12:41:25', NULL, NULL),
(62, 1, '2023-05-16 14:51:50', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 12:51:50', '2023-05-16 12:51:50', NULL, NULL),
(63, 22, '2023-05-16 15:01:37', NULL, NULL, NULL, NULL, NULL, 'qweqwe', 95565, 'Italy', 'qweqwe', '2023-05-16 13:01:37', '2023-05-16 13:01:37', NULL, NULL),
(64, 22, '2023-05-16 15:26:00', NULL, NULL, NULL, NULL, NULL, 'qweqwe', 95565, 'Italy', 'qweqwe', '2023-05-16 13:26:00', '2023-05-16 13:26:00', NULL, NULL),
(65, 1, '2023-05-16 15:36:03', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 13:36:03', '2023-05-16 13:36:03', NULL, NULL),
(66, 1, '2023-05-16 15:36:40', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 13:36:40', '2023-05-16 13:36:40', NULL, NULL),
(67, 1, '2023-05-16 15:36:56', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 13:36:56', '2023-05-16 13:36:56', NULL, NULL),
(68, 1, '2023-05-16 15:37:30', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 13:37:30', '2023-05-16 13:37:30', NULL, NULL),
(69, 1, '2023-05-16 15:40:44', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 13:40:44', '2023-05-16 13:40:44', NULL, NULL),
(70, 1, '2023-05-16 15:42:28', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 13:42:28', '2023-05-16 13:42:28', NULL, NULL),
(71, 1, '2023-05-16 15:42:36', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 13:42:36', '2023-05-16 13:42:36', NULL, NULL),
(72, 1, '2023-05-16 15:43:21', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 13:43:21', '2023-05-16 13:43:21', NULL, NULL),
(73, 1, '2023-05-16 15:43:54', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 13:43:54', '2023-05-16 13:43:54', NULL, NULL),
(74, 1, '2023-05-16 15:44:23', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 13:44:23', '2023-05-16 13:44:23', NULL, NULL),
(75, 1, '2023-05-16 15:46:35', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 13:46:35', '2023-05-16 13:46:35', NULL, NULL),
(76, 1, '2023-05-16 15:47:53', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 13:47:53', '2023-05-16 13:47:53', NULL, NULL),
(77, 1, '2023-05-16 15:48:00', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 13:48:00', '2023-05-16 13:48:00', NULL, NULL),
(78, 1, '2023-05-16 15:48:24', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 13:48:24', '2023-05-16 13:48:24', NULL, NULL),
(79, 1, '2023-05-16 16:11:34', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:11:34', '2023-05-16 14:11:34', NULL, NULL),
(80, 1, '2023-05-16 16:13:23', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:13:23', '2023-05-16 14:13:23', NULL, NULL),
(81, 1, '2023-05-16 16:13:50', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:13:50', '2023-05-16 14:13:50', NULL, NULL),
(82, 1, '2023-05-16 16:14:05', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:14:05', '2023-05-16 14:14:05', NULL, NULL),
(83, 1, '2023-05-16 16:14:44', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:14:44', '2023-05-16 14:14:44', NULL, NULL),
(84, 1, '2023-05-16 16:16:41', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:16:41', '2023-05-16 14:16:41', NULL, NULL),
(85, 1, '2023-05-16 16:16:48', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:16:48', '2023-05-16 14:16:48', NULL, NULL),
(86, 1, '2023-05-16 16:17:02', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:17:02', '2023-05-16 14:17:02', NULL, NULL),
(87, 1, '2023-05-16 16:19:03', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:19:03', '2023-05-16 14:19:03', NULL, NULL),
(88, 1, '2023-05-16 16:20:13', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:20:13', '2023-05-16 14:20:13', NULL, NULL),
(89, 1, '2023-05-16 16:25:51', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:25:51', '2023-05-16 14:25:51', NULL, NULL),
(90, 1, '2023-05-16 16:26:16', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:26:16', '2023-05-16 14:26:16', NULL, NULL),
(91, 1, '2023-05-16 16:26:48', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:26:48', '2023-05-16 14:26:48', NULL, NULL),
(92, 1, '2023-05-16 16:27:06', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:27:06', '2023-05-16 14:27:06', NULL, NULL),
(93, 1, '2023-05-16 16:27:43', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:27:43', '2023-05-16 14:27:43', NULL, NULL),
(94, 1, '2023-05-16 16:27:51', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:27:51', '2023-05-16 14:27:51', NULL, NULL),
(95, 1, '2023-05-16 16:31:01', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:31:01', '2023-05-16 14:31:01', NULL, NULL),
(96, 1, '2023-05-16 16:31:15', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:31:15', '2023-05-16 14:31:15', NULL, NULL),
(97, 1, '2023-05-16 16:31:17', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:31:17', '2023-05-16 14:31:17', NULL, NULL),
(98, 1, '2023-05-16 16:31:27', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:31:27', '2023-05-16 14:31:27', NULL, NULL),
(99, 1, '2023-05-16 16:36:54', NULL, NULL, 415.8, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:36:54', '2023-05-16 14:36:54', NULL, NULL),
(100, 1, '2023-05-16 16:39:16', NULL, 'Pending Payment', 415.8, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 14:39:16', '2023-05-16 14:39:16', NULL, NULL),
(101, 22, '2023-05-16 16:39:51', NULL, 'Pending Payment', 344, NULL, NULL, 'qweqwe', 95565, 'Italy', 'qweqwe', '2023-05-16 14:39:51', '2023-05-16 14:39:51', NULL, NULL),
(102, 1, '2023-05-16 17:13:13', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:13:13', '2023-05-16 15:13:13', NULL, NULL),
(103, 1, '2023-05-16 17:14:01', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:14:01', '2023-05-16 15:14:01', NULL, NULL),
(104, 1, '2023-05-16 17:19:47', NULL, 'Pending Payment', 441.8, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:19:47', '2023-05-16 15:19:47', NULL, NULL),
(105, 1, '2023-05-16 17:20:17', NULL, 'Pending Payment', 441.8, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:20:17', '2023-05-16 15:20:17', NULL, NULL),
(106, 1, '2023-05-16 17:26:10', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:26:10', '2023-05-16 15:26:10', NULL, NULL),
(107, 1, '2023-05-16 17:26:44', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:26:44', '2023-05-16 15:26:44', NULL, NULL),
(108, 1, '2023-05-16 17:26:51', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:26:51', '2023-05-16 15:26:51', NULL, NULL),
(109, 1, '2023-05-16 17:27:21', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:27:21', '2023-05-16 15:27:21', NULL, NULL),
(110, 1, '2023-05-16 17:29:40', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:29:40', '2023-05-16 15:29:40', NULL, NULL),
(111, 4, '2023-05-16 17:30:35', NULL, 'paid', 441.8, 2, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-21 09:22:26', '2023-05-16 15:30:35', NULL, NULL),
(112, 1, '2023-05-16 17:40:01', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:40:01', '2023-05-16 15:40:01', NULL, NULL),
(113, 1, '2023-05-16 17:40:25', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:40:25', '2023-05-16 15:40:25', NULL, NULL),
(114, 1, '2023-05-16 17:42:51', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:42:51', '2023-05-16 15:42:51', NULL, NULL),
(115, 1, '2023-05-16 17:43:11', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:43:11', '2023-05-16 15:43:11', NULL, NULL),
(116, 1, '2023-05-16 17:44:08', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:44:08', '2023-05-16 15:44:08', NULL, NULL),
(117, 1, '2023-05-16 17:44:25', NULL, 'Pending Payment', 441.8, 2, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:44:25', '2023-05-16 15:44:25', NULL, '2023-05-17 15:44:25'),
(118, 1, '2023-05-16 17:44:58', NULL, 'Pending Payment', 441.8, 2, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-16 15:44:58', '2023-05-16 15:44:58', NULL, '2023-05-18 00:00:00'),
(119, 1, '2023-05-17 14:14:43', NULL, 'Pending Payment', 441.8, 2, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-17 12:14:43', '2023-05-17 12:14:43', NULL, '2023-05-19 00:00:00'),
(120, 22, '2023-05-17 14:24:55', NULL, NULL, NULL, NULL, NULL, '3432423dfd', 55955, 'Italy', 'adfadfadf', '2023-05-17 12:24:55', '2023-05-17 12:24:55', NULL, NULL),
(121, 22, '2023-05-17 14:24:56', NULL, NULL, NULL, NULL, NULL, '3432423dfd', 55955, 'Italy', 'adfadfadf', '2023-05-17 12:24:56', '2023-05-17 12:24:56', NULL, NULL),
(122, 22, '2023-05-17 14:25:47', NULL, NULL, NULL, NULL, NULL, '3432423dfd', 55955, 'Italy', 'adfadfadf', '2023-05-17 12:25:47', '2023-05-17 12:25:47', NULL, NULL),
(123, 22, '2023-05-17 15:07:41', NULL, NULL, NULL, NULL, NULL, 'dsfsdf', 5454, 'Italy', 'dfsf', '2023-05-17 13:07:41', '2023-05-17 13:07:41', NULL, NULL),
(124, 22, '2023-05-17 15:07:55', NULL, NULL, NULL, NULL, NULL, 'dsfsdf', 5454, 'Italy', 'dfsf', '2023-05-17 13:07:55', '2023-05-17 13:07:55', NULL, NULL),
(125, 22, '2023-05-17 15:09:13', NULL, 'Pending Payment', 376, 2, NULL, 'dsfsdf', 5454, 'Italy', 'dfsf', '2023-05-17 13:09:13', '2023-05-17 13:09:13', NULL, '2023-05-19 00:00:00'),
(126, 1, '2023-05-18 14:21:39', NULL, 'Pending Payment', 441.8, 2, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-18 12:21:39', '2023-05-18 12:21:39', NULL, '2023-05-20 00:00:00'),
(127, 1, '2023-05-18 14:21:58', NULL, 'Pending Payment', 441.8, 2, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-18 12:21:58', '2023-05-18 12:21:58', NULL, '2023-05-20 00:00:00'),
(128, 1, '2023-05-18 14:22:42', NULL, 'Pending Payment', 441.8, 2, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-18 12:22:43', '2023-05-18 12:22:42', NULL, '2023-05-20 00:00:00'),
(129, 1, '2023-05-18 14:23:24', NULL, NULL, NULL, NULL, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-18 12:23:24', '2023-05-18 12:23:24', NULL, NULL),
(130, 4, '2023-05-18 14:23:41', NULL, 'Pending Payment', 441.8, 2, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-18 12:23:41', '2023-05-18 12:23:41', NULL, '2023-05-20 00:00:00'),
(131, 22, '2023-05-18 14:26:16', NULL, 'Pending Payment', 441.8, 2, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-18 12:26:16', '2023-05-18 12:26:16', NULL, '2023-05-20 00:00:00'),
(132, 22, '2023-05-18 14:27:55', NULL, 'Pending Payment', 441.8, 2, NULL, 'dsfdf', 5578, 'it', 'sedsf', '2023-05-18 12:27:55', '2023-05-18 12:27:55', NULL, '2023-05-20 00:00:00'),
(133, 22, '2023-05-18 14:33:16', NULL, 'Pending Payment', 118, 1, NULL, 'dgdfg', 3434, 'Italy', 'dfgdfg', '2023-05-18 12:33:16', '2023-05-18 12:33:16', NULL, '2023-05-20 00:00:00'),
(134, 22, '2023-05-21 11:31:51', NULL, 'Pending Payment', 147, 2, NULL, 'adfadfadf', 552574, 'Italy', 'dsfsdf', '2023-05-21 09:31:51', '2023-05-21 09:31:51', NULL, '2023-05-23 00:00:00'),
(135, 22, '2023-05-21 11:33:06', NULL, 'Pending Payment', 118, 1, NULL, '3432423dfd', 56558, 'Italy', 'qweqwe', '2023-05-21 09:33:06', '2023-05-21 09:33:06', NULL, '2023-05-23 00:00:00'),
(136, 22, '2023-05-21 11:35:11', NULL, 'Pending Payment', 93, 1, NULL, 'adfadfadf', 123213, 'Italy', 'dsfsdf', '2023-05-21 09:35:11', '2023-05-21 09:35:11', NULL, '2023-05-23 00:00:00'),
(137, 22, '2023-05-21 11:36:50', NULL, 'Pending Payment', 63, 1, NULL, '3432423dfd', 58659, 'Italy', 'qweqwe', '2023-05-21 09:36:50', '2023-05-21 09:36:50', NULL, '2023-05-23 00:00:00'),
(138, 22, '2023-05-21 11:38:37', NULL, 'Pending Payment', 196, 1, NULL, 'AFDFSDFS', 2554, 'Italy', 'dsfsdf', '2023-05-21 09:38:37', '2023-05-21 09:38:37', NULL, '2023-05-23 00:00:00'),
(139, 22, '2023-05-21 11:40:01', NULL, 'Pending Payment', 196, 1, NULL, 'AFDFSDFS', 98524, 'Italy', 'wqeqwe', '2023-05-21 09:40:01', '2023-05-21 09:40:01', NULL, '2023-05-23 00:00:00'),
(140, 22, '2023-05-21 11:47:16', NULL, 'Pending Payment', 118, 1, NULL, 'AFDFSDFS', 95854, 'Italy', 'DSF', '2023-05-21 09:47:16', '2023-05-21 09:47:16', NULL, '2023-05-23 00:00:00'),
(141, 22, '2023-05-21 11:48:10', NULL, 'Pending Payment', 196, 1, NULL, 'AFDFSDFS', 58456, 'Italy', 'qweqwe', '2023-05-21 09:48:10', '2023-05-21 09:48:10', NULL, '2023-05-23 00:00:00'),
(142, 22, '2023-05-21 15:58:32', NULL, 'Pending Payment', 93, 1, NULL, 'erwerwer', 125578, 'Italy', 'wqeqwe', '2023-05-21 13:58:32', '2023-05-21 13:58:32', NULL, '2023-05-23 00:00:00'),
(143, 22, '2023-05-21 16:01:54', NULL, 'Pending Payment', 118, 1, NULL, 'ewrewr', 123123123, 'Italy', 'werwer', '2023-05-21 14:01:54', '2023-05-21 14:01:54', NULL, '2023-05-23 00:00:00'),
(144, 22, '2023-05-21 16:03:19', NULL, 'Pending Payment', 118, 1, NULL, 'asdasda', 32343, 'Italy', 'asd', '2023-05-21 14:03:19', '2023-05-21 14:03:19', NULL, '2023-05-23 00:00:00'),
(145, 22, '2023-08-31 17:36:25', NULL, 'Pending Payment', 221, 1, NULL, '3432423dfd', 1, 'Italy', 'adfadfadf', '2023-08-31 15:36:25', '2023-08-31 15:36:25', NULL, '2023-09-02 00:00:00'),
(146, 22, '2023-08-31 17:36:30', NULL, 'Pending Payment', 221, 1, NULL, '3432423dfd', 1, 'Italy', 'adfadfadf', '2023-08-31 15:36:30', '2023-08-31 15:36:30', NULL, '2023-09-02 00:00:00'),
(147, 22, '2023-08-31 17:36:38', NULL, 'Pending Payment', 221, 1, NULL, '3432423dfd', 1, 'Italy', 'adfadfadf', '2023-08-31 15:36:38', '2023-08-31 15:36:38', NULL, '2023-09-02 00:00:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `order_product`
--

CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_products` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `order_product`
--

INSERT INTO `order_product` (`order_id`, `product_id`, `quantity_products`, `id`) VALUES
(47, 155, 2, 1),
(47, 154, 2, 2),
(50, 155, 2, 3),
(50, 154, 2, 4),
(51, 155, 2, 5),
(51, 154, 2, 6),
(52, 155, 2, 7),
(52, 154, 2, 8),
(58, 155, 2, 9),
(58, 154, 2, 10),
(59, 155, 2, 11),
(59, 154, 2, 12),
(60, 155, 2, 13),
(60, 154, 2, 14),
(61, 155, 2, 156),
(61, 154, 2, 157),
(62, 155, 2, 158),
(62, 154, 2, 159),
(63, 157, 1, 160),
(63, 156, 1, 161),
(63, 155, 1, 162),
(63, 154, 1, 163),
(64, 157, 1, 164),
(64, 156, 1, 165),
(64, 155, 1, 166),
(64, 154, 1, 167),
(65, 155, 2, 168),
(65, 154, 2, 169),
(66, 155, 2, 170),
(66, 154, 2, 171),
(67, 155, 2, 172),
(67, 154, 2, 173),
(68, 155, 2, 174),
(68, 154, 2, 175),
(69, 154, 2, 176),
(69, 155, 2, 177),
(70, 154, 2, 178),
(70, 155, 2, 179),
(71, 154, 2, 180),
(71, 155, 3, 181),
(72, 154, 2, 182),
(72, 155, 3, 183),
(73, 154, 2, 184),
(73, 155, 3, 185),
(74, 154, 2, 186),
(74, 155, 3, 187),
(75, 154, 2, 188),
(75, 155, 3, 189),
(76, 154, 2, 190),
(76, 155, 3, 191),
(77, 154, 2, 192),
(77, 155, 3, 193),
(78, 154, 2, 194),
(78, 155, 3, 195),
(79, 154, 2, 196),
(79, 155, 3, 197),
(80, 154, 2, 198),
(80, 155, 3, 199),
(81, 154, 2, 200),
(81, 155, 3, 201),
(82, 154, 2, 202),
(82, 155, 3, 203),
(83, 154, 2, 204),
(83, 155, 3, 205),
(84, 154, 2, 206),
(84, 155, 3, 207),
(85, 154, 2, 208),
(85, 155, 3, 209),
(86, 154, 2, 210),
(86, 155, 3, 211),
(87, 154, 2, 212),
(87, 155, 3, 213),
(88, 154, 2, 214),
(88, 155, 3, 215),
(89, 154, 2, 216),
(89, 155, 3, 217),
(90, 154, 2, 218),
(90, 155, 3, 219),
(91, 154, 2, 220),
(91, 155, 3, 221),
(92, 154, 2, 222),
(92, 155, 3, 223),
(93, 154, 2, 224),
(93, 155, 3, 225),
(94, 154, 2, 226),
(94, 155, 3, 227),
(95, 154, 2, 228),
(95, 155, 3, 229),
(96, 154, 2, 230),
(96, 155, 3, 231),
(97, 154, 2, 232),
(97, 155, 3, 233),
(98, 154, 2, 234),
(98, 155, 3, 235),
(99, 154, 2, 236),
(99, 155, 3, 237),
(100, 154, 2, 238),
(100, 155, 3, 239),
(101, 157, 1, 240),
(101, 156, 1, 241),
(101, 155, 1, 242),
(101, 154, 1, 243),
(102, 154, 2, 244),
(102, 155, 3, 245),
(103, 154, 2, 246),
(103, 155, 3, 247),
(104, 154, 2, 248),
(104, 155, 3, 249),
(105, 154, 2, 250),
(105, 155, 3, 251),
(106, 154, 2, 252),
(106, 155, 3, 253),
(107, 154, 2, 254),
(107, 155, 3, 255),
(108, 154, 2, 256),
(108, 155, 3, 257),
(109, 154, 2, 258),
(109, 155, 3, 259),
(110, 154, 2, 260),
(110, 155, 3, 261),
(111, 154, 2, 262),
(111, 155, 3, 263),
(112, 154, 2, 264),
(112, 155, 3, 265),
(113, 154, 2, 266),
(113, 155, 3, 267),
(114, 154, 2, 268),
(114, 155, 3, 269),
(115, 154, 2, 270),
(115, 155, 3, 271),
(116, 154, 2, 272),
(116, 155, 3, 273),
(117, 154, 2, 274),
(117, 155, 3, 275),
(118, 154, 2, 276),
(118, 155, 3, 277),
(119, 154, 2, 278),
(119, 155, 3, 279),
(120, 157, 1, 280),
(120, 156, 1, 281),
(120, 155, 1, 282),
(120, 154, 1, 283),
(121, 157, 1, 284),
(121, 156, 1, 285),
(121, 155, 1, 286),
(121, 154, 1, 287),
(122, 157, 1, 288),
(122, 156, 1, 289),
(122, 155, 1, 290),
(122, 154, 1, 291),
(123, 157, 1, 292),
(123, 156, 1, 293),
(123, 155, 1, 294),
(123, 154, 1, 295),
(124, 157, 1, 296),
(124, 156, 1, 297),
(124, 155, 1, 298),
(124, 154, 1, 299),
(125, 157, 1, 300),
(125, 156, 1, 301),
(125, 155, 1, 302),
(125, 154, 1, 303),
(126, 154, 2, 304),
(126, 155, 3, 305),
(127, 154, 2, 306),
(127, 155, 3, 307),
(128, 154, 2, 308),
(128, 155, 3, 309),
(129, 154, 2, 310),
(129, 155, 3, 311),
(130, 154, 2, 312),
(130, 155, 3, 313),
(131, 154, 2, 314),
(131, 155, 3, 315),
(132, 154, 2, 316),
(132, 155, 3, 317),
(133, 156, 1, 318),
(134, 155, 1, 319),
(135, 156, 1, 320),
(136, 157, 1, 321),
(137, 154, 1, 322),
(138, 157, 1, 323),
(138, 156, 1, 324),
(139, 157, 1, 325),
(139, 156, 1, 326),
(140, 156, 1, 327),
(141, 156, 1, 328),
(141, 157, 1, 329),
(142, 157, 1, 330),
(143, 156, 1, 331),
(144, 156, 1, 332),
(145, 156, 1, 333),
(145, 154, 1, 334),
(145, 159, 1, 335),
(146, 156, 1, 336),
(146, 154, 1, 337),
(146, 159, 1, 338),
(147, 156, 1, 339),
(147, 154, 1, 340),
(147, 159, 1, 341);

-- --------------------------------------------------------

--
-- Struttura della tabella `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `id_brand` int(11) DEFAULT NULL,
  `id_shipping_class` int(11) DEFAULT NULL,
  `list_price` float DEFAULT NULL,
  `discount_price` float DEFAULT NULL,
  `meta_title` varchar(30) DEFAULT NULL,
  `meta_description` varchar(60) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `weight` float DEFAULT 0,
  `height` float DEFAULT 0,
  `width` float DEFAULT 0,
  `status` varchar(10) NOT NULL DEFAULT 'draft',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `id_category`, `id_brand`, `id_shipping_class`, `list_price`, `discount_price`, `meta_title`, `meta_description`, `quantity`, `weight`, `height`, `width`, `status`, `updated_at`, `created_at`) VALUES
(154, 'POLO MANICA LUNGA LACOSTE VERD', 'Creatore della prima polo nel 1933, Lacoste si è affermata come l\'unico marchio di lusso casual wear che unisce eleganza alla francese e libertà di movimento, ereditato dalle sue origini sportive. Il marchio al coccodrillo è tra i marchi più famosi al mondo e si è affermato come riferimento della polo, reinventandola continuamente combinando eleganza alla francese e libertà di movimento, ereditata dalle sue origini sportive. Il marchio di coccodrillo in diverse forme, materiali e stili. Presenta in 120 paesi, offre un universo completo: abbigliamento, pelletteria, profumi, scarpe, occhiali, biancheria, orologi e biancheria intima, il cui sviluppo soddisfa i suoi elevati requisiti di qualità e responsabilità', 1, 2, 1, 45, NULL, 'POLO MANICA LUNGA LACOSTE VERD', 'SANDALO IN EVA BIRKENSTO DA DONNA BIANCO', 15342, 0, 0, 0, 'draft', '2023-08-31 15:36:38', NULL),
(155, 'SANDALO IN EVA BIRKENSTO DA DO', 'SANDALO IN EVA BIRKENSTO DA DONNA BIANCO', 2, 2, 2, 260, 124, NULL, NULL, 4545309, 0, 0, 0, 'draft', '2023-05-21 09:31:51', NULL),
(156, 'JEANS LEVI S UOMO 511™ SLIM TR', 'JEANS LEVI S UOMO 511™ SLIM TRAIN CAR ADV BLACK', NULL, 2, 1, 200, 100, 'JEANS LEVI S UOMO 511™ SLIM TR', 'JEANS LEVI S UOMO 511™ SLIM TRAIN CAR ADV BLACK', 213106, 0, 0, 0, 'draft', '2023-08-31 15:36:38', NULL),
(157, 'CLASSIC SABOT U CROCS UNISEX C', 'CLASSIC SABOT U CROCS UNISEX COLORE ARMY', NULL, 2, 1, 150, 75, 'CLASSIC SABOT U CROCS UNISEX C', 'CLASSIC SABOT U CROCS UNISEX COLORE ARMY', 959587, 0, 0, 0, 'draft', '2023-05-21 13:58:32', NULL),
(159, 'POLO MANICA corta LACOSTE VERD', 'Creatore della prima polo nel 1933, Lacoste si è affermata come l\'unico marchio di lusso casual wear che unisce eleganza alla francese e libertà di movimento, ereditato dalle sue origini sportive. Il marchio al coccodrillo è tra i marchi più famosi al mondo e si è affermato come riferimento della polo, reinventandola continuamente combinando eleganza alla francese e libertà di movimento, ereditata dalle sue origini sportive. Il marchio di coccodrillo in diverse forme, materiali e stili. Presenta in 120 paesi, offre un universo completo: abbigliamento, pelletteria, profumi, scarpe, occhiali, biancheria, orologi e biancheria intima, il cui sviluppo soddisfa i suoi elevati requisiti di qualità e responsabilità', 0, 2, 1, 120, 52, 'POLO MANICA LUNGA LACOSTE VERD', 'SANDALO IN EVA BIRKENSTO DA DONNA BIANCO', 17, 0, 0, 0, 'draft', '2023-08-31 15:36:38', NULL),
(162, 'hgACOSTE VERD', 'Creatore della prima polo nel 1933, Lacoste si è affermata come l\'unico marchio di lusso casual wear che unisce eleganza alla francese e libertà di movimento, ereditato dalle sue origini sportive. Il marchio al coccodrillo è tra i marchi più famosi al mondo e si è affermato come riferimento della polo, reinventandola continuamente combinando eleganza alla francese e libertà di movimento, ereditata dalle sue origini sportive. Il marchio di coccodrillo in diverse forme, materiali e stili. Presenta in 120 paesi, offre un universo completo: abbigliamento, pelletteria, profumi, scarpe, occhiali, biancheria, orologi e biancheria intima, il cui sviluppo soddisfa i suoi elevati requisiti di qualità e responsabilità', NULL, 2, 1, 120, 52, 'POLO MANICA LUNGA LACOSTE VERD', 'SANDALO IN EVA BIRKENSTO DA DONNA BIANCO', 20, 0, 0, 0, 'draft', NULL, NULL),
(175, 'POLO MANICA LUNGA LACOSTE VERD', 'Creatore della prima polo nel 1933, Lacoste si è affermata come l\'unico marchio di lusso casual wear che unisce eleganza alla francese e libertà di movimento, ereditato dalle sue origini sportive. Il marchio al coccodrillo è tra i marchi più famosi al mondo e si è affermato come riferimento della polo, reinventandola continuamente combinando eleganza alla francese e libertà di movimento, ereditata dalle sue origini sportive. Il marchio di coccodrillo in diverse forme, materiali e stili. Presenta in 120 paesi, offre un universo completo: abbigliamento, pelletteria, profumi, scarpe, occhiali, biancheria, orologi e biancheria intima, il cui sviluppo soddisfa i suoi elevati requisiti di qualità e responsabilità', NULL, 2, 1, 45, 354, 'POLO MANICA LUNGA LACOSTE VERD', 'SANDALO IN EVA BIRKENSTO DA DONNA BIANCO', 20, 0, 0, 0, 'draft', NULL, NULL),
(176, 'SANDALO IN EVA BIRKENSTO DA DO', 'SANDALO IN EVA BIRKENSTO DA DONNA BIANCO', NULL, 2, 1, 260, 124, NULL, NULL, 20, 0, 0, 0, 'draft', NULL, NULL),
(177, 'JEANS LEVI S UOMO 511™ SLIM TR', 'JEANS LEVI S UOMO 511™ SLIM TRAIN CAR ADV BLACK', NULL, 2, 1, 200, 100, 'JEANS LEVI S UOMO 511™ SLIM TR', 'JEANS LEVI S UOMO 511™ SLIM TRAIN CAR ADV BLACK', 3, 0, 0, 0, 'draft', NULL, NULL),
(178, 'CLASSIC SABOT U CROCS UNISEX C', 'CLASSIC SABOT U CROCS UNISEX COLORE ARMY', NULL, 2, 1, 150, 75, 'CLASSIC SABOT U CROCS UNISEX C', 'CLASSIC SABOT U CROCS UNISEX COLORE ARMY', 6, 0, 0, 0, 'draft', NULL, NULL),
(179, 'POLO MANICA corta LACOSTE VERD', 'Creatore della prima polo nel 1933, Lacoste si è affermata come l\'unico marchio di lusso casual wear che unisce eleganza alla francese e libertà di movimento, ereditato dalle sue origini sportive. Il marchio al coccodrillo è tra i marchi più famosi al mondo e si è affermato come riferimento della polo, reinventandola continuamente combinando eleganza alla francese e libertà di movimento, ereditata dalle sue origini sportive. Il marchio di coccodrillo in diverse forme, materiali e stili. Presenta in 120 paesi, offre un universo completo: abbigliamento, pelletteria, profumi, scarpe, occhiali, biancheria, orologi e biancheria intima, il cui sviluppo soddisfa i suoi elevati requisiti di qualità e responsabilità', NULL, 2, 1, 120, 52, 'POLO MANICA LUNGA LACOSTE VERD', 'SANDALO IN EVA BIRKENSTO DA DONNA BIANCO', 20, 0, 0, 0, 'draft', NULL, NULL),
(180, 'hgACOSTE VERD', 'Creatore della prima polo nel 1933, Lacoste si è affermata come l\'unico marchio di lusso casual wear che unisce eleganza alla francese e libertà di movimento, ereditato dalle sue origini sportive. Il marchio al coccodrillo è tra i marchi più famosi al mondo e si è affermato come riferimento della polo, reinventandola continuamente combinando eleganza alla francese e libertà di movimento, ereditata dalle sue origini sportive. Il marchio di coccodrillo in diverse forme, materiali e stili. Presenta in 120 paesi, offre un universo completo: abbigliamento, pelletteria, profumi, scarpe, occhiali, biancheria, orologi e biancheria intima, il cui sviluppo soddisfa i suoi elevati requisiti di qualità e responsabilità', NULL, 2, 1, 120, 52, 'POLO MANICA LUNGA LACOSTE VERD', 'SANDALO IN EVA BIRKENSTO DA DONNA BIANCO', 20, 0, 0, 0, 'draft', NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `product_img_url`
--

CREATE TABLE `product_img_url` (
  `id_product` int(11) DEFAULT NULL,
  `is_cover_image` tinyint(1) DEFAULT NULL,
  `url_img` longtext DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `product_img_url`
--

INSERT INTO `product_img_url` (`id_product`, `is_cover_image`, `url_img`, `id`) VALUES
(154, 1, 'product_img/polo.jpg', 1),
(155, 1, 'product_img/sandalo.jpg', 2),
(154, NULL, 'product_img/sandalo.jpg\r\n', 4),
(155, NULL, 'product_img/polo.jpg\r\n', 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `shipping_class`
--

CREATE TABLE `shipping_class` (
  `id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `add_for_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `shipping_class`
--

INSERT INTO `shipping_class` (`id`, `amount`, `add_for_item`) VALUES
(1, 15, 3),
(2, 20, 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `password` longtext NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `billing_address` varchar(100) DEFAULT NULL,
  `shipping_address` varchar(100) DEFAULT NULL,
  `business_name` varchar(100) DEFAULT NULL,
  `vat_number` varchar(25) DEFAULT NULL,
  `billing_postal_code` int(11) DEFAULT NULL,
  `billing_cauntry` varchar(15) DEFAULT NULL,
  `billing_city` varchar(15) DEFAULT NULL,
  `shipping_postal_code` int(11) DEFAULT NULL,
  `shipping_country` varchar(15) DEFAULT NULL,
  `shipping_city` varchar(15) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`id`, `is_admin`, `password`, `email`, `phone`, `last_name`, `first_name`, `billing_address`, `shipping_address`, `business_name`, `vat_number`, `billing_postal_code`, `billing_cauntry`, `billing_city`, `shipping_postal_code`, `shipping_country`, `shipping_city`, `updated_at`, `created_at`) VALUES
(4, 0, '$2y$10$Uv4jeWae9aSKXJsP4KbI6u/MII4lnMgunH0In5QBHEfJeC3j8QAu6', 'josuepizzoe25@gmail.com', '3491034381', 'monti', 'mario', NULL, 'dsfsdfsdfsdfsdf', NULL, NULL, NULL, NULL, NULL, 95854, 'italy', 'dsfsdfsdfsdf', '2023-03-21 14:31:01', '2023-03-21 09:07:54'),
(5, 0, '$2y$10$BhMzU/luxc.h.09nwDhRlu0zPr07YdxEANY0IHM6BZt1ZeWWxKXVm', 'panca@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-21 11:13:16', '2023-03-21 11:13:16'),
(6, 0, '$2y$10$BE/zmqUN.hv4RSmLO0Yyu.wBOoML/D5YT9.7/ZrpiRI1gSDzMQKDC', 'pancda@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-21 15:01:29', '2023-03-21 15:01:29'),
(7, 0, 'Fffrr#reRw3', 'pancda@sgmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-21 15:11:22', '2023-03-21 15:11:22'),
(8, 0, '$2y$10$Tey6JLu2..XwmXgledU.zORQAdS1iFzZwRuE4azgxX0ypormSpiVK', 'pancda@sgmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-21 15:11:22', '2023-03-21 15:11:22'),
(9, 0, '$2y$10$nuRB/52yO/Uzvkh7OasOJu38UIcZbqudd6Mo4uKFXKgWYSXcCsIO2', 'pancda@sgmasil.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-21 15:19:38', '2023-03-21 15:19:38'),
(10, 0, '$2y$10$vaHnu/PWQ/cNTqyaERGcIuxxsUhYS/aVS.cg19p1z9fYkopkIWCWO', 'pancda@sgfrmasil.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-21 15:20:00', '2023-03-21 15:20:00'),
(11, 0, '$2y$10$P.LJCcOcTopGYHCAXgoJzO4qsOHRu705YM05nAh6nFMfQoSuj0nHC', 'prova@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-21 15:22:34', '2023-03-21 15:22:34'),
(12, 0, '$2y$10$zorOC0XaDzyNTAZmSW55HOW51JRvK/ifPczP5l9WJ/7L0X/8w7mSi', 'prova3@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-21 15:28:39', '2023-03-21 15:28:39'),
(13, 0, '$2y$10$P6WsqVpb94qkEW4VYNunWOr/4gj4qR.1myjdec/sf/w93E8z2v8zu', 'prova3@sgmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-21 15:33:16', '2023-03-21 15:33:16'),
(14, 0, '$2y$10$to0DxdbKmEggpcsQazPa9.H5/gU8k2QUwveShek8ipnNqtfDiGTZe', 'provsa3@sgmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-21 16:36:37', '2023-03-21 16:36:37'),
(15, 0, '$2y$10$m9T6iQoiDgMGY.ACsvD6BeeX/cTQ8fgf0btCkajONxWlpopZyaoTO', 'josuepizzo2@gmail.com', '3652211458', 'sadsadasda', 'asdasdasd', NULL, 'AFDFSDFS', NULL, NULL, NULL, NULL, NULL, NULL, 'Italy', 'DSF', '2023-05-02 08:51:12', '2023-05-02 08:51:12'),
(16, 0, '$2y$10$HHJ0xXn8q.zLnOmRzF3JUeYU9trg0PFlzSgJwt2UG0DK/.hxy81se', 'josuepizd@gmail.com', '3521477856', 'asdasd', 'sadas', NULL, 'adfadfadf', NULL, NULL, NULL, NULL, NULL, NULL, 'Italy', 'qweqw', '2023-05-02 09:04:11', '2023-05-02 09:04:11'),
(17, 0, '$2y$10$CNCmzZCX05rBZlnyEXtKLeKoSQEAH/TdA2TzWPub5Q5yMiJvwyex.', 'josue@gmail.com', '3495125741', 'sdfsdfsd', 'dfjdsf', NULL, 'erwerwer', NULL, NULL, NULL, NULL, NULL, NULL, 'Italy', 'werwer', '2023-05-02 09:05:39', '2023-05-02 09:05:39'),
(18, 0, '$2y$10$y/nxiIUun5nhP/VI2tpzNOKVD3LoLzrerul85Ylia8qTvWiCUtTEm', 'josuer@gmail.com', '3495125776', 'sdfsdfsd', 'dfjdsf', NULL, 'erwerwer', NULL, NULL, NULL, NULL, NULL, NULL, 'Italy', 'werwer', '2023-05-02 09:07:49', '2023-05-02 09:07:49'),
(19, 0, '$2y$10$/VDgp6JMnEiPbKZSE44PUe7UR22kw4w1Z5egXCLdzYoy53tXWqce.', 'josuepizzo25f@gmail.com', '3397452113', 'asdasda', 'ersdf', NULL, 'qweqwe', NULL, NULL, NULL, NULL, NULL, NULL, 'Italy', 'wqeqwe', '2023-05-02 09:09:44', '2023-05-02 09:09:44'),
(20, 0, '$2y$10$Ke1887j.V7Hq1tNzZC0PvOkxAwTuHYKY0jrdt/c.WqW7EOXj0DNbe', 'josuepizfzo25@gmail.com', '3257520146', 'fasfadf', 'sadas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-02 09:36:50', '2023-05-02 09:36:50'),
(21, 0, '$2y$10$DUPu0apw3K8soEzMRNM3v.vz5/6mcLrMdKWu4.dWTYDRbVPPx.uZa', 'josuepiz5@gmail.com', '3336587441', 'wefwef', 'ewewf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-02 10:08:01', '2023-05-02 10:08:01'),
(22, 0, '$2y$10$O9dQRVzpdl1m4O4mJ8dhUuS3OyqRbb8LwkR57lYO6zbcboLFjgbCu', 'josuepizzo25@gmail.com', '3494125368', 'Pizzo', 'Josuè', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-02 10:10:34', '2023-05-02 10:10:34'),
(23, 0, '$2y$10$nvLk66mSxKjP5SRk0FjQlezAiA.Wa8qk7wSLxhUqNkkBs2G2mmSp.', 'josuepizzo25d@gmail.com', '3491040381', 'dsdfsdf', 'ass', NULL, 'AFDFSDFS', NULL, NULL, NULL, NULL, NULL, NULL, 'Italy', 'qweqwe', '2023-09-05 18:43:52', '2023-09-05 18:43:52');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `cart_discount`
--
ALTER TABLE `cart_discount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart` (`cart_id`);

--
-- Indici per le tabelle `cart_product`
--
ALTER TABLE `cart_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cart_product_cart` (`cart_id`),
  ADD KEY `fk_cert_product_cart` (`product_id`);

--
-- Indici per le tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`category_id`),
  ADD KEY `product_category_ibfk_1` (`product_id`);

--
-- Indici per le tabelle `costumer_order`
--
ALTER TABLE `costumer_order`
  ADD KEY `User` (`id_costumer`),
  ADD KEY `Order` (`id_order`);

--
-- Indici per le tabelle `discount_code`
--
ALTER TABLE `discount_code`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indici per le tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tbl_customer` (`id_customer`),
  ADD KEY `fk_order_discount_code` (`id_discount_code`),
  ADD KEY `fk_order_user` (`id_shipping_class`);

--
-- Indici per le tabelle `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order_product_order` (`order_id`),
  ADD KEY `fk_order_product_product` (`product_id`);

--
-- Indici per le tabelle `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indici per le tabelle `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indici per le tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_product_id_category` (`id_category`),
  ADD KEY `fk_product_brand` (`id_brand`),
  ADD KEY `fk_product_product_category` (`id_shipping_class`);

--
-- Indici per le tabelle `product_img_url`
--
ALTER TABLE `product_img_url`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indici per le tabelle `shipping_class`
--
ALTER TABLE `shipping_class`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT per la tabella `cart_discount`
--
ALTER TABLE `cart_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `cart_product`
--
ALTER TABLE `cart_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT per la tabella `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `discount_code`
--
ALTER TABLE `discount_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT per la tabella `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=342;

--
-- AUTO_INCREMENT per la tabella `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT per la tabella `product_img_url`
--
ALTER TABLE `product_img_url`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `shipping_class`
--
ALTER TABLE `shipping_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `cart_discount`
--
ALTER TABLE `cart_discount`
  ADD CONSTRAINT `cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`);

--
-- Limiti per la tabella `cart_product`
--
ALTER TABLE `cart_product`
  ADD CONSTRAINT `fk_cart_product_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cert_product_cart` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limiti per la tabella `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limiti per la tabella `costumer_order`
--
ALTER TABLE `costumer_order`
  ADD CONSTRAINT `Order` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `User` FOREIGN KEY (`id_costumer`) REFERENCES `user` (`id`);

--
-- Limiti per la tabella `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_discount_code` FOREIGN KEY (`id_discount_code`) REFERENCES `discount_code` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_user` FOREIGN KEY (`id_shipping_class`) REFERENCES `shipping_class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `fk_order_product_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_product_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`id_brand`) REFERENCES `brand` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_product_category` FOREIGN KEY (`id_shipping_class`) REFERENCES `shipping_class` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `product_img_url`
--
ALTER TABLE `product_img_url`
  ADD CONSTRAINT `product_img_url_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
