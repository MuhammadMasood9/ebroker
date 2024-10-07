-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2024 at 09:12 PM
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
-- Database: `ebroker`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `type` varchar(191) NOT NULL COMMENT 'Slider,HomeScreen,ProductListing',
  `slider_id` int(11) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image` varchar(191) NOT NULL,
  `property_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `is_enable` tinyint(1) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=approved,1=pending,2=rejected',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` varchar(191) NOT NULL DEFAULT '0',
  `slug_id` varchar(191) NOT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assigned_outdoor_facilities`
--

CREATE TABLE `assigned_outdoor_facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(11) NOT NULL,
  `facility_id` int(11) NOT NULL,
  `distance` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assign_parameters`
--

CREATE TABLE `assign_parameters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modal_type` varchar(191) NOT NULL,
  `modal_id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(11) NOT NULL,
  `parameter_id` int(11) NOT NULL,
  `value` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(191) NOT NULL,
  `parameter_types` varchar(191) NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:DeActive 1:Active',
  `sequence` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug_id` varchar(191) NOT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `message` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `audio` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contactrequests`
--

CREATE TABLE `contactrequests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug_id` varchar(191) NOT NULL COMMENT 'Slug of name',
  `firebase_id` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `mobile` varchar(191) NOT NULL,
  `profile` text DEFAULT NULL,
  `address` text NOT NULL,
  `fcm_id` text DEFAULT NULL,
  `logintype` varchar(191) NOT NULL COMMENT 'email / gmail / fb / mobile',
  `isActive` tinyint(4) NOT NULL COMMENT '0:No 1:Yes',
  `api_token` text DEFAULT NULL,
  `notification` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:disable,1:enable',
  `subscription` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `about_me` text DEFAULT NULL,
  `facebook_id` varchar(191) DEFAULT NULL,
  `twiiter_id` varchar(191) DEFAULT NULL,
  `instagram_id` varchar(191) DEFAULT NULL,
  `youtube_id` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `is_premium` tinyint(1) NOT NULL DEFAULT 0,
  `user_document` varchar(191) DEFAULT NULL,
  `doc_verification_status` tinyint(1) DEFAULT NULL COMMENT 'Is Document Verifed (boolean)',
  `otp_verified` tinyint(1) NOT NULL DEFAULT 0,
  `verification_doc` tinyint(1) DEFAULT 0 COMMENT 'Is Document Verifed (boolean)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `slug_id`, `firebase_id`, `email`, `mobile`, `profile`, `address`, `fcm_id`, `logintype`, `isActive`, `api_token`, `notification`, `subscription`, `created_at`, `updated_at`, `about_me`, `facebook_id`, `twiiter_id`, `instagram_id`, `youtube_id`, `latitude`, `longitude`, `city`, `state`, `country`, `is_premium`, `user_document`, `doc_verification_status`, `otp_verified`, `verification_doc`) VALUES
(1, 'John Doe', 'john-doe', '12345abcde', 'john.doe@example.com', '1234567890', 'profile-image.jpg', '123 Main Street', 'fcm_token_123', 'mobile', 1, NULL, 1, 1, '2024-10-07 13:24:03', '2024-10-07 13:46:14', 'I love real estate', 'john.fb', 'john.twitter', 'john_insta', 'john_yt', '37.7749', '-122.4194', NULL, NULL, NULL, 0, 'document.pdf', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interested_users`
--

CREATE TABLE `interested_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-No,1-Yes',
  `property_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `code` varchar(64) NOT NULL,
  `file_name` varchar(512) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=>active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `rtl` tinyint(1) NOT NULL COMMENT '0=false,1=true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `file_name`, `status`, `created_at`, `updated_at`, `deleted_at`, `rtl`) VALUES
(1, 'English', 'en-new', 'en-new.json', 1, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_08_08_100000_create_telescope_entries_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2023_03_18_033231_create_users_table', 1),
(4, '2023_03_18_033352_create_password_resets_table', 1),
(5, '2023_03_18_033442_create_failed_jobs_table', 1),
(6, '2023_03_18_033634_create_categories_table', 1),
(7, '2023_03_18_033727_create_settings_table', 1),
(8, '2023_03_18_033816_create_customers_table', 1),
(9, '2023_03_18_033916_create_sliders_table', 1),
(10, '2023_03_18_034006_create_propertys_table', 1),
(11, '2023_03_18_034055_create_property_images_table', 1),
(12, '2023_03_18_034200_create_notification_table', 1),
(13, '2023_03_18_034245_create_parameters_table', 1),
(14, '2023_03_18_034321_create_favourites_table', 1),
(15, '2023_03_18_034420_create_assign_parameters_table', 1),
(16, '2023_03_18_034454_create_articles_table', 1),
(17, '2023_03_18_034735_create_packages_table', 1),
(18, '2023_03_18_034813_create_user_purchased_packages_table', 1),
(19, '2023_03_18_034855_create_languages_table', 1),
(20, '2023_03_18_034939_cretate_advertisements_table', 1),
(21, '2023_03_18_035027_create_interested_users_table', 1),
(22, '2023_03_18_035059_create_payments_table', 1),
(23, '2023_03_18_035130_create_chats_table', 1),
(24, '2023_04_07_054100_rename_file_column_in_languages_table', 1),
(25, '2023_04_07_055215_alter_table_propertys_change_latitude_latitude', 1),
(26, '2023_04_25_091951_alter_table_payments_change_amount', 1),
(27, '2023_04_26_060301_alter_tabele_propertys_change_price', 1),
(28, '2023_05_11_055149_add_rtl__to_languages_table', 1),
(29, '2023_06_13_100955_create_users_tokens_table', 1),
(30, '2023_06_28_104556_create_outdoor_facilities_table', 1),
(31, '2023_06_28_112848_create_assigned_outdoor_facilities_table', 1),
(32, '2023_07_04_085912_add_rentduration_to_propertys_table', 1),
(33, '2023_07_17_122324_create_report_reasons_table', 1),
(34, '2023_07_17_122354_create_user_reports_table', 1),
(35, '2023_08_02_130025_make_email_value_in_assign_parameters_table', 1),
(36, '2023_08_22_054625_add_category_to_article__table', 1),
(37, '2023_08_22_062456_create_user_interests_table', 1),
(38, '2023_11_07_081457_add_columns_to_customers', 1),
(39, '2023_11_17_052005_create_contactrequests_table', 1),
(40, '2023_11_23_042600_make_data_column_nullable_in_settings_table', 1),
(41, '2023_12_18_103036_add_column_to_categories_table', 1),
(42, '2023_12_18_103148_add_column_to_articles_table', 1),
(43, '2023_12_18_103226_add_column_to_propertys_table', 1),
(44, '2023_12_18_103514_change_datatype_to_settings_table', 1),
(45, '2024_01_02_053848_create_seo_settings_table', 1),
(46, '2024_01_02_054734_add_columns_to_propertys_table', 1),
(47, '2024_01_02_054837_add_columns_to_articles_table', 1),
(48, '2024_01_02_055754_add_columns_to_categories_table', 1),
(49, '2024_01_24_121526_make_message_column_nullable_in_chats_table', 1),
(50, '2024_02_07_124810_add_coumns_to_customers_table', 1),
(51, '2024_02_16_121015_add_coumns_to_packages_table', 1),
(52, '2024_02_26_055053_add_coumns_to_packages_table', 1),
(53, '2024_02_26_055535_add_coumns_to_user_purchased_packages_table', 1),
(54, '2024_02_26_061106_add_coumns_to_customers_table', 1),
(55, '2024_02_26_085212_add_coumns_to_propertys_table', 1),
(56, '2024_02_27_100246_create_projects_table', 1),
(57, '2024_02_27_101454_create_project_documents_table', 1),
(58, '2024_03_01_113401_create_project_plans_table', 1),
(59, '2024_03_20_095532_make_seo_columns_nullable', 1),
(60, '2024_03_28_070334_add_columns_to_projects_table', 1),
(61, '2024_04_19_084914_version_1.1.4', 1),
(62, '2024_05_25_054809_version_1.1.5', 1),
(63, '2024_06_07_085606_1_1_6_version', 1),
(64, '2024_10_04_065615_add_column_to_users_table', 1),
(65, '2024_10_04_070115_add_column_to_users_table', 2),
(66, '2024_10_04_111855_add_column_to_customer_table', 2),
(67, '2024_10_04_123128_add_column_to_customer_table', 2),
(68, '2024_10_07_073503_add_column_to_customer_table', 2),
(69, '2024_10_07_100447_add_column_to_property_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `image` varchar(191) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0: General 1: Inquiry',
  `send_type` tinyint(4) NOT NULL COMMENT '0: Selected 1: All 2:property',
  `customers_id` text DEFAULT NULL,
  `propertys_id` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `outdoor_facilities`
--

CREATE TABLE `outdoor_facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ios_product_id` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'Months',
  `price` double NOT NULL,
  `status` int(11) NOT NULL COMMENT '0:off,1:onn',
  `property_limit` int(11) DEFAULT NULL,
  `advertisement_limit` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) NOT NULL COMMENT 'product_listing/premium_user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `ios_product_id`, `name`, `duration`, `price`, `status`, `property_limit`, `advertisement_limit`, `created_at`, `updated_at`, `type`) VALUES
(1, NULL, 'Trial Package', 30, 0, 1, 10, 10, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `parameters`
--

CREATE TABLE `parameters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `type_of_parameter` varchar(191) DEFAULT NULL,
  `type_values` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `payment_gateway` varchar(191) NOT NULL,
  `package_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `status` varchar(191) NOT NULL COMMENT '1=success,2=fail',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Customer', 1, 'token-name', 'cbe53e31223e176935096d171114c9347b5f465d1770a21c7735a31aa061efaa', '[\"*\"]', NULL, NULL, '2024-10-07 13:24:03', '2024-10-07 13:24:03');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug_id` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `image` varchar(191) NOT NULL,
  `video_link` varchar(191) NOT NULL,
  `location` varchar(191) NOT NULL,
  `latitude` varchar(191) NOT NULL,
  `longitude` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL COMMENT 'under_process,upcoming',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `total_click` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_documents`
--

CREATE TABLE `project_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL COMMENT 'image/doc',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_plans`
--

CREATE TABLE `project_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `document` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `propertys`
--

CREATE TABLE `propertys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` varchar(191) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `address` varchar(191) NOT NULL,
  `client_address` varchar(191) NOT NULL,
  `propery_type` tinyint(4) NOT NULL COMMENT '0:Sell 1:Rent',
  `price` decimal(10,0) NOT NULL,
  `post_type` varchar(191) DEFAULT NULL COMMENT '0 :admin 1:customer',
  `city` varchar(191) DEFAULT 'Kutch',
  `country` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `title_image` text NOT NULL,
  `three_d_image` varchar(191) NOT NULL,
  `video_link` varchar(191) NOT NULL,
  `latitude` varchar(191) NOT NULL,
  `longitude` varchar(191) NOT NULL,
  `added_by` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT ' 0: Deactive 1: Active',
  `total_click` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rentduration` varchar(191) DEFAULT NULL,
  `slug_id` varchar(191) NOT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `is_premium` tinyint(1) NOT NULL DEFAULT 0,
  `document` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `propertys_inquiry`
--

CREATE TABLE `propertys_inquiry` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `propertys_id` bigint(20) UNSIGNED NOT NULL,
  `customers_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 : Pending 1:Accept  2: Complete 3:Cancle',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_images`
--

CREATE TABLE `property_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `propertys_id` bigint(20) NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_reasons`
--

CREATE TABLE `report_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seo_settings`
--

CREATE TABLE `seo_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `data`, `created_at`, `updated_at`) VALUES
(1, 'category_background', '#087C7C14', '2024-10-07 12:58:01', '2024-10-07 12:58:01'),
(2, 'sell_web_color', '#14B8DCFF', '2024-10-07 12:58:01', '2024-10-07 12:58:01'),
(3, 'sell_web_background_color', '#14B8DC1F', '2024-10-07 12:58:01', '2024-10-07 12:58:01'),
(4, 'rent_web_color', '#E48D18FF', '2024-10-07 12:58:01', '2024-10-07 12:58:01'),
(5, 'rent_web_background_color', '#E48D181F', '2024-10-07 12:58:01', '2024-10-07 12:58:01'),
(6, 'company_name', 'eBroker', NULL, NULL),
(7, 'currency_symbol', '$', NULL, NULL),
(8, 'ios_version', '1.0.0', NULL, NULL),
(9, 'default_language', 'en-new', NULL, NULL),
(10, 'force_update', '0', NULL, NULL),
(11, 'android_version', '1.0.0', NULL, NULL),
(12, 'number_with_suffix', '0', NULL, NULL),
(13, 'maintenance_mode', '0', NULL, NULL),
(14, 'privacy_policy', '', NULL, NULL),
(15, 'terms_conditions', '', NULL, NULL),
(16, 'company_tel1', '', NULL, NULL),
(17, 'company_tel2', '', NULL, NULL),
(18, 'razorpay_gateway', '0', NULL, NULL),
(19, 'paystack_gateway', '0', NULL, NULL),
(20, 'paypal_gateway', '0', NULL, NULL),
(21, 'system_version', '1.1.6', NULL, NULL),
(22, 'company_logo', 'logo.png', NULL, NULL),
(23, 'web_logo', 'web_logo.png', NULL, NULL),
(24, 'favicon_icon', 'favicon.png', NULL, NULL),
(25, 'web_footer_logo', 'Logo_white.svg', NULL, NULL),
(26, 'web_placeholder_logo', 'placeholder.svg', NULL, NULL),
(27, 'splash_logo', 'splash.svg', NULL, NULL),
(28, 'app_home_screen', 'homeLogo.svg', NULL, NULL),
(29, 'placeholder_logo', 'placeholder.svg', NULL, NULL),
(30, 'company_name', 'eBroker', NULL, NULL),
(31, 'currency_symbol', '$', NULL, NULL),
(32, 'ios_version', '1.0.0', NULL, NULL),
(33, 'default_language', 'en-new', NULL, NULL),
(34, 'force_update', '0', NULL, NULL),
(35, 'android_version', '1.0.0', NULL, NULL),
(36, 'number_with_suffix', '0', NULL, NULL),
(37, 'maintenance_mode', '0', NULL, NULL),
(38, 'privacy_policy', '', NULL, NULL),
(39, 'terms_conditions', '', NULL, NULL),
(40, 'company_tel1', '', NULL, NULL),
(41, 'company_tel2', '', NULL, NULL),
(42, 'razorpay_gateway', '0', NULL, NULL),
(43, 'paystack_gateway', '0', NULL, NULL),
(44, 'paypal_gateway', '0', NULL, NULL),
(45, 'system_version', '1.1.6', NULL, NULL),
(46, 'company_logo', 'logo.png', NULL, NULL),
(47, 'web_logo', 'web_logo.png', NULL, NULL),
(48, 'favicon_icon', 'favicon.png', NULL, NULL),
(49, 'web_footer_logo', 'Logo_white.svg', NULL, NULL),
(50, 'web_placeholder_logo', 'placeholder.svg', NULL, NULL),
(51, 'splash_logo', 'splash.svg', NULL, NULL),
(52, 'app_home_screen', 'homeLogo.svg', NULL, NULL),
(53, 'placeholder_logo', 'placeholder.svg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text NOT NULL,
  `sequence` tinyint(4) NOT NULL DEFAULT 0,
  `category_id` bigint(20) NOT NULL DEFAULT 0,
  `propertys_id` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `batch_id` char(36) NOT NULL,
  `family_hash` varchar(191) DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) NOT NULL,
  `tag` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug_id` varchar(191) NOT NULL COMMENT 'Slug of name',
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '0:Admin 1:Users',
  `permissions` text NOT NULL,
  `status` int(11) NOT NULL COMMENT '0:Inactive 1:Active',
  `fcm_id` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verification_doc` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `slug_id`, `email`, `email_verified_at`, `password`, `type`, `permissions`, `status`, `fcm_id`, `remember_token`, `created_at`, `updated_at`, `verification_doc`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', NULL, '$2y$10$wmvUMdE7yaSFta30b0fMd.sWAxfxaIu2a25XTbT25/uozgoB0KeWm', 0, '', 1, '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usertokens`
--

CREATE TABLE `usertokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `fcm_id` varchar(191) NOT NULL,
  `api_token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_interests`
--

CREATE TABLE `user_interests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_ids` varchar(191) DEFAULT NULL,
  `outdoor_facilitiy_ids` varchar(191) DEFAULT NULL,
  `price_range` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `property_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_purchased_packages`
--

CREATE TABLE `user_purchased_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modal_type` varchar(191) NOT NULL,
  `modal_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `used_limit_for_property` int(11) NOT NULL DEFAULT 0,
  `used_limit_for_advertisement` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prop_status` tinyint(1) NOT NULL DEFAULT 1,
  `adv_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_purchased_packages`
--

INSERT INTO `user_purchased_packages` (`id`, `modal_type`, `modal_id`, `package_id`, `start_date`, `end_date`, `used_limit_for_property`, `used_limit_for_advertisement`, `created_at`, `updated_at`, `prop_status`, `adv_status`) VALUES
(1, 'App\\Models\\Customer', 1, 1, '2024-10-07', '2024-11-06', 0, 0, '2024-10-07 13:24:03', '2024-10-07 13:24:03', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_reports`
--

CREATE TABLE `user_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason_id` int(11) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  `other_message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_slug_id_unique` (`slug_id`);

--
-- Indexes for table `assigned_outdoor_facilities`
--
ALTER TABLE `assigned_outdoor_facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_parameters`
--
ALTER TABLE `assign_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assign_parameters_modal_type_modal_id_index` (`modal_type`,`modal_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_id_unique` (`slug_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contactrequests`
--
ALTER TABLE `contactrequests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_ids` (`email`,`mobile`,`logintype`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interested_users`
--
ALTER TABLE `interested_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outdoor_facilities`
--
ALTER TABLE `outdoor_facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parameters`
--
ALTER TABLE `parameters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_slug_id_unique` (`slug_id`),
  ADD KEY `projects_added_by_foreign` (`added_by`),
  ADD KEY `projects_category_id_foreign` (`category_id`);

--
-- Indexes for table `project_documents`
--
ALTER TABLE `project_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_documents_project_id_foreign` (`project_id`);

--
-- Indexes for table `project_plans`
--
ALTER TABLE `project_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_plans_project_id_foreign` (`project_id`);

--
-- Indexes for table `propertys`
--
ALTER TABLE `propertys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `propertys_slug_id_unique` (`slug_id`);

--
-- Indexes for table `propertys_inquiry`
--
ALTER TABLE `propertys_inquiry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `propertys_inquiry_propertys_id_foreign` (`propertys_id`),
  ADD KEY `propertys_inquiry_customers_id_foreign` (`customers_id`);

--
-- Indexes for table `property_images`
--
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_reasons`
--
ALTER TABLE `report_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_settings`
--
ALTER TABLE `seo_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`),
  ADD KEY `telescope_entries_created_at_index` (`created_at`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`);

--
-- Indexes for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD PRIMARY KEY (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Indexes for table `telescope_monitoring`
--
ALTER TABLE `telescope_monitoring`
  ADD PRIMARY KEY (`tag`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `usertokens`
--
ALTER TABLE `usertokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usertokens_fcm_id_unique` (`fcm_id`);

--
-- Indexes for table `user_interests`
--
ALTER TABLE `user_interests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_purchased_packages`
--
ALTER TABLE `user_purchased_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_purchased_packages_modal_type_modal_id_index` (`modal_type`,`modal_id`);

--
-- Indexes for table `user_reports`
--
ALTER TABLE `user_reports`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assigned_outdoor_facilities`
--
ALTER TABLE `assigned_outdoor_facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assign_parameters`
--
ALTER TABLE `assign_parameters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contactrequests`
--
ALTER TABLE `contactrequests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interested_users`
--
ALTER TABLE `interested_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `outdoor_facilities`
--
ALTER TABLE `outdoor_facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `parameters`
--
ALTER TABLE `parameters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_documents`
--
ALTER TABLE `project_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_plans`
--
ALTER TABLE `project_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `propertys`
--
ALTER TABLE `propertys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `propertys_inquiry`
--
ALTER TABLE `propertys_inquiry`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_reasons`
--
ALTER TABLE `report_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seo_settings`
--
ALTER TABLE `seo_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usertokens`
--
ALTER TABLE `usertokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_interests`
--
ALTER TABLE `user_interests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_purchased_packages`
--
ALTER TABLE `user_purchased_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_reports`
--
ALTER TABLE `user_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `projects_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_documents`
--
ALTER TABLE `project_documents`
  ADD CONSTRAINT `project_documents_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_plans`
--
ALTER TABLE `project_plans`
  ADD CONSTRAINT `project_plans_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `propertys_inquiry`
--
ALTER TABLE `propertys_inquiry`
  ADD CONSTRAINT `propertys_inquiry_customers_id_foreign` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `propertys_inquiry_propertys_id_foreign` FOREIGN KEY (`propertys_id`) REFERENCES `propertys` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
