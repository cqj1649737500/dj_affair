/*
Navicat MySQL Data Transfer

Source Server         : qqq
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : dj_school

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-07-22 11:36:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for stu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `stu_teacher`;
CREATE TABLE `stu_teacher` (
  `id` int(11) NOT NULL,
  `user_stu_id` int(11) DEFAULT NULL COMMENT '学生user表level=2',
  `user_teacher_id` int(11) DEFAULT NULL COMMENT '教师id,用户表level=1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_teacher
-- ----------------------------
