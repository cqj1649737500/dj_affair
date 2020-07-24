/*
Navicat MySQL Data Transfer

Source Server         : dj-1906
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : dj_school

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-07-24 10:19:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) DEFAULT '' COMMENT '课程名字',
  `course_period` int(11) DEFAULT NULL COMMENT '课时（一共多少节课）',
  `course_type` varchar(255) DEFAULT NULL COMMENT '课程类型0政治1社会2文科3理科',
  `course_number` int(11) DEFAULT NULL COMMENT '课程编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
