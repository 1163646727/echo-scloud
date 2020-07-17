/*
 Navicat Premium Data Transfer

 Source Server         : 47.110.150.127
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : user_db

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 17/07/2020 13:13:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ClientDetails
-- ----------------------------
DROP TABLE IF EXISTS `ClientDetails`;
CREATE TABLE `ClientDetails`  (
  `appId` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `additionalInformation` varchar(4000) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `appSecret` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `authorities` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `autoApproveScopes` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `grantTypes` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `redirectUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `resourceIds` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`appId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for base_user
-- ----------------------------
DROP TABLE IF EXISTS `base_user`;
CREATE TABLE `base_user`  (
  `id` bigint(20) NOT NULL,
  `tenancyId` bigint(20) NULL DEFAULT NULL,
  `createBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `createTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `createdByClientId` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `createdById` bigint(20) NULL DEFAULT NULL,
  `lastModifyBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `lastModifyByClientId` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `lastModifyById` bigint(20) NULL DEFAULT NULL,
  `lastModifyTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `processTimeStamp` bigint(20) NULL DEFAULT NULL,
  `accountNonExpired` bit(1) NULL DEFAULT NULL,
  `accountNonLocked` bit(1) NULL DEFAULT NULL,
  `attempts` int(11) NULL DEFAULT NULL,
  `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `credentialsNonExpired` bit(1) NULL DEFAULT NULL,
  `disabled` bit(1) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `firstAttempt` bigint(20) NULL DEFAULT NULL,
  `invalidDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `lockedAt` bigint(20) NULL DEFAULT NULL,
  `mobileNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_userName`(`userName`) USING BTREE,
  INDEX `index_name`(`name`) USING BTREE,
  INDEX `index_tenancyId`(`tenancyId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for base_user_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `base_user_role_rel`;
CREATE TABLE `base_user_role_rel`  (
  `id` bigint(20) NOT NULL,
  `tenancyId` bigint(20) NULL DEFAULT NULL,
  `createBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `createTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `createdByClientId` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `createdById` bigint(20) NULL DEFAULT NULL,
  `lastModifyBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `lastModifyByClientId` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `lastModifyById` bigint(20) NULL DEFAULT NULL,
  `lastModifyTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `processTimeStamp` bigint(20) NULL DEFAULT NULL,
  `roleCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `userId` bigint(20) NULL DEFAULT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_userId_roleCode`(`userId`, `roleCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token`  (
  `authentication_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `authentication` varchar(4000) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `client_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `refresh_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `token` varchar(4000) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `token_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_approvals
-- ----------------------------
DROP TABLE IF EXISTS `oauth_approvals`;
CREATE TABLE `oauth_approvals`  (
  `id` bigint(20) NOT NULL,
  `clientId` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `expiresAt` datetime(0) NULL DEFAULT NULL,
  `lastModifiedAt` datetime(0) NULL DEFAULT NULL,
  `scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `userId` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL COMMENT '客户端标识',
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL COMMENT '可访问的资源列表',
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL COMMENT '客户端秘钥',
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL COMMENT '允许的授权范围',
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL COMMENT '允许的授权类型',
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL COMMENT 'web服务器重定向uri',
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL COMMENT '访问令牌的有效性',
  `refresh_token_validity` int(11) NULL DEFAULT NULL COMMENT '刷新令牌有效性',
  `additional_information` varchar(256) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL COMMENT '额外的信息',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `archived` int(11) NULL DEFAULT NULL COMMENT '存档',
  `trusted` int(11) NULL DEFAULT NULL COMMENT '受信任的',
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL COMMENT '自动批准',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('c1', 'pri,order', '$2a$10$5OH8Osv35M0Tj/uWVUd/meJiYjPTlXtMYfImuUhfJJM0StVfxBMNC', 'ROLE_ADMIN,ROLE_USER,ROLE_API,all,ORDER', 'client_credentials,password,authorization_code,implicit,refresh_token', 'http://www.baidu.com', '', 7200, 259200, '', '2020-07-05 20:02:06', 0, 0, 'false');
INSERT INTO `oauth_client_details` VALUES ('c2', 'pri,order', '$2a$10$di4HnsaJUNI9wO80169NO.EnSNKXlXhQOQTsmf6PHrU6oM8hMplq6', 'ORDER', 'client_credentials,\r\npassword,authorization_code,implicit,refresh_token', 'http://www.baidu.com', NULL, 31536000, 2592000, NULL, '2020-07-05 20:02:01', 0, 0, 'false');

-- ----------------------------
-- Table structure for oauth_client_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token`  (
  `authentication_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `client_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `token` varchar(4000) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `token_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `authentication` blob NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_code
-- ----------------------------
INSERT INTO `oauth_code` VALUES (4, NULL, 's2eoX4', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000002770400000002737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001FE0200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000270317371007E000D74000270337871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0016787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00144C000573636F706571007E001678707400026331737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00147870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000474000D726573706F6E73655F74797065740004636F646574000C72656469726563745F757269740014687474703A2F2F7777772E62616964752E636F6D740009636C69656E745F696471007E001974000573636F7065740003616C6C78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F4000000000000171007E002478017371007E0028770C000000103F40000000000000787371007E001C3F400000000000007708000000100000000078740014687474703A2F2F7777772E62616964752E636F6D707371007E0028770C000000103F4000000000000174000472657331787371007E0028770C000000103F4000000000000171007E001F787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001FE0200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000277040000000271007E000F71007E00117871007E0033737200486F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E57656241757468656E7469636174696F6E44657461696C7300000000000001FE0200024C000D72656D6F74654164647265737371007E000E4C000973657373696F6E496471007E000E78707400093132372E302E302E31740020304144333645313433374239383835313741324630433139364136413641463870737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001FE0200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00164C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0025737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001FE020000787077040000000271007E000F71007E0011787074007E7B2266756C6C6E616D65223A22E5BCA0E4B889222C226964223A2231222C2270617373776F7264223A2224326124313024484C374C746341632E6B673836336D466D555A64792E5730556A4F6178546874547973794554586C6F6332424C78334A78697A5036222C22757365726E616D65223A227A68616E6773616E227D);

-- ----------------------------
-- Table structure for oauth_log
-- ----------------------------
DROP TABLE IF EXISTS `oauth_log`;
CREATE TABLE `oauth_log`  (
  `id` bigint(20) NOT NULL,
  `tenancyId` bigint(20) NULL DEFAULT NULL,
  `createBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `createTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `createdByClientId` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `createdById` bigint(20) NULL DEFAULT NULL,
  `lastModifyBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `lastModifyByClientId` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `lastModifyById` bigint(20) NULL DEFAULT NULL,
  `lastModifyTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `processTimeStamp` bigint(20) NULL DEFAULT NULL,
  `accessToken` longtext CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL,
  `authentication` longtext CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL,
  `clientId` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `clientOnly` bigint(20) NULL DEFAULT NULL,
  `expireAt` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `grantType` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `tokenType` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_clientId`(`clientId`) USING BTREE,
  INDEX `index_username`(`username`) USING BTREE,
  INDEX `index_ip`(`ip`) USING BTREE,
  INDEX `index_grantType`(`grantType`) USING BTREE,
  INDEX `index_time`(`time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token`  (
  `id` bigint(20) NOT NULL,
  `authentication` varchar(4000) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `token` varchar(4000) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `token_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orm_druid_stat_log
-- ----------------------------
DROP TABLE IF EXISTS `orm_druid_stat_log`;
CREATE TABLE `orm_druid_stat_log`  (
  `id` bigint(20) NOT NULL,
  `tenancyId` bigint(20) NULL DEFAULT NULL,
  `createBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `createTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `createdByClientId` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `createdById` bigint(20) NULL DEFAULT NULL,
  `lastModifyBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `lastModifyByClientId` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `lastModifyById` bigint(20) NULL DEFAULT NULL,
  `lastModifyTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `processTimeStamp` bigint(20) NULL DEFAULT NULL,
  `appName` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `hostIp` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `hostName` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `logTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `logTimestamp` bigint(20) NULL DEFAULT NULL,
  `activeCount` int(11) NOT NULL,
  `activePeak` int(11) NOT NULL,
  `activePeakTime` bigint(20) NOT NULL,
  `blobOpenCount` bigint(20) NOT NULL,
  `clobOpenCount` bigint(20) NOT NULL,
  `closeCount` bigint(20) NOT NULL,
  `commitCount` bigint(20) NOT NULL,
  `connectCount` bigint(20) NOT NULL,
  `dbType` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `defaultAutoCommit` bit(1) NOT NULL,
  `defaultReadOnly` bit(1) NOT NULL,
  `defaultTransactionIsolation` int(11) NULL DEFAULT NULL,
  `driverClassName` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `errorCount` bigint(20) NOT NULL,
  `exceptionSorterClassName` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `executeCount` bigint(20) NOT NULL,
  `filterClassNames` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `initialSize` int(11) NOT NULL,
  `keepAliveCheckCount` bigint(20) NOT NULL,
  `logicConnectErrorCount` bigint(20) NOT NULL,
  `loginTimeout` int(11) NOT NULL,
  `maxActive` int(11) NOT NULL,
  `minIdle` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `notEmptyWaitCount` bigint(20) NOT NULL,
  `notEmptyWaitNanos` bigint(20) NOT NULL,
  `physicalCloseCount` bigint(20) NOT NULL,
  `physicalConnectCount` bigint(20) NOT NULL,
  `physicalConnectErrorCount` bigint(20) NOT NULL,
  `poolingCount` int(11) NOT NULL,
  `poolingPeak` int(11) NOT NULL,
  `poolingPeakTime` bigint(20) NOT NULL,
  `pstmtCacheHitCount` bigint(20) NOT NULL,
  `pstmtCacheMissCount` bigint(20) NOT NULL,
  `queryTimeout` int(11) NOT NULL,
  `removeAbandoned` bit(1) NOT NULL,
  `rollbackCount` bigint(20) NOT NULL,
  `sqlSkipCount` bigint(20) NOT NULL,
  `startTransactionCount` bigint(20) NOT NULL,
  `testOnBorrow` bit(1) NOT NULL,
  `testOnReturn` bit(1) NOT NULL,
  `testWhileIdle` bit(1) NOT NULL,
  `transactionQueryTimeout` int(11) NOT NULL,
  `txn_0_1` bigint(20) NOT NULL,
  `txn_10000_100000` bigint(20) NOT NULL,
  `txn_1000_10000` bigint(20) NOT NULL,
  `txn_100_1000` bigint(20) NOT NULL,
  `txn_10_100` bigint(20) NOT NULL,
  `txn_1_10` bigint(20) NOT NULL,
  `txn_more` bigint(20) NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `vldConnChkClassName` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `waitThreadCount` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orm_jdbc_sql_stat_log
-- ----------------------------
DROP TABLE IF EXISTS `orm_jdbc_sql_stat_log`;
CREATE TABLE `orm_jdbc_sql_stat_log`  (
  `id` bigint(20) NOT NULL,
  `tenancyId` bigint(20) NULL DEFAULT NULL,
  `createBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `createTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `createdByClientId` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `createdById` bigint(20) NULL DEFAULT NULL,
  `lastModifyBy` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `lastModifyByClientId` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `lastModifyById` bigint(20) NULL DEFAULT NULL,
  `lastModifyTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `processTimeStamp` bigint(20) NULL DEFAULT NULL,
  `appName` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `hostIp` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `hostName` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `logTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `logTimestamp` bigint(20) NULL DEFAULT NULL,
  `blobOpenCount` bigint(20) NOT NULL,
  `clobOpenCount` bigint(20) NOT NULL,
  `concurrentMax` int(11) NOT NULL,
  `dataSource` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `dbType` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `druidStatLogId` bigint(20) NULL DEFAULT NULL,
  `eh1` bigint(20) NULL DEFAULT NULL,
  `ehmore` int(11) NULL DEFAULT NULL,
  `eh1000000` int(11) NULL DEFAULT NULL,
  `eh100000` int(11) NULL DEFAULT NULL,
  `eh10000` int(11) NULL DEFAULT NULL,
  `eh1000` int(11) NULL DEFAULT NULL,
  `eh100` int(11) NULL DEFAULT NULL,
  `eh10` bigint(20) NULL DEFAULT NULL,
  `execRsHoldTime` bigint(20) NULL DEFAULT NULL,
  `batchToMax` int(11) NULL DEFAULT NULL,
  `batchTotal` bigint(20) NULL DEFAULT NULL,
  `errorCount` bigint(20) NULL DEFAULT NULL,
  `errorLastClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `errorLastMsg` varchar(1000) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `errorLastStackTrace` longtext CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL,
  `errorLastTime` bigint(20) NULL DEFAULT NULL,
  `lastStartTime` bigint(20) NULL DEFAULT NULL,
  `execNanoMaxOccurTime` bigint(20) NULL DEFAULT NULL,
  `execNanoMax` bigint(20) NULL DEFAULT NULL,
  `execNanoTotal` bigint(20) NULL DEFAULT NULL,
  `execSuccessCount` bigint(20) NULL DEFAULT NULL,
  `fetchRowCount` bigint(20) NOT NULL,
  `fetchRowCountMax` bigint(20) NOT NULL,
  `f1` bigint(20) NULL DEFAULT NULL,
  `fmore` int(11) NULL DEFAULT NULL,
  `f10000` int(11) NULL DEFAULT NULL,
  `f1000` int(11) NULL DEFAULT NULL,
  `f100` bigint(20) NULL DEFAULT NULL,
  `f10` bigint(20) NULL DEFAULT NULL,
  `logFile` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `h1` bigint(20) NULL DEFAULT NULL,
  `hmore` int(11) NULL DEFAULT NULL,
  `h1000000` int(11) NULL DEFAULT NULL,
  `h100000` int(11) NULL DEFAULT NULL,
  `h10000` int(11) NULL DEFAULT NULL,
  `h1000` int(11) NULL DEFAULT NULL,
  `h100` int(11) NULL DEFAULT NULL,
  `h10` bigint(20) NULL DEFAULT NULL,
  `inTxnCount` bigint(20) NULL DEFAULT NULL,
  `inputStreamOpenCount` bigint(20) NOT NULL,
  `lastSlowParameters` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `readBytesLength` bigint(20) NOT NULL,
  `readStringLength` bigint(20) NOT NULL,
  `readerOpenCount` bigint(20) NOT NULL,
  `rsHoldTime` bigint(20) NULL DEFAULT NULL,
  `running` int(11) NULL DEFAULT NULL,
  `sql_content` longtext CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL,
  `sqlHash` bigint(20) NOT NULL,
  `sqlStatValueId` bigint(20) NOT NULL,
  `updateCount` bigint(20) NOT NULL,
  `updateCountMax` bigint(20) NOT NULL,
  `u1` bigint(20) NULL DEFAULT NULL,
  `umore` int(11) NULL DEFAULT NULL,
  `u10000` int(11) NULL DEFAULT NULL,
  `u1000` int(11) NULL DEFAULT NULL,
  `u100` bigint(20) NULL DEFAULT NULL,
  `u10` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限表主键',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL COMMENT '权限标识符',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL COMMENT '描述',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL COMMENT '请求地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, 'p1', '测试资源1', '/r/r1');
INSERT INTO `t_permission` VALUES (2, 'p2', '测试资源2', '/r/r2');
INSERT INTO `t_permission` VALUES (3, 'p3', '测试资源3', '/r/r3');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '管理员', NULL, '2020-06-24 15:59:36', '2020-06-24 15:59:36', NULL);
INSERT INTO `t_role` VALUES (2, '游客用户', NULL, '2020-07-07 16:39:23', '2020-07-07 16:39:23', NULL);

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `role_id` int(11) NULL DEFAULT NULL,
  `permission_id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES (1, 1);
INSERT INTO `t_role_permission` VALUES (1, 2);
INSERT INTO `t_role_permission` VALUES (1, 3);
INSERT INTO `t_role_permission` VALUES (2, 3);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NULL DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pk_t_user_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'zhangsan', '$2a$10$HL7LtcAc.kg863mFmUZdy.W0UjOaxThtTysyETXloc2BLx3JxizP6', '张三', NULL);
INSERT INTO `t_user` VALUES (2, 'lisi', '$2a$10$HL7LtcAc.kg863mFmUZdy.W0UjOaxThtTysyETXloc2BLx3JxizP6', '李四', NULL);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `user_id` int(50) NOT NULL,
  `role_id` int(50) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1, '2020-07-01 19:26:49', NULL);
INSERT INTO `t_user_role` VALUES (2, 2, '2020-07-07 18:13:14', NULL);

SET FOREIGN_KEY_CHECKS = 1;
