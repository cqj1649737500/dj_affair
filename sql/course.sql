/*
Navicat MySQL Data Transfer

Source Server         : qqq
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : dj_school

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-07-22 12:25:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `course_name` varchar(255) DEFAULT NULL COMMENT '课程名字',
  `course_period` int(11) DEFAULT NULL COMMENT '课时（一共多少节课）',
  `course_type` varchar(255) DEFAULT NULL COMMENT '课程状态',
  `user_teacher_id` int(11) DEFAULT NULL COMMENT '教师id---user表level为1的用户',
  `course_number` int(11) DEFAULT NULL COMMENT '课程编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
