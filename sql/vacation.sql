/*
Navicat MySQL Data Transfer

Source Server         : qqq
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : dj_school

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-07-22 11:36:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for vacation
-- ----------------------------
DROP TABLE IF EXISTS `vacation`;
CREATE TABLE `vacation` (
  `id` int(11) NOT NULL,
  `vacation_time` datetime DEFAULT NULL COMMENT '请假开始日期',
  `end_time` datetime DEFAULT NULL COMMENT '请假截至日期',
  `user_vacation_id` int(11) DEFAULT NULL COMMENT '请假人id(教师id)---用户表用户level=1的用户',
  `user_approve_id` int(11) DEFAULT NULL COMMENT '审批人id--用户表level=0的用户',
  `stauts` int(11) DEFAULT NULL COMMENT '0:待审批，1通过，2拒绝',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vacation
-- ----------------------------
