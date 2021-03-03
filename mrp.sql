/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100413
 Source Host           : localhost:3306
 Source Schema         : mrp

 Target Server Type    : MySQL
 Target Server Version : 100413
 File Encoding         : 65001

 Date: 03/03/2021 18:05:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bill_consumable
-- ----------------------------
DROP TABLE IF EXISTS `bill_consumable`;
CREATE TABLE `bill_consumable`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bill_consumable
-- ----------------------------

-- ----------------------------
-- Table structure for bill_consumable_detail
-- ----------------------------
DROP TABLE IF EXISTS `bill_consumable_detail`;
CREATE TABLE `bill_consumable_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_consumable_id` int(11) NULL DEFAULT NULL,
  `consumable_id` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bill_consumable_detail
-- ----------------------------

-- ----------------------------
-- Table structure for bill_quotation
-- ----------------------------
DROP TABLE IF EXISTS `bill_quotation`;
CREATE TABLE `bill_quotation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pic_handphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bill_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `inquiry_reff` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rev_no` int(11) NULL DEFAULT NULL,
  `rev_date` date NULL DEFAULT NULL,
  `delivery_date` date NULL DEFAULT NULL,
  `delivery_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lead_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bill_quotation
-- ----------------------------
INSERT INTO `bill_quotation` VALUES (1, 'BMM-20-0001', NULL, NULL, 'BQ-20-0001', '2020-12-07', NULL, NULL, NULL, NULL, NULL, NULL, '', 'On Going', '2020-12-05 20:26:08', '2020-12-20 18:36:01', b'1', NULL, 'admin@mail.co');
INSERT INTO `bill_quotation` VALUES (2, 'BMM-20-002', NULL, NULL, 'BQ-20-0002', '2020-12-20', NULL, NULL, NULL, NULL, NULL, NULL, '', 'canceled', '2020-12-20 17:20:32', '2021-01-17 19:00:38', b'1', 'admin@mail.co', NULL);

-- ----------------------------
-- Table structure for bill_quotation_assembly
-- ----------------------------
DROP TABLE IF EXISTS `bill_quotation_assembly`;
CREATE TABLE `bill_quotation_assembly`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NULL DEFAULT NULL,
  `assembly_mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `total_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_weight` float NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bill_quotation_assembly
-- ----------------------------
INSERT INTO `bill_quotation_assembly` VALUES (0, 3, 'sa', '', 1, '0.006285999999999999', 1.52582, '2020-12-04 08:12:40', '2020-12-20 17:22:46', b'1');
INSERT INTO `bill_quotation_assembly` VALUES (1, 1, 'sa', '', 1, '0.006285999999999999', 1.52582, '2020-12-04 08:10:21', '2020-12-06 00:42:28', b'0');
INSERT INTO `bill_quotation_assembly` VALUES (4, 1, 'sa', 'blabla', 4, '0.005028799999999999', 1.22066, '2020-12-05 20:26:08', '2020-12-06 01:23:51', b'1');
INSERT INTO `bill_quotation_assembly` VALUES (5, 2, 'sa', '', 0, '0.0012571999999999998', 0.0329577, '2020-12-20 17:20:32', NULL, b'1');
INSERT INTO `bill_quotation_assembly` VALUES (6, 2, 'sb', '', 0, '0.0025143999999999995', 0.0659154, '2020-12-20 17:20:32', NULL, b'1');

-- ----------------------------
-- Table structure for bill_quotation_material
-- ----------------------------
DROP TABLE IF EXISTS `bill_quotation_material`;
CREATE TABLE `bill_quotation_material`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NULL DEFAULT NULL,
  `assembly_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `part_mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qty` int(11) NULL DEFAULT NULL,
  `length` double NULL DEFAULT NULL,
  `width` double NULL DEFAULT NULL,
  `thick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pcs_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pcs_weight` double NULL DEFAULT NULL,
  `total_weight` double NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bill_quotation_material
-- ----------------------------
INSERT INTO `bill_quotation_material` VALUES (1, 3, 'sa', 'RBS008', 'As dia.8 (SS-304)', '1', 5, 50, 270, '8', '0.0012571999999999998', '0.006285999999999999', 0.305164, 1.52582, '', '2020-12-04 08:12:40', NULL, b'1');
INSERT INTO `bill_quotation_material` VALUES (2, 1, 'sa', 'RBS008', 'As dia.8 (SS-304)', 'sa', 2, 50, 270, '8', '0.0012571999999999998', '0.0025143999999999995', 0.305164, 0.610328, '', '2020-12-05 20:26:08', NULL, b'1');
INSERT INTO `bill_quotation_material` VALUES (3, 1, 'sa', 'RBS008', 'As dia.8 (SS-304)', 'vas', 2, 50, 270, '8', '0.0012571999999999998', '0.0025143999999999995', 0.305164, 0.610328, '', '2020-12-05 20:26:08', NULL, b'1');
INSERT INTO `bill_quotation_material` VALUES (4, 2, 'sa', 'RBS008', 'As dia.8 (SS-304)', 'kosong', 1, 50, 270, '8', '0.0012571999999999998', '0.0012571999999999998', 0.032957712, 0.032957712, '', '2020-12-20 17:20:32', NULL, b'1');
INSERT INTO `bill_quotation_material` VALUES (5, 2, 'sb', 'RBS008', 'As dia.8 (SS-304)', 'ada', 2, 50, 270, '8', '0.0012571999999999998', '0.0025143999999999995', 0.032957712, 0.065915424, '', '2020-12-20 17:20:32', NULL, b'1');

-- ----------------------------
-- Table structure for bsk
-- ----------------------------
DROP TABLE IF EXISTS `bsk`;
CREATE TABLE `bsk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NULL DEFAULT NULL,
  `bsk_no` int(11) NULL DEFAULT NULL,
  `bsk_date` datetime(0) NULL DEFAULT NULL,
  `rev_no` int(11) NULL DEFAULT NULL,
  `rev_date` datetime(0) NULL DEFAULT NULL,
  `foreman` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qc_dept` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `delivery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bsk
-- ----------------------------

-- ----------------------------
-- Table structure for currency
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO `currency` VALUES (1, 'IDR', 'Indonesian Rupiah', '2020-11-29 01:05:34', NULL, b'1');
INSERT INTO `currency` VALUES (2, 'USD', 'US Dollar', '2020-11-29 01:05:47', NULL, b'1');
INSERT INTO `currency` VALUES (3, '¥en', 'Yen Japan', '2020-11-29 01:06:08', '2020-11-29 01:11:47', b'1');

-- ----------------------------
-- Table structure for currency_rate
-- ----------------------------
DROP TABLE IF EXISTS `currency_rate`;
CREATE TABLE `currency_rate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `feb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `apr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `may` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `june` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `july` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `august` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sept` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oct` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nov` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of currency_rate
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bank_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `npwp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nppkp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tkip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `credit_limit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `payment_term` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attention` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code_for_so` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'CCK', 'adsa', 'asdas', 'asda', '12312', 'asdada', '111', '111', 'asdasda', 'asdas', 'asdasd', 'asdasd', 'asdasd', '10000', '2', 'adad', 'adada', 'adad', '2020-11-29 22:08:36', NULL, b'1');
INSERT INTO `customer` VALUES (2, 'MCD', 'MICH', 'asdas', 'asda', '12312', 'asdada', '111', '111', 'asdasda', 'asdas', 'asdasd', 'asdasd', 'asdasd', '10000', '2', 'adad', 'adada', 'adad', '2020-11-29 22:36:32', '2020-11-29 22:46:56', b'0');
INSERT INTO `customer` VALUES (3, 'GAN', 'nyan', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2020-12-20 16:59:34', NULL, b'1');

-- ----------------------------
-- Table structure for customer_contact
-- ----------------------------
DROP TABLE IF EXISTS `customer_contact`;
CREATE TABLE `customer_contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `handphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customer_contact
-- ----------------------------
INSERT INTO `customer_contact` VALUES (1, 1, 'main', '0111', '101010', 'mail', 'uh', '2020-11-29 22:08:36', NULL, b'1');
INSERT INTO `customer_contact` VALUES (2, 1, 'nyan', '012312', '812312', 'mail', 'paisda', '2020-11-29 22:08:36', NULL, b'1');
INSERT INTO `customer_contact` VALUES (3, 2, 'nyan', '012312', '812312', 'mail', 'paisda', '2020-11-29 22:36:32', '2020-11-29 22:41:06', b'0');
INSERT INTO `customer_contact` VALUES (4, 2, 'bola', '0123412', '1414', '1411', '1241', '2020-11-29 22:36:32', '2020-11-29 22:41:06', b'0');
INSERT INTO `customer_contact` VALUES (5, 2, 'bola', '0123412', '1414', '1411', '1241', '2020-11-29 22:41:06', NULL, b'1');
INSERT INTO `customer_contact` VALUES (6, 2, 'bakso', '', '', '', '', '2020-11-29 22:41:06', NULL, b'1');
INSERT INTO `customer_contact` VALUES (7, 3, 'miu', '', '', '', '', '2020-12-20 16:59:34', NULL, b'1');

-- ----------------------------
-- Table structure for daily_consumable
-- ----------------------------
DROP TABLE IF EXISTS `daily_consumable`;
CREATE TABLE `daily_consumable`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `modified_date` datetime(0) NULL DEFAULT NULL,
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of daily_consumable
-- ----------------------------

-- ----------------------------
-- Table structure for daily_consumable_detail
-- ----------------------------
DROP TABLE IF EXISTS `daily_consumable_detail`;
CREATE TABLE `daily_consumable_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daily_consumable_id` int(11) NULL DEFAULT NULL,
  `consumable_id` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of daily_consumable_detail
-- ----------------------------

-- ----------------------------
-- Table structure for dkm
-- ----------------------------
DROP TABLE IF EXISTS `dkm`;
CREATE TABLE `dkm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_quotation_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dkm_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `rev_no` int(11) NULL DEFAULT NULL,
  `rev_date` datetime(0) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dkm
-- ----------------------------
INSERT INTO `dkm` VALUES (1, 'BQ-20-0002', '0001/JO_NO/PPIC/12/2020', '2020-12-09', NULL, NULL, '', '2020-12-09 22:01:07', '2020-12-09 22:38:49', b'1');

-- ----------------------------
-- Table structure for dkm_detail
-- ----------------------------
DROP TABLE IF EXISTS `dkm_detail`;
CREATE TABLE `dkm_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_dkm` int(11) NULL DEFAULT NULL,
  `material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pcs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weight` float NULL DEFAULT NULL,
  `planning` date NULL DEFAULT NULL,
  `input` date NULL DEFAULT NULL,
  `output` date NULL DEFAULT NULL,
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dkm_detail
-- ----------------------------
INSERT INTO `dkm_detail` VALUES (1, 1, 'RBS008', 'As dia.8 (SS-304)', '2', 'BTG', 0.0138889, '2020-12-09', '2020-12-09', '2020-12-09', b'0');
INSERT INTO `dkm_detail` VALUES (2, 1, 'SB50', 'AS Kotak 50 x 50', '2', 'BTG', 0.3, '2020-12-09', '2020-12-09', '2020-12-09', b'0');
INSERT INTO `dkm_detail` VALUES (3, 1, 'RBS008', 'As dia.8 (SS-304)', '2', 'BTG', 0.0138889, '2020-12-09', '2020-12-09', '2020-12-09', b'0');
INSERT INTO `dkm_detail` VALUES (4, 1, 'SB50', 'AS Kotak 50 x 50', '2', 'BTG', 0.3, '2020-12-09', '2020-12-09', '2020-12-09', b'0');
INSERT INTO `dkm_detail` VALUES (5, 1, 'RBS008', 'As dia.8 (SS-304)', '2', 'BTG', 0.0138889, '2020-12-09', '2020-12-09', '2020-12-09', b'0');
INSERT INTO `dkm_detail` VALUES (6, 1, 'SB50', 'AS Kotak 50 x 50', '2', 'BTG', 0.3, '2020-12-09', '2020-12-09', '2020-12-09', b'0');
INSERT INTO `dkm_detail` VALUES (7, 1, 'RBS008', 'As dia.8 (SS-304)', '2', 'BTG', 0.0138889, '2020-12-09', '2020-12-09', '2020-12-09', b'0');
INSERT INTO `dkm_detail` VALUES (8, 1, 'SB50', 'AS Kotak 50 x 50', '2', 'BTG', 0.3, '2020-12-09', '2020-12-09', '2020-12-09', b'0');
INSERT INTO `dkm_detail` VALUES (9, 1, 'RBS008', 'As dia.8 (SS-304)', '2', 'BTG', 0.0138889, '2020-12-09', '2020-12-09', '2020-12-09', b'0');
INSERT INTO `dkm_detail` VALUES (10, 1, 'SB50', 'AS Kotak 50 x 50', '2', 'BTG', 0.3, '2020-12-09', '2020-12-09', '2020-12-09', b'0');
INSERT INTO `dkm_detail` VALUES (11, 1, 'RBS008', 'As dia.8 (SS-304)', '2', 'BTG', 0.0138889, '2020-12-09', '2020-12-09', '2020-12-09', b'1');
INSERT INTO `dkm_detail` VALUES (12, 1, 'SB50', 'AS Kotak 50 x 50', '2', 'BTG', 0.3, '2020-12-09', '2020-12-09', '2020-12-09', b'1');

-- ----------------------------
-- Table structure for doc_numbering
-- ----------------------------
DROP TABLE IF EXISTS `doc_numbering`;
CREATE TABLE `doc_numbering`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `periodic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pattern` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_number` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of doc_numbering
-- ----------------------------
INSERT INTO `doc_numbering` VALUES (1, 'Packing List', 'yearly', 'XXXX/PL/PPIC/JO_NO/BMM-PSP/ff/YYYY', 0, '2020-11-29 02:51:59', NULL, b'1');
INSERT INTO `doc_numbering` VALUES (2, 'Delivery Order', 'yearly', 'XXXX/BMM-DO/ff/YYYY', 3, '2020-11-29 02:51:59', '2020-11-29 02:52:39', b'1');
INSERT INTO `doc_numbering` VALUES (3, 'Quotation', 'monthly', 'XXXX/BMM/ff/YYYY', 524, '2020-12-02 22:57:43', NULL, b'1');
INSERT INTO `doc_numbering` VALUES (4, 'Job Order', 'monthly', 'BMM-YY-XXX', 203, '2020-12-02 22:58:15', '2020-12-08 19:14:17', b'1');
INSERT INTO `doc_numbering` VALUES (5, 'Schedule', 'monthly', 'XXXX-JO_NO-PRG-PPIC-FF-YYY', 7, '2020-12-02 22:59:19', NULL, b'1');
INSERT INTO `doc_numbering` VALUES (6, 'BOQ', 'monthly', 'JO_NO/BQ-YY-XXXX', 2030, '2020-12-03 18:55:18', '2020-12-20 17:33:01', b'1');
INSERT INTO `doc_numbering` VALUES (7, 'DKM', 'monthly', 'XXXX/JO_NO/PPIC/FF/YYYY', 6, '2020-12-06 16:48:50', NULL, b'1');
INSERT INTO `doc_numbering` VALUES (8, 'MPK', 'monthly', 'XXXX-JO_NO-PRG-PPIC-FF-YYYY', 33, '2020-12-12 04:24:04', NULL, b'1');

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `minimum_stock` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES (1, 'test', '1', 'BTG', 'a', 'BKG', 'MKG', 10, '2020-12-02 18:26:52', NULL, b'1');

-- ----------------------------
-- Table structure for equipment_detail
-- ----------------------------
DROP TABLE IF EXISTS `equipment_detail`;
CREATE TABLE `equipment_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipment_id` int(11) NULL DEFAULT NULL,
  `inventory_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_received` datetime(0) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of equipment_detail
-- ----------------------------
INSERT INTO `equipment_detail` VALUES (1, 1, 'BM01', '2020-12-02 00:00:00', 'on', 'con', 'mark1', '2020-12-02 18:26:52', NULL, b'1');
INSERT INTO `equipment_detail` VALUES (2, 1, 'BM02', '2020-12-02 00:00:00', NULL, 'con2', 'mark2', '2020-12-02 18:26:52', NULL, b'1');

-- ----------------------------
-- Table structure for equipment_groups
-- ----------------------------
DROP TABLE IF EXISTS `equipment_groups`;
CREATE TABLE `equipment_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of equipment_groups
-- ----------------------------
INSERT INTO `equipment_groups` VALUES (1, 'martin', 'MKG', 'desc', '2020-12-01 21:29:05', '2020-12-02 17:39:17', b'1');

-- ----------------------------
-- Table structure for equipment_type
-- ----------------------------
DROP TABLE IF EXISTS `equipment_type`;
CREATE TABLE `equipment_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of equipment_type
-- ----------------------------
INSERT INTO `equipment_type` VALUES (1, 'test', 'BKG', 'nyanko', '2020-12-01 21:06:11', '2020-12-02 17:39:14', b'1');

-- ----------------------------
-- Table structure for general_setting
-- ----------------------------
DROP TABLE IF EXISTS `general_setting`;
CREATE TABLE `general_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `npwp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `skep` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `header_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of general_setting
-- ----------------------------
INSERT INTO `general_setting` VALUES (1, 'PT. Buana Masa Metalindo', 'Jl. Raya Narogong', 'Bogor', '021 - 867 7086, 867 7087, 867 7088', '021 - 867 7090', '01.0292.0202.39-129392', 'asdfadsf', 'logo_bmm.png', 'logo_letterhead.png', '2020-11-28 20:26:37', '2020-11-28 20:53:20', b'1');

-- ----------------------------
-- Table structure for general_setting_detail
-- ----------------------------
DROP TABLE IF EXISTS `general_setting_detail`;
CREATE TABLE `general_setting_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `general_id` int(11) NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of general_setting_detail
-- ----------------------------
INSERT INTO `general_setting_detail` VALUES (1, 1, 1, '', 'DIRECTOR', '', NULL, '2020-11-28 20:58:43', '2020-11-28 22:50:46', b'1');
INSERT INTO `general_setting_detail` VALUES (2, 1, 2, 'Wiwi Wiliyanto', 'MARKETING MANAGER', '', 'signature_letter.jpg', '2020-11-28 20:58:47', '2020-11-28 22:51:38', b'1');
INSERT INTO `general_setting_detail` VALUES (3, 1, 3, '', 'GENERAL MANAGER', '', NULL, '2020-11-28 20:58:47', '2020-11-28 22:50:46', b'1');
INSERT INTO `general_setting_detail` VALUES (4, 1, 4, '', 'PURCHASING MANAGER', '', 'signature_0letter.jpg', '2020-11-28 20:58:48', '2020-11-28 22:51:20', b'1');
INSERT INTO `general_setting_detail` VALUES (5, 1, 5, '', 'WAREHOUSE MANAGER', '', NULL, '2020-11-28 21:01:08', '2020-11-28 22:50:46', b'1');

-- ----------------------------
-- Table structure for inspection_testplan
-- ----------------------------
DROP TABLE IF EXISTS `inspection_testplan`;
CREATE TABLE `inspection_testplan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NULL DEFAULT NULL,
  `vendor_id` int(11) NULL DEFAULT NULL,
  `contractor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `inspection_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `rev_no` int(11) NULL DEFAULT NULL,
  `doc_rev` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rev_date` datetime(0) NULL DEFAULT NULL,
  `ins_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ins_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `owner_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `main_con_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sub_con_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inspection_testplan
-- ----------------------------

-- ----------------------------
-- Table structure for inspection_testplan_detail
-- ----------------------------
DROP TABLE IF EXISTS `inspection_testplan_detail`;
CREATE TABLE `inspection_testplan_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inspection_textplan_id` int(11) NULL DEFAULT NULL,
  `process` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sub_process` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `applicable` bit(1) NULL DEFAULT NULL,
  `acceptance_criteria` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `verified_document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `inspection_party` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inspection_testplan_detail
-- ----------------------------

-- ----------------------------
-- Table structure for job_detail_discount
-- ----------------------------
DROP TABLE IF EXISTS `job_detail_discount`;
CREATE TABLE `job_detail_discount`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `discount` float NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of job_detail_discount
-- ----------------------------

-- ----------------------------
-- Table structure for job_detail_inv
-- ----------------------------
DROP TABLE IF EXISTS `job_detail_inv`;
CREATE TABLE `job_detail_inv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NULL DEFAULT NULL,
  `invoice_date` date NULL DEFAULT NULL,
  `invoice_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `payment_date` date NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `modified_date` datetime(0) NULL DEFAULT NULL,
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of job_detail_inv
-- ----------------------------
INSERT INTO `job_detail_inv` VALUES (7, 1, '2020-12-09', '', '100', '2020-12-09', '', '', NULL, NULL, b'1');
INSERT INTO `job_detail_inv` VALUES (8, 1, '2020-12-09', '', '200', '2020-12-09', '', '', NULL, NULL, b'1');
INSERT INTO `job_detail_inv` VALUES (9, 1, '2020-12-09', '', '200', '2020-12-09', '', '', NULL, NULL, b'1');
INSERT INTO `job_detail_inv` VALUES (10, 1, '2020-12-09', '', '100', '2020-12-09', '', '', NULL, NULL, b'1');

-- ----------------------------
-- Table structure for job_order
-- ----------------------------
DROP TABLE IF EXISTS `job_order`;
CREATE TABLE `job_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_internal` bit(1) NULL DEFAULT NULL,
  `delivery_date` date NULL DEFAULT NULL,
  `jo_date` date NULL DEFAULT NULL,
  `delivery_destination` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `vat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `construction_fee` float NULL DEFAULT NULL,
  `terms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fabricator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sandblasting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `painting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `asbuiltdrawing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `galvanished` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `erection` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `packing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NDT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `delivery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  `progress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of job_order
-- ----------------------------
INSERT INTO `job_order` VALUES (1, '0001/BMM/XII/2020', 'BMM-20-0001', b'0', '2020-12-03', '2020-12-10', '1', 'IDR', '10', 10, 's', '1', 'Waiting for Approval', '', '', '', '', '', '', '', '', '', '', '', '2020-12-03 18:31:31', '2021-01-28 02:03:13', b'1', NULL);
INSERT INTO `job_order` VALUES (2, '0003/BMM/XII/2020', 'BMM-20-002', b'0', '2020-12-20', NULL, '', '', '10', 0, 'terms', '', 'Waiting for Approval', '', '', '', '', '', '', '', '', '', '', '', '2020-12-20 17:16:18', '2021-01-28 02:03:03', b'1', NULL);

-- ----------------------------
-- Table structure for kickoff_meeting
-- ----------------------------
DROP TABLE IF EXISTS `kickoff_meeting`;
CREATE TABLE `kickoff_meeting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kickoff_meeting
-- ----------------------------

-- ----------------------------
-- Table structure for kickoff_meeting_detail
-- ----------------------------
DROP TABLE IF EXISTS `kickoff_meeting_detail`;
CREATE TABLE `kickoff_meeting_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kickoff_id` int(11) NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `applicable` bit(1) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start_date` datetime(0) NULL DEFAULT NULL,
  `due_date` datetime(0) NULL DEFAULT NULL,
  `rev_date` datetime(0) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kickoff_meeting_detail
-- ----------------------------

-- ----------------------------
-- Table structure for kickoff_meeting_template
-- ----------------------------
DROP TABLE IF EXISTS `kickoff_meeting_template`;
CREATE TABLE `kickoff_meeting_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NULL DEFAULT NULL,
  `parent_item` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `item` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `header` bit(1) NULL DEFAULT NULL,
  `published` bit(1) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kickoff_meeting_template
-- ----------------------------

-- ----------------------------
-- Table structure for marketing_document
-- ----------------------------
DROP TABLE IF EXISTS `marketing_document`;
CREATE TABLE `marketing_document`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jo_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `valid_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `valid_until` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reminder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_active` bit(1) NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of marketing_document
-- ----------------------------
INSERT INTO `marketing_document` VALUES (1, '', 'test', 'aa', 'pexels-photo-924633.jpeg', 'Drawing', '2021-01-08', '2021-01-12', '3', b'1', '1', '2021-02-28 12:38:52', '2021-02-28 12:38:52');
INSERT INTO `marketing_document` VALUES (2, '', 'test', 'sadasdsadasdas', 'img_forest.jpg', 'Drawing', '2021-01-08', '2021-01-14', '4', b'1', '1', '2021-02-28 12:38:52', '2021-02-28 12:38:52');
INSERT INTO `marketing_document` VALUES (3, '', 'test', 'sadasdsadasdas', 'img_forest.jpg', 'Drawing', '2021-01-08', '2021-01-14', '4', b'1', '1', '2021-02-28 12:38:52', '2021-02-28 12:38:52');
INSERT INTO `marketing_document` VALUES (4, 'BMM-20-0001', 'test lagi', 'sss', 'photo-1503023345310-bd7c1de61c7d.jpg', 'Drawing', '2021-01-08', '2021-01-21', '2', b'1', '1', '2021-02-28 12:38:52', '2021-02-28 12:38:52');
INSERT INTO `marketing_document` VALUES (5, 'BMM-20-0001', 'coba lagih ah', 'sdas', 'img_forest.jpg', 'Bill of Quantity', '2021-01-08', '2021-01-12', '2', b'0', '1', '2021-02-28 12:49:26', '2021-02-28 12:49:26');
INSERT INTO `marketing_document` VALUES (6, 'BMM-20-0001', 'coba lagih ah', 'sdas', 'img_forest.jpg', 'Bill of Quantity', '2021-01-08', '2021-01-12', '2', b'0', '1', '2021-02-28 12:38:52', '2021-02-28 12:38:52');
INSERT INTO `marketing_document` VALUES (7, 'BMM-20-0001', 'coba lagih ah', 'sdas', 'img_forest.jpg', 'Bill of Quantity', '2021-01-08', '2021-01-12', '2', b'0', '1', '2021-02-28 12:38:52', '2021-02-28 12:38:52');
INSERT INTO `marketing_document` VALUES (8, 'BMM-20-0001', '', '', '', 'Drawing', '', '', '', b'0', '1', '2021-02-28 12:38:52', '2021-02-28 12:38:52');
INSERT INTO `marketing_document` VALUES (9, 'BMM-20-0001', 'a', '', '', 'Drawing', '', '', '', b'0', '1', '2021-02-28 12:38:52', '2021-02-28 12:38:52');

-- ----------------------------
-- Table structure for master_material
-- ----------------------------
DROP TABLE IF EXISTS `master_material`;
CREATE TABLE `master_material`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `part_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `product_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `product_category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `discontinued` bit(1) NULL DEFAULT NULL,
  `wip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `vendor_outsource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `warehouse_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `packing_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `iqc_check` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit_measures` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dimension_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `material_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `material_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `material_density` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weight_factor` float NULL DEFAULT NULL,
  `surface_area` float NULL DEFAULT NULL,
  `hs_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `point_factor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `length` float NULL DEFAULT NULL,
  `width` float NULL DEFAULT NULL,
  `thick` float NULL DEFAULT NULL,
  `weight` float NULL DEFAULT 0,
  `wielding_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `drawing_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `volume_formula` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `area_formula` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `minimum_order_qty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `minimum_stock` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `process_cost` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `process_cost_supplier_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lead_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `material_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 558 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of master_material
-- ----------------------------
INSERT INTO `master_material` VALUES (1, 'RBS008', '', 'As dia.8 (SS-304)\r\n', 'STEEL', 'BKG', NULL, NULL, NULL, '', '', '', '', '', 'BTG', 'Area', 'AS', '2', NULL, 0.305164, 1, '', '', 50, 270, 8, 0.00694444, 'NSN-308', '', 'length*width*thick', 'length*3.143*8', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-03 22:17:48', '2020-12-03 23:55:00', b'1');
INSERT INTO `master_material` VALUES (3, 'RBS010', NULL, 'As dia.10 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 10, 10, 0, NULL, NULL, 'length*width*thick', 'length*3.143*10', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (4, 'RBS012', NULL, 'As dia.12 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 12, 12, 0, NULL, NULL, 'length*width*thick', 'length*3.143*12', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (5, 'RBS016', NULL, 'As dia.16 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 16, 16, 0, NULL, NULL, 'length*width*thick', 'length*3.143*16', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (6, 'RBS019', NULL, 'As dia.19 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 19, 19, 0, NULL, NULL, 'length*width*thick', 'length*3.143*19', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (7, 'RBS020', NULL, 'As dia.20 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 20, 20, 0, NULL, NULL, 'length*width*thick', 'length*3.143*20', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (8, 'RBS022', NULL, 'As dia.22 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 22, 22, 0, NULL, NULL, 'length*width*thick', 'length*3.143*22', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (9, 'RBS025', NULL, 'As dia.25 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 25, 25, 0, NULL, NULL, 'length*width*thick', 'length*3.143*25', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (10, 'RBS030', NULL, 'As dia.30 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 30, 30, 0, NULL, NULL, 'length*width*thick', 'length*3.143*30', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (11, 'RBS035', NULL, 'As dia.35 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 35, 35, 0, NULL, NULL, 'length*width*thick', 'length*3.143*35', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (12, 'RBS040', NULL, 'As dia.40 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 40, 40, 0, NULL, NULL, 'length*width*thick', 'length*3.143*40', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (13, 'RBS045', NULL, 'As dia.45 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 45, 45, 0, NULL, NULL, 'length*width*thick', 'length*3.143*45', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (14, 'RBS050', NULL, 'As dia.50 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 50, 50, 0, NULL, NULL, 'length*width*thick', 'length*3.143*50', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (15, 'RBS055', NULL, 'As dia.55 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 55, 55, 0, NULL, NULL, 'length*width*thick', 'length*3.143*55', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (16, 'RBS060', NULL, 'As dia.60 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 60, 60, 0, NULL, NULL, 'length*width*thick', 'length*3.143*60', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (17, 'RBS065', NULL, 'As dia.65 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 65, 65, 0, NULL, NULL, 'length*width*thick', 'length*3.143*65', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (18, 'RBS070', NULL, 'As dia.70 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 70, 70, 0, NULL, NULL, 'length*width*thick', 'length*3.143*70', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (19, 'RBS075', NULL, 'As dia.75 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 75, 75, 0, NULL, NULL, 'length*width*thick', 'length*3.143*75', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (20, 'RBS080', NULL, 'As dia.80 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 80, 80, 0, NULL, NULL, 'length*width*thick', 'length*3.143*80', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (21, 'RBS085', NULL, 'As dia.85 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 85, 85, 0, NULL, NULL, 'length*width*thick', 'length*3.143*85', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (22, 'RBS090', NULL, 'As dia.90 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 90, 90, 0, NULL, NULL, 'length*width*thick', 'length*3.143*90', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (23, 'RBS095', NULL, 'As dia.95 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 95, 95, 0, NULL, NULL, 'length*width*thick', 'length*3.143*95', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (24, 'RBS100', NULL, 'As dia.100 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 100, 100, 0, NULL, NULL, 'length*width*thick', 'length*3.143*100', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (25, 'RBS105', NULL, 'As dia.105 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 105, 105, 0, NULL, NULL, 'length*width*thick', 'length*3.143*105', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (26, 'RBS110', NULL, 'As dia.110 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 110, 110, 0, NULL, NULL, 'length*width*thick', 'length*3.143*110', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (27, 'RBS115', NULL, 'As dia.115 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 115, 115, 0, NULL, NULL, 'length*width*thick', 'length*3.143*115', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (28, 'RBS120', NULL, 'As dia.120 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 120, 120, 0, NULL, NULL, 'length*width*thick', 'length*3.143*120', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (29, 'RBS130', NULL, 'As dia.130 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 130, 130, 0, NULL, NULL, 'length*width*thick', 'length*3.143*130', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (30, 'RBS140', NULL, 'As dia.140 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 140, 140, 0, NULL, NULL, 'length*width*thick', 'length*3.143*140', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (31, 'RBS150', NULL, 'As dia.150 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 150, 150, 0, NULL, NULL, 'length*width*thick', 'length*3.143*150', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (32, 'RBS160', NULL, 'As dia.160 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 160, 160, 0, NULL, NULL, 'length*width*thick', 'length*3.143*160', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_material` VALUES (33, 'RBS170', NULL, 'As dia.170 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 170, 170, 0, NULL, NULL, 'length*width*thick', 'length*3.143*170', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (34, 'RBS180', NULL, 'As dia.180 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 180, 180, 0, NULL, NULL, 'length*width*thick', 'length*3.143*180', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (35, 'RBS190', NULL, 'As dia.190 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 190, 190, 0, NULL, NULL, 'length*width*thick', 'length*3.143*190', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (36, 'RBS200', NULL, 'As dia.200 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 200, 200, 0, NULL, NULL, 'length*width*thick', 'length*3.143*200', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (37, 'RBS250', NULL, 'As dia.250 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 250, 250, 0, NULL, NULL, 'length*width*thick', 'length*3.143*250', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (38, 'RBS300', NULL, 'As dia.300 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 300, 300, 0, NULL, NULL, 'length*width*thick', 'length*3.143*300', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (39, 'RBS350', NULL, 'As dia.350 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 350, 350, 0, NULL, NULL, 'length*width*thick', 'length*3.143*350', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (40, 'PLS001', NULL, 'Plate 1.65 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 4000, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (41, 'PLS002', NULL, 'Plate 2 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 4000, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (42, 'PLS003', NULL, 'Plate 3 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 6000, 270, 3, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (43, 'PLS004', NULL, 'Plate 4 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 8000, 270, 4, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (44, 'PLS005', NULL, 'Plate 5 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 12000, 270, 5, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (45, 'PLS006', NULL, 'Plate 6 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 12000, 270, 6, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (46, 'PLS007', NULL, 'Plate 8 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 12000, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (47, 'PLS008', NULL, 'Plate 10 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 16000, 270, 10, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (48, 'PLS009', NULL, 'Plate 12 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 16000, 270, 12, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (49, 'PLS010', NULL, 'Plate 16 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 20000, 270, 16, 4.0404, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (50, 'PLS011', NULL, 'Plate 18 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 20000, 270, 18, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (51, 'PLS012', NULL, 'Plate 20 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 24000, 270, 20, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (52, 'PLS013', NULL, 'Plate 22 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 24000, 270, 22, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (53, 'PLS014', NULL, 'Plate 25 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 28000, 270, 25, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (54, 'PLS401', NULL, 'Plate 1.65 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 7320, 270, 2, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (55, 'PLS402', NULL, 'Plate 2 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 7320, 270, 2, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (56, 'PLS403', NULL, 'Plate 3 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 14640, 270, 3, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (57, 'PLS404', NULL, 'Plate 4 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 14640, 270, 4, 0, NULL, NULL, 'length*width*thick', 'length*width*2\r\n', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (58, 'PLS405', NULL, 'Plate 5 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 21960, 270, 5, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (59, 'PLS406', NULL, 'Plate 6 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 21960, 270, 6, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (60, 'PLS408', NULL, 'Plate 8 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 21960, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (61, 'PLS410', NULL, 'Plate 10 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 29280, 270, 10, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (62, 'PLS412', NULL, 'Plate 12 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 29280, 270, 12, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (63, 'PLS416', NULL, 'Plate 16 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 36600, 270, 16, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (64, 'PLS418', NULL, 'Plate 18 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 36600, 270, 18, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (65, 'PLS420', NULL, 'Plate 20 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 43920, 270, 20, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (66, 'PLS422', NULL, 'Plate 22 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 43920, 270, 22, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (67, 'PLS425', NULL, 'Plate 25 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 51240, 270, 25, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (68, 'PLS503', NULL, 'Plate 3 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 30480, 270, 3, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (69, 'PLS504', NULL, 'Plate 4 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 30480, 270, 4, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (70, 'PLS505', NULL, 'Plate 5 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 45720, 270, 5, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (71, 'PLS506', NULL, 'Plate 6 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 45720, 270, 6, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (72, 'PLS508', NULL, 'Plate 8 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 45720, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (73, 'PLS510', NULL, 'Plate 10 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 60960, 270, 10, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (74, 'PLS512', NULL, 'Plate 12 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 60960, 270, 12, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (75, 'PLS516', NULL, 'Plate 16 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 76200, 270, 16, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (76, 'PLS518', NULL, 'Plate 18 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 76200, 270, 18, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (77, 'PLS520', NULL, 'Plate 20 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 91440, 270, 20, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (78, 'PLS522', NULL, 'Plate 22 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 91440, 270, 22, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (79, 'PLS525', NULL, 'Plate 25 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 106680, 270, 25, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (80, 'PLS603', NULL, 'Plate 3 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 31696, 270, 3, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (81, 'PLS604', NULL, 'Plate 4 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 31696, 270, 4, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (82, 'PLS605', NULL, 'Plate 5 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 47544, 270, 5, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (83, 'PLS606', NULL, 'Plate 6 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 47544, 270, 6, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (84, 'PLS608', NULL, 'Plate 8 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 47544, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (85, 'PLS610', NULL, 'Plate 10 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 63392, 270, 10, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (86, 'PLS612', NULL, 'Plate 12 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 63392, 270, 12, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (87, 'PLS616', NULL, 'Plate 16 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 79240, 270, 16, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (88, 'PLS618', NULL, 'Plate 18 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 79240, 270, 18, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (89, 'PLS620', NULL, 'Plate 20 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 95088, 270, 20, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (90, 'PLS622', NULL, 'Plate 22 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 95088, 270, 22, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (91, 'PLS625', NULL, 'Plate 25 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 110936, 270, 25, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (92, 'PPS003-5', NULL, 'Pipe sch.5 dia. 1/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.234, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (93, 'PPS003-10', NULL, 'Pipe sch.10 dia. 1/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.275, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (94, 'PPS003-20', NULL, 'Pipe sch.20 dia. 1/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.333, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (95, 'PPS003-40', NULL, 'Pipe sch.40 dia. 1/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.369, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (96, 'PPS003-80', NULL, 'Pipe sch.80 dia. 1/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.479, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (97, 'PPS006-5', NULL, 'Pipe sch.5 dia. 1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.373, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (98, 'PPS006-10', NULL, 'Pipe sch.10 dia. 1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.494, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (99, 'PPS006-20', NULL, 'Pipe sch.20 dia. 1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.562, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (100, 'PPS006-40', NULL, 'Pipe sch.40 dia. 1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.629, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (101, 'PPS006-80', NULL, 'Pipe sch.80 dia. 1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.799, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (102, 'PPS010-5', NULL, 'Pipe sch.5 dia. 3/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.476, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (103, 'PPS010-10', NULL, 'Pipe sch.10 dia. 3/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.637, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (104, 'PPS010-20', NULL, 'Pipe sch.20 dia. 3/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.755, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (105, 'PPS010-40', NULL, 'Pipe sch.40 dia. 3/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.851, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (106, 'PPS010-80', NULL, 'Pipe sch.80 dia. 3/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.11, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (107, 'PPS013-5', NULL, 'Pipe sch.5 dia. 1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.816, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (108, 'PPS013-10', NULL, 'Pipe sch.10 dia. 1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.02, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (109, 'PPS013-20', NULL, 'Pipe sch.20 dia. 1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.18, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (110, 'PPS013-40', NULL, 'Pipe sch.40 dia. 1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.31, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (111, 'PPS013-80', NULL, 'Pipe sch.80 dia. 1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.64, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (112, 'PPS013-160', NULL, 'Pipe sch.160 dia. 1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.97, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (113, 'PPS020-5', NULL, 'Pipe sch.5 dia. 3/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.04, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (114, 'PPS020-10', NULL, 'Pipe sch.10 dia. 3/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.3, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (115, 'PPS020-20', NULL, 'Pipe sch.20 dia. 3/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.52, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (116, 'PPS020-40', NULL, 'Pipe sch.40 dia. 3/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.74, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (117, 'PPS020-80', NULL, 'Pipe sch.80 dia. 3/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.24, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (118, 'PPS020-160', NULL, 'Pipe sch.160 dia. 3/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.94, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (119, 'PPS025-5', NULL, 'Pipe sch.5 dia. 1\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.32, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (120, 'PPS025-10', NULL, 'Pipe sch.10 dia. 1\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.15, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (121, 'PPS025-20', NULL, 'Pipe sch.20 dia. 1\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.29, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (122, 'PPS025-40', NULL, 'Pipe sch.40 dia. 1\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.52, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (123, 'PPS025-80', NULL, 'Pipe sch.80 dia. 1\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.27, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (124, 'PPS025-160', NULL, 'Pipe sch.160 dia. 1\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4.36, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (125, 'PPS032-5', NULL, 'Pipe sch.5 dia. 1-1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.67, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (126, 'PPS032-10', NULL, 'Pipe sch.10 dia. 1-1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.76, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (127, 'PPS032-20', NULL, 'Pipe sch.20 dia. 1-1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.94, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (128, 'PPS032-40', NULL, 'Pipe sch.40 dia. 1-1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.47, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (129, 'PPS032-80', NULL, 'Pipe sch.80 dia. 1-1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4.57, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (130, 'PPS032-160', NULL, 'Pipe sch.160 dia. 1-1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5.73, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (131, 'PPS040-5', NULL, 'Pipe sch.5 dia. 1-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.91, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (132, 'PPS040-10', NULL, 'Pipe sch.10 dia. 1-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.16, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (133, 'PPS040-20', NULL, 'Pipe sch.20 dia. 1-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.37, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (134, 'PPS040-40', NULL, 'Pipe sch.40 dia. 1-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4.1, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (135, 'PPS040-80', NULL, 'Pipe sch.80 dia. 1-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5.47, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (136, 'PPS040-160', NULL, 'Pipe sch.160 dia. 1-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 7.29, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (137, 'PPS050-5', NULL, 'Pipe sch.5 dia. 2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.39, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (138, 'PPS050-10', NULL, 'Pipe sch.10 dia. 2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.98, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (139, 'PPS050-20', NULL, 'Pipe sch.20 dia. 2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4.92, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (140, 'PPS050-40', NULL, 'Pipe sch.40 dia. 2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5440000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*60', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (141, 'PPS050-80', NULL, 'Pipe sch.80 dia. 2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 7.49, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (142, 'PPS050-160', NULL, 'Pipe sch.160 dia. 2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 11.1, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (143, 'PPS065-5', NULL, 'Pipe sch.5 dia. 2-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.84, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (144, 'PPS065-10', NULL, 'Pipe sch.10 dia. 2-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5.42, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (145, 'PPS065-20', NULL, 'Pipe sch.20 dia. 2-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 6.2, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (146, 'PPS065-40', NULL, 'Pipe sch.40 dia. 2-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 9.12, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (147, 'PPS065-80', NULL, 'Pipe sch.80 dia. 2-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 12, NULL, NULL, NULL, 1440, 270, 8, 0.290909, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (148, 'PPS065-160', NULL, 'Pipe sch.160 dia. 2-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 15.6, NULL, NULL, NULL, 1440, 270, 8, 0.290909, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (149, 'PPS075-5', NULL, 'Pipe sch.5 dia. 3\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4.51, NULL, NULL, NULL, 1132, 270, 8, 0.157222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (150, 'PPS075-10', NULL, 'Pipe sch.10 dia. 3\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 6.37, NULL, NULL, NULL, 1132, 270, 8, 0.157222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (151, 'PPS075-20', NULL, 'Pipe sch.20 dia. 3\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 8.39, NULL, NULL, NULL, 1132, 270, 8, 0.157222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (152, 'PPS075-40', NULL, 'Pipe sch.40 dia. 3\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 11300000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*89', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (153, 'PPS075-80', NULL, 'Pipe sch.80 dia. 3\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 15.3, NULL, NULL, NULL, 1698, 270, 8, 0.34303, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (154, 'PPS075-160', NULL, 'Pipe sch.160 dia. 3\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 21.4, NULL, NULL, NULL, 1698, 270, 8, 0.34303, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (155, 'PPS100-5', NULL, 'Pipe sch.5 dia. 4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5.81, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (156, 'PPS100-10', NULL, 'Pipe sch.10 dia. 4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 8.23, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (157, 'PPS100-20', NULL, 'Pipe sch.20 dia. 4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 10.9, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (158, 'PPS100-40', NULL, 'Pipe sch.40 dia. 4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 16, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (159, 'PPS100-80', NULL, 'Pipe sch.80 dia. 4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 22.4, NULL, NULL, NULL, 2160, 270, 8, 0.436364, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (160, 'PPS100-120', NULL, 'Pipe sch.120 dia. 4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 28.2, NULL, NULL, NULL, 2160, 270, 8, 0.436364, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (161, 'PPS100-160', NULL, 'Pipe sch.160 dia. 4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 32.8, NULL, NULL, NULL, 2160, 270, 8, 0.436364, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (162, 'PPS130-5', NULL, 'Pipe sch.5 dia. 5\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 9.48, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (163, 'PPS130-10', NULL, 'Pipe sch.10 dia. 5\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 11.4, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (164, 'PPS130-20', NULL, 'Pipe sch.20 dia. 5\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 16.6, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (165, 'PPS130-40', NULL, 'Pipe sch.40 dia. 5\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 21.77, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (166, 'PPS130-80', NULL, 'Pipe sch.80 dia. 5\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 30.5, NULL, NULL, NULL, 2670, 270, 8, 0.539394, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (167, 'PPS130-120', NULL, 'Pipe sch.120 dia. 5\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 39.8, NULL, NULL, NULL, 2670, 270, 8, 0.539394, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (168, 'PPS130-160', NULL, 'Pipe sch.160 dia. 5\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 48.6, NULL, NULL, NULL, 2670, 270, 8, 0.539394, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (169, 'PPS150-5', NULL, 'Pipe sch.5 dia. 6\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 11.2, NULL, NULL, NULL, 2120, 270, 8, 0.294444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (170, 'PPS150-10', NULL, 'Pipe sch.10 dia. 6\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 13.62, NULL, NULL, NULL, 2120, 270, 8, 0.294444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (171, 'PPS150-20', NULL, 'Pipe sch.20 dia. 6\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 19.8, NULL, NULL, NULL, 2120, 270, 8, 0.294444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (172, 'PPS150-40', NULL, 'Pipe sch.40 dia. 6\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 27.7, NULL, NULL, NULL, 3180, 270, 8, 0.642424, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (173, 'PPS150-80', NULL, 'Pipe sch.80 dia. 6\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 41.8, NULL, NULL, NULL, 3180, 270, 8, 0.642424, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (174, 'PPS150-120', NULL, 'Pipe sch.120 dia. 6\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 53.2, NULL, NULL, NULL, 3180, 270, 8, 0.642424, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (175, 'PPS150-160', NULL, 'Pipe sch.160 dia. 6\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 66, NULL, NULL, NULL, 3180, 270, 8, 0.642424, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (176, 'PPS200-5', NULL, 'Pipe sch.5 dia. 8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 14.76, NULL, NULL, NULL, 2800, 270, 8, 0.388889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (177, 'PPS200-10', NULL, 'Pipe sch.10 dia. 8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 20.9, NULL, NULL, NULL, 2800, 270, 8, 0.388889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (178, 'PPS200-20', NULL, 'Pipe sch.20 dia. 8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 33.8, NULL, NULL, NULL, 2800, 270, 8, 0.388889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (179, 'PPS200-40', NULL, 'Pipe sch.40 dia. 8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 42.1, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (180, 'PPS200-80', NULL, 'Pipe sch.80 dia. 8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 63.8, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (181, 'PPS200-120', NULL, 'Pipe sch.120 dia. 8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 88.9, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (182, 'PPS200-160', NULL, 'Pipe sch.160 dia. 8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 110, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (183, 'PPS250-5', NULL, 'Pipe sch.5 dia. 10\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 22.1, NULL, NULL, NULL, 3440, 270, 8, 0.477778, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (184, 'PPS250-10', NULL, 'Pipe sch.10 dia. 10\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 26, NULL, NULL, NULL, 3440, 270, 8, 0.477778, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (185, 'PPS250-20', NULL, 'Pipe sch.20 dia. 10\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 41.8, NULL, NULL, NULL, 3440, 270, 8, 0.477778, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (186, 'PPS250-40', NULL, 'Pipe sch.40 dia. 10\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 59.2, NULL, NULL, NULL, 8600, 270, 8, 1.73737, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (187, 'PPS250-80', NULL, 'Pipe sch.80 dia. 10\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 93, NULL, NULL, NULL, 10320, 270, 8, 2.08485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (188, 'PPS250-120', NULL, 'Pipe sch.120 dia. 10\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 130, NULL, NULL, NULL, 10320, 270, 8, 2.08485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (189, 'PPS250-160', NULL, 'Pipe sch.160 dia. 10\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 168, NULL, NULL, NULL, 10320, 270, 8, 2.08485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (190, 'PPS300-5', NULL, 'Pipe sch.5 dia. 12\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 31, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (191, 'PPS300-10', NULL, 'Pipe sch.10 dia. 12\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 34.8, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (192, 'PPS300-20', NULL, 'Pipe sch.20 dia. 12\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 50, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (193, 'PPS300-40', NULL, 'Pipe sch.40 dia. 12\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 78.3, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (194, 'PPS300-80', NULL, 'Pipe sch.80 dia. 12\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 129, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (195, 'PPS300-120', NULL, 'Pipe sch.120 dia. 12\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 181, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (196, 'PPS300-160', NULL, 'Pipe sch.160 dia. 12\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 234, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (197, 'PLC001', NULL, 'Plate 1.65 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 4000, 270, 2, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (198, 'PLC003', NULL, 'Plate 3 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 8000, 270, 3, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (199, 'PLC004', NULL, 'Plate 4 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 8000, 270, 4, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (200, 'PLC005', NULL, 'Plate 5 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 12000, 270, 5, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (201, 'PLC006', NULL, 'Plate 6 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 12000, 270, 6, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (202, 'PLC008', NULL, 'Plate 8 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 12000, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (203, 'PLC010', NULL, 'Plate 10 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 10, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (204, 'PLC012', NULL, 'Plate 12 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 12, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (205, 'PLC016', NULL, 'Plate 16 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 16, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (206, 'PLC018', NULL, 'Plate 18 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 141.3, NULL, NULL, NULL, 20000, 270, 8, 7.40741, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (207, 'PLC020', NULL, 'Plate 20 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 24000, 270, 20, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (208, 'PLC022', NULL, 'Plate 22 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 172.7, NULL, NULL, NULL, 24000, 270, 8, 8.88889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (209, 'PLC025', NULL, 'Plate 25 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 25, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (210, 'PLC401', NULL, 'Plate 1.65 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 38.557, NULL, NULL, NULL, 7320, 270, 8, 1.01667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (211, 'PLC403', NULL, 'Plate 3 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 70.1036, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (212, 'PLC404', NULL, 'Plate 4 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 93.4715, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (213, 'PLC405', NULL, 'Plate 5 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 116.839, NULL, NULL, NULL, 21960, 270, 8, 3.05, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (214, 'PLC406', NULL, 'Plate 6 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 140.207, NULL, NULL, NULL, 21960, 270, 8, 3.05, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (215, 'PLC408', NULL, 'Plate 8 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 186.943, NULL, NULL, NULL, 21960, 270, 8, 4.43636, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (216, 'PLC410', NULL, 'Plate 10 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 233.679, NULL, NULL, NULL, 29280, 270, 8, 5.91515, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (217, 'PLC412', NULL, 'Plate 12 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 280.415, NULL, NULL, NULL, 29280, 270, 8, 5.91515, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (218, 'PLC416', NULL, 'Plate 16 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 373.886, NULL, NULL, NULL, 36600, 270, 8, 7.39394, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (219, 'PLC418', NULL, 'Plate 18 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 420.622, NULL, NULL, NULL, 36600, 270, 8, 13.5556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (220, 'PLC420', NULL, 'Plate 20 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 467.358, NULL, NULL, NULL, 43920, 270, 8, 16.2667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (221, 'PLC422', NULL, 'Plate 22 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 514.093, NULL, NULL, NULL, 43920, 270, 8, 16.2667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (222, 'PLC425', NULL, 'Plate 25 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 584.197, NULL, NULL, NULL, 51240, 270, 8, 10.3515, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (223, 'PLC503', NULL, 'Plate 3 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 218.787, NULL, NULL, NULL, 30480, 270, 8, 4.23333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (224, 'PLC504', NULL, 'Plate 4 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 291.716, NULL, NULL, NULL, 30480, 270, 8, 4.23333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (225, 'PLC505', NULL, 'Plate 5 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 364.644, NULL, NULL, NULL, 45720, 270, 8, 6.35, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (226, 'PLC506', NULL, 'Plate 6 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 437.573, NULL, NULL, NULL, 45720, 270, 8, 6.35, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (227, 'PLC508', NULL, 'Plate 8 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 583.431, NULL, NULL, NULL, 45720, 270, 8, 9.23636, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (228, 'PLC510', NULL, 'Plate 10 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 729.289, NULL, NULL, NULL, 60960, 270, 8, 12.3152, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (229, 'PLC512', NULL, 'Plate 12 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 875.147, NULL, NULL, NULL, 60960, 270, 8, 12.3152, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (230, 'PLC516', NULL, 'Plate 16 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1166.86, NULL, NULL, NULL, 76200, 270, 8, 15.3939, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (231, 'PLC518', NULL, 'Plate 18 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1312.72, NULL, NULL, NULL, 76200, 270, 8, 28.2222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (232, 'PLC520', NULL, 'Plate 20 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1458.58, NULL, NULL, NULL, 91440, 270, 8, 33.8667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (233, 'PLC522', NULL, 'Plate 22 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1604.44, NULL, NULL, NULL, 91440, 270, 8, 33.8667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (234, 'PLC525', NULL, 'Plate 25 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1823.22, NULL, NULL, NULL, 106680, 270, 8, 21.5515, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (235, 'PLC603', NULL, 'Plate 3 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 262.429, NULL, NULL, NULL, 31696, 270, 8, 4.40222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (236, 'PLC604', NULL, 'Plate 4 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 349.906, NULL, NULL, NULL, 31696, 270, 8, 4.40222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (237, 'PLC605', NULL, 'Plate 5 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 437.382, NULL, NULL, NULL, 47544, 270, 8, 6.60333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (238, 'PLC606', NULL, 'Plate 6 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 524.858, NULL, NULL, NULL, 47544, 270, 8, 6.60333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (239, 'PLC608', NULL, 'Plate 8 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 699.811, NULL, NULL, NULL, 47544, 270, 8, 9.60485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (240, 'PLC610', NULL, 'Plate 10 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 874.764, NULL, NULL, NULL, 63392, 270, 8, 12.8065, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (241, 'PLC612', NULL, 'Plate 12 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1049.72, NULL, NULL, NULL, 63392, 270, 8, 12.8065, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (242, 'PLC616', NULL, 'Plate 16 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1399.62, NULL, NULL, NULL, 79240, 270, 8, 16.0081, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (243, 'PLC618', NULL, 'Plate 18 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1574.57, NULL, NULL, NULL, 79240, 270, 8, 29.3481, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (244, 'PLC620', NULL, 'Plate 20 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1749.53, NULL, NULL, NULL, 95088, 270, 8, 35.2178, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (245, 'PLC622', NULL, 'Plate 22 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1924.48, NULL, NULL, NULL, 95088, 270, 8, 35.2178, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (246, 'PLC625', NULL, 'Plate 25 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 2186.91, NULL, NULL, NULL, 110936, 270, 8, 22.4113, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (247, 'CP023', NULL, 'Chk. Plate 2.3 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 19.8214, NULL, NULL, NULL, 8000, 270, 8, 1.11111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (248, 'CP030', NULL, 'Chk. Plate 3 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 25.854, NULL, NULL, NULL, 8000, 270, 8, 1.11111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (249, 'CP032', NULL, 'Chk. Plate 3.2 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 27.5776, NULL, NULL, NULL, 8000, 270, 8, 1.11111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (250, 'CP040', NULL, 'Chk. Plate 4 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 34.472, NULL, NULL, NULL, 8000, 270, 8, 1.11111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (251, 'CP045', NULL, 'Chk. Plate 4.5 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 38.781, NULL, NULL, NULL, 8000, 270, 8, 1.11111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (252, 'CP050', NULL, 'Chk. Plate 5 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 43.09, NULL, NULL, NULL, 8000, 270, 8, 1.11111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (253, 'CP060', NULL, 'Chk. Plate 6 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 51.708, NULL, NULL, NULL, 8000, 270, 8, 1.11111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (254, 'CP080', NULL, 'Chk. Plate 8 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 68.944, NULL, NULL, NULL, 12000, 270, 8, 2.42424, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (255, 'CP090', NULL, 'Chk. Plate 9 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 77.562, NULL, NULL, NULL, 12000, 270, 8, 2.42424, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (256, 'CP423', NULL, 'Chk. Plate 2.3 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 59.0043, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (257, 'CP430', NULL, 'Chk. Plate 3 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 76.9622, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (258, 'CP432', NULL, 'Chk. Plate 3.2 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 82.093, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (259, 'CP440', NULL, 'Chk. Plate 4 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 102.616, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (260, 'CP445', NULL, 'Chk. Plate 4.5 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 115.443, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (261, 'CP450', NULL, 'Chk. Plate 5 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 128.27, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (262, 'CP460', NULL, 'Chk. Plate 6 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 153.924, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (263, 'CP480', NULL, 'Chk. Plate 8 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 205.232, NULL, NULL, NULL, 21960, 270, 8, 4.43636, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (264, 'CP490', NULL, 'Chk. Plate 9 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 230.887, NULL, NULL, NULL, 21960, 270, 8, 4.43636, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (265, 'PPC013-M', NULL, 'Pipe med. dia. 1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.22, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (266, 'PPC013-10', NULL, 'Pipe sch.10 dia. 1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (267, 'PPC013-40', NULL, 'Pipe sch.40 dia. 1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.27, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (268, 'PPC013-80', NULL, 'Pipe sch.80 dia. 1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.62, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (269, 'PPC020-M', NULL, 'Pipe med. dia. 3/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.58, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (270, 'PPC020-10', NULL, 'Pipe sch.10 dia. 3/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.28, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (271, 'PPC020-40', NULL, 'Pipe sch.40 dia. 3/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.68, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (272, 'PPC020-80', NULL, 'Pipe sch.80 dia. 3/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.19, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (273, 'PPC025-M', NULL, 'Pipe med. dia. 1\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.44, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (274, 'PPC025-10', NULL, 'Pipe sch.10 dia. 1\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.09, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (275, 'PPC025-40', NULL, 'Pipe sch.40 dia. 1\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.5, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (276, 'PPC025-80', NULL, 'Pipe sch.80 dia. 1\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.24, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (277, 'PPC032-M', NULL, 'Pipe med. dia. 1-1/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.14, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (278, 'PPC032-10', NULL, 'Pipe sch.10 dia. 1-1/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.69, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (279, 'PPC032-40', NULL, 'Pipe sch.40 dia. 1-1/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3470000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*42', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (280, 'PPC032-80', NULL, 'Pipe sch.80 dia. 1-1/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4.46, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (281, 'PPC040-M', NULL, 'Pipe med. dia. 1-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.62, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (282, 'PPC040-10', NULL, 'Pipe sch.10 dia. 1-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.11, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (283, 'PPC040-40', NULL, 'Pipe sch.40 dia. 1-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4100000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*48', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (284, 'PPC040-80', NULL, 'Pipe sch.80 dia. 1-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5.41, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (285, 'PPC050-M', NULL, 'Pipe med. dia. 2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5100000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*60', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (286, 'PPC050-10', NULL, 'Pipe sch.10 dia. 2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.93, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (287, 'PPC050-20', NULL, 'Pipe sch.20 dia. 2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4.51, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (288, 'PPC050-40', NULL, 'Pipe sch.40 dia. 2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5440000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*60', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (289, 'PPC050-80', NULL, 'Pipe sch.80 dia. 2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 7.49, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (290, 'PPC065-M', NULL, 'Pipe med. dia. 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 6510000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*76', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (291, 'PPC065-10', NULL, 'Pipe sch.10 dia. 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5.26, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (292, 'PPC065-20', NULL, 'Pipe sch.20 dia. 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 7.6, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (293, 'PPC065-40', NULL, 'Pipe sch.40 dia. 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 8.64, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (294, 'PPC065-80', NULL, 'Pipe sch.80 dia. 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 11.41, NULL, NULL, NULL, 1440, 270, 8, 0.290909, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (295, 'PPC075-M', NULL, 'Pipe med. dia. 3\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 8.47, NULL, NULL, NULL, 1132, 270, 8, 0.157222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (296, 'PPC075-10', NULL, 'Pipe sch.10 dia. 3\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 6.46, NULL, NULL, NULL, 1132, 270, 8, 0.157222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (297, 'PPC075-20', NULL, 'Pipe sch.20 dia. 3\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 9.37, NULL, NULL, NULL, 1132, 270, 8, 0.157222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (298, 'PPC075-40', NULL, 'Pipe sch.40 dia. 3\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 11290000, NULL, NULL, NULL, 1000, 1, 1, 0.157222, NULL, NULL, 'length*width*thick', 'length*3.143*89', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (299, 'PPC075-80', NULL, 'Pipe sch.80 dia. 3\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 15.27, NULL, NULL, NULL, 1698, 270, 8, 0.34303, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (300, 'PPC090-10', NULL, 'Pipe sch.10 dia. 3-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 7.41, NULL, NULL, NULL, 1280, 270, 8, 0.177778, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (301, 'PPC090-40', NULL, 'Pipe sch.40 dia. 3-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 13.57, NULL, NULL, NULL, 1280, 270, 8, 0.177778, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (302, 'PPC090-80', NULL, 'Pipe sch.80 dia. 3-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 18.63, NULL, NULL, NULL, 1920, 270, 8, 0.387879, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (303, 'PPC100-M', NULL, 'Pipe med. dia. 4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 12.1, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (304, 'PPC100-10', NULL, 'Pipe sch.10 dia. 4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 8.37, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (305, 'PPC100-20', NULL, 'Pipe sch.20 dia. 4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 13.22, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (306, 'PPC100-40', NULL, 'Pipe sch.40 dia. 4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 16070000, NULL, NULL, NULL, 1000, 1, 1, 0.2, NULL, NULL, 'length*width*thick', 'length*3.143*114', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (307, 'PPC100-80', NULL, 'Pipe sch.80 dia. 4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 22.32, NULL, NULL, NULL, 2160, 270, 8, 0.436364, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (308, 'PPC125-M', NULL, 'Pipe med. dia. 5\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 16.2, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (309, 'PPC125-10', NULL, 'Pipe sch.10 dia. 5\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 11.56, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (310, 'PPC125-20', NULL, 'Pipe sch.20 dia. 5\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 17.13, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (311, 'PPC125-40', NULL, 'Pipe sch.40 dia. 5\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 21.77, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (312, 'PPC125-80', NULL, 'Pipe sch.80 dia. 5\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 30.97, NULL, NULL, NULL, 2670, 270, 8, 0.539394, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (313, 'PPC150-M', NULL, 'Pipe med. dia. 6\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 19.2, NULL, NULL, NULL, 2120, 270, 8, 0.294444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (314, 'PPC150-10', NULL, 'Pipe sch.10 dia. 6\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 13820000, NULL, NULL, NULL, 1000, 1, 1, 0.294444, NULL, NULL, 'length*width*thick', 'length*3.143*168', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (315, 'PPC150-20', NULL, 'Pipe sch.20 dia. 6\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 22.08, NULL, NULL, NULL, 2120, 270, 8, 0.294444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (316, 'PPC150-40', NULL, 'Pipe sch.40 dia. 6\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 28260000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*168', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (317, 'PPC150-80', NULL, 'Pipe sch.80 dia. 6\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 42.56, NULL, NULL, NULL, 3180, 270, 8, 0.642424, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (318, 'PPC200-10', NULL, 'Pipe sch.10 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 19960000, NULL, NULL, NULL, 1000, 1, 1, 0.388889, NULL, NULL, 'length*width*thick', 'length*3.143*219', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (319, 'PPC200-20', NULL, 'Pipe sch.20 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 33.31, NULL, NULL, NULL, 2800, 270, 8, 0.388889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (320, 'PPC200-30', NULL, 'Pipe sch.30 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 36.1, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (321, 'PPC200-40', NULL, 'Pipe sch.40 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 42.54, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (322, 'PPC200-60', NULL, 'Pipe sch.60 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 52.3, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (323, 'PPC200-80', NULL, 'Pipe sch.80 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 64.63, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (324, 'PPC200-100', NULL, 'Pipe sch.100 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 74.9, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (325, 'PPC200-120', NULL, 'Pipe sch.120 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 88.9, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (326, 'PPC200-140', NULL, 'Pipe sch.140 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 99.4, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (327, 'PPC200-160', NULL, 'Pipe sch.160 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 110, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (328, 'PPC250-10', NULL, 'Pipe sch.10 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 27780000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*273', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (329, 'PPC250-20', NULL, 'Pipe sch.20 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 41.76, NULL, NULL, NULL, 3440, 270, 8, 0.477778, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (330, 'PPC250-30', NULL, 'Pipe sch.30 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 49.9, NULL, NULL, NULL, 3440, 270, 8, 0.477778, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (331, 'PPC250-40', NULL, 'Pipe sch.40 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 59300000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*273', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (332, 'PPC250-60', NULL, 'Pipe sch.60 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.8, NULL, NULL, NULL, 8600, 270, 8, 1.73737, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (333, 'PPC250-80', NULL, 'Pipe sch.80 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 95.81, NULL, NULL, NULL, 10320, 270, 8, 2.08485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (334, 'PPC250-100', NULL, 'Pipe sch.100 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 112, NULL, NULL, NULL, 10320, 270, 8, 1.43333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (335, 'PPC250-120', NULL, 'Pipe sch.120 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 130, NULL, NULL, NULL, 10320, 270, 8, 1.43333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (336, 'PPC250-140', NULL, 'Pipe sch.140 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 152, NULL, NULL, NULL, 10320, 270, 8, 1.43333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (337, 'PPC250-160', NULL, 'Pipe sch.160 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 185, NULL, NULL, NULL, 10320, 270, 8, 1.43333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (338, 'PPC300-10', NULL, 'Pipe sch.10 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 35.98, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (339, 'PPC300-20', NULL, 'Pipe sch.20 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 49.72, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (340, 'PPC300-30', NULL, 'Pipe sch.30 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 64.2, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (341, 'PPC300-40', NULL, 'Pipe sch.40 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.72, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (342, 'PPC300-60', NULL, 'Pipe sch.60 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 107, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (343, 'PPC300-80', NULL, 'Pipe sch.80 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 131.85, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (344, 'PPC300-100', NULL, 'Pipe sch.100 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 157, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (345, 'PPC300-120', NULL, 'Pipe sch.120 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 184, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (346, 'PPC300-140', NULL, 'Pipe sch.140 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 204, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (347, 'PPC300-160', NULL, 'Pipe sch.160 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 234, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (348, 'PPC350-10', NULL, 'Pipe sch.10 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 55100000, NULL, NULL, NULL, 1000, 1, 1, 1.19444, NULL, NULL, 'length*width*thick', 'length*3.143*356', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (349, 'PPC350-20', NULL, 'Pipe sch.20 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 67.7, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (350, 'PPC350-30', NULL, 'Pipe sch.30 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 81.1, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (351, 'PPC350-40', NULL, 'Pipe sch.40 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 94.3, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (352, 'PPC350-60', NULL, 'Pipe sch.60 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 127, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (353, 'PPC350-80', NULL, 'Pipe sch.80 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 158, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (354, 'PPC350-100', NULL, 'Pipe sch.100 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 195, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (355, 'PPC350-120', NULL, 'Pipe sch.120 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 225, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (356, 'PPC350-140', NULL, 'Pipe sch.140 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 254, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (357, 'PPC350-160', NULL, 'Pipe sch.160 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 282, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (358, 'PPC400-10', NULL, 'Pipe sch.10 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 62.1, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (359, 'PPC400-20', NULL, 'Pipe sch.20 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 77.6, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (360, 'PPC400-30', NULL, 'Pipe sch.30 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 93, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (361, 'PPC400-40', NULL, 'Pipe sch.40 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 123, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (362, 'PPC400-60', NULL, 'Pipe sch.60 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 150, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (363, 'PPC400-80', NULL, 'Pipe sch.80 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 203, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (364, 'PPC400-100', NULL, 'Pipe sch.100 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 246, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (365, 'PPC400-120', NULL, 'Pipe sch.120 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 288, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (366, 'PPC400-140', NULL, 'Pipe sch.140 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 333, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (367, 'PPC400-160', NULL, 'Pipe sch.160 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 365, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (368, 'PPC450-10', NULL, 'Pipe sch.10 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 71100000, NULL, NULL, NULL, 1000, 1, 1, 1.19444, NULL, NULL, 'length*width*thick', 'length*3.143*457', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (369, 'PPC450-20', NULL, 'Pipe sch.20 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 87.5, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (370, 'PPC450-30', NULL, 'Pipe sch.30 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 122, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (371, 'PPC450-40', NULL, 'Pipe sch.40 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 156, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (372, 'PPC450-60', NULL, 'Pipe sch.60 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 205, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (373, 'PPC450-80', NULL, 'Pipe sch.80 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 254, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (374, 'PPC450-100', NULL, 'Pipe sch.100 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 310, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (375, 'PPC450-120', NULL, 'Pipe sch.120 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 383, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (376, 'PPC450-140', NULL, 'Pipe sch.140 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 409, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (377, 'PPC450-160', NULL, 'Pipe sch.160 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 458, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (378, 'PPC500-10', NULL, 'Pipe sch.10 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.2, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (379, 'PPC500-20', NULL, 'Pipe sch.20 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 117, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (380, 'PPC500-30', NULL, 'Pipe sch.30 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 155, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (381, 'PPC500-40', NULL, 'Pipe sch.40 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 184, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (382, 'PPC500-60', NULL, 'Pipe sch.60 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 248, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (383, 'PPC500-80', NULL, 'Pipe sch.80 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 311, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (384, 'PPC500-100', NULL, 'Pipe sch.100 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 381, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (385, 'PPC500-120', NULL, 'Pipe sch.120 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 441, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (386, 'PPC500-140', NULL, 'Pipe sch.140 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 508, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (387, 'PPC500-160', NULL, 'Pipe sch.160 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 565, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (388, 'PPC550-10', NULL, 'Pipe sch.10 dia. 22\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 87.2, NULL, NULL, NULL, 10150, 270, 8, 1.40972, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (389, 'PPC550-20', NULL, 'Pipe sch.20 dia. 22\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 129, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (390, 'PPC550-30', NULL, 'Pipe sch.30 dia. 22\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 171, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (391, 'PPC550-40', NULL, 'Pipe sch.40 dia. 22\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 213, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (392, 'PPC600-10', NULL, 'Pipe sch.10 dia. 24\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 95.2, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (393, 'PPC600-20', NULL, 'Pipe sch.20 dia. 24\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 141, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (394, 'PPC600-30', NULL, 'Pipe sch.30 dia. 24\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 228, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (395, 'PPC650-10', NULL, 'Pipe sch.10 dia. 26\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 103, NULL, NULL, NULL, 10150, 270, 8, 1.40972, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (396, 'PPC650-20', NULL, 'Pipe sch.20 dia. 26\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 203, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (397, 'PPC700-20', NULL, 'Pipe sch.20 dia. 28\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 49.72, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (398, 'PPC700-40', NULL, 'Pipe sch.40 dia. 28\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.72, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (399, 'PPC700-80', NULL, 'Pipe sch.80 dia. 28\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 131.85, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_material` VALUES (400, 'PPC75020', NULL, 'Pipe sch.20 dia. 30\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 49.72, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (401, 'PPC750-40', NULL, 'Pipe sch.40 dia. 30\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.72, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (402, 'PPC750-80', NULL, 'Pipe sch.80 dia. 30\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 131.85, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (403, 'PPC800-20', NULL, 'Pipe sch.20 dia. 32\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 49.72, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (404, 'PPC800-40', NULL, 'Pipe sch.40 dia. 32\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.72, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (405, 'PPC800-80', NULL, 'Pipe sch.80 dia. 32\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 131.85, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (406, 'PPC850-20', NULL, 'Pipe sch.20 dia. 34\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 49.72, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (407, 'PPC850-40', NULL, 'Pipe sch.40 dia. 34\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.72, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (408, 'PPC850-80', NULL, 'Pipe sch.80 dia. 34\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 131.85, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (409, 'PPC900-20', NULL, 'Pipe sch.20 dia. 36\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 49.72, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (410, 'PPC900-40', NULL, 'Pipe sch.40 dia. 36\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.72, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (411, 'PPC900-80', NULL, 'Pipe sch.80 dia. 36\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 131.85, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (412, 'HB100', NULL, 'HB100.100.6.8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'HB', NULL, NULL, 17.17, NULL, NULL, NULL, 1800, 270, 8, 0.363636, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (413, 'HB150', NULL, 'HB150.150.7.10', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'HB', NULL, NULL, 31.5, NULL, NULL, NULL, 2700, 270, 8, 0.545455, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (414, 'HB200', NULL, 'HB200.200.8.12', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'HB', NULL, NULL, 49.92, NULL, NULL, NULL, 3600, 270, 8, 0.727273, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (415, 'HB250', NULL, 'HB250.250.9.14', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'HB', NULL, NULL, 72.42, NULL, NULL, NULL, 4500, 270, 8, 0.909091, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (416, 'HB300', NULL, 'HB300.300.10.15', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'HB', NULL, NULL, 94, NULL, NULL, NULL, 5400, 270, 8, 1.09091, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (417, 'WF100', NULL, 'WF100.50.5.7', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 9334000, NULL, NULL, NULL, 12000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*380', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (418, 'WF125', NULL, 'WF125.60.5.7', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 13.2, NULL, NULL, NULL, 1800, 270, 8, 0.25, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (419, 'WF150', NULL, 'WF150.75.6.8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 14000000, NULL, NULL, NULL, 12000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*576', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (420, 'WF200', NULL, 'WF200.100.5,5.8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 21333300, NULL, NULL, NULL, 12000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*771', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (421, 'WF250', NULL, 'WF250.125.6.9', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 29600000, NULL, NULL, NULL, 12000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*967', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (422, 'WF300', NULL, 'WF300.150.6,5.9', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 36700000, NULL, NULL, NULL, 12000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*1165', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (423, 'WF350', NULL, 'WF350.175.7.11', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 49600000, NULL, NULL, NULL, 12000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*1362', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (424, 'WF400', NULL, 'WF400.200.8.13', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 66, NULL, NULL, NULL, 6400, 270, 8, 1.29293, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (425, 'WF450', NULL, 'WF450.200.9.14', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 76, NULL, NULL, NULL, 7200, 270, 8, 1.45455, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (426, 'WF496', NULL, 'WF496.199.9.14', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 79.5, NULL, NULL, NULL, 7936, 270, 8, 1.60323, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (427, 'WF500', NULL, 'WF500.200.10.16', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 89.584, NULL, NULL, NULL, 10000, 270, 8, 2.0202, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (428, 'UNP80', NULL, 'UNP 80.45.6', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 8.33, NULL, NULL, NULL, 1020, 270, 8, 0.141667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (429, 'UNP100', NULL, 'UNP 100.50.6', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 9367000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*394', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (430, 'UNP120', NULL, 'UNP 120.55.6', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 13.4, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (431, 'UNP125', NULL, 'UNP 125.65.6', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 13.4, NULL, NULL, NULL, 1500, 270, 8, 0.208333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (432, 'UNP140', NULL, 'UNP 140.60.7', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 16, NULL, NULL, NULL, 1560, 270, 8, 0.216667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (433, 'UNP150', NULL, 'UNP 150.75.7,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 18667000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (434, 'UNP200', NULL, 'UNP 200.80.7,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 24.67, NULL, NULL, NULL, 2160, 270, 8, 0.3, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (435, 'UNP250', NULL, 'UNP 250.90.9', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 34.6667, NULL, NULL, NULL, 2160, 270, 8, 0.3, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (436, 'CNP100-23', NULL, 'CNP 100.50.20.2,3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'CNP', NULL, NULL, 4.06, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (437, 'CNP100-32', NULL, 'CNP 100.50.20.3,2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'CNP', NULL, NULL, 5500000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*449', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (438, 'CNP125-23', NULL, 'CNP 125.50.20.2,3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'CNP', NULL, NULL, 4.51, NULL, NULL, NULL, 1060, 270, 8, 0.147222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (439, 'CNP125-32', NULL, 'CNP 125.50.20.3,2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'CNP', NULL, NULL, 6.17, NULL, NULL, NULL, 1060, 270, 8, 0.147222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (440, 'CNP150-23', NULL, 'CNP 150.50.20.2,3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'CNP', NULL, NULL, 5, NULL, NULL, NULL, 1160, 270, 8, 0.161111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (441, 'CNP150-32', NULL, 'CNP 150.50.20.3,2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'CNP', NULL, NULL, 6760000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*549', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (442, 'L30', NULL, 'L 30.30.3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 1360000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*120', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (443, 'L40-3', NULL, 'L 40.40.3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 1.34, NULL, NULL, NULL, 480, 270, 8, 0.0666667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (444, 'L40-4', NULL, 'L 40.40.4', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 2420000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*160', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (445, 'L50', NULL, 'L 50.50.5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 3780000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*200', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (446, 'L60-5', NULL, 'L 60.60.5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 4.55, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (447, 'L60-6', NULL, 'L 60.60.6', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 5420000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*240', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (448, 'L65', NULL, 'L 65.65.6', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 5.92, NULL, NULL, NULL, 780, 270, 8, 0.108333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (449, 'L70', NULL, 'L 70.70.7', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 7380000, NULL, NULL, NULL, 6000, 1, 1, 0.116667, NULL, NULL, 'length*width*thick', 'length*280', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (450, 'L75-6', NULL, 'L 75.75.6', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'L', NULL, NULL, 6870000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*300', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (451, 'L75-8', NULL, 'L 75.75.8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 9.03, NULL, NULL, NULL, 900, 270, 8, 0.125, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (452, 'L80', NULL, 'L 80.80.8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 9660000, NULL, NULL, NULL, 6000, 1, 1, 0.133333, NULL, NULL, 'length*width*thick', 'length*320', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (453, 'L90', NULL, 'L 90.90.9', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 12200000, NULL, NULL, NULL, 6000, 1, 1, 0.15, NULL, NULL, 'length*width*thick', 'length*360', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (454, 'L100', NULL, 'L 100.100.10', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 15100000, NULL, NULL, NULL, 6000, 1, 1, 0.166667, NULL, NULL, 'length*width*thick', 'length*400', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (455, 'SB08', NULL, 'AS Kotak 8 x 8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 0.5, NULL, NULL, NULL, 480, 270, 8, 0.0666667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (456, 'SB10', NULL, 'AS Kotak10 x 10', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 0.79, NULL, NULL, NULL, 480, 270, 8, 0.0666667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (457, 'SB12', NULL, 'AS Kotak 12 x 12', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 1.17, NULL, NULL, NULL, 600, 270, 8, 0.0833333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (458, 'SB16', NULL, 'AS Kotak 16 x 16', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 2010000, NULL, NULL, NULL, 6000, 1, 1, 0.1, NULL, NULL, 'length*width*thick', 'length*48', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (459, 'SB19', NULL, 'AS Kotak 19 x 19', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 2.83, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (460, 'SB22', NULL, 'AS Kotak 22 x 22', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 3.83, NULL, NULL, NULL, 780, 270, 8, 0.108333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (461, 'SB25', NULL, 'AS Kotak 25 x 25', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 5.17, NULL, NULL, NULL, 840, 270, 8, 0.116667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (462, 'SB32', NULL, 'AS Kotak 32 x 32', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 8.08, NULL, NULL, NULL, 900, 270, 8, 0.125, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (463, 'SB38', NULL, 'AS Kotak 38 x 38', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 11.33, NULL, NULL, NULL, 900, 270, 8, 0.125, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (464, 'SB45', NULL, 'AS Kotak 45 x 45', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 15.9, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (465, 'SB50', NULL, 'AS Kotak 50 x 50', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 19.67, NULL, NULL, NULL, 1080, 270, 8, 0.15, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (466, 'SB65', NULL, 'AS Kotak 65 x 65', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 33.17, NULL, NULL, NULL, 1200, 270, 8, 0.166667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (467, 'SB75', NULL, 'AS Kotak 75 x 75', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 44.17, NULL, NULL, NULL, 1200, 270, 8, 0.166667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (468, 'ST40-20', NULL, 'Pipa Kotak 40 x 40 x 2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 2.4, NULL, NULL, NULL, 480, 270, 8, 0.0666667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (469, 'ST40-23', NULL, 'Pipa Kotak 40 x 40 x 2,3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 2.77, NULL, NULL, NULL, 480, 270, 8, 0.0666667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (470, 'ST50-23', NULL, 'Pipa Kotak 50 x 50 x 2,3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 3.04, NULL, NULL, NULL, 600, 270, 8, 0.0833333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (471, 'ST50-25', NULL, 'Pipa Kotak 50 x 50 x 2,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 3.8, NULL, NULL, NULL, 600, 270, 8, 0.0833333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (472, 'ST50-27', NULL, 'Pipa Kotak 50 x 50 x 2,7', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 4.17, NULL, NULL, NULL, 600, 270, 8, 0.0833333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (473, 'ST50-28', NULL, 'Pipa Kotak 50 x 50 x 2,8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 4.25, NULL, NULL, NULL, 600, 270, 8, 0.0833333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (474, 'ST50-30', NULL, 'Pipa Kotak 50 x 50 x 3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 4.58, NULL, NULL, NULL, 600, 270, 8, 0.0833333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (475, 'ST60-20', NULL, 'Pipa Kotak 60 x 60 x 2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 5.13, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (476, 'ST60-23', NULL, 'Pipa Kotak 60 x 60 x 2,3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 5.5, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (477, 'ST60-25', NULL, 'Pipa Kotak 60 x 60 x 2,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 5.86, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (478, 'ST60-28', NULL, 'Pipa Kotak 60 x 60 x 2,8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 4.61, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (479, 'ST60-30', NULL, 'Pipa Kotak 60 x 60 x 3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 5.5, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (480, 'ST60-32', NULL, 'Pipa Kotak 60 x 60 x 3,2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 5.86, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (481, 'ST75-20', NULL, 'Pipa Kotak 75 x 75 x 2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 4.61, NULL, NULL, NULL, 900, 270, 8, 0.125, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (482, 'ST75-23', NULL, 'Pipa Kotak 75 x 75 x 2,3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 5.33, NULL, NULL, NULL, 900, 270, 8, 0.125, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (483, 'ST75-25', NULL, 'Pipa Kotak 75 x 75 x 2,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 5.76, NULL, NULL, NULL, 900, 270, 8, 0.125, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (484, 'ST75-32', NULL, 'Pipa Kotak 75 x 75 x 3,2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 7.37, NULL, NULL, NULL, 900, 270, 8, 0.125, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (485, 'ST100-32', NULL, 'Pipa Kotak 100 x 100 x 3,2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 9.88, NULL, NULL, NULL, 1200, 270, 8, 0.166667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (486, 'ST100-45', NULL, 'Pipa Kotak 100 x 100 x 4,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 13.9, NULL, NULL, NULL, 1200, 270, 8, 0.166667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (487, 'ST125-32', NULL, 'Pipa Kotak 125 x 125 x 3,2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 12.39, NULL, NULL, NULL, 1500, 270, 8, 0.208333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (488, 'ST125-45', NULL, 'Pipa Kotak 125 x 125 x 4,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 17.43, NULL, NULL, NULL, 1500, 270, 8, 0.208333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (489, 'ST150-45', NULL, 'Pipa Kotak 150 x 150 x 4,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 20.96, NULL, NULL, NULL, 1800, 270, 8, 0.25, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (490, 'ST150-50', NULL, 'Pipa Kotak 150 x 150 x 5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 23.29, NULL, NULL, NULL, 1800, 270, 8, 0.25, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (491, 'RBC08', NULL, 'Round bar dia.8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 0.4, NULL, NULL, NULL, 25, 270, 8, 0.00347222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (492, 'RBC10', NULL, 'Round bar dia.10', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6167, NULL, NULL, NULL, 12000, 10, 10, 0, NULL, NULL, 'length*width*thick', 'length*3.143*10', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (493, 'RBC12', NULL, 'Round bar dia.12', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6169, NULL, NULL, NULL, 12000, 12, 12, 0, NULL, NULL, 'length*width*thick', 'length*12*3.143', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (494, 'RBC16', NULL, 'Round bar dia.16', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6172, NULL, NULL, NULL, 12000, 16, 16, 0, NULL, NULL, 'length*width*thick', 'length*3.143*16', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (495, 'RBC19', NULL, 'Round bar dia.19', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 2.23, NULL, NULL, NULL, 126, 270, 8, 0.0175, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (496, 'RBC22', NULL, 'Round bar dia.22', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6157.1, NULL, NULL, NULL, 12000, 22, 22, 0, NULL, NULL, 'length*width*thick', 'length*3.143*22', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (497, 'DBC13', NULL, 'Deformed bar dia.13', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6166, NULL, NULL, NULL, 12000, 13, 13, 0, NULL, NULL, 'length*width*thick', 'length*13*3.14', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (498, 'DBC16', NULL, 'Deformed bar dia.16', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6166, NULL, NULL, NULL, 12000, 16, 16, 0, NULL, NULL, 'length*width*thick', 'length*3.14*16', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (499, 'DBC19', NULL, 'Deformed bar dia.19', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6166, NULL, NULL, NULL, 12000, 19, 19, 0, NULL, NULL, 'length*width*thick', 'length*19*3.14', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (500, 'ASC25', NULL, 'As Dia. 1\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6400, NULL, NULL, NULL, 6000, 25, 25, 0, NULL, NULL, 'length*width*thick', 'length*3.143*25', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (501, 'PLC045', NULL, 'Plate 4.5 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 2440, 1220, 5, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (502, 'ASC38', NULL, 'As Dia. 1-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 38, 38, 0, NULL, NULL, 'length*width*thick', 'length*3.143*38', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (503, 'PLC040', NULL, 'Plate 40 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 40, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (504, 'PLC050', NULL, 'Plate 50 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 50, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (505, 'PLC060', NULL, 'Plate 60 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 60, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (506, 'PLC009', NULL, 'Plate 9 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 1500, 270, 9, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (507, 'PLS015', NULL, 'Plate 9 mm (SUS 304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 1000, 270, 9, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (508, 'RP24-20', NULL, 'Ring Plate 20 mm (OD 2440 x  ID 1220)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 550.593, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (509, 'RP24-22', NULL, 'Ring Plate 22 mm (OD 2440 x  ID 1220)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 605.652, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (510, 'RP24-25', NULL, 'Ring Plate 25 mm (OD 2440 x  ID 1220)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 688.241, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (511, 'RP65-03', NULL, 'Ring Plate 3 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 644.38, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (512, 'RP65-04', NULL, 'Ring Plate 4 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 859.173, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (513, 'RP65-05', NULL, 'Ring Plate 5 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 1073.97, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (514, 'RP65-06', NULL, 'Ring Plate 6 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 1288.76, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (515, 'RP65-08', NULL, 'Ring Plate 8 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 1718.35, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (516, 'RP65-10', NULL, 'Ring Plate 10 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 2147.93, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (517, 'RP65-12', NULL, 'Ring Plate 12 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 2577.52, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (518, 'RP65-16', NULL, 'Ring Plate 16 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 3436.69, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (519, 'RP65-18', NULL, 'Ring Plate 18 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 3866.28, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (520, 'RP65-20', NULL, 'Ring Plate 20 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 4295.87, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (521, 'RP65-22', NULL, 'Ring Plate 22 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 4725.45, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (522, 'RBC-55', NULL, 'As Dia. 55', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 55, 55, 0, NULL, NULL, 'length*width*thick', 'length*3.143*55', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (523, 'RBC-50', NULL, 'As Dia. 50', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 50, 50, 0, NULL, NULL, 'length*width*thick', 'length*3.143*50', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (524, 'RBC-100', NULL, 'As Dia. 100', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 100, 100, 0, NULL, NULL, 'length*width*thick', 'length*3.143*100', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (525, 'PLC030', NULL, 'Plate 30 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 30, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (526, 'ELB01', NULL, 'ELASTOMERIC BEARING', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 0, NULL, NULL, NULL, 300, 200, 50, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (527, 'ELB02', NULL, 'ELASTOMERIC BEARING', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'CIVIL', NULL, NULL, 0, NULL, NULL, NULL, 200, 150, 20, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (528, 'UB076', NULL, 'UBOLT M10 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (529, 'CP076', NULL, 'CAP 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (530, 'SC076', NULL, 'SOCKET 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (531, 'RP68-20', NULL, 'BONDECK ', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 6990, NULL, NULL, NULL, 1000, 1000, 1, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (532, 'EL090', NULL, 'Elbow 90 Dia. 1-1/4\"', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PIPE', NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (533, 'ST50-50', NULL, 'Pipa Kotak 50 x 50 x 5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 6904000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*200', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (534, 'L25', NULL, 'L 25.25.3', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 1120000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*100', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (535, 'RBC-20', NULL, 'As Dia. 20', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 20, 20, 0, NULL, NULL, 'length*width*thick', 'length*3.143*20', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (536, 'FL006-150', NULL, 'FLANGE 6\" S0 (150)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (537, 'RBC-70', NULL, 'As dia.70', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 70, 70, 0, NULL, NULL, 'length*width*thick', 'length*3.143*70', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (538, 'RBC-60', NULL, 'As dia.60', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 60, 60, 0, NULL, NULL, 'length*width*thick', 'length*3.143*70', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (539, 'RBC-75', NULL, 'As dia.75', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 75, 75, 0, NULL, NULL, 'length*width*thick', 'length*3.143*75', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_material` VALUES (540, 'kilo', '', NULL, '', '', NULL, NULL, NULL, '', NULL, '', '', '', '', '', '', '', '', 0, 0, '', '', 0, 0, 0, 0, NULL, '', '', '', '', '', '', '', '', 'IDR', '2020-12-20 18:09:25', '2020-12-20 18:09:30', b'0');
INSERT INTO `master_material` VALUES (541, 'PLS626', 'A36', 'PLATE 2 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 2, 141300, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (542, 'PLS627', 'A36', 'PLATE 4 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 4, 282600, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (543, 'PLS628', 'A36', 'PLATE 5 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 5, 353250, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (544, 'PLS629', 'A36', 'PLATE 6 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 6, 423900, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (545, 'PLS630', 'A36', 'PLATE 8 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 8, 565200, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (546, 'PLS631', 'A36', 'PLATE 9 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 9, 635850, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (547, 'PLS632', 'A36', 'PLATE 10 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 10, 706500, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (548, 'PLS633', 'A36', 'PLATE 12 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 12, 847800, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (549, 'PLS634', 'A36', 'PLATE 14 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 14, 989100, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (550, 'PLS635', 'A36', 'PLATE 16 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 16, 1130400, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (551, 'PLS636', 'A36', 'PLATE 20 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 20, 1413000, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (552, 'PLS637', 'A36', 'PLATE 22 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 22, 1554300, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (553, 'PLS638', 'A36', 'PLATE 25 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 25, 1766250, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (554, 'PLS639', 'A36', 'PLATE 30 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 2400, 1200, 30, 678240, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (555, 'PLS640', 'A36', 'PLATE 35 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 2400, 1200, 35, 791280, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (556, 'PLS641', 'A36', 'PLATE 40 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 2400, 1200, 40, 904320, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');
INSERT INTO `master_material` VALUES (557, 'PLS642', 'A36', 'PLATE 50 thk', 'STEEL', NULL, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 2400, 1200, 50, 1130400, NULL, NULL, 'length*thick*width', 'length*width', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 23:02:46', NULL, b'1');

-- ----------------------------
-- Table structure for master_part_material
-- ----------------------------
DROP TABLE IF EXISTS `master_part_material`;
CREATE TABLE `master_part_material`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `part_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `product_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `product_category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `discontinued` bit(1) NULL DEFAULT NULL,
  `wip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `vendor_outsource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `warehouse_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `packing_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `iqc_check` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit_measures` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dimension_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `material_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `material_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `material_density` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weight_factor` float NULL DEFAULT NULL,
  `surface_area` float NULL DEFAULT NULL,
  `hs_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `point_factor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `length` float NULL DEFAULT NULL,
  `width` float NULL DEFAULT NULL,
  `thick` float NULL DEFAULT NULL,
  `weight` float NULL DEFAULT 0,
  `wielding_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `drawing_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `volume_formula` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `area_formula` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `minimum_order_qty` int(11) NULL DEFAULT NULL,
  `minimum_stock` int(11) NULL DEFAULT NULL,
  `process_cost_supplier_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `material_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 541 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of master_part_material
-- ----------------------------
INSERT INTO `master_part_material` VALUES (1, 'RBS008', '', 'As dia.8 (SS-304)\r\n', 'STEEL', 'BKG', NULL, NULL, NULL, '', '', '', '', '', 'BTG', 'Area', 'AS', '2', NULL, 0.305164, 1, '', '', 50, 270, 8, 0.00694444, 'NSN-308', '', 'length*width*thick', 'length*3.143*8', NULL, NULL, NULL, NULL, '2020-12-03 22:17:48', '2020-12-03 23:55:00', b'1');
INSERT INTO `master_part_material` VALUES (3, 'RBS010', NULL, 'As dia.10 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 10, 10, 0, NULL, NULL, 'length*width*thick', 'length*3.143*10', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (4, 'RBS012', NULL, 'As dia.12 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 12, 12, 0, NULL, NULL, 'length*width*thick', 'length*3.143*12', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (5, 'RBS016', NULL, 'As dia.16 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 16, 16, 0, NULL, NULL, 'length*width*thick', 'length*3.143*16', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (6, 'RBS019', NULL, 'As dia.19 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 19, 19, 0, NULL, NULL, 'length*width*thick', 'length*3.143*19', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (7, 'RBS020', NULL, 'As dia.20 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 20, 20, 0, NULL, NULL, 'length*width*thick', 'length*3.143*20', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (8, 'RBS022', NULL, 'As dia.22 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 22, 22, 0, NULL, NULL, 'length*width*thick', 'length*3.143*22', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (9, 'RBS025', NULL, 'As dia.25 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 25, 25, 0, NULL, NULL, 'length*width*thick', 'length*3.143*25', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (10, 'RBS030', NULL, 'As dia.30 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 30, 30, 0, NULL, NULL, 'length*width*thick', 'length*3.143*30', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (11, 'RBS035', NULL, 'As dia.35 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 35, 35, 0, NULL, NULL, 'length*width*thick', 'length*3.143*35', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (12, 'RBS040', NULL, 'As dia.40 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 40, 40, 0, NULL, NULL, 'length*width*thick', 'length*3.143*40', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (13, 'RBS045', NULL, 'As dia.45 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 45, 45, 0, NULL, NULL, 'length*width*thick', 'length*3.143*45', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (14, 'RBS050', NULL, 'As dia.50 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 50, 50, 0, NULL, NULL, 'length*width*thick', 'length*3.143*50', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (15, 'RBS055', NULL, 'As dia.55 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 55, 55, 0, NULL, NULL, 'length*width*thick', 'length*3.143*55', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (16, 'RBS060', NULL, 'As dia.60 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 60, 60, 0, NULL, NULL, 'length*width*thick', 'length*3.143*60', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (17, 'RBS065', NULL, 'As dia.65 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 65, 65, 0, NULL, NULL, 'length*width*thick', 'length*3.143*65', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (18, 'RBS070', NULL, 'As dia.70 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 70, 70, 0, NULL, NULL, 'length*width*thick', 'length*3.143*70', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (19, 'RBS075', NULL, 'As dia.75 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 75, 75, 0, NULL, NULL, 'length*width*thick', 'length*3.143*75', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (20, 'RBS080', NULL, 'As dia.80 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 80, 80, 0, NULL, NULL, 'length*width*thick', 'length*3.143*80', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (21, 'RBS085', NULL, 'As dia.85 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 85, 85, 0, NULL, NULL, 'length*width*thick', 'length*3.143*85', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (22, 'RBS090', NULL, 'As dia.90 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 90, 90, 0, NULL, NULL, 'length*width*thick', 'length*3.143*90', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (23, 'RBS095', NULL, 'As dia.95 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 95, 95, 0, NULL, NULL, 'length*width*thick', 'length*3.143*95', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (24, 'RBS100', NULL, 'As dia.100 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 100, 100, 0, NULL, NULL, 'length*width*thick', 'length*3.143*100', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (25, 'RBS105', NULL, 'As dia.105 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 105, 105, 0, NULL, NULL, 'length*width*thick', 'length*3.143*105', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (26, 'RBS110', NULL, 'As dia.110 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 110, 110, 0, NULL, NULL, 'length*width*thick', 'length*3.143*110', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (27, 'RBS115', NULL, 'As dia.115 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 115, 115, 0, NULL, NULL, 'length*width*thick', 'length*3.143*115', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (28, 'RBS120', NULL, 'As dia.120 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 120, 120, 0, NULL, NULL, 'length*width*thick', 'length*3.143*120', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (29, 'RBS130', NULL, 'As dia.130 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 130, 130, 0, NULL, NULL, 'length*width*thick', 'length*3.143*130', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (30, 'RBS140', NULL, 'As dia.140 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 140, 140, 0, NULL, NULL, 'length*width*thick', 'length*3.143*140', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (31, 'RBS150', NULL, 'As dia.150 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 150, 150, 0, NULL, NULL, 'length*width*thick', 'length*3.143*150', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (32, 'RBS160', NULL, 'As dia.160 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 160, 160, 0, NULL, NULL, 'length*width*thick', 'length*3.143*160', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', '2020-12-09 21:11:29', b'1');
INSERT INTO `master_part_material` VALUES (33, 'RBS170', NULL, 'As dia.170 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 170, 170, 0, NULL, NULL, 'length*width*thick', 'length*3.143*170', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (34, 'RBS180', NULL, 'As dia.180 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 180, 180, 0, NULL, NULL, 'length*width*thick', 'length*3.143*180', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (35, 'RBS190', NULL, 'As dia.190 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 190, 190, 0, NULL, NULL, 'length*width*thick', 'length*3.143*190', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (36, 'RBS200', NULL, 'As dia.200 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 200, 200, 0, NULL, NULL, 'length*width*thick', 'length*3.143*200', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (37, 'RBS250', NULL, 'As dia.250 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 250, 250, 0, NULL, NULL, 'length*width*thick', 'length*3.143*250', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (38, 'RBS300', NULL, 'As dia.300 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 300, 300, 0, NULL, NULL, 'length*width*thick', 'length*3.143*300', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (39, 'RBS350', NULL, 'As dia.350 (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 350, 350, 0, NULL, NULL, 'length*width*thick', 'length*3.143*350', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (40, 'PLS001', NULL, 'Plate 1.65 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 4000, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (41, 'PLS002', NULL, 'Plate 2 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 4000, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (42, 'PLS003', NULL, 'Plate 3 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 6000, 270, 3, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (43, 'PLS004', NULL, 'Plate 4 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 8000, 270, 4, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (44, 'PLS005', NULL, 'Plate 5 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 12000, 270, 5, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (45, 'PLS006', NULL, 'Plate 6 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 12000, 270, 6, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (46, 'PLS007', NULL, 'Plate 8 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 12000, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (47, 'PLS008', NULL, 'Plate 10 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 16000, 270, 10, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (48, 'PLS009', NULL, 'Plate 12 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 16000, 270, 12, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (49, 'PLS010', NULL, 'Plate 16 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 20000, 270, 16, 4.0404, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (50, 'PLS011', NULL, 'Plate 18 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 20000, 270, 18, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (51, 'PLS012', NULL, 'Plate 20 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 24000, 270, 20, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (52, 'PLS013', NULL, 'Plate 22 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 24000, 270, 22, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (53, 'PLS014', NULL, 'Plate 25 mm (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 28000, 270, 25, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (54, 'PLS401', NULL, 'Plate 1.65 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 7320, 270, 2, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (55, 'PLS402', NULL, 'Plate 2 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 7320, 270, 2, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (56, 'PLS403', NULL, 'Plate 3 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 14640, 270, 3, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (57, 'PLS404', NULL, 'Plate 4 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 14640, 270, 4, 0, NULL, NULL, 'length*width*thick', 'length*width*2\r\n', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (58, 'PLS405', NULL, 'Plate 5 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 21960, 270, 5, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (59, 'PLS406', NULL, 'Plate 6 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 21960, 270, 6, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (60, 'PLS408', NULL, 'Plate 8 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 21960, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (61, 'PLS410', NULL, 'Plate 10 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 29280, 270, 10, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (62, 'PLS412', NULL, 'Plate 12 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 29280, 270, 12, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (63, 'PLS416', NULL, 'Plate 16 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 36600, 270, 16, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (64, 'PLS418', NULL, 'Plate 18 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 36600, 270, 18, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (65, 'PLS420', NULL, 'Plate 20 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 43920, 270, 20, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (66, 'PLS422', NULL, 'Plate 22 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 43920, 270, 22, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (67, 'PLS425', NULL, 'Plate 25 mm (4\'x8\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 51240, 270, 25, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (68, 'PLS503', NULL, 'Plate 3 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 30480, 270, 3, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (69, 'PLS504', NULL, 'Plate 4 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 30480, 270, 4, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (70, 'PLS505', NULL, 'Plate 5 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 45720, 270, 5, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (71, 'PLS506', NULL, 'Plate 6 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 45720, 270, 6, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (72, 'PLS508', NULL, 'Plate 8 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 45720, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (73, 'PLS510', NULL, 'Plate 10 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 60960, 270, 10, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (74, 'PLS512', NULL, 'Plate 12 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 60960, 270, 12, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (75, 'PLS516', NULL, 'Plate 16 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 76200, 270, 16, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (76, 'PLS518', NULL, 'Plate 18 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 76200, 270, 18, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (77, 'PLS520', NULL, 'Plate 20 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 91440, 270, 20, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (78, 'PLS522', NULL, 'Plate 22 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 91440, 270, 22, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (79, 'PLS525', NULL, 'Plate 25 mm (5\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 106680, 270, 25, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (80, 'PLS603', NULL, 'Plate 3 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 31696, 270, 3, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (81, 'PLS604', NULL, 'Plate 4 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 31696, 270, 4, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (82, 'PLS605', NULL, 'Plate 5 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 47544, 270, 5, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (83, 'PLS606', NULL, 'Plate 6 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 47544, 270, 6, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (84, 'PLS608', NULL, 'Plate 8 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 47544, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (85, 'PLS610', NULL, 'Plate 10 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 63392, 270, 10, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (86, 'PLS612', NULL, 'Plate 12 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 63392, 270, 12, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (87, 'PLS616', NULL, 'Plate 16 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 79240, 270, 16, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (88, 'PLS618', NULL, 'Plate 18 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 79240, 270, 18, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (89, 'PLS620', NULL, 'Plate 20 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 95088, 270, 20, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (90, 'PLS622', NULL, 'Plate 22 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 95088, 270, 22, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (91, 'PLS625', NULL, 'Plate 25 mm (6\'x20\') (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 110936, 270, 25, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (92, 'PPS003-5', NULL, 'Pipe sch.5 dia. 1/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.234, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (93, 'PPS003-10', NULL, 'Pipe sch.10 dia. 1/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.275, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (94, 'PPS003-20', NULL, 'Pipe sch.20 dia. 1/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.333, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (95, 'PPS003-40', NULL, 'Pipe sch.40 dia. 1/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.369, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (96, 'PPS003-80', NULL, 'Pipe sch.80 dia. 1/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.479, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (97, 'PPS006-5', NULL, 'Pipe sch.5 dia. 1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.373, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (98, 'PPS006-10', NULL, 'Pipe sch.10 dia. 1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.494, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (99, 'PPS006-20', NULL, 'Pipe sch.20 dia. 1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.562, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (100, 'PPS006-40', NULL, 'Pipe sch.40 dia. 1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.629, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (101, 'PPS006-80', NULL, 'Pipe sch.80 dia. 1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.799, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (102, 'PPS010-5', NULL, 'Pipe sch.5 dia. 3/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.476, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (103, 'PPS010-10', NULL, 'Pipe sch.10 dia. 3/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.637, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (104, 'PPS010-20', NULL, 'Pipe sch.20 dia. 3/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.755, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (105, 'PPS010-40', NULL, 'Pipe sch.40 dia. 3/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.851, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (106, 'PPS010-80', NULL, 'Pipe sch.80 dia. 3/8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.11, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (107, 'PPS013-5', NULL, 'Pipe sch.5 dia. 1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 0.816, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (108, 'PPS013-10', NULL, 'Pipe sch.10 dia. 1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.02, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (109, 'PPS013-20', NULL, 'Pipe sch.20 dia. 1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.18, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (110, 'PPS013-40', NULL, 'Pipe sch.40 dia. 1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.31, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (111, 'PPS013-80', NULL, 'Pipe sch.80 dia. 1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.64, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (112, 'PPS013-160', NULL, 'Pipe sch.160 dia. 1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.97, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (113, 'PPS020-5', NULL, 'Pipe sch.5 dia. 3/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.04, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (114, 'PPS020-10', NULL, 'Pipe sch.10 dia. 3/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.3, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (115, 'PPS020-20', NULL, 'Pipe sch.20 dia. 3/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.52, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (116, 'PPS020-40', NULL, 'Pipe sch.40 dia. 3/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.74, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (117, 'PPS020-80', NULL, 'Pipe sch.80 dia. 3/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.24, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (118, 'PPS020-160', NULL, 'Pipe sch.160 dia. 3/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.94, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (119, 'PPS025-5', NULL, 'Pipe sch.5 dia. 1\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.32, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (120, 'PPS025-10', NULL, 'Pipe sch.10 dia. 1\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.15, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (121, 'PPS025-20', NULL, 'Pipe sch.20 dia. 1\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.29, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (122, 'PPS025-40', NULL, 'Pipe sch.40 dia. 1\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.52, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (123, 'PPS025-80', NULL, 'Pipe sch.80 dia. 1\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.27, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (124, 'PPS025-160', NULL, 'Pipe sch.160 dia. 1\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4.36, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (125, 'PPS032-5', NULL, 'Pipe sch.5 dia. 1-1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.67, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (126, 'PPS032-10', NULL, 'Pipe sch.10 dia. 1-1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.76, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (127, 'PPS032-20', NULL, 'Pipe sch.20 dia. 1-1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.94, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (128, 'PPS032-40', NULL, 'Pipe sch.40 dia. 1-1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.47, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (129, 'PPS032-80', NULL, 'Pipe sch.80 dia. 1-1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4.57, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (130, 'PPS032-160', NULL, 'Pipe sch.160 dia. 1-1/4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5.73, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (131, 'PPS040-5', NULL, 'Pipe sch.5 dia. 1-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.91, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (132, 'PPS040-10', NULL, 'Pipe sch.10 dia. 1-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.16, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (133, 'PPS040-20', NULL, 'Pipe sch.20 dia. 1-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.37, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (134, 'PPS040-40', NULL, 'Pipe sch.40 dia. 1-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4.1, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (135, 'PPS040-80', NULL, 'Pipe sch.80 dia. 1-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5.47, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (136, 'PPS040-160', NULL, 'Pipe sch.160 dia. 1-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 7.29, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (137, 'PPS050-5', NULL, 'Pipe sch.5 dia. 2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.39, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (138, 'PPS050-10', NULL, 'Pipe sch.10 dia. 2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.98, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (139, 'PPS050-20', NULL, 'Pipe sch.20 dia. 2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4.92, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (140, 'PPS050-40', NULL, 'Pipe sch.40 dia. 2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5440000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*60', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (141, 'PPS050-80', NULL, 'Pipe sch.80 dia. 2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 7.49, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (142, 'PPS050-160', NULL, 'Pipe sch.160 dia. 2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 11.1, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (143, 'PPS065-5', NULL, 'Pipe sch.5 dia. 2-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.84, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (144, 'PPS065-10', NULL, 'Pipe sch.10 dia. 2-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5.42, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (145, 'PPS065-20', NULL, 'Pipe sch.20 dia. 2-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 6.2, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (146, 'PPS065-40', NULL, 'Pipe sch.40 dia. 2-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 9.12, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (147, 'PPS065-80', NULL, 'Pipe sch.80 dia. 2-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 12, NULL, NULL, NULL, 1440, 270, 8, 0.290909, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (148, 'PPS065-160', NULL, 'Pipe sch.160 dia. 2-1/2\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 15.6, NULL, NULL, NULL, 1440, 270, 8, 0.290909, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (149, 'PPS075-5', NULL, 'Pipe sch.5 dia. 3\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4.51, NULL, NULL, NULL, 1132, 270, 8, 0.157222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (150, 'PPS075-10', NULL, 'Pipe sch.10 dia. 3\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 6.37, NULL, NULL, NULL, 1132, 270, 8, 0.157222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (151, 'PPS075-20', NULL, 'Pipe sch.20 dia. 3\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 8.39, NULL, NULL, NULL, 1132, 270, 8, 0.157222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (152, 'PPS075-40', NULL, 'Pipe sch.40 dia. 3\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 11300000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*89', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (153, 'PPS075-80', NULL, 'Pipe sch.80 dia. 3\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 15.3, NULL, NULL, NULL, 1698, 270, 8, 0.34303, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (154, 'PPS075-160', NULL, 'Pipe sch.160 dia. 3\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 21.4, NULL, NULL, NULL, 1698, 270, 8, 0.34303, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (155, 'PPS100-5', NULL, 'Pipe sch.5 dia. 4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5.81, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (156, 'PPS100-10', NULL, 'Pipe sch.10 dia. 4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 8.23, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (157, 'PPS100-20', NULL, 'Pipe sch.20 dia. 4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 10.9, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (158, 'PPS100-40', NULL, 'Pipe sch.40 dia. 4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 16, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (159, 'PPS100-80', NULL, 'Pipe sch.80 dia. 4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 22.4, NULL, NULL, NULL, 2160, 270, 8, 0.436364, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (160, 'PPS100-120', NULL, 'Pipe sch.120 dia. 4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 28.2, NULL, NULL, NULL, 2160, 270, 8, 0.436364, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (161, 'PPS100-160', NULL, 'Pipe sch.160 dia. 4\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 32.8, NULL, NULL, NULL, 2160, 270, 8, 0.436364, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (162, 'PPS130-5', NULL, 'Pipe sch.5 dia. 5\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 9.48, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (163, 'PPS130-10', NULL, 'Pipe sch.10 dia. 5\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 11.4, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (164, 'PPS130-20', NULL, 'Pipe sch.20 dia. 5\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 16.6, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (165, 'PPS130-40', NULL, 'Pipe sch.40 dia. 5\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 21.77, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (166, 'PPS130-80', NULL, 'Pipe sch.80 dia. 5\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 30.5, NULL, NULL, NULL, 2670, 270, 8, 0.539394, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (167, 'PPS130-120', NULL, 'Pipe sch.120 dia. 5\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 39.8, NULL, NULL, NULL, 2670, 270, 8, 0.539394, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (168, 'PPS130-160', NULL, 'Pipe sch.160 dia. 5\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 48.6, NULL, NULL, NULL, 2670, 270, 8, 0.539394, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (169, 'PPS150-5', NULL, 'Pipe sch.5 dia. 6\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 11.2, NULL, NULL, NULL, 2120, 270, 8, 0.294444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (170, 'PPS150-10', NULL, 'Pipe sch.10 dia. 6\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 13.62, NULL, NULL, NULL, 2120, 270, 8, 0.294444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (171, 'PPS150-20', NULL, 'Pipe sch.20 dia. 6\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 19.8, NULL, NULL, NULL, 2120, 270, 8, 0.294444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (172, 'PPS150-40', NULL, 'Pipe sch.40 dia. 6\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 27.7, NULL, NULL, NULL, 3180, 270, 8, 0.642424, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (173, 'PPS150-80', NULL, 'Pipe sch.80 dia. 6\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 41.8, NULL, NULL, NULL, 3180, 270, 8, 0.642424, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (174, 'PPS150-120', NULL, 'Pipe sch.120 dia. 6\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 53.2, NULL, NULL, NULL, 3180, 270, 8, 0.642424, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (175, 'PPS150-160', NULL, 'Pipe sch.160 dia. 6\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 66, NULL, NULL, NULL, 3180, 270, 8, 0.642424, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (176, 'PPS200-5', NULL, 'Pipe sch.5 dia. 8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 14.76, NULL, NULL, NULL, 2800, 270, 8, 0.388889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (177, 'PPS200-10', NULL, 'Pipe sch.10 dia. 8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 20.9, NULL, NULL, NULL, 2800, 270, 8, 0.388889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (178, 'PPS200-20', NULL, 'Pipe sch.20 dia. 8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 33.8, NULL, NULL, NULL, 2800, 270, 8, 0.388889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (179, 'PPS200-40', NULL, 'Pipe sch.40 dia. 8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 42.1, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (180, 'PPS200-80', NULL, 'Pipe sch.80 dia. 8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 63.8, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (181, 'PPS200-120', NULL, 'Pipe sch.120 dia. 8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 88.9, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (182, 'PPS200-160', NULL, 'Pipe sch.160 dia. 8\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 110, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (183, 'PPS250-5', NULL, 'Pipe sch.5 dia. 10\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 22.1, NULL, NULL, NULL, 3440, 270, 8, 0.477778, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (184, 'PPS250-10', NULL, 'Pipe sch.10 dia. 10\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 26, NULL, NULL, NULL, 3440, 270, 8, 0.477778, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (185, 'PPS250-20', NULL, 'Pipe sch.20 dia. 10\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 41.8, NULL, NULL, NULL, 3440, 270, 8, 0.477778, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (186, 'PPS250-40', NULL, 'Pipe sch.40 dia. 10\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 59.2, NULL, NULL, NULL, 8600, 270, 8, 1.73737, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (187, 'PPS250-80', NULL, 'Pipe sch.80 dia. 10\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 93, NULL, NULL, NULL, 10320, 270, 8, 2.08485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (188, 'PPS250-120', NULL, 'Pipe sch.120 dia. 10\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 130, NULL, NULL, NULL, 10320, 270, 8, 2.08485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (189, 'PPS250-160', NULL, 'Pipe sch.160 dia. 10\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 168, NULL, NULL, NULL, 10320, 270, 8, 2.08485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (190, 'PPS300-5', NULL, 'Pipe sch.5 dia. 12\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 31, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (191, 'PPS300-10', NULL, 'Pipe sch.10 dia. 12\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 34.8, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (192, 'PPS300-20', NULL, 'Pipe sch.20 dia. 12\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 50, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (193, 'PPS300-40', NULL, 'Pipe sch.40 dia. 12\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 78.3, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (194, 'PPS300-80', NULL, 'Pipe sch.80 dia. 12\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 129, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (195, 'PPS300-120', NULL, 'Pipe sch.120 dia. 12\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 181, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (196, 'PPS300-160', NULL, 'Pipe sch.160 dia. 12\" (SS-304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 234, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (197, 'PLC001', NULL, 'Plate 1.65 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 4000, 270, 2, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (198, 'PLC003', NULL, 'Plate 3 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 8000, 270, 3, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (199, 'PLC004', NULL, 'Plate 4 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 8000, 270, 4, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (200, 'PLC005', NULL, 'Plate 5 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 12000, 270, 5, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (201, 'PLC006', NULL, 'Plate 6 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 12000, 270, 6, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (202, 'PLC008', NULL, 'Plate 8 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 12000, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (203, 'PLC010', NULL, 'Plate 10 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 10, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (204, 'PLC012', NULL, 'Plate 12 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 12, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (205, 'PLC016', NULL, 'Plate 16 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 16, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (206, 'PLC018', NULL, 'Plate 18 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 141.3, NULL, NULL, NULL, 20000, 270, 8, 7.40741, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (207, 'PLC020', NULL, 'Plate 20 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 24000, 270, 20, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (208, 'PLC022', NULL, 'Plate 22 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 172.7, NULL, NULL, NULL, 24000, 270, 8, 8.88889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (209, 'PLC025', NULL, 'Plate 25 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 25, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (210, 'PLC401', NULL, 'Plate 1.65 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 38.557, NULL, NULL, NULL, 7320, 270, 8, 1.01667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (211, 'PLC403', NULL, 'Plate 3 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 70.1036, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (212, 'PLC404', NULL, 'Plate 4 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 93.4715, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (213, 'PLC405', NULL, 'Plate 5 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 116.839, NULL, NULL, NULL, 21960, 270, 8, 3.05, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (214, 'PLC406', NULL, 'Plate 6 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 140.207, NULL, NULL, NULL, 21960, 270, 8, 3.05, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (215, 'PLC408', NULL, 'Plate 8 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 186.943, NULL, NULL, NULL, 21960, 270, 8, 4.43636, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (216, 'PLC410', NULL, 'Plate 10 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 233.679, NULL, NULL, NULL, 29280, 270, 8, 5.91515, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (217, 'PLC412', NULL, 'Plate 12 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 280.415, NULL, NULL, NULL, 29280, 270, 8, 5.91515, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (218, 'PLC416', NULL, 'Plate 16 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 373.886, NULL, NULL, NULL, 36600, 270, 8, 7.39394, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (219, 'PLC418', NULL, 'Plate 18 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 420.622, NULL, NULL, NULL, 36600, 270, 8, 13.5556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (220, 'PLC420', NULL, 'Plate 20 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 467.358, NULL, NULL, NULL, 43920, 270, 8, 16.2667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (221, 'PLC422', NULL, 'Plate 22 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 514.093, NULL, NULL, NULL, 43920, 270, 8, 16.2667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (222, 'PLC425', NULL, 'Plate 25 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 584.197, NULL, NULL, NULL, 51240, 270, 8, 10.3515, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (223, 'PLC503', NULL, 'Plate 3 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 218.787, NULL, NULL, NULL, 30480, 270, 8, 4.23333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (224, 'PLC504', NULL, 'Plate 4 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 291.716, NULL, NULL, NULL, 30480, 270, 8, 4.23333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (225, 'PLC505', NULL, 'Plate 5 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 364.644, NULL, NULL, NULL, 45720, 270, 8, 6.35, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (226, 'PLC506', NULL, 'Plate 6 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 437.573, NULL, NULL, NULL, 45720, 270, 8, 6.35, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (227, 'PLC508', NULL, 'Plate 8 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 583.431, NULL, NULL, NULL, 45720, 270, 8, 9.23636, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (228, 'PLC510', NULL, 'Plate 10 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 729.289, NULL, NULL, NULL, 60960, 270, 8, 12.3152, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (229, 'PLC512', NULL, 'Plate 12 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 875.147, NULL, NULL, NULL, 60960, 270, 8, 12.3152, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (230, 'PLC516', NULL, 'Plate 16 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1166.86, NULL, NULL, NULL, 76200, 270, 8, 15.3939, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (231, 'PLC518', NULL, 'Plate 18 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1312.72, NULL, NULL, NULL, 76200, 270, 8, 28.2222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (232, 'PLC520', NULL, 'Plate 20 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1458.58, NULL, NULL, NULL, 91440, 270, 8, 33.8667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (233, 'PLC522', NULL, 'Plate 22 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1604.44, NULL, NULL, NULL, 91440, 270, 8, 33.8667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (234, 'PLC525', NULL, 'Plate 25 mm (5\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1823.22, NULL, NULL, NULL, 106680, 270, 8, 21.5515, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (235, 'PLC603', NULL, 'Plate 3 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 262.429, NULL, NULL, NULL, 31696, 270, 8, 4.40222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (236, 'PLC604', NULL, 'Plate 4 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 349.906, NULL, NULL, NULL, 31696, 270, 8, 4.40222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (237, 'PLC605', NULL, 'Plate 5 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 437.382, NULL, NULL, NULL, 47544, 270, 8, 6.60333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (238, 'PLC606', NULL, 'Plate 6 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 524.858, NULL, NULL, NULL, 47544, 270, 8, 6.60333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (239, 'PLC608', NULL, 'Plate 8 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 699.811, NULL, NULL, NULL, 47544, 270, 8, 9.60485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (240, 'PLC610', NULL, 'Plate 10 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 874.764, NULL, NULL, NULL, 63392, 270, 8, 12.8065, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (241, 'PLC612', NULL, 'Plate 12 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1049.72, NULL, NULL, NULL, 63392, 270, 8, 12.8065, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (242, 'PLC616', NULL, 'Plate 16 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1399.62, NULL, NULL, NULL, 79240, 270, 8, 16.0081, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (243, 'PLC618', NULL, 'Plate 18 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1574.57, NULL, NULL, NULL, 79240, 270, 8, 29.3481, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (244, 'PLC620', NULL, 'Plate 20 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1749.53, NULL, NULL, NULL, 95088, 270, 8, 35.2178, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (245, 'PLC622', NULL, 'Plate 22 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 1924.48, NULL, NULL, NULL, 95088, 270, 8, 35.2178, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (246, 'PLC625', NULL, 'Plate 25 mm (6\'x20\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 2186.91, NULL, NULL, NULL, 110936, 270, 8, 22.4113, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (247, 'CP023', NULL, 'Chk. Plate 2.3 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 19.8214, NULL, NULL, NULL, 8000, 270, 8, 1.11111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (248, 'CP030', NULL, 'Chk. Plate 3 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 25.854, NULL, NULL, NULL, 8000, 270, 8, 1.11111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (249, 'CP032', NULL, 'Chk. Plate 3.2 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 27.5776, NULL, NULL, NULL, 8000, 270, 8, 1.11111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (250, 'CP040', NULL, 'Chk. Plate 4 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 34.472, NULL, NULL, NULL, 8000, 270, 8, 1.11111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (251, 'CP045', NULL, 'Chk. Plate 4.5 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 38.781, NULL, NULL, NULL, 8000, 270, 8, 1.11111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (252, 'CP050', NULL, 'Chk. Plate 5 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 43.09, NULL, NULL, NULL, 8000, 270, 8, 1.11111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (253, 'CP060', NULL, 'Chk. Plate 6 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 51.708, NULL, NULL, NULL, 8000, 270, 8, 1.11111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (254, 'CP080', NULL, 'Chk. Plate 8 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 68.944, NULL, NULL, NULL, 12000, 270, 8, 2.42424, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (255, 'CP090', NULL, 'Chk. Plate 9 mm', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 77.562, NULL, NULL, NULL, 12000, 270, 8, 2.42424, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (256, 'CP423', NULL, 'Chk. Plate 2.3 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 59.0043, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (257, 'CP430', NULL, 'Chk. Plate 3 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 76.9622, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (258, 'CP432', NULL, 'Chk. Plate 3.2 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 82.093, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (259, 'CP440', NULL, 'Chk. Plate 4 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 102.616, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (260, 'CP445', NULL, 'Chk. Plate 4.5 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 115.443, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (261, 'CP450', NULL, 'Chk. Plate 5 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 128.27, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (262, 'CP460', NULL, 'Chk. Plate 6 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 153.924, NULL, NULL, NULL, 14640, 270, 8, 2.03333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (263, 'CP480', NULL, 'Chk. Plate 8 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 205.232, NULL, NULL, NULL, 21960, 270, 8, 4.43636, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (264, 'CP490', NULL, 'Chk. Plate 9 mm (4\'x8\')', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'CKPLATE', NULL, NULL, 230.887, NULL, NULL, NULL, 21960, 270, 8, 4.43636, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (265, 'PPC013-M', NULL, 'Pipe med. dia. 1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.22, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (266, 'PPC013-10', NULL, 'Pipe sch.10 dia. 1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (267, 'PPC013-40', NULL, 'Pipe sch.40 dia. 1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.27, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (268, 'PPC013-80', NULL, 'Pipe sch.80 dia. 1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.62, NULL, NULL, NULL, 264, 270, 8, 0.0366667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (269, 'PPC020-M', NULL, 'Pipe med. dia. 3/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.58, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (270, 'PPC020-10', NULL, 'Pipe sch.10 dia. 3/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.28, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (271, 'PPC020-40', NULL, 'Pipe sch.40 dia. 3/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 1.68, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (272, 'PPC020-80', NULL, 'Pipe sch.80 dia. 3/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.19, NULL, NULL, NULL, 340, 270, 8, 0.0472222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (273, 'PPC025-M', NULL, 'Pipe med. dia. 1\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.44, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (274, 'PPC025-10', NULL, 'Pipe sch.10 dia. 1\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.09, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (275, 'PPC025-40', NULL, 'Pipe sch.40 dia. 1\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.5, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (276, 'PPC025-80', NULL, 'Pipe sch.80 dia. 1\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.24, NULL, NULL, NULL, 428, 270, 8, 0.0594444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (277, 'PPC032-M', NULL, 'Pipe med. dia. 1-1/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.14, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (278, 'PPC032-10', NULL, 'Pipe sch.10 dia. 1-1/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 2.69, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (279, 'PPC032-40', NULL, 'Pipe sch.40 dia. 1-1/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3470000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*42', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (280, 'PPC032-80', NULL, 'Pipe sch.80 dia. 1-1/4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4.46, NULL, NULL, NULL, 540, 270, 8, 0.075, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (281, 'PPC040-M', NULL, 'Pipe med. dia. 1-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.62, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (282, 'PPC040-10', NULL, 'Pipe sch.10 dia. 1-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.11, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (283, 'PPC040-40', NULL, 'Pipe sch.40 dia. 1-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4100000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*48', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (284, 'PPC040-80', NULL, 'Pipe sch.80 dia. 1-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5.41, NULL, NULL, NULL, 628, 270, 8, 0.0872222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (285, 'PPC050-M', NULL, 'Pipe med. dia. 2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5100000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*60', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (286, 'PPC050-10', NULL, 'Pipe sch.10 dia. 2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 3.93, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (287, 'PPC050-20', NULL, 'Pipe sch.20 dia. 2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 4.51, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (288, 'PPC050-40', NULL, 'Pipe sch.40 dia. 2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5440000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*60', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (289, 'PPC050-80', NULL, 'Pipe sch.80 dia. 2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 7.49, NULL, NULL, NULL, 760, 270, 8, 0.105556, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (290, 'PPC065-M', NULL, 'Pipe med. dia. 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 6510000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*76', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (291, 'PPC065-10', NULL, 'Pipe sch.10 dia. 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 5.26, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (292, 'PPC065-20', NULL, 'Pipe sch.20 dia. 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 7.6, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (293, 'PPC065-40', NULL, 'Pipe sch.40 dia. 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 8.64, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (294, 'PPC065-80', NULL, 'Pipe sch.80 dia. 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 11.41, NULL, NULL, NULL, 1440, 270, 8, 0.290909, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (295, 'PPC075-M', NULL, 'Pipe med. dia. 3\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 8.47, NULL, NULL, NULL, 1132, 270, 8, 0.157222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (296, 'PPC075-10', NULL, 'Pipe sch.10 dia. 3\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 6.46, NULL, NULL, NULL, 1132, 270, 8, 0.157222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (297, 'PPC075-20', NULL, 'Pipe sch.20 dia. 3\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 9.37, NULL, NULL, NULL, 1132, 270, 8, 0.157222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (298, 'PPC075-40', NULL, 'Pipe sch.40 dia. 3\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 11290000, NULL, NULL, NULL, 1000, 1, 1, 0.157222, NULL, NULL, 'length*width*thick', 'length*3.143*89', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (299, 'PPC075-80', NULL, 'Pipe sch.80 dia. 3\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 15.27, NULL, NULL, NULL, 1698, 270, 8, 0.34303, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (300, 'PPC090-10', NULL, 'Pipe sch.10 dia. 3-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 7.41, NULL, NULL, NULL, 1280, 270, 8, 0.177778, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (301, 'PPC090-40', NULL, 'Pipe sch.40 dia. 3-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 13.57, NULL, NULL, NULL, 1280, 270, 8, 0.177778, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (302, 'PPC090-80', NULL, 'Pipe sch.80 dia. 3-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 18.63, NULL, NULL, NULL, 1920, 270, 8, 0.387879, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (303, 'PPC100-M', NULL, 'Pipe med. dia. 4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 12.1, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (304, 'PPC100-10', NULL, 'Pipe sch.10 dia. 4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 8.37, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (305, 'PPC100-20', NULL, 'Pipe sch.20 dia. 4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 13.22, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (306, 'PPC100-40', NULL, 'Pipe sch.40 dia. 4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 16070000, NULL, NULL, NULL, 1000, 1, 1, 0.2, NULL, NULL, 'length*width*thick', 'length*3.143*114', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (307, 'PPC100-80', NULL, 'Pipe sch.80 dia. 4\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 22.32, NULL, NULL, NULL, 2160, 270, 8, 0.436364, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (308, 'PPC125-M', NULL, 'Pipe med. dia. 5\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 16.2, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (309, 'PPC125-10', NULL, 'Pipe sch.10 dia. 5\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 11.56, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (310, 'PPC125-20', NULL, 'Pipe sch.20 dia. 5\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 17.13, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (311, 'PPC125-40', NULL, 'Pipe sch.40 dia. 5\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 21.77, NULL, NULL, NULL, 1780, 270, 8, 0.247222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (312, 'PPC125-80', NULL, 'Pipe sch.80 dia. 5\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 30.97, NULL, NULL, NULL, 2670, 270, 8, 0.539394, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (313, 'PPC150-M', NULL, 'Pipe med. dia. 6\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 19.2, NULL, NULL, NULL, 2120, 270, 8, 0.294444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (314, 'PPC150-10', NULL, 'Pipe sch.10 dia. 6\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 13820000, NULL, NULL, NULL, 1000, 1, 1, 0.294444, NULL, NULL, 'length*width*thick', 'length*3.143*168', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (315, 'PPC150-20', NULL, 'Pipe sch.20 dia. 6\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 22.08, NULL, NULL, NULL, 2120, 270, 8, 0.294444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (316, 'PPC150-40', NULL, 'Pipe sch.40 dia. 6\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 28260000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*168', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (317, 'PPC150-80', NULL, 'Pipe sch.80 dia. 6\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 42.56, NULL, NULL, NULL, 3180, 270, 8, 0.642424, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (318, 'PPC200-10', NULL, 'Pipe sch.10 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 19960000, NULL, NULL, NULL, 1000, 1, 1, 0.388889, NULL, NULL, 'length*width*thick', 'length*3.143*219', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (319, 'PPC200-20', NULL, 'Pipe sch.20 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 33.31, NULL, NULL, NULL, 2800, 270, 8, 0.388889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (320, 'PPC200-30', NULL, 'Pipe sch.30 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 36.1, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (321, 'PPC200-40', NULL, 'Pipe sch.40 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 42.54, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (322, 'PPC200-60', NULL, 'Pipe sch.60 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 52.3, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (323, 'PPC200-80', NULL, 'Pipe sch.80 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 64.63, NULL, NULL, NULL, 4200, 270, 8, 0.848485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (324, 'PPC200-100', NULL, 'Pipe sch.100 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 74.9, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (325, 'PPC200-120', NULL, 'Pipe sch.120 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 88.9, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (326, 'PPC200-140', NULL, 'Pipe sch.140 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 99.4, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (327, 'PPC200-160', NULL, 'Pipe sch.160 dia. 8\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 110, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (328, 'PPC250-10', NULL, 'Pipe sch.10 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 27780000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*273', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (329, 'PPC250-20', NULL, 'Pipe sch.20 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 41.76, NULL, NULL, NULL, 3440, 270, 8, 0.477778, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (330, 'PPC250-30', NULL, 'Pipe sch.30 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 49.9, NULL, NULL, NULL, 3440, 270, 8, 0.477778, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (331, 'PPC250-40', NULL, 'Pipe sch.40 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 59300000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*3.143*273', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (332, 'PPC250-60', NULL, 'Pipe sch.60 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.8, NULL, NULL, NULL, 8600, 270, 8, 1.73737, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (333, 'PPC250-80', NULL, 'Pipe sch.80 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 95.81, NULL, NULL, NULL, 10320, 270, 8, 2.08485, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (334, 'PPC250-100', NULL, 'Pipe sch.100 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 112, NULL, NULL, NULL, 10320, 270, 8, 1.43333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (335, 'PPC250-120', NULL, 'Pipe sch.120 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 130, NULL, NULL, NULL, 10320, 270, 8, 1.43333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (336, 'PPC250-140', NULL, 'Pipe sch.140 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 152, NULL, NULL, NULL, 10320, 270, 8, 1.43333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (337, 'PPC250-160', NULL, 'Pipe sch.160 dia. 10\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 185, NULL, NULL, NULL, 10320, 270, 8, 1.43333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (338, 'PPC300-10', NULL, 'Pipe sch.10 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 35.98, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (339, 'PPC300-20', NULL, 'Pipe sch.20 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 49.72, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (340, 'PPC300-30', NULL, 'Pipe sch.30 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 64.2, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (341, 'PPC300-40', NULL, 'Pipe sch.40 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.72, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (342, 'PPC300-60', NULL, 'Pipe sch.60 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 107, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (343, 'PPC300-80', NULL, 'Pipe sch.80 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 131.85, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (344, 'PPC300-100', NULL, 'Pipe sch.100 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 157, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (345, 'PPC300-120', NULL, 'Pipe sch.120 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 184, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (346, 'PPC300-140', NULL, 'Pipe sch.140 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 204, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (347, 'PPC300-160', NULL, 'Pipe sch.160 dia. 12\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 234, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (348, 'PPC350-10', NULL, 'Pipe sch.10 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 55100000, NULL, NULL, NULL, 1000, 1, 1, 1.19444, NULL, NULL, 'length*width*thick', 'length*3.143*356', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (349, 'PPC350-20', NULL, 'Pipe sch.20 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 67.7, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (350, 'PPC350-30', NULL, 'Pipe sch.30 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 81.1, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (351, 'PPC350-40', NULL, 'Pipe sch.40 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 94.3, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (352, 'PPC350-60', NULL, 'Pipe sch.60 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 127, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (353, 'PPC350-80', NULL, 'Pipe sch.80 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 158, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (354, 'PPC350-100', NULL, 'Pipe sch.100 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 195, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (355, 'PPC350-120', NULL, 'Pipe sch.120 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 225, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (356, 'PPC350-140', NULL, 'Pipe sch.140 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 254, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (357, 'PPC350-160', NULL, 'Pipe sch.160 dia. 14\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 282, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (358, 'PPC400-10', NULL, 'Pipe sch.10 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 62.1, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (359, 'PPC400-20', NULL, 'Pipe sch.20 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 77.6, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (360, 'PPC400-30', NULL, 'Pipe sch.30 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 93, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (361, 'PPC400-40', NULL, 'Pipe sch.40 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 123, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (362, 'PPC400-60', NULL, 'Pipe sch.60 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 150, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (363, 'PPC400-80', NULL, 'Pipe sch.80 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 203, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (364, 'PPC400-100', NULL, 'Pipe sch.100 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 246, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (365, 'PPC400-120', NULL, 'Pipe sch.120 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 288, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (366, 'PPC400-140', NULL, 'Pipe sch.140 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 333, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (367, 'PPC400-160', NULL, 'Pipe sch.160 dia. 16\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 365, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (368, 'PPC450-10', NULL, 'Pipe sch.10 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 71100000, NULL, NULL, NULL, 1000, 1, 1, 1.19444, NULL, NULL, 'length*width*thick', 'length*3.143*457', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (369, 'PPC450-20', NULL, 'Pipe sch.20 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 87.5, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (370, 'PPC450-30', NULL, 'Pipe sch.30 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 122, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (371, 'PPC450-40', NULL, 'Pipe sch.40 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 156, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (372, 'PPC450-60', NULL, 'Pipe sch.60 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 205, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (373, 'PPC450-80', NULL, 'Pipe sch.80 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 254, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (374, 'PPC450-100', NULL, 'Pipe sch.100 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 310, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (375, 'PPC450-120', NULL, 'Pipe sch.120 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 383, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (376, 'PPC450-140', NULL, 'Pipe sch.140 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 409, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (377, 'PPC450-160', NULL, 'Pipe sch.160 dia. 18\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 458, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (378, 'PPC500-10', NULL, 'Pipe sch.10 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.2, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (379, 'PPC500-20', NULL, 'Pipe sch.20 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 117, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (380, 'PPC500-30', NULL, 'Pipe sch.30 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 155, NULL, NULL, NULL, 8600, 270, 8, 1.19444, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (381, 'PPC500-40', NULL, 'Pipe sch.40 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 184, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (382, 'PPC500-60', NULL, 'Pipe sch.60 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 248, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (383, 'PPC500-80', NULL, 'Pipe sch.80 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 311, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (384, 'PPC500-100', NULL, 'Pipe sch.100 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 381, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (385, 'PPC500-120', NULL, 'Pipe sch.120 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 441, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (386, 'PPC500-140', NULL, 'Pipe sch.140 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 508, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (387, 'PPC500-160', NULL, 'Pipe sch.160 dia. 20\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 565, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (388, 'PPC550-10', NULL, 'Pipe sch.10 dia. 22\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 87.2, NULL, NULL, NULL, 10150, 270, 8, 1.40972, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (389, 'PPC550-20', NULL, 'Pipe sch.20 dia. 22\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 129, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (390, 'PPC550-30', NULL, 'Pipe sch.30 dia. 22\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 171, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (391, 'PPC550-40', NULL, 'Pipe sch.40 dia. 22\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 213, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (392, 'PPC600-10', NULL, 'Pipe sch.10 dia. 24\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 95.2, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (393, 'PPC600-20', NULL, 'Pipe sch.20 dia. 24\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 141, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (394, 'PPC600-30', NULL, 'Pipe sch.30 dia. 24\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 228, NULL, NULL, NULL, 12180, 270, 8, 1.69167, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (395, 'PPC650-10', NULL, 'Pipe sch.10 dia. 26\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 103, NULL, NULL, NULL, 10150, 270, 8, 1.40972, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (396, 'PPC650-20', NULL, 'Pipe sch.20 dia. 26\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 203, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (397, 'PPC700-20', NULL, 'Pipe sch.20 dia. 28\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 49.72, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (398, 'PPC700-40', NULL, 'Pipe sch.40 dia. 28\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.72, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (399, 'PPC700-80', NULL, 'Pipe sch.80 dia. 28\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 131.85, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:49', NULL, b'1');
INSERT INTO `master_part_material` VALUES (400, 'PPC75020', NULL, 'Pipe sch.20 dia. 30\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 49.72, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (401, 'PPC750-40', NULL, 'Pipe sch.40 dia. 30\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.72, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (402, 'PPC750-80', NULL, 'Pipe sch.80 dia. 30\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 131.85, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (403, 'PPC800-20', NULL, 'Pipe sch.20 dia. 32\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 49.72, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (404, 'PPC800-40', NULL, 'Pipe sch.40 dia. 32\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.72, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (405, 'PPC800-80', NULL, 'Pipe sch.80 dia. 32\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 131.85, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (406, 'PPC850-20', NULL, 'Pipe sch.20 dia. 34\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 49.72, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (407, 'PPC850-40', NULL, 'Pipe sch.40 dia. 34\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.72, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (408, 'PPC850-80', NULL, 'Pipe sch.80 dia. 34\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 131.85, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (409, 'PPC900-20', NULL, 'Pipe sch.20 dia. 36\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 49.72, NULL, NULL, NULL, 4060, 270, 8, 0.563889, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (410, 'PPC900-40', NULL, 'Pipe sch.40 dia. 36\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 79.72, NULL, NULL, NULL, 10150, 270, 8, 2.05051, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (411, 'PPC900-80', NULL, 'Pipe sch.80 dia. 36\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'PIPE', NULL, NULL, 131.85, NULL, NULL, NULL, 12180, 270, 8, 2.46061, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (412, 'HB100', NULL, 'HB100.100.6.8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'HB', NULL, NULL, 17.17, NULL, NULL, NULL, 1800, 270, 8, 0.363636, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (413, 'HB150', NULL, 'HB150.150.7.10', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'HB', NULL, NULL, 31.5, NULL, NULL, NULL, 2700, 270, 8, 0.545455, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (414, 'HB200', NULL, 'HB200.200.8.12', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'HB', NULL, NULL, 49.92, NULL, NULL, NULL, 3600, 270, 8, 0.727273, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (415, 'HB250', NULL, 'HB250.250.9.14', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'HB', NULL, NULL, 72.42, NULL, NULL, NULL, 4500, 270, 8, 0.909091, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (416, 'HB300', NULL, 'HB300.300.10.15', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'HB', NULL, NULL, 94, NULL, NULL, NULL, 5400, 270, 8, 1.09091, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (417, 'WF100', NULL, 'WF100.50.5.7', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 9334000, NULL, NULL, NULL, 12000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*380', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (418, 'WF125', NULL, 'WF125.60.5.7', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 13.2, NULL, NULL, NULL, 1800, 270, 8, 0.25, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (419, 'WF150', NULL, 'WF150.75.6.8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 14000000, NULL, NULL, NULL, 12000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*576', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (420, 'WF200', NULL, 'WF200.100.5,5.8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 21333300, NULL, NULL, NULL, 12000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*771', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (421, 'WF250', NULL, 'WF250.125.6.9', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 29600000, NULL, NULL, NULL, 12000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*967', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (422, 'WF300', NULL, 'WF300.150.6,5.9', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 36700000, NULL, NULL, NULL, 12000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*1165', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (423, 'WF350', NULL, 'WF350.175.7.11', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 49600000, NULL, NULL, NULL, 12000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*1362', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (424, 'WF400', NULL, 'WF400.200.8.13', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 66, NULL, NULL, NULL, 6400, 270, 8, 1.29293, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (425, 'WF450', NULL, 'WF450.200.9.14', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 76, NULL, NULL, NULL, 7200, 270, 8, 1.45455, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (426, 'WF496', NULL, 'WF496.199.9.14', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 79.5, NULL, NULL, NULL, 7936, 270, 8, 1.60323, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (427, 'WF500', NULL, 'WF500.200.10.16', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'WF', NULL, NULL, 89.584, NULL, NULL, NULL, 10000, 270, 8, 2.0202, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (428, 'UNP80', NULL, 'UNP 80.45.6', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 8.33, NULL, NULL, NULL, 1020, 270, 8, 0.141667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (429, 'UNP100', NULL, 'UNP 100.50.6', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 9367000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*394', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (430, 'UNP120', NULL, 'UNP 120.55.6', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 13.4, NULL, NULL, NULL, 1440, 270, 8, 0.2, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (431, 'UNP125', NULL, 'UNP 125.65.6', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 13.4, NULL, NULL, NULL, 1500, 270, 8, 0.208333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (432, 'UNP140', NULL, 'UNP 140.60.7', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 16, NULL, NULL, NULL, 1560, 270, 8, 0.216667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (433, 'UNP150', NULL, 'UNP 150.75.7,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 18667000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (434, 'UNP200', NULL, 'UNP 200.80.7,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 24.67, NULL, NULL, NULL, 2160, 270, 8, 0.3, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (435, 'UNP250', NULL, 'UNP 250.90.9', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'UNP', NULL, NULL, 34.6667, NULL, NULL, NULL, 2160, 270, 8, 0.3, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (436, 'CNP100-23', NULL, 'CNP 100.50.20.2,3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'CNP', NULL, NULL, 4.06, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (437, 'CNP100-32', NULL, 'CNP 100.50.20.3,2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'CNP', NULL, NULL, 5500000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*449', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (438, 'CNP125-23', NULL, 'CNP 125.50.20.2,3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'CNP', NULL, NULL, 4.51, NULL, NULL, NULL, 1060, 270, 8, 0.147222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (439, 'CNP125-32', NULL, 'CNP 125.50.20.3,2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'CNP', NULL, NULL, 6.17, NULL, NULL, NULL, 1060, 270, 8, 0.147222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (440, 'CNP150-23', NULL, 'CNP 150.50.20.2,3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'CNP', NULL, NULL, 5, NULL, NULL, NULL, 1160, 270, 8, 0.161111, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (441, 'CNP150-32', NULL, 'CNP 150.50.20.3,2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'CNP', NULL, NULL, 6760000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*549', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (442, 'L30', NULL, 'L 30.30.3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 1360000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*120', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (443, 'L40-3', NULL, 'L 40.40.3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 1.34, NULL, NULL, NULL, 480, 270, 8, 0.0666667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (444, 'L40-4', NULL, 'L 40.40.4', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 2420000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*160', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (445, 'L50', NULL, 'L 50.50.5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 3780000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*200', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (446, 'L60-5', NULL, 'L 60.60.5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 4.55, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (447, 'L60-6', NULL, 'L 60.60.6', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 5420000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*240', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (448, 'L65', NULL, 'L 65.65.6', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 5.92, NULL, NULL, NULL, 780, 270, 8, 0.108333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (449, 'L70', NULL, 'L 70.70.7', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 7380000, NULL, NULL, NULL, 6000, 1, 1, 0.116667, NULL, NULL, 'length*width*thick', 'length*280', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (450, 'L75-6', NULL, 'L 75.75.6', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'L', NULL, NULL, 6870000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*300', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (451, 'L75-8', NULL, 'L 75.75.8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 9.03, NULL, NULL, NULL, 900, 270, 8, 0.125, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (452, 'L80', NULL, 'L 80.80.8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 9660000, NULL, NULL, NULL, 6000, 1, 1, 0.133333, NULL, NULL, 'length*width*thick', 'length*320', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (453, 'L90', NULL, 'L 90.90.9', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 12200000, NULL, NULL, NULL, 6000, 1, 1, 0.15, NULL, NULL, 'length*width*thick', 'length*360', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (454, 'L100', NULL, 'L 100.100.10', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 15100000, NULL, NULL, NULL, 6000, 1, 1, 0.166667, NULL, NULL, 'length*width*thick', 'length*400', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (455, 'SB08', NULL, 'AS Kotak 8 x 8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 0.5, NULL, NULL, NULL, 480, 270, 8, 0.0666667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (456, 'SB10', NULL, 'AS Kotak10 x 10', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 0.79, NULL, NULL, NULL, 480, 270, 8, 0.0666667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (457, 'SB12', NULL, 'AS Kotak 12 x 12', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 1.17, NULL, NULL, NULL, 600, 270, 8, 0.0833333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (458, 'SB16', NULL, 'AS Kotak 16 x 16', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 2010000, NULL, NULL, NULL, 6000, 1, 1, 0.1, NULL, NULL, 'length*width*thick', 'length*48', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (459, 'SB19', NULL, 'AS Kotak 19 x 19', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 2.83, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (460, 'SB22', NULL, 'AS Kotak 22 x 22', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 3.83, NULL, NULL, NULL, 780, 270, 8, 0.108333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (461, 'SB25', NULL, 'AS Kotak 25 x 25', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 5.17, NULL, NULL, NULL, 840, 270, 8, 0.116667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (462, 'SB32', NULL, 'AS Kotak 32 x 32', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 8.08, NULL, NULL, NULL, 900, 270, 8, 0.125, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (463, 'SB38', NULL, 'AS Kotak 38 x 38', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 11.33, NULL, NULL, NULL, 900, 270, 8, 0.125, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (464, 'SB45', NULL, 'AS Kotak 45 x 45', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 15.9, NULL, NULL, NULL, 960, 270, 8, 0.133333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (465, 'SB50', NULL, 'AS Kotak 50 x 50', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 19.67, NULL, NULL, NULL, 1080, 270, 8, 0.15, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (466, 'SB65', NULL, 'AS Kotak 65 x 65', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 33.17, NULL, NULL, NULL, 1200, 270, 8, 0.166667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (467, 'SB75', NULL, 'AS Kotak 75 x 75', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ASSB', NULL, NULL, 44.17, NULL, NULL, NULL, 1200, 270, 8, 0.166667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (468, 'ST40-20', NULL, 'Pipa Kotak 40 x 40 x 2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 2.4, NULL, NULL, NULL, 480, 270, 8, 0.0666667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (469, 'ST40-23', NULL, 'Pipa Kotak 40 x 40 x 2,3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 2.77, NULL, NULL, NULL, 480, 270, 8, 0.0666667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (470, 'ST50-23', NULL, 'Pipa Kotak 50 x 50 x 2,3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 3.04, NULL, NULL, NULL, 600, 270, 8, 0.0833333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (471, 'ST50-25', NULL, 'Pipa Kotak 50 x 50 x 2,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 3.8, NULL, NULL, NULL, 600, 270, 8, 0.0833333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (472, 'ST50-27', NULL, 'Pipa Kotak 50 x 50 x 2,7', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 4.17, NULL, NULL, NULL, 600, 270, 8, 0.0833333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (473, 'ST50-28', NULL, 'Pipa Kotak 50 x 50 x 2,8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 4.25, NULL, NULL, NULL, 600, 270, 8, 0.0833333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (474, 'ST50-30', NULL, 'Pipa Kotak 50 x 50 x 3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 4.58, NULL, NULL, NULL, 600, 270, 8, 0.0833333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (475, 'ST60-20', NULL, 'Pipa Kotak 60 x 60 x 2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 5.13, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (476, 'ST60-23', NULL, 'Pipa Kotak 60 x 60 x 2,3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 5.5, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (477, 'ST60-25', NULL, 'Pipa Kotak 60 x 60 x 2,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 5.86, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (478, 'ST60-28', NULL, 'Pipa Kotak 60 x 60 x 2,8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 4.61, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (479, 'ST60-30', NULL, 'Pipa Kotak 60 x 60 x 3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 5.5, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (480, 'ST60-32', NULL, 'Pipa Kotak 60 x 60 x 3,2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 5.86, NULL, NULL, NULL, 720, 270, 8, 0.1, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (481, 'ST75-20', NULL, 'Pipa Kotak 75 x 75 x 2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 4.61, NULL, NULL, NULL, 900, 270, 8, 0.125, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (482, 'ST75-23', NULL, 'Pipa Kotak 75 x 75 x 2,3', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 5.33, NULL, NULL, NULL, 900, 270, 8, 0.125, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (483, 'ST75-25', NULL, 'Pipa Kotak 75 x 75 x 2,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 5.76, NULL, NULL, NULL, 900, 270, 8, 0.125, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (484, 'ST75-32', NULL, 'Pipa Kotak 75 x 75 x 3,2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 7.37, NULL, NULL, NULL, 900, 270, 8, 0.125, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (485, 'ST100-32', NULL, 'Pipa Kotak 100 x 100 x 3,2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 9.88, NULL, NULL, NULL, 1200, 270, 8, 0.166667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (486, 'ST100-45', NULL, 'Pipa Kotak 100 x 100 x 4,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 13.9, NULL, NULL, NULL, 1200, 270, 8, 0.166667, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (487, 'ST125-32', NULL, 'Pipa Kotak 125 x 125 x 3,2', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 12.39, NULL, NULL, NULL, 1500, 270, 8, 0.208333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (488, 'ST125-45', NULL, 'Pipa Kotak 125 x 125 x 4,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 17.43, NULL, NULL, NULL, 1500, 270, 8, 0.208333, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (489, 'ST150-45', NULL, 'Pipa Kotak 150 x 150 x 4,5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 20.96, NULL, NULL, NULL, 1800, 270, 8, 0.25, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (490, 'ST150-50', NULL, 'Pipa Kotak 150 x 150 x 5', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 23.29, NULL, NULL, NULL, 1800, 270, 8, 0.25, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (491, 'RBC08', NULL, 'Round bar dia.8', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 0.4, NULL, NULL, NULL, 25, 270, 8, 0.00347222, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (492, 'RBC10', NULL, 'Round bar dia.10', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6167, NULL, NULL, NULL, 12000, 10, 10, 0, NULL, NULL, 'length*width*thick', 'length*3.143*10', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (493, 'RBC12', NULL, 'Round bar dia.12', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6169, NULL, NULL, NULL, 12000, 12, 12, 0, NULL, NULL, 'length*width*thick', 'length*12*3.143', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (494, 'RBC16', NULL, 'Round bar dia.16', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6172, NULL, NULL, NULL, 12000, 16, 16, 0, NULL, NULL, 'length*width*thick', 'length*3.143*16', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (495, 'RBC19', NULL, 'Round bar dia.19', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 2.23, NULL, NULL, NULL, 126, 270, 8, 0.0175, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (496, 'RBC22', NULL, 'Round bar dia.22', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6157.1, NULL, NULL, NULL, 12000, 22, 22, 0, NULL, NULL, 'length*width*thick', 'length*3.143*22', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (497, 'DBC13', NULL, 'Deformed bar dia.13', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6166, NULL, NULL, NULL, 12000, 13, 13, 0, NULL, NULL, 'length*width*thick', 'length*13*3.14', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (498, 'DBC16', NULL, 'Deformed bar dia.16', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6166, NULL, NULL, NULL, 12000, 16, 16, 0, NULL, NULL, 'length*width*thick', 'length*3.14*16', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (499, 'DBC19', NULL, 'Deformed bar dia.19', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6166, NULL, NULL, NULL, 12000, 19, 19, 0, NULL, NULL, 'length*width*thick', 'length*19*3.14', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (500, 'ASC25', NULL, 'As Dia. 1\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'AS', NULL, NULL, 6400, NULL, NULL, NULL, 6000, 25, 25, 0, NULL, NULL, 'length*width*thick', 'length*3.143*25', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (501, 'PLC045', NULL, 'Plate 4.5 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 2440, 1220, 5, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (502, 'ASC38', NULL, 'As Dia. 1-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 38, 38, 0, NULL, NULL, 'length*width*thick', 'length*3.143*38', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (503, 'PLC040', NULL, 'Plate 40 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 40, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (504, 'PLC050', NULL, 'Plate 50 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 50, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (505, 'PLC060', NULL, 'Plate 60 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 60, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (506, 'PLC009', NULL, 'Plate 9 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 1500, 270, 9, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (507, 'PLS015', NULL, 'Plate 9 mm (SUS 304)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7930, NULL, NULL, NULL, 1000, 270, 9, 0, NULL, NULL, 'length*width*thick', 'length*width*2', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (508, 'RP24-20', NULL, 'Ring Plate 20 mm (OD 2440 x  ID 1220)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 550.593, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (509, 'RP24-22', NULL, 'Ring Plate 22 mm (OD 2440 x  ID 1220)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 605.652, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (510, 'RP24-25', NULL, 'Ring Plate 25 mm (OD 2440 x  ID 1220)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 688.241, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (511, 'RP65-03', NULL, 'Ring Plate 3 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 644.38, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (512, 'RP65-04', NULL, 'Ring Plate 4 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 859.173, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (513, 'RP65-05', NULL, 'Ring Plate 5 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 1073.97, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (514, 'RP65-06', NULL, 'Ring Plate 6 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 1288.76, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (515, 'RP65-08', NULL, 'Ring Plate 8 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 1718.35, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (516, 'RP65-10', NULL, 'Ring Plate 10 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 2147.93, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (517, 'RP65-12', NULL, 'Ring Plate 12 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 2577.52, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (518, 'RP65-16', NULL, 'Ring Plate 16 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 3436.69, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (519, 'RP65-18', NULL, 'Ring Plate 18 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 3866.28, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (520, 'RP65-20', NULL, 'Ring Plate 20 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 4295.87, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (521, 'RP65-22', NULL, 'Ring Plate 22 mm (OD 6096 x  ID 1524)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 4725.45, NULL, NULL, NULL, 0, 270, 8, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (522, 'RBC-55', NULL, 'As Dia. 55', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 55, 55, 0, NULL, NULL, 'length*width*thick', 'length*3.143*55', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (523, 'RBC-50', NULL, 'As Dia. 50', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 50, 50, 0, NULL, NULL, 'length*width*thick', 'length*3.143*50', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (524, 'RBC-100', NULL, 'As Dia. 100', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 100, 100, 0, NULL, NULL, 'length*width*thick', 'length*3.143*100', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (525, 'PLC030', NULL, 'Plate 30 mm (MS)', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 7850, NULL, NULL, NULL, 6000, 1500, 30, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (526, 'ELB01', NULL, 'ELASTOMERIC BEARING', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 0, NULL, NULL, NULL, 300, 200, 50, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (527, 'ELB02', NULL, 'ELASTOMERIC BEARING', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'CIVIL', NULL, NULL, 0, NULL, NULL, NULL, 200, 150, 20, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (528, 'UB076', NULL, 'UBOLT M10 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (529, 'CP076', NULL, 'CAP 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (530, 'SC076', NULL, 'SOCKET 2-1/2\"', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (531, 'RP68-20', NULL, 'BONDECK ', 'STEEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LMB', 'Area', 'PLATE', NULL, NULL, 6990, NULL, NULL, NULL, 1000, 1000, 1, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (532, 'EL090', NULL, 'Elbow 90 Dia. 1-1/4\"', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'PIPE', NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (533, 'ST50-50', NULL, 'Pipa Kotak 50 x 50 x 5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'ST', NULL, NULL, 6904000, NULL, NULL, NULL, 1000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*200', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (534, 'L25', NULL, 'L 25.25.3', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Area', 'L', NULL, NULL, 1120000, NULL, NULL, NULL, 6000, 1, 1, 0, NULL, NULL, 'length*width*thick', 'length*100', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (535, 'RBC-20', NULL, 'As Dia. 20', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 20, 20, 0, NULL, NULL, 'length*width*thick', 'length*3.143*20', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (536, 'FL006-150', NULL, 'FLANGE 6\" S0 (150)', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PCS', 'Area', 'RING', NULL, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 'length*width*thick', 'length*width', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (537, 'RBC-70', NULL, 'As dia.70', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 70, 70, 0, NULL, NULL, 'length*width*thick', 'length*3.143*70', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (538, 'RBC-60', NULL, 'As dia.60', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 60, 60, 0, NULL, NULL, 'length*width*thick', 'length*3.143*70', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (539, 'RBC-75', NULL, 'As dia.75', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BTG', 'Length', 'AS', NULL, NULL, 6250, NULL, NULL, NULL, 6000, 75, 75, 0, NULL, NULL, 'length*width*thick', 'length*3.143*75', NULL, NULL, NULL, NULL, '2020-12-09 02:24:50', NULL, b'1');
INSERT INTO `master_part_material` VALUES (540, 'ra', 'sa', NULL, 'sa', 'BKG', NULL, NULL, NULL, '', NULL, '', '', '', 'BTG', 'Length', 'AS', '1', '10', 10, 0, '', '', 10, 10, 10, 0.1, 'NSN-308', '', 'length*thick*width', '', NULL, NULL, NULL, NULL, '2020-12-20 18:04:00', '2020-12-20 18:04:09', b'0');

-- ----------------------------
-- Table structure for mpk
-- ----------------------------
DROP TABLE IF EXISTS `mpk`;
CREATE TABLE `mpk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_quotation_id` int(11) NULL DEFAULT NULL,
  `mpk_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `rev_no` int(11) NULL DEFAULT NULL,
  `rev_date` datetime(0) NULL DEFAULT NULL,
  `checked_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `approved_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mpk
-- ----------------------------

-- ----------------------------
-- Table structure for ms_consumable
-- ----------------------------
DROP TABLE IF EXISTS `ms_consumable`;
CREATE TABLE `ms_consumable`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qualification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `minimal_stock` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_consumable
-- ----------------------------
INSERT INTO `ms_consumable` VALUES (1, 'GM02', '01', '01w', 'size', '100', '2000', NULL, '2020-12-01 22:36:28', '2020-12-01 23:05:29', b'1');
INSERT INTO `ms_consumable` VALUES (2, 'GM', '01', '01w', 'size', '100', '1000', NULL, '2020-12-01 22:36:32', '2020-12-01 23:05:33', b'0');
INSERT INTO `ms_consumable` VALUES (3, 'GM', '01', '01w', 'size', '100', '1000', NULL, '2020-12-01 22:37:13', '2020-12-01 23:05:31', b'0');

-- ----------------------------
-- Table structure for ms_destination
-- ----------------------------
DROP TABLE IF EXISTS `ms_destination`;
CREATE TABLE `ms_destination`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_destination
-- ----------------------------
INSERT INTO `ms_destination` VALUES (1, 'Jakarta', 'kota', '2020-11-29 03:07:43', NULL, b'1');
INSERT INTO `ms_destination` VALUES (2, 'JKT TMR', 'Jakarta timur', '2020-11-29 03:07:52', '2020-11-29 03:08:42', b'0');

-- ----------------------------
-- Table structure for ms_document_type
-- ----------------------------
DROP TABLE IF EXISTS `ms_document_type`;
CREATE TABLE `ms_document_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_document_type
-- ----------------------------
INSERT INTO `ms_document_type` VALUES (1, 'Drawing', NULL, '2020-11-27 16:58:27', NULL, b'1');
INSERT INTO `ms_document_type` VALUES (2, 'Bill of Quantity', NULL, '2020-11-27 16:58:57', '2020-11-29 03:09:40', b'1');
INSERT INTO `ms_document_type` VALUES (3, 'Commercial Sheet', NULL, '2020-11-27 16:59:05', NULL, b'1');
INSERT INTO `ms_document_type` VALUES (4, 'Schedule', NULL, '2020-11-27 16:59:11', NULL, b'1');
INSERT INTO `ms_document_type` VALUES (5, 'MPK', NULL, '2020-11-27 16:59:17', NULL, b'1');
INSERT INTO `ms_document_type` VALUES (6, 'Inspection Test and Plan', NULL, '2020-11-27 16:59:22', NULL, b'1');
INSERT INTO `ms_document_type` VALUES (7, 'Quotation', NULL, '2020-11-27 16:59:26', NULL, b'1');
INSERT INTO `ms_document_type` VALUES (8, 'Packing List', NULL, '2020-11-27 16:59:33', NULL, b'1');
INSERT INTO `ms_document_type` VALUES (9, 'Delivery Order', NULL, '2020-11-27 16:59:37', NULL, b'1');
INSERT INTO `ms_document_type` VALUES (10, 'BSK', NULL, '2020-11-27 16:59:42', NULL, b'1');
INSERT INTO `ms_document_type` VALUES (11, 'Test 2', NULL, '2020-11-28 15:07:49', '2020-11-28 15:15:52', b'0');
INSERT INTO `ms_document_type` VALUES (12, 'ganti', NULL, '2020-11-28 15:10:36', '2020-11-28 15:15:47', b'0');

-- ----------------------------
-- Table structure for ms_menu
-- ----------------------------
DROP TABLE IF EXISTS `ms_menu`;
CREATE TABLE `ms_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_menu
-- ----------------------------
INSERT INTO `ms_menu` VALUES (1, 'Administrator', 'User', b'1');
INSERT INTO `ms_menu` VALUES (2, 'Administrator', 'Master Data', b'1');
INSERT INTO `ms_menu` VALUES (3, 'Administrator', 'Database', b'1');
INSERT INTO `ms_menu` VALUES (4, 'Marketing', 'Master', b'1');
INSERT INTO `ms_menu` VALUES (5, 'Marketing', 'Quotation', b'1');
INSERT INTO `ms_menu` VALUES (6, 'Marketing', 'Projects', b'1');
INSERT INTO `ms_menu` VALUES (7, 'Marketing', 'Job Order', b'1');
INSERT INTO `ms_menu` VALUES (8, 'Marketing', 'Kickoff Meeting', b'1');
INSERT INTO `ms_menu` VALUES (9, 'Marketing', 'Delivery Order', b'1');
INSERT INTO `ms_menu` VALUES (10, 'Marketing', 'Reports', b'1');
INSERT INTO `ms_menu` VALUES (11, 'Purchasing', 'Vendors', b'1');
INSERT INTO `ms_menu` VALUES (12, 'Purchasing', 'Materials', b'1');
INSERT INTO `ms_menu` VALUES (13, 'Purchasing', 'Purchase Request', b'1');
INSERT INTO `ms_menu` VALUES (14, 'Purchasing', 'Purchase Order', b'1');
INSERT INTO `ms_menu` VALUES (15, 'Purchasing', 'Project', b'1');
INSERT INTO `ms_menu` VALUES (16, 'Purchasing', 'Master Part', b'1');
INSERT INTO `ms_menu` VALUES (17, 'Purchasing', 'SPB', b'1');
INSERT INTO `ms_menu` VALUES (18, 'Purchasing', 'Reports', b'1');
INSERT INTO `ms_menu` VALUES (19, 'Engineering', 'Bill of Quantity', b'1');
INSERT INTO `ms_menu` VALUES (20, 'Engineering', 'Master Part', b'1');
INSERT INTO `ms_menu` VALUES (21, 'Maintenance', 'Equipment & Inventories', b'1');
INSERT INTO `ms_menu` VALUES (22, 'Maintenance', 'Transactions', b'1');
INSERT INTO `ms_menu` VALUES (23, 'Maintenance', 'Reports', b'1');
INSERT INTO `ms_menu` VALUES (24, 'PPC', 'Schedule & Progress', b'1');
INSERT INTO `ms_menu` VALUES (25, 'PPC', 'Material Requirement (DKM)', b'1');
INSERT INTO `ms_menu` VALUES (26, 'PPC', 'Packing Lists', b'1');
INSERT INTO `ms_menu` VALUES (27, 'PPC', 'Monitoring Progress', b'1');
INSERT INTO `ms_menu` VALUES (28, 'Logistic', 'Master Consumable', b'1');
INSERT INTO `ms_menu` VALUES (29, 'Logistic', 'Project', b'1');
INSERT INTO `ms_menu` VALUES (30, 'Logistic', 'Inventory', b'1');
INSERT INTO `ms_menu` VALUES (31, 'Logistic', 'Stock Opname', b'1');
INSERT INTO `ms_menu` VALUES (32, 'Logistic', 'Reports', b'1');
INSERT INTO `ms_menu` VALUES (33, 'Logistic', 'Request Consumable', b'1');
INSERT INTO `ms_menu` VALUES (34, 'QC', 'Inspection and Testplan', b'1');
INSERT INTO `ms_menu` VALUES (35, 'Production', 'Schedule & Fabrication', b'1');
INSERT INTO `ms_menu` VALUES (36, 'Production', 'Barang Siap Kirim', b'1');
INSERT INTO `ms_menu` VALUES (37, 'PPC', 'MPK', b'1');

-- ----------------------------
-- Table structure for ms_pic
-- ----------------------------
DROP TABLE IF EXISTS `ms_pic`;
CREATE TABLE `ms_pic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_pic
-- ----------------------------
INSERT INTO `ms_pic` VALUES (1, 'MK', 'martin', '2020-11-29 02:58:26', NULL, b'1');
INSERT INTO `ms_pic` VALUES (2, 'CK', 'Cheon sa', '2020-11-29 02:58:53', '2020-11-29 02:59:01', b'0');

-- ----------------------------
-- Table structure for ms_product
-- ----------------------------
DROP TABLE IF EXISTS `ms_product`;
CREATE TABLE `ms_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_product
-- ----------------------------
INSERT INTO `ms_product` VALUES (1, 'GM', 'Gundam MK2', '2020-11-29 03:02:39', '2020-11-29 03:02:57', b'0');
INSERT INTO `ms_product` VALUES (2, 'GK', 'Goal Keeper', '2020-11-29 03:02:45', '2020-11-29 03:02:55', b'0');
INSERT INTO `ms_product` VALUES (3, 'BKG', 'barang Kilo Gram', '2020-12-03 20:36:28', NULL, b'1');

-- ----------------------------
-- Table structure for ms_submenu
-- ----------------------------
DROP TABLE IF EXISTS `ms_submenu`;
CREATE TABLE `ms_submenu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NULL DEFAULT NULL,
  `sub_menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_active` bit(1) NULL DEFAULT NULL,
  `create` bit(1) NULL DEFAULT NULL,
  `edit` bit(1) NULL DEFAULT NULL,
  `delete` bit(1) NULL DEFAULT NULL,
  `view` bit(1) NULL DEFAULT NULL,
  `approve` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_submenu
-- ----------------------------
INSERT INTO `ms_submenu` VALUES (1, 1, 'User Group', 'admin/role', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (2, 1, 'User Account', 'admin/user', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (3, 2, 'General Setting', 'admin/general', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (4, 2, 'Product', 'admin/product', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (5, 2, 'Document Type', 'admin/document', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (6, 2, 'Destination', 'admin/destination', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (7, 2, 'Warehouse Location', 'admin/warehouse', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (8, 2, 'PIC', 'admin/pic', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (9, 2, 'Unit of Measurements', 'admin/uom', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (10, 2, 'Currency', 'admin/currency', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (11, 2, 'Part Types', 'admin/part', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (12, 3, 'Import Data', 'admin/import', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (13, 2, 'Document Numbering', 'admin/numbering', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (14, 4, 'Customer List', 'marketing/customer', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (15, 4, 'Add New Customer', 'marketing/customer/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (16, 4, 'Sales Order Types', 'marketing/sot', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (17, 4, 'Scope of Works', 'marketing/sow', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (18, 4, 'Kick Off Meeting Template', 'marketing/kom', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (19, 5, 'Quotation List', 'marketing/quotation', b'1', b'0', b'1', b'1', b'1', b'1');
INSERT INTO `ms_submenu` VALUES (20, 5, 'Add New Quotation', 'marketing/quotation/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (21, 5, 'BQ and Documents', 'marketing/document', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (22, 6, 'Project List', 'marketing/project', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (23, 6, 'Add New Project', 'marketing/project/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (24, 7, 'Job Order List', 'marketing/joborder', b'1', NULL, b'1', b'1', b'1', b'1');
INSERT INTO `ms_submenu` VALUES (25, 7, 'Add New Job Order', 'marketing/joborder/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (26, 7, 'Job Order Documents', 'marketing/document', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (27, 8, 'Kickoff Meeting Lists', 'marketing/kom', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (28, 8, 'Add Kickoff Meeting', 'marketing/kom/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (29, 9, 'Delivery Order List', 'marketing/delivery', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (30, 9, 'Add New Delivery Order', 'marketing/delivery/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (31, 10, 'Add Yearly Target', 'marketing/joborder/report/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (32, 10, 'Yearly Report', 'marketing/joborder/report', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (33, 11, 'Vendor List', 'purchasing/vendor', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (34, 11, 'Add New Vendor', 'purchasing/vendor/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (35, 12, 'Material List', 'purchasing/material', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (36, 13, 'Purchase Request List', 'purchasing/request', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (37, 13, 'Add New Purchase Request', 'purchasing/request/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (39, 15, 'Job Order', 'marketing/joborder', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (40, 15, 'DKM', 'marketing/joborder', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (41, 14, 'Purchase Order List', 'puchasing/orders', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (42, 14, 'Add New Purchase Order', 'purchasing/orders/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (43, 16, 'Master Part List', NULL, b'0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (44, 16, 'Add New Master Part', NULL, b'0', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (45, 17, 'SPB List', 'purchasing/spb', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (46, 17, 'Add New SPB', 'purchasing/spb/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (47, 18, 'Monthly Report', 'purchasing/report/monthly', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (48, 18, 'Per Project', 'purchasing/report/project', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (49, 19, 'Bill of Quantity List', 'engineering/boq', b'1', NULL, b'1', b'1', b'1', b'1');
INSERT INTO `ms_submenu` VALUES (50, 19, 'Add New Bill of Quantity', 'engineering/boq/create', b'1', b'1', NULL, NULL, b'1', NULL);
INSERT INTO `ms_submenu` VALUES (51, 20, 'Master Part List', 'engineering/master', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (52, 20, 'Add New Master Part', 'engineering/master/create', b'1', b'1', NULL, NULL, b'1', NULL);
INSERT INTO `ms_submenu` VALUES (53, 21, 'Equipment Lists', 'maintenance/equipment', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (54, 21, 'Add New Equipment', 'maintenance/equipment/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (55, 21, 'Equpment Types', 'maintenance/equipment/type', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (56, 21, 'Equipment Group', 'maintenance/equipment/group', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (57, 22, 'Transaction Lists', 'maintenance/transaction', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (58, 22, 'Add New Transaction', 'maintenance/transaction/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (59, 23, 'Reports', 'maintenance/reports', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (60, 24, 'Schedule List', 'ppc/schedule', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (61, 24, 'Add New Schedule', 'ppc/schedule/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (62, 25, 'Material Requirement List', 'ppc/dkm', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (63, 25, 'Add New Material Requirement', 'ppc/dkm/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (64, 37, 'MPK List', 'ppc/mpk', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (65, 37, 'Add New MPK', 'ppc/mpk/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (66, 26, 'Packing Lists', 'ppc/packing', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (67, 26, 'Add New Packing Lists', 'ppc/packing/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (68, 27, 'Reports', 'ppc/schedule/monitoring', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (69, 28, 'Master Consumable', 'logistic/consumable', b'1', b'0', b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (70, 29, 'Job Orders', 'marketing/joborder', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (71, 29, 'DKM', 'ppc/dkm', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (72, 30, 'Penerimaan Consumable', 'logistic/consumable/input', b'1', b'1', NULL, NULL, b'1', NULL);
INSERT INTO `ms_submenu` VALUES (73, 30, 'Pengambilan Consumable', 'logistic/consumable/output', b'1', b'1', NULL, NULL, b'1', NULL);
INSERT INTO `ms_submenu` VALUES (74, 30, 'Stock Consumable', 'logistic/inventory', b'1', NULL, NULL, NULL, b'1', NULL);
INSERT INTO `ms_submenu` VALUES (75, 30, 'Transaction Records', 'logistic/consumable/history', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (76, 31, 'Stock Opname Lists', 'logistic/opname', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (77, 31, 'Add New Stock Opname', 'logistic/opname/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (78, 32, 'Penerimaan Consumable', 'logistic/report/monthly/input', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (79, 32, 'Pengeluaran Consumable', 'logistic/report/monthly/output', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (80, 32, 'Per Project', 'logistic/report/project', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (81, 32, 'Stock Opname', 'logistic/report/monthly/stock', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (82, 33, 'Request Consumable List', 'logistic/request', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (83, 33, 'Add New Request Consumable', 'logistic/request/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (84, 34, 'Inspection & Test Plan Lists', 'qc/inspection', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (85, 34, 'Add New Inspection & Test Plan', 'qc/inspection/create', b'1', b'1', NULL, NULL, NULL, NULL);
INSERT INTO `ms_submenu` VALUES (86, 35, 'Schedule', 'production/schedule', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (87, 35, 'MPK', 'ppc/mpk', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (88, 36, 'BSK List', 'production/bsk', b'1', NULL, b'1', b'1', b'1', NULL);
INSERT INTO `ms_submenu` VALUES (89, 36, 'Add New BSK', 'production/bsk/create', b'1', b'1', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ms_vendor
-- ----------------------------
DROP TABLE IF EXISTS `ms_vendor`;
CREATE TABLE `ms_vendor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ppn` bit(1) NULL DEFAULT NULL,
  `outsource` bit(1) NULL DEFAULT NULL,
  `vendor_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `supplier_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `post_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bank_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `npwp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tkip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `delivery_terms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `payment_terms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_vendor
-- ----------------------------
INSERT INTO `ms_vendor` VALUES (1, b'1', b'1', 'CODE', 'name', 'asdasdnk', 'knasdaknsd', 'wqnkdaskdnak', 'anskfdnakfn', 'dnaksdnask', 'asdnkad', 'IDR', 'naksdnka', 'naskdnask', 'qdnqksndkas', 'qsn', 'knk', 'dnkqkdnaskdna', '2', '1', NULL, '2020-12-02 20:53:11', NULL, b'1');

-- ----------------------------
-- Table structure for ms_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `ms_warehouse`;
CREATE TABLE `ms_warehouse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_warehouse
-- ----------------------------
INSERT INTO `ms_warehouse` VALUES (1, 'MK', 'martin 2', 'jalan jalan', '08141', '1231', 'mail@to', 'naksdakda', '2020-11-29 03:18:10', '2020-11-29 03:21:18', b'0');
INSERT INTO `ms_warehouse` VALUES (2, 'WRH1', 'Gudang Kedep', 'Kedep, Gunung Putri', '7458402', '7458401', ' oke@oke.com', 'test', '2020-12-03 22:04:15', NULL, b'1');

-- ----------------------------
-- Table structure for packing_list
-- ----------------------------
DROP TABLE IF EXISTS `packing_list`;
CREATE TABLE `packing_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NULL DEFAULT NULL,
  `vendor_id` int(11) NULL DEFAULT NULL,
  `packing_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bsk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fabricator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `loading_part` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `packing_list_no` int(11) NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `total_no_of_package` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `metric_ton` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rev_no` int(11) NULL DEFAULT NULL,
  `rev_date` datetime(0) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of packing_list
-- ----------------------------

-- ----------------------------
-- Table structure for parent_item
-- ----------------------------
DROP TABLE IF EXISTS `parent_item`;
CREATE TABLE `parent_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_active` bit(1) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of parent_item
-- ----------------------------

-- ----------------------------
-- Table structure for part_type
-- ----------------------------
DROP TABLE IF EXISTS `part_type`;
CREATE TABLE `part_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of part_type
-- ----------------------------
INSERT INTO `part_type` VALUES (1, 'AS', 'As Shaft, Round Bar', '', '2020-11-29 01:24:48', NULL, b'1');
INSERT INTO `part_type` VALUES (2, 'ASSB', 'Square AS Shaft, AS Kotak', '', '2020-11-29 01:25:53', NULL, b'1');
INSERT INTO `part_type` VALUES (3, 'CIVIL', 'Material Sipil', '', '2020-11-29 01:26:04', NULL, b'1');
INSERT INTO `part_type` VALUES (4, 'CKPLATE', 'Checker Plate', '', '2020-11-29 01:27:02', NULL, b'1');
INSERT INTO `part_type` VALUES (5, 'CNP', 'Profile C', 'Profiler C', '2020-11-29 01:27:18', '2020-11-29 01:34:26', b'1');
INSERT INTO `part_type` VALUES (6, 'GM01', 'test', 'ss', '2020-12-03 00:22:34', NULL, b'1');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start_date` datetime(0) NULL DEFAULT NULL,
  `end_date` datetime(0) NULL DEFAULT NULL,
  `is_finished` bit(1) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  `marketing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, 1, 'project bersama', 'adsa', '                                                                                                                                        adsad                                                                                                                  ', '2020-11-30 00:00:00', '2020-11-30 00:00:00', b'0', '2020-11-30 14:11:25', '2020-12-01 16:34:41', b'1', NULL);
INSERT INTO `project` VALUES (2, 1, 'project', 'adsa', '                                  adsad                                ', '2020-11-30 00:00:00', '2020-11-30 00:00:00', b'0', '2020-11-30 14:43:00', '2020-12-01 16:34:41', b'1', NULL);
INSERT INTO `project` VALUES (3, 3, 'nyamuk', '', '                                                                  ', '2020-12-20 00:00:00', '2020-12-20 00:00:00', b'0', '2020-12-20 17:00:17', NULL, b'1', NULL);

-- ----------------------------
-- Table structure for project_contact
-- ----------------------------
DROP TABLE IF EXISTS `project_contact`;
CREATE TABLE `project_contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `handphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_contact
-- ----------------------------
INSERT INTO `project_contact` VALUES (1, 1, 'bola', '1412', '14124', '1212412', '2020-11-30 14:11:25', '2020-11-30 14:49:57', b'1');
INSERT INTO `project_contact` VALUES (2, 1, 'kacang', '124124', '1412', '12412', '2020-11-30 14:11:25', '2020-11-30 14:47:50', b'0');
INSERT INTO `project_contact` VALUES (3, 1, 'bola', '1412', '14124', '1212412', '2020-11-30 14:43:00', '2020-11-30 14:46:44', b'0');
INSERT INTO `project_contact` VALUES (4, 2, 'kacang', '124124', '1412', '12412', '2020-11-30 14:43:00', NULL, b'1');
INSERT INTO `project_contact` VALUES (5, 0, 'nambah', '', '', '', '2020-11-30 14:43:00', NULL, b'1');
INSERT INTO `project_contact` VALUES (6, 1, 'halo', '081415', 'mary@mail.to', '', '2020-11-30 14:49:57', '2020-12-01 16:45:51', b'1');
INSERT INTO `project_contact` VALUES (7, 0, 'bannn', '', '', '', '2020-12-20 17:00:17', NULL, b'1');

-- ----------------------------
-- Table structure for purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE `purchase_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_request_id` int(11) NULL DEFAULT NULL,
  `job_id` int(11) NULL DEFAULT NULL,
  `purchase_order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `deliver_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deliver_date` datetime(0) NULL DEFAULT NULL,
  `sup_id` int(11) NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `payment_term` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `percent_vat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of purchase_order
-- ----------------------------

-- ----------------------------
-- Table structure for purchase_request
-- ----------------------------
DROP TABLE IF EXISTS `purchase_request`;
CREATE TABLE `purchase_request`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `delivery_date` datetime(0) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of purchase_request
-- ----------------------------

-- ----------------------------
-- Table structure for purchase_request_detail
-- ----------------------------
DROP TABLE IF EXISTS `purchase_request_detail`;
CREATE TABLE `purchase_request_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NULL DEFAULT NULL,
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `item` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of purchase_request_detail
-- ----------------------------

-- ----------------------------
-- Table structure for quotation
-- ----------------------------
DROP TABLE IF EXISTS `quotation`;
CREATE TABLE `quotation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL,
  `project_id` int(11) NULL DEFAULT NULL,
  `pic_id` int(11) NULL DEFAULT NULL,
  `pic_handphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pic_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qn_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qn_date` date NULL DEFAULT NULL,
  `inquiry_reff` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rev_no` int(11) NULL DEFAULT NULL,
  `rev_date` date NULL DEFAULT NULL,
  `delivery_date` date NULL DEFAULT NULL,
  `delivery_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `before_vat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `vat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `construction_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `terms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lead_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `quotation_valid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `marketing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fabrication` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sandblasting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `painting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `asbuiltdrawing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `galvanished` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `erection` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `packing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ndt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `delivery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of quotation
-- ----------------------------
INSERT INTO `quotation` VALUES (1, 1, 1, 1, NULL, NULL, 'Repair', '0001/BMM/XII/2020', '2020-12-03', '', 0, '0000-00-00', '2020-12-03', '1', 'IDR', NULL, '10', '10', 's', '1', '10', NULL, '1', '1', '1', 'on progress', '', '', '', '', '', '', '', '', '', '', '', NULL, '2020-12-03 06:04:54', '2021-02-27 11:22:40', b'1');
INSERT INTO `quotation` VALUES (2, 3, 3, 7, NULL, NULL, 'Repair', '0002/BMM/XII/2020', '2020-12-20', '', 0, '0000-00-00', '2020-12-21', '', 'IDR', NULL, '10', '10', 'terms', '', '', NULL, '', '', '', 'on progress', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '2020-12-20 17:01:07', NULL, b'1');
INSERT INTO `quotation` VALUES (3, 3, 3, 7, NULL, NULL, 'Repair', '0003/BMM/XII/2020', '2020-12-20', '', 0, '0000-00-00', '2021-02-26', '', '', NULL, '10', '', 'terms', '', '4', NULL, '', '', '', 'on progress', '', '', '', '', '', '', '', '', '', '', '', NULL, '2020-12-20 17:07:45', '2021-02-27 11:23:07', b'1');

-- ----------------------------
-- Table structure for quotation_calc
-- ----------------------------
DROP TABLE IF EXISTS `quotation_calc`;
CREATE TABLE `quotation_calc`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NULL DEFAULT NULL,
  `total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `grand_summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rounding_discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `construction_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `grand_total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `grand_total_vat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of quotation_calc
-- ----------------------------
INSERT INTO `quotation_calc` VALUES (1, 1, NULL, 'IDR 21000', '2000', 'IDR 2100', '', 'IDR 23200', '2020-12-03 06:04:54', '2021-02-27 11:21:34', b'1');
INSERT INTO `quotation_calc` VALUES (2, 2, NULL, 'IDR 10,000', 'IDR 0', 'IDR 1,000', NULL, 'IDR 12,000', '2020-12-20 17:01:07', NULL, b'1');
INSERT INTO `quotation_calc` VALUES (3, 3, NULL, 'IDR 10,000', 'IDR 0', 'IDR 0', '', 'IDR 11,000', '2020-12-20 17:07:45', '2021-02-27 11:23:07', b'1');

-- ----------------------------
-- Table structure for quotation_detail
-- ----------------------------
DROP TABLE IF EXISTS `quotation_detail`;
CREATE TABLE `quotation_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `completed_qty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weight` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `internal_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of quotation_detail
-- ----------------------------
INSERT INTO `quotation_detail` VALUES (1, 1, '', '2', NULL, 'BTG', '10000.00', NULL, '20000.00', NULL, NULL, '2020-12-03 06:04:54', '2020-12-09 12:18:12', b'0');
INSERT INTO `quotation_detail` VALUES (2, 1, '', '2', NULL, 'BTG', '10000.00', NULL, '20000.00', NULL, NULL, '2020-12-03 18:29:35', '2020-12-09 12:18:12', b'0');
INSERT INTO `quotation_detail` VALUES (3, 1, '', '2', NULL, 'BTG', '10000.00', NULL, '20000.00', NULL, NULL, '2020-12-03 18:31:31', '2020-12-09 12:56:36', b'0');
INSERT INTO `quotation_detail` VALUES (4, 1, '', '2', NULL, 'BTG', '10000.00', NULL, '20000.00', NULL, NULL, '2020-12-09 12:56:36', '2020-12-09 14:53:24', b'0');
INSERT INTO `quotation_detail` VALUES (5, 1, '', '2', NULL, 'BTG', '10000.00', NULL, '20000.00', NULL, NULL, '2020-12-09 14:53:24', '2020-12-09 14:55:40', b'0');
INSERT INTO `quotation_detail` VALUES (6, 1, '', '2', NULL, 'BTG', '10000.00', NULL, '20000.00', NULL, NULL, '2020-12-09 14:55:40', '2020-12-09 14:59:54', b'0');
INSERT INTO `quotation_detail` VALUES (7, 1, '', '2', NULL, 'BTG', '10000.00', NULL, '20000.00', NULL, NULL, '2020-12-09 14:59:54', '2021-02-27 11:21:34', b'0');
INSERT INTO `quotation_detail` VALUES (8, 2, '', '1', NULL, 'BTG', '10.00', NULL, '10.00', NULL, NULL, '2020-12-20 17:01:07', NULL, b'1');
INSERT INTO `quotation_detail` VALUES (9, 3, '', '2', NULL, 'BTG', '5.00', NULL, '10.00', NULL, NULL, '2020-12-20 17:07:45', '2020-12-20 17:09:26', b'0');
INSERT INTO `quotation_detail` VALUES (10, 3, '', '2', NULL, 'BTG', '5,000', NULL, '10,000', NULL, NULL, '2020-12-20 17:09:26', '2020-12-20 17:16:18', b'0');
INSERT INTO `quotation_detail` VALUES (11, 3, '', '2', NULL, 'BTG', '5,000', NULL, '10,000', NULL, NULL, '2020-12-20 17:16:18', '2021-02-27 11:23:07', b'0');
INSERT INTO `quotation_detail` VALUES (12, 1, '', '2', NULL, 'BTG', '10,000.00', NULL, '20,000.00', NULL, NULL, '2021-02-27 11:21:34', '2021-02-27 11:22:06', b'0');
INSERT INTO `quotation_detail` VALUES (13, 1, '', '2', NULL, 'BTG', '10,000.00', NULL, '20,000.00', NULL, NULL, '2021-02-27 11:22:06', '2021-02-27 11:22:40', b'0');
INSERT INTO `quotation_detail` VALUES (14, 1, '', '2', NULL, 'BTG', '10,000.00', NULL, '20,000.00', NULL, NULL, '2021-02-27 11:22:40', NULL, b'1');
INSERT INTO `quotation_detail` VALUES (15, 3, '', '2', NULL, 'BTG', '5,000', NULL, '10,000', NULL, NULL, '2021-02-27 11:23:07', NULL, b'1');

-- ----------------------------
-- Table structure for request_consumable
-- ----------------------------
DROP TABLE IF EXISTS `request_consumable`;
CREATE TABLE `request_consumable`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `up` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of request_consumable
-- ----------------------------

-- ----------------------------
-- Table structure for request_consumable_detail
-- ----------------------------
DROP TABLE IF EXISTS `request_consumable_detail`;
CREATE TABLE `request_consumable_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_consumable_id` int(11) NULL DEFAULT NULL,
  `consumable_id` int(11) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of request_consumable_detail
-- ----------------------------

-- ----------------------------
-- Table structure for sales_order_type
-- ----------------------------
DROP TABLE IF EXISTS `sales_order_type`;
CREATE TABLE `sales_order_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sales_order_type
-- ----------------------------
INSERT INTO `sales_order_type` VALUES (1, 's3', 's', '2020-11-29 23:16:42', '2020-11-29 23:16:54', b'0');
INSERT INTO `sales_order_type` VALUES (2, 's2', 's', '2020-11-29 23:16:46', NULL, b'1');

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `period_start` datetime(0) NULL DEFAULT NULL,
  `period_end` datetime(0) NULL DEFAULT NULL,
  `rev_date` datetime(0) NULL DEFAULT NULL,
  `rev_ms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `current_phase` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT NULL,
  `modified_date` datetime(0) NULL DEFAULT NULL,
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of schedule
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_detail
-- ----------------------------
DROP TABLE IF EXISTS `schedule_detail`;
CREATE TABLE `schedule_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NULL DEFAULT NULL,
  `process` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sub_process` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weight` double NULL DEFAULT NULL,
  `days` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weeks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start_date` datetime(0) NULL DEFAULT NULL,
  `end_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of schedule_detail
-- ----------------------------

-- ----------------------------
-- Table structure for scopeofwork
-- ----------------------------
DROP TABLE IF EXISTS `scopeofwork`;
CREATE TABLE `scopeofwork`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kickoff_meeting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scopeofwork
-- ----------------------------
INSERT INTO `scopeofwork` VALUES (1, 'MOM', 'test2', 'test', '1', '2020-11-30 01:59:28', '2020-11-30 02:00:27', b'0');

-- ----------------------------
-- Table structure for spb
-- ----------------------------
DROP TABLE IF EXISTS `spb`;
CREATE TABLE `spb`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spb_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `receiver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spb
-- ----------------------------

-- ----------------------------
-- Table structure for spb_detail
-- ----------------------------
DROP TABLE IF EXISTS `spb_detail`;
CREATE TABLE `spb_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spb_id` int(11) NULL DEFAULT NULL,
  `po` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `item_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qty_po` int(11) NULL DEFAULT NULL,
  `qty_spb` int(11) NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `eta` datetime(0) NULL DEFAULT NULL,
  `actual_date` datetime(0) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spb_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tr_menu_access
-- ----------------------------
DROP TABLE IF EXISTS `tr_menu_access`;
CREATE TABLE `tr_menu_access`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NULL DEFAULT NULL,
  `sub_menu_id` int(11) NULL DEFAULT NULL,
  `create` bit(1) NULL DEFAULT NULL,
  `edit` bit(1) NULL DEFAULT NULL,
  `delete` bit(1) NULL DEFAULT NULL,
  `view` bit(1) NULL DEFAULT NULL,
  `approve` bit(1) NULL DEFAULT NULL,
  `is_active` bit(1) NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tr_menu_access
-- ----------------------------
INSERT INTO `tr_menu_access` VALUES (1, 2, 1, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (2, 2, 2, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (3, 2, 3, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (4, 2, 4, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (5, 2, 5, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (6, 2, 6, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (7, 2, 7, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (8, 2, 8, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (9, 2, 9, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (10, 2, 10, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (11, 2, 11, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (12, 2, 12, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (13, 2, 13, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (14, 2, 14, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (15, 2, 16, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (16, 2, 17, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (17, 2, 18, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (18, 2, 19, b'0', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (19, 2, 21, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (20, 2, 22, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (21, 2, 24, b'0', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (22, 2, 26, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (23, 2, 27, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (24, 2, 29, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (25, 2, 32, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (26, 2, 33, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (27, 2, 35, b'1', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (28, 2, 36, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (29, 2, 39, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (30, 2, 40, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (31, 2, 41, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (32, 2, 45, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (33, 2, 47, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (34, 2, 48, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (35, 2, 49, b'0', b'1', b'1', b'1', b'1', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (36, 2, 51, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (37, 2, 53, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (38, 2, 55, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (39, 2, 56, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (40, 2, 57, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (41, 2, 59, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (42, 2, 60, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (43, 2, 62, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (44, 2, 64, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (45, 2, 66, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (46, 2, 68, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (47, 2, 69, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (48, 2, 70, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (49, 2, 71, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (50, 2, 74, b'0', b'0', b'0', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (51, 2, 75, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (52, 2, 76, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (53, 2, 80, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (54, 2, 81, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (55, 2, 82, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (56, 2, 84, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (57, 2, 86, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (58, 2, 87, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (59, 2, 88, b'0', b'1', b'1', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (60, 2, 15, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (61, 2, 20, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (62, 2, 23, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (63, 2, 25, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (64, 2, 28, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (65, 2, 30, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (66, 2, 31, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (67, 2, 34, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (68, 2, 37, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (69, 2, 42, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (70, 2, 46, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (71, 2, 50, b'1', b'0', b'0', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (72, 2, 52, b'1', b'0', b'0', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (73, 2, 54, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (74, 2, 58, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (75, 2, 61, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (76, 2, 63, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (77, 2, 65, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (78, 2, 67, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (79, 2, 72, b'1', b'0', b'0', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (80, 2, 73, b'1', b'0', b'0', b'1', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (81, 2, 77, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (82, 2, 78, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (83, 2, 79, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (84, 2, 83, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (85, 2, 85, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (86, 2, 89, b'1', b'0', b'0', b'0', b'0', b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (87, 4, 1, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (88, 4, 2, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (89, 4, 3, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (90, 4, 4, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (91, 4, 5, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (92, 4, 6, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (93, 4, 7, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (94, 4, 8, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (95, 4, 9, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (96, 4, 10, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (97, 4, 11, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (98, 4, 12, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (99, 4, 13, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (100, 4, 14, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (101, 4, 16, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (102, 4, 17, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (103, 4, 18, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (104, 4, 19, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (105, 4, 21, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (106, 4, 22, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (107, 4, 24, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (108, 4, 26, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (109, 4, 27, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (110, 4, 29, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (111, 4, 32, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (112, 4, 33, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (113, 4, 35, b'1', b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (114, 4, 36, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (115, 4, 39, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (116, 4, 40, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (117, 4, 41, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (118, 4, 45, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (119, 4, 47, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (120, 4, 48, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (121, 4, 49, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (122, 4, 50, b'1', NULL, NULL, b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (123, 4, 51, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (124, 4, 52, b'1', NULL, NULL, b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (125, 4, 53, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (126, 4, 55, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (127, 4, 56, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (128, 4, 57, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (129, 4, 59, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (130, 4, 60, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (131, 4, 62, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (132, 4, 64, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (133, 4, 66, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (134, 4, 68, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (135, 4, 69, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (136, 4, 70, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (137, 4, 71, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (138, 4, 72, b'1', NULL, NULL, b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (139, 4, 73, b'1', NULL, NULL, b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (140, 4, 74, NULL, NULL, NULL, b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (141, 4, 75, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (142, 4, 76, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (143, 4, 80, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (144, 4, 81, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (145, 4, 82, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (146, 4, 84, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (147, 4, 86, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (148, 4, 87, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (149, 4, 88, NULL, b'1', b'1', b'1', NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (150, 4, 15, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (151, 4, 20, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (152, 4, 23, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (153, 4, 25, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (154, 4, 28, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (155, 4, 30, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (156, 4, 31, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (157, 4, 34, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (158, 4, 37, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (159, 4, 42, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (160, 4, 46, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (161, 4, 54, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (162, 4, 58, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (163, 4, 61, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (164, 4, 63, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (165, 4, 65, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (166, 4, 67, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (167, 4, 77, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (168, 4, 78, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (169, 4, 79, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (170, 4, 83, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (171, 4, 85, b'1', NULL, NULL, NULL, NULL, b'1', NULL);
INSERT INTO `tr_menu_access` VALUES (172, 4, 89, b'1', NULL, NULL, NULL, NULL, b'1', NULL);

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `applied_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rev_no` int(11) NULL DEFAULT NULL,
  `rev_date` datetime(0) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modfied_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaction
-- ----------------------------

-- ----------------------------
-- Table structure for transaction_detail
-- ----------------------------
DROP TABLE IF EXISTS `transaction_detail`;
CREATE TABLE `transaction_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NULL DEFAULT NULL,
  `equipment_id` int(11) NULL DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `inv_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pcs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaction_detail
-- ----------------------------

-- ----------------------------
-- Table structure for unit_of_measures
-- ----------------------------
DROP TABLE IF EXISTS `unit_of_measures`;
CREATE TABLE `unit_of_measures`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of unit_of_measures
-- ----------------------------
INSERT INTO `unit_of_measures` VALUES (1, 'BTG', 'Batang', '2020-11-29 01:39:25', NULL, '1');
INSERT INTO `unit_of_measures` VALUES (2, 'CAN', 'can', '2020-11-29 01:40:27', NULL, '1');
INSERT INTO `unit_of_measures` VALUES (3, 'GR', 'grams', '2020-11-29 01:40:36', NULL, '1');
INSERT INTO `unit_of_measures` VALUES (4, 'KG', 'kilograms', '2020-11-29 01:40:46', NULL, '1');
INSERT INTO `unit_of_measures` VALUES (5, 'LMB', 'lembar', '2020-11-29 01:40:59', NULL, '1');
INSERT INTO `unit_of_measures` VALUES (6, 'LTR', 'liter', '2020-11-29 01:41:16', NULL, '1');
INSERT INTO `unit_of_measures` VALUES (7, 'M', 'Meter', '2020-11-29 01:41:28', '2020-11-29 01:41:46', '1');

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `position` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `group_id` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `company` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `default_module` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sales_person` bit(1) NULL DEFAULT NULL,
  `is_active` bit(1) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_account
-- ----------------------------
INSERT INTO `user_account` VALUES (1, '2020', 'admin', 'admin', 'administrator', 'admin@mail.co', '21232f297a57a5a743894a0e4a801fc3', '2', '1', '1', 'ADM', NULL, b'1', '2020-11-27 02:10:58', '2020-12-05 20:09:01');
INSERT INTO `user_account` VALUES (2, '20122233', 'test', 'test', 'test', 'test@mail.com', '0c909a141f1f2c0a1cb602b0b2d7d050', '2', '1', '1', 'ADM', b'1', b'1', '2020-11-27 03:33:57', '2020-11-27 13:27:13');
INSERT INTO `user_account` VALUES (3, '', 'Admin PPIC', 'ppic', '', 'ppic@buanamasa.com', '9e9d48c4c811be0741cac028b1af47d4', '7', '', '', 'PPC', b'0', b'0', '2020-12-04 08:52:23', '2020-12-04 09:06:57');
INSERT INTO `user_account` VALUES (8, '', 'Henry', 'henry', '', 'henry@buanamasa.com', 'f9d540d4f6e1269bd14d2d4f39da72ca', '2', '', 'BMM', 'ADM', b'0', b'1', '2020-12-04 09:05:58', '2020-12-04 10:10:39');
INSERT INTO `user_account` VALUES (9, '', 'Amo', 'Engineering', '', 'amo@buanamasa.com', 'ad0eb4646c67d80adfe214494a3cebad', '4', '', 'BMM', 'ENG', b'0', b'1', '2020-12-04 09:06:54', '2020-12-04 09:08:06');
INSERT INTO `user_account` VALUES (10, '', 'Marketing', 'adminmkt', '', 'admin@buanamasa.com', 'ca2ef7e0e5d0777b7fe718a20abc2592', '5', '', 'BMM', 'MKT', b'0', b'1', '2020-12-04 09:07:55', NULL);
INSERT INTO `user_account` VALUES (11, '', 'Edy', 'edy', '', 'edy@buanamasa.com', '21940a6ca07fd2d640215f599ebd456c', '5', '', 'BMM', 'MKT', b'1', b'1', '2020-12-04 09:10:39', '2020-12-04 09:11:56');
INSERT INTO `user_account` VALUES (12, '', 'Admin PPIC', 'ppic', '', 'ppic@buanamasa.com', '6500263ef3f085afbcdfd93e9b7f622d', '7', '', 'BMM', 'PPC', b'0', b'1', '2020-12-04 09:11:50', '2020-12-04 09:36:10');
INSERT INTO `user_account` VALUES (13, '', 'martin', 'martin', 'dev', 'test', '925d7518fc597af0e43f5606f9a51512', '2', '', '', 'ADM', b'0', b'1', '2020-12-04 09:12:56', NULL);
INSERT INTO `user_account` VALUES (14, '', 'Wiwilee', 'wiwilee', '', 'wiwilee@buanamasa.com', '90efa272e97f24a4db99407e8603f687', '5', '', 'BMM', 'MKT', b'1', b'1', '2020-12-04 09:23:09', NULL);
INSERT INTO `user_account` VALUES (15, '', 'Production', 'production', '', 'production@buanamasa.com', 'fd89784e59c72499525556f80289b2c7', '8', '', 'BMM', 'PROD', b'0', b'1', '2020-12-04 09:24:18', NULL);
INSERT INTO `user_account` VALUES (16, '', 'Engineering', 'engineering', '', 'engineering@buanamasa.com', '5d554bc5f3d2cd182cdd0952b1fb87ca', '4', '', 'BMM', 'ENG', b'0', b'1', '2020-12-04 09:24:51', NULL);
INSERT INTO `user_account` VALUES (17, '', 'Verry', 'verry', '', 'verry@buanamasa.com', 'eb871e9999c25e97f6ec37672450cd0b', '5', '', 'BMM', 'MKT', b'1', b'1', '2020-12-04 09:28:31', NULL);
INSERT INTO `user_account` VALUES (18, '', 'Ramina', 'ramina', '', 'ramina@buanamasa.com', '644146ee465c5fe67cbe7aa9086a7028', '8', '', 'BMM', 'PROD', b'0', b'1', '2020-12-04 09:29:14', NULL);
INSERT INTO `user_account` VALUES (19, '', 'Slamet', 'slamet', '', 'slamet@buanamasa.com', 'c5a42d9667c760e1b7c064e25536e570', '8', '', 'BMM', 'PROD', b'0', b'1', '2020-12-04 09:29:44', NULL);
INSERT INTO `user_account` VALUES (20, '', 'Junanto', 'toto', '', 'junanto@buanamasa.com', 'f71dbe52628a3f83a77ab494817525c6', '6', '', 'BMM', 'PUR', b'0', b'1', '2020-12-04 09:30:30', NULL);
INSERT INTO `user_account` VALUES (21, '', 'Sustiono', 'sustiono', '', 'sustiono@buanamasa.com', '4838005eb319369cf9a2b0c86579bc03', '5', '', 'BMM', 'MKT', b'0', b'1', '2020-12-04 09:31:11', NULL);
INSERT INTO `user_account` VALUES (22, '', 'Galih', 'galih', '', 'galih@buanamasa.com', '027dc74f0bbf09a61a36ec7f0d9e08ca', '5', '', 'BMM', 'MKT', b'1', b'1', '2020-12-04 09:31:37', NULL);
INSERT INTO `user_account` VALUES (23, '', 'Admin Purchasing', 'admpcg', '', 'admpcg@buanamasa.com', '8ee5f759d0bbff8100236325fee85425', '6', '', 'BMM', 'PUR', b'0', b'1', '2020-12-04 09:32:26', NULL);
INSERT INTO `user_account` VALUES (24, '', 'Admin Maintenance', 'admmt', '', 'admmt@buanamasa.com', 'a961f3ca97adfd201e51755f442a573b', '12', '', 'BMM', 'MNT', b'0', b'1', '2020-12-04 09:32:58', NULL);
INSERT INTO `user_account` VALUES (25, '', 'QCWS1', 'qcws1', '', 'qcws1@buanamasa.com', '66edd5a16091afa2760f4414db8bda41', '10', '', 'BMM', 'QC', b'0', b'1', '2020-12-04 09:33:11', '2020-12-04 09:34:09');
INSERT INTO `user_account` VALUES (26, '', 'QCWS2', 'qcws2', '', 'qcws2@buanamasa.com', '0b981e3948ad510735216120db577faa', '10', '', 'BMM', 'QC', b'0', b'1', '2020-12-04 09:34:42', NULL);
INSERT INTO `user_account` VALUES (27, '', 'Untung', 'untung', '', 'untung@buanamasa.com', '71e58dd33998440f0bde00af1bfbf741', '9', '', 'BMM', 'LOG', b'0', b'1', '2020-12-04 09:36:44', NULL);
INSERT INTO `user_account` VALUES (28, '', 'Eka', 'eka', '', 'eka@buanamasa.com', '79ee82b17dfb837b1be94a6827fa395a', '12', '', 'BMM', 'MNT', b'0', b'1', '2020-12-04 09:37:17', NULL);

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_active` bit(1) NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES (1, 'TRIAL', 'test', 'staff', b'0', '2020-11-27 01:50:57', '2020-11-28 15:00:39');
INSERT INTO `user_group` VALUES (2, 'ADM', 'Administrator', '1', b'1', '2020-11-27 01:51:28', '2020-11-27 01:52:05');
INSERT INTO `user_group` VALUES (3, 'DEV', 'Developer', '1', b'1', '2020-11-27 01:51:39', '2020-11-27 01:52:01');
INSERT INTO `user_group` VALUES (4, 'ENG', 'Engineering', '1', b'1', '2020-11-27 01:51:51', '2020-11-27 01:51:54');
INSERT INTO `user_group` VALUES (5, 'MKT', 'Marketing', '1', b'1', '2020-11-27 01:52:15', NULL);
INSERT INTO `user_group` VALUES (6, 'PUR', 'Purchasing', '1', b'1', '2020-11-27 01:52:23', NULL);
INSERT INTO `user_group` VALUES (7, 'PPIC', 'PPIC', '1', b'1', '2020-11-27 01:52:32', NULL);
INSERT INTO `user_group` VALUES (8, 'PROD', 'Production', '1', b'1', '2020-11-27 01:52:43', NULL);
INSERT INTO `user_group` VALUES (9, 'LOG', 'Logistic', '1', b'1', '2020-11-27 01:52:54', NULL);
INSERT INTO `user_group` VALUES (10, 'QC', 'Quality Control', '1', b'1', '2020-11-27 01:53:03', '2020-11-27 01:53:06');
INSERT INTO `user_group` VALUES (11, 'FIN', 'Finance', '1', b'1', '2020-11-27 01:53:17', NULL);
INSERT INTO `user_group` VALUES (12, 'MNT', 'Maintenance', '1', b'1', '2020-11-27 01:53:26', NULL);

-- ----------------------------
-- Table structure for user_group_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_group_detail`;
CREATE TABLE `user_group_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NULL DEFAULT NULL,
  `document_access` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL,
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_group_detail
-- ----------------------------
INSERT INTO `user_group_detail` VALUES (17, 1, 'Drawing', '2020-11-27 19:58:58', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (18, 2, 'Drawing', '2020-11-27 19:59:08', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (19, 2, 'Bill of Quantity', '2020-11-27 19:59:08', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (20, 2, 'Commercial Sheet', '2020-11-27 19:59:08', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (21, 2, 'Schedule', '2020-11-27 19:59:08', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (22, 2, 'MPK', '2020-11-27 19:59:08', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (23, 2, 'Inspection Test and Plan', '2020-11-27 19:59:08', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (24, 2, 'Quotation', '2020-11-27 19:59:08', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (25, 2, 'Packing List', '2020-11-27 19:59:08', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (26, 2, 'Delivery Order', '2020-11-27 19:59:08', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (27, 2, 'BSK', '2020-11-27 19:59:08', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (28, 3, 'Commercial Sheet', '2020-11-27 19:59:15', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (29, 3, 'Schedule', '2020-11-27 19:59:15', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (30, 4, 'Schedule', '2020-11-27 19:59:24', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (31, 4, 'MPK', '2020-11-27 19:59:24', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (32, 4, 'Quotation', '2020-11-27 19:59:24', NULL, b'1');
INSERT INTO `user_group_detail` VALUES (33, 4, 'Inspection Test and Plan', '2020-11-28 14:52:57', NULL, b'1');

-- ----------------------------
-- Table structure for vendor_cs
-- ----------------------------
DROP TABLE IF EXISTS `vendor_cs`;
CREATE TABLE `vendor_cs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `handphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vendor_cs
-- ----------------------------
INSERT INTO `vendor_cs` VALUES (1, 1, 'martin', '9173491', '9412947912', '0281491294', '197471274', '2020-12-02 20:53:11', NULL, b'1');
INSERT INTO `vendor_cs` VALUES (2, 1, 'gandhi', '98124912', '7481274', '1974129174', '17471284128', '2020-12-02 20:53:11', NULL, b'1');

-- ----------------------------
-- Table structure for yearly_report
-- ----------------------------
DROP TABLE IF EXISTS `yearly_report`;
CREATE TABLE `yearly_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `feb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `apr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `may` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `june` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `july` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `august` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sept` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oct` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nov` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_date` datetime(0) NULL DEFAULT current_timestamp(0),
  `modified_date` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `is_active` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yearly_report
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
