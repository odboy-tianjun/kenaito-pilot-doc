/*
 Navicat Premium Dump SQL

 Source Server         : local-mysql
 Source Server Type    : MySQL
 Source Server Version : 80025 (8.0.25)
 Source Host           : 192.168.235.128:3306
 Source Schema         : kenaito_pilot

 Target Server Type    : MySQL
 Target Server Version : 80025 (8.0.25)
 File Encoding         : 65001

 Date: 01/05/2026 11:34:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_info
-- ----------------------------
DROP TABLE IF EXISTS `app_info`;
CREATE TABLE `app_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用名称',
  `deploy_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部署模式(k8s、host)',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '开发语言',
  `status` tinyint(1) NOT NULL COMMENT '状态。0空应用1在线2已下线',
  `offline_time` datetime NULL DEFAULT NULL COMMENT '下线时间',
  `offline_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '下线原因',
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用负责人',
  `owner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用负责人名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '应用描述',
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用级别。A核心应用 B非核心应用 C边缘应用',
  `deploy_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部署类型。static静态产物 backend 后端服务',
  `gitlab_id` bigint NOT NULL COMMENT '归属gitlab站点',
  `git_group_id` bigint NULL DEFAULT NULL COMMENT 'git分组id',
  `git_group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'git分组名称',
  `git_project_id` bigint NULL DEFAULT NULL COMMENT 'git项目id',
  `git_project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'git项目名称',
  `git_project_owner` bigint NULL DEFAULT NULL COMMENT 'git项目用户名',
  `git_web_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'git项目地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '应用信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_info
-- ----------------------------
INSERT INTO `app_info` VALUES (1, 'admin', '2026-04-19 09:18:20', 'admin', '2026-04-19 09:18:25', 'kenaito-pilot', 'k8s', 'java', 1, NULL, NULL, 'admin', '管理员', NULL, 'A', 'backend', 1, 1, 'root', 6, 'kenaito-pilot', 1, 'http://219.151.187.115:21008/root/kenaito-pilot');

-- ----------------------------
-- Table structure for app_role
-- ----------------------------
DROP TABLE IF EXISTS `app_role`;
CREATE TABLE `app_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '应用角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_role
-- ----------------------------
INSERT INTO `app_role` VALUES (1, 'admin', '2026-02-25 21:12:31', 'admin', '2026-02-25 21:12:31', 'dev', '开发小弟', '就是小弟啦');
INSERT INTO `app_role` VALUES (2, 'admin', '2026-02-25 21:12:31', 'admin', '2026-02-25 21:12:31', 'owner', '项目负责人', '就是大哥啦');
INSERT INTO `app_role` VALUES (3, 'admin', '2026-02-25 21:12:31', 'admin', '2026-02-25 21:12:31', 'dba', '数据库管理员', '就是经常删库跑路的那个啦');
INSERT INTO `app_role` VALUES (4, 'admin', '2026-02-25 21:12:31', 'admin', '2026-02-25 21:12:31', 'deploy_review', '部署审核员', 'Ta没同意就部署不了啦');
INSERT INTO `app_role` VALUES (5, 'admin', '2026-02-25 21:12:31', 'admin', '2026-02-25 21:12:31', 'merge_master_review', '合并master审核员', 'Ta没同意就合并不了啦');

-- ----------------------------
-- Table structure for app_user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `app_user_favorite`;
CREATE TABLE `app_user_favorite`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用名称',
  PRIMARY KEY (`username`, `app_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户收藏的应用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for app_user_role
-- ----------------------------
DROP TABLE IF EXISTS `app_user_role`;
CREATE TABLE `app_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '应用角色、用户关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for demo_create_time_table
-- ----------------------------
DROP TABLE IF EXISTS `demo_create_time_table`;
CREATE TABLE `demo_create_time_table`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo_create_time_table
-- ----------------------------

-- ----------------------------
-- Table structure for demo_full_time_table
-- ----------------------------
DROP TABLE IF EXISTS `demo_full_time_table`;
CREATE TABLE `demo_full_time_table`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo_full_time_table
-- ----------------------------

-- ----------------------------
-- Table structure for demo_user_create_time_table
-- ----------------------------
DROP TABLE IF EXISTS `demo_user_create_time_table`;
CREATE TABLE `demo_user_create_time_table`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo_user_create_time_table
-- ----------------------------

-- ----------------------------
-- Table structure for demo_user_full_time_logic_table
-- ----------------------------
DROP TABLE IF EXISTS `demo_user_full_time_logic_table`;
CREATE TABLE `demo_user_full_time_logic_table`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `available` tinyint(1) NOT NULL DEFAULT 1 COMMENT '数据有效性',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo_user_full_time_logic_table
-- ----------------------------

-- ----------------------------
-- Table structure for demo_user_full_time_table
-- ----------------------------
DROP TABLE IF EXISTS `demo_user_full_time_table`;
CREATE TABLE `demo_user_full_time_table`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo_user_full_time_table
-- ----------------------------

-- ----------------------------
-- Table structure for gitlab_site_config
-- ----------------------------
DROP TABLE IF EXISTS `gitlab_site_config`;
CREATE TABLE `gitlab_site_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'gitlab别名',
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'gitlab地址',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'PersonAccessToken。用root用户的',
  `default_group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '默认分组名称。为空默认root',
  `default_group_id` bigint NOT NULL COMMENT '默认分组id(auto)',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用',
  `master` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认站点',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '异常信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Gitlab站点配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gitlab_site_config
-- ----------------------------
INSERT INTO `gitlab_site_config` VALUES (1, 'admin', '2026-05-01 15:14:44', 'admin', '2026-05-01 15:14:44', '本地测试环境', 'http://192.168.235.127', 'xxxxxxxxxxxxx', 'root', 1, 0, 1, 'java.net.ConnectException: Connection timed out: connect');

-- ----------------------------
-- Table structure for host_app
-- ----------------------------
DROP TABLE IF EXISTS `host_app`;
CREATE TABLE `host_app`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `host_id` bigint NOT NULL COMMENT '主机id',
  `cluster_id` bigint NOT NULL COMMENT '主机集群id',
  `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '主机、应用关联关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of host_app
-- ----------------------------

-- ----------------------------
-- Table structure for host_info
-- ----------------------------
DROP TABLE IF EXISTS `host_info`;
CREATE TABLE `host_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主机名',
  `host_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主机ip',
  `cluster_id` bigint NOT NULL COMMENT '主机集群id',
  `deploy_app_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部署应用类型。比如：java',
  `cpu_size` decimal(10, 0) NULL DEFAULT NULL COMMENT 'cpu大小(auto)',
  `memory_size` decimal(10, 0) NULL DEFAULT NULL COMMENT '内存大小(auto)',
  `disk_size` decimal(10, 2) NULL DEFAULT NULL COMMENT '磁盘容量(auto)',
  `machine` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '处理器类型(auto)。uname -m',
  `release` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内核版本号(auto)。uname -r',
  `system` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统(auto)。cat /etc/redhat-release',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '主机信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of host_info
-- ----------------------------

-- ----------------------------
-- Table structure for k8s_ingress
-- ----------------------------
DROP TABLE IF EXISTS `k8s_ingress`;
CREATE TABLE `k8s_ingress`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Ingress名称。命名规则：{appName}-ing',
  `namespace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Ingress命名空间',
  `cluster_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '集群编码',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '域名',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '匹配路径。默认为\'/\'',
  `path_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Ingress路由规则中的路径类型(Exact、Prefix、ImplementationSpecific',
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '目标Service',
  `service_port` int NOT NULL COMMENT '服务端口。指向Service的应用服务端口',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'K8s Ingress 反向代理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of k8s_ingress
-- ----------------------------

-- ----------------------------
-- Table structure for k8s_node
-- ----------------------------
DROP TABLE IF EXISTS `k8s_node`;
CREATE TABLE `k8s_node`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `cluster_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '集群编码',
  `cluster_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '集群名称',
  `cluster_env` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '集群环境',
  `cluster_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '集群IP地址',
  `cluster_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '集群版本',
  `cluster_client_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '集群客户端配置',
  `default_workload_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '默认工作负载配置',
  `default_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '默认镜像',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用',
  `health_status` tinyint(1) NOT NULL COMMENT '是否健康',
  `error_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '异常信息',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `udx_cluster_code`(`cluster_code` ASC) USING BTREE COMMENT '集群编码唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'K8s 节点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of k8s_node
-- ----------------------------
INSERT INTO `k8s_node` VALUES (1, 'admin', '2026-03-28 08:39:55', 'admin', '2026-03-28 08:39:57', 'local_k8s_28', '本地测试环境', 'daily', '192.168.235.128', 'v1.28.1', 'apiVersion: v1\nclusters:\n- cluster:\n    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURtakNDQW9LZ0F3SUJBZ0lVUFlPS2hxNHZwK2pob2VaM0NpUE9QdnQwbWVnd0RRWUpLb1pJaHZjTkFRRUwKQlFBd1pERUxNQWtHQTFVRUJoTUNRMDR4RVRBUEJnTlZCQWdUQ0VoaGJtZGFhRzkxTVFzd0NRWURWUVFIRXdKWQpVekVNTUFvR0ExVUVDaE1EYXpoek1ROHdEUVlEVlFRTEV3WlRlWE4wWlcweEZqQVVCZ05WQkFNVERXdDFZbVZ5CmJtVjBaWE10WTJFd0lCY05Nall3TXpJMk1UTTBNREF3V2hnUE1qRXlOakF6TURJeE16UXdNREJhTUdReEN6QUoKQmdOVkJBWVRBa05PTVJFd0R3WURWUVFJRXdoSVlXNW5XbWh2ZFRFTE1Ba0dBMVVFQnhNQ1dGTXhEREFLQmdOVgpCQW9UQTJzNGN6RVBNQTBHQTFVRUN4TUdVM2x6ZEdWdE1SWXdGQVlEVlFRREV3MXJkV0psY201bGRHVnpMV05oCk1JSUJJakFOQmdrcWhraUc5dzBCQVFFRkFBT0NBUThBTUlJQkNnS0NBUUVBMDZCbG1GVFFaNHZLRkJONVBDK1cKd2FzM1NqVmYwenh4cHRCb2xOYTk1dWhxS3BlLzRUR1lDaW9NNm5wd0Z3WW5VVHlvYnd2ZTdlNXNHKzV1cFFFQgpwdW5kd0JlVHhkajlDUXRkNVJkVU1sUktTakdjWGZ3Sms5ZUhKa3hwTTlHNUVwcjQzK2ZFOWN2d3Vqak91RjI1ClROS3ZsR1hpekJqTHR0QjBsaVF6bCs3UlJHZkhNcXZUK1VZSWJjVnh2cjI5RUxvUnRVbnplY2dkYnJlN2JCeEsKczVVeWhUdUtaUmwzWG5lLzFLSkI3bTBDZzduNDE3NkY5MXpRVWQ0TnFvM3lnUUxpYjFFMGNva0w5TWcyYjMwUgpSdlR0Qi9jMmR0NTJ3ZU8wZDU5Vk8vSkZ0Z0R4M0FVbkFyVDduc09qcGpqNU8vRFB3RlpuSXZCb1lPekVpc3NGCjhRSURBUUFCbzBJd1FEQU9CZ05WSFE4QkFmOEVCQU1DQVFZd0R3WURWUjBUQVFIL0JBVXdBd0VCL3pBZEJnTlYKSFE0RUZnUVUwcHlOTm9CV1Z1ZWptdHpHWXdudllmWXR1SXd3RFFZSktvWklodmNOQVFFTEJRQURnZ0VCQUJBbwoyN2huUVFueWZXcFdGNDc2R2lLYURra2EzK0xKRDREeGxVU1o1ZEJkVXZFdERXNkZWVEF4Q3plaDB3Q055ZEVGCnh5bWFlNG16R3hSS2phZ29nYjlsZ3AxYXlaQnRKbVlnaTRqOVFjUzFOOC9LT01CdnZIWDVmWEM1eEZmeUo0Vm4KZlVBZ0Z4YlJXdGZ5VHU1TzBSczgyWWNMS2k5YnllVjBzRENFMmNuNVY4VkJXOUZsSUdxbnNYbEZObUdXWkJraQorWENEZExPOERSdE1qUXdEd2JCY2p4SkRtdG93ZUYxai9IWExld0Y4aHVLVmczSFVmUGFNRmRmTTkvV0xCTS96CnV5VHdST3JaL2ZMRWVRR0RzeFFtSU5IeXRLMUxSQVJvUHNsaFdvdW4zYlpzYlhIS2Job0c0UVRCTEZSa2FySFoKZ2E1SE5vQnJqelBOZWlWend3cz0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=\n    server: https://192.168.235.128:6443\n  name: cluster1\ncontexts:\n- context:\n    cluster: cluster1\n    user: admin\n  name: context-cluster1\ncurrent-context: context-cluster1\nkind: Config\npreferences: {}\nusers:\n- name: admin\n  user:\n    client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUQyakNDQXNLZ0F3SUJBZ0lVTk5qejdDVmlxWlFaSFArM0syQkxCOEJ0T2hzd0RRWUpLb1pJaHZjTkFRRUwKQlFBd1pERUxNQWtHQTFVRUJoTUNRMDR4RVRBUEJnTlZCQWdUQ0VoaGJtZGFhRzkxTVFzd0NRWURWUVFIRXdKWQpVekVNTUFvR0ExVUVDaE1EYXpoek1ROHdEUVlEVlFRTEV3WlRlWE4wWlcweEZqQVVCZ05WQkFNVERXdDFZbVZ5CmJtVjBaWE10WTJFd0lCY05Nall3TXpJMk1UTTBNREF3V2hnUE1qQTNOakF6TVRNeE16UXdNREJhTUdjeEN6QUoKQmdOVkJBWVRBa05PTVJFd0R3WURWUVFJRXdoSVlXNW5XbWh2ZFRFTE1Ba0dBMVVFQnhNQ1dGTXhGekFWQmdOVgpCQW9URG5ONWMzUmxiVHB0WVhOMFpYSnpNUTh3RFFZRFZRUUxFd1pUZVhOMFpXMHhEakFNQmdOVkJBTVRCV0ZrCmJXbHVNSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQXU2UE94NGlQYmFITXpySzAKWXc3bHlSSkJFNHZ4RzE2dzJiei83UmFDam1wdVNjVUZ6MUxmRnM0NThSVlpHNWxCVy9iMnpTdlpaenEzL3lFWgpPTVo2NThqNkowKzRoVmZSakg3UVNEOVJNNkptdUxuemZ5SFRJWEZhc05uakVMRDg0SFRpK0Z6MVYydWZoZmpiCmdWdkhHNExtemZ4VnUyVUs0bTE4QWZYdDY0NEprbndBbVpqMXRPd2FqeWtETitOa1J6RkFmak9kTkVNbFlidloKNHNNL3pibURLZmJXUnN2Y2JxK2x5b28yRHZpQ1Y3Sk4wSVZDL01zOVRjcEZyUGhSNDFRMmZYMDBqL1ZGODVVZwpxQkZGUEtBRTV3ZjVvc05tU2poaXVJWVRTOGovYXVXcXFtOVRkdkJiUGFqVmc1Q0tId2lVZmZIWEtudU53QjYvCks0cElod0lEQVFBQm8zOHdmVEFPQmdOVkhROEJBZjhFQkFNQ0JhQXdIUVlEVlIwbEJCWXdGQVlJS3dZQkJRVUgKQXdFR0NDc0dBUVVGQndNQ01Bd0dBMVVkRXdFQi93UUNNQUF3SFFZRFZSME9CQllFRkR2d2xpRnV6KzZUQzNxMgpJNVAwbzRLMlpsSEhNQjhHQTFVZEl3UVlNQmFBRk5LY2pUYUFWbGJubzVyY3htTUo3MkgyTGJpTU1BMEdDU3FHClNJYjNEUUVCQ3dVQUE0SUJBUUFHdGRTZ2xpRXdOclA3NDdncmxLdEN6MXk1d0MzeUp4WmxSbmJEYWJrbVI0V1gKLzFoSlhXVjRGbllmeEFycmo1YWdCSTF6d2ZDVUpUN09EdWlpdTJCRkZ5YzNGODM4aEx6UzlnSTY4Mzh2UGNoMQpjcUFqVnAybDFwT2xrSjY4U3puZTJDZkI4YXV3bDBueGh3OUQvTHY5SFhxM09BTlFMK2szaEQ0Q3IxM214cFgrCmw4S1ExM2Y5VHNCV3JSTkltWHA4UktCRHUyZ0NyNHQzMDEwa2FmbHNmamhycUJBeVBwaW5iTHFDdGVibGpHalEKcHFGZDFIdDhYbE15UDNQd1JScTJRd2RyQXF5cUlWRFhlM0U2Vk1jQVJlQkJFVm5tVVUyM0NTMktjK3dkbUNWSApPL1BwNC9KekpuWjU3NzNiUXl4OXp3VUxKVU9LNUs0TGx5Rm5pbjhQCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K\n    client-key-data: LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb3dJQkFBS0NBUUVBdTZQT3g0aVBiYUhNenJLMFl3N2x5UkpCRTR2eEcxNncyYnovN1JhQ2ptcHVTY1VGCnoxTGZGczQ1OFJWWkc1bEJXL2IyelN2Wlp6cTMveUVaT01aNjU4ajZKMCs0aFZmUmpIN1FTRDlSTTZKbXVMbnoKZnlIVElYRmFzTm5qRUxEODRIVGkrRnoxVjJ1ZmhmamJnVnZIRzRMbXpmeFZ1MlVLNG0xOEFmWHQ2NDRKa253QQptWmoxdE93YWp5a0ROK05rUnpGQWZqT2RORU1sWWJ2WjRzTS96Ym1ES2ZiV1JzdmNicStseW9vMkR2aUNWN0pOCjBJVkMvTXM5VGNwRnJQaFI0MVEyZlgwMGovVkY4NVVncUJGRlBLQUU1d2Y1b3NObVNqaGl1SVlUUzhqL2F1V3EKcW05VGR2QmJQYWpWZzVDS0h3aVVmZkhYS251TndCNi9LNHBJaHdJREFRQUJBb0lCQUdFejVJU2RDNkFCZDNXRQpRY29uQjRaMy9GcEIzbThOU0pRalFuanhka1NNZ2dHWkhQOWZzTTNCbTJaMlpxalRaWFpjbzFGNTY2OThUYURPCjVwL3d3ZTZjd0dubzlHK3ZKSkNoaVFoRU5LNkk3S201T3BpYlR5STk5SHMxQkZtN05lU1k2Sk04cEtQYXp0SzYKTGd2L0hVLzFLZGQvWm5JalQ5WW9YVnN1cVVlaWM4Z25MS3A0czJzNFA2dUdHUGlhTXBBa2NHWk9SR2UwU1pEVgp4MXR2WjFqNm9HQm1ueDNWOEF2ZlcwOStYYi84QU4rOXpMYXBzdC9ZZXJ5cXNPLzB1dTVGT0MxUG5IbGhOK09PCk9DOUdtcDAwWmRuNVowb3hxTENweDZzbXJ4VDhtcFhjSGd2L21uRnlha0RiOFh4WWJZWDFyYno3ZmVsblBCZkcKRFJseGM0RUNnWUVBNGZ0SlVQbTVtV0VlRmNhbnM0c2dpcTRxSkFwWGpzUDBYZlM2RTRmTnJjNGk1MTRpWGNNdgpQK0VMZTJ3Nzd4cUQ1cGJtWjFNNjdHZHdTWHZrWC92bUpzcEU4T1FBSUsvS0k1dHhWR3lLeGhRUStmeC9rbU1lCjVpeVkyV1lWY1A3R0RSOUloUjRlTmJ3ZWdwajRyczdrV2hzSmVrOWNITEJrc3o1SWwrcVRsK2NDZ1lFQTFKQ3QKQUhuMnNSa29RYlpSdGp4SE9PUmRhbWFSZGQxSysrM3NuVjcreDJXM2tML0pyU2lQVDV5SDNWZmlPajB0amlyRAovcFhhcnBXaHNXamMrT1ptWDd6MWR3UVpDQ3BTOS9YNkRqYzRxaHhPSzltcHJYUWx3TWZXd3JLK25iZjd3WXpSCm5UcmxyUDNKdUVqeTZZVWJsNGRYeThGNnlYbkxTVlJ4RHcxMU5tRUNnWUVBMmN1eE5xem9GdzVGeTZFQm9nWTEKMzlMSjVLQmZFTWFGTDBTZFRoTjF4TXhHVVkwbFBBN1E3QlQrVnY3U3FMaDZaWFFNTFl0RzMrODFobTAwaHRtbApVTDlqUUhQT043S1U5RXB0S0h2UUorWFJFczRyT2EvMGFNeVVwL28rTWdBcWF4MDZiS25CWGZLbnlTQ2JsUWJyCmlIaEVZekEzUzZNcCtxTE5ualREK1FNQ2dZQjd5ZjFXSjdEb2xmUUJ3TUY1VlVWTTlvRUljODhHU3VkZUs4TCsKS3RKSklRMXorSnprZ0pobERvMTQ4N05GbzFjaVVmbHVDNnNjdlBzN0xBeHp6d21UZTZHZnUvMHY2aVlEVFhaZwpUUHhzNUtzSmttcmtIcDNWMVF0V3UyMlN3QkNYT1FEaGhlazNnMXkwTzVkck14OU1jWDlKbzlWeis3L05acVdvCjFIZU1RUUtCZ0c5L0JUWk1wY2NTNENHL2FSOGhsc2N1YVBydExvMGhUY0NQOWwydnlGN0lOUHpDbzhiRktHNngKYXd6NVd6NGV1Ukx0Y0V6MWVWTGhYVDVkQXRrUlFFb2plcDVoeWhpOFRyTnhGRE9QNUo4SGFWQjgzaVE2Yjg4LwpLbHlMZXNxcmk5ZHV0TE1QbUVRZmMzWlZuWU1PQkRjTHc0bmd4QVBxSEszWm1FcjZUeHNKCi0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg==\n', '', 'registry.cn-shanghai.aliyuncs.com/odboy/kenaito-cicd:system-alinux3', 0, 1, 'The timeout of 10000 ms has been exceeded when getting a connection to 192.168.235.128:6443');
INSERT INTO `k8s_node` VALUES (2, 'admin', '2026-04-03 14:23:06', 'admin', '2026-04-03 14:23:12', 'local_k8s_31', '本地测试环境31', 'daily', '127.0.0.1', 'v1.34.1', 'apiVersion: v1\nclusters:\n- cluster:\n    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCekNDQWUrZ0F3SUJBZ0lJTkhKU1drMU1FMXN3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWdGdzB5TlRFeE1UUXdNalUyTlRSYUdBOHlNVEkxTVRBeU1UQXpNREUxTkZvdwpGVEVUTUJFR0ExVUVBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDCkFRb0NnZ0VCQU1jdXhsMjc0dGxyUU4zMjR4enM3Mzlua3VxdERZdklUTTJVZjNPWDNyck5ESGc5V1dta3NLWXIKZXpFMUZTbk9DZmd2VklRSlN4RnVIdWdPd29XanBhWDVOQUdacUFEWVhFYlgwR3RMcWhDNjY2SEdhSU5vTjJ3OQo0WUdzaDFKVDRnVGFvR1Q0ZXJRZzZhR1p5NnlhUTNTVE9LclNSeGhac3RHbDdiYW0vQm5jSk05TW5RNHprTjV5Ck51cHUrdWc5dDQzbHlzazNDa0o2ZHpCVlBCcDk2Qk1ST29xMEN0dFlZYTRnSkZTRGNXNnFYUG5RcmlEVnZMS3EKcGFYNlpqdktscVluSkpMN1NPWlV6aFRVUlpXcCtvaWY0Vis1enFxakV0QWZXN3haTExDYkpXaWNDUE56UzFVSApXZ1NXRHlkUG9QRUJwL2pTbTlWVHV6WEdWV2R5TExNQ0F3RUFBYU5aTUZjd0RnWURWUjBQQVFIL0JBUURBZ0trCk1BOEdBMVVkRXdFQi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZEcmtPaW1oY3d5UmQ0dkJOeHg4eHl4MjVLRDIKTUJVR0ExVWRFUVFPTUF5Q0NtdDFZbVZ5Ym1WMFpYTXdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBTG1PTit1LwpZN3l4TzBLazJWRGw4Y0EvY2RNL2VDcWxMWkYxSitia3l6OEZWNVZmTmwyMXlDWXZoc3dlTEd1eEdITDlpaU5SClFRWUppYk8xUHFVK1dieHpzWnZzWTJXMTBEeDYwRXZXSHJJRU12TjluOTJKTWZIU2NMYXI1dTdta1RBTXNCTm4Kd0Z6dzVMTENGeWt2SDY1YkQ0aE9RaE5RUi91NjZNVTN5ZnhlVDFKbklwTTlVTnd6MldQcnRuREJNQm0xckRkRApiWEc4ZFNmU2JtaFZUdzUvSDhUdmRDbUY3a1hoSTVTNXptRnhRLzU5ZVZuVi81aWd0dk5rU3hER2t0YkEzVStrCjdSREJ6TnZMN29RRk1VeDBXSjBtRUlIOHExRm5pTVBxQ282d015UFpsTUJKRm1wSE9uMDJnYWM3RUtrdVhWeG0Kc1RtREIzM1ZRZFBMVS9ZPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==\n    server: https://127.0.0.1:6443\n  name: docker-desktop\ncontexts:\n- context:\n    cluster: docker-desktop\n    user: docker-desktop\n  name: docker-desktop\ncurrent-context: docker-desktop\nkind: Config\nusers:\n- name: docker-desktop\n  user:\n    client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURRakNDQWlxZ0F3SUJBZ0lJV2phcWtXcFBRTjh3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TlRFeE1UUXdNalUyTlRSYUZ3MHlOakV4TVRRd01qVTJOVFJhTURZeApGekFWQmdOVkJBb1REbk41YzNSbGJUcHRZWE4wWlhKek1Sc3dHUVlEVlFRREV4SmtiMk5yWlhJdFptOXlMV1JsCmMydDBiM0F3Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLQW9JQkFRRE9Sakg4ZWNkSllCTlYKYm9YOXUxcHdzTldhaExLckNRR3VsOWVMbjJwbm50SFNFMGIzRGwrdlVOalhsaTVCWldJekI1TkVJdnpOQzBsUwpVTjlqNUpQWm5WRUg0NEJUNW1DZDRyREZUUnYrZUQzWTZ0eXQ4ci9zZzRMSEFPQVNWRXVQck04R3g2LzlPbmtVCi8yZnVjT2lKMkNFYkYrQi9LY25JbFJJcFU2OXlqaXNmc0trQ0dRSURpVXdJVVQ0NVFxL0UzSHM5TFEvcTBKWngKQ01XZU84WW9QdDdkOVowQ01sUis4YVdXRzNSZmJob1UwNWtNblIyMlgzdGVEZVVUbUhtWE9hS0pmRVI0RnBKTgp6UDZScnArWUtrdHlXRlNFMyswYy9tRHdKOVVHWS81Q0pSYVNFdXdkcGM5cGdRTVdxMks4c3lXOTZkcEtiZVZlCjNMMEpIbTZEQWdNQkFBR2pkVEJ6TUE0R0ExVWREd0VCL3dRRUF3SUZvREFUQmdOVkhTVUVEREFLQmdnckJnRUYKQlFjREFqQU1CZ05WSFJNQkFmOEVBakFBTUI4R0ExVWRJd1FZTUJhQUZEcmtPaW1oY3d5UmQ0dkJOeHg4eHl4Mgo1S0QyTUIwR0ExVWRFUVFXTUJTQ0VtUnZZMnRsY2kxbWIzSXRaR1Z6YTNSdmNEQU5CZ2txaGtpRzl3MEJBUXNGCkFBT0NBUUVBZmQwQTdGUEtUZ28weWhxdlJOeUMwNmxKd1I2aUtYUURvQTRya2hDUUViaXVQQzVUb3RzbmF2OW4KTlFWWXh2N0FpUlhVN3p2Uk1OZ2kzZmRUbWJqRmtKRGZwODlJTjlRTytid1BYQ2U0VVRnL2tycXlVdCtjUGZoUwpBdmRtSlJKYndUbzRCbkJFeWlqYXFFWlkyamM5NjZmZWprU3NFaHREa2sybXZSV3ZGd3prbFFYRXZNdzE1bUNzCnB6Q0ZiSGUvbXZSWmJSbUo1RUxDQmhZcGlhYll3dFFqZkVRMHg5by9lSXdoZk55U2YzYVFZSmpqbnFmQjJYQUUKbHRsZjJaTG9qb3BpV2hCWmh1ckJDT0JOdFVSUHBKSHhnQXFrTVMrODdvalZSL1lLZDVoNDgvUHFPMkJBR1pjbwpQSVgwS1IyOTNNMlZGKzdqYll1bU1qdXhkTDdTVlE9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==\n    client-key-data: LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb3dJQkFBS0NBUUVBemtZeC9IbkhTV0FUVlc2Ri9idGFjTERWbW9TeXF3a0JycGZYaTU5cVo1N1IwaE5HCjl3NWZyMURZMTVZdVFXVmlNd2VUUkNMOHpRdEpVbERmWStTVDJaMVJCK09BVStaZ25lS3d4VTBiL25nOTJPcmMKcmZLLzdJT0N4d0RnRWxSTGo2elBCc2V2L1RwNUZQOW43bkRvaWRnaEd4ZmdmeW5KeUpVU0tWT3ZjbzRySDdDcApBaGtDQTRsTUNGRStPVUt2eE54N1BTMFA2dENXY1FqRm5qdkdLRDdlM2ZXZEFqSlVmdkdsbGh0MFgyNGFGTk9aCkRKMGR0bDk3WGczbEU1aDVsem1paVh4RWVCYVNUY3ora2E2Zm1DcExjbGhVaE4vdEhQNWc4Q2ZWQm1QK1FpVVcKa2hMc0hhWFBhWUVERnF0aXZMTWx2ZW5hU20zbFh0eTlDUjV1Z3dJREFRQUJBb0lCQUVNckIyYmp6cmw5Yi80LwpOYUY0U3d4c0FMcEdvSmxpSHVxWDVpZkFldGtRRmRuV3ppSnZ5MGVleDJWNE1VcTVOVDlScGFvbnpITUdURk5pCkkwUDNjQStLRXhORENRd0k5Z2dqZzVWVHRSeHBVaFphOEE0eWdEMkhXMlBxekl3Ylo5bDZsNVZwRzgwVko4MW4KRjVSRXJ1d0g5VXZKdkNBY1h1a1NaYTRRWW82bDE3SUxQR1E2QW8rM0JHbWl6S1BSekkzNTQ4MS9YMVhHczFUZQp6eVF4ZjJXOENVOEJFcnFMWkZpN0tVS1ZrR2pUNHpSWE05SzlzbGlXUis5WU15SFVQUGxJMWNLaGg2dmhOTzJVCkRjbmtnT2hIVEo2WnF5ZS92RDNheDJBQlludUhHaUsxdDFjWnRVa3B3S0FVSFZVT0xFSjJibWtuYnlDS3ZUaXAKcFlrVmVnVUNnWUVBOWhNbnRCL2s3N0FKNlRlUEJsamdJRFNDSTRwWXdKbFVjWVdza1Y0NGdaM2gxQUpScmR2NQpaNnhtc29TQkZQTjBYbU5NNUhjU2VXZHlLc20rU1hmVVRKb3FaRGpQRGI0c2VFZWxLN0IxWGpIRjg3NEhRNnB5ClFIS2Z2clg0MkhkWFlBSkV0ams5d0pFekN4R05zM3J4N2E0SVBweEtOQXVONXRUSCtQdXBHNThDZ1lFQTFwZ1UKTk9IdlJ2bEpkbXZKT2dLbStDVyswVVhuWVNMenY2MjBoOEVFQ00zRGUwSjlQbytyNXRwYnFWYXRqR0pNRmNyZQphWGRQdlpZZkh5d2tjTXp0WnZvTkJJTlI4MmZxM3lnSjFGVDVxcytvL2FKQ1g2cnhsUS8ybWhXb29EY0EvSEd5CmtDcEdsK2RkaE1YZlpJb0sxWW9Nd3ZISkdxWVhCRU04Q0VKR3dwMENnWUIyMVg5S0JGRUowMGltQUxlb1NBbE0KWkM4b3ZLbnBzT0pQeEU4M0VIcFhWZ2gxMnZ6WTZpOUNlc1pKbGFYRW1XRnNKNlk5ZXFkSVM4V2Rsam0zdncrZQpRcUVRTDBNR2p2MW94S2ltTlp3b2RmN3ptNlJrY0E2bXd2UVVKRXJkTnB6U2Q2WDVIaUdOT2xHZEdjZ0ZrZXo5CmJCcjlLWHJJTVlCQXBpZEFQVUJJWHdLQmdBdGZPY3Jub2pkL3BHMzdIa25OdEMxNFNwbHFlKzJBM2F2dHQ2QnUKRVJtcVZjNmxZbCs3VzErN2VKb0x0dHkycE5PTzBhU0RKeDJqNC9oUjdZaHd3Ni91Vmx4RDNVYnAzZDkvanEzSwo1d1F2UndSUjRmU1I2WVY5dUJMSVRReFlmZHZpNXBTUE9QaDUwVkhrN29hMGJnaU03VW96Wi9YYWtXT3ZjSEg3Cm1TWmRBb0dCQU1MU1JuODh4L3JMcCtxODNGcGhaUVNUbnJDVnczY2huUFJnWis3K1psVStOdEVqU1NzUTFSRFEKd0oxeDRWOThFdy9haEN2cDF3UzhPemlqUWRMdXJSZko0blZibjVOVzVVeUFiYWFieWV6ZGFhdE93WHVNV3pXbgpSblJJR3RsSFlwL1hzNnRXN1N6MmJrZHFwQWJxOWlrMndmYTVEUnl4Zyt0NmduQlc1SU5JCi0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg==', '', 'registry.cn-shanghai.aliyuncs.com/odboy/kenaito-cicd:system-alinux3', 0, 0, 'The timeout of 10000 ms has been exceeded when getting a connection to 127.0.0.1:6443');

-- ----------------------------
-- Table structure for k8s_pod_specs
-- ----------------------------
DROP TABLE IF EXISTS `k8s_pod_specs`;
CREATE TABLE `k8s_pod_specs`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `cpu_size` decimal(3, 3) NOT NULL COMMENT 'CPU核心数。毫核m',
  `memory_size` decimal(10, 0) NOT NULL COMMENT '内存数。单位Gi',
  `disk_size` decimal(10, 0) NOT NULL COMMENT '磁盘容量。单位Gi',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'K8s Pod 规格' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of k8s_pod_specs
-- ----------------------------

-- ----------------------------
-- Table structure for k8s_service
-- ----------------------------
DROP TABLE IF EXISTS `k8s_service`;
CREATE TABLE `k8s_service`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Service名称。命名规则：{appName}-svc',
  `namespace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '命名空间。上下文名称',
  `cluster_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '集群编码',
  `env_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '适用环境。daily、stage、production',
  `service_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Service类型。ClusterIP、NodePort',
  `service_port` int NOT NULL COMMENT '应用服务端口',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'K8s Service 负载均衡与服务发现' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of k8s_service
-- ----------------------------

-- ----------------------------
-- Table structure for pipeline_instance
-- ----------------------------
DROP TABLE IF EXISTS `pipeline_instance`;
CREATE TABLE `pipeline_instance`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `cluster_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '集群类型(host主机、k8s容器化)',
  `cluster_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '集群编码',
  `context_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '上下文类型',
  `context_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '上下文名称',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例状态(pending、running、failure、success)',
  `current_node_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '当前节点编码',
  `current_node_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '当前节点状态(pending、running、failure、success)',
  `context_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '存储完整的PipelineContext，包含所有节点的入参/出参',
  `node_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '存储完整节点定义数据',
  `force_close` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否强制停止(人为停止任务时为1)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流水线实例' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pipeline_instance
-- ----------------------------
INSERT INTO `pipeline_instance` VALUES ('d3c1ddaecf594fabb202f3a0586ec1fb', 'anonymous', '2026-05-01 11:33:44', '2026-05-01 11:33:44', 'k8s', 'local_k8s_28', 'deploy_app', 'kenaito-pilot', 'failure', 'node_build_java', 'running', '{\"clusterCode\":\"local_k8s_28\",\"clusterType\":\"k8s\",\"contextName\":\"kenaito-pilot\",\"contextType\":\"deploy_app\",\"data\":{\"job\":\"build\",\"version\":\"jdk11\",\"tags\":\"java\"},\"interrupted\":true,\"taskId\":\"d3c1ddaecf594fabb202f3a0586ec1fb\"}', '[{\"code\":\"node_init\",\"name\":\"初始化\",\"retry\":false,\"type\":\"service\"},{\"code\":\"node_merge_branch\",\"name\":\"合并代码\",\"retry\":true,\"type\":\"service\"},{\"code\":\"node_build_java\",\"name\":\"构建\",\"parameters\":{\"job\":\"build\",\"version\":\"jdk11\",\"tags\":\"java\"},\"retry\":true,\"type\":\"service\"},{\"code\":\"node_deploy_java\",\"name\":\"部署\",\"retry\":true,\"type\":\"service\"}]', 1);

-- ----------------------------
-- Table structure for pipeline_instance_node
-- ----------------------------
DROP TABLE IF EXISTS `pipeline_instance_node`;
CREATE TABLE `pipeline_instance_node`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `instance_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流水线实例id',
  `biz_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务编码',
  `biz_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务名称',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `execute_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行信息',
  `execute_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行状态(pending、running、failure、success)',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流水线实例节点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pipeline_instance_node
-- ----------------------------
INSERT INTO `pipeline_instance_node` VALUES ('2050056043878215681', 'd3c1ddaecf594fabb202f3a0586ec1fb', 'node_init', '初始化', '2026-05-01 11:33:44', '2026-05-01 11:33:44', '任务执行成功', 'success', '2026-05-01 11:33:44', '2026-05-01 11:33:44');
INSERT INTO `pipeline_instance_node` VALUES ('2050056043890798594', 'd3c1ddaecf594fabb202f3a0586ec1fb', 'node_merge_branch', '合并代码', '2026-05-01 11:33:44', '2026-05-01 11:33:44', '任务执行成功', 'success', '2026-05-01 11:33:44', '2026-05-01 11:33:44');
INSERT INTO `pipeline_instance_node` VALUES ('2050056043894992897', 'd3c1ddaecf594fabb202f3a0586ec1fb', 'node_build_java', '构建', '2026-05-01 11:33:44', NULL, '任务执行中', 'running', '2026-05-01 11:33:44', '2026-05-01 11:33:44');
INSERT INTO `pipeline_instance_node` VALUES ('2050056043899187202', 'd3c1ddaecf594fabb202f3a0586ec1fb', 'node_deploy_java', '部署', NULL, NULL, '任务待执行', 'pending', '2026-05-01 11:33:44', '2026-05-01 11:33:44');

-- ----------------------------
-- Table structure for pipeline_template
-- ----------------------------
DROP TABLE IF EXISTS `pipeline_template`;
CREATE TABLE `pipeline_template`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `pipeline_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流水线名称',
  `pipeline_env` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流水线环境(daily、stage、production)',
  `pipeline_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '适用类型(static、backend)',
  `pipeline_language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '适用语言(java、php、nodejs、go、python、dotnet、cplus、移动端等)',
  `template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模板内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流水线模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pipeline_template
-- ----------------------------
INSERT INTO `pipeline_template` VALUES ('1', 'admin', '2026-04-19 08:45:27', 'admin', '2026-04-19 08:45:33', '日常环境流水线(Java)', 'daily', 'deploy_app', 'java', '[{\"code\":\"node_init\",\"type\":\"service\",\"name\":\"初始化\",\"click\":\"true\",\"retry\":\"false\"},{\"code\":\"node_merge_branch\",\"type\":\"service\",\"name\":\"合并代码\",\"click\":\"true\",\"retry\":\"true\"},{\"code\":\"node_build_java\",\"type\":\"service\",\"name\":\"构建\",\"click\":\"true\",\"retry\":\"true\",\"detailType\":\"gitlab\",\"parameters\":{\"tags\":\"java\",\"job\":\"build\",\"version\":\"jdk11\"}},{\"code\":\"node_deploy_java\",\"type\":\"service\",\"name\":\"部署\",\"click\":\"true\",\"retry\":\"true\",\"buttons\":[{\"type\":\"link\",\"title\":\"查看部署详情\",\"code\":\"success\",\"parameters\":{\"isBlank\":\"true\"}}]}]');
INSERT INTO `pipeline_template` VALUES ('2', 'admin', '2026-04-19 08:48:17', 'admin', '2026-04-19 08:48:20', '预发环境流水线(Java)', 'stage', 'deploy_app', 'java', '[{\"code\":\"node_init\",\"type\":\"service\",\"name\":\"初始化\",\"click\":\"true\",\"retry\":\"false\"},{\"code\":\"node_merge_branch\",\"type\":\"service\",\"name\":\"合并代码\",\"click\":\"true\",\"retry\":\"true\"},{\"code\":\"node_build_java\",\"type\":\"service\",\"name\":\"构建\",\"click\":\"true\",\"retry\":\"true\",\"detailType\":\"gitlab\",\"parameters\":{\"tags\":\"java\",\"job\":\"build\",\"version\":\"jdk11\"}},{\"code\":\"node_deploy_java\",\"type\":\"service\",\"name\":\"部署\",\"click\":\"true\",\"retry\":\"true\",\"buttons\":[{\"type\":\"link\",\"title\":\"查看部署详情\",\"code\":\"success\",\"parameters\":{\"isBlank\":\"true\"}}]}]');
INSERT INTO `pipeline_template` VALUES ('3', 'admin', '2026-04-19 08:49:06', 'admin', '2026-04-19 08:49:10', '生产环境流水线(Java)', 'production', 'deploy_app', 'java', '[{\"code\":\"node_init\",\"type\":\"service\",\"name\":\"初始化\",\"click\":\"true\",\"retry\":\"false\"},{\"code\":\"node_merge_branch\",\"type\":\"service\",\"name\":\"合并代码\",\"click\":\"true\",\"retry\":\"true\"},{\"code\":\"node_build_java\",\"type\":\"service\",\"name\":\"构建\",\"click\":\"true\",\"retry\":\"true\",\"detailType\":\"gitlab\",\"parameters\":{\"tags\":\"java\",\"job\":\"build\",\"version\":\"jdk11\"}},{\"code\":\"node_image_scan\",\"type\":\"service\",\"name\":\"镜像扫描\",\"click\":\"true\",\"retry\":\"true\",\"detailType\":\"gitlab\",\"parameters\":{\"job\":\"image-scan\"}},{\"code\":\"node_approve_deploy\",\"type\":\"service\",\"name\":\"部署审批\",\"click\":\"false\",\"retry\":\"true\",\"buttons\":[{\"type\":\"execute\",\"title\":\"同意\",\"code\":\"agree\",\"parameters\":{}},{\"type\":\"execute\",\"title\":\"拒绝\",\"code\":\"refuse\",\"parameters\":{}}]},{\"code\":\"node_deploy_java\",\"type\":\"service\",\"name\":\"部署\",\"click\":\"true\",\"retry\":\"false\",\"buttons\":[{\"type\":\"link\",\"title\":\"查看部署详情\",\"code\":\"success\",\"parameters\":{\"isBlank\":\"true\"}}]},{\"code\":\"node_merge_confirm\",\"type\":\"service\",\"name\":\"合并确认\",\"click\":\"false\",\"retry\":\"false\",\"buttons\":[{\"type\":\"execute\",\"title\":\"通过\",\"code\":\"agree\",\"parameters\":{}}]},{\"code\":\"node_merge_master\",\"type\":\"service\",\"name\":\"合并回Master\",\"click\":\"false\",\"retry\":\"true\"}]');

-- ----------------------------
-- Table structure for pipeline_template_context
-- ----------------------------
DROP TABLE IF EXISTS `pipeline_template_context`;
CREATE TABLE `pipeline_template_context`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `cluster_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '集群类型(k8s、host)',
  `cluster_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '集群编码',
  `context_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '上下文类型(deploy_app、deploy_database等)',
  `context_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '上下文名称(应用名称、数据库类型，比如mysql等)',
  `template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流水线模板',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'pipeline上下文模版' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pipeline_template_context
-- ----------------------------
INSERT INTO `pipeline_template_context` VALUES ('1', 'admin', '2026-04-19 09:14:33', 'k8s', 'local_k8s_28', 'deploy_app', 'kenaito-pilot', '[{\"code\":\"node_init\",\"type\":\"service\",\"name\":\"初始化\",\"click\":\"true\",\"retry\":\"false\"},{\"code\":\"node_merge_branch\",\"type\":\"service\",\"name\":\"合并代码\",\"click\":\"true\",\"retry\":\"true\"},{\"code\":\"node_build_java\",\"type\":\"service\",\"name\":\"构建\",\"click\":\"true\",\"retry\":\"true\",\"detailType\":\"gitlab\",\"parameters\":{\"tags\":\"java\",\"job\":\"build\",\"version\":\"jdk11\"}},{\"code\":\"node_deploy_java\",\"type\":\"service\",\"name\":\"部署\",\"click\":\"true\",\"retry\":\"true\",\"buttons\":[{\"type\":\"link\",\"title\":\"查看部署详情\",\"code\":\"success\",\"parameters\":{\"isBlank\":\"true\"}}]}]');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `trigger_name` ASC, `trigger_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cron_expression` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fired_time` bigint NOT NULL,
  `sched_time` bigint NOT NULL,
  `priority` int NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE,
  INDEX `idx_qrtz_ft_trig_inst_name`(`sched_name` ASC, `instance_name` ASC) USING BTREE,
  INDEX `idx_qrtz_ft_inst_job_req_rcvry`(`sched_name` ASC, `instance_name` ASC, `requests_recovery` ASC) USING BTREE,
  INDEX `idx_qrtz_ft_j_g`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  INDEX `idx_qrtz_ft_jg`(`sched_name` ASC, `job_group` ASC) USING BTREE,
  INDEX `idx_qrtz_ft_t_g`(`sched_name` ASC, `trigger_name` ASC, `trigger_group` ASC) USING BTREE,
  INDEX `idx_qrtz_ft_tg`(`sched_name` ASC, `trigger_group` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE,
  INDEX `idx_qrtz_j_req_recovery`(`sched_name` ASC, `requests_recovery` ASC) USING BTREE,
  INDEX `idx_qrtz_j_grp`(`sched_name` ASC, `job_group` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('cutejava', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('cutejava', 'TRIGGER_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('KenaitoPilotScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('KenaitoPilotScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_checkin_time` bigint NOT NULL,
  `checkin_interval` bigint NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('ClusteredScheduler', 'DESKTOP-FM44BLS1742558233429', 1742558255052, 20000);
INSERT INTO `qrtz_scheduler_state` VALUES ('cutejava', 'iodboy.local1769415963994', 1769415965913, 10000);
INSERT INTO `qrtz_scheduler_state` VALUES ('KenaitoPilotScheduler', 'DESKTOP-FM44BLS1777606413385', 1777606441675, 5000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `repeat_count` bigint NOT NULL,
  `repeat_interval` bigint NOT NULL,
  `times_triggered` bigint NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `int_prop_1` int NULL DEFAULT NULL,
  `int_prop_2` int NULL DEFAULT NULL,
  `long_prop_1` bigint NULL DEFAULT NULL,
  `long_prop_2` bigint NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `next_fire_time` bigint NULL DEFAULT NULL,
  `prev_fire_time` bigint NULL DEFAULT NULL,
  `priority` int NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_time` bigint NOT NULL,
  `end_time` bigint NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `misfire_instr` smallint NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `idx_qrtz_t_j`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  INDEX `idx_qrtz_t_jg`(`sched_name` ASC, `job_group` ASC) USING BTREE,
  INDEX `idx_qrtz_t_c`(`sched_name` ASC, `calendar_name` ASC) USING BTREE,
  INDEX `idx_qrtz_t_g`(`sched_name` ASC, `trigger_group` ASC) USING BTREE,
  INDEX `idx_qrtz_t_state`(`sched_name` ASC, `trigger_state` ASC) USING BTREE,
  INDEX `idx_qrtz_t_n_state`(`sched_name` ASC, `trigger_name` ASC, `trigger_group` ASC, `trigger_state` ASC) USING BTREE,
  INDEX `idx_qrtz_t_n_g_state`(`sched_name` ASC, `trigger_group` ASC, `trigger_state` ASC) USING BTREE,
  INDEX `idx_qrtz_t_next_fire_time`(`sched_name` ASC, `next_fire_time` ASC) USING BTREE,
  INDEX `idx_qrtz_t_nft_st`(`sched_name` ASC, `trigger_state` ASC, `next_fire_time` ASC) USING BTREE,
  INDEX `idx_qrtz_t_nft_misfire`(`sched_name` ASC, `misfire_instr` ASC, `next_fire_time` ASC) USING BTREE,
  INDEX `idx_qrtz_t_nft_st_misfire`(`sched_name` ASC, `misfire_instr` ASC, `next_fire_time` ASC, `trigger_state` ASC) USING BTREE,
  INDEX `idx_qrtz_t_nft_st_misfire_grp`(`sched_name` ASC, `misfire_instr` ASC, `next_fire_time` ASC, `trigger_group` ASC, `trigger_state` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_dept`;
CREATE TABLE `system_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint NULL DEFAULT NULL COMMENT '上级部门',
  `sub_count` int NULL DEFAULT 0 COMMENT '子部门数目',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `dept_sort` int NULL DEFAULT 999 COMMENT '排序',
  `enabled` bit(1) NOT NULL COMMENT '状态',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  INDEX `idx_pid`(`pid` ASC) USING BTREE,
  INDEX `idx_enabled`(`enabled` ASC) USING BTREE,
  INDEX `idx_sys_dept_dept_id`(`dept_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dept
-- ----------------------------
INSERT INTO `system_dept` VALUES (2, 7, 1, '研发部', 3, b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dept` VALUES (5, 7, 0, '运维部', 4, b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dept` VALUES (6, 8, 0, '测试部', 6, b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dept` VALUES (7, NULL, 2, '华南分部', 0, b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dept` VALUES (8, NULL, 2, '华北分部', 1, b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dept` VALUES (15, 8, 0, 'UI部门', 7, b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dept` VALUES (17, 2, 0, '研发一组', 999, b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');

-- ----------------------------
-- Table structure for system_dict
-- ----------------------------
DROP TABLE IF EXISTS `system_dict`;
CREATE TABLE `system_dict`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dict
-- ----------------------------
INSERT INTO `system_dict` VALUES (1, 'user_status', '用户状态', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict` VALUES (4, 'dept_status', '部门状态', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict` VALUES (5, 'job_status', '岗位状态', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict` VALUES (8, 'test_status', '测试状态', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');

-- ----------------------------
-- Table structure for system_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_detail`;
CREATE TABLE `system_dict_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_id` bigint NULL DEFAULT NULL COMMENT '字典id',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典标签',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典值',
  `dict_sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dict_id`(`dict_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据字典详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dict_detail
-- ----------------------------
INSERT INTO `system_dict_detail` VALUES (1, 1, '激活', 'true', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (2, 1, '禁用', 'false', 2, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (3, 4, '启用', 'true', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (4, 4, '停用', 'false', 2, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (5, 5, '启用', 'true', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (6, 5, '停用', 'false', 2, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (7, 8, '打瞌睡01', 'ks01', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (8, 8, '打瞌睡2', 'ks02', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (9, 8, '打瞌睡3', 'ks03', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (10, 8, '打瞌睡4', 'ks04', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (11, 8, '打瞌睡5', 'ks05', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (12, 8, '打瞌睡6', 'ks06', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (13, 8, '打瞌睡7', 'ks07', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (14, 8, '打瞌睡8', 'ks08', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (16, 8, '打瞌睡10', 'ks10', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (18, 8, '打瞌睡12', 'ks12', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (19, 8, '打瞌睡13', 'ks13', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (20, 8, '打瞌睡14', 'ks14', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (21, 8, '打瞌睡15', 'ks15', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (22, 8, '打瞌睡16', 'ks16', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (23, 8, '打瞌睡17', 'ks17', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (24, 8, '打瞌睡18', 'ks18', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (25, 8, '打瞌睡19', 'ks19', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (26, 8, '打瞌睡20', 'ks20', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (27, 8, '打瞌睡21', 'ks21', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` VALUES (28, 8, '打瞌睡22', 'ks22', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');

-- ----------------------------
-- Table structure for system_email_config
-- ----------------------------
DROP TABLE IF EXISTS `system_email_config`;
CREATE TABLE `system_email_config`  (
  `config_id` bigint NOT NULL COMMENT 'ID',
  `from_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `port` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '端口',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '邮箱配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_email_config
-- ----------------------------

-- ----------------------------
-- Table structure for system_job
-- ----------------------------
DROP TABLE IF EXISTS `system_job`;
CREATE TABLE `system_job`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `enabled` bit(1) NOT NULL COMMENT '岗位状态',
  `job_sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name` ASC) USING BTREE,
  INDEX `idx_enabled`(`enabled` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_job
-- ----------------------------
INSERT INTO `system_job` VALUES (8, '人事专员', b'1', 3, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_job` VALUES (10, '产品经理', b'1', 4, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_job` VALUES (11, '全栈开发', b'1', 2, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_job` VALUES (12, '软件测试', b'1', 5, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');

-- ----------------------------
-- Table structure for system_local_storage
-- ----------------------------
DROP TABLE IF EXISTS `system_local_storage`;
CREATE TABLE `system_local_storage`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件真实的名称',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件名',
  `suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '后缀',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路径',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型',
  `size` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '大小',
  `date_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日期分组',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '本地存储' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_local_storage
-- ----------------------------

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint NULL DEFAULT NULL COMMENT '上级菜单ID',
  `sub_count` int NULL DEFAULT 0 COMMENT '子菜单数目',
  `type` int NULL DEFAULT NULL COMMENT '菜单类型',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单标题',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件名称',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件',
  `menu_sort` int NULL DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '链接地址',
  `i_frame` bit(1) NULL DEFAULT NULL COMMENT '是否外链',
  `cache` bit(1) NULL DEFAULT b'0' COMMENT '缓存',
  `hidden` bit(1) NULL DEFAULT b'0' COMMENT '隐藏',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name` ASC) USING BTREE,
  UNIQUE INDEX `uniq_title`(`title` ASC) USING BTREE,
  INDEX `idx_pid`(`pid` ASC) USING BTREE,
  INDEX `idx_sys_menu_menu_id`(`menu_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES (1, NULL, 9, 0, '系统管理', NULL, NULL, 10, 'system', 'system', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (2, 1, 3, 1, '用户管理', 'User', 'system/user/index', 2, 'peoples', 'user', b'0', b'0', b'0', 'user:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (3, 1, 3, 1, '角色管理', 'Role', 'system/role/index', 3, 'role', 'role', b'0', b'0', b'0', 'roles:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (5, 1, 3, 1, '菜单管理', 'Menu', 'system/menu/index', 5, 'menu', 'menu', b'0', b'0', b'0', 'menu:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (6, 1, 3, 0, '系统监控', NULL, NULL, 11, 'monitor', 'monitor', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (9, 6, 0, 1, 'SQL监控', 'DruidSqlConsole', 'system/druidSql/index', 18, 'sqlMonitor', 'druid-console', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (14, 36, 0, 1, '邮件工具', 'Email', 'system/email/index', 35, 'email', 'email', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (18, 36, 3, 1, '存储管理', 'Storage', 'system/storage/index', 34, 'qiniu', 'storage', b'0', b'0', b'0', 'storage:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (21, NULL, 2, 0, '演示:多级菜单', NULL, '', 999, 'document', 'nested', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (22, 21, 2, 0, '二级菜单1', NULL, '', 999, 'menu', 'menu1', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (23, 21, 0, 1, '二级菜单2', NULL, 'nested/menu2/index', 999, 'menu', 'menu2', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (24, 22, 0, 1, '三级菜单1', 'Test', 'nested/menu1/menu1-1', 999, 'menu', 'menu1-1', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (27, 22, 0, 1, '三级菜单2', NULL, 'nested/menu1/menu1-2', 999, 'menu', 'menu1-2', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (28, 1, 3, 1, '任务调度', 'QuartzJob', 'system/quartzJob/index', 9, 'timing', 'quartz-job', b'0', b'0', b'0', 'quartzJob:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (35, 1, 3, 1, '部门管理', 'Dept', 'system/dept/index', 6, 'dept', 'dept', b'0', b'0', b'0', 'dept:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (36, 1, 2, 0, '系统工具', NULL, '', 10, 'sys-tools', 'sys-tools', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (37, 1, 3, 1, '岗位管理', 'Job', 'system/job/index', 7, 'Steve-Jobs', 'job', b'0', b'0', b'0', 'job:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (39, 1, 3, 1, '字典管理', 'Dict', 'system/dict/index', 8, 'dictionary', 'dict', b'0', b'0', b'0', 'dict:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (41, 6, 0, 1, '在线用户', 'OnlineUser', 'system/online/index', 10, 'Steve-Jobs', 'online', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (44, 2, 0, 2, '用户新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'user:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (45, 2, 0, 2, '用户编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'user:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (46, 2, 0, 2, '用户删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'user:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (48, 3, 0, 2, '角色创建', NULL, '', 2, '', '', b'0', b'0', b'0', 'roles:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (49, 3, 0, 2, '角色修改', NULL, '', 3, '', '', b'0', b'0', b'0', 'roles:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (50, 3, 0, 2, '角色删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'roles:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (52, 5, 0, 2, '菜单新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'menu:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (53, 5, 0, 2, '菜单编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'menu:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (54, 5, 0, 2, '菜单删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'menu:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (56, 35, 0, 2, '部门新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'dept:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (57, 35, 0, 2, '部门编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'dept:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (58, 35, 0, 2, '部门删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'dept:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (60, 37, 0, 2, '岗位新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'job:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (61, 37, 0, 2, '岗位编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'job:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (62, 37, 0, 2, '岗位删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'job:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (64, 39, 0, 2, '字典新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'dict:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (65, 39, 0, 2, '字典编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'dict:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (66, 39, 0, 2, '字典删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'dict:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (73, 28, 0, 2, '任务新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'quartzJob:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (74, 28, 0, 2, '任务编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'quartzJob:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (75, 28, 0, 2, '任务删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'quartzJob:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (77, 18, 0, 2, '上传文件', NULL, '', 2, '', '', b'0', b'0', b'0', 'storage:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (78, 18, 0, 2, '文件编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'storage:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (79, 18, 0, 2, '文件删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'storage:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (80, 6, 0, 1, '服务监控', 'ServerMonitor', 'system/server/index', 14, 'codeConsole', 'server', b'0', b'0', b'0', 'monitor:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (159, NULL, 5, 0, '系统组件', NULL, NULL, 12, 'crm', 'syscom', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (160, 159, 0, 1, '基础组件', 'ComponentsDemoDev', 'componentsDemo/dev/index', 1, 'crm', 'dev', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (161, 159, 0, 1, '快捷组件', 'ComponentsDemoUtil', 'componentsDemo/util/index', 2, 'crm', 'util', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (162, 159, 0, 1, '业务组件', 'ComponentsDemoBusiness', 'componentsDemo/business/index', 3, 'crm', 'business', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (163, 159, 0, 1, '高级组件', 'ComponentsDemoAdvanced', 'componentsDemo/advanced/index', 4, 'crm', 'advanced', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` VALUES (164, 159, 0, 1, '流水线组件', 'ComponentsDemoPipeline', 'componentsDemo/pipeline/index', 5, 'crm', 'pipeline', b'0', b'0', b'0', NULL, 'admin', 'admin', '2026-03-06 20:06:09', '2026-03-06 20:09:22');

-- ----------------------------
-- Table structure for system_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `system_operation_log`;
CREATE TABLE `system_operation_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `biz_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `request_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `execute_time` bigint NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `browser_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `exception_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '审计日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_oss_storage
-- ----------------------------
DROP TABLE IF EXISTS `system_oss_storage`;
CREATE TABLE `system_oss_storage`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `service_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型，比如minio',
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务地址',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储桶名称',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '完整文件名称',
  `file_size` bigint NULL DEFAULT NULL COMMENT '文件大小, 单位：字节',
  `file_mime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件类型',
  `file_prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '短文件名',
  `file_suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `file_md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件md5',
  `file_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文件链接',
  `file_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件编码',
  `object_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '对象路径',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `udx_filemd5`(`file_md5` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'OSS存储' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_oss_storage
-- ----------------------------

-- ----------------------------
-- Table structure for system_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `system_quartz_job`;
CREATE TABLE `system_quartz_job`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Spring Bean名称',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'cron 表达式',
  `is_pause` bit(1) NULL DEFAULT NULL COMMENT '状态：1暂停、0启用',
  `job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `person_in_charge` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '报警邮箱',
  `sub_task` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子任务ID',
  `pause_after_failure` bit(1) NULL DEFAULT NULL COMMENT '任务失败后是否暂停',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_is_pause`(`is_pause` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_quartz_job
-- ----------------------------
INSERT INTO `system_quartz_job` VALUES (2, 'testTask', '0/5 * * * * ?', b'1', '测试1', 'run1', 'test', '带参测试，多参使用json', '测试', NULL, NULL, NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_quartz_job` VALUES (3, 'testTask', '0/5 * * * * ?', b'1', '测试', 'run', '', '不带参测试', '测试', '', '6', b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');

-- ----------------------------
-- Table structure for system_quartz_log
-- ----------------------------
DROP TABLE IF EXISTS `system_quartz_log`;
CREATE TABLE `system_quartz_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Bean名称',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'cron 表达式',
  `is_success` bit(1) NULL DEFAULT NULL COMMENT '是否执行成功',
  `job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
  `time` bigint NULL DEFAULT NULL COMMENT '执行耗时',
  `exception_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '异常详情',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_quartz_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `level` int NULL DEFAULT NULL COMMENT '角色级别',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `data_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据权限',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name` ASC) USING BTREE,
  INDEX `idx_level`(`level` ASC) USING BTREE,
  INDEX `idx_sys_role_level`(`level` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES (1, '超级管理员', 1, '6666', '全部', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_role` VALUES (2, '普通用户', 2, '-', '本级', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');

-- ----------------------------
-- Table structure for system_roles_depts
-- ----------------------------
DROP TABLE IF EXISTS `system_roles_depts`;
CREATE TABLE `system_roles_depts`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_dept_id`(`dept_id` ASC) USING BTREE,
  INDEX `idx_sys_roles_depts_role_dept`(`role_id` ASC, `dept_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色部门关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_roles_depts
-- ----------------------------

-- ----------------------------
-- Table structure for system_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `system_roles_menus`;
CREATE TABLE `system_roles_menus`  (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`, `role_id`) USING BTREE,
  INDEX `idx_menu_id`(`menu_id` ASC) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_sys_roles_menus_role_menu`(`role_id` ASC, `menu_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色菜单关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_roles_menus
-- ----------------------------
INSERT INTO `system_roles_menus` VALUES (1, 1);
INSERT INTO `system_roles_menus` VALUES (2, 1);
INSERT INTO `system_roles_menus` VALUES (3, 1);
INSERT INTO `system_roles_menus` VALUES (5, 1);
INSERT INTO `system_roles_menus` VALUES (6, 1);
INSERT INTO `system_roles_menus` VALUES (9, 1);
INSERT INTO `system_roles_menus` VALUES (14, 1);
INSERT INTO `system_roles_menus` VALUES (18, 1);
INSERT INTO `system_roles_menus` VALUES (21, 1);
INSERT INTO `system_roles_menus` VALUES (21, 2);
INSERT INTO `system_roles_menus` VALUES (22, 1);
INSERT INTO `system_roles_menus` VALUES (23, 1);
INSERT INTO `system_roles_menus` VALUES (24, 1);
INSERT INTO `system_roles_menus` VALUES (27, 1);
INSERT INTO `system_roles_menus` VALUES (28, 1);
INSERT INTO `system_roles_menus` VALUES (35, 1);
INSERT INTO `system_roles_menus` VALUES (36, 1);
INSERT INTO `system_roles_menus` VALUES (37, 1);
INSERT INTO `system_roles_menus` VALUES (39, 1);
INSERT INTO `system_roles_menus` VALUES (41, 1);
INSERT INTO `system_roles_menus` VALUES (44, 1);
INSERT INTO `system_roles_menus` VALUES (45, 1);
INSERT INTO `system_roles_menus` VALUES (46, 1);
INSERT INTO `system_roles_menus` VALUES (48, 1);
INSERT INTO `system_roles_menus` VALUES (49, 1);
INSERT INTO `system_roles_menus` VALUES (50, 1);
INSERT INTO `system_roles_menus` VALUES (52, 1);
INSERT INTO `system_roles_menus` VALUES (53, 1);
INSERT INTO `system_roles_menus` VALUES (54, 1);
INSERT INTO `system_roles_menus` VALUES (56, 1);
INSERT INTO `system_roles_menus` VALUES (57, 1);
INSERT INTO `system_roles_menus` VALUES (58, 1);
INSERT INTO `system_roles_menus` VALUES (60, 1);
INSERT INTO `system_roles_menus` VALUES (61, 1);
INSERT INTO `system_roles_menus` VALUES (62, 1);
INSERT INTO `system_roles_menus` VALUES (64, 1);
INSERT INTO `system_roles_menus` VALUES (65, 1);
INSERT INTO `system_roles_menus` VALUES (66, 1);
INSERT INTO `system_roles_menus` VALUES (73, 1);
INSERT INTO `system_roles_menus` VALUES (74, 1);
INSERT INTO `system_roles_menus` VALUES (75, 1);
INSERT INTO `system_roles_menus` VALUES (77, 1);
INSERT INTO `system_roles_menus` VALUES (78, 1);
INSERT INTO `system_roles_menus` VALUES (79, 1);
INSERT INTO `system_roles_menus` VALUES (80, 1);
INSERT INTO `system_roles_menus` VALUES (159, 1);
INSERT INTO `system_roles_menus` VALUES (160, 1);
INSERT INTO `system_roles_menus` VALUES (161, 1);
INSERT INTO `system_roles_menus` VALUES (162, 1);
INSERT INTO `system_roles_menus` VALUES (163, 1);
INSERT INTO `system_roles_menus` VALUES (164, 1);

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门名称',
  `username` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
  `gender` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号码',
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `avatar_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像地址',
  `avatar_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像真实路径',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `is_admin` bit(1) NULL DEFAULT b'0' COMMENT '是否为admin账号',
  `enabled` bit(1) NULL DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `pwd_reset_time` datetime NULL DEFAULT NULL COMMENT '修改密码的时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `uniq_email`(`email` ASC) USING BTREE,
  UNIQUE INDEX `uniq_username`(`username` ASC) USING BTREE,
  INDEX `idx_dept_id`(`dept_id` ASC) USING BTREE,
  INDEX `idx_enabled`(`enabled` ASC) USING BTREE,
  INDEX `uniq_phone`(`phone` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES (1, 2, 'admin', '管理员', '男', '18888888888', '1943815081@qq.com', '', '', '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'1', b'1', 'admin', 'admin', '2020-05-03 16:38:31', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (5, 2, 'odboy101', 'odboy101测试用户', '男', '18797874101', '1943815101@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (6, 2, 'odboy102', 'odboy102测试用户', '男', '18797874102', '1943815102@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (7, 2, 'odboy103', 'odboy103测试用户', '男', '18797874103', '1943815103@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (8, 2, 'odboy104', 'odboy104测试用户', '男', '18797874104', '1943815104@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (9, 2, 'odboy105', 'odboy105测试用户', '男', '18797874105', '1943815105@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (10, 2, 'odboy106', 'odboy106测试用户', '男', '18797874106', '1943815106@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (11, 2, 'odboy107', 'odboy107测试用户', '男', '18797874107', '1943815107@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (12, 2, 'odboy108', 'odboy108测试用户', '男', '18797874108', '1943815108@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (13, 2, 'odboy109', 'odboy109测试用户', '男', '18797874109', '1943815109@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (14, 2, 'odboy110', 'odboy110测试用户', '男', '18797874110', '1943815110@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (15, 2, 'odboy111', 'odboy111测试用户', '男', '18797874111', '1943815111@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (16, 2, 'odboy112', 'odboy112测试用户', '男', '18797874112', '1943815112@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (17, 2, 'odboy113', 'odboy113测试用户', '男', '18797874113', '1943815113@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (18, 2, 'odboy114', 'odboy114测试用户', '男', '18797874114', '1943815114@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (19, 2, 'odboy115', 'odboy115测试用户', '男', '18797874115', '1943815115@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (20, 2, 'odboy116', 'odboy116测试用户', '男', '18797874116', '1943815116@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (21, 2, 'odboy117', 'odboy117测试用户', '男', '18797874117', '1943815117@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (22, 2, 'odboy118', 'odboy118测试用户', '男', '18797874118', '1943815118@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (23, 2, 'odboy119', 'odboy119测试用户', '男', '18797874119', '1943815119@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (24, 2, 'odboy120', 'odboy120测试用户', '男', '18797874120', '1943815120@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (25, 2, 'odboy121', 'odboy121测试用户', '男', '18797874121', '1943815121@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (26, 2, 'odboy122', 'odboy122测试用户', '男', '18797874122', '1943815122@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (27, 2, 'odboy123', 'odboy123测试用户', '男', '18797874123', '1943815123@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (28, 2, 'odboy124', 'odboy124测试用户', '男', '18797874124', '1943815124@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (29, 2, 'odboy125', 'odboy125测试用户', '男', '18797874125', '1943815125@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (30, 2, 'odboy126', 'odboy126测试用户', '男', '18797874126', '1943815126@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (31, 2, 'odboy127', 'odboy127测试用户', '男', '18797874127', '1943815127@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (32, 2, 'odboy128', 'odboy128测试用户', '男', '18797874128', '1943815128@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (33, 2, 'odboy129', 'odboy129测试用户', '男', '18797874129', '1943815129@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (34, 2, 'odboy130', 'odboy130测试用户', '男', '18797874130', '1943815130@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (35, 2, 'odboy131', 'odboy131测试用户', '男', '18797874131', '1943815131@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (36, 2, 'odboy132', 'odboy132测试用户', '男', '18797874132', '1943815132@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (37, 2, 'odboy133', 'odboy133测试用户', '男', '18797874133', '1943815133@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (38, 2, 'odboy134', 'odboy134测试用户', '男', '18797874134', '1943815134@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (39, 2, 'odboy135', 'odboy135测试用户', '男', '18797874135', '1943815135@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (40, 2, 'odboy136', 'odboy136测试用户', '男', '18797874136', '1943815136@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (41, 2, 'odboy137', 'odboy137测试用户', '男', '18797874137', '1943815137@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (42, 2, 'odboy138', 'odboy138测试用户', '男', '18797874138', '1943815138@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (43, 2, 'odboy139', 'odboy139测试用户', '男', '18797874139', '1943815139@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (44, 2, 'odboy140', 'odboy140测试用户', '男', '18797874140', '1943815140@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (45, 2, 'odboy141', 'odboy141测试用户', '男', '18797874141', '1943815141@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (46, 2, 'odboy142', 'odboy142测试用户', '男', '18797874142', '1943815142@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (47, 2, 'odboy143', 'odboy143测试用户', '男', '18797874143', '1943815143@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (48, 2, 'odboy144', 'odboy144测试用户', '男', '18797874144', '1943815144@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (49, 2, 'odboy145', 'odboy145测试用户', '男', '18797874145', '1943815145@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (50, 2, 'odboy146', 'odboy146测试用户', '男', '18797874146', '1943815146@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (51, 2, 'odboy147', 'odboy147测试用户', '男', '18797874147', '1943815147@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (52, 2, 'odboy148', 'odboy148测试用户', '男', '18797874148', '1943815148@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (53, 2, 'odboy149', 'odboy149测试用户', '男', '18797874149', '1943815149@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (54, 2, 'odboy150', 'odboy150测试用户', '男', '18797874150', '1943815150@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (55, 2, 'odboy151', 'odboy151测试用户', '男', '18797874151', '1943815151@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (56, 2, 'odboy152', 'odboy152测试用户', '男', '18797874152', '1943815152@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (57, 2, 'odboy153', 'odboy153测试用户', '男', '18797874153', '1943815153@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (58, 2, 'odboy154', 'odboy154测试用户', '男', '18797874154', '1943815154@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (59, 2, 'odboy155', 'odboy155测试用户', '男', '18797874155', '1943815155@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (60, 2, 'odboy156', 'odboy156测试用户', '男', '18797874156', '1943815156@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (61, 2, 'odboy157', 'odboy157测试用户', '男', '18797874157', '1943815157@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (62, 2, 'odboy158', 'odboy158测试用户', '男', '18797874158', '1943815158@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (63, 2, 'odboy159', 'odboy159测试用户', '男', '18797874159', '1943815159@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (64, 2, 'odboy160', 'odboy160测试用户', '男', '18797874160', '1943815160@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (65, 2, 'odboy161', 'odboy161测试用户', '男', '18797874161', '1943815161@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (66, 2, 'odboy162', 'odboy162测试用户', '男', '18797874162', '1943815162@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (67, 2, 'odboy163', 'odboy163测试用户', '男', '18797874163', '1943815163@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (68, 2, 'odboy164', 'odboy164测试用户', '男', '18797874164', '1943815164@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (69, 2, 'odboy165', 'odboy165测试用户', '男', '18797874165', '1943815165@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (70, 2, 'odboy166', 'odboy166测试用户', '男', '18797874166', '1943815166@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (71, 2, 'odboy167', 'odboy167测试用户', '男', '18797874167', '1943815167@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (72, 2, 'odboy168', 'odboy168测试用户', '男', '18797874168', '1943815168@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (73, 2, 'odboy169', 'odboy169测试用户', '男', '18797874169', '1943815169@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (74, 2, 'odboy170', 'odboy170测试用户', '男', '18797874170', '1943815170@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (75, 2, 'odboy171', 'odboy171测试用户', '男', '18797874171', '1943815171@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (76, 2, 'odboy172', 'odboy172测试用户', '男', '18797874172', '1943815172@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (77, 2, 'odboy173', 'odboy173测试用户', '男', '18797874173', '1943815173@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (78, 2, 'odboy174', 'odboy174测试用户', '男', '18797874174', '1943815174@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (79, 2, 'odboy175', 'odboy175测试用户', '男', '18797874175', '1943815175@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (80, 2, 'odboy176', 'odboy176测试用户', '男', '18797874176', '1943815176@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (81, 2, 'odboy177', 'odboy177测试用户', '男', '18797874177', '1943815177@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (82, 2, 'odboy178', 'odboy178测试用户', '男', '18797874178', '1943815178@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (83, 2, 'odboy179', 'odboy179测试用户', '男', '18797874179', '1943815179@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (84, 2, 'odboy180', 'odboy180测试用户', '男', '18797874180', '1943815180@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (85, 2, 'odboy181', 'odboy181测试用户', '男', '18797874181', '1943815181@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (86, 2, 'odboy182', 'odboy182测试用户', '男', '18797874182', '1943815182@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (87, 2, 'odboy183', 'odboy183测试用户', '男', '18797874183', '1943815183@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (88, 2, 'odboy184', 'odboy184测试用户', '男', '18797874184', '1943815184@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (89, 2, 'odboy185', 'odboy185测试用户', '男', '18797874185', '1943815185@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (90, 2, 'odboy186', 'odboy186测试用户', '男', '18797874186', '1943815186@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (91, 2, 'odboy187', 'odboy187测试用户', '男', '18797874187', '1943815187@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (92, 2, 'odboy188', 'odboy188测试用户', '男', '18797874188', '1943815188@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (93, 2, 'odboy189', 'odboy189测试用户', '男', '18797874189', '1943815189@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (94, 2, 'odboy190', 'odboy190测试用户', '男', '18797874190', '1943815190@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (95, 2, 'odboy191', 'odboy191测试用户', '男', '18797874191', '1943815191@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (96, 2, 'odboy192', 'odboy192测试用户', '男', '18797874192', '1943815192@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (97, 2, 'odboy193', 'odboy193测试用户', '男', '18797874193', '1943815193@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (98, 2, 'odboy194', 'odboy194测试用户', '男', '18797874194', '1943815194@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (99, 2, 'odboy195', 'odboy195测试用户', '男', '18797874195', '1943815195@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (100, 2, 'odboy196', 'odboy196测试用户', '男', '18797874196', '1943815196@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (101, 2, 'odboy197', 'odboy197测试用户', '男', '18797874197', '1943815197@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (102, 2, 'odboy198', 'odboy198测试用户', '男', '18797874198', '1943815198@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` VALUES (103, 2, 'odboy199', 'odboy199测试用户', '男', '18797874199', '1943815199@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');

-- ----------------------------
-- Table structure for system_users_jobs
-- ----------------------------
DROP TABLE IF EXISTS `system_users_jobs`;
CREATE TABLE `system_users_jobs`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `job_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `job_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_job_id`(`job_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_users_jobs
-- ----------------------------
INSERT INTO `system_users_jobs` VALUES (1, 11);
INSERT INTO `system_users_jobs` VALUES (3, 11);
INSERT INTO `system_users_jobs` VALUES (5, 11);
INSERT INTO `system_users_jobs` VALUES (6, 11);
INSERT INTO `system_users_jobs` VALUES (7, 11);
INSERT INTO `system_users_jobs` VALUES (8, 11);
INSERT INTO `system_users_jobs` VALUES (9, 11);
INSERT INTO `system_users_jobs` VALUES (10, 11);
INSERT INTO `system_users_jobs` VALUES (11, 11);
INSERT INTO `system_users_jobs` VALUES (12, 11);
INSERT INTO `system_users_jobs` VALUES (13, 11);
INSERT INTO `system_users_jobs` VALUES (14, 11);
INSERT INTO `system_users_jobs` VALUES (15, 11);
INSERT INTO `system_users_jobs` VALUES (16, 11);
INSERT INTO `system_users_jobs` VALUES (17, 11);
INSERT INTO `system_users_jobs` VALUES (18, 11);
INSERT INTO `system_users_jobs` VALUES (19, 11);
INSERT INTO `system_users_jobs` VALUES (20, 11);
INSERT INTO `system_users_jobs` VALUES (21, 11);
INSERT INTO `system_users_jobs` VALUES (22, 11);
INSERT INTO `system_users_jobs` VALUES (23, 11);
INSERT INTO `system_users_jobs` VALUES (24, 11);
INSERT INTO `system_users_jobs` VALUES (25, 11);
INSERT INTO `system_users_jobs` VALUES (26, 11);
INSERT INTO `system_users_jobs` VALUES (27, 11);
INSERT INTO `system_users_jobs` VALUES (28, 11);
INSERT INTO `system_users_jobs` VALUES (29, 11);
INSERT INTO `system_users_jobs` VALUES (30, 11);
INSERT INTO `system_users_jobs` VALUES (31, 11);
INSERT INTO `system_users_jobs` VALUES (32, 11);
INSERT INTO `system_users_jobs` VALUES (33, 11);
INSERT INTO `system_users_jobs` VALUES (34, 11);
INSERT INTO `system_users_jobs` VALUES (35, 11);
INSERT INTO `system_users_jobs` VALUES (36, 11);
INSERT INTO `system_users_jobs` VALUES (37, 11);
INSERT INTO `system_users_jobs` VALUES (38, 11);
INSERT INTO `system_users_jobs` VALUES (39, 11);
INSERT INTO `system_users_jobs` VALUES (40, 11);
INSERT INTO `system_users_jobs` VALUES (41, 11);
INSERT INTO `system_users_jobs` VALUES (42, 11);
INSERT INTO `system_users_jobs` VALUES (43, 11);
INSERT INTO `system_users_jobs` VALUES (44, 11);
INSERT INTO `system_users_jobs` VALUES (45, 11);
INSERT INTO `system_users_jobs` VALUES (46, 11);
INSERT INTO `system_users_jobs` VALUES (47, 11);
INSERT INTO `system_users_jobs` VALUES (48, 11);
INSERT INTO `system_users_jobs` VALUES (49, 11);
INSERT INTO `system_users_jobs` VALUES (50, 11);
INSERT INTO `system_users_jobs` VALUES (51, 11);
INSERT INTO `system_users_jobs` VALUES (52, 11);
INSERT INTO `system_users_jobs` VALUES (53, 11);
INSERT INTO `system_users_jobs` VALUES (54, 11);
INSERT INTO `system_users_jobs` VALUES (55, 11);
INSERT INTO `system_users_jobs` VALUES (56, 11);
INSERT INTO `system_users_jobs` VALUES (57, 11);
INSERT INTO `system_users_jobs` VALUES (58, 11);
INSERT INTO `system_users_jobs` VALUES (59, 11);
INSERT INTO `system_users_jobs` VALUES (60, 11);
INSERT INTO `system_users_jobs` VALUES (61, 11);
INSERT INTO `system_users_jobs` VALUES (62, 11);
INSERT INTO `system_users_jobs` VALUES (63, 11);
INSERT INTO `system_users_jobs` VALUES (64, 11);
INSERT INTO `system_users_jobs` VALUES (65, 11);
INSERT INTO `system_users_jobs` VALUES (66, 11);
INSERT INTO `system_users_jobs` VALUES (67, 11);
INSERT INTO `system_users_jobs` VALUES (68, 11);
INSERT INTO `system_users_jobs` VALUES (69, 11);
INSERT INTO `system_users_jobs` VALUES (70, 11);
INSERT INTO `system_users_jobs` VALUES (71, 11);
INSERT INTO `system_users_jobs` VALUES (72, 11);
INSERT INTO `system_users_jobs` VALUES (73, 11);
INSERT INTO `system_users_jobs` VALUES (74, 11);
INSERT INTO `system_users_jobs` VALUES (75, 11);
INSERT INTO `system_users_jobs` VALUES (76, 11);
INSERT INTO `system_users_jobs` VALUES (77, 11);
INSERT INTO `system_users_jobs` VALUES (78, 11);
INSERT INTO `system_users_jobs` VALUES (79, 11);
INSERT INTO `system_users_jobs` VALUES (80, 11);
INSERT INTO `system_users_jobs` VALUES (81, 11);
INSERT INTO `system_users_jobs` VALUES (82, 11);
INSERT INTO `system_users_jobs` VALUES (83, 11);
INSERT INTO `system_users_jobs` VALUES (84, 11);
INSERT INTO `system_users_jobs` VALUES (85, 11);
INSERT INTO `system_users_jobs` VALUES (86, 11);
INSERT INTO `system_users_jobs` VALUES (87, 11);
INSERT INTO `system_users_jobs` VALUES (88, 11);
INSERT INTO `system_users_jobs` VALUES (89, 11);
INSERT INTO `system_users_jobs` VALUES (90, 11);
INSERT INTO `system_users_jobs` VALUES (91, 11);
INSERT INTO `system_users_jobs` VALUES (92, 11);
INSERT INTO `system_users_jobs` VALUES (93, 11);
INSERT INTO `system_users_jobs` VALUES (94, 11);
INSERT INTO `system_users_jobs` VALUES (95, 11);
INSERT INTO `system_users_jobs` VALUES (96, 11);
INSERT INTO `system_users_jobs` VALUES (97, 11);
INSERT INTO `system_users_jobs` VALUES (98, 11);
INSERT INTO `system_users_jobs` VALUES (99, 11);
INSERT INTO `system_users_jobs` VALUES (100, 11);
INSERT INTO `system_users_jobs` VALUES (101, 11);
INSERT INTO `system_users_jobs` VALUES (102, 11);
INSERT INTO `system_users_jobs` VALUES (103, 11);

-- ----------------------------
-- Table structure for system_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `system_users_roles`;
CREATE TABLE `system_users_roles`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户角色关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_users_roles
-- ----------------------------
INSERT INTO `system_users_roles` VALUES (1, 1);
INSERT INTO `system_users_roles` VALUES (3, 2);
INSERT INTO `system_users_roles` VALUES (5, 2);
INSERT INTO `system_users_roles` VALUES (6, 2);
INSERT INTO `system_users_roles` VALUES (7, 2);
INSERT INTO `system_users_roles` VALUES (8, 2);
INSERT INTO `system_users_roles` VALUES (9, 2);
INSERT INTO `system_users_roles` VALUES (10, 2);
INSERT INTO `system_users_roles` VALUES (11, 2);
INSERT INTO `system_users_roles` VALUES (12, 2);
INSERT INTO `system_users_roles` VALUES (13, 2);
INSERT INTO `system_users_roles` VALUES (14, 2);
INSERT INTO `system_users_roles` VALUES (15, 2);
INSERT INTO `system_users_roles` VALUES (16, 2);
INSERT INTO `system_users_roles` VALUES (17, 2);
INSERT INTO `system_users_roles` VALUES (18, 2);
INSERT INTO `system_users_roles` VALUES (19, 2);
INSERT INTO `system_users_roles` VALUES (20, 2);
INSERT INTO `system_users_roles` VALUES (21, 2);
INSERT INTO `system_users_roles` VALUES (22, 2);
INSERT INTO `system_users_roles` VALUES (23, 2);
INSERT INTO `system_users_roles` VALUES (24, 2);
INSERT INTO `system_users_roles` VALUES (25, 2);
INSERT INTO `system_users_roles` VALUES (26, 2);
INSERT INTO `system_users_roles` VALUES (27, 2);
INSERT INTO `system_users_roles` VALUES (28, 2);
INSERT INTO `system_users_roles` VALUES (29, 2);
INSERT INTO `system_users_roles` VALUES (30, 2);
INSERT INTO `system_users_roles` VALUES (31, 2);
INSERT INTO `system_users_roles` VALUES (32, 2);
INSERT INTO `system_users_roles` VALUES (33, 2);
INSERT INTO `system_users_roles` VALUES (34, 2);
INSERT INTO `system_users_roles` VALUES (35, 2);
INSERT INTO `system_users_roles` VALUES (36, 2);
INSERT INTO `system_users_roles` VALUES (37, 2);
INSERT INTO `system_users_roles` VALUES (38, 2);
INSERT INTO `system_users_roles` VALUES (39, 2);
INSERT INTO `system_users_roles` VALUES (40, 2);
INSERT INTO `system_users_roles` VALUES (41, 2);
INSERT INTO `system_users_roles` VALUES (42, 2);
INSERT INTO `system_users_roles` VALUES (43, 2);
INSERT INTO `system_users_roles` VALUES (44, 2);
INSERT INTO `system_users_roles` VALUES (45, 2);
INSERT INTO `system_users_roles` VALUES (46, 2);
INSERT INTO `system_users_roles` VALUES (47, 2);
INSERT INTO `system_users_roles` VALUES (48, 2);
INSERT INTO `system_users_roles` VALUES (49, 2);
INSERT INTO `system_users_roles` VALUES (50, 2);
INSERT INTO `system_users_roles` VALUES (51, 2);
INSERT INTO `system_users_roles` VALUES (52, 2);
INSERT INTO `system_users_roles` VALUES (53, 2);
INSERT INTO `system_users_roles` VALUES (54, 2);
INSERT INTO `system_users_roles` VALUES (55, 2);
INSERT INTO `system_users_roles` VALUES (56, 2);
INSERT INTO `system_users_roles` VALUES (57, 2);
INSERT INTO `system_users_roles` VALUES (58, 2);
INSERT INTO `system_users_roles` VALUES (59, 2);
INSERT INTO `system_users_roles` VALUES (60, 2);
INSERT INTO `system_users_roles` VALUES (61, 2);
INSERT INTO `system_users_roles` VALUES (62, 2);
INSERT INTO `system_users_roles` VALUES (63, 2);
INSERT INTO `system_users_roles` VALUES (64, 2);
INSERT INTO `system_users_roles` VALUES (65, 2);
INSERT INTO `system_users_roles` VALUES (66, 2);
INSERT INTO `system_users_roles` VALUES (67, 2);
INSERT INTO `system_users_roles` VALUES (68, 2);
INSERT INTO `system_users_roles` VALUES (69, 2);
INSERT INTO `system_users_roles` VALUES (70, 2);
INSERT INTO `system_users_roles` VALUES (71, 2);
INSERT INTO `system_users_roles` VALUES (72, 2);
INSERT INTO `system_users_roles` VALUES (73, 2);
INSERT INTO `system_users_roles` VALUES (74, 2);
INSERT INTO `system_users_roles` VALUES (75, 2);
INSERT INTO `system_users_roles` VALUES (76, 2);
INSERT INTO `system_users_roles` VALUES (77, 2);
INSERT INTO `system_users_roles` VALUES (78, 2);
INSERT INTO `system_users_roles` VALUES (79, 2);
INSERT INTO `system_users_roles` VALUES (80, 2);
INSERT INTO `system_users_roles` VALUES (81, 2);
INSERT INTO `system_users_roles` VALUES (82, 2);
INSERT INTO `system_users_roles` VALUES (83, 2);
INSERT INTO `system_users_roles` VALUES (84, 2);
INSERT INTO `system_users_roles` VALUES (85, 2);
INSERT INTO `system_users_roles` VALUES (86, 2);
INSERT INTO `system_users_roles` VALUES (87, 2);
INSERT INTO `system_users_roles` VALUES (88, 2);
INSERT INTO `system_users_roles` VALUES (89, 2);
INSERT INTO `system_users_roles` VALUES (90, 2);
INSERT INTO `system_users_roles` VALUES (91, 2);
INSERT INTO `system_users_roles` VALUES (92, 2);
INSERT INTO `system_users_roles` VALUES (93, 2);
INSERT INTO `system_users_roles` VALUES (94, 2);
INSERT INTO `system_users_roles` VALUES (95, 2);
INSERT INTO `system_users_roles` VALUES (96, 2);
INSERT INTO `system_users_roles` VALUES (97, 2);
INSERT INTO `system_users_roles` VALUES (98, 2);
INSERT INTO `system_users_roles` VALUES (99, 2);
INSERT INTO `system_users_roles` VALUES (100, 2);
INSERT INTO `system_users_roles` VALUES (101, 2);
INSERT INTO `system_users_roles` VALUES (102, 2);
INSERT INTO `system_users_roles` VALUES (103, 2);

SET FOREIGN_KEY_CHECKS = 1;
