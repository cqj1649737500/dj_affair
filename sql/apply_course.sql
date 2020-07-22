/*
Navicat MySQL Data Transfer

Source Server         : qqq
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : dj_school

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-07-22 12:26:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for apply_course
-- ----------------------------
DROP TABLE IF EXISTS `apply_course`;
CREATE TABLE `apply_course` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL COMMENT '课程id',
  `user_teacher_id` int(11) DEFAULT NULL COMMENT '教师id---user表level为1的用户',
  `user_admin_id` int(11) DEFAULT NULL COMMENT '管理员id---user表level为0的用户',
  `status` int(11) DEFAULT NULL COMMENT '1,同意 2拒绝,0待确定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_course
-- ----------------------------
