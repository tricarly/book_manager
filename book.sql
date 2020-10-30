/*
 Navicat Premium Data Transfer

 Source Server         : conn
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : book

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 30/10/2020 10:55:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `bid` int(0) NOT NULL AUTO_INCREMENT COMMENT '图书编号，主键自增',
  `bookname` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书名称，不可重复',
  `price` double NOT NULL COMMENT '价格',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `sale` int(0) NOT NULL COMMENT '销量',
  `stock` int(0) NOT NULL COMMENT '库存',
  `picture` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书的图片名称',
  `createtime` date NOT NULL COMMENT '图书的增加日期',
  PRIMARY KEY (`bid`) USING BTREE,
  UNIQUE INDEX `bookname`(`bookname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '岛上书店', 30, '（美）加布瑞埃拉·泽文', 2000, 5000, '2324cfb8-5f9b-4318-9ebc-c0bb694bbbb1.jpg', '2020-10-26');
INSERT INTO `book` VALUES (2, '小王子', 24, '安托万·德·圣·埃克苏佩里', 2600, 6000, '1d72bd0a-80c8-46a4-8d7c-4426a80bac91.jpg', '2020-10-26');
INSERT INTO `book` VALUES (3, '平凡的世界', 32, '路遥', 3200, 5000, 'f04993a0-ee19-47c0-bf17-390615c4a6e0.jpg', '2020-10-26');
INSERT INTO `book` VALUES (4, '悟空传', 25, '今何在', 2500, 4000, '196baa3a-b771-446d-984f-cbe877929fe2.jpg', '2020-10-26');
INSERT INTO `book` VALUES (5, '数学之美', 18, '吴军', 2000, 3500, 'a0856a86-805b-49f2-8b8f-e9f6d9a042b9.jpg', '2020-10-26');
INSERT INTO `book` VALUES (6, '苏东坡传', 22, '林语堂', 2300, 5500, 'aa779463-94a4-465a-b420-6004974eef31.jpg', '2020-10-26');
INSERT INTO `book` VALUES (7, '边城', 25, '沈从文', 4300, 6000, '7d30eb29-7e44-4885-8876-dd3faca46c8c.jpg', '2020-10-27');
INSERT INTO `book` VALUES (8, '活着', 28, '余华', 2300, 5000, 'c60b7f15-0754-4a64-8f5c-0ddd0df20602.jpg', '2020-10-27');
INSERT INTO `book` VALUES (9, '扶桑', 32, '严歌岑', 3800, 5600, 'e3f23312-59a0-4d9c-976d-041a27561890.jpg', '2020-10-27');
INSERT INTO `book` VALUES (10, '看见', 18, '柴静', 2800, 4500, 'b51a97f1-6dd4-4ce4-836f-45386080ea62.jpg', '2020-10-28');
INSERT INTO `book` VALUES (11, '三体', 32, '刘慈欣', 5000, 6500, '2905dff3-b194-4e45-b82f-f58c1af1f9ee.jpg', '2020-10-28');
INSERT INTO `book` VALUES (12, 'C语言入门经典', 36, '(美国)霍顿(Ivor Horton)', 5300, 7200, 'a95a193b-a818-4519-a8fd-b500fb7ac3cc.jpg', '2020-10-29');
INSERT INTO `book` VALUES (13, 'Java编程思想', 35, '布鲁斯·埃克尔（Bruce Eckel）', 4500, 6800, '8e55982d-8d64-4764-bebb-29779f3ad746.jpg', '2020-10-29');
INSERT INTO `book` VALUES (14, '艾伦·图灵传', 24, '[英]安德鲁·霍奇斯', 3900, 5200, '9552c115-cec0-4c7a-b881-15c52a526872.jpg', '2020-10-29');
INSERT INTO `book` VALUES (15, '百年孤独', 36, '[哥伦比亚] 加夫列尔·加西亚·马尔克斯', 5400, 6500, '9aff55f8-3c0e-4f1b-a44a-ab44b2b45ecb.jpg', '2020-10-29');
INSERT INTO `book` VALUES (16, '从晚清到民国', 20, '唐德刚（美）', 3300, 5600, '298f66f9-4a5c-4f0d-a93f-71a77a2c88fa.jpg', '2020-10-29');
INSERT INTO `book` VALUES (17, '大数据预测', 24, '【美】埃里克·西格尔', 2300, 5400, '365160c3-c200-4ca0-9b93-61f4bf8b6728.jpg', '2020-10-29');
INSERT INTO `book` VALUES (18, '给孩子的诗', 26, '北岛', 2600, 5000, '454fd800-b9b0-49e8-9674-e6fcde822e17.jpg', '2020-10-29');
INSERT INTO `book` VALUES (19, '忽然七日', 34, '劳伦·奥利弗', 2500, 6200, 'd70e867d-8020-4e4e-8e83-d043ffe1bc42.jpg', '2020-10-29');
INSERT INTO `book` VALUES (20, '教父', 34, '马里奥·普佐', 3600, 5300, 'e8cdec2c-1240-45e7-9863-c2ba416551f6.jpg', '2020-10-29');
INSERT INTO `book` VALUES (21, '解忧杂货店', 27, '【日】东野圭吾', 4600, 6700, 'd303af99-12c0-4e1b-bf49-fa223ec81e00.jpg', '2020-10-29');
INSERT INTO `book` VALUES (22, '皮囊', 27, '蔡崇达', 3400, 5100, '39160975-0210-4b88-988c-a5aa20fb7d14.jpg', '2020-10-29');
INSERT INTO `book` VALUES (23, '恰到好处的幸福', 31, '毕淑敏', 3500, 5700, '2b5843e0-2b25-48cc-a102-61fd5c5dbfc4.jpg', '2020-10-29');
INSERT INTO `book` VALUES (24, '人月神话', 37, '布鲁克斯(FrederickP.Brooks.Jr.)', 2400, 4800, '3843788e-713f-4245-87dd-7d5551671a3c.jpg', '2020-10-29');
INSERT INTO `book` VALUES (25, '设计模式之禅', 26, '秦小波', 3000, 5000, '7dc652e4-f482-4466-b9d5-f8f389beaf51.jpg', '2020-10-29');
INSERT INTO `book` VALUES (26, '生命不息', 26, '凯特·阿特金森', 3500, 5600, '5198dda3-4dff-4252-b66d-5055461f68db.jpg', '2020-10-29');
INSERT INTO `book` VALUES (27, '图解机器学习', 34, '杉山将', 3900, 5200, '37622253-ae0e-4637-a4c4-b9f9a14b3ef6.jpg', '2020-10-29');
INSERT INTO `book` VALUES (28, '为奴十二年', 35, '所罗门·诺瑟普', 4400, 6300, '200d1a52-e2ca-4d6a-b09a-6dabe0032ae8.jpg', '2020-10-29');
INSERT INTO `book` VALUES (29, '我们仨', 26, '杨绛', 4200, 6400, 'd25e05cc-6a42-4106-85b9-be05b4e35719.jpg', '2020-10-29');
INSERT INTO `book` VALUES (30, '硬派健身', 18, '斌卡', 2200, 4600, 'd07456a0-17fd-42ac-b359-d80e4a4b1cf0.jpg', '2020-10-29');
INSERT INTO `book` VALUES (31, '中国哲学史', 30, '冯友兰', 4500, 6600, '095eebb0-bca0-4563-a59f-6ee733510828.jpg', '2020-10-29');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` date NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', '330300198@qq.com', '2020-10-22');
INSERT INTO `user` VALUES (2, '123', '123456', '123@qq.com', '2020-10-23');
INSERT INTO `user` VALUES (3, 'root', '123456', 'root@qq.com', '2020-10-23');

SET FOREIGN_KEY_CHECKS = 1;
