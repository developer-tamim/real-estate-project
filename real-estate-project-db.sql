-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2024 at 10:51 PM
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
-- Database: `real-estate-project-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amenities_name` varchar(255) NOT NULL,
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
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blogcat_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_slug` varchar(255) DEFAULT NULL,
  `post_image` varchar(255) DEFAULT NULL,
  `short_descp` text DEFAULT NULL,
  `long_descp` text DEFAULT NULL,
  `post_tags` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'user_id',
  `receiver_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'agent_id',
  `msg` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compares`
--

CREATE TABLE `compares` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `compares`
--

INSERT INTO `compares` (`id`, `user_id`, `property_id`, `created_at`, `updated_at`) VALUES
(3, 3, 1, '2024-04-09 02:16:59', NULL),
(5, 3, 3, '2024-04-09 02:17:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(11) NOT NULL,
  `facility_name` varchar(255) DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `property_id`, `facility_name`, `distance`, `created_at`, `updated_at`) VALUES
(2, 2, 'School', 'Inventore accusamus', '2024-04-02 02:44:55', '2024-04-02 02:44:55'),
(3, 3, 'Bank', 'Minim in deleniti cu', '2024-04-02 02:45:20', '2024-04-02 02:45:20'),
(4, 1, 'Railways', '2.4', '2024-04-04 22:08:43', '2024-04-04 22:08:43'),
(5, 1, 'Hospital', '1.9', '2024-04-04 22:08:43', '2024-04-04 22:08:43'),
(6, 1, 'School', '3.3', '2024-04-04 22:08:43', '2024-04-04 22:08:43'),
(7, 1, 'Beach', '20.3', '2024-04-04 22:08:43', '2024-04-04 22:08:43');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
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
(15, '2024_03_19_043123_create_properties_table', 4),
(16, '2024_03_19_044626_create_multi_images_table', 4),
(17, '2024_03_19_045249_create_facilities_table', 4),
(18, '2024_04_02_050132_create_package_plans_table', 4),
(19, '2024_04_05_052126_create_wish_lists_table', 5),
(20, '2024_04_09_045012_create_compares_table', 6),
(21, '2024_04_09_083915_create_property_messages_table', 7),
(22, '2024_04_16_061424_create_blog_categories_table', 8),
(23, '2024_04_16_061444_create_blog_posts_table', 8),
(24, '2024_04_16_061509_create_chat_messages_table', 8),
(25, '2024_04_16_061519_create_comments_table', 8),
(26, '2024_04_16_061530_create_schedules_table', 8),
(27, '2024_04_16_061542_create_site_settings_table', 8),
(28, '2024_04_16_061553_create_smtp_settings_table', 8),
(29, '2024_04_16_061605_create_states_table', 8),
(30, '2024_04_16_061616_create_testimonials_table', 8),
(31, '2024_04_17_190917_create_permission_tables', 9);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `multi_images`
--

CREATE TABLE `multi_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(11) NOT NULL,
  `photo_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multi_images`
--

INSERT INTO `multi_images` (`id`, `property_id`, `photo_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'upload/property/multi-image/1795211882806877.jpg', '2024-04-02 02:44:25', NULL),
(2, 1, 'upload/property/multi-image/1795211882896302.jpg', '2024-04-02 02:44:25', NULL),
(3, 2, 'upload/property/multi-image/1795211914738491.jpg', '2024-04-02 02:44:55', NULL),
(4, 2, 'upload/property/multi-image/1795211914826660.jpeg', '2024-04-02 02:44:55', NULL),
(5, 3, 'upload/property/multi-image/1795211940686026.jpg', '2024-04-02 02:45:20', NULL),
(6, 3, 'upload/property/multi-image/1795211940957796.jpg', '2024-04-02 02:45:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `package_plans`
--

CREATE TABLE `package_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_name` varchar(255) DEFAULT NULL,
  `package_credits` varchar(255) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `package_amount` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_plans`
--

INSERT INTO `package_plans` (`id`, `user_id`, `package_name`, `package_credits`, `invoice`, `package_amount`, `created_at`, `updated_at`) VALUES
(1, 2, 'Business', '3', 'ERS-96213451', '20', '2024-04-02 02:43:29', NULL),
(2, 2, 'Business', '3', 'ERS-66756379', '20', '2024-04-02 02:44:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ptype_id` varchar(255) NOT NULL,
  `amenities_id` varchar(255) NOT NULL,
  `property_name` varchar(255) NOT NULL,
  `property_slug` varchar(255) NOT NULL,
  `property_code` varchar(255) NOT NULL,
  `property_status` varchar(255) NOT NULL,
  `lowest_price` varchar(255) DEFAULT NULL,
  `max_price` varchar(255) DEFAULT NULL,
  `property_thumbnail` varchar(255) NOT NULL,
  `short_description` text DEFAULT NULL,
  `long_description` text DEFAULT NULL,
  `bedrooms` varchar(255) DEFAULT NULL,
  `bathrooms` varchar(255) DEFAULT NULL,
  `garage` varchar(255) DEFAULT NULL,
  `garage_size` varchar(255) DEFAULT NULL,
  `property_size` varchar(255) DEFAULT NULL,
  `property_video` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `neighborhood` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `hot` varchar(255) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `ptype_id`, `amenities_id`, `property_name`, `property_slug`, `property_code`, `property_status`, `lowest_price`, `max_price`, `property_thumbnail`, `short_description`, `long_description`, `bedrooms`, `bathrooms`, `garage`, `garage_size`, `property_size`, `property_video`, `address`, `city`, `state`, `postal_code`, `neighborhood`, `latitude`, `longitude`, `featured`, `hot`, `agent_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', 'Cleaning Service,Dishwasher,Swimming Pool,Pet Friendly,Refrigerator,Gym', 'Lois Hale', 'lois-hale', 'PC001', 'rent', '959', '40', 'upload/property/thumbnail/1795211882517098.jpg', 'Consequatur culpa o', '<p><span style=\"color: rgb(0, 0, 0);\">Lorem ipsum dolor sit amet consectetur adipisicing sed eiusm tempor incididunt labore dolore magna aliqua enim minim veniam quis nostrud exercitation laboris nisi ut aliquip ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur occaecat</span></p>\r\n<p><span style=\"color: rgb(0, 0, 0);\">Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim est laborum. Sed perspiciatis unde omnis iste natus error sit voluptatem accusantium dolore mque laudantium totam rem aperiam.</span></p>', '2', '3', '1', '100', '1200', '\"https://www.youtube.com/embed/4jnzf1yj48M?si=CBQsJXl_SnEKktwD', '125 street, Avu', 'Boston', 'Massachusetts', '12345', 'Rhode Island', '42.360081', '-71.058884', '1', '1', 2, '1', '2024-04-02 02:44:25', '2024-04-04 22:23:18'),
(2, '1', 'Cleaning Service,Dishwasher,Microwave,Pet Friendly', 'Steel Woods', 'steel-woods', 'PC002', 'rent', '571', '671', 'upload/property/thumbnail/1795211914676553.jpg', 'Fugiat occaecat veri', NULL, '3', '3', '1', '100', '3000', 'Necessitatibus qui c', 'Excepteur quo id adi', 'Voluptas labore quia', 'Odit a voluptatibus', 'Culpa ut earum maio', 'Ullam dolorem cillum', 'Aut laudantium ut i', 'Molestiae atque cons', '1', '1', 2, '1', '2024-04-02 02:44:55', '2024-04-04 02:59:55'),
(3, '9', 'Dishwasher,Hardwood Flows,Outdoor Shower,Refrigerator,Gym', 'Mariam Haley', 'mariam-haley', 'PC003', 'rent', '119', '181', 'upload/property/thumbnail/1795211940444390.jpg', 'Dolore iure voluptas', NULL, '2', '3', '1', '200', '1200', 'Anim est accusamus', 'Et voluptatem Et co', 'Ea unde dolor ut mag', 'At et aspernatur ad', 'Est velit obcaecati', 'Commodo error non qu', '257417', '2725414752', '1', '1', 15, '1', '2024-04-02 02:45:20', '2024-04-04 03:26:51');

-- --------------------------------------------------------

--
-- Table structure for table `property_messages`
--

CREATE TABLE `property_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `agent_id` varchar(255) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `msg_name` varchar(255) DEFAULT NULL,
  `msg_email` varchar(255) DEFAULT NULL,
  `msg_phone` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_messages`
--

INSERT INTO `property_messages` (`id`, `user_id`, `agent_id`, `property_id`, `msg_name`, `msg_email`, `msg_phone`, `message`, `created_at`, `updated_at`) VALUES
(1, 3, '2', 2, 'User', 'user@gmail.com', '123456789', 'this message is for the testing', '2024-04-09 20:52:52', NULL),
(2, 3, '2', 2, 'User', 'user@gmail.com', '123456789', 'test message', '2024-04-09 23:01:11', NULL),
(3, 3, '2', 2, 'User (test)', 'usertest@gmail.com', '+12345987', 'just testing\r\nfjanksdjnfakjsndfabnskdfbasjdbjndkjnfaj nadnsfa nfn anfansdufnaeun n aunun aunseunfuenfa u', '2024-04-09 23:02:14', NULL),
(4, 13, '15', 3, 'Najib', 'najib@gmail.com', '+465413246', 'Message from Najib', '2024-04-10 00:16:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_types`
--

CREATE TABLE `property_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `type_icon` varchar(255) DEFAULT NULL,
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
(10, 'Duplex', 'icon-4', NULL, NULL),
(11, 'Building', 'icon-5', NULL, NULL),
(12, 'Warehouse', 'icon-6', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `agent_id` varchar(255) DEFAULT NULL,
  `tour_date` varchar(255) DEFAULT NULL,
  `tour_time` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `support_phone` varchar(255) DEFAULT NULL,
  `company_address` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `smtp_settings`
--

CREATE TABLE `smtp_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mailer` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `encryption` varchar(255) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `state_name` varchar(255) NOT NULL,
  `state_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('admin','agent','user') NOT NULL DEFAULT 'user',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `credit` varchar(255) DEFAULT '0',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `photo`, `phone`, `address`, `role`, `status`, `credit`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', 'admin@gmail.com', NULL, '$2y$10$6aXd4B3WYoWTAIUejlm.ueChwbqMkCpy0uIh9WWFp.DtGDp.P9XDO', '202403140621download.png', '123456789', 'Chittagong, BD', 'admin', 'active', '0', NULL, NULL, '2024-03-14 01:15:14'),
(2, 'Agent', 'agent', 'agent@gmail.com', NULL, '$2y$10$274Wi8KQoVV.7Sv886n7wOvjhhf.hZXjvFlVmKypc6VHi9P0FKLOO', '202403300458agent.png', '3466478647', '152 Bogisich Trail Apt. 885, USA', 'agent', 'active', '7', NULL, NULL, '2024-04-04 22:40:41'),
(3, 'User', 'user', 'user@gmail.com', NULL, '$2y$10$RtJxzsr/YaNe6w.4j3WZxOnI7Y6VWsBFba82iQKBjNYxSo1/NWEpm', '202403160258download.png', '123456789', 'Bangladesh', 'user', 'active', '0', NULL, NULL, '2024-03-15 20:59:54'),
(4, 'Barton Bayer I', NULL, 'tanya.moen@example.org', '2024-03-12 21:53:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/0011aa?text=dolorum', '952.913.9230', '26739 Walker Fork\nKoepptown, CO 92011-4102', 'user', 'inactive', '0', '7WxVGwHksA', '2024-03-12 21:53:11', '2024-03-12 21:53:11'),
(5, 'Erin Mueller DVM', NULL, 'lindgren.dortha@example.com', '2024-03-12 21:53:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/008855?text=officiis', '+1-724-207-7182', '9961 Ondricka Pass\nMcDermottfurt, NJ 49624-3097', 'admin', 'inactive', '0', '6CmL9G7CV4', '2024-03-12 21:53:11', '2024-03-12 21:53:11'),
(6, 'Zaria Cummings MD', NULL, 'maiya72@example.net', '2024-03-12 21:53:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/006688?text=voluptas', '+1-737-730-8624', '862 Dante Forks Suite 150\nSouth Monroe, NM 26484-9730', 'admin', 'active', '0', 'BRr3Qa3PIc', '2024-03-12 21:53:11', '2024-03-12 21:53:11'),
(8, 'Dr. Adele Mueller I', NULL, 'klein.urban@example.net', '2024-03-12 21:53:11', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'https://via.placeholder.com/60x60.png/00ee00?text=dolores', '364-787-8364', '87001 Wilkinson Radial Apt. 950\nWest Tatum, NE 42588', 'admin', 'active', '0', 'ujEB9WXPBg', '2024-03-12 21:53:11', '2024-03-12 21:53:11'),
(9, 'Test', NULL, 'test@gmail.com', NULL, '$2y$10$TZGNO5kHnbZm.B5VghVHk.yCac/xoQ4.Sk8i7cYL7DK776BGzH5b2', NULL, NULL, NULL, 'user', 'active', '0', NULL, '2024-03-12 21:56:18', '2024-03-12 21:56:18'),
(13, 'Najib', NULL, 'najib@gmail.com', NULL, '$2y$10$gM6h79ew6cwz5uDvZQvmaOoaDkfeaSVY5PxmBugKbRM3e.Ag7XYt6', NULL, NULL, NULL, 'user', 'active', '0', NULL, '2024-03-15 00:49:04', '2024-03-15 00:49:04'),
(14, 'tamim', NULL, 'tamim@gmail.com', NULL, '$2y$10$fF16NXQEBBnnHJdLOLQje.5v6vHhmieglZMnbpSyP88oZEH.r8E4G', NULL, NULL, NULL, 'user', 'active', '0', NULL, '2024-03-15 00:56:50', '2024-03-15 00:57:04'),
(15, 'Hello Home', 'hello home', 'testagent@gmail.com', NULL, '$2y$10$U.eEq0j9ppuf3TGvr8cP0O4jTjJYjt2eiv48RR8A525kH3t5fvF6K', '2024041007141600w-z2je8yhKAGE.webp', '0123456789', 'Boston, USA', 'agent', 'active', '0', NULL, '2024-03-29 21:45:38', '2024-04-10 01:14:44'),
(16, 'Testing', NULL, 'testing@gmail.com', NULL, '$2y$10$aOCmBN/IM.oCrgcHjABR8udtURh9b3be9ssJqTKq9kLSpiBfJVvFm', '202403300816images.png', '0123456789', 'Test address', 'agent', 'active', '0', NULL, NULL, '2024-03-31 23:09:57'),
(17, 'Trust IT', 'trustIT', 'trustit@gmail.com', NULL, '$2y$10$gFF/vMfsNLCSnNWTTCMNw.Njqkr4u7MIY0wk7rK.tF4YjTE1atBpe', '202404100719preview.jpg', NULL, 'Rhodh Island, USA', 'agent', 'active', '0', NULL, NULL, '2024-04-10 01:20:06');

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

CREATE TABLE `wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wish_lists`
--

INSERT INTO `wish_lists` (`id`, `user_id`, `property_id`, `created_at`, `updated_at`) VALUES
(12, 3, 3, '2024-04-08 22:47:30', NULL),
(13, 3, 1, '2024-04-08 22:47:31', NULL),
(14, 3, 2, '2024-04-08 22:47:32', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compares`
--
ALTER TABLE `compares`
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
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `multi_images`
--
ALTER TABLE `multi_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_plans`
--
ALTER TABLE `package_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

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
-- Indexes for table `property_messages`
--
ALTER TABLE `property_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_types`
--
ALTER TABLE `property_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smtp_settings`
--
ALTER TABLE `smtp_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compares`
--
ALTER TABLE `compares`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `multi_images`
--
ALTER TABLE `multi_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `package_plans`
--
ALTER TABLE `package_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `property_messages`
--
ALTER TABLE `property_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `property_types`
--
ALTER TABLE `property_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smtp_settings`
--
ALTER TABLE `smtp_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
