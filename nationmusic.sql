/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : nationmusic

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 05/12/2019 14:26:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for list
-- ----------------------------
DROP TABLE IF EXISTS `list`;
CREATE TABLE `list`  (
  `listid` int(11) NOT NULL AUTO_INCREMENT,
  `listname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '歌单名',
  `user` int(11) NOT NULL COMMENT '歌单主人',
  PRIMARY KEY (`listid`) USING BTREE,
  INDEX `user`(`user`) USING BTREE,
  CONSTRAINT `list_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for music
-- ----------------------------
DROP TABLE IF EXISTS `music`;
CREATE TABLE `music`  (
  `musicid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '歌名',
  `singer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '歌手',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '音乐文件保存路径',
  `nation` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属民族',
  PRIMARY KEY (`musicid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of music
-- ----------------------------
INSERT INTO `music` VALUES (1, '2002年的第一场雪', '刀郎', '经典老歌', 'C盘', '汉族');
INSERT INTO `music` VALUES (2, '卓玛', '降央卓玛', '经典歌曲', 'F盘', '藏族');
INSERT INTO `music` VALUES (3, '哈达', '泽旺多吉', '民族歌曲', 'D盘', '藏族');
INSERT INTO `music` VALUES (4, '妈妈盖亚', '央吉玛', '好歌', 'C盘', '藏族');
INSERT INTO `music` VALUES (5, '花儿为你开', '吉狄康帅', '一首好听的歌', 'C盘', '彝族');
INSERT INTO `music` VALUES (6, '山风一样自由', '阿鲁阿卓', '一首我没听过的歌', 'E盘', '彝族');
INSERT INTO `music` VALUES (12, '中央民族大学歌曲', '中央民族大学学生', '一首民族团结的歌', 'E盘', '56个民族');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `list` int(11) NOT NULL,
  `music` int(11) NOT NULL,
  PRIMARY KEY (`orderid`) USING BTREE,
  INDEX `list`(`list`) USING BTREE,
  INDEX `music`(`music`) USING BTREE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`list`) REFERENCES `list` (`listid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`music`) REFERENCES `music` (`musicid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '音乐和歌单的关联\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userpassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '彭路尧', '123456');

SET FOREIGN_KEY_CHECKS = 1;
