/*
 Navicat Premium Data Transfer

 Source Server         : 47.110.150.127
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : nacos_config

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 17/07/2020 13:14:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (1, 'nacos.cfg.dataId', 'test', 'HelloWorld', '68e109f0f40ca72a15e05cc22786f8e6', '2020-07-06 23:08:26', '2020-07-06 23:08:26', NULL, '127.0.0.1', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `config_info` VALUES (2, 'nacos-simple-demo.yaml', 'DEFAULT_GROUP', 'common:\r\n    config1: something', '642b70c842aa90cd14315fc7e49ee9a8', '2020-07-08 21:31:53', '2020-07-08 21:31:53', NULL, '127.0.0.1', '', '', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (4, 'test', 'ordet', '11112223333', '05e5b7cac711cc605ac52f742701ffb0', '2020-07-08 22:06:42', '2020-07-08 22:12:37', NULL, '127.0.0.1', '', '23806eb9-2edb-4817-a41a-80830e90e65c', 'null', 'null', 'null', 'text', 'null');
INSERT INTO `config_info` VALUES (9, 'nacos.cfg.dataId', 'test', 'HelloWorld', '68e109f0f40ca72a15e05cc22786f8e6', '2020-07-08 22:11:45', '2020-07-08 22:11:45', NULL, '127.0.0.1', '', '23806eb9-2edb-4817-a41a-80830e90e65c', NULL, NULL, NULL, 'text', NULL);
INSERT INTO `config_info` VALUES (10, 'nacos-simple-demo.yaml', 'DEFAULT_GROUP', 'common:\r\n    config1: something_test_23', '19d0ce337dca4727b4ce47ddf5dc8268', '2020-07-08 22:11:45', '2020-07-08 22:23:22', NULL, '127.0.0.1', '', '23806eb9-2edb-4817-a41a-80830e90e65c', 'null', 'null', 'null', 'yaml', 'null');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'nacos.cfg.dataId', 'test', '', 'HelloWorld', '68e109f0f40ca72a15e05cc22786f8e6', '2010-05-05 00:00:00', '2020-07-06 23:08:26', NULL, '127.0.0.1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 2, 'nacos-simple-demo.yaml', 'DEFAULT_GROUP', '', 'common:\r\n    config1: something', '642b70c842aa90cd14315fc7e49ee9a8', '2010-05-05 00:00:00', '2020-07-08 21:31:53', NULL, '127.0.0.1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 3, 'nacos-simple-demo.yaml', 'DEFAULT_GROUP', '', 'common:\r\n    config1: something_test', '877839e294beabd23622a65008146049', '2010-05-05 00:00:00', '2020-07-08 22:04:55', NULL, '127.0.0.1', 'I', '23806eb9-2edb-4817-a41a-80830e90e65c');
INSERT INTO `his_config_info` VALUES (0, 4, 'test', 'ordet', '', '1111', 'b59c67bf196a4758191e42f76670ceba', '2010-05-05 00:00:00', '2020-07-08 22:06:42', NULL, '127.0.0.1', 'I', '23806eb9-2edb-4817-a41a-80830e90e65c');
INSERT INTO `his_config_info` VALUES (4, 5, 'test', 'ordet', '', '1111', 'b59c67bf196a4758191e42f76670ceba', '2010-05-05 00:00:00', '2020-07-08 22:08:13', NULL, '127.0.0.1', 'U', '23806eb9-2edb-4817-a41a-80830e90e65c');
INSERT INTO `his_config_info` VALUES (3, 6, 'nacos-simple-demo.yaml', 'DEFAULT_GROUP', '', 'common:\r\n    config1: something_test', '877839e294beabd23622a65008146049', '2010-05-05 00:00:00', '2020-07-08 22:10:44', NULL, '127.0.0.1', 'D', '23806eb9-2edb-4817-a41a-80830e90e65c');
INSERT INTO `his_config_info` VALUES (0, 7, 'nacos.cfg.dataId', 'test', '', 'HelloWorld', '68e109f0f40ca72a15e05cc22786f8e6', '2010-05-05 00:00:00', '2020-07-08 22:10:57', NULL, '127.0.0.1', 'I', '23806eb9-2edb-4817-a41a-80830e90e65c');
INSERT INTO `his_config_info` VALUES (0, 8, 'nacos-simple-demo.yaml', 'DEFAULT_GROUP', '', 'common:\r\n    config1: something', '642b70c842aa90cd14315fc7e49ee9a8', '2010-05-05 00:00:00', '2020-07-08 22:10:57', NULL, '127.0.0.1', 'I', '23806eb9-2edb-4817-a41a-80830e90e65c');
INSERT INTO `his_config_info` VALUES (6, 9, 'nacos.cfg.dataId', 'test', '', 'HelloWorld', '68e109f0f40ca72a15e05cc22786f8e6', '2010-05-05 00:00:00', '2020-07-08 22:11:29', NULL, '127.0.0.1', 'D', '23806eb9-2edb-4817-a41a-80830e90e65c');
INSERT INTO `his_config_info` VALUES (7, 10, 'nacos-simple-demo.yaml', 'DEFAULT_GROUP', '', 'common:\r\n    config1: something', '642b70c842aa90cd14315fc7e49ee9a8', '2010-05-05 00:00:00', '2020-07-08 22:11:33', NULL, '127.0.0.1', 'D', '23806eb9-2edb-4817-a41a-80830e90e65c');
INSERT INTO `his_config_info` VALUES (0, 11, 'nacos.cfg.dataId', 'test', '', 'HelloWorld', '68e109f0f40ca72a15e05cc22786f8e6', '2010-05-05 00:00:00', '2020-07-08 22:11:45', NULL, '127.0.0.1', 'I', '23806eb9-2edb-4817-a41a-80830e90e65c');
INSERT INTO `his_config_info` VALUES (0, 12, 'nacos-simple-demo.yaml', 'DEFAULT_GROUP', '', 'common:\r\n    config1: something', '642b70c842aa90cd14315fc7e49ee9a8', '2010-05-05 00:00:00', '2020-07-08 22:11:45', NULL, '127.0.0.1', 'I', '23806eb9-2edb-4817-a41a-80830e90e65c');
INSERT INTO `his_config_info` VALUES (4, 13, 'test', 'ordet', '', '1111222', '947e77579832ef7026c69adbeb2aa4f5', '2010-05-05 00:00:00', '2020-07-08 22:12:37', NULL, '127.0.0.1', 'U', '23806eb9-2edb-4817-a41a-80830e90e65c');
INSERT INTO `his_config_info` VALUES (10, 14, 'nacos-simple-demo.yaml', 'DEFAULT_GROUP', '', 'common:\r\n    config1: something', '642b70c842aa90cd14315fc7e49ee9a8', '2010-05-05 00:00:00', '2020-07-08 22:18:54', NULL, '127.0.0.1', 'U', '23806eb9-2edb-4817-a41a-80830e90e65c');
INSERT INTO `his_config_info` VALUES (10, 15, 'nacos-simple-demo.yaml', 'DEFAULT_GROUP', '', 'common:\r\n    config1: something_test', '877839e294beabd23622a65008146049', '2010-05-05 00:00:00', '2020-07-08 22:20:16', NULL, '127.0.0.1', 'U', '23806eb9-2edb-4817-a41a-80830e90e65c');
INSERT INTO `his_config_info` VALUES (10, 16, 'nacos-simple-demo.yaml', 'DEFAULT_GROUP', '', 'common:\r\n    config1: something_test_2', 'ecdfc0bdd58c6b8ed9d79625c1785e74', '2010-05-05 00:00:00', '2020-07-08 22:23:22', NULL, '127.0.0.1', 'U', '23806eb9-2edb-4817-a41a-80830e90e65c');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '23806eb9-2edb-4817-a41a-80830e90e65c', 'test', '????', 'nacos', 1594216946893, 1594216946893);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
