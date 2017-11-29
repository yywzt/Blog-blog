/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-14 16:35:45
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
-- Table structure for blog_info
-- ----------------------------
DROP TABLE IF EXISTS `blog_info`;
CREATE TABLE `blog_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) DEFAULT NULL,
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
-- Table structure for bl_friend
-- ----------------------------
DROP TABLE IF EXISTS `bl_friend`;
CREATE TABLE `bl_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) NOT NULL COMMENT '用户id',
  `friend_id` varchar(10) NOT NULL COMMENT '好友id',
  `add_dt` datetime DEFAULT NULL COMMENT '成为好友时间',
  `dr` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_3` (`user_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`user_id`) REFERENCES `bl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好友表';

-- ----------------------------
-- Records of bl_friend
-- ----------------------------

-- ----------------------------
-- Table structure for bl_user
-- ----------------------------
DROP TABLE IF EXISTS `bl_user`;
CREATE TABLE `bl_user` (
  `user_id` varchar(10) NOT NULL,
  `user_name` varchar(32) NOT NULL COMMENT '用户名',
  `user_pwd` varchar(32) NOT NULL COMMENT '用户密码',
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
  `dr` smallint(6) unsigned zerofill NOT NULL COMMENT '删除标志',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of bl_user
-- ----------------------------

-- ----------------------------
-- Table structure for content_info
-- ----------------------------
DROP TABLE IF EXISTS `content_info`;
CREATE TABLE `content_info` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) DEFAULT NULL COMMENT '用户id',
  `type_id` varchar(10) DEFAULT NULL COMMENT '文章分类id\r\n            ',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `create_dt` datetime DEFAULT NULL COMMENT '创建时间',
  `read_count` int(11) DEFAULT NULL COMMENT '阅读量',
  `laud_count` int(11) DEFAULT NULL COMMENT '赞-个数',
  `comment_count` int(11) DEFAULT NULL COMMENT '评论数量',
  `dr` int(11) DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  KEY `FK_Reference_8` (`user_id`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`user_id`) REFERENCES `bl_user` (`user_id`)
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
  `bl__user_id` varchar(10) DEFAULT NULL COMMENT '用户表_用户id',
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
  `send_id` varchar(10) DEFAULT NULL COMMENT '发送者id',
  `receive_id` varchar(10) DEFAULT NULL COMMENT '收信者ID',
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
  `user_id` varchar(10) DEFAULT NULL COMMENT '此留言拥有者',
  `stay_user_id` varchar(10) DEFAULT NULL COMMENT '留言者ID',
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
  `receive_id` varchar(10) DEFAULT NULL COMMENT '接收者ID',
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
-- Table structure for user_attention
-- ----------------------------
DROP TABLE IF EXISTS `user_attention`;
CREATE TABLE `user_attention` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) DEFAULT NULL COMMENT '用户id',
  `attention_id` varchar(10) DEFAULT NULL COMMENT '关注id',
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
  `commit_user_id` varchar(10) DEFAULT NULL COMMENT '评论者id',
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
  `user_id` varchar(10) NOT NULL COMMENT '用户id',
  `user_rank_id` varchar(10) NOT NULL COMMENT '等级id',
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
  `visitor_id` varchar(10) DEFAULT NULL COMMENT '浏览者',
  `user_id` varchar(10) DEFAULT NULL COMMENT '作者',
  `visitor_time` datetime DEFAULT NULL COMMENT '浏览时间',
  `dr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='浏览记录表';

-- ----------------------------
-- Records of visitor
-- ----------------------------
