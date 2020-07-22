/*
Navicat MySQL Data Transfer

Source Server         : qqq
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : dj_school

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-07-22 11:36:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for stu_grade
-- ----------------------------
DROP TABLE IF EXISTS `stu_grade`;
CREATE TABLE `stu_grade` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id---学生id(给学生成绩)',
  `course_id` int(11) DEFAULT NULL COMMENT '课程id',
  `grade` int(11) DEFAULT NULL COMMENT '1:优秀，2良好，3：及格，4：不及格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_grade
-- ----------------------------
