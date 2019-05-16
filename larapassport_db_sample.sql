/*
 Navicat Premium Data Transfer

 Source Server         : LOCALHOST
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : larapassport

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 16/05/2019 10:30:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_06_01_000001_create_oauth_auth_codes_table', 2);
INSERT INTO `migrations` VALUES (4, '2016_06_01_000002_create_oauth_access_tokens_table', 2);
INSERT INTO `migrations` VALUES (5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2);
INSERT INTO `migrations` VALUES (6, '2016_06_01_000004_create_oauth_clients_table', 2);
INSERT INTO `migrations` VALUES (7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_access_tokens_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
INSERT INTO `oauth_access_tokens` VALUES ('b91bf29a1de78934d4a52ad746b0574c651f94aedeb54a4f76fa3498a437cbd6783675c945082b9c', 1, 3, NULL, '[]', 0, '2019-05-16 02:23:30', '2019-05-16 02:23:30', '2020-05-16 02:23:30');

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_clients_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
INSERT INTO `oauth_clients` VALUES (1, NULL, 'Laravel Personal Access Client', '729tHbufy2jom0BswKxrJblBl9Z4v68xaRuvhUxq', 'http://localhost', 1, 0, 0, '2019-05-16 02:02:31', '2019-05-16 02:02:31');
INSERT INTO `oauth_clients` VALUES (2, NULL, 'Laravel Password Grant Client', 'BSTejf6vgWxj0dmd5V7v5gXi2GbntdYx6NvWz7k8', 'http://localhost', 0, 1, 0, '2019-05-16 02:02:32', '2019-05-16 02:02:32');
INSERT INTO `oauth_clients` VALUES (3, NULL, 'Laravel Password Grant Client', 'lSQJxeUijph7UVjgikH2d6juttvk1exvJzKEID3o', 'http://localhost', 0, 1, 0, '2019-05-16 02:10:03', '2019-05-16 02:10:03');

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_personal_access_clients_client_id_index`(`client_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
INSERT INTO `oauth_personal_access_clients` VALUES (1, 1, '2019-05-16 02:02:32', '2019-05-16 02:02:32');

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_refresh_tokens_access_token_id_index`(`access_token_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------
INSERT INTO `oauth_refresh_tokens` VALUES ('be56b1e8330d54fe3b94b50fd38fefc76fe041256df83548a02987d0e86c209b4fe87ecbbdcb424c', 'b91bf29a1de78934d4a52ad746b0574c651f94aedeb54a4f76fa3498a437cbd6783675c945082b9c', 0, '2020-05-16 02:23:30');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces`  (
  `procode` tinyint(4) NOT NULL AUTO_INCREMENT,
  `prefix` int(11) NOT NULL DEFAULT 1,
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province_kh` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`procode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES (1, 0, 'Banteay Meanchey', 'បន្ទាយមានជ័យ');
INSERT INTO `provinces` VALUES (2, 0, 'Battambang', 'បាត់ដំបង');
INSERT INTO `provinces` VALUES (3, 0, 'Kampong Cham', 'កំពង់ចាម');
INSERT INTO `provinces` VALUES (4, 0, 'Kampong Chhnang', 'កំពង់ឆ្នាំង');
INSERT INTO `provinces` VALUES (5, 0, 'Kampong Speu', 'កំពង់ស្ពឺ');
INSERT INTO `provinces` VALUES (6, 0, 'Kampong Thom', 'កំពង់ធំ');
INSERT INTO `provinces` VALUES (7, 0, 'Kampot', 'កំពត');
INSERT INTO `provinces` VALUES (8, 0, 'Kandal', 'កណ្ដាល');
INSERT INTO `provinces` VALUES (9, 0, 'Koh Kong', 'កោះកុង');
INSERT INTO `provinces` VALUES (10, 0, 'Kracheh', 'ក្រចេះ');
INSERT INTO `provinces` VALUES (11, 0, 'Mondul Kiri', 'មណ្ឌលគីរី');
INSERT INTO `provinces` VALUES (12, 0, 'Phnom Penh', 'ភ្នំពេញ');
INSERT INTO `provinces` VALUES (13, 0, 'Preah Vihear', 'ព្រះវិហារ');
INSERT INTO `provinces` VALUES (14, 0, 'Prey Veng', 'ព្រៃវែង');
INSERT INTO `provinces` VALUES (15, 0, 'Pursat', 'ពោធិ៍សាត់');
INSERT INTO `provinces` VALUES (16, 0, 'Ratanak Kiri', 'រតនគិរី');
INSERT INTO `provinces` VALUES (17, 0, 'Siem Reap', 'សៀមរាប');
INSERT INTO `provinces` VALUES (18, 0, 'Preah Sihanouk', 'ព្រះសីហនុ');
INSERT INTO `provinces` VALUES (19, 0, 'Stung Treng', 'ស្ទឹងត្រែង');
INSERT INTO `provinces` VALUES (20, 0, 'Svay Rieng', 'ស្វាយរៀង');
INSERT INTO `provinces` VALUES (21, 0, 'Takeo', 'តាកែវ');
INSERT INTO `provinces` VALUES (22, 0, 'Otdar Meanchey', 'ឧត្តរមានជ័យ');
INSERT INTO `provinces` VALUES (23, 0, 'Kep', 'កែប');
INSERT INTO `provinces` VALUES (24, 0, 'Pailin', 'ប៉ៃលិន');
INSERT INTO `provinces` VALUES (25, 0, 'Tbong Khmum', 'ត្បូងឃ្មុំ');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin@admin.com', NULL, '$2y$10$wqu0UxVaSvja9dW8ZrXbIOSvFe6.JaNNJ3ZctGdgsHH6SJpR1Ag7q', NULL, '2019-05-16 02:00:28', '2019-05-16 02:00:28');

SET FOREIGN_KEY_CHECKS = 1;
