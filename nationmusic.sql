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

 Date: 11/01/2020 10:10:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of music
-- ----------------------------
INSERT INTO `music` VALUES (23, '康定情人', '扎西尼玛', '在那溜溜的跑马山上 有一座古老的城 在那溜溜的打曲河边 住着我的情人 在那溜溜的康定城边 有一首古老的歌 我唱着那溜溜的情歌 等着我的情人', '/nationMusic_war_exploded/music/康定情人 - 扎西尼玛.mp3', '藏族');
INSERT INTO `music` VALUES (24, '酒歌(藏族民歌)', '才旦卓玛', '啊 朋友 啊 朋友 尊贵的朋友', '/nationMusic_war_exploded/music/酒歌(藏族民歌) - 才旦卓玛.mp3', '藏族');
INSERT INTO `music` VALUES (36, '次仁拉索(藏语)', '巴桑', '第一次听到这首歌是在电影《红河谷》中，凄美而悲壮。后来工作原因，多次走进红河谷，对那片土地和土地上的人很有感情。不论多少次听到这首歌，我依然会莫名的感动。巴桑的这首，既有藏地的原生态，又有发声方法上的改良，如饮甘泉，清澈委婉；如饮美酒，醇厚迷人；更像一杯浓浓的酥油茶，沁人心脾！', '/nationMusic_war_exploded/music/次仁拉索(藏语) - 巴桑.mp3', '藏族');
INSERT INTO `music` VALUES (37, '草原情歌', '三智才让 / 谢旦', 'རྩྭ་ཐང་གི་འཁྲེང་སེམས། ཚིག གངས་དཔལ། དབྱངས།མགར་བསམ་འགྲུབ་ཚེ་རིང་། དཔའ་རིས རིག་འཛིན་རྡོ་རྗེ་', '/nationMusic_war_exploded/music/草原情歌 - 三智才让.mp3', '藏族');
INSERT INTO `music` VALUES (38, '敬酒歌(彝族对唱)', '阿果', '（女）远方的贵宾四方的朋友 （男）我们不长聚难有相见时 （女）彝家有传统待客先用酒 （男）彝乡多美酒美酒敬宾朋 （合）请喝一杯酒呀 （合）请喝一杯酒哟', '/nationMusic_war_exploded/music/敬酒歌(彝族对唱) - 阿果.mp3', '彝族');
INSERT INTO `music` VALUES (39, '彝族酒歌左脚舞', '哏德全', '彝族歌曲', '/nationMusic_war_exploded/music/彝族酒歌左脚舞 - 哏德全.mp3', '彝族');
INSERT INTO `music` VALUES (40, '彝族民谣', '奥杰阿格', '诺苏是自带时尚属性的民族，彝族音乐从来都觉得很新鲜好听，彝族服饰及舞蹈也是非常好看呢，尤其是美姑的瓦盖是我最喜欢的。Ps:喜欢彝族歌曲的可以听听我的歌单哈', '/nationMusic_war_exploded/music/彝族民谣 - 奥杰阿格.mp3', '彝族');
INSERT INTO `music` VALUES (41, '测试', '彭路尧', '音乐测试', '/nationMusic_war_exploded/music/彝族民谣 - 奥杰阿格.mp3', '彝族');

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
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`list`) REFERENCES `songlist` (`listid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`music`) REFERENCES `music` (`musicid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '音乐和歌单的关联\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (7, 4, 24);
INSERT INTO `order` VALUES (9, 4, 39);
INSERT INTO `order` VALUES (10, 5, 37);
INSERT INTO `order` VALUES (11, 5, 23);
INSERT INTO `order` VALUES (12, 5, 23);

-- ----------------------------
-- Table structure for songlist
-- ----------------------------
DROP TABLE IF EXISTS `songlist`;
CREATE TABLE `songlist`  (
  `listid` int(11) NOT NULL AUTO_INCREMENT,
  `listname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '歌单名',
  `user` int(11) NOT NULL COMMENT '歌单主人',
  PRIMARY KEY (`listid`) USING BTREE,
  INDEX `user`(`user`) USING BTREE,
  CONSTRAINT `songlist_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of songlist
-- ----------------------------
INSERT INTO `songlist` VALUES (4, '我的喜欢', 1);
INSERT INTO `songlist` VALUES (5, '我收藏的藏族歌曲', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userpassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '彭路尧', '123456');
INSERT INTO `user` VALUES (2, 'aaa', '123');
INSERT INTO `user` VALUES (3, '张钦', '66666');

SET FOREIGN_KEY_CHECKS = 1;
