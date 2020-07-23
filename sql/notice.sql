/*
Navicat MySQL Data Transfer

Source Server         : dj_1906
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : dj_school

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-07-23 17:30:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vacation_user_id` int(11) DEFAULT NULL COMMENT '用户id 连表name',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
