/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-30 15:18:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article_sort
-- ----------------------------
DROP TABLE IF EXISTS `article_sort`;
CREATE TABLE `article_sort` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(90) DEFAULT NULL COMMENT 'blog:博客\r\n            article:文章\r\n            community:社区(问题)',
  `type_code` varchar(30) DEFAULT NULL COMMENT 'blog:博客\r\n            article:文章\r\n            community:社区(问题)',
  `dr` int(11) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章类型表';

-- ----------------------------
-- Records of article_sort
-- ----------------------------

-- ----------------------------
-- Table structure for blog_friend
-- ----------------------------
DROP TABLE IF EXISTS `blog_friend`;
CREATE TABLE `blog_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `friend_id` int(11) NOT NULL COMMENT '好友id',
  `add_dt` datetime DEFAULT NULL COMMENT '成为好友时间',
  `dr` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_3` (`user_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`user_id`) REFERENCES `bl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好友表';

-- ----------------------------
-- Records of blog_friend
-- ----------------------------

-- ----------------------------
-- Table structure for blog_info
-- ----------------------------
DROP TABLE IF EXISTS `blog_info`;
CREATE TABLE `blog_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `blog_title` varchar(255) DEFAULT NULL,
  `blog_name` varchar(255) DEFAULT NULL,
  `blog_description` varchar(255) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL COMMENT '0:启用\r\n            1:不启用',
  `dr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_7` (`user_id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`user_id`) REFERENCES `bl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博客信息表';

-- ----------------------------
-- Records of blog_info
-- ----------------------------

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) NOT NULL COMMENT '用户名',
  `user_pwd` varchar(255) NOT NULL COMMENT '用户密码',
  `user_phone` int(11) DEFAULT NULL COMMENT '手机号码',
  `user_sex` varchar(6) DEFAULT NULL COMMENT '性别',
  `user_qq` int(11) DEFAULT NULL COMMENT 'qq',
  `user_email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `user_address` varchar(255) DEFAULT NULL COMMENT '地址',
  `user_mark` int(11) DEFAULT NULL COMMENT '用户积分',
  `user_rank_id` varchar(10) DEFAULT NULL COMMENT '等级id',
  `user_last_login_dt` varchar(15) DEFAULT NULL COMMENT '最后登录时间',
  `user_birthday` datetime DEFAULT NULL COMMENT '生日',
  `user_description` varchar(255) DEFAULT NULL COMMENT '自我描述',
  `user_image_url` varchar(255) DEFAULT NULL COMMENT '用户头像存储路径',
  `user_school` varchar(255) DEFAULT NULL COMMENT '毕业学校',
  `user_register_time` datetime DEFAULT NULL COMMENT '用户注册时间',
  `user_weibo` varchar(255) DEFAULT NULL COMMENT '用户微博',
  `user_blood_type` varchar(3) DEFAULT NULL COMMENT '用户血型',
  `user_says` varchar(255) DEFAULT NULL COMMENT '用户语录',
  `user_enabled` int(11) DEFAULT NULL COMMENT '0为启用\r\n            1为不启用',
  `user_power` varchar(255) DEFAULT NULL COMMENT '拥有的权限',
  `dr` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES ('1', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0');

-- ----------------------------
-- Table structure for content_info
-- ----------------------------
DROP TABLE IF EXISTS `content_info`;
CREATE TABLE `content_info` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `type_id` varchar(10) DEFAULT NULL COMMENT '文章分类id\r\n            ',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `create_dt` datetime DEFAULT NULL COMMENT '创建时间',
  `read_count` int(11) DEFAULT NULL COMMENT '阅读量',
  `laud_count` int(11) DEFAULT NULL COMMENT '赞-个数',
  `comment_count` int(11) DEFAULT NULL COMMENT '评论数量',
  `dr` int(11) DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  KEY `FK_Reference_8` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章信息表';

-- ----------------------------
-- Records of content_info
-- ----------------------------

-- ----------------------------
-- Table structure for friendly_link
-- ----------------------------
DROP TABLE IF EXISTS `friendly_link`;
CREATE TABLE `friendly_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_id` varchar(10) DEFAULT NULL COMMENT '链接id',
  `link_name` varchar(60) DEFAULT NULL COMMENT '友情链接名称',
  `link_url` varchar(255) DEFAULT NULL COMMENT '友情链接地址',
  `link_logo` varchar(255) DEFAULT NULL COMMENT 'logo图片地址',
  `show_order` int(11) DEFAULT NULL COMMENT '优先级',
  `dr` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of friendly_link
-- ----------------------------

-- ----------------------------
-- Table structure for power_list
-- ----------------------------
DROP TABLE IF EXISTS `power_list`;
CREATE TABLE `power_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bl__user_id` int(11) DEFAULT NULL COMMENT '用户表_用户id',
  `power_id` varchar(10) NOT NULL COMMENT '权限ID',
  `power_name` varchar(36) DEFAULT NULL COMMENT '权限描述',
  `dr` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`bl__user_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`bl__user_id`) REFERENCES `bl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能权限表';

-- ----------------------------
-- Records of power_list
-- ----------------------------

-- ----------------------------
-- Table structure for secret_message
-- ----------------------------
DROP TABLE IF EXISTS `secret_message`;
CREATE TABLE `secret_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_id` int(11) DEFAULT NULL COMMENT '发送者id',
  `receive_id` int(11) DEFAULT NULL COMMENT '收信者ID',
  `message_topic` varchar(64) DEFAULT NULL COMMENT '私信标题',
  `message_content` varchar(255) DEFAULT NULL COMMENT '私信内容',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `dr` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户私信表';

-- ----------------------------
-- Records of secret_message
-- ----------------------------

-- ----------------------------
-- Table structure for stay_message
-- ----------------------------
DROP TABLE IF EXISTS `stay_message`;
CREATE TABLE `stay_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '此留言拥有者',
  `stay_user_id` int(11) DEFAULT NULL COMMENT '留言者ID',
  `message_content` varchar(255) DEFAULT NULL COMMENT '留言内容',
  `stay_user_dt` datetime DEFAULT NULL COMMENT '留言时间',
  `dr` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_6` (`user_id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`user_id`) REFERENCES `bl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户留言表';

-- ----------------------------
-- Records of stay_message
-- ----------------------------

-- ----------------------------
-- Table structure for system_message
-- ----------------------------
DROP TABLE IF EXISTS `system_message`;
CREATE TABLE `system_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receive_id` int(11) DEFAULT NULL COMMENT '接收者ID',
  `send_default` int(11) DEFAULT NULL COMMENT '1时发送所有用户，0时则不采用',
  `system_topics` varchar(60) DEFAULT NULL COMMENT '通知标题',
  `system_content` varchar(255) DEFAULT NULL COMMENT '通知内容',
  `create_dt` datetime DEFAULT NULL COMMENT '通知创建时间',
  `type` varchar(10) DEFAULT NULL COMMENT '消息类型',
  `dr` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息通知表';

-- ----------------------------
-- Records of system_message
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '系统用户ID',
  `from` varchar(255) DEFAULT NULL COMMENT '来源 url',
  `ip` varchar(22) DEFAULT NULL COMMENT '客户端IP',
  `url` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL COMMENT '记录时间',
  `err_msg` text COMMENT '异常信息',
  `err_code` int(10) DEFAULT '0' COMMENT '状态码，0：正常',
  `class_name` varchar(200) DEFAULT NULL COMMENT 'controller类名',
  `method_name` varchar(64) DEFAULT NULL COMMENT '方法名',
  `start_time` datetime DEFAULT NULL COMMENT '操作时间',
  `spend_time` bigint(20) DEFAULT NULL COMMENT '耗时，毫秒',
  `params` text COMMENT '提供的参数',
  PRIMARY KEY (`id`),
  KEY `FK_sys_EVENT` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=37092 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('37061', null, 'http://localhost:8080/login', '0:0:0:0:0:0:0:1', '/image/getCode', null, '', '0', 'com.jcbase.controller.ImageController', 'getCode', '2017-11-28 11:22:17', '1741', null);
INSERT INTO `sys_log` VALUES ('37062', '1', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '/app', null, '', '0', 'com.jcbase.controller.app.AppVersionController', 'index', '2017-11-28 11:22:55', '0', null);
INSERT INTO `sys_log` VALUES ('37063', '1', 'http://localhost:8080/app', '0:0:0:0:0:0:0:1', '/app/getListData', null, '', '0', 'com.jcbase.controller.app.AppVersionController', 'getListData', '2017-11-28 11:22:56', '6', null);
INSERT INTO `sys_log` VALUES ('37064', '1', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '/sys/res', null, '', '0', 'com.jcbase.controller.sys.ResController', 'index', '2017-11-28 11:22:59', '0', null);
INSERT INTO `sys_log` VALUES ('37065', '1', 'http://localhost:8080/sys/res', '0:0:0:0:0:0:0:1', '/sys/res/getTreeGridView', null, '', '0', 'com.jcbase.controller.sys.ResController', 'getTreeGridView', '2017-11-28 11:23:00', '29', null);
INSERT INTO `sys_log` VALUES ('37066', '1', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '/sys/role', null, '', '0', 'com.jcbase.controller.sys.RoleController', 'index', '2017-11-28 11:23:05', '0', null);
INSERT INTO `sys_log` VALUES ('37067', '1', 'http://localhost:8080/sys/role', '0:0:0:0:0:0:0:1', '/sys/role/getListData', null, '', '0', 'com.jcbase.controller.sys.RoleController', 'getListData', '2017-11-28 11:23:05', '4', null);
INSERT INTO `sys_log` VALUES ('37068', '1', 'http://localhost:8080/sys/role', '0:0:0:0:0:0:0:1', '/sys/role/setVisible', null, '', '0', 'com.jcbase.controller.sys.RoleController', 'setVisible', '2017-11-28 11:23:11', '4', null);
INSERT INTO `sys_log` VALUES ('37069', '1', 'http://localhost:8080/sys/role', '0:0:0:0:0:0:0:1', '/sys/role/getListData', null, '', '0', 'com.jcbase.controller.sys.RoleController', 'getListData', '2017-11-28 11:23:12', '8', null);
INSERT INTO `sys_log` VALUES ('37070', '1', 'http://localhost:8080/sys/role', '0:0:0:0:0:0:0:1', '/sys/role/setVisible', null, '', '0', 'com.jcbase.controller.sys.RoleController', 'setVisible', '2017-11-28 11:23:14', '0', null);
INSERT INTO `sys_log` VALUES ('37071', '1', 'http://localhost:8080/sys/role', '0:0:0:0:0:0:0:1', '/sys/role/setVisible', null, '', '0', 'com.jcbase.controller.sys.RoleController', 'setVisible', '2017-11-28 11:23:17', '51', null);
INSERT INTO `sys_log` VALUES ('37072', '1', 'http://localhost:8080/sys/role', '0:0:0:0:0:0:0:1', '/sys/role/getListData', null, '', '0', 'com.jcbase.controller.sys.RoleController', 'getListData', '2017-11-28 11:23:18', '7', null);
INSERT INTO `sys_log` VALUES ('37073', '1', 'http://localhost:8080/sys/role', '0:0:0:0:0:0:0:1', '/sys/role/setVisible', null, '', '0', 'com.jcbase.controller.sys.RoleController', 'setVisible', '2017-11-28 11:23:21', '43', null);
INSERT INTO `sys_log` VALUES ('37074', '1', 'http://localhost:8080/sys/role', '0:0:0:0:0:0:0:1', '/sys/role/getListData', null, '', '0', 'com.jcbase.controller.sys.RoleController', 'getListData', '2017-11-28 11:23:22', '7', null);
INSERT INTO `sys_log` VALUES ('37075', '1', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '/sys/user', null, '', '0', 'com.jcbase.controller.sys.UserController', 'index', '2017-11-28 11:23:26', '0', null);
INSERT INTO `sys_log` VALUES ('37076', '1', 'http://localhost:8080/sys/user', '0:0:0:0:0:0:0:1', '/sys/user/getListData', null, '', '0', 'com.jcbase.controller.sys.UserController', 'getListData', '2017-11-28 11:23:26', '6', null);
INSERT INTO `sys_log` VALUES ('37077', '1', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '/dict', null, '', '0', 'com.jcbase.controller.sys.DictController', 'index', '2017-11-28 11:23:52', '0', null);
INSERT INTO `sys_log` VALUES ('37078', '1', 'http://localhost:8080/dict', '0:0:0:0:0:0:0:1', '/dict/getTypeListData', null, '', '0', 'com.jcbase.controller.sys.DictController', 'getTypeListData', '2017-11-28 11:23:52', '4', null);
INSERT INTO `sys_log` VALUES ('37079', '1', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '/dict/data_index', null, '', '0', 'com.jcbase.controller.sys.DictController', 'data_index', '2017-11-28 11:23:57', '0', null);
INSERT INTO `sys_log` VALUES ('37080', '1', 'http://localhost:8080/dict/data_index?typeId=3', '0:0:0:0:0:0:0:1', '/dict/getListData', null, '', '0', 'com.jcbase.controller.sys.DictController', 'getListData', '2017-11-28 11:23:57', '6', null);
INSERT INTO `sys_log` VALUES ('37081', null, 'http://localhost:8080/login', '0:0:0:0:0:0:0:1', '/image/getCode', null, '', '0', 'com.jcbase.controller.ImageController', 'getCode', '2017-11-28 11:54:22', '216', null);
INSERT INTO `sys_log` VALUES ('37082', null, 'http://localhost:8080/login', '0:0:0:0:0:0:0:1', '/image/getCode', null, '', '0', 'com.jcbase.controller.ImageController', 'getCode', '2017-11-28 16:40:51', '893', null);
INSERT INTO `sys_log` VALUES ('37083', null, 'http://localhost:8080/login', '0:0:0:0:0:0:0:1', '/image/getCode', null, '', '0', 'com.jcbase.controller.ImageController', 'getCode', '2017-11-28 16:41:10', '27', null);
INSERT INTO `sys_log` VALUES ('37084', '1', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '/sys/res', null, '', '0', 'com.jcbase.controller.sys.ResController', 'index', '2017-11-28 16:41:19', '1', null);
INSERT INTO `sys_log` VALUES ('37085', '1', 'http://localhost:8080/sys/res', '0:0:0:0:0:0:0:1', '/sys/res/getTreeGridView', null, '', '0', 'com.jcbase.controller.sys.ResController', 'getTreeGridView', '2017-11-28 16:41:20', '68', null);
INSERT INTO `sys_log` VALUES ('37086', '1', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '/sys/role', null, '', '0', 'com.jcbase.controller.sys.RoleController', 'index', '2017-11-28 16:41:26', '0', null);
INSERT INTO `sys_log` VALUES ('37087', '1', 'http://localhost:8080/sys/role', '0:0:0:0:0:0:0:1', '/sys/role/getListData', null, '', '0', 'com.jcbase.controller.sys.RoleController', 'getListData', '2017-11-28 16:41:26', '12', null);
INSERT INTO `sys_log` VALUES ('37088', '1', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '/sys/user', null, '', '0', 'com.jcbase.controller.sys.UserController', 'index', '2017-11-28 16:41:28', '0', null);
INSERT INTO `sys_log` VALUES ('37089', '1', 'http://localhost:8080/sys/user', '0:0:0:0:0:0:0:1', '/sys/user/getListData', null, '', '0', 'com.jcbase.controller.sys.UserController', 'getListData', '2017-11-28 16:41:28', '32', null);
INSERT INTO `sys_log` VALUES ('37090', '1', 'http://localhost:8080/', '0:0:0:0:0:0:0:1', '/dict', null, '', '0', 'com.jcbase.controller.sys.DictController', 'index', '2017-11-28 16:41:31', '0', null);
INSERT INTO `sys_log` VALUES ('37091', '1', 'http://localhost:8080/dict', '0:0:0:0:0:0:0:1', '/dict/getTypeListData', null, '', '0', 'com.jcbase.controller.sys.DictController', 'getTypeListData', '2017-11-28 16:41:32', '5', null);

-- ----------------------------
-- Table structure for sys_login_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_record`;
CREATE TABLE `sys_login_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_uid` int(11) NOT NULL,
  `login_date` datetime NOT NULL COMMENT '登陆时间',
  `login_err_times` int(11) NOT NULL COMMENT '1天内连续出错次数',
  `login_status` tinyint(4) NOT NULL COMMENT '1-成功  0-失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='后台系统登陆记录';

-- ----------------------------
-- Records of sys_login_record
-- ----------------------------
INSERT INTO `sys_login_record` VALUES ('16', '1', '2017-11-28 11:22:40', '0', '1');
INSERT INTO `sys_login_record` VALUES ('17', '1', '2017-11-28 11:54:37', '0', '1');
INSERT INTO `sys_login_record` VALUES ('18', '1', '2017-11-28 16:41:13', '0', '1');

-- ----------------------------
-- Table structure for sys_res
-- ----------------------------
DROP TABLE IF EXISTS `sys_res`;
CREATE TABLE `sys_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(111) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `iconCls` varchar(255) DEFAULT 'am-icon-file',
  `seq` int(11) DEFAULT '1',
  `type` int(1) DEFAULT '2' COMMENT '1 功能 2 权限',
  `modifydate` timestamp NULL DEFAULT NULL,
  `enabled` int(1) DEFAULT '1' COMMENT '是否启用 1：启用  0：禁用',
  `level` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

-- ----------------------------
-- Records of sys_res
-- ----------------------------
INSERT INTO `sys_res` VALUES ('1', null, '系统管理', '系统管理', '', 'fa-cogs', '10', '1', null, '1', '0');
INSERT INTO `sys_res` VALUES ('2', '1', '资源管理', null, '/sys/res', 'fa-list', '1', '1', null, '1', '1');
INSERT INTO `sys_res` VALUES ('3', '1', '角色管理', null, '/sys/role', 'fa-list', '10', '1', null, '1', '1');
INSERT INTO `sys_res` VALUES ('4', '1', '用户管理', null, '/sys/user', 'fa-list', '11', '1', null, '1', '1');
INSERT INTO `sys_res` VALUES ('9', '4', '用户删除', null, '/sys/user/delete', 'fa-list', '1', '2', null, '1', '2');
INSERT INTO `sys_res` VALUES ('12', '4', '搜索用户', null, '/sys/user/serach', 'fa-list', '1', '2', null, '1', '2');
INSERT INTO `sys_res` VALUES ('18', '2', '资源删除', null, '/sys/res/delete', 'fa-list', '11', '2', null, '1', '0');
INSERT INTO `sys_res` VALUES ('19', '2', '资源保存', null, '/sys/res/save', 'fa-list', '11', '2', null, '1', '0');
INSERT INTO `sys_res` VALUES ('28', '3', '角色删除', null, '/sys/role/delete', 'fa-list', '11', '2', null, '1', '0');
INSERT INTO `sys_res` VALUES ('29', '3', '角色保存', null, '/sys/role/save', 'fa-list', '11', '2', null, '1', '0');
INSERT INTO `sys_res` VALUES ('63', '4', '冻结用户', null, '/sys/user/freeze', 'fa-list', '11', '2', null, '1', '0');
INSERT INTO `sys_res` VALUES ('146', '4', '用户列表', null, '/sys/user/list', 'fa-list', '8', '2', null, '1', '0');
INSERT INTO `sys_res` VALUES ('147', '4', '用户保存', null, '/sys/user/save', 'fa-list', '10', '2', null, '1', '0');
INSERT INTO `sys_res` VALUES ('150', '1', '操作日志', null, '/sys/log', 'fa-list', '11', '1', null, '1', '0');
INSERT INTO `sys_res` VALUES ('152', null, '控制台', '1234', '/', 'fa-desktop', '1', '1', '2015-02-10 16:09:40', '1', '0');
INSERT INTO `sys_res` VALUES ('181', '1', '数据字典', null, '/dict', 'fa-list', '12', '1', null, '1', '0');
INSERT INTO `sys_res` VALUES ('182', '181', '数据字典列表', null, '/dict/list', 'fa-list', '1', '2', null, '1', '0');
INSERT INTO `sys_res` VALUES ('192', null, 'APP管理', null, '', 'fa-android', '9', '1', null, '1', '0');
INSERT INTO `sys_res` VALUES ('193', '192', 'App版本管理', null, '/app', '', '1', '1', null, '1', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL DEFAULT '',
  `des` varchar(55) DEFAULT NULL,
  `seq` int(11) DEFAULT '1',
  `createdate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '0-禁用  1-启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', '超级管理员', '1', '2015-05-05 14:24:26', '1');
INSERT INTO `sys_role` VALUES ('56', '内容编辑', '内容编辑4', '1', null, '1');
INSERT INTO `sys_role` VALUES ('57', '客服人员', '客服人员', '1', null, '1');
INSERT INTO `sys_role` VALUES ('60', 'dd', 'ss ', '1', null, '1');

-- ----------------------------
-- Table structure for sys_role_res
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_res`;
CREATE TABLE `sys_role_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `res_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sys_ROLE_RES_RES_ID` (`res_id`),
  KEY `FK_sys_ROLE_RES_ROLE_ID` (`role_id`),
  CONSTRAINT `sys_role_res_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `sys_res` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_role_res_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4175 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色-节点表';

-- ----------------------------
-- Records of sys_role_res
-- ----------------------------
INSERT INTO `sys_role_res` VALUES ('4141', '1', '1');
INSERT INTO `sys_role_res` VALUES ('4142', '2', '1');
INSERT INTO `sys_role_res` VALUES ('4143', '18', '1');
INSERT INTO `sys_role_res` VALUES ('4144', '19', '1');
INSERT INTO `sys_role_res` VALUES ('4145', '3', '1');
INSERT INTO `sys_role_res` VALUES ('4146', '28', '1');
INSERT INTO `sys_role_res` VALUES ('4147', '29', '1');
INSERT INTO `sys_role_res` VALUES ('4148', '4', '1');
INSERT INTO `sys_role_res` VALUES ('4149', '9', '1');
INSERT INTO `sys_role_res` VALUES ('4150', '12', '1');
INSERT INTO `sys_role_res` VALUES ('4151', '63', '1');
INSERT INTO `sys_role_res` VALUES ('4152', '146', '1');
INSERT INTO `sys_role_res` VALUES ('4153', '147', '1');
INSERT INTO `sys_role_res` VALUES ('4154', '150', '1');
INSERT INTO `sys_role_res` VALUES ('4155', '181', '1');
INSERT INTO `sys_role_res` VALUES ('4156', '182', '1');
INSERT INTO `sys_role_res` VALUES ('4157', '152', '1');
INSERT INTO `sys_role_res` VALUES ('4162', '192', '1');
INSERT INTO `sys_role_res` VALUES ('4163', '193', '1');
INSERT INTO `sys_role_res` VALUES ('4168', '1', '56');
INSERT INTO `sys_role_res` VALUES ('4169', '2', '56');
INSERT INTO `sys_role_res` VALUES ('4170', '18', '56');
INSERT INTO `sys_role_res` VALUES ('4171', '19', '56');
INSERT INTO `sys_role_res` VALUES ('4172', '3', '56');
INSERT INTO `sys_role_res` VALUES ('4173', '28', '56');
INSERT INTO `sys_role_res` VALUES ('4174', '29', '56');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SYSTME_USER_ROLE_USER_ID` (`user_id`),
  KEY `FK_SYSTME_USER_ROLE_ROLE_ID` (`role_id`),
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('315', '1', '1');
INSERT INTO `sys_user_role` VALUES ('333', '32', '1');
INSERT INTO `sys_user_role` VALUES ('334', '32', '56');
INSERT INTO `sys_user_role` VALUES ('335', '32', '57');
INSERT INTO `sys_user_role` VALUES ('336', '32', '60');

-- ----------------------------
-- Table structure for user_attention
-- ----------------------------
DROP TABLE IF EXISTS `user_attention`;
CREATE TABLE `user_attention` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `attention_id` int(11) DEFAULT NULL COMMENT '关注id',
  `attention_dt` datetime DEFAULT NULL COMMENT '关注时间',
  `dr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_4` (`user_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`user_id`) REFERENCES `bl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关注表';

-- ----------------------------
-- Records of user_attention
-- ----------------------------

-- ----------------------------
-- Table structure for user_comment
-- ----------------------------
DROP TABLE IF EXISTS `user_comment`;
CREATE TABLE `user_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL COMMENT '文章id',
  `commit_user_id` int(11) DEFAULT NULL COMMENT '评论者id',
  `commit_content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `commit_dt` datetime DEFAULT NULL COMMENT '评论时间',
  `dr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_9` (`content_id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`content_id`) REFERENCES `content_info` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of user_comment
-- ----------------------------

-- ----------------------------
-- Table structure for user_rank
-- ----------------------------
DROP TABLE IF EXISTS `user_rank`;
CREATE TABLE `user_rank` (
  `rank_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_rank_id` int(11) NOT NULL COMMENT '等级id',
  `rank_mark` int(11) DEFAULT NULL COMMENT '等级积分',
  `rank_name` varchar(32) DEFAULT NULL COMMENT '等级名称',
  `dr` int(11) NOT NULL,
  PRIMARY KEY (`rank_id`),
  KEY `FK_Reference_1` (`user_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`user_id`) REFERENCES `bl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户等级表';

-- ----------------------------
-- Records of user_rank
-- ----------------------------

-- ----------------------------
-- Table structure for visitor
-- ----------------------------
DROP TABLE IF EXISTS `visitor`;
CREATE TABLE `visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitor_id` int(11) DEFAULT NULL COMMENT '浏览者',
  `user_id` int(11) DEFAULT NULL COMMENT '作者',
  `visitor_time` datetime DEFAULT NULL COMMENT '浏览时间',
  `dr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='浏览记录表';

-- ----------------------------
-- Records of visitor
-- ----------------------------
