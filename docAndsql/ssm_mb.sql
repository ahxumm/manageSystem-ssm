/*
Navicat MySQL Data Transfer

Source Server         : mybatis
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : ssm_mb

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-04-27 10:04:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '张三', '小三', '18888888888', 'zs@163.com');
INSERT INTO `member` VALUES ('2', '李四', '小四', '18811111111', 'ls@qq.com');
INSERT INTO `member` VALUES ('3', '赵五', '小五', '18855555555', 'zw@163.com');
INSERT INTO `member` VALUES ('4', '王二麻子', '小二', '18822222222', 'wr@163.com');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(20) NOT NULL,
  `orderTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `memberId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `memberId` (`memberId`),
  CONSTRAINT `memberId` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `productId` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '56789', '2020-04-24 09:26:03', '3', '没什么', '0', '1', '35', '1');
INSERT INTO `orders` VALUES ('2', '12345', '2020-04-23 15:31:45', '2', '没什么', '0', '1', '36', '1');
INSERT INTO `orders` VALUES ('3', '12345', '2020-04-25 18:08:21', '3', '没什么', '0', '1', '37', '1');
INSERT INTO `orders` VALUES ('4', '12345', '2020-04-23 15:31:52', '2', '没什么', '0', '1', '38', '1');
INSERT INTO `orders` VALUES ('5', 'test', '2020-04-24 09:41:05', '2', '愉快', '1', null, '35', '1');
INSERT INTO `orders` VALUES ('6', 'test2', '2020-04-24 09:32:21', '1', '愉快的', '1', '1', '36', '1');
INSERT INTO `orders` VALUES ('7', 'test3', '2020-04-24 15:05:22', '2', 'qwer', '1', '1', '35', '4');

-- ----------------------------
-- Table structure for `order_traveller`
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller` (
  `orderId` int(11) NOT NULL,
  `travellerId` int(11) NOT NULL,
  KEY `orderId` (`orderId`),
  KEY `travellerId` (`travellerId`),
  CONSTRAINT `orderId` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `travellerId` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES ('2', '1');
INSERT INTO `order_traveller` VALUES ('3', '2');
INSERT INTO `order_traveller` VALUES ('1', '1');
INSERT INTO `order_traveller` VALUES ('6', '3');
INSERT INTO `order_traveller` VALUES ('1', '3');
INSERT INTO `order_traveller` VALUES ('7', '5');
INSERT INTO `order_traveller` VALUES ('5', '1');
INSERT INTO `order_traveller` VALUES ('5', '5');
INSERT INTO `order_traveller` VALUES ('7', '4');
INSERT INTO `order_traveller` VALUES ('3', '3');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'product findAll', '/product/findAll.do');
INSERT INTO `permission` VALUES ('2', 'permission findAll', '/permission/findAll.do');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `productPrice` double DEFAULT NULL,
  `productDesc` varchar(500) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('35', 'itcast-001', '南京一年游', '西双版纳', '2020-04-26 21:51:34', '9999', '好玩的一批66666666666666666666', '0');
INSERT INTO `product` VALUES ('36', '35', '洛阳一周游', '北京', '2020-04-23 15:14:52', '1999', '好玩', '1');
INSERT INTO `product` VALUES ('37', '35', '洛阳一周游', '北京', '2020-04-22 22:54:00', '1999', '好玩', '1');
INSERT INTO `product` VALUES ('38', '35', '洛阳一周游', '北京', '2020-04-23 09:30:54', '1999', '好玩', '1');
INSERT INTO `product` VALUES ('39', '35', '洛阳一周游', '北京', '2020-04-22 22:54:00', '1999', '好玩', '1');
INSERT INTO `product` VALUES ('40', '35', '洛阳一周游', '北京', '2020-04-22 22:54:00', '1999', '好玩', '1');
INSERT INTO `product` VALUES ('41', '35', '洛阳一周游', '北京', '2020-04-22 22:54:00', '1999', '好玩', '1');
INSERT INTO `product` VALUES ('42', '35', '洛阳一周游', '北京', '2020-04-22 23:24:28', '1999', '好玩', '0');
INSERT INTO `product` VALUES ('43', '35', '洛阳一周游', '北京', '2020-04-22 22:54:00', '1999', '好玩', '1');
INSERT INTO `product` VALUES ('44', '35', '洛阳一周游', '北京', '2020-04-22 22:54:00', '1999', '好玩', '1');
INSERT INTO `product` VALUES ('45', '35', '洛阳一周游', '北京', '2020-04-22 22:54:00', '1999', '好玩', '1');
INSERT INTO `product` VALUES ('46', '35', '洛阳一周游', '北京', '2020-04-22 22:54:00', '1999', '好玩', '1');
INSERT INTO `product` VALUES ('47', '35', '洛阳一周游', '北京', '2020-04-22 22:54:00', '1999', '好玩', '1');
INSERT INTO `product` VALUES ('48', '35', '洛阳一周游', '北京', '2020-04-22 22:54:00', '1999', '好玩', '1');
INSERT INTO `product` VALUES ('49', '35', '洛阳一周游', '北京', '2020-04-22 22:54:00', '1999', '好玩', '1');
INSERT INTO `product` VALUES ('50', '35', '洛阳一周游', '北京', '2020-04-22 22:54:00', '1999', '好玩', '1');
INSERT INTO `product` VALUES ('51', '35', '洛阳一周游', '北京', '2020-04-22 22:54:00', '1999', '好玩', '1');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ADMIN', 'vip');
INSERT INTO `role` VALUES ('2', 'USER', 'vip');
INSERT INTO `role` VALUES ('3', 'VIP2', 'VIP2');
INSERT INTO `role` VALUES ('4', 'QQVIP', 'QQVIP');

-- ----------------------------
-- Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permissionId` int(11) NOT NULL DEFAULT '0',
  `roleId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('1', '2');

-- ----------------------------
-- Table structure for `syslog`
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(100) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `executionTime` int(11) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('1', '2020-04-18 11:33:39', 'tom', '127.0.0.1', '/user/findAll.do', '22', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('2', '2020-04-18 11:33:42', 'tom', '127.0.0.1', '/user/findAll.do', '3', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('3', '2020-04-18 11:33:44', 'tom', '127.0.0.1', '/role/findAll.do', '10', '[??] com.itheima.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES ('4', '2020-04-18 11:33:47', 'tom', '127.0.0.1', '/permission/findAll.do', '7', '[??] com.itheima.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES ('5', '2020-04-18 11:33:50', 'tom', '127.0.0.1', '/sysLog/findAll.do', '12', '[??] com.itheima.ssm.controller.SysLogController[???] findAll');
INSERT INTO `syslog` VALUES ('6', '2020-04-18 11:33:53', 'tom', '127.0.0.1', '/product/findAll.do', '11', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('7', '2020-04-18 11:33:55', 'tom', '127.0.0.1', '/orders/findAll.do', '91', '[??] com.itheima.ssm.controller.OrderController[???] findAll');
INSERT INTO `syslog` VALUES ('8', '2020-04-18 11:33:57', 'tom', '127.0.0.1', '/product/findAll.do', '3', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('9', '2020-04-18 11:34:00', 'tom', '127.0.0.1', '/orders/findAll.do', '10', '[??] com.itheima.ssm.controller.OrderController[???] findAll');
INSERT INTO `syslog` VALUES ('10', '2020-04-18 11:34:11', 'tom', '127.0.0.1', '/product/findAll.do', '4', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('11', '2020-04-18 11:34:18', 'tom', '127.0.0.1', '/user/findAll.do', '2', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('12', '2020-04-18 11:34:21', 'tom', '127.0.0.1', '/user/findAll.do', '5', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('13', '2020-04-18 11:34:25', 'tom', '127.0.0.1', '/user/findAll.do', '1', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('14', '2020-04-18 11:34:32', 'tom', '127.0.0.1', '/user/findAll.do', '2', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('15', '2020-04-18 11:34:34', 'tom', '127.0.0.1', '/role/findAll.do', '1', '[??] com.itheima.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES ('16', '2020-04-18 11:34:38', 'tom', '127.0.0.1', '/permission/findAll.do', '2', '[??] com.itheima.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES ('17', '2020-04-18 11:34:41', 'tom', '127.0.0.1', '/sysLog/findAll.do', '5', '[??] com.itheima.ssm.controller.SysLogController[???] findAll');
INSERT INTO `syslog` VALUES ('18', '2020-04-18 11:34:43', 'tom', '127.0.0.1', '/permission/findAll.do', '2', '[??] com.itheima.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES ('19', '2020-04-18 11:34:48', 'tom', '127.0.0.1', '/permission/findAll.do', '2', '[??] com.itheima.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES ('20', '2020-04-18 11:34:56', 'tom', '127.0.0.1', '/orders/findAll.do', '9', '[??] com.itheima.ssm.controller.OrderController[???] findAll');
INSERT INTO `syslog` VALUES ('21', '2020-04-18 11:36:45', 'tom', '127.0.0.1', '/permission/findAll.do', '1', '[??] com.itheima.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES ('22', '2020-04-18 11:36:48', 'tom', '127.0.0.1', '/orders/findAll.do', '8', '[??] com.itheima.ssm.controller.OrderController[???] findAll');
INSERT INTO `syslog` VALUES ('23', '2020-04-18 11:36:58', 'tom', '127.0.0.1', '/permission/findAll.do', '2', '[??] com.itheima.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES ('24', '2020-04-18 11:37:04', 'tom', '127.0.0.1', '/orders/findAll.do', '8', '[??] com.itheima.ssm.controller.OrderController[???] findAll');
INSERT INTO `syslog` VALUES ('25', '2020-04-18 11:37:50', 'tom', '127.0.0.1', '/permission/findAll.do', '1', '[??] com.itheima.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES ('26', '2020-04-18 11:37:52', 'tom', '127.0.0.1', '/product/findAll.do', '3', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('27', '2020-04-18 11:38:01', 'tom', '127.0.0.1', '/product/findAll.do', '2', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('28', '2020-04-18 11:38:09', 'tom', '127.0.0.1', '/user/findAll.do', '2', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('29', '2020-04-18 11:38:10', 'tom', '127.0.0.1', '/user/findAll.do', '4', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('30', '2020-04-18 11:38:14', 'tom', '127.0.0.1', '/role/findAll.do', '1', '[??] com.itheima.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES ('31', '2020-04-18 11:38:18', 'tom', '127.0.0.1', '/role/findAll.do', '2', '[??] com.itheima.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES ('32', '2020-04-18 11:58:51', 'tom', '127.0.0.1', '/orders/findAll.do', '9', '[??] com.itheima.ssm.controller.OrderController[???] findAll');
INSERT INTO `syslog` VALUES ('33', '2020-04-18 12:02:48', 'tom', '127.0.0.1', '/user/findAll.do', '10', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('34', '2020-04-18 12:02:51', 'tom', '127.0.0.1', '/user/findAll.do', '4', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('35', '2020-04-18 12:02:53', 'tom', '127.0.0.1', '/user/findAll.do', '2', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('36', '2020-04-18 12:02:55', 'tom', '127.0.0.1', '/user/findAll.do', '7', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('37', '2020-04-18 12:03:14', 'tom', '127.0.0.1', '/user/findAll.do', '3', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('38', '2020-04-18 12:03:36', 'tom', '127.0.0.1', '/user/findAll.do', '71', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('39', '2020-04-18 12:03:36', 'tom', '127.0.0.1', '/user/findAll.do', '4', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('40', '2020-04-18 12:03:41', 'tom', '127.0.0.1', '/user/findAll.do', '4', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('41', '2020-04-18 12:03:45', 'tom', '127.0.0.1', '/user/findAll.do', '2', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('42', '2020-04-18 12:03:49', 'tom', '127.0.0.1', '/role/findAll.do', '7', '[??] com.itheima.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES ('43', '2020-04-18 12:04:10', 'tom', '127.0.0.1', '/role/findAll.do', '2', '[??] com.itheima.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES ('44', '2020-04-18 12:04:10', 'tom', '127.0.0.1', '/role/findAll.do', '1', '[??] com.itheima.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES ('45', '2020-04-18 12:04:13', 'tom', '127.0.0.1', '/user/findAll.do', '2', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('46', '2020-04-18 12:04:15', 'tom', '127.0.0.1', '/user/findAll.do', '5', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('47', '2020-04-18 12:04:19', 'tom', '127.0.0.1', '/user/findAll.do', '4', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('48', '2020-04-18 12:04:19', 'tom', '127.0.0.1', '/user/findAll.do', '3', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('49', '2020-04-18 12:04:21', 'tom', '127.0.0.1', '/user/findAll.do', '5', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('50', '2020-04-18 12:04:25', 'tom', '127.0.0.1', '/role/findAll.do', '1', '[??] com.itheima.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES ('51', '2020-04-18 12:04:29', 'tom', '127.0.0.1', '/role/findAll.do', '1', '[??] com.itheima.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES ('52', '2020-04-18 12:04:31', 'tom', '127.0.0.1', '/role/findAll.do', '2', '[??] com.itheima.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES ('53', '2020-04-18 12:04:34', 'tom', '127.0.0.1', '/role/findAll.do', '2', '[??] com.itheima.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES ('54', '2020-04-18 12:04:37', 'tom', '127.0.0.1', '/permission/findAll.do', '7', '[??] com.itheima.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES ('55', '2020-04-18 12:04:39', 'tom', '127.0.0.1', '/sysLog/findAll.do', '12', '[??] com.itheima.ssm.controller.SysLogController[???] findAll');
INSERT INTO `syslog` VALUES ('56', '2020-04-18 12:04:50', 'tom', '127.0.0.1', '/product/findAll.do', '8', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('57', '2020-04-18 12:05:04', 'tom', '127.0.0.1', '/product/findAll.do', '2', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('58', '2020-04-18 12:05:58', 'tom', '127.0.0.1', '/product/findAll.do', '3', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('59', '2020-04-18 12:05:58', 'tom', '127.0.0.1', '/product/findAll.do', '3', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('60', '2020-04-18 12:06:10', 'tom', '127.0.0.1', '/product/findAll.do', '3', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('61', '2020-04-18 12:06:12', 'tom', '127.0.0.1', '/orders/findAll.do', '8', '[??] com.itheima.ssm.controller.OrderController[???] findAll');
INSERT INTO `syslog` VALUES ('62', '2020-04-18 12:06:14', 'tom', '127.0.0.1', '/product/findAll.do', '4', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('63', '2020-04-18 12:07:58', 'tom', '127.0.0.1', '/user/findAll.do', '16', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('64', '2020-04-18 12:08:05', 'tom', '127.0.0.1', '/user/findAll.do', '5', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('65', '2020-04-18 12:08:10', 'tom', '127.0.0.1', '/user/findAll.do', '4', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('66', '2020-04-18 12:08:10', 'tom', '127.0.0.1', '/user/findAll.do', '3', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('67', '2020-04-18 12:08:16', 'tom', '127.0.0.1', '/orders/findAll.do', '53404', '[??] com.itheima.ssm.controller.OrderController[???] findAll');
INSERT INTO `syslog` VALUES ('68', '2020-04-18 12:23:11', 'boss', '127.0.0.1', '/user/findAll.do', '10', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('69', '2020-04-18 12:23:13', 'boss', '127.0.0.1', '/product/findAll.do', '9', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('70', '2020-04-18 12:24:16', 'boss', '127.0.0.1', '/user/findAll.do', '2', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('71', '2020-04-18 12:24:28', 'boss', '127.0.0.1', '/user/findAll.do', '2', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('72', '2020-04-18 12:24:30', 'boss', '127.0.0.1', '/product/findAll.do', '2', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('73', '2020-04-18 12:24:43', 'boss', '127.0.0.1', '/sysLog/findAll.do', '12', '[??] com.itheima.ssm.controller.SysLogController[???] findAll');
INSERT INTO `syslog` VALUES ('74', '2020-04-18 12:24:49', 'boss', '127.0.0.1', '/sysLog/findAll.do', '5', '[??] com.itheima.ssm.controller.SysLogController[???] findAll');
INSERT INTO `syslog` VALUES ('75', '2020-04-18 12:26:04', 'boss', '127.0.0.1', '/orders/findAll.do', '5', '[??] com.itheima.ssm.controller.OrderController[???] findAll');
INSERT INTO `syslog` VALUES ('76', '2020-04-18 12:26:10', 'boss', '127.0.0.1', '/product/findAll.do', '2', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('77', '2020-04-18 12:26:15', 'boss', '127.0.0.1', '/product/findAll.do', '2', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('78', '2020-04-18 12:28:42', 'boss', '127.0.0.1', '/product/findAll.do', '18', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('79', '2020-04-18 12:29:23', 'boss', '127.0.0.1', '/product/findAll.do', '3', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('80', '2020-04-18 12:29:23', 'boss', '127.0.0.1', '/product/findAll.do', '4', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('81', '2020-04-18 12:29:29', 'boss', '127.0.0.1', '/product/findAll.do', '4', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('82', '2020-04-18 12:32:58', 'boss', '127.0.0.1', '/permission/findAll.do', '7', '[??] com.itheima.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES ('83', '2020-04-18 12:33:00', 'boss', '127.0.0.1', '/user/findAll.do', '8', '[??] com.itheima.ssm.controller.UserController[???] findAll');
INSERT INTO `syslog` VALUES ('84', '2020-04-18 12:33:02', 'boss', '127.0.0.1', '/role/findAll.do', '6', '[??] com.itheima.ssm.controller.RoleController[???] findAll');
INSERT INTO `syslog` VALUES ('85', '2020-04-18 12:33:03', 'boss', '127.0.0.1', '/permission/findAll.do', '2', '[??] com.itheima.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES ('86', '2020-04-18 12:33:08', 'boss', '127.0.0.1', '/permission/findAll.do', '1', '[??] com.itheima.ssm.controller.PermissionController[???] findAll');
INSERT INTO `syslog` VALUES ('87', '2020-04-18 12:33:11', 'boss', '127.0.0.1', '/product/findAll.do', '5', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('88', '2020-04-18 12:36:51', 'boss', '127.0.0.1', '/product/findAll.do', '21', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('89', '2020-04-18 12:37:12', 'boss', '127.0.0.1', '/product/findAll.do', '52505', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('90', '2020-04-18 12:38:10', 'boss', '127.0.0.1', '/product/findAll.do', '372', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('91', '2020-04-18 12:38:18', 'boss', '127.0.0.1', '/product/findAll.do', '765', '[??] com.itheima.ssm.controller.ProductController[???] findAll');
INSERT INTO `syslog` VALUES ('92', '2020-04-18 12:41:40', 'boss', '127.0.0.1', '/product/findAll.do', '20', '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('93', '2020-04-18 12:42:05', 'boss', '127.0.0.1', '/product/findAll.do', '4', '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('94', '2020-04-18 12:42:05', 'boss', '127.0.0.1', '/product/findAll.do', '4', '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('95', '2020-04-18 12:43:32', 'boss', '127.0.0.1', '/user/findAll.do', '10', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('96', '2020-04-18 12:43:34', 'boss', '127.0.0.1', '/permission/findAll.do', '8', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('97', '2020-04-18 12:43:53', 'boss', '127.0.0.1', '/permission/findAll.do', '1', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('98', '2020-04-18 12:44:06', 'tom', '127.0.0.1', '/user/findAll.do', '2', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('99', '2020-04-18 12:45:14', 'tom', '127.0.0.1', '/user/findAll.do', '71', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('100', '2020-04-18 12:45:14', 'tom', '127.0.0.1', '/user/findAll.do', '4', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('101', '2020-04-18 12:45:20', 'tom', '127.0.0.1', '/user/findAll.do', '5', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('102', '2020-04-18 12:45:21', 'tom', '127.0.0.1', '/user/findAll.do', '2', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('103', '2020-04-18 12:46:26', 'boss', '127.0.0.1', '/user/findAll.do', '2', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('104', '2020-04-18 12:46:28', 'boss', '127.0.0.1', '/user/findAll.do', '5', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('105', '2020-04-18 12:46:31', 'boss', '127.0.0.1', '/user/findAll.do', '4', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('106', '2020-04-18 12:46:31', 'boss', '127.0.0.1', '/user/findAll.do', '2', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('107', '2020-04-18 12:46:40', 'jack', '127.0.0.1', '/role/findAll.do', '8', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('108', '2020-04-18 12:46:43', 'jack', '127.0.0.1', '/permission/findAll.do', '1', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('109', '2020-04-18 12:46:48', 'jack', '127.0.0.1', '/permission/findAll.do', '1', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('110', '2020-04-18 12:46:51', 'jack', '127.0.0.1', '/permission/findAll.do', '1', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('111', '2020-04-18 12:49:36', 'jack', '127.0.0.1', '/permission/findAll.do', '1', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('112', '2020-04-18 12:50:12', 'jack', '127.0.0.1', '/permission/findAll.do', '2', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('113', '2020-04-18 12:50:12', 'jack', '127.0.0.1', '/permission/findAll.do', '2', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('114', '2020-04-18 12:50:15', 'jack', '127.0.0.1', '/role/findAll.do', '3', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('115', '2020-04-18 12:50:23', 'jack', '127.0.0.1', '/role/findAll.do', '4', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('116', '2020-04-18 12:50:26', 'jack', '127.0.0.1', '/role/findAll.do', '1', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('117', '2020-04-18 12:50:26', 'jack', '127.0.0.1', '/role/findAll.do', '1', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('118', '2020-04-18 12:50:31', 'jack', '127.0.0.1', '/role/findAll.do', '2', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('119', '2020-04-18 12:50:34', 'jack', '127.0.0.1', '/role/findAll.do', '1', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('120', '2020-04-18 12:50:43', 'jack', '127.0.0.1', '/permission/findAll.do', '2', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('121', '2020-04-18 12:50:46', 'jack', '127.0.0.1', '/role/findAll.do', '2', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('122', '2020-04-18 12:50:52', 'jack', '127.0.0.1', '/role/findAll.do', '2', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('123', '2020-04-18 12:50:56', 'jack', '127.0.0.1', '/role/findAll.do', '1', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('124', '2020-04-18 12:51:00', 'jack', '127.0.0.1', '/role/findAll.do', '1', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('125', '2020-04-18 12:51:03', 'jack', '127.0.0.1', '/role/findAll.do', '1', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('126', '2020-04-18 12:51:06', 'jack', '127.0.0.1', '/role/findAll.do', '2', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('127', '2020-04-21 14:45:13', 'boss', '127.0.0.1', '/user/findAll.do', '16', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('128', '2020-04-21 14:45:17', 'boss', '127.0.0.1', '/role/findAll.do', '9', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('129', '2020-04-21 14:45:20', 'boss', '127.0.0.1', '/permission/findAll.do', '10', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('130', '2020-04-21 14:45:22', 'boss', '127.0.0.1', '/sysLog/findAll.do', '23', '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('131', '2020-04-21 14:45:23', 'boss', '127.0.0.1', '/user/findAll.do', '2', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('132', '2020-04-21 14:45:29', 'boss', '127.0.0.1', '/user/findAll.do', '5', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('133', '2020-04-21 14:45:31', 'boss', '127.0.0.1', '/user/findAll.do', '8', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('134', '2020-04-21 14:45:40', 'boss', '127.0.0.1', '/user/findAll.do', '3', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('135', '2020-04-21 14:45:41', 'boss', '127.0.0.1', '/user/findAll.do', '7', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('136', '2020-04-21 14:45:43', 'boss', '127.0.0.1', '/user/findAll.do', '3', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('137', '2020-04-21 14:46:20', 'boss', '127.0.0.1', '/role/findAll.do', '1', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('138', '2020-04-21 14:46:27', 'boss', '127.0.0.1', '/permission/findAll.do', '2', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('139', '2020-04-21 14:46:30', 'boss', '127.0.0.1', '/sysLog/findAll.do', '9', '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('140', '2020-04-21 14:46:40', 'boss', '127.0.0.1', '/sysLog/findAll.do', '9', '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('141', '2020-04-21 14:46:52', 'boss', '127.0.0.1', '/product/findAll.do', '11', '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('142', '2020-04-21 14:46:58', 'boss', '127.0.0.1', '/orders/findAll.do', '43', '[类名] com.itheima.ssm.controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('143', '2020-04-21 14:51:26', 'boss', '127.0.0.1', '/product/findAll.do', '4', '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('144', '2020-04-21 14:51:31', 'boss', '127.0.0.1', '/orders/findAll.do', '6', '[类名] com.itheima.ssm.controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('145', '2020-04-21 14:51:35', 'boss', '127.0.0.1', '/user/findAll.do', '2', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('146', '2020-04-21 14:51:41', 'boss', '127.0.0.1', '/user/findAll.do', '6', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('147', '2020-04-21 14:51:43', 'boss', '127.0.0.1', '/user/findAll.do', '2', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('148', '2020-04-21 14:51:48', 'boss', '127.0.0.1', '/user/findAll.do', '4', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('149', '2020-04-21 14:51:50', 'boss', '127.0.0.1', '/user/findAll.do', '2', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('150', '2020-04-21 14:51:54', 'boss', '127.0.0.1', '/product/findAll.do', '2', '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('151', '2020-04-21 14:52:01', 'boss', '127.0.0.1', '/product/findAll.do', '2', '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('152', '2020-04-21 14:52:04', 'boss', '127.0.0.1', '/product/findAll.do', '3', '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('153', '2020-04-21 14:52:06', 'boss', '127.0.0.1', '/orders/findAll.do', '5', '[类名] com.itheima.ssm.controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('154', '2020-04-21 14:52:09', 'boss', '127.0.0.1', '/orders/findAll.do', '10', '[类名] com.itheima.ssm.controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('155', '2020-04-21 14:52:11', 'boss', '127.0.0.1', '/orders/findAll.do', '8', '[类名] com.itheima.ssm.controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('156', '2020-04-21 14:52:19', 'boss', '127.0.0.1', '/orders/findAll.do', '4', '[类名] com.itheima.ssm.controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('157', '2020-04-21 14:52:26', 'boss', '127.0.0.1', '/orders/findAll.do', '4', '[类名] com.itheima.ssm.controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('158', '2020-04-21 14:52:29', 'boss', '127.0.0.1', '/user/findAll.do', '2', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('159', '2020-04-21 14:52:30', 'boss', '127.0.0.1', '/user/findAll.do', '4', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('160', '2020-04-21 14:52:32', 'boss', '127.0.0.1', '/user/findAll.do', '2', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('161', '2020-04-21 14:52:38', 'boss', '127.0.0.1', '/user/findAll.do', '1', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('162', '2020-04-21 14:52:40', 'boss', '127.0.0.1', '/orders/findAll.do', '4', '[类名] com.itheima.ssm.controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('163', '2020-04-21 14:56:58', 'boss', '127.0.0.1', '/user/findAll.do', '2', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('164', '2020-04-21 14:57:00', 'boss', '127.0.0.1', '/orders/findAll.do', '5', '[类名] com.itheima.ssm.controller.OrderController[方法名] findAll');
INSERT INTO `syslog` VALUES ('165', '2020-04-21 14:57:01', 'boss', '127.0.0.1', '/product/findAll.do', '2', '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('166', '2020-04-21 14:57:04', 'boss', '127.0.0.1', '/user/findAll.do', '1', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('167', '2020-04-21 14:57:06', 'boss', '127.0.0.1', '/role/findAll.do', '1', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('168', '2020-04-21 14:57:07', 'boss', '127.0.0.1', '/user/findAll.do', '1', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('169', '2020-04-21 14:57:21', 'boss', '127.0.0.1', '/user/findAll.do', '1', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('170', '2020-04-22 12:14:00', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '15', '[类名] com.itheima.ssm.controller.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('171', '2020-04-22 12:14:06', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', '10', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('172', '2020-04-22 12:14:09', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', '29', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('173', '2020-04-22 12:14:11', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', '2', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('174', '2020-04-22 12:14:14', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', '9', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('175', '2020-04-22 12:14:16', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', '3', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('176', '2020-04-22 12:14:18', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', '1', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('177', '2020-04-22 12:14:21', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', '1', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('178', '2020-04-22 12:14:24', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '7', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('179', '2020-04-22 12:14:26', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', '6', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('180', '2020-04-22 12:14:28', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '1', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('181', '2020-04-22 12:14:30', 'tom', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '20', '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('182', '2020-04-22 12:14:37', 'tom', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', '11', '[类名] com.itheima.ssm.controller.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('183', '2020-04-22 12:14:38', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '1', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('184', '2020-04-22 12:14:39', 'tom', '0:0:0:0:0:0:0:1', '/role/findAll.do', '2', '[类名] com.itheima.ssm.controller.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('185', '2020-04-25 20:55:55', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', '17', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('186', '2020-04-25 20:55:57', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', '12', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('187', '2020-04-25 20:57:01', 'tom', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '7', '[类名] com.itheima.ssm.controller.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('188', '2020-04-25 20:57:17', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', '2', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('189', '2020-04-25 20:58:58', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', '4', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('190', '2020-04-25 20:59:00', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', '8', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('191', '2020-04-25 20:59:07', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', '3', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('192', '2020-04-25 20:59:09', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', '5', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('193', '2020-04-25 20:59:13', 'tom', '0:0:0:0:0:0:0:1', '/user/findAll.do', '2', '[类名] com.itheima.ssm.controller.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('194', '2020-04-26 21:50:06', 'tom', '127.0.0.1', '/product/findAll.do', '56', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('195', '2020-04-26 21:51:06', 'tom', '127.0.0.1', '/user/findAll.do', '11', '[类名]com.xumeng.controller.UserController[方法名]findAll');
INSERT INTO `syslog` VALUES ('196', '2020-04-26 21:51:08', 'tom', '127.0.0.1', '/product/findAll.do', '10', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('197', '2020-04-26 21:51:12', 'tom', '127.0.0.1', '/product/findAll.do', '1', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('198', '2020-04-26 21:51:14', 'tom', '127.0.0.1', '/product/findAll.do', '7', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('199', '2020-04-26 21:51:27', 'tom', '127.0.0.1', '/product/productEdit.do', '2', '[类名]com.xumeng.controller.ProductController[方法名]productEdit');
INSERT INTO `syslog` VALUES ('200', '2020-04-26 21:51:31', 'tom', '127.0.0.1', '/product/findAll.do', '6', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('201', '2020-04-26 21:51:33', 'tom', '127.0.0.1', '/product/changeProductStatus.do', '60', '[类名]com.xumeng.controller.ProductController[方法名]changeProductStatus');
INSERT INTO `syslog` VALUES ('202', '2020-04-26 21:51:33', 'tom', '127.0.0.1', '/product/findAll.do', '5', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('203', '2020-04-26 21:51:34', 'tom', '127.0.0.1', '/product/changeProductStatus.do', '6', '[类名]com.xumeng.controller.ProductController[方法名]changeProductStatus');
INSERT INTO `syslog` VALUES ('204', '2020-04-26 21:51:34', 'tom', '127.0.0.1', '/product/findAll.do', '5', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('205', '2020-04-26 21:51:39', 'tom', '127.0.0.1', '/orders/findAll.do', '63', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('206', '2020-04-26 21:51:43', 'tom', '127.0.0.1', '/orders/findAll.do', '7', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('207', '2020-04-26 21:51:55', 'tom', '127.0.0.1', '/orders/findAll.do', '8', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('208', '2020-04-26 21:51:59', 'tom', '127.0.0.1', '/orders/orderAdd.do', '98', '[类名]com.xumeng.controller.OrderController[方法名]orderAdd');
INSERT INTO `syslog` VALUES ('209', '2020-04-26 21:52:01', 'tom', '127.0.0.1', '/orders/findAll.do', '4', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('210', '2020-04-26 21:52:04', 'tom', '127.0.0.1', '/orders/findById.do', '5', '[类名]com.xumeng.controller.OrderController[方法名]findById');
INSERT INTO `syslog` VALUES ('211', '2020-04-26 21:52:08', 'tom', '127.0.0.1', '/orders/findAll.do', '5', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('212', '2020-04-26 21:52:10', 'tom', '127.0.0.1', '/orders/findAll.do', '5', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('213', '2020-04-26 21:52:11', 'tom', '127.0.0.1', '/orders/findAll.do', '4', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('214', '2020-04-26 21:52:12', 'tom', '127.0.0.1', '/orders/findAll.do', '5', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('215', '2020-04-26 21:52:15', 'tom', '127.0.0.1', '/orders/findAll.do', '4', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('216', '2020-04-26 21:52:20', 'tom', '127.0.0.1', '/orders/findAll.do', '4', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('217', '2020-04-26 21:52:22', 'tom', '127.0.0.1', '/orders/findAll.do', '6', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('218', '2020-04-26 21:52:30', 'tom', '127.0.0.1', '/travellerfindAll.do', '65', '[类名]com.xumeng.controller.TravellerController[方法名]findAll');
INSERT INTO `syslog` VALUES ('219', '2020-04-26 21:52:33', 'tom', '127.0.0.1', '/orders/findAll.do', '4', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('220', '2020-04-26 21:52:40', 'tom', '127.0.0.1', '/orders/findAll.do', '5', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('221', '2020-04-26 21:52:43', 'tom', '127.0.0.1', '/orders/findAll.do', '5', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('222', '2020-04-26 21:53:38', 'tom', '127.0.0.1', '/product/findAll.do', '4', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('223', '2020-04-26 21:53:39', 'tom', '127.0.0.1', '/orders/findAll.do', '4', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('224', '2020-04-26 21:53:41', 'tom', '127.0.0.1', '/orders/orderAdd.do', '6', '[类名]com.xumeng.controller.OrderController[方法名]orderAdd');
INSERT INTO `syslog` VALUES ('225', '2020-04-26 21:53:43', 'tom', '127.0.0.1', '/orders/findAll.do', '3', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('226', '2020-04-26 21:53:45', 'tom', '127.0.0.1', '/orders/findAll.do', '4', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('227', '2020-04-26 21:54:54', 'tom', '127.0.0.1', '/orders/findAll.do', '6', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('228', '2020-04-26 21:55:43', 'tom', '127.0.0.1', '/orders/findAll.do', '6', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('229', '2020-04-26 21:55:48', 'tom', '127.0.0.1', '/orders/findAll.do', '6', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('230', '2020-04-26 21:56:12', 'tom', '127.0.0.1', '/orders/findAll.do', '3', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('231', '2020-04-26 22:03:05', 'tom', '127.0.0.1', '/orders/findAll.do', '6', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('232', '2020-04-26 22:03:18', 'tom', '127.0.0.1', '/orders/findAll.do', '6', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('233', '2020-04-26 22:17:11', 'tom', '127.0.0.1', '/orders/findAll.do', '93', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('234', '2020-04-26 22:17:24', 'tom', '127.0.0.1', '/orders/findAll.do', '17', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('235', '2020-04-26 22:21:45', 'tom', '127.0.0.1', '/orders/findAll.do', '98', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('236', '2020-04-26 22:21:48', 'tom', '127.0.0.1', '/orders/findAll.do', '8', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('237', '2020-04-26 22:23:02', 'tom', '127.0.0.1', '/orders/findAll.do', '14', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('238', '2020-04-26 22:24:13', 'tom', '127.0.0.1', '/orders/findAll.do', '11', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('239', '2020-04-26 22:26:10', 'tom', '127.0.0.1', '/orders/findAll.do', '84', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('240', '2020-04-26 22:26:14', 'tom', '127.0.0.1', '/orders/findAll.do', '8', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('241', '2020-04-26 22:27:15', 'tom', '127.0.0.1', '/orders/findAll.do', '12', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('242', '2020-04-26 22:27:30', 'tom', '127.0.0.1', '/orders/findAll.do', '10', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('243', '2020-04-26 22:27:55', 'tom', '127.0.0.1', '/orders/findAll.do', '20', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('244', '2020-04-26 22:30:05', 'tom', '127.0.0.1', '/orders/findAll.do', '27', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('245', '2020-04-26 22:32:53', 'tom', '127.0.0.1', '/orders/findAll.do', '8', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('246', '2020-04-26 22:33:14', 'tom', '127.0.0.1', '/product/findAll.do', '16', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('247', '2020-04-26 22:33:25', 'tom', '127.0.0.1', '/product/findAll.do', '0', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('248', '2020-04-26 22:34:04', 'tom', '127.0.0.1', '/product/findAll.do', '17', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('249', '2020-04-26 22:34:10', 'tom', '127.0.0.1', '/product/findAll.do', '1', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('250', '2020-04-26 22:39:17', 'tom', '127.0.0.1', '/orders/findAll.do', '87', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('251', '2020-04-26 22:39:20', 'tom', '127.0.0.1', '/product/findAll.do', '15', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('252', '2020-04-26 22:39:22', 'tom', '127.0.0.1', '/product/findAll.do', '9', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('253', '2020-04-26 22:39:28', 'tom', '127.0.0.1', '/product/findAll.do', '0', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('254', '2020-04-26 22:40:48', 'tom', '127.0.0.1', '/product/findAll.do', '77', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('255', '2020-04-26 22:40:50', 'tom', '127.0.0.1', '/product/findAll.do', '10', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('256', '2020-04-26 22:42:24', 'tom', '127.0.0.1', '/product/findAll.do', '98', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('257', '2020-04-26 22:42:36', 'tom', '127.0.0.1', '/product/findAll.do', '0', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('258', '2020-04-26 22:44:19', 'tom', '127.0.0.1', '/orders/findAll.do', '89', '[类名]com.xumeng.controller.OrderController[方法名]findAll');
INSERT INTO `syslog` VALUES ('259', '2020-04-26 22:44:21', 'tom', '127.0.0.1', '/product/findAll.do', '17', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('260', '2020-04-26 22:44:23', 'tom', '127.0.0.1', '/product/findAll.do', '7', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('261', '2020-04-26 22:44:29', 'tom', '127.0.0.1', '/product/findAll.do', '0', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('262', '2020-04-26 22:49:16', 'tom', '127.0.0.1', '/product/findAll.do', '63', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('263', '2020-04-26 22:51:11', 'tom', '127.0.0.1', '/product/findAll.do', '73', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('264', '2020-04-26 22:51:12', 'tom', '127.0.0.1', '/product/findAll.do', '11', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('265', '2020-04-26 22:52:10', 'tom', '127.0.0.1', '/product/findAll.do', '7', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('266', '2020-04-26 22:52:29', 'tom', '127.0.0.1', '/product/findAll.do', '11', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('267', '2020-04-26 22:53:59', 'tom', '127.0.0.1', '/product/findAll.do', '12', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('268', '2020-04-26 22:54:11', 'tom', '127.0.0.1', '/product/findAll.do', '9', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('269', '2020-04-26 22:55:22', 'tom', '127.0.0.1', '/product/findAll.do', '79', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('270', '2020-04-26 22:55:27', 'tom', '127.0.0.1', '/product/findAll.do', '11', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('271', '2020-04-26 22:55:33', 'tom', '127.0.0.1', '/product/findAll.do', '0', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('272', '2020-04-26 22:56:45', 'tom', '127.0.0.1', '/product/findAll.do', '80', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('273', '2020-04-26 22:56:48', 'tom', '127.0.0.1', '/product/findAll.do', '11', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('274', '2020-04-26 22:59:40', 'tom', '127.0.0.1', '/product/findAll.do', '129', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('275', '2020-04-26 22:59:43', 'tom', '127.0.0.1', '/product/findAll.do', '9', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('276', '2020-04-26 23:00:52', 'tom', '127.0.0.1', '/product/findAll.do', '74', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('277', '2020-04-26 23:00:57', 'tom', '127.0.0.1', '/product/findAll.do', '1', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('278', '2020-04-26 23:02:23', 'tom', '127.0.0.1', '/product/findAll.do', '95', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('279', '2020-04-26 23:02:36', 'tom', '127.0.0.1', '/product/findAll.do', '1', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('280', '2020-04-26 23:16:06', 'tom', '127.0.0.1', '/product/findAll.do', '101', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('281', '2020-04-26 23:16:34', 'tom', '127.0.0.1', '/product/save.do', '16', '[类名]com.xumeng.controller.ProductController[方法名]save');
INSERT INTO `syslog` VALUES ('282', '2020-04-26 23:16:34', 'tom', '127.0.0.1', '/product/findAll.do', '11', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('283', '2020-04-27 08:45:34', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '81', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('284', '2020-04-27 08:45:37', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '9', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('285', '2020-04-27 08:45:42', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '0', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('286', '2020-04-27 08:49:25', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '68', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('287', '2020-04-27 08:49:30', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('288', '2020-04-27 08:52:25', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '7', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('289', '2020-04-27 08:55:04', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '5', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('290', '2020-04-27 08:55:40', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('291', '2020-04-27 08:56:15', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '5', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('292', '2020-04-27 08:57:43', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '69', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('293', '2020-04-27 08:57:45', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('294', '2020-04-27 09:07:49', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '71', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('295', '2020-04-27 09:07:53', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '7', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('296', '2020-04-27 09:07:57', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '6242', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('297', '2020-04-27 09:10:33', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '7', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('298', '2020-04-27 09:11:03', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '7', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('299', '2020-04-27 09:11:39', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '4', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('300', '2020-04-27 09:11:48', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '7', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('301', '2020-04-27 09:12:10', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '5', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('302', '2020-04-27 09:12:59', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '7', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('303', '2020-04-27 09:13:29', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '4', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('304', '2020-04-27 09:13:34', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '33312', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('305', '2020-04-27 09:14:54', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '5', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('306', '2020-04-27 09:15:21', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '4', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('307', '2020-04-27 09:15:25', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '10947', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('308', '2020-04-27 09:17:32', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '70', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('309', '2020-04-27 09:17:35', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '7', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('310', '2020-04-27 09:17:40', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '7159', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('311', '2020-04-27 09:20:39', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('312', '2020-04-27 09:21:06', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '7', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('313', '2020-04-27 09:22:36', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '70', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('314', '2020-04-27 09:22:40', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('315', '2020-04-27 09:22:44', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '3650', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('316', '2020-04-27 09:25:17', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '72', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('317', '2020-04-27 09:25:21', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '9', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('318', '2020-04-27 09:28:31', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '6', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('319', '2020-04-27 09:28:39', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '6270', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('320', '2020-04-27 09:31:55', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '69', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('321', '2020-04-27 09:31:59', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('322', '2020-04-27 09:32:03', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '0', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('323', '2020-04-27 09:36:26', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '74', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('324', '2020-04-27 09:36:32', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('325', '2020-04-27 09:36:37', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '2474', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('326', '2020-04-27 09:40:10', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '68', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('327', '2020-04-27 09:40:12', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('328', '2020-04-27 09:40:17', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '3489', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('329', '2020-04-27 09:40:40', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '5', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('330', '2020-04-27 09:40:45', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '1884', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('331', '2020-04-27 09:44:52', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '70', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('332', '2020-04-27 09:44:55', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '9', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('333', '2020-04-27 09:44:59', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '0', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('334', '2020-04-27 09:45:24', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '3380', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('335', '2020-04-27 09:49:58', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '5', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('336', '2020-04-27 09:50:21', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '7', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('337', '2020-04-27 09:50:59', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '5', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('338', '2020-04-27 09:51:03', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '2253', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('339', '2020-04-27 09:55:52', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '72', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('340', '2020-04-27 09:55:56', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '0', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('341', '2020-04-27 09:56:39', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '75', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('342', '2020-04-27 09:56:44', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '0', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('343', '2020-04-27 09:56:58', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('344', '2020-04-27 09:57:04', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '6', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('345', '2020-04-27 09:57:07', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '0', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('346', '2020-04-27 09:57:39', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('347', '2020-04-27 09:57:43', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '0', '[类名]com.xumeng.controller.ProductController[方法名]delete');
INSERT INTO `syslog` VALUES ('348', '2020-04-27 09:59:16', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '5', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('349', '2020-04-27 10:00:10', 'tom', '0:0:0:0:0:0:0:1', '/product/findAll.do', '70', '[类名]com.xumeng.controller.ProductController[方法名]findAll');
INSERT INTO `syslog` VALUES ('350', '2020-04-27 10:00:14', 'tom', '0:0:0:0:0:0:0:1', '/product/delete.do', '0', '[类名]com.xumeng.controller.ProductController[方法名]delete');

-- ----------------------------
-- Table structure for `traveller`
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL,
  `credentialsNum` varchar(50) DEFAULT NULL,
  `travellerType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('1', '张龙', '男', '13333333333', '0', '123456789009876543', '0');
INSERT INTO `traveller` VALUES ('2', '张小龙', '男', '15555555555', '0', '987654321123456789', '1');
INSERT INTO `traveller` VALUES ('3', '一一', '女', '18811111111', '0', '134567984657891613', '1');
INSERT INTO `traveller` VALUES ('4', '二二', '男', '12522222222', '0', '123456798798624597', '0');
INSERT INTO `traveller` VALUES ('5', '三三', '女', '18733333333', '1', '879465489744654496', '1');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'ahxumm@163.com', 'tom', '$2a$10$KJ1vclec.OEfOLoHtiqxmOa/Dl/Xj6JxoeDo29PXFvL4EGD85ki/y', '888888', '1');
INSERT INTO `users` VALUES ('2', 'boss@126.com', 'boss', '$2a$10$1pUH3ZLntSC8Tb81qGYuquaDEbk4e/KVxbz05vabD3l1YOmVNUVOi', '666666', '1');
INSERT INTO `users` VALUES ('3', 'jack@qq.com', 'jack', '$2a$10$AV7tgtkdhKn97.kF8kNMTu6ZnPLc9MieJhb9lgwKkmCuU10YP8Exy', '689999', '1');
INSERT INTO `users` VALUES ('4', 'lili@qq.com', 'lili', '$2a$10$xf9tUFNHXIp01o62.t.z8.tzx6A36/SvW4Z2v67.84qDjy03sWPem', '000000000', '1');
INSERT INTO `users` VALUES ('5', 'dav@163.com', 'dav', '$2a$10$sKdttuqh8jDp8dKn0cPzZ.Jw1WpJTbFrp8oiF1uzKSc99Vlp/EM56', '11111111', '1');
INSERT INTO `users` VALUES ('6', 'bob@qwe.com', 'bob', '$2a$10$gjWpDlip/0KPRcuDuzxQhORBawBIIf.LJuFcvK3bNuwFa4ZpBOxLm', '132', '1');

-- ----------------------------
-- Table structure for `users_role`
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `userId` int(11) NOT NULL DEFAULT '0',
  `roleId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('1', '1');
INSERT INTO `users_role` VALUES ('2', '1');
INSERT INTO `users_role` VALUES ('1', '2');
INSERT INTO `users_role` VALUES ('3', '2');
INSERT INTO `users_role` VALUES ('6', '3');
