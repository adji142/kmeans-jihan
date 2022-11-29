/*
 Navicat Premium Data Transfer

 Source Server         : AISServer
 Source Server Type    : MySQL
 Source Server Version : 100240
 Source Host           : localhost:3306
 Source Schema         : kmeans

 Target Server Type    : MySQL
 Target Server Version : 100240
 File Encoding         : 65001

 Date: 29/11/2022 20:08:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ico` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menusubmenu` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `multilevel` bit(1) NULL DEFAULT NULL,
  `separator` bit(1) NULL DEFAULT NULL,
  `order` int(255) NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `AllowMobile` bit(1) NULL DEFAULT NULL,
  `MobileRoute` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `MobileLogo` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (2, 'Daftar Variable', 'data', 'fa-pencil-square-o', '0', b'0', b'0', 2, b'1', NULL, NULL, NULL);
INSERT INTO `permission` VALUES (3, 'Daftar Centroid Awal', 'centroidawal', 'fa-pencil-square-o', '0', b'0', b'0', 3, b'1', NULL, NULL, NULL);
INSERT INTO `permission` VALUES (5, 'Perhitungan', 'proses', 'fa-spinner', '0', b'0', b'0', 6, b'1', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for permissionrole
-- ----------------------------
DROP TABLE IF EXISTS `permissionrole`;
CREATE TABLE `permissionrole`  (
  `roleid` int(11) NOT NULL,
  `permissionid` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissionrole
-- ----------------------------
INSERT INTO `permissionrole` VALUES (1, 1);
INSERT INTO `permissionrole` VALUES (1, 2);
INSERT INTO `permissionrole` VALUES (1, 3);
INSERT INTO `permissionrole` VALUES (1, 4);
INSERT INTO `permissionrole` VALUES (1, 5);
INSERT INTO `permissionrole` VALUES (2, 2);
INSERT INTO `permissionrole` VALUES (1, 6);
INSERT INTO `permissionrole` VALUES (2, 6);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Admin');
INSERT INTO `roles` VALUES (2, 'Operator');

-- ----------------------------
-- Table structure for tcentroid
-- ----------------------------
DROP TABLE IF EXISTS `tcentroid`;
CREATE TABLE `tcentroid`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `KodeData` int(255) NOT NULL,
  `Centroid` int(11) NOT NULL,
  `LuasPanen` double(16, 4) NOT NULL,
  `Produksi` double(16, 4) NOT NULL,
  `Other` double(16, 4) NOT NULL,
  `Kelompok` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tcentroid
-- ----------------------------
INSERT INTO `tcentroid` VALUES (1, 16, 1, 0.0000, 0.0000, 0.0000, 'MANGGA');
INSERT INTO `tcentroid` VALUES (2, 17, 2, 0.6538, 0.6307, 0.0000, 'MANGGA');
INSERT INTO `tcentroid` VALUES (3, 19, 3, 1.0000, 1.0000, 0.0000, 'MANGGA');
INSERT INTO `tcentroid` VALUES (4, 16, 1, 0.0000, 0.0000, 0.0000, 'PEPAYA');
INSERT INTO `tcentroid` VALUES (5, 20, 2, 0.5606, 0.7536, 0.0000, 'PEPAYA');
INSERT INTO `tcentroid` VALUES (6, 9, 3, 1.0000, 0.9931, 0.0000, 'PEPAYA');

-- ----------------------------
-- Table structure for tdata
-- ----------------------------
DROP TABLE IF EXISTS `tdata`;
CREATE TABLE `tdata`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Alamat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `LuasPanen` double(16, 4) NOT NULL,
  `Produksi` double(16, 4) NOT NULL,
  `Other` double(16, 4) NULL DEFAULT NULL,
  `Koordinat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Kelompok` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tdata
-- ----------------------------
INSERT INTO `tdata` VALUES (1, 'Kalijambe', 'Kec. Kalijambe', 17000.0000, 9350.0000, 0.0000, '-7.432519,110.7811837', 'MANGGA');
INSERT INTO `tdata` VALUES (2, 'Plupuh', 'Kec. Plupuh', 2500.0000, 1500.0000, 0.0000, '-7.4461975,110.8612953', 'MANGGA');
INSERT INTO `tdata` VALUES (3, 'Masaran', 'Kec. Masaran', 0.0000, 0.0000, 0.0000, '-7.4820965,110.9074658', 'MANGGA');
INSERT INTO `tdata` VALUES (4, 'Kedawung', 'Kec. Kedawung', 512.0000, 205.0000, 0.0000, '-7.5003971,110.9938493', 'MANGGA');
INSERT INTO `tdata` VALUES (5, 'Sambirejo', 'Kec. Sambirejo', 546.0000, 115.0000, 0.0000, '-7.495212,111.0769887', 'MANGGA');
INSERT INTO `tdata` VALUES (6, 'Gondang', 'Kec. Gondang', 8300.0000, 2075.0000, 0.0000, '-7.4308786,111.0686018', 'MANGGA');
INSERT INTO `tdata` VALUES (7, 'Sambung Macan', 'Kec. Sambung Macan', 1771.0000, 858.0000, 0.0000, '-7.369187,111.0667234', 'MANGGA');
INSERT INTO `tdata` VALUES (8, 'Ngrampal', 'Kec. Ngrampal', 6091.0000, 3009.0000, 0.0000, '-7.3928042,110.9760989', 'MANGGA');
INSERT INTO `tdata` VALUES (9, 'Karangmalang', 'Kec. Karangmalang', 225.0000, 117.0000, 0.0000, '-7.4568665,110.9850802', 'MANGGA');
INSERT INTO `tdata` VALUES (10, 'Sragen', 'Kec. Sragen', 12000.0000, 3266.0000, 0.0000, '-7.3988571,110.9846828', 'MANGGA');
INSERT INTO `tdata` VALUES (11, 'Sidoharjo', 'Kec. Sidoharjo', 3106.0000, 2329.0000, 0.0000, '-7.419204,110.9272203', 'MANGGA');
INSERT INTO `tdata` VALUES (12, 'Tanon', 'Kec. Tanon', 23249.0000, 5823.0000, 0.0000, '-7.3825035,110.8879453', 'MANGGA');
INSERT INTO `tdata` VALUES (13, 'Gemolong', 'Kec. Gemolong', 120.0000, 78.0000, 0.0000, '-7.3944436,110.8033602', 'MANGGA');
INSERT INTO `tdata` VALUES (14, 'Miri', 'Kec. Miri', 475.0000, 369.0000, 0.0000, '-7.3339323,110.7441913', 'MANGGA');
INSERT INTO `tdata` VALUES (15, 'Sumberlawang', 'Kec. Sumberlawang', 13008.0000, 4585.0000, 0.0000, '-7.3162893,110.7945389', 'MANGGA');
INSERT INTO `tdata` VALUES (16, 'Mondokan', 'Kec. Mondokan', 29750.0000, 56348.0000, 0.0000, '-7.319217,110.8934952', 'MANGGA');
INSERT INTO `tdata` VALUES (17, 'Sukodono', 'Kec. Sukodono', 10300.0000, 20810.0000, 0.0000, '-7.3276994,110.9077389', 'MANGGA');
INSERT INTO `tdata` VALUES (18, 'Gesi', 'Kec. Gesi', 1890.0000, 378.0000, 0.0000, '-7.3308435,110.9724852', 'MANGGA');
INSERT INTO `tdata` VALUES (19, 'Tangen', 'Kec. Tangen', 2607.0000, 1470.0000, 0.0000, '-7.2996346,111.0227382', 'MANGGA');
INSERT INTO `tdata` VALUES (20, 'Jenar', 'Kec. Jenar', 3623.0000, 2466.0000, 0.0000, '-7.3027824,111.0372809', 'MANGGA');
INSERT INTO `tdata` VALUES (21, 'Kalijambe', 'Kec. Kalijambe', 635.0000, 242.0000, 0.0000, '-7.432519,110.7811837', 'PEPAYA');
INSERT INTO `tdata` VALUES (22, 'Plupuh', 'Kec. Plupuh', 425.0000, 560.0000, 0.0000, '-7.4461975,110.8612953', 'PEPAYA');
INSERT INTO `tdata` VALUES (23, 'Masaran', 'Kec. Masaran', 380.0000, 80.0000, 0.0000, '-7.4820965,110.9074658', 'PEPAYA');
INSERT INTO `tdata` VALUES (24, 'Kedawung', 'Kec. Kedawung', 943.0000, 389.0000, 0.0000, '-7.5003971,110.9938493', 'PEPAYA');
INSERT INTO `tdata` VALUES (25, 'Sambirejo', 'Kec. Sambirejo', 90.0000, 30.0000, 0.0000, '-7.495212,111.0769887', 'PEPAYA');
INSERT INTO `tdata` VALUES (26, 'Gondang', 'Kec. Gondang', 308.0000, 154.0000, 0.0000, '-7.4308786,111.0686018', 'PEPAYA');
INSERT INTO `tdata` VALUES (27, 'Sambung Macan', 'Kec. Sambung Macan', 3777.0000, 1872.0000, 0.0000, '-7.369187,111.0667234', 'PEPAYA');
INSERT INTO `tdata` VALUES (28, 'Ngrampal', 'Kec. Ngrampal', 2062.0000, 1107.0000, 0.0000, '-7.3928042,110.9760989', 'PEPAYA');
INSERT INTO `tdata` VALUES (29, 'Karangmalang', 'Kec. Karangmalang', 45.0000, 20.0000, 0.0000, '-7.4568665,110.9850802', 'PEPAYA');
INSERT INTO `tdata` VALUES (30, 'Sragen', 'Kec. Sragen', 65.0000, 21.0000, 0.0000, '-7.3988571,110.9846828', 'PEPAYA');
INSERT INTO `tdata` VALUES (31, 'Sidoharjo', 'Kec. Sidoharjo', 550.0000, 434.0000, 0.0000, '-7.419204,110.9272203', 'PEPAYA');
INSERT INTO `tdata` VALUES (32, 'Tanon', 'Kec. Tanon', 5948.0000, 3419.0000, 0.0000, '-7.3825035,110.8879453', 'PEPAYA');
INSERT INTO `tdata` VALUES (33, 'Gemolong', 'Kec. Gemolong', 60.0000, 15.0000, 0.0000, '-7.3944436,110.8033602', 'PEPAYA');
INSERT INTO `tdata` VALUES (34, 'Miri', 'Kec. Miri', 4100.0000, 1727.0000, 0.0000, '-7.3339323,110.7441913', 'PEPAYA');
INSERT INTO `tdata` VALUES (35, 'Sumberlawang', 'Kec. Sumberlawang', 6135.0000, 2484.0000, 0.0000, '-7.3162893,110.7945389', 'PEPAYA');
INSERT INTO `tdata` VALUES (36, 'Mondokan', 'Kec. Mondokan', 7250.0000, 8270.0000, 0.0000, '-7.319217,110.8934952', 'PEPAYA');
INSERT INTO `tdata` VALUES (37, 'Sukodono', 'Kec. Sukodono', 765.0000, 187.0000, 0.0000, '-7.3276994,110.9077389', 'PEPAYA');
INSERT INTO `tdata` VALUES (38, 'Gesi', 'Kec. Gesi', 1200.0000, 136.0000, 0.0000, '-7.3308435,110.9724852', 'PEPAYA');
INSERT INTO `tdata` VALUES (39, 'Tangen', 'Kec. Tangen', 950.0000, 346.0000, 0.0000, '-7.2996346,111.0227382', 'PEPAYA');
INSERT INTO `tdata` VALUES (40, 'Jenar', 'Kec. Jenar', 3211.0000, 1798.0000, 0.0000, '-7.3027824,111.0372809', 'PEPAYA');

-- ----------------------------
-- Table structure for tdata_copy1_copy1
-- ----------------------------
DROP TABLE IF EXISTS `tdata_copy1_copy1`;
CREATE TABLE `tdata_copy1_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Alamat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `LuasPanen` double(16, 4) NOT NULL,
  `Produksi` double(16, 4) NOT NULL,
  `xother` double(16, 4) NULL DEFAULT NULL,
  `Koordinat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `TahunPanen` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tdata_copy1_copy1
-- ----------------------------
INSERT INTO `tdata_copy1_copy1` VALUES (1, 'Kalijambe', 'Kecamatan Kalijambe, Sragen Regency, Central Java, Indonesia', 4255.0000, 26536.0000, 0.0000, '-7.4354026,110.8195292', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (2, 'Plupuh', 'Kecamatan Plupuh, Sragen Regency, Central Java, Indonesia', 6409.0000, 39830.0000, 0.0000, '-7.4319067,110.8910556', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (3, 'Masaran', 'Kecamatan Masaran, Sragen Regency, Central Java, Indonesia', 7794.0000, 52697.0000, 0.0000, '-7.470387199999999,110.9387418', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (4, 'Kedawung', 'Kecamatan Kedawung, Sragen Regency, Central Java, Indonesia', 5354.0000, 34261.0000, 0.0000, '-7.4860782,111.0341183', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (5, 'Sambirejo', 'Kecamatan Sambirejo, Sragen Regency, Central Java, Indonesia', 3015.0000, 19278.0000, 0.0000, '-7.502921799999999,111.1056539', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (6, 'Gondang', 'Kecamatan Gondang, Sragen Regency, Central Java, Indonesia', 7217.0000, 45500.0000, 0.0000, '-7.4417327,111.1056539', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (7, 'Sambung Macan', 'Sambung Macan, Sragen Regency, Central Java, Indonesia', 6469.0000, 40885.0000, 0.0000, '-7.380601700000001,111.1056539', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (8, 'Ngrampal', 'Ngrampal, Sragen Regency, Central Java, Indonesia', 6850.0000, 43338.0000, 0.0000, '-7.3883305,111.052002', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (9, 'Karangmalang', 'Karangmalang, Sragen Regency, Central Java, Indonesia', 6894.0000, 43568.0000, 0.0000, '-7.468032399999998,110.9864294', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (10, 'Sragen', 'Kecamatan Sragen, Sragen Regency, Central Java, Indonesia', 4340.0000, 29227.0000, 0.0000, '-7.430520199999999,111.0090622', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (11, 'Sidoharjo', 'Sidoharjo, Sragen Regency, Central Java, Indonesia', 9161.0000, 61790.0000, 0.0000, '-7.4283992,110.9625854', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (12, 'Tanon', 'Tanon, Sragen Regency, Central Java, Indonesia', 7064.0000, 43982.0000, 0.0000, '-7.389940899999999,110.9148985', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (13, 'Gemolong', 'Gemolong, Sragen Regency, Central Java, Indonesia', 4224.0000, 26241.0000, 0.0000, '-7.393421899999999,110.8433709', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (14, 'Miri', 'Kecamatan Miri, Sragen Regency, Central Java, Indonesia', 2485.0000, 15377.0000, 0.0000, '-7.348972299999999,110.8135688', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (15, 'Sumberlawang', 'Sumberlawang, Sragen Regency, Central Java, Indonesia', 3724.0000, 22902.0000, 0.0000, '-7.3310958,110.8672131', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (16, 'Mondokan', 'Mondokan, Sragen Regency, Central Java, Indonesia', 2374.0000, 14621.0000, 0.0000, '-7.307272599999998,110.9387418', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (17, 'Sukodono', 'Sukodono, Sidoarjo Regency, East Java, Indonesia', 3780.0000, 23225.0000, 0.0000, '-7.394667,112.6737856', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (18, 'Gesi', 'Gesi, Sragen Regency, Central Java, Indonesia', 1744.0000, 10754.0000, 0.0000, '-7.3241711,111.0102737', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (19, 'Tangen', 'Tangen, Sragen Regency, Central Java, Indonesia', 1699.0000, 10386.0000, 0.0000, '-7.2811574,111.0579632', '2019');
INSERT INTO `tdata_copy1_copy1` VALUES (20, 'Jenar', 'Jenar, Sragen Regency, Central Java, Indonesia', 1814.0000, 11311.0000, 0.0000, '-7.3195291,111.1056539', '2019');

-- ----------------------------
-- Table structure for thasil
-- ----------------------------
DROP TABLE IF EXISTS `thasil`;
CREATE TABLE `thasil`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `KodeData` int(255) NOT NULL,
  `Keanggotaan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `iterasi` int(255) NOT NULL,
  `Kelompok` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thasil
-- ----------------------------
INSERT INTO `thasil` VALUES (21, 1, 'C2', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (22, 2, 'C3', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (23, 3, 'C3', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (24, 4, 'C3', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (25, 5, 'C3', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (26, 6, 'C3', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (27, 7, 'C3', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (28, 8, 'C3', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (29, 9, 'C3', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (30, 10, 'C2', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (31, 11, 'C3', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (32, 12, 'C2', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (33, 13, 'C3', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (34, 14, 'C3', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (35, 15, 'C2', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (36, 16, 'C1', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (37, 17, 'C2', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (38, 18, 'C3', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (39, 19, 'C3', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (40, 20, 'C3', 2, 'MANGGA');
INSERT INTO `thasil` VALUES (61, 21, 'C3', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (62, 22, 'C3', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (63, 23, 'C3', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (64, 24, 'C3', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (65, 25, 'C3', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (66, 26, 'C3', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (67, 27, 'C2', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (68, 28, 'C3', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (69, 29, 'C3', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (70, 30, 'C3', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (71, 31, 'C3', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (72, 32, 'C2', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (73, 33, 'C3', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (74, 34, 'C2', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (75, 35, 'C2', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (76, 36, 'C1', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (77, 37, 'C3', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (78, 38, 'C3', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (79, 39, 'C3', 3, 'PEPAYA');
INSERT INTO `thasil` VALUES (80, 40, 'C2', 3, 'PEPAYA');

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole`  (
  `userid` int(11) NOT NULL,
  `roleid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES (14, 1);
INSERT INTO `userrole` VALUES (43, 2);
INSERT INTO `userrole` VALUES (52, 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `createdby` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `createdon` datetime(0) NULL DEFAULT NULL,
  `HakAkses` int(255) NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `verified` bit(1) NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `browser` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (14, 'admin', 'admin', 'a9bdd47d7321d4089b3b00561c9c621848bd6f6e2f745a53d54913d613789c23945b66de6ded1eb336a7d526f9349a9d964d6f6c3a40e2ac90b4b16c0121f7895Xg53McbkyQ/NmW60Sf4cu3wJsi/8cyZXxeXV7g6b04=', 'mnl', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (43, 'operator', 'Operator', 'a9bdd47d7321d4089b3b00561c9c621848bd6f6e2f745a53d54913d613789c23945b66de6ded1eb336a7d526f9349a9d964d6f6c3a40e2ac90b4b16c0121f7895Xg53McbkyQ/NmW60Sf4cu3wJsi/8cyZXxeXV7g6b04=', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (44, 'admin', 'admin', 'a9bdd47d7321d4089b3b00561c9c621848bd6f6e2f745a53d54913d613789c23945b66de6ded1eb336a7d526f9349a9d964d6f6c3a40e2ac90b4b16c0121f7895Xg53McbkyQ/NmW60Sf4cu3wJsi/8cyZXxeXV7g6b04=', 'mnl', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- View structure for vw_normalisasidata
-- ----------------------------
DROP VIEW IF EXISTS `vw_normalisasidata`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_normalisasidata` AS SELECT 
	a.id, a.Nama,a.Kelompok,
	(a.LuasPanen-(SELECT MAX(LuasPanen) FROM tdata))/((SELECT MIN(LuasPanen) FROM tdata) - (SELECT MAX(LuasPanen) FROM tdata)) ND_LuasPanaen,
	(a.Produksi-(SELECT MAX(Produksi) FROM tdata))/((SELECT MIN(Produksi) FROM tdata) - (SELECT MAX(Produksi) FROM tdata)) ND_Produksi
FROM tdata a ;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Kalijambe', 'MANGGA', 0.42857143, 0.83406687);
INSERT INTO `users` VALUES (2, 'Plupuh', 'MANGGA', 0.91596639, 0.97337971);
INSERT INTO `users` VALUES (3, 'Masaran', 'MANGGA', 1.00000000, 1.00000000);
INSERT INTO `users` VALUES (4, 'Kedawung', 'MANGGA', 0.98278992, 0.99636189);
INSERT INTO `users` VALUES (5, 'Sambirejo', 'MANGGA', 0.98164706, 0.99795911);
INSERT INTO `users` VALUES (6, 'Gondang', 'MANGGA', 0.72100840, 0.96317527);
INSERT INTO `users` VALUES (7, 'Sambung Macan', 'MANGGA', 0.94047059, 0.98477320);
INSERT INTO `users` VALUES (8, 'Ngrampal', 'MANGGA', 0.79526050, 0.94659970);
INSERT INTO `users` VALUES (9, 'Karangmalang', 'MANGGA', 0.99243697, 0.99792362);
INSERT INTO `users` VALUES (10, 'Sragen', 'MANGGA', 0.59663866, 0.94203876);
INSERT INTO `users` VALUES (11, 'Sidoharjo', 'MANGGA', 0.89559664, 0.95866757);
INSERT INTO `users` VALUES (12, 'Tanon', 'MANGGA', 0.21852101, 0.89666004);
INSERT INTO `users` VALUES (13, 'Gemolong', 'MANGGA', 0.99596639, 0.99861575);
INSERT INTO `users` VALUES (14, 'Miri', 'MANGGA', 0.98403361, 0.99345141);
INSERT INTO `users` VALUES (15, 'Sumberlawang', 'MANGGA', 0.56275630, 0.91863065);
INSERT INTO `users` VALUES (16, 'Mondokan', 'MANGGA', -0.00000000, -0.00000000);
INSERT INTO `users` VALUES (17, 'Sukodono', 'MANGGA', 0.65378151, 0.63068787);
INSERT INTO `users` VALUES (18, 'Gesi', 'MANGGA', 0.93647059, 0.99329169);
INSERT INTO `users` VALUES (19, 'Tangen', 'MANGGA', 0.91236975, 0.97391212);
INSERT INTO `users` VALUES (20, 'Jenar', 'MANGGA', 0.87821849, 0.95623625);
INSERT INTO `users` VALUES (21, 'Kalijambe', 'PEPAYA', 0.97865546, 0.99570526);
INSERT INTO `users` VALUES (22, 'Plupuh', 'PEPAYA', 0.98571429, 0.99006176);
INSERT INTO `users` VALUES (23, 'Masaran', 'PEPAYA', 0.98722689, 0.99858025);
INSERT INTO `users` VALUES (24, 'Kedawung', 'PEPAYA', 0.96830252, 0.99309647);
INSERT INTO `users` VALUES (25, 'Sambirejo', 'PEPAYA', 0.99697479, 0.99946759);
INSERT INTO `users` VALUES (26, 'Gondang', 'PEPAYA', 0.98964706, 0.99726698);
INSERT INTO `users` VALUES (27, 'Sambung Macan', 'PEPAYA', 0.87304202, 0.96677788);
INSERT INTO `users` VALUES (28, 'Ngrampal', 'PEPAYA', 0.93068908, 0.98035423);
INSERT INTO `users` VALUES (29, 'Karangmalang', 'PEPAYA', 0.99848739, 0.99964506);
INSERT INTO `users` VALUES (30, 'Sragen', 'PEPAYA', 0.99781513, 0.99962732);
INSERT INTO `users` VALUES (31, 'Sidoharjo', 'PEPAYA', 0.98151261, 0.99229786);
INSERT INTO `users` VALUES (32, 'Tanon', 'PEPAYA', 0.80006723, 0.93932349);
INSERT INTO `users` VALUES (33, 'Gemolong', 'PEPAYA', 0.99798319, 0.99973380);
INSERT INTO `users` VALUES (34, 'Miri', 'PEPAYA', 0.86218487, 0.96935117);
INSERT INTO `users` VALUES (35, 'Sumberlawang', 'PEPAYA', 0.79378151, 0.95591680);
INSERT INTO `users` VALUES (36, 'Mondokan', 'PEPAYA', 0.75630252, 0.85323348);
INSERT INTO `users` VALUES (37, 'Sukodono', 'PEPAYA', 0.97428571, 0.99668134);
INSERT INTO `users` VALUES (38, 'Gesi', 'PEPAYA', 0.95966387, 0.99758643);
INSERT INTO `users` VALUES (39, 'Tangen', 'PEPAYA', 0.96806723, 0.99385959);
INSERT INTO `users` VALUES (40, 'Jenar', 'PEPAYA', 0.89206723, 0.96809115);

-- ----------------------------
-- Procedure structure for fsp_getNormalisasidata
-- ----------------------------
DROP PROCEDURE IF EXISTS `fsp_getNormalisasidata`;
delimiter ;;
CREATE PROCEDURE `fsp_getNormalisasidata`(IN `Kategori` varchar(55))
BEGIN
	SELECT 
		a.id, a.Nama,a.Kelompok,
		ROUND((a.LuasPanen-(SELECT MAX(LuasPanen) FROM tdata where Kelompok = Kategori))/((SELECT MIN(LuasPanen) FROM tdata where Kelompok = Kategori) - (SELECT MAX(LuasPanen) FROM tdata where Kelompok = Kategori)),3) ND_LuasPanen,
		ROUND((a.Produksi-(SELECT MAX(Produksi) FROM tdata where Kelompok = Kategori))/((SELECT MIN(Produksi) FROM tdata where Kelompok = Kategori) - (SELECT MAX(Produksi) FROM tdata where Kelompok = Kategori)),3) ND_Produksi
	FROM tdata a 
	WHERE a.Kelompok = Kategori;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
