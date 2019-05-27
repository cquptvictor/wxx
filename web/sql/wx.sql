/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : wx

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-05-27 09:46:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `achievements`
-- ----------------------------
DROP TABLE IF EXISTS `achievements`;
CREATE TABLE `achievements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` char(64) NOT NULL,
  `achievement` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` char(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of achievements
-- ----------------------------
INSERT INTO `achievements` VALUES ('1', '2b4d74d2-a081-4914-a907-bcdb49194cbc', '1', 'bill');
INSERT INTO `achievements` VALUES ('2', '2b4d74d2-a081-4914-a907-bcdb49194cbc', '2', 'days');
INSERT INTO `achievements` VALUES ('3', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'bg49', 'bill');
INSERT INTO `achievements` VALUES ('4', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'bg1', 'bill');
INSERT INTO `achievements` VALUES ('5', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'bg1', 'bill');
INSERT INTO `achievements` VALUES ('6', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'bg49', 'bill');
INSERT INTO `achievements` VALUES ('7', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'bg49', 'bill');
INSERT INTO `achievements` VALUES ('8', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'dg30', 'day');
INSERT INTO `achievements` VALUES ('9', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'bg1', 'bill');
INSERT INTO `achievements` VALUES ('10', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'dg1', 'day');

-- ----------------------------
-- Table structure for `bill`
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `amount` float NOT NULL,
  `label` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remarks` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` char(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37784771 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('18892303', '2b4d74d2-a081-4914-a907-bcdb49194cbc', '11', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892305', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '23', 'income-3', '你好', '2019-05-16 20:52:17', '1');
INSERT INTO `bill` VALUES ('18892306', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '11', 'income-3', '你好', '2019-05-16 20:52:17', '1');
INSERT INTO `bill` VALUES ('18892307', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '1', 'income-0', '你好', '2019-05-16 20:52:17', '1');
INSERT INTO `bill` VALUES ('18892308', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '12', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892309', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '123', 'diet-3', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892310', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '58', 'diet-2-#o-3209', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892311', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '1', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892312', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '123', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892313', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '4', 'work-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892314', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '99', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892315', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '88', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892316', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '99', 'income-2', '你好', '2019-05-16 20:52:17', '1');
INSERT INTO `bill` VALUES ('18892317', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '15', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892318', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '100', 'work-0-#i-0866', '你好', '2019-05-16 20:52:17', '1');
INSERT INTO `bill` VALUES ('18892319', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '642', 'work-0-#i-1925', '你好', '2019-05-16 20:52:17', '1');
INSERT INTO `bill` VALUES ('18892320', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '11', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892321', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '15000', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892322', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '11', 'shopping-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892323', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '3154', 'funny-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892324', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '52', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892325', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '100', 'income-1', '你好', '2019-05-16 20:52:17', '1');
INSERT INTO `bill` VALUES ('18892326', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '1000', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892327', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '12', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892328', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '12', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892329', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '12', 'life-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892330', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '1', 'traffic-2-#o-4742', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892331', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '12', 'life-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892332', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '15', 'life-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892333', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '4', 'work-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892334', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '12', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892335', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '152', 'shopping-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892336', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '152', 'shopping-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892337', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '18', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892338', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '12', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892339', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '12', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892340', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '12', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('18892341', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '12', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784644', '2b4d74d2-a081-4914-a907-bcdb49194cbc', '37.1683', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784646', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '25.2418', 'income-3', '你好', '2019-05-16 20:52:17', '1');
INSERT INTO `bill` VALUES ('37784647', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '18.0799', 'income-3', '你好', '2019-05-16 20:52:17', '1');
INSERT INTO `bill` VALUES ('37784648', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '15.3423', 'income-0', '你好', '2019-05-16 20:52:17', '1');
INSERT INTO `bill` VALUES ('37784649', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '20.7848', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784650', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '160.831', 'diet-3', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784651', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '97.7202', 'diet-2-#o-3209', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784652', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '15.2068', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784653', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '135.449', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784654', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '12.6619', 'work-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784655', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '151.539', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784656', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '108.277', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784657', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '111.417', 'income-2', '你好', '2019-05-16 20:52:17', '1');
INSERT INTO `bill` VALUES ('37784658', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '68.4217', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784659', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '103.264', 'work-0-#i-0866', '你好', '2019-05-16 20:52:17', '1');
INSERT INTO `bill` VALUES ('37784660', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '723.215', 'work-0-#i-1925', '你好', '2019-05-16 20:52:17', '1');
INSERT INTO `bill` VALUES ('37784661', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '24.7081', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784662', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '15029.5', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784663', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '48.5249', 'shopping-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784664', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '3201.28', 'funny-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784665', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '112.688', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784666', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '127.508', 'income-1', '你好', '2019-05-16 20:52:17', '1');
INSERT INTO `bill` VALUES ('37784667', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '1076.47', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784668', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '17.336', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784669', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '25.1632', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784670', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '14.076', 'life-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784671', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '21.9752', 'traffic-2-#o-4742', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784672', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '91.8452', 'life-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784673', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '43.2822', 'life-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784674', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '22.7545', 'work-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784675', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '13.7952', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784676', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '217.318', 'shopping-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784677', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '176.89', 'shopping-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784678', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '103.054', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784679', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '104.015', 'medical-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784680', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '94.7958', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784681', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '56.9852', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784682', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '21.5576', 'diet-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784683', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '2', 'funny-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784684', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '1', 'funny-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784685', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '1', 'funny-0', '你好', '2019-05-16 20:52:17', '0');
INSERT INTO `bill` VALUES ('37784686', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '10', '1', '你好', '2017-05-04 00:00:00', '0');
INSERT INTO `bill` VALUES ('37784687', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '10', '1', '你好', '2017-05-04 00:00:00', '0');
INSERT INTO `bill` VALUES ('37784688', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '10', '1', '你好', '2017-05-04 00:00:00', '0');
INSERT INTO `bill` VALUES ('37784689', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '58', 'funny-0', 'fdsfsd', '2019-05-18 16:47:26', '0');
INSERT INTO `bill` VALUES ('37784690', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '5', 'funny-0', 'wew', '2019-05-18 16:48:36', '0');
INSERT INTO `bill` VALUES ('37784691', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '6', 'funny-0', 'hg', '2019-05-18 16:50:17', '0');
INSERT INTO `bill` VALUES ('37784692', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '5', 'funny-0', '3', '2019-05-18 19:24:31', '0');
INSERT INTO `bill` VALUES ('37784693', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '5', 'funny-0', '22', '2019-05-18 19:36:02', '0');
INSERT INTO `bill` VALUES ('37784694', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '5', 'funny-0', '22', '2019-05-18 19:36:02', '0');
INSERT INTO `bill` VALUES ('37784695', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '5', 'funny-0', 'ddd', '2019-05-18 19:44:39', '0');
INSERT INTO `bill` VALUES ('37784707', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '6', 'medical-0', '', '2019-05-18 20:23:21', '0');
INSERT INTO `bill` VALUES ('37784714', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '8', 'society-0', '', '2019-05-18 20:29:47', '0');
INSERT INTO `bill` VALUES ('37784715', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '8', 'medical-0', 'd\'s ', '2019-05-18 20:45:47', '0');
INSERT INTO `bill` VALUES ('37784716', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '6', 'funny-0', '', '2019-05-18 22:19:50', '0');
INSERT INTO `bill` VALUES ('37784717', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-18 22:21:24', '0');
INSERT INTO `bill` VALUES ('37784718', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-18 22:21:58', '0');
INSERT INTO `bill` VALUES ('37784719', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-21 20:08:40', '0');
INSERT INTO `bill` VALUES ('37784720', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-21 20:08:40', '0');
INSERT INTO `bill` VALUES ('37784721', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'diet-0', '', '2019-05-21 20:11:00', '0');
INSERT INTO `bill` VALUES ('37784722', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-21 20:12:09', '0');
INSERT INTO `bill` VALUES ('37784723', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '2', 'funny-0', '', '2019-05-21 20:13:03', '0');
INSERT INTO `bill` VALUES ('37784724', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '6', 'funny-0', '', '2019-05-21 20:13:36', '0');
INSERT INTO `bill` VALUES ('37784725', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '6', 'funny-0', '', '2019-05-21 20:15:50', '0');
INSERT INTO `bill` VALUES ('37784726', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-21 20:16:47', '0');
INSERT INTO `bill` VALUES ('37784727', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '6', 'funny-0', '', '2019-05-21 20:18:00', '0');
INSERT INTO `bill` VALUES ('37784728', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '9', 'funny-0', '', '2019-05-21 20:19:46', '0');
INSERT INTO `bill` VALUES ('37784729', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '1', 'funny-0', '', '2019-05-21 20:20:35', '0');
INSERT INTO `bill` VALUES ('37784730', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '2', 'funny-0', '', '2019-05-21 20:22:14', '0');
INSERT INTO `bill` VALUES ('37784731', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '3', 'funny-0', '', '2019-05-21 20:25:47', '0');
INSERT INTO `bill` VALUES ('37784732', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '4', 'funny-0', '', '2019-05-21 20:26:29', '0');
INSERT INTO `bill` VALUES ('37784733', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '1', 'funny-0', '', '2019-05-21 20:27:18', '0');
INSERT INTO `bill` VALUES ('37784734', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '3', 'medical-0', '', '2019-05-21 20:27:43', '0');
INSERT INTO `bill` VALUES ('37784735', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-21 20:33:59', '0');
INSERT INTO `bill` VALUES ('37784736', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '3', 'funny-0', '', '2019-05-21 20:35:37', '0');
INSERT INTO `bill` VALUES ('37784737', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-21 20:39:39', '0');
INSERT INTO `bill` VALUES ('37784738', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '1', 'funny-0', '', '2019-05-21 20:43:38', '0');
INSERT INTO `bill` VALUES ('37784739', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-21 20:57:48', '0');
INSERT INTO `bill` VALUES ('37784740', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-21 21:00:53', '0');
INSERT INTO `bill` VALUES ('37784741', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '2', 'funny-0', '', '2019-05-21 21:01:27', '0');
INSERT INTO `bill` VALUES ('37784742', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '6', 'funny-0', '', '2019-05-21 21:03:42', '0');
INSERT INTO `bill` VALUES ('37784743', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '3', 'funny-0', '', '2019-05-21 21:04:27', '0');
INSERT INTO `bill` VALUES ('37784744', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '2', 'funny-0', '', '2019-05-21 21:05:10', '0');
INSERT INTO `bill` VALUES ('37784745', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-21 21:07:30', '0');
INSERT INTO `bill` VALUES ('37784746', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '1', 'funny-0', '', '2019-05-21 21:08:52', '0');
INSERT INTO `bill` VALUES ('37784747', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '2', 'funny-0', '', '2019-05-21 21:12:13', '0');
INSERT INTO `bill` VALUES ('37784748', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '3', 'funny-0', '', '2019-05-21 21:12:23', '0');
INSERT INTO `bill` VALUES ('37784749', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '2', 'funny-0', '', '2019-05-21 21:14:01', '0');
INSERT INTO `bill` VALUES ('37784750', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-22 13:36:04', '0');
INSERT INTO `bill` VALUES ('37784751', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '3', 'funny-0', '', '2019-05-22 13:36:50', '0');
INSERT INTO `bill` VALUES ('37784752', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '205', 'medical-0', '', '2019-05-26 16:29:24', '0');
INSERT INTO `bill` VALUES ('37784755', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '202', 'funny-0', '服务', '2019-05-26 17:17:25', '0');
INSERT INTO `bill` VALUES ('37784756', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '30', 'diet-0', '', '2019-05-26 17:17:47', '0');
INSERT INTO `bill` VALUES ('37784757', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '30', 'diet-0', '', '2019-05-26 17:17:49', '0');
INSERT INTO `bill` VALUES ('37784758', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '30', 'funny-0', '', '2019-05-26 17:17:45', '0');
INSERT INTO `bill` VALUES ('37784759', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '399', 'life-0', '', '2019-05-26 17:17:59', '0');
INSERT INTO `bill` VALUES ('37784760', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '885', 'funny-0', '', '2019-05-26 17:18:09', '0');
INSERT INTO `bill` VALUES ('37784761', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '202', 'funny-0', '', '2019-05-26 17:19:35', '0');
INSERT INTO `bill` VALUES ('37784762', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '38', 'funny-0', '', '2019-05-26 17:31:06', '0');
INSERT INTO `bill` VALUES ('37784763', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '2', 'income-1', '', '2019-05-26 20:43:25', '1');
INSERT INTO `bill` VALUES ('37784764', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-26 20:54:25', '0');
INSERT INTO `bill` VALUES ('37784765', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-26 20:55:11', '0');
INSERT INTO `bill` VALUES ('37784766', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-26 20:55:53', '0');
INSERT INTO `bill` VALUES ('37784767', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-26 20:56:47', '0');
INSERT INTO `bill` VALUES ('37784768', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-26 20:57:16', '0');
INSERT INTO `bill` VALUES ('37784769', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '5', 'funny-0', '', '2019-05-26 20:57:43', '0');
INSERT INTO `bill` VALUES ('37784770', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '28', 'funny-0', 'vvvvvvv不不不宝贝宝贝拜拜不不不帮', '2019-05-27 09:44:51', '0');

-- ----------------------------
-- Table structure for `label`
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` varchar(64) NOT NULL,
  `label` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES ('13', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'diet-2', 'xx');
INSERT INTO `label` VALUES ('15', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'diet-2-#o-3209', '解决');
INSERT INTO `label` VALUES ('17', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'diet-2-#o-9486', 'aa');
INSERT INTO `label` VALUES ('18', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'work-1-#i-6790', 'cc');
INSERT INTO `label` VALUES ('29', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', 'diet-2-#i-4061', '测试');
INSERT INTO `label` VALUES ('30', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', 'diet-2-#i-5216', '测试');
INSERT INTO `label` VALUES ('31', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'diet-3-#o-1109', '得得');
INSERT INTO `label` VALUES ('32', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'diet-2-#o-9570', '好好');

-- ----------------------------
-- Table structure for `last_read_record`
-- ----------------------------
DROP TABLE IF EXISTS `last_read_record`;
CREATE TABLE `last_read_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` varchar(64) NOT NULL,
  `openId` varchar(64) NOT NULL,
  `lastReadTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of last_read_record
-- ----------------------------
INSERT INTO `last_read_record` VALUES ('1', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '274b660b-06c2-4ce2-93a0-b4184c5a7e5f', '2019-05-26 16:28:36');
INSERT INTO `last_read_record` VALUES ('2', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'ca720773-d10d-47b0-9f9e-c173fced4bc2', '2019-05-26 16:28:36');
INSERT INTO `last_read_record` VALUES ('3', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'edb39dcb-9804-446c-b719-433a556c5b84', '2019-05-26 16:28:36');
INSERT INTO `last_read_record` VALUES ('4', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '2019-05-26 16:28:36');
INSERT INTO `last_read_record` VALUES ('5', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '2019-05-26 16:28:36');
INSERT INTO `last_read_record` VALUES ('6', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '2019-05-26 21:41:30');
INSERT INTO `last_read_record` VALUES ('7', '1e54034f-cbf4-4040-aef0-2537eb89d62c', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '2019-05-27 09:43:34');
INSERT INTO `last_read_record` VALUES ('8', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '2019-05-26 18:13:40');
INSERT INTO `last_read_record` VALUES ('9', '404b7289-3b73-43b5-9e8d-72612cc17d8d', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '2019-05-26 21:03:33');
INSERT INTO `last_read_record` VALUES ('10', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', 'bbee0467-ac17-40b9-a1b2-69f44fba0faa', '2019-05-26 21:05:24');
INSERT INTO `last_read_record` VALUES ('11', 'bbee0467-ac17-40b9-a1b2-69f44fba0faa', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '2019-05-26 22:27:09');
INSERT INTO `last_read_record` VALUES ('12', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', 'e7ce84bb-4172-4f68-bec3-ce7fbb874a70', '2019-05-26 21:10:34');
INSERT INTO `last_read_record` VALUES ('13', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '2ac92a0e-97a1-46c7-b5f0-e147073901e0', '2019-05-26 21:15:57');
INSERT INTO `last_read_record` VALUES ('14', '2ac92a0e-97a1-46c7-b5f0-e147073901e0', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '2019-05-26 21:33:28');
INSERT INTO `last_read_record` VALUES ('15', '1e54034f-cbf4-4040-aef0-2537eb89d62c', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '2019-05-27 09:43:34');
INSERT INTO `last_read_record` VALUES ('16', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', 'cf49e43b-fb27-4fab-9c28-eddcadaf557a', '2019-05-26 22:28:24');
INSERT INTO `last_read_record` VALUES ('17', '1e54034f-cbf4-4040-aef0-2537eb89d62c', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '2019-05-27 09:43:34');
INSERT INTO `last_read_record` VALUES ('18', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', 'a018ae1f-6107-4445-af07-31aec7e2718d', '2019-05-27 09:39:26');
INSERT INTO `last_read_record` VALUES ('19', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', 'abf6d1c0-a0ca-45e4-9ef9-1d1d2eb63bf5', '2019-05-27 09:39:26');
INSERT INTO `last_read_record` VALUES ('20', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', 'ebde4881-50c4-454c-8512-8fc5fc13b6e7', '2019-05-27 09:40:27');
INSERT INTO `last_read_record` VALUES ('21', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '5a5b09af-f3e2-4973-adba-54813a559a83', '2019-05-27 09:40:52');
INSERT INTO `last_read_record` VALUES ('22', '1e54034f-cbf4-4040-aef0-2537eb89d62c', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '2019-05-27 09:43:34');

-- ----------------------------
-- Table structure for `team`
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'team''s id',
  `openId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'user''s id',
  `tname` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES ('27', 'ca720773-d10d-47b0-9f9e-c173fced4bc2', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'aa');
INSERT INTO `team` VALUES ('28', 'edb39dcb-9804-446c-b719-433a556c5b84', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'hhh');
INSERT INTO `team` VALUES ('29', '1e54034f-cbf4-4040-aef0-2537eb89d62c', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'aaa');
INSERT INTO `team` VALUES ('30', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '测试');
INSERT INTO `team` VALUES ('31', '404b7289-3b73-43b5-9e8d-72612cc17d8d', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '我的团队');
INSERT INTO `team` VALUES ('32', 'bbee0467-ac17-40b9-a1b2-69f44fba0faa', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '滚滚滚');

-- ----------------------------
-- Table structure for `team_bill`
-- ----------------------------
DROP TABLE IF EXISTS `team_bill`;
CREATE TABLE `team_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openId` varchar(64) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `label` varchar(32) NOT NULL DEFAULT '',
  `remarks` varchar(64) NOT NULL DEFAULT '""',
  `type` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'income1,outcome0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team_bill
-- ----------------------------
INSERT INTO `team_bill` VALUES ('1', '1', '1', '1', '1.00', '1', '1', '1', '2019-05-25 16:10:42');
INSERT INTO `team_bill` VALUES ('9', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'Kano', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '5.00', 'medical-0', '', '0', '2019-05-26 14:48:39');
INSERT INTO `team_bill` VALUES ('21', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'Kano', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '5.00', 'income-2', '', '1', '2019-05-26 20:33:32');
INSERT INTO `team_bill` VALUES ('23', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '电光', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '6.00', 'funny-0', '', '0', '2019-05-26 16:07:54');
INSERT INTO `team_bill` VALUES ('26', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '电光', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '28.00', 'medical-0', '', '0', '2019-05-26 16:40:40');
INSERT INTO `team_bill` VALUES ('28', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '电光', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '20.00', 'medical-0', '', '0', '2019-05-26 16:40:53');
INSERT INTO `team_bill` VALUES ('29', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '电光', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '38.00', 'life-0', '', '0', '2019-05-26 16:41:04');
INSERT INTO `team_bill` VALUES ('30', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '电光', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '30.00', 'funny-0', '', '0', '2019-05-26 17:19:49');
INSERT INTO `team_bill` VALUES ('31', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '电光', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '20.00', 'diet-0', '', '0', '2019-05-26 17:20:09');
INSERT INTO `team_bill` VALUES ('32', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '电光', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '20.00', 'diet-0', '', '0', '2019-05-26 17:20:15');
INSERT INTO `team_bill` VALUES ('33', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '电光', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '20.00', 'diet-0', '', '0', '2019-05-26 17:20:12');
INSERT INTO `team_bill` VALUES ('41', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'Kano', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '3.00', 'income-1', '', '1', '2019-05-26 20:41:25');
INSERT INTO `team_bill` VALUES ('43', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '电光', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '50.00', 'funny-0', '', '0', '2019-05-26 20:59:17');
INSERT INTO `team_bill` VALUES ('46', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'Kano', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '6.00', 'funny-0', '', '0', '2019-05-26 21:07:17');
INSERT INTO `team_bill` VALUES ('54', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '电光', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '50.00', 'diet-0', '', '0', '2019-05-26 22:19:32');
INSERT INTO `team_bill` VALUES ('55', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '电光', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '580.00', 'medical-0', '', '0', '2019-05-26 22:19:44');
INSERT INTO `team_bill` VALUES ('56', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '电光', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '500.00', 'funny-0', '', '0', '2019-05-26 22:25:48');
INSERT INTO `team_bill` VALUES ('57', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '电光', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '50.00', 'medical-0', '', '0', '2019-05-26 22:26:07');
INSERT INTO `team_bill` VALUES ('59', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '电光', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '280.00', 'diet-0', '', '0', '2019-05-27 09:43:00');

-- ----------------------------
-- Table structure for `team_logs`
-- ----------------------------
DROP TABLE IF EXISTS `team_logs`;
CREATE TABLE `team_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` varchar(64) NOT NULL,
  `information` json NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team_logs
-- ----------------------------
INSERT INTO `team_logs` VALUES ('1', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"5\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('2', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"income-2\", \"amount\": \"3\", \"operationTime\": \"1\"}');
INSERT INTO `team_logs` VALUES ('3', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"funny-0\", \"amount\": \"5.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('4', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"funny-0\", \"amount\": \"5.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('5', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"5\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('6', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"diet-0\", \"amount\": \"3\", \"operationTime\": \"1\"}');
INSERT INTO `team_logs` VALUES ('7', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"3\", \"label\": \"diet-0\", \"amount\": \"3\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('8', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"life-0\", \"amount\": \"5\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('9', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"life-0\", \"amount\": \"5\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('10', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"3\", \"label\": \"funny-0\", \"amount\": \"3\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('11', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"3\", \"label\": \"income-2\", \"amount\": \"5\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('12', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"3\", \"label\": \"income-2\", \"amount\": \"5\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('13', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"funny-0\", \"amount\": \"3.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('14', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"diet-0\", \"amount\": \"3.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('15', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"income-2\", \"amount\": \"5.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('16', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"life-0\", \"amount\": \"5.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('17', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"life-0\", \"amount\": \"5\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('18', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"funny-0\", \"amount\": \"5.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('19', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"diet-0\", \"amount\": \"5\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('20', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"society-0\", \"amount\": \"3\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('21', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"3\", \"label\": \"medical-0\", \"amount\": \"5\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('22', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"diet-0\", \"amount\": \"5.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('23', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"society-0\", \"amount\": \"3.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('24', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"shopping-0\", \"amount\": \"5\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('25', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"diet-0\", \"amount\": \"5.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('26', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"shopping-0\", \"amount\": \"5.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('27', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"shopping-0\", \"amount\": \"5.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('28', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"medical-0\", \"amount\": \"2.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('29', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"diet-0\", \"amount\": \"5.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('30', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"5\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('31', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"life-0\", \"amount\": \"3\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('32', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"income-1\", \"amount\": \"5\", \"operationTime\": \"1\"}');
INSERT INTO `team_logs` VALUES ('33', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"life-0\", \"amount\": \"3\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('34', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"funny-0\", \"amount\": \"5.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('35', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"shopping-0\", \"amount\": \"5\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('36', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"income-3\", \"amount\": \"5\", \"operationTime\": \"1\"}');
INSERT INTO `team_logs` VALUES ('37', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"shopping-0\", \"amount\": \"5\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('38', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"income-1\", \"amount\": \"5.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('39', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"diet-0\", \"amount\": \"132\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('40', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"6\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('41', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"Kano\", \"time\": \"2019-05-26\", \"event\": \"0\"}');
INSERT INTO `team_logs` VALUES ('42', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"电光\", \"time\": \"2019-05-26\", \"event\": \"0\"}');
INSERT INTO `team_logs` VALUES ('43', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"20\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('44', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"20\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('45', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"medical-0\", \"amount\": \"28\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('46', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"medical-0\", \"amount\": \"28\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('47', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"medical-0\", \"amount\": \"20\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('48', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"life-0\", \"amount\": \"38\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('49', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"Kano\"}');
INSERT INTO `team_logs` VALUES ('50', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('51', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('52', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('53', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('54', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('55', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('56', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('57', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('58', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('59', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('60', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('61', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('62', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('63', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('64', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('65', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('66', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('67', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"30\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('68', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"diet-0\", \"amount\": \"20\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('69', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"diet-0\", \"amount\": \"20\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('70', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"diet-0\", \"amount\": \"20\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('71', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"38\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('72', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"5\", \"label\": \"diet-0\", \"amount\": \"132.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('73', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"5\", \"label\": \"funny-0\", \"amount\": \"38\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('74', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"diet-0\", \"amount\": \"50\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('75', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"电光\", \"event\": \"3\", \"label\": \"diet-0\", \"amount\": \"50\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('76', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"电光\", \"event\": \"3\", \"label\": \"diet-0\", \"amount\": \"50\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('77', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"电光\", \"event\": \"3\", \"label\": \"medical-0\", \"amount\": \"50\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('78', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('79', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('80', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('81', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"5\", \"label\": \"funny-0\", \"amount\": \"20.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('82', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"5\", \"label\": \"funny-0\", \"amount\": \"20.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('83', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"电光\", \"event\": \"5\", \"label\": \"medical-0\", \"amount\": \"28.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('84', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"diet-0\", \"amount\": \"28\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('85', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"diet-0\", \"amount\": \"30\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('86', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '{\"name\": \"电光\", \"event\": \"5\", \"label\": \"diet-0\", \"amount\": \"30.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('87', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '{\"name\": \"电光\", \"event\": \"5\", \"label\": \"diet-0\", \"amount\": \"28.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('88', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"82\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('89', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '{\"name\": \"电光\", \"time\": \"2019-05-26\", \"event\": \"0\"}');
INSERT INTO `team_logs` VALUES ('90', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('91', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"medical-0\", \"amount\": \"201\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('92', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '{\"name\": \"电光\", \"event\": \"3\", \"label\": \"medical-0\", \"amount\": \"201\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('93', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"28\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('94', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '{\"name\": \"电光\", \"event\": \"5\", \"label\": \"funny-0\", \"amount\": \"28.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('95', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '{\"name\": \"电光\", \"event\": \"5\", \"label\": \"medical-0\", \"amount\": \"201.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('96', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '{\"name\": \"电光\", \"event\": \"5\", \"label\": \"funny-0\", \"amount\": \"82.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('97', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"income-0\", \"amount\": \"3\", \"operationTime\": \"1\"}');
INSERT INTO `team_logs` VALUES ('98', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"income-0\", \"amount\": \"55\", \"operationTime\": \"1\"}');
INSERT INTO `team_logs` VALUES ('99', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"income-0\", \"amount\": \"55.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('100', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"3\", \"label\": \"income-2\", \"amount\": \"5\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('101', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"3\", \"label\": \"life-0\", \"amount\": \"50\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('102', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"Kano\", \"event\": \"3\", \"label\": \"income-1\", \"amount\": \"3\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('103', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"50\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('104', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"5\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('105', '404b7289-3b73-43b5-9e8d-72612cc17d8d', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('106', 'bbee0467-ac17-40b9-a1b2-69f44fba0faa', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"50\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('107', 'bbee0467-ac17-40b9-a1b2-69f44fba0faa', '{\"name\": \"电光\", \"event\": \"5\", \"label\": \"funny-0\", \"amount\": \"50.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('108', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"6\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('109', 'bbee0467-ac17-40b9-a1b2-69f44fba0faa', '{\"name\": \"电光\", \"time\": \"2019-05-26\", \"event\": \"0\"}');
INSERT INTO `team_logs` VALUES ('110', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"medical-0\", \"amount\": \"5\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('111', '274b660b-06c2-4ce2-93a0-b4184c5a7e5f', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"5\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('112', '274b660b-06c2-4ce2-93a0-b4184c5a7e5f', '{\"name\": \"Kano\", \"event\": \"4\", \"label\": \"medical-0\", \"amount\": \"6\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('113', '2ac92a0e-97a1-46c7-b5f0-e147073901e0', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"medical-0\", \"amount\": \"280\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('114', '2ac92a0e-97a1-46c7-b5f0-e147073901e0', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"diet-0\", \"amount\": \"2806\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('115', '2ac92a0e-97a1-46c7-b5f0-e147073901e0', '{\"name\": \"电光\", \"event\": \"4\", \"label\": \"medical-0\", \"amount\": \"380\", \"operationTime\": \"0\"}');
INSERT INTO `team_logs` VALUES ('116', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"medical-0\", \"amount\": \"5.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('117', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"funny-0\", \"amount\": \"5.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('118', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"Kano\", \"event\": \"5\", \"label\": \"life-0\", \"amount\": \"50.00\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('119', '2ac92a0e-97a1-46c7-b5f0-e147073901e0', '{\"name\": \"Kano\", \"time\": \"2019-05-26\", \"event\": \"0\"}');
INSERT INTO `team_logs` VALUES ('120', '6f8fd30a-4323-4098-9f9a-b1fb3e76bd0d', '{\"name\": \"Kano\", \"time\": \"2019-05-26\", \"event\": \"1\"}');
INSERT INTO `team_logs` VALUES ('121', '2ac92a0e-97a1-46c7-b5f0-e147073901e0', '{\"name\": \"电光\", \"event\": \"3\", \"label\": \"medical-0\", \"amount\": \"380.02\", \"operationTime\": \"2019-05-26\"}');
INSERT INTO `team_logs` VALUES ('122', '2ac92a0e-97a1-46c7-b5f0-e147073901e0', '{\"name\": \"电光\", \"time\": \"0\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"20\"}');
INSERT INTO `team_logs` VALUES ('123', '2ac92a0e-97a1-46c7-b5f0-e147073901e0', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('124', '2ac92a0e-97a1-46c7-b5f0-e147073901e0', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"电光\"}');
INSERT INTO `team_logs` VALUES ('125', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"电光\", \"time\": \"2019-05-26\", \"event\": \"0\"}');
INSERT INTO `team_logs` VALUES ('126', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"电光\", \"time\": \"0\", \"event\": \"4\", \"label\": \"diet-0\", \"amount\": \"50\"}');
INSERT INTO `team_logs` VALUES ('127', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"电光\", \"time\": \"0\", \"event\": \"4\", \"label\": \"medical-0\", \"amount\": \"580\"}');
INSERT INTO `team_logs` VALUES ('128', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"Kano\"}');
INSERT INTO `team_logs` VALUES ('129', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"Kano\"}');
INSERT INTO `team_logs` VALUES ('130', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"电光\", \"time\": \"2019-05-26 22:25:48\", \"event\": \"4\", \"label\": \"funny-0\", \"amount\": \"500\"}');
INSERT INTO `team_logs` VALUES ('131', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"电光\", \"time\": \"2019-05-26 22:26:07\", \"event\": \"4\", \"label\": \"medical-0\", \"amount\": \"50\"}');
INSERT INTO `team_logs` VALUES ('132', 'bbee0467-ac17-40b9-a1b2-69f44fba0faa', '{\"name\": \"电光\", \"time\": \"2019-05-26\", \"event\": \"1\"}');
INSERT INTO `team_logs` VALUES ('133', 'cf49e43b-fb27-4fab-9c28-eddcadaf557a', '{\"name\": \"电光\", \"time\": \"2019-05-26 22:28:56\", \"event\": \"4\", \"label\": \"medical-0\", \"amount\": \"455\"}');
INSERT INTO `team_logs` VALUES ('134', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"电光\", \"time\": \"2019-05-26\", \"event\": \"1\"}');
INSERT INTO `team_logs` VALUES ('135', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"电光\", \"time\": \"2019-05-26\", \"event\": \"0\"}');
INSERT INTO `team_logs` VALUES ('136', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"Kano\"}');
INSERT INTO `team_logs` VALUES ('137', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"undefined\", \"time\": \"2019-05-26\", \"event\": \"2\", \"operator\": \"Kano\"}');
INSERT INTO `team_logs` VALUES ('138', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"电光\", \"time\": \"2019-05-27 09:43:00\", \"event\": \"4\", \"label\": \"diet-0\", \"amount\": \"280\"}');
INSERT INTO `team_logs` VALUES ('139', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"电光\", \"time\": \"2019-05-27\", \"event\": \"1\"}');
INSERT INTO `team_logs` VALUES ('140', '1e54034f-cbf4-4040-aef0-2537eb89d62c', '{\"name\": \"电光\", \"time\": \"2019-05-27\", \"event\": \"0\"}');

-- ----------------------------
-- Table structure for `team_member`
-- ----------------------------
DROP TABLE IF EXISTS `team_member`;
CREATE TABLE `team_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` varchar(64) NOT NULL,
  `openId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Associated with table user',
  `uid` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'user''id only in this team',
  `tMemberName` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'user''s name',
  `teamName` varchar(48) NOT NULL,
  `isAdministrator` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0False,1True',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of team_member
-- ----------------------------
INSERT INTO `team_member` VALUES ('1', '1e54034f-cbf4-4040-aef0-2537eb89d62c', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '15cfa463-7221-4a29-9157-c6a2596eed3b', 'Kano', 'aaa', '1');
INSERT INTO `team_member` VALUES ('4', 'ca720773-d10d-47b0-9f9e-c173fced4bc2', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '335dfc85-22cf-4957-93e2-fa5b99d2951f', 'Kano', 'aa', '1');
INSERT INTO `team_member` VALUES ('5', 'edb39dcb-9804-446c-b719-433a556c5b84', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', 'ef5c8586-e18a-45ae-92fd-1efa018ba348', 'Kano', 'hhh', '1');
INSERT INTO `team_member` VALUES ('24', '1e54034f-cbf4-4040-aef0-2537eb89d62c', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '17abad9b-cba7-4f2e-bd5a-cd08076a7067', '电光', 'aaa', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uuid` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `openId` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `signInDays` int(11) NOT NULL DEFAULT '0',
  `signIn` char(8) NOT NULL DEFAULT 'false',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('15f2a22c-4b3b-40dd-9622-084f0e8253b2', 'oLvqJ5WWYEXfQfmm-25v6q6Xn0Cg', '1', 'true');
INSERT INTO `user` VALUES ('2b4d74d2-a081-4914-a907-bcdb49194cbc', 'oLvqJ5cL_E9swQ-y2fBwMzCbuOrQ', '1', 'true');

-- ----------------------------
-- View structure for `balance`
-- ----------------------------
DROP VIEW IF EXISTS `balance`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `balance` AS select `bill`.`openId` AS `openId`,sum(`bill`.`amount`) AS `sum(amount)` from `bill` group by `bill`.`openId` ;

-- ----------------------------
-- Procedure structure for `signIn`
-- ----------------------------
DROP PROCEDURE IF EXISTS `signIn`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `signIn`()
BEGIN

update user set signIn="false";
update user set signInDays=0 where openId not in(select DISTINCT openId from bill where DATE(time) = DATE(date_sub(now(),interval 1 DAY)));

END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `signIn`
-- ----------------------------
DROP EVENT IF EXISTS `signIn`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `signIn` ON SCHEDULE EVERY 1 DAY STARTS '2019-05-15 17:00:01' ON COMPLETION NOT PRESERVE ENABLE DO call signIn()
;;
DELIMITER ;
