/*
 Navicat Premium Dump SQL

 Source Server         : local_mysql8
 Source Server Type    : MySQL
 Source Server Version : 80043 (8.0.43)
 Source Host           : localhost:3306
 Source Schema         : kenaito_pilot

 Target Server Type    : MySQL
 Target Server Version : 80043 (8.0.43)
 File Encoding         : 65001

 Date: 27/03/2026 18:42:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_info
-- ----------------------------
DROP TABLE IF EXISTS `app_info`;
CREATE TABLE `app_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(255) NOT NULL COMMENT '应用名称',
  `language` varchar(255) NOT NULL COMMENT '开发语言',
  `status` tinyint(1) NOT NULL COMMENT '状态。0空应用1在线2已下线',
  `offline_time` datetime DEFAULT NULL COMMENT '下线时间',
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用负责人',
  `owner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用负责人名称',
  `description` text COMMENT '应用描述',
  `level` varchar(255) NOT NULL COMMENT '应用级别。A核心应用 B非核心应用 C边缘应用',
  `deploy_type` varchar(255) NOT NULL COMMENT '部署类型。static静态产物 backend 后端服务',
  `gitlab_id` bigint NOT NULL COMMENT '归属gitlab站点',
  `git_group_id` bigint DEFAULT NULL COMMENT 'git分组id',
  `git_group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'git分组名称',
  `git_project_id` bigint DEFAULT NULL COMMENT 'git项目id',
  `git_project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'git项目名称',
  `git_project_owner` bigint DEFAULT NULL COMMENT 'git项目用户名',
  `git_web_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'git项目地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='应用信息';

-- ----------------------------
-- Records of app_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for app_role
-- ----------------------------
DROP TABLE IF EXISTS `app_role`;
CREATE TABLE `app_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='应用角色';

-- ----------------------------
-- Records of app_role
-- ----------------------------
BEGIN;
INSERT INTO `app_role` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `role_code`, `role_name`, `role_remark`) VALUES (1, 'admin', '2026-02-25 21:12:31', 'admin', '2026-02-25 21:12:31', 'dev', '开发小弟', '就是小弟啦');
INSERT INTO `app_role` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `role_code`, `role_name`, `role_remark`) VALUES (2, 'admin', '2026-02-25 21:12:31', 'admin', '2026-02-25 21:12:31', 'owner', '项目负责人', '就是大哥啦');
INSERT INTO `app_role` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `role_code`, `role_name`, `role_remark`) VALUES (3, 'admin', '2026-02-25 21:12:31', 'admin', '2026-02-25 21:12:31', 'dba', '数据库管理员', '就是经常删库跑路的那个啦');
INSERT INTO `app_role` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `role_code`, `role_name`, `role_remark`) VALUES (4, 'admin', '2026-02-25 21:12:31', 'admin', '2026-02-25 21:12:31', 'deploy_review', '部署审核员', 'Ta没同意就部署不了啦');
INSERT INTO `app_role` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `role_code`, `role_name`, `role_remark`) VALUES (5, 'admin', '2026-02-25 21:12:31', 'admin', '2026-02-25 21:12:31', 'merge_master_review', '合并master审核员', 'Ta没同意就合并不了啦');
COMMIT;

-- ----------------------------
-- Table structure for app_user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `app_user_favorite`;
CREATE TABLE `app_user_favorite` (
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `app_name` varchar(255) NOT NULL COMMENT '应用名称',
  PRIMARY KEY (`username`,`app_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户收藏的应用';

-- ----------------------------
-- Records of app_user_favorite
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for app_user_role
-- ----------------------------
DROP TABLE IF EXISTS `app_user_role`;
CREATE TABLE `app_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色编码',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='应用角色、用户关联';

-- ----------------------------
-- Records of app_user_role
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for demo_time_table
-- ----------------------------
DROP TABLE IF EXISTS `demo_time_table`;
CREATE TABLE `demo_time_table` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of demo_time_table
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for demo_user_time_logic_table
-- ----------------------------
DROP TABLE IF EXISTS `demo_user_time_logic_table`;
CREATE TABLE `demo_user_time_logic_table` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `available` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据有效性',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of demo_user_time_logic_table
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for demo_user_time_table
-- ----------------------------
DROP TABLE IF EXISTS `demo_user_time_table`;
CREATE TABLE `demo_user_time_table` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of demo_user_time_table
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for flow_host_group
-- ----------------------------
DROP TABLE IF EXISTS `flow_host_group`;
CREATE TABLE `flow_host_group` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主机组名称',
  `group_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主机组ID(uuid)',
  `group_env` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主机组环境(daily、stage、production)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='主机组';

-- ----------------------------
-- Records of flow_host_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for flow_host_instance
-- ----------------------------
DROP TABLE IF EXISTS `flow_host_instance`;
CREATE TABLE `flow_host_instance` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `host_group_id` bigint NOT NULL COMMENT '主机组ID',
  `host_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主机IP',
  `host_port` int NOT NULL DEFAULT '22' COMMENT '主机端口，默认22',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'y' COMMENT '是否启用(y、n)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='主机实例';

-- ----------------------------
-- Records of flow_host_instance
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for flow_instance
-- ----------------------------
DROP TABLE IF EXISTS `flow_instance`;
CREATE TABLE `flow_instance` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `flow_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流水线适用类型(front、backend)',
  `flow_id` bigint NOT NULL COMMENT '流水线ID',
  `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用名称',
  `app_env` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用环境(daily、stage、production)',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例状态(pending、running、fail、success)',
  `current_node_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '当前节点编码',
  `current_node_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '当前节点状态(pending、running、fail、success)',
  `runtime_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '运行参数',
  `flow_template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流水线模板',
  `execute_records` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行记录',
  `job_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'QuartzJob的key',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='流水线实例';

-- ----------------------------
-- Records of flow_instance
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for flow_kubernetes_cluster
-- ----------------------------
DROP TABLE IF EXISTS `flow_kubernetes_cluster`;
CREATE TABLE `flow_kubernetes_cluster` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `cluster_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '集群名称',
  `cluster_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '集群编码',
  `cluster_config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '集群配置文件',
  `default_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '默认镜像地址',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'y' COMMENT '是否启用(y、n)',
  `cluster_env` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '集群环境(daily、stage、production)',
  `app_yaml` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用yaml配置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='Kubernetes集群';

-- ----------------------------
-- Records of flow_kubernetes_cluster
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for flow_task
-- ----------------------------
DROP TABLE IF EXISTS `flow_task`;
CREATE TABLE `flow_task` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务编码',
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务参数',
  `click` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否可以点击(y、n)',
  `retry` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否支持重试(y、n)',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务类型(内部服务service、外部请求http_get、外部请求http_post)',
  `detail_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '具体调用服务(gitlab、jenkins等)',
  `buttons` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '功能按钮组。名称name、传递值code、按钮类型type(比如elementui中的primary、danger)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='流水线任务(最小单元)';

-- ----------------------------
-- Records of flow_task
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for flow_template
-- ----------------------------
DROP TABLE IF EXISTS `flow_template`;
CREATE TABLE `flow_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `flow_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流水线名称',
  `flow_env` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流水线环境(daily、stage、production)',
  `flow_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '适用类型(front、backend)',
  `flow_language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '适用语言(java、php、nodejs、go、python、dotnet、cplus、移动端等)',
  `template` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模板内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='流水线模板';

-- ----------------------------
-- Records of flow_template
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gitlab_site_config
-- ----------------------------
DROP TABLE IF EXISTS `gitlab_site_config`;
CREATE TABLE `gitlab_site_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `name` varchar(255) NOT NULL COMMENT 'gitlab别名',
  `endpoint` varchar(255) NOT NULL COMMENT 'gitlab地址',
  `token` varchar(255) NOT NULL COMMENT 'PersonAccessToken。用root用户的',
  `default_group_name` varchar(255) NOT NULL COMMENT '默认分组名称。为空默认root',
  `default_group_id` bigint NOT NULL COMMENT '默认分组id(auto)',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `master` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认站点',
  `error_message` text COMMENT '异常信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='Gitlab站点配置';

-- ----------------------------
-- Records of gitlab_site_config
-- ----------------------------
BEGIN;
INSERT INTO `gitlab_site_config` (`id`, `create_by`, `create_time`, `update_by`, `update_time`, `name`, `endpoint`, `token`, `default_group_name`, `default_group_id`, `status`, `master`, `error_message`) VALUES (1, 'admin', '2026-03-27 15:14:44', 'admin', '2026-03-27 15:14:49', '公用测试环境', 'http://219.151.187.115:21008', 'xxxxxxx', 'root', 1, 0, 1, '401 Unauthorized');
COMMIT;

-- ----------------------------
-- Table structure for host_app
-- ----------------------------
DROP TABLE IF EXISTS `host_app`;
CREATE TABLE `host_app` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `host_id` bigint NOT NULL COMMENT '主机id',
  `cluster_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '归属集群',
  `app_name` varchar(255) NOT NULL COMMENT '应用名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='主机、应用关联关系';

-- ----------------------------
-- Records of host_app
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for host_info
-- ----------------------------
DROP TABLE IF EXISTS `host_info`;
CREATE TABLE `host_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `hostname` varchar(255) NOT NULL COMMENT '主机名',
  `host_ip` varchar(255) NOT NULL COMMENT '主机ip',
  `cluster_code` varchar(255) DEFAULT NULL COMMENT '集群编码',
  `deploy_app_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部署应用类型。比如：java',
  `cpu_size` decimal(10,0) DEFAULT NULL COMMENT 'cpu大小(auto)',
  `memory_size` decimal(10,0) DEFAULT NULL COMMENT '内存大小(auto)',
  `disk_size` decimal(10,2) DEFAULT NULL COMMENT '磁盘容量(auto)',
  `machine` varchar(255) DEFAULT NULL COMMENT '处理器类型(auto)。uname -m',
  `release` varchar(255) DEFAULT NULL COMMENT '内核版本号(auto)。uname -r',
  `system` varchar(255) DEFAULT NULL COMMENT '操作系统(auto)。cat /etc/redhat-release',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='主机信息';

-- ----------------------------
-- Records of host_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for k8s_ingress
-- ----------------------------
DROP TABLE IF EXISTS `k8s_ingress`;
CREATE TABLE `k8s_ingress` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Ingress名称。命名规则：{appName}-ing',
  `host` varchar(255) NOT NULL COMMENT '域名',
  `path` varchar(255) NOT NULL COMMENT '匹配路径。默认为''/''',
  `path_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Ingress路由规则中的路径类型(Exact、Prefix、ImplementationSpecific',
  `service_name` varchar(255) NOT NULL COMMENT '目标Service',
  `service_port` int NOT NULL COMMENT '服务端口。指向Service的应用服务端口',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='K8s Ingress 反向代理';

-- ----------------------------
-- Records of k8s_ingress
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for k8s_node
-- ----------------------------
DROP TABLE IF EXISTS `k8s_node`;
CREATE TABLE `k8s_node` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `cluster_code` varchar(255) NOT NULL COMMENT '集群编码',
  `cluster_name` varchar(255) NOT NULL COMMENT '集群名称',
  `cluster_env` varchar(255) NOT NULL COMMENT '集群环境',
  `cluster_ip` varchar(255) NOT NULL COMMENT '集群IP地址',
  `cluster_config` text NOT NULL COMMENT '集群配置',
  `app_config` text COMMENT '应用配置',
  `default_app_image` varchar(255) DEFAULT NULL COMMENT '默认应用镜像',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='K8s 节点';

-- ----------------------------
-- Records of k8s_node
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for k8s_pod_specs
-- ----------------------------
DROP TABLE IF EXISTS `k8s_pod_specs`;
CREATE TABLE `k8s_pod_specs` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `name` varchar(255) NOT NULL COMMENT '规格名称',
  `cpu_size` decimal(3,3) NOT NULL COMMENT 'CPU核心数。毫核m',
  `memory_size` decimal(10,0) NOT NULL COMMENT '内存数。单位Mi',
  `disk_size` decimal(10,0) NOT NULL COMMENT '磁盘容量。单位Mi',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='K8s Pod 规格';

-- ----------------------------
-- Records of k8s_pod_specs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for k8s_service
-- ----------------------------
DROP TABLE IF EXISTS `k8s_service`;
CREATE TABLE `k8s_service` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Service名称。命名规则：{appName}-svc',
  `namespace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '命名空间。上下文名称',
  `env_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '适用环境。daily、stage、production',
  `service_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Service类型。ClusterIP、NodePort',
  `service_port` int NOT NULL COMMENT '应用服务端口',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='K8s Service 负载均衡与服务发现';

-- ----------------------------
-- Records of k8s_service
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cron_expression` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fired_time` bigint NOT NULL,
  `sched_time` bigint NOT NULL,
  `priority` int NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE,
  KEY `idx_qrtz_ft_trig_inst_name` (`sched_name`,`instance_name`) USING BTREE,
  KEY `idx_qrtz_ft_inst_job_req_rcvry` (`sched_name`,`instance_name`,`requests_recovery`) USING BTREE,
  KEY `idx_qrtz_ft_j_g` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  KEY `idx_qrtz_ft_jg` (`sched_name`,`job_group`) USING BTREE,
  KEY `idx_qrtz_ft_t_g` (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `idx_qrtz_ft_tg` (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE,
  KEY `idx_qrtz_j_req_recovery` (`sched_name`,`requests_recovery`) USING BTREE,
  KEY `idx_qrtz_j_grp` (`sched_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` (`sched_name`, `lock_name`) VALUES ('cutejava', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` (`sched_name`, `lock_name`) VALUES ('cutejava', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_checkin_time` bigint NOT NULL,
  `checkin_interval` bigint NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_scheduler_state` (`sched_name`, `instance_name`, `last_checkin_time`, `checkin_interval`) VALUES ('ClusteredScheduler', 'DESKTOP-FM44BLS1742558233429', 1742558255052, 20000);
INSERT INTO `qrtz_scheduler_state` (`sched_name`, `instance_name`, `last_checkin_time`, `checkin_interval`) VALUES ('cutejava', 'iodboy.local1769415963994', 1769415965913, 10000);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `repeat_count` bigint NOT NULL,
  `repeat_interval` bigint NOT NULL,
  `times_triggered` bigint NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `int_prop_1` int DEFAULT NULL,
  `int_prop_2` int DEFAULT NULL,
  `long_prop_1` bigint DEFAULT NULL,
  `long_prop_2` bigint DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `next_fire_time` bigint DEFAULT NULL,
  `prev_fire_time` bigint DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_time` bigint NOT NULL,
  `end_time` bigint DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `misfire_instr` smallint DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `idx_qrtz_t_j` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  KEY `idx_qrtz_t_jg` (`sched_name`,`job_group`) USING BTREE,
  KEY `idx_qrtz_t_c` (`sched_name`,`calendar_name`) USING BTREE,
  KEY `idx_qrtz_t_g` (`sched_name`,`trigger_group`) USING BTREE,
  KEY `idx_qrtz_t_state` (`sched_name`,`trigger_state`) USING BTREE,
  KEY `idx_qrtz_t_n_state` (`sched_name`,`trigger_name`,`trigger_group`,`trigger_state`) USING BTREE,
  KEY `idx_qrtz_t_n_g_state` (`sched_name`,`trigger_group`,`trigger_state`) USING BTREE,
  KEY `idx_qrtz_t_next_fire_time` (`sched_name`,`next_fire_time`) USING BTREE,
  KEY `idx_qrtz_t_nft_st` (`sched_name`,`trigger_state`,`next_fire_time`) USING BTREE,
  KEY `idx_qrtz_t_nft_misfire` (`sched_name`,`misfire_instr`,`next_fire_time`) USING BTREE,
  KEY `idx_qrtz_t_nft_st_misfire` (`sched_name`,`misfire_instr`,`next_fire_time`,`trigger_state`) USING BTREE,
  KEY `idx_qrtz_t_nft_st_misfire_grp` (`sched_name`,`misfire_instr`,`next_fire_time`,`trigger_group`,`trigger_state`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_dept`;
CREATE TABLE `system_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint DEFAULT NULL COMMENT '上级部门',
  `sub_count` int DEFAULT '0' COMMENT '子部门数目',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `dept_sort` int DEFAULT '999' COMMENT '排序',
  `enabled` bit(1) NOT NULL COMMENT '状态',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  KEY `idx_pid` (`pid`) USING BTREE,
  KEY `idx_enabled` (`enabled`) USING BTREE,
  KEY `idx_sys_dept_dept_id` (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='部门';

-- ----------------------------
-- Records of system_dept
-- ----------------------------
BEGIN;
INSERT INTO `system_dept` (`dept_id`, `pid`, `sub_count`, `name`, `dept_sort`, `enabled`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (2, 7, 1, '研发部', 3, b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dept` (`dept_id`, `pid`, `sub_count`, `name`, `dept_sort`, `enabled`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (5, 7, 0, '运维部', 4, b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dept` (`dept_id`, `pid`, `sub_count`, `name`, `dept_sort`, `enabled`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (6, 8, 0, '测试部', 6, b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dept` (`dept_id`, `pid`, `sub_count`, `name`, `dept_sort`, `enabled`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (7, NULL, 2, '华南分部', 0, b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dept` (`dept_id`, `pid`, `sub_count`, `name`, `dept_sort`, `enabled`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (8, NULL, 2, '华北分部', 1, b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dept` (`dept_id`, `pid`, `sub_count`, `name`, `dept_sort`, `enabled`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (15, 8, 0, 'UI部门', 7, b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dept` (`dept_id`, `pid`, `sub_count`, `name`, `dept_sort`, `enabled`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (17, 2, 0, '研发一组', 999, b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
COMMIT;

-- ----------------------------
-- Table structure for system_dict
-- ----------------------------
DROP TABLE IF EXISTS `system_dict`;
CREATE TABLE `system_dict` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='数据字典';

-- ----------------------------
-- Records of system_dict
-- ----------------------------
BEGIN;
INSERT INTO `system_dict` (`id`, `name`, `description`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (1, 'user_status', '用户状态', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict` (`id`, `name`, `description`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (4, 'dept_status', '部门状态', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict` (`id`, `name`, `description`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (5, 'job_status', '岗位状态', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict` (`id`, `name`, `description`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (8, 'test_status', '测试状态', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
COMMIT;

-- ----------------------------
-- Table structure for system_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_detail`;
CREATE TABLE `system_dict_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_id` bigint DEFAULT NULL COMMENT '字典id',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典标签',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典值',
  `dict_sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_dict_id` (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='数据字典详情';

-- ----------------------------
-- Records of system_dict_detail
-- ----------------------------
BEGIN;
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (1, 1, '激活', 'true', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (2, 1, '禁用', 'false', 2, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (3, 4, '启用', 'true', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (4, 4, '停用', 'false', 2, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (5, 5, '启用', 'true', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (6, 5, '停用', 'false', 2, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (7, 8, '打瞌睡01', 'ks01', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (8, 8, '打瞌睡2', 'ks02', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (9, 8, '打瞌睡3', 'ks03', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (10, 8, '打瞌睡4', 'ks04', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (11, 8, '打瞌睡5', 'ks05', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (12, 8, '打瞌睡6', 'ks06', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (13, 8, '打瞌睡7', 'ks07', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (14, 8, '打瞌睡8', 'ks08', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (16, 8, '打瞌睡10', 'ks10', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (18, 8, '打瞌睡12', 'ks12', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (19, 8, '打瞌睡13', 'ks13', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (20, 8, '打瞌睡14', 'ks14', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (21, 8, '打瞌睡15', 'ks15', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (22, 8, '打瞌睡16', 'ks16', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (23, 8, '打瞌睡17', 'ks17', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (24, 8, '打瞌睡18', 'ks18', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (25, 8, '打瞌睡19', 'ks19', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (26, 8, '打瞌睡20', 'ks20', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (27, 8, '打瞌睡21', 'ks21', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_dict_detail` (`id`, `dict_id`, `label`, `value`, `dict_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (28, 8, '打瞌睡22', 'ks22', 1, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
COMMIT;

-- ----------------------------
-- Table structure for system_email_config
-- ----------------------------
DROP TABLE IF EXISTS `system_email_config`;
CREATE TABLE `system_email_config` (
  `config_id` bigint NOT NULL COMMENT 'ID',
  `from_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密码',
  `port` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '端口',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='邮箱配置';

-- ----------------------------
-- Records of system_email_config
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_job
-- ----------------------------
DROP TABLE IF EXISTS `system_job`;
CREATE TABLE `system_job` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `enabled` bit(1) NOT NULL COMMENT '岗位状态',
  `job_sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`) USING BTREE,
  KEY `idx_enabled` (`enabled`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='岗位';

-- ----------------------------
-- Records of system_job
-- ----------------------------
BEGIN;
INSERT INTO `system_job` (`id`, `name`, `enabled`, `job_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (8, '人事专员', b'1', 3, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_job` (`id`, `name`, `enabled`, `job_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (10, '产品经理', b'1', 4, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_job` (`id`, `name`, `enabled`, `job_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (11, '全栈开发', b'1', 2, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_job` (`id`, `name`, `enabled`, `job_sort`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (12, '软件测试', b'1', 5, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
COMMIT;

-- ----------------------------
-- Table structure for system_local_storage
-- ----------------------------
DROP TABLE IF EXISTS `system_local_storage`;
CREATE TABLE `system_local_storage` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件真实的名称',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件名',
  `suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '后缀',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '路径',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类型',
  `size` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '大小',
  `date_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日期分组',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='本地存储';

-- ----------------------------
-- Records of system_local_storage
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint DEFAULT NULL COMMENT '上级菜单ID',
  `sub_count` int DEFAULT '0' COMMENT '子菜单数目',
  `type` int DEFAULT NULL COMMENT '菜单类型',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜单标题',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '组件名称',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '组件',
  `menu_sort` int DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图标',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '链接地址',
  `i_frame` bit(1) DEFAULT NULL COMMENT '是否外链',
  `cache` bit(1) DEFAULT b'0' COMMENT '缓存',
  `hidden` bit(1) DEFAULT b'0' COMMENT '隐藏',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '权限',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`) USING BTREE,
  UNIQUE KEY `uniq_title` (`title`) USING BTREE,
  KEY `idx_pid` (`pid`) USING BTREE,
  KEY `idx_sys_menu_menu_id` (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统菜单';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
BEGIN;
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (1, NULL, 9, 0, '系统管理', NULL, NULL, 10, 'system', 'system', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (2, 1, 3, 1, '用户管理', 'User', 'system/user/index', 2, 'peoples', 'user', b'0', b'0', b'0', 'user:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (3, 1, 3, 1, '角色管理', 'Role', 'system/role/index', 3, 'role', 'role', b'0', b'0', b'0', 'roles:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (5, 1, 3, 1, '菜单管理', 'Menu', 'system/menu/index', 5, 'menu', 'menu', b'0', b'0', b'0', 'menu:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (6, 1, 3, 0, '系统监控', NULL, NULL, 11, 'monitor', 'monitor', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (9, 6, 0, 1, 'SQL监控', 'DruidSqlConsole', 'system/druidSql/index', 18, 'sqlMonitor', 'druid-console', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (14, 36, 0, 1, '邮件工具', 'Email', 'system/email/index', 35, 'email', 'email', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (18, 36, 3, 1, '存储管理', 'Storage', 'system/storage/index', 34, 'qiniu', 'storage', b'0', b'0', b'0', 'storage:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (21, NULL, 2, 0, '演示:多级菜单', NULL, '', 999, 'document', 'nested', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (22, 21, 2, 0, '二级菜单1', NULL, '', 999, 'menu', 'menu1', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (23, 21, 0, 1, '二级菜单2', NULL, 'nested/menu2/index', 999, 'menu', 'menu2', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (24, 22, 0, 1, '三级菜单1', 'Test', 'nested/menu1/menu1-1', 999, 'menu', 'menu1-1', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (27, 22, 0, 1, '三级菜单2', NULL, 'nested/menu1/menu1-2', 999, 'menu', 'menu1-2', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (28, 1, 3, 1, '任务调度', 'QuartzJob', 'system/quartzJob/index', 9, 'timing', 'quartz-job', b'0', b'0', b'0', 'quartzJob:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (35, 1, 3, 1, '部门管理', 'Dept', 'system/dept/index', 6, 'dept', 'dept', b'0', b'0', b'0', 'dept:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (36, 1, 2, 0, '系统工具', NULL, '', 10, 'sys-tools', 'sys-tools', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (37, 1, 3, 1, '岗位管理', 'Job', 'system/job/index', 7, 'Steve-Jobs', 'job', b'0', b'0', b'0', 'job:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (39, 1, 3, 1, '字典管理', 'Dict', 'system/dict/index', 8, 'dictionary', 'dict', b'0', b'0', b'0', 'dict:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (41, 6, 0, 1, '在线用户', 'OnlineUser', 'system/online/index', 10, 'Steve-Jobs', 'online', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (44, 2, 0, 2, '用户新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'user:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (45, 2, 0, 2, '用户编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'user:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (46, 2, 0, 2, '用户删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'user:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (48, 3, 0, 2, '角色创建', NULL, '', 2, '', '', b'0', b'0', b'0', 'roles:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (49, 3, 0, 2, '角色修改', NULL, '', 3, '', '', b'0', b'0', b'0', 'roles:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (50, 3, 0, 2, '角色删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'roles:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (52, 5, 0, 2, '菜单新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'menu:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (53, 5, 0, 2, '菜单编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'menu:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (54, 5, 0, 2, '菜单删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'menu:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (56, 35, 0, 2, '部门新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'dept:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (57, 35, 0, 2, '部门编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'dept:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (58, 35, 0, 2, '部门删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'dept:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (60, 37, 0, 2, '岗位新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'job:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (61, 37, 0, 2, '岗位编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'job:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (62, 37, 0, 2, '岗位删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'job:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (64, 39, 0, 2, '字典新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'dict:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (65, 39, 0, 2, '字典编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'dict:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (66, 39, 0, 2, '字典删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'dict:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (73, 28, 0, 2, '任务新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'quartzJob:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (74, 28, 0, 2, '任务编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'quartzJob:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (75, 28, 0, 2, '任务删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'quartzJob:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (77, 18, 0, 2, '上传文件', NULL, '', 2, '', '', b'0', b'0', b'0', 'storage:add', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (78, 18, 0, 2, '文件编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'storage:edit', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (79, 18, 0, 2, '文件删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'storage:del', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (80, 6, 0, 1, '服务监控', 'ServerMonitor', 'system/server/index', 14, 'codeConsole', 'server', b'0', b'0', b'0', 'monitor:list', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (159, NULL, 5, 0, '系统组件', NULL, NULL, 12, 'crm', 'syscom', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (160, 159, 0, 1, '基础组件', 'ComponentsDemoDev', 'componentsDemo/dev/index', 1, 'crm', 'dev', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (161, 159, 0, 1, '快捷组件', 'ComponentsDemoUtil', 'componentsDemo/util/index', 2, 'crm', 'util', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (162, 159, 0, 1, '业务组件', 'ComponentsDemoBusiness', 'componentsDemo/business/index', 3, 'crm', 'business', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (163, 159, 0, 1, '高级组件', 'ComponentsDemoAdvanced', 'componentsDemo/advanced/index', 4, 'crm', 'advanced', b'0', b'0', b'0', NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (164, 159, 0, 1, '流水线组件', 'ComponentsDemoPipeline', 'componentsDemo/pipeline/index', 5, 'crm', 'pipeline', b'0', b'0', b'0', NULL, 'admin', 'admin', '2026-03-06 20:06:09', '2026-03-06 20:09:22');
COMMIT;

-- ----------------------------
-- Table structure for system_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `system_operation_log`;
CREATE TABLE `system_operation_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `biz_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `request_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `execute_time` bigint DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `browser_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `exception_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='审计日志';

-- ----------------------------
-- Records of system_operation_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_oss_storage
-- ----------------------------
DROP TABLE IF EXISTS `system_oss_storage`;
CREATE TABLE `system_oss_storage` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `service_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类型，比如minio',
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '服务地址',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '存储桶名称',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '完整文件名称',
  `file_size` bigint DEFAULT NULL COMMENT '文件大小, 单位：字节',
  `file_mime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件类型',
  `file_prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '短文件名',
  `file_suffix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件后缀',
  `file_md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件md5',
  `file_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '文件链接',
  `file_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文件编码',
  `object_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '对象路径',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `udx_filemd5` (`file_md5`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='OSS存储';

-- ----------------------------
-- Records of system_oss_storage
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `system_quartz_job`;
CREATE TABLE `system_quartz_job` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Spring Bean名称',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'cron 表达式',
  `is_pause` bit(1) DEFAULT NULL COMMENT '状态：1暂停、0启用',
  `job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '参数',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `person_in_charge` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '负责人',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '报警邮箱',
  `sub_task` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '子任务ID',
  `pause_after_failure` bit(1) DEFAULT NULL COMMENT '任务失败后是否暂停',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_is_pause` (`is_pause`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务';

-- ----------------------------
-- Records of system_quartz_job
-- ----------------------------
BEGIN;
INSERT INTO `system_quartz_job` (`id`, `bean_name`, `cron_expression`, `is_pause`, `job_name`, `method_name`, `params`, `description`, `person_in_charge`, `email`, `sub_task`, `pause_after_failure`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (2, 'testTask', '0/5 * * * * ?', b'1', '测试1', 'run1', 'test', '带参测试，多参使用json', '测试', NULL, NULL, NULL, 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_quartz_job` (`id`, `bean_name`, `cron_expression`, `is_pause`, `job_name`, `method_name`, `params`, `description`, `person_in_charge`, `email`, `sub_task`, `pause_after_failure`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (3, 'testTask', '0/5 * * * * ?', b'1', '测试', 'run', '', '不带参测试', '测试', '', '6', b'1', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
COMMIT;

-- ----------------------------
-- Table structure for system_quartz_log
-- ----------------------------
DROP TABLE IF EXISTS `system_quartz_log`;
CREATE TABLE `system_quartz_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Bean名称',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'cron 表达式',
  `is_success` bit(1) DEFAULT NULL COMMENT '是否执行成功',
  `job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '参数',
  `time` bigint DEFAULT NULL COMMENT '执行耗时',
  `exception_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '异常详情',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务日志';

-- ----------------------------
-- Records of system_quartz_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `level` int DEFAULT NULL COMMENT '角色级别',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `data_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '数据权限',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`) USING BTREE,
  KEY `idx_level` (`level`) USING BTREE,
  KEY `idx_sys_role_level` (`level`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of system_role
-- ----------------------------
BEGIN;
INSERT INTO `system_role` (`role_id`, `name`, `level`, `description`, `data_scope`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (1, '超级管理员', 1, '6666', '全部', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_role` (`role_id`, `name`, `level`, `description`, `data_scope`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (2, '普通用户', 2, '-', '本级', 'admin', 'admin', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
COMMIT;

-- ----------------------------
-- Table structure for system_roles_depts
-- ----------------------------
DROP TABLE IF EXISTS `system_roles_depts`;
CREATE TABLE `system_roles_depts` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE,
  KEY `idx_role_id` (`role_id`) USING BTREE,
  KEY `idx_dept_id` (`dept_id`) USING BTREE,
  KEY `idx_sys_roles_depts_role_dept` (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色部门关联';

-- ----------------------------
-- Records of system_roles_depts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `system_roles_menus`;
CREATE TABLE `system_roles_menus` (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`,`role_id`) USING BTREE,
  KEY `idx_menu_id` (`menu_id`) USING BTREE,
  KEY `idx_role_id` (`role_id`) USING BTREE,
  KEY `idx_sys_roles_menus_role_menu` (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单关联';

-- ----------------------------
-- Records of system_roles_menus
-- ----------------------------
BEGIN;
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (1, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (2, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (3, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (5, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (6, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (9, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (14, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (18, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (21, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (21, 2);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (22, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (23, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (24, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (27, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (28, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (35, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (36, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (37, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (39, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (41, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (44, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (45, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (46, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (48, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (49, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (50, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (52, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (53, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (54, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (56, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (57, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (58, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (60, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (61, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (62, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (64, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (65, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (66, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (73, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (74, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (75, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (77, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (78, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (79, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (80, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (159, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (160, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (161, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (162, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (163, 1);
INSERT INTO `system_roles_menus` (`menu_id`, `role_id`) VALUES (164, 1);
COMMIT;

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门名称',
  `username` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '昵称',
  `gender` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号码',
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `avatar_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '头像地址',
  `avatar_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '头像真实路径',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密码',
  `is_admin` bit(1) DEFAULT b'0' COMMENT '是否为admin账号',
  `enabled` bit(1) DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新者',
  `pwd_reset_time` datetime DEFAULT NULL COMMENT '修改密码的时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `uniq_email` (`email`) USING BTREE,
  UNIQUE KEY `uniq_username` (`username`) USING BTREE,
  KEY `idx_dept_id` (`dept_id`) USING BTREE,
  KEY `idx_enabled` (`enabled`) USING BTREE,
  KEY `uniq_phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统用户';

-- ----------------------------
-- Records of system_user
-- ----------------------------
BEGIN;
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (1, 2, 'admin', '管理员', '男', '18888888888', '1943815081@qq.com', '', '', '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'1', b'1', 'admin', 'admin', '2020-05-03 16:38:31', '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (5, 2, 'odboy101', 'odboy101测试用户', '男', '18797874101', '1943815101@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (6, 2, 'odboy102', 'odboy102测试用户', '男', '18797874102', '1943815102@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (7, 2, 'odboy103', 'odboy103测试用户', '男', '18797874103', '1943815103@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (8, 2, 'odboy104', 'odboy104测试用户', '男', '18797874104', '1943815104@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (9, 2, 'odboy105', 'odboy105测试用户', '男', '18797874105', '1943815105@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (10, 2, 'odboy106', 'odboy106测试用户', '男', '18797874106', '1943815106@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (11, 2, 'odboy107', 'odboy107测试用户', '男', '18797874107', '1943815107@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (12, 2, 'odboy108', 'odboy108测试用户', '男', '18797874108', '1943815108@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (13, 2, 'odboy109', 'odboy109测试用户', '男', '18797874109', '1943815109@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (14, 2, 'odboy110', 'odboy110测试用户', '男', '18797874110', '1943815110@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (15, 2, 'odboy111', 'odboy111测试用户', '男', '18797874111', '1943815111@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (16, 2, 'odboy112', 'odboy112测试用户', '男', '18797874112', '1943815112@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (17, 2, 'odboy113', 'odboy113测试用户', '男', '18797874113', '1943815113@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (18, 2, 'odboy114', 'odboy114测试用户', '男', '18797874114', '1943815114@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (19, 2, 'odboy115', 'odboy115测试用户', '男', '18797874115', '1943815115@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (20, 2, 'odboy116', 'odboy116测试用户', '男', '18797874116', '1943815116@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (21, 2, 'odboy117', 'odboy117测试用户', '男', '18797874117', '1943815117@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (22, 2, 'odboy118', 'odboy118测试用户', '男', '18797874118', '1943815118@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (23, 2, 'odboy119', 'odboy119测试用户', '男', '18797874119', '1943815119@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (24, 2, 'odboy120', 'odboy120测试用户', '男', '18797874120', '1943815120@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (25, 2, 'odboy121', 'odboy121测试用户', '男', '18797874121', '1943815121@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (26, 2, 'odboy122', 'odboy122测试用户', '男', '18797874122', '1943815122@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (27, 2, 'odboy123', 'odboy123测试用户', '男', '18797874123', '1943815123@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (28, 2, 'odboy124', 'odboy124测试用户', '男', '18797874124', '1943815124@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (29, 2, 'odboy125', 'odboy125测试用户', '男', '18797874125', '1943815125@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (30, 2, 'odboy126', 'odboy126测试用户', '男', '18797874126', '1943815126@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (31, 2, 'odboy127', 'odboy127测试用户', '男', '18797874127', '1943815127@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (32, 2, 'odboy128', 'odboy128测试用户', '男', '18797874128', '1943815128@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (33, 2, 'odboy129', 'odboy129测试用户', '男', '18797874129', '1943815129@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (34, 2, 'odboy130', 'odboy130测试用户', '男', '18797874130', '1943815130@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (35, 2, 'odboy131', 'odboy131测试用户', '男', '18797874131', '1943815131@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (36, 2, 'odboy132', 'odboy132测试用户', '男', '18797874132', '1943815132@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (37, 2, 'odboy133', 'odboy133测试用户', '男', '18797874133', '1943815133@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (38, 2, 'odboy134', 'odboy134测试用户', '男', '18797874134', '1943815134@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (39, 2, 'odboy135', 'odboy135测试用户', '男', '18797874135', '1943815135@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (40, 2, 'odboy136', 'odboy136测试用户', '男', '18797874136', '1943815136@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (41, 2, 'odboy137', 'odboy137测试用户', '男', '18797874137', '1943815137@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (42, 2, 'odboy138', 'odboy138测试用户', '男', '18797874138', '1943815138@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (43, 2, 'odboy139', 'odboy139测试用户', '男', '18797874139', '1943815139@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (44, 2, 'odboy140', 'odboy140测试用户', '男', '18797874140', '1943815140@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (45, 2, 'odboy141', 'odboy141测试用户', '男', '18797874141', '1943815141@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (46, 2, 'odboy142', 'odboy142测试用户', '男', '18797874142', '1943815142@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (47, 2, 'odboy143', 'odboy143测试用户', '男', '18797874143', '1943815143@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (48, 2, 'odboy144', 'odboy144测试用户', '男', '18797874144', '1943815144@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (49, 2, 'odboy145', 'odboy145测试用户', '男', '18797874145', '1943815145@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (50, 2, 'odboy146', 'odboy146测试用户', '男', '18797874146', '1943815146@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (51, 2, 'odboy147', 'odboy147测试用户', '男', '18797874147', '1943815147@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (52, 2, 'odboy148', 'odboy148测试用户', '男', '18797874148', '1943815148@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (53, 2, 'odboy149', 'odboy149测试用户', '男', '18797874149', '1943815149@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (54, 2, 'odboy150', 'odboy150测试用户', '男', '18797874150', '1943815150@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (55, 2, 'odboy151', 'odboy151测试用户', '男', '18797874151', '1943815151@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (56, 2, 'odboy152', 'odboy152测试用户', '男', '18797874152', '1943815152@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (57, 2, 'odboy153', 'odboy153测试用户', '男', '18797874153', '1943815153@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (58, 2, 'odboy154', 'odboy154测试用户', '男', '18797874154', '1943815154@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (59, 2, 'odboy155', 'odboy155测试用户', '男', '18797874155', '1943815155@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (60, 2, 'odboy156', 'odboy156测试用户', '男', '18797874156', '1943815156@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (61, 2, 'odboy157', 'odboy157测试用户', '男', '18797874157', '1943815157@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (62, 2, 'odboy158', 'odboy158测试用户', '男', '18797874158', '1943815158@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (63, 2, 'odboy159', 'odboy159测试用户', '男', '18797874159', '1943815159@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (64, 2, 'odboy160', 'odboy160测试用户', '男', '18797874160', '1943815160@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (65, 2, 'odboy161', 'odboy161测试用户', '男', '18797874161', '1943815161@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (66, 2, 'odboy162', 'odboy162测试用户', '男', '18797874162', '1943815162@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (67, 2, 'odboy163', 'odboy163测试用户', '男', '18797874163', '1943815163@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (68, 2, 'odboy164', 'odboy164测试用户', '男', '18797874164', '1943815164@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (69, 2, 'odboy165', 'odboy165测试用户', '男', '18797874165', '1943815165@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (70, 2, 'odboy166', 'odboy166测试用户', '男', '18797874166', '1943815166@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (71, 2, 'odboy167', 'odboy167测试用户', '男', '18797874167', '1943815167@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (72, 2, 'odboy168', 'odboy168测试用户', '男', '18797874168', '1943815168@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (73, 2, 'odboy169', 'odboy169测试用户', '男', '18797874169', '1943815169@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (74, 2, 'odboy170', 'odboy170测试用户', '男', '18797874170', '1943815170@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (75, 2, 'odboy171', 'odboy171测试用户', '男', '18797874171', '1943815171@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (76, 2, 'odboy172', 'odboy172测试用户', '男', '18797874172', '1943815172@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (77, 2, 'odboy173', 'odboy173测试用户', '男', '18797874173', '1943815173@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (78, 2, 'odboy174', 'odboy174测试用户', '男', '18797874174', '1943815174@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (79, 2, 'odboy175', 'odboy175测试用户', '男', '18797874175', '1943815175@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (80, 2, 'odboy176', 'odboy176测试用户', '男', '18797874176', '1943815176@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (81, 2, 'odboy177', 'odboy177测试用户', '男', '18797874177', '1943815177@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (82, 2, 'odboy178', 'odboy178测试用户', '男', '18797874178', '1943815178@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (83, 2, 'odboy179', 'odboy179测试用户', '男', '18797874179', '1943815179@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (84, 2, 'odboy180', 'odboy180测试用户', '男', '18797874180', '1943815180@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (85, 2, 'odboy181', 'odboy181测试用户', '男', '18797874181', '1943815181@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (86, 2, 'odboy182', 'odboy182测试用户', '男', '18797874182', '1943815182@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (87, 2, 'odboy183', 'odboy183测试用户', '男', '18797874183', '1943815183@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (88, 2, 'odboy184', 'odboy184测试用户', '男', '18797874184', '1943815184@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (89, 2, 'odboy185', 'odboy185测试用户', '男', '18797874185', '1943815185@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (90, 2, 'odboy186', 'odboy186测试用户', '男', '18797874186', '1943815186@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (91, 2, 'odboy187', 'odboy187测试用户', '男', '18797874187', '1943815187@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (92, 2, 'odboy188', 'odboy188测试用户', '男', '18797874188', '1943815188@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (93, 2, 'odboy189', 'odboy189测试用户', '男', '18797874189', '1943815189@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (94, 2, 'odboy190', 'odboy190测试用户', '男', '18797874190', '1943815190@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (95, 2, 'odboy191', 'odboy191测试用户', '男', '18797874191', '1943815191@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (96, 2, 'odboy192', 'odboy192测试用户', '男', '18797874192', '1943815192@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (97, 2, 'odboy193', 'odboy193测试用户', '男', '18797874193', '1943815193@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (98, 2, 'odboy194', 'odboy194测试用户', '男', '18797874194', '1943815194@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (99, 2, 'odboy195', 'odboy195测试用户', '男', '18797874195', '1943815195@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (100, 2, 'odboy196', 'odboy196测试用户', '男', '18797874196', '1943815196@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (101, 2, 'odboy197', 'odboy197测试用户', '男', '18797874197', '1943815197@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (102, 2, 'odboy198', 'odboy198测试用户', '男', '18797874198', '1943815198@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
INSERT INTO `system_user` (`user_id`, `dept_id`, `username`, `nick_name`, `gender`, `phone`, `email`, `avatar_name`, `avatar_path`, `password`, `is_admin`, `enabled`, `create_by`, `update_by`, `pwd_reset_time`, `create_time`, `update_time`) VALUES (103, 2, 'odboy199', 'odboy199测试用户', '男', '18797874199', '1943815199@qq.com', NULL, NULL, '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'0', b'1', 'admin', 'admin', NULL, '2021-03-20 22:04:13', '2021-03-20 22:04:13');
COMMIT;

-- ----------------------------
-- Table structure for system_users_jobs
-- ----------------------------
DROP TABLE IF EXISTS `system_users_jobs`;
CREATE TABLE `system_users_jobs` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `job_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`job_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of system_users_jobs
-- ----------------------------
BEGIN;
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (1, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (3, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (5, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (6, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (7, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (8, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (9, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (10, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (11, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (12, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (13, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (14, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (15, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (16, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (17, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (18, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (19, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (20, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (21, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (22, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (23, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (24, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (25, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (26, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (27, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (28, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (29, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (30, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (31, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (32, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (33, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (34, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (35, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (36, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (37, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (38, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (39, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (40, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (41, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (42, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (43, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (44, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (45, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (46, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (47, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (48, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (49, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (50, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (51, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (52, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (53, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (54, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (55, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (56, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (57, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (58, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (59, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (60, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (61, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (62, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (63, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (64, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (65, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (66, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (67, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (68, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (69, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (70, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (71, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (72, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (73, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (74, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (75, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (76, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (77, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (78, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (79, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (80, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (81, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (82, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (83, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (84, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (85, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (86, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (87, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (88, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (89, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (90, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (91, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (92, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (93, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (94, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (95, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (96, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (97, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (98, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (99, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (100, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (101, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (102, 11);
INSERT INTO `system_users_jobs` (`user_id`, `job_id`) VALUES (103, 11);
COMMIT;

-- ----------------------------
-- Table structure for system_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `system_users_roles`;
CREATE TABLE `system_users_roles` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户角色关联';

-- ----------------------------
-- Records of system_users_roles
-- ----------------------------
BEGIN;
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (3, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (5, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (6, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (7, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (8, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (9, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (10, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (11, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (12, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (13, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (14, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (15, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (16, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (17, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (18, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (19, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (20, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (21, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (22, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (23, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (24, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (25, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (26, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (27, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (28, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (29, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (30, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (31, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (32, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (33, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (34, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (35, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (36, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (37, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (38, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (39, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (40, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (41, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (42, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (43, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (44, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (45, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (46, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (47, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (48, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (49, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (50, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (51, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (52, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (53, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (54, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (55, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (56, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (57, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (58, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (59, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (60, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (61, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (62, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (63, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (64, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (65, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (66, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (67, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (68, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (69, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (70, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (71, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (72, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (73, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (74, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (75, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (76, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (77, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (78, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (79, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (80, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (81, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (82, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (83, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (84, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (85, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (86, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (87, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (88, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (89, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (90, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (91, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (92, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (93, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (94, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (95, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (96, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (97, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (98, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (99, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (100, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (101, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (102, 2);
INSERT INTO `system_users_roles` (`user_id`, `role_id`) VALUES (103, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
