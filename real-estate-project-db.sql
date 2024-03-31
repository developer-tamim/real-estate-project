-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 30, 2024 at 08:37 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `real-estate-project-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` bigint UNSIGNED NOT NULL,
  `amenities_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `amenities_name`, `created_at`, `updated_at`) VALUES
(1, 'Air Conditioning', NULL, NULL),
(9, 'Cleaning Service', NULL, NULL),
(10, 'Dishwasher', NULL, NULL),
(11, 'Hardwood Flows', NULL, NULL),
(12, 'Swimming Pool', NULL, NULL),
(13, 'Outdoor Shower', NULL, NULL),
(14, 'Microwave', NULL, NULL),
(15, 'Pet Friendly', NULL, NULL),
(16, 'Basketball Court', NULL, NULL),
(17, 'Refrigerator', NULL, NULL),
(18, 'Gym', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` bigint UNSIGNED NOT NULL,
  `property_id` int NOT NULL,
  `facility_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `property_id`, `facility_name`, `distance`, `created_at`, `updated_at`) VALUES
(1, 2, 'Bus Stop', '3', '2024-03-20 23:16:38', '2024-03-20 23:16:38'),
(2, 2, 'Pharmacy', '1', '2024-03-20 23:16:38', '2024-03-20 23:16:38'),
(8, 3, 'Hospital', '1', '2024-03-29 20:41:34', '2024-03-29 20:41:34'),
(9, 3, 'SuperMarket', '2', '2024-03-29 20:41:34', '2024-03-29 20:41:34'),
(10, 3, 'School', '1', '2024-03-29 20:41:34', '2024-03-29 20:41:34'),
(11, 3, 'Bus Stop', '3', '2024-03-29 20:41:34', '2024-03-29 20:41:34'),
(18, 6, 'Pharmacy', '1', '2024-03-29 20:47:22', '2024-03-29 20:47:22'),
(19, 6, 'School', '0.5', '2024-03-29 20:47:22', '2024-03-29 20:47:22');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_03_16_044859_create_property_types_table', 2),
(6, '2024_03_19_025248_create_amenities_table', 3),
(10, '2024_03_19_043123_create_properties_table', 4),
(11, '2024_03_19_044626_create_multi_images_table', 4),
(12, '2024_03_19_045249_create_facilities_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `multi_images`
--

CREATE TABLE `multi_images` (
  `id` bigint UNSIGNED NOT NULL,
  `property_id` int NOT NULL,
  `photo_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multi_images`
--

INSERT INTO `multi_images` (`id`, `property_id`, `photo_name`, `created_at`, `updated_at`) VALUES
(1, 2, 'upload/property/multi-image/1794111641861104.jpg', '2024-03-20 23:16:34', NULL),
(2, 2, 'upload/property/multi-image/1794111642878411.jpg', '2024-03-20 23:16:35', NULL),
(3, 2, 'upload/property/multi-image/1794111643730366.jpg', '2024-03-20 23:16:37', NULL),
(4, 2, 'upload/property/multi-image/1794111645485471.jpg', '2024-03-20 23:16:38', NULL),
(6, 3, 'upload/property/multi-image/1794125702130953.jpg', '2024-03-21 03:00:02', NULL),
(7, 3, 'upload/property/multi-image/1794125702574394.jpg', '2024-03-21 03:00:03', NULL),
(8, 3, 'upload/property/multi-image/1794125703567470.jpg', '2024-03-21 03:00:04', NULL),
(9, 3, 'upload/property/multi-image/1794760422747206.jpg', '2024-03-28 03:08:39', NULL),
(21, 6, 'upload/property/multi-image/1794917628067203.jpeg', '2024-03-29 20:47:22', NULL),
(22, 6, 'upload/property/multi-image/1794917628333181.jpg', '2024-03-29 20:47:22', NULL),
(23, 6, 'upload/property/multi-image/1794917628482271.jpg', '2024-03-29 20:47:22', NULL),
(24, 6, 'upload/property/multi-image/1794917628638055.jpg', '2024-03-29 20:47:22', NULL),
(25, 6, 'upload/property/multi-image/1794917628822192.jpg', '2024-03-29 20:47:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint UNSIGNED NOT NULL,
  `ptype_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amenities_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lowest_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `long_description` text COLLATE utf8mb4_unicode_ci,
  `bedrooms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bathrooms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `garage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `garage_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `neighborhood` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hot` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_id` int DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `ptype_id`, `amenities_id`, `property_name`, `property_slug`, `property_code`, `property_status`, `lowest_price`, `max_price`, `property_thumbnail`, `short_description`, `long_description`, `bedrooms`, `bathrooms`, `garage`, `garage_size`, `property_size`, `property_video`, `address`, `city`, `state`, `postal_code`, `neighborhood`, `latitude`, `longitude`, `featured`, `hot`, `agent_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '9', '11,16,17', 'Kane Baker', 'kane-baker', 'PC001', 'buy', '47', '287', 'upload/property/thumbnail/1794109604088474.jpg', 'Nemo sunt ullamco et', NULL, '2', '3', '1', '147', 'Voluptatibus incidid', 'Est aspernatur neque', 'Iste architecto veri', 'Voluptatibus dicta h', 'Qui et dolore soluta', 'Et necessitatibus es', 'Possimus delectus', 'Iste in est eius qui', 'Sint tenetur quas e', '1', '1', 7, '1', '2024-03-20 22:44:10', NULL),
(6, '1', '9,11,12,16,17', 'Test', 'test', 'PC002', 'buy', '171', '584', 'upload/property/thumbnail/1794917627967874.jpg', 'Odio minus quia sapi', '<p><span style=\"color: rgb(45, 194, 107);\">Odio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapiOdio minus quia sapi</span></p>', '4', '4', '4', '4', 'Odit ad pariatur Et', 'Ipsa architecto nis', 'Modi temporibus et e', 'Sit atque iure facil', 'Dolore dolor expedit', 'Eveniet et saepe co', 'Officia molestiae co', '15648979', '516894669', '1', NULL, 2, '1', '2024-03-29 20:47:21', '2024-03-29 20:47:33');

-- --------------------------------------------------------

--
-- Table structure for table `property_types`
--

CREATE TABLE `property_types` (
  `id` bigint UNSIGNED NOT NULL,
  `type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_types`
--

INSERT INTO `property_types` (`id`, `type_name`, `type_icon`, `created_at`, `updated_at`) VALUES
(1, 'Appartment', 'icon-1', NULL, NULL),
(8, 'Office', 'icon-2', NULL, NULL),
(9, 'Floor', 'icon-3', NULL, NULL),
(10, 'Duplex', 'icon-4', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `role` enum('admin','agent','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `photo`, `phone`, `address`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', 'admin@gmail.com', NULL, '$2y$10$6aXd4B3WYoWTAIUejlm.ueChwbqMkCpy0uIh9WWFp.DtGDp.P9XDO', '202403140621download.png', '123456789', 'Chittagong, BD', 'admin', 'active', NULL, NULL, '2024-03-14 01:15:14'),
(2, 'Agent', 'agent', 'agent@gmail.com', NULL, '$2y$10$274Wi8KQoVV.7Sv886n7wOvjhhf.hZXjvFlVmKypc6VHi9P0FKLOO', '202403300458agent.png', '0123456789', 'Bangladesh', 'agent', 'active', NULL, NULL, '2024-03-29 22:58:07'),
(3, 'User', 'user', 'user@gmail.com', NULL, '$2y$10$RtJxzsr/YaNe6w.4j3WZxOnI7Y6VWsBFba82iQKBjNYxSo1/NWEpm', '202403160258download.png', '123456789', 'Bangladesh', 'user', 'active', NULL, NULL, '2024-03-15 20:59:54'),
(4, 'Barton Bayer I', NULL, 'tanya.moen@example.org', '2024-03-12 21:53:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/0011aa?text=dolorum', '952.913.9230', '26739 Walker Fork\nKoepptown, CO 92011-4102', 'user', 'inactive', '7WxVGwHksA', '2024-03-12 21:53:11', '2024-03-12 21:53:11'),
(5, 'Erin Mueller DVM', NULL, 'lindgren.dortha@example.com', '2024-03-12 21:53:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/008855?text=officiis', '+1-724-207-7182', '9961 Ondricka Pass\nMcDermottfurt, NJ 49624-3097', 'admin', 'inactive', '6CmL9G7CV4', '2024-03-12 21:53:11', '2024-03-12 21:53:11'),
(6, 'Zaria Cummings MD', NULL, 'maiya72@example.net', '2024-03-12 21:53:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/006688?text=voluptas', '+1-737-730-8624', '862 Dante Forks Suite 150\nSouth Monroe, NM 26484-9730', 'admin', 'active', 'BRr3Qa3PIc', '2024-03-12 21:53:11', '2024-03-12 21:53:11'),
(8, 'Dr. Adele Mueller I', NULL, 'klein.urban@example.net', '2024-03-12 21:53:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/00ee00?text=dolores', '364-787-8364', '87001 Wilkinson Radial Apt. 950\nWest Tatum, NE 42588', 'admin', 'active', 'ujEB9WXPBg', '2024-03-12 21:53:11', '2024-03-12 21:53:11'),
(9, 'Test', NULL, 'test@gmail.com', NULL, '$2y$10$TZGNO5kHnbZm.B5VghVHk.yCac/xoQ4.Sk8i7cYL7DK776BGzH5b2', NULL, NULL, NULL, 'user', 'active', NULL, '2024-03-12 21:56:18', '2024-03-12 21:56:18'),
(13, 'Najib', NULL, 'najib@gmail.com', NULL, '$2y$10$gM6h79ew6cwz5uDvZQvmaOoaDkfeaSVY5PxmBugKbRM3e.Ag7XYt6', NULL, NULL, NULL, 'user', 'active', NULL, '2024-03-15 00:49:04', '2024-03-15 00:49:04'),
(14, 'tamim', NULL, 'tamim@gmail.com', NULL, '$2y$10$fF16NXQEBBnnHJdLOLQje.5v6vHhmieglZMnbpSyP88oZEH.r8E4G', NULL, NULL, NULL, 'user', 'active', NULL, '2024-03-15 00:56:50', '2024-03-15 00:57:04'),
(15, 'Test Agent', 'testagent', 'testagent@gmail.com', NULL, '$2y$10$U.eEq0j9ppuf3TGvr8cP0O4jTjJYjt2eiv48RR8A525kH3t5fvF6K', NULL, '0123456789', NULL, 'agent', 'inactive', NULL, '2024-03-29 21:45:38', '2024-03-29 21:45:38'),
(16, 'Testing', NULL, 'testing@gmail.com', NULL, '$2y$10$aOCmBN/IM.oCrgcHjABR8udtURh9b3be9ssJqTKq9kLSpiBfJVvFm', '202403300816images.png', '0123456789', 'Test address', 'agent', 'active', NULL, NULL, '2024-03-30 02:16:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multi_images`
--
ALTER TABLE `multi_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_types`
--
ALTER TABLE `property_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `multi_images`
--
ALTER TABLE `multi_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `property_types`
--
ALTER TABLE `property_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
