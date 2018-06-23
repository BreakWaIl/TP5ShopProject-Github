/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : tp5_shop

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-06-23 18:32:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sh_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `sh_attribute`;
CREATE TABLE `sh_attribute` (
  `attr_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` tinyint(4) DEFAULT NULL,
  `attr_name` varchar(30) DEFAULT '',
  `attr_type` tinyint(4) DEFAULT '0' COMMENT '0-唯一属性，1-单选属性',
  `attr_input_type` tinyint(4) DEFAULT '0' COMMENT '0-手工输入，1-列表选择',
  `attr_values` varchar(255) DEFAULT '',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商品属性表';

-- ----------------------------
-- Records of sh_attribute
-- ----------------------------
INSERT INTO `sh_attribute` VALUES ('1', '1', '显示器尺寸', '1', '1', '12\"|13\"|14\"|15.6\"|17\"', '1528890638', '1528892413');
INSERT INTO `sh_attribute` VALUES ('2', '1', '硬盘大小', '1', '1', '128G|256G|512G|', '1528890723', '1528890723');
INSERT INTO `sh_attribute` VALUES ('4', '3', '颜色', '1', '1', '深空灰|银色|磨砂灰|中国红', '1529050928', '1529050928');
INSERT INTO `sh_attribute` VALUES ('6', '2', 'dpi', '1', '1', '3500|6500|18000', '1529500460', '1529500460');

-- ----------------------------
-- Table structure for `sh_attr_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `sh_attr_attribute`;
CREATE TABLE `sh_attr_attribute` (
  `attr_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` tinyint(4) DEFAULT NULL,
  `attr_name` varchar(30) DEFAULT '',
  `attr_type` tinyint(4) DEFAULT '0' COMMENT '0-唯一属性，1-单选属性',
  `attr_input_type` tinyint(4) DEFAULT '0' COMMENT '0-手工输入，1-列表选择',
  `attr_values` varchar(255) DEFAULT '',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品属性表';

-- ----------------------------
-- Records of sh_attr_attribute
-- ----------------------------
INSERT INTO `sh_attr_attribute` VALUES ('1', '1', '显示器尺寸', '1', '1', '12\"|13\"|14\"|15.6\"|17\"', '1528890638', '1528892413');
INSERT INTO `sh_attr_attribute` VALUES ('2', '1', '硬盘大小', '1', '1', '128G|256G|512G|', '1528890723', '1528890723');
INSERT INTO `sh_attr_attribute` VALUES ('4', '3', '颜色', '1', '1', '深空灰|银色|磨砂灰|中国红', '1529050928', '1529050928');

-- ----------------------------
-- Table structure for `sh_auth`
-- ----------------------------
DROP TABLE IF EXISTS `sh_auth`;
CREATE TABLE `sh_auth` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限表[''权限表auth_id''对应角色表auth_id_list]',
  `auth_name` varchar(40) DEFAULT '',
  `auth_c` varchar(40) DEFAULT '',
  `auth_a` varchar(40) DEFAULT '',
  `pid` int(11) DEFAULT '0',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sh_auth
-- ----------------------------
INSERT INTO `sh_auth` VALUES ('4', '商品权限', '', '', '0', '1528716964', '1528716964');
INSERT INTO `sh_auth` VALUES ('5', '商品添加', 'Goods', 'add', '4', '1528719209', '1528719209');
INSERT INTO `sh_auth` VALUES ('6', '角色管理', '', '', '0', '1528886632', '1528886632');
INSERT INTO `sh_auth` VALUES ('7', '角色列表', 'role', 'index', '6', '1528886659', '1528886659');
INSERT INTO `sh_auth` VALUES ('8', '控制账户可用', 'user', 'ajaxchangeactive', '7', '1528886726', '1528886726');
INSERT INTO `sh_auth` VALUES ('9', '超级管理员', '', '', '0', '1528897081', '1528897081');
INSERT INTO `sh_auth` VALUES ('10', '管理员添加', 'User', 'add', '9', '1528897170', '1528897170');

-- ----------------------------
-- Table structure for `sh_cart`
-- ----------------------------
DROP TABLE IF EXISTS `sh_cart`;
CREATE TABLE `sh_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT '0',
  `goods_attr_ids` varchar(80) DEFAULT '',
  `goods_number` int(11) DEFAULT '0',
  `member_id` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of sh_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `sh_category`
-- ----------------------------
DROP TABLE IF EXISTS `sh_category`;
CREATE TABLE `sh_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(40) DEFAULT '',
  `pid` smallint(6) DEFAULT '0',
  `is_show` tinyint(4) DEFAULT '1' COMMENT '1-显示 0-不显示',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品类型表';

-- ----------------------------
-- Records of sh_category
-- ----------------------------
INSERT INTO `sh_category` VALUES ('2', 'PC', '0', '1', '1528896372', '1528896383');
INSERT INTO `sh_category` VALUES ('3', '鼠标', '0', '1', '1528983899', '1528983899');
INSERT INTO `sh_category` VALUES ('4', '手机', '0', '1', '1529050802', '1529050802');

-- ----------------------------
-- Table structure for `sh_goods`
-- ----------------------------
DROP TABLE IF EXISTS `sh_goods`;
CREATE TABLE `sh_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(40) DEFAULT '',
  `goods_sn` varchar(150) DEFAULT '',
  `goods_price` decimal(10,2) DEFAULT NULL COMMENT 'decimal(10,2)',
  `goods_number` int(11) DEFAULT '0',
  `type_id` smallint(6) DEFAULT '0',
  `cat_id` smallint(6) DEFAULT '0',
  `goods_img` text,
  `goods_middle` text,
  `goods_thumb` text,
  `add_time` int(11) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '是否在回站 0-不在回收站 1-在回收站',
  `is_sale` tinyint(4) DEFAULT '1' COMMENT '默认为1： 0-未上架 1-已上架',
  `is_new` tinyint(4) DEFAULT '1' COMMENT '默认为1： 0-不是新品 1-是新品',
  `is_best` tinyint(4) DEFAULT '1' COMMENT '默认为1： 0-不是推荐 1-是推荐',
  `is_hot` tinyint(4) DEFAULT '1' COMMENT '默认为1： 0-不是热卖 1-是热卖商品',
  `goods_desc` text,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';

-- ----------------------------
-- Records of sh_goods
-- ----------------------------
INSERT INTO `sh_goods` VALUES ('7', 'phone', '1806190910115b2900b3ad5c6', '4523.00', '122', '3', '4', '[\"20180619\\/e685525f3dbe6068a46a61a231ca2440.jpg\",\"20180619\\/16f212a4efe739e51233e2eb7efde69f.jpg\",\"20180619\\/2d13c9121383239fb4283505f3861467.jpg\"]', '[\"20180619\\/middle_e685525f3dbe6068a46a61a231ca2440.jpg\",\"20180619\\/middle_16f212a4efe739e51233e2eb7efde69f.jpg\",\"20180619\\/middle_2d13c9121383239fb4283505f3861467.jpg\"]', '[\"20180619\\/small_e685525f3dbe6068a46a61a231ca2440.jpg\",\"20180619\\/small_16f212a4efe739e51233e2eb7efde69f.jpg\",\"20180619\\/small_2d13c9121383239fb4283505f3861467.jpg\"]', null, '0', '1', '1', '1', '1', '<p>phone&nbsp;</p>', '1529413811', '1529413811');
INSERT INTO `sh_goods` VALUES ('8', 'RAZER MAMBA', '1806190917305b29026ae8714', '499.00', '2311', '2', '3', '[\"20180619\\/445aadd02f3e66d5160b9c6441e59c63.jpg\",\"20180619\\/39739de147e84d179b1f2000bbf32775.jpg\"]', '[\"20180619\\/middle_445aadd02f3e66d5160b9c6441e59c63.jpg\",\"20180619\\/middle_39739de147e84d179b1f2000bbf32775.jpg\"]', '[\"20180619\\/small_445aadd02f3e66d5160b9c6441e59c63.jpg\",\"20180619\\/small_39739de147e84d179b1f2000bbf32775.jpg\"]', null, '0', '1', '1', '1', '1', '<p>RAZER MAMBA</p>', '1529414250', '1529414250');
INSERT INTO `sh_goods` VALUES ('9', 'iphone', '1806190939425b29079e5ad73', '6324.00', '128', '3', '4', '[\"20180619\\/9ef94298bdff4c09c9e832570eec282a.jpg\"]', '[\"20180619\\/middle_9ef94298bdff4c09c9e832570eec282a.jpg\"]', '[\"20180619\\/small_9ef94298bdff4c09c9e832570eec282a.jpg\"]', null, '0', '1', '1', '1', '1', '<p>iphone</p>', '1529415582', '1529415582');
INSERT INTO `sh_goods` VALUES ('10', 'MOTO', '1806190940285b2907ccbeb20', '3542.00', '231', '3', '4', '[\"20180619\\/4f10517bf4431ecaf4ce7a8849a717b7.jpg\"]', '[\"20180619\\/middle_4f10517bf4431ecaf4ce7a8849a717b7.jpg\"]', '[\"20180619\\/small_4f10517bf4431ecaf4ce7a8849a717b7.jpg\"]', null, '0', '1', '1', '1', '1', '<p>MOTO</p><p><br/></p>', '1529415628', '1529415628');
INSERT INTO `sh_goods` VALUES ('11', 'Macbook Pro 2017', '1806200828155b2a485fa7074', '16534.00', '10', '1', '2', '[\"20180620\\/f96fcf15b60c192affa0cd06952b4721.jpg\",\"20180620\\/3286f2d817f9fa3a61d9f92278d08c71.jpg\",\"20180620\\/b7fb25fe56da790a0df69a7a7c294dc9.jpg\",\"20180620\\/66dee1e01c066ae55f52e4a09f58e24d.jpg\",\"20180620\\/f4815d8d4bd9e3c451337e9f520a71e9.jpg\",\"20180620\\/5a33388b5830ee1f0bbe5b5cf12a5f5d.jpg\",\"20180620\\/9fbc68cb56bf103eb227260da55374af.jpg\"]', '[\"20180620\\/middle_f96fcf15b60c192affa0cd06952b4721.jpg\",\"20180620\\/middle_3286f2d817f9fa3a61d9f92278d08c71.jpg\",\"20180620\\/middle_b7fb25fe56da790a0df69a7a7c294dc9.jpg\",\"20180620\\/middle_66dee1e01c066ae55f52e4a09f58e24d.jpg\",\"20180620\\/middle_f4815d8d4bd9e3c451337e9f520a71e9.jpg\",\"20180620\\/middle_5a33388b5830ee1f0bbe5b5cf12a5f5d.jpg\",\"20180620\\/middle_9fbc68cb56bf103eb227260da55374af.jpg\"]', '[\"20180620\\/small_f96fcf15b60c192affa0cd06952b4721.jpg\",\"20180620\\/small_3286f2d817f9fa3a61d9f92278d08c71.jpg\",\"20180620\\/small_b7fb25fe56da790a0df69a7a7c294dc9.jpg\",\"20180620\\/small_66dee1e01c066ae55f52e4a09f58e24d.jpg\",\"20180620\\/small_f4815d8d4bd9e3c451337e9f520a71e9.jpg\",\"20180620\\/small_5a33388b5830ee1f0bbe5b5cf12a5f5d.jpg\",\"20180620\\/small_9fbc68cb56bf103eb227260da55374af.jpg\"]', null, '0', '1', '1', '1', '1', '', '1529497695', '1529497695');
INSERT INTO `sh_goods` VALUES ('12', 'RAZER blade MOUSE ', '1806200916505b2a53c228730', '234.00', '8', '2', '3', '[\"20180620\\/e88d1949dfd35875891a1331ab693b13.jpg\"]', '[\"20180620\\/middle_e88d1949dfd35875891a1331ab693b13.jpg\"]', '[\"20180620\\/small_e88d1949dfd35875891a1331ab693b13.jpg\"]', null, '0', '1', '1', '1', '1', '', '1529500610', '1529500610');
INSERT INTO `sh_goods` VALUES ('13', 'Macbook Pro', '1806210849285b2af61859073', '14688.00', '2351', '1', '2', '[\"20180621\\/09b293fc59261cc2fc9d06fa2e8803e1.jpg\",\"20180621\\/4d9c43d782d1207d7ee61e288a10a484.jpg\",\"20180621\\/0644f18d9c5f80878193651a95e10413.jpg\"]', '[\"20180621\\/middle_09b293fc59261cc2fc9d06fa2e8803e1.jpg\",\"20180621\\/middle_4d9c43d782d1207d7ee61e288a10a484.jpg\",\"20180621\\/middle_0644f18d9c5f80878193651a95e10413.jpg\"]', '[\"20180621\\/small_09b293fc59261cc2fc9d06fa2e8803e1.jpg\",\"20180621\\/small_4d9c43d782d1207d7ee61e288a10a484.jpg\",\"20180621\\/small_0644f18d9c5f80878193651a95e10413.jpg\"]', null, '0', '1', '1', '1', '1', '<p><img src=\"/ueditor/php/upload/image/20180621/1529542133138880.jpg\" style=\"\" title=\"1529542133138880.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20180621/1529542133117093.jpg\" style=\"\" title=\"1529542133117093.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20180621/1529542133463495.jpg\" style=\"\" title=\"1529542133463495.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20180621/1529542133999886.jpg\" style=\"\" title=\"1529542133999886.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20180621/1529542134345932.jpg\" style=\"\" title=\"1529542134345932.jpg\"/></p><p><img src=\"/ueditor/php/upload/image/20180621/1529542134134689.jpg\" style=\"\" title=\"1529542134134689.jpg\"/></p><p><br/></p>', '1529542168', '1529542168');

-- ----------------------------
-- Table structure for `sh_goods_attr`
-- ----------------------------
DROP TABLE IF EXISTS `sh_goods_attr`;
CREATE TABLE `sh_goods_attr` (
  `goods_attr_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL,
  `attr_id` smallint(5) unsigned NOT NULL,
  `attr_value` varchar(255) DEFAULT '',
  `attr_price` decimal(10,2) DEFAULT NULL,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`goods_attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='商品属性表';

-- ----------------------------
-- Records of sh_goods_attr
-- ----------------------------
INSERT INTO `sh_goods_attr` VALUES ('3', '7', '4', '深空灰', '123.00', '1529413811', '1529413811');
INSERT INTO `sh_goods_attr` VALUES ('4', '9', '4', '银色', '324.00', '1529415582', '1529415582');
INSERT INTO `sh_goods_attr` VALUES ('5', '10', '4', '银色', '223.00', '1529415628', '1529415628');
INSERT INTO `sh_goods_attr` VALUES ('6', '11', '1', '13\"', '12.00', '1529497695', '1529497695');
INSERT INTO `sh_goods_attr` VALUES ('7', '11', '2', '512G', '435.00', '1529497695', '1529497695');
INSERT INTO `sh_goods_attr` VALUES ('8', '12', '6', '3500', '23.00', '1529500610', '1529500610');
INSERT INTO `sh_goods_attr` VALUES ('9', '12', '6', '3500', '34.00', '1529500610', '1529500610');
INSERT INTO `sh_goods_attr` VALUES ('10', '12', '6', '18000', '56.00', '1529500610', '1529500610');
INSERT INTO `sh_goods_attr` VALUES ('11', '13', '1', '12\"', '500.00', '1529542168', '1529542168');
INSERT INTO `sh_goods_attr` VALUES ('12', '13', '1', '13\"', '600.00', '1529542168', '1529542168');
INSERT INTO `sh_goods_attr` VALUES ('13', '13', '1', '14\"', '700.00', '1529542168', '1529542168');
INSERT INTO `sh_goods_attr` VALUES ('14', '13', '1', '15.6\"', '800.00', '1529542168', '1529542168');
INSERT INTO `sh_goods_attr` VALUES ('15', '13', '1', '17\"', '900.00', '1529542168', '1529542168');
INSERT INTO `sh_goods_attr` VALUES ('16', '13', '2', '128G', '1000.00', '1529542168', '1529542168');
INSERT INTO `sh_goods_attr` VALUES ('17', '13', '2', '256G', '2000.00', '1529542168', '1529542168');
INSERT INTO `sh_goods_attr` VALUES ('18', '13', '2', '512G', '3000.00', '1529542168', '1529542168');

-- ----------------------------
-- Table structure for `sh_member`
-- ----------------------------
DROP TABLE IF EXISTS `sh_member`;
CREATE TABLE `sh_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT '',
  `password` char(32) DEFAULT '',
  `email` varchar(50) DEFAULT '',
  `phone` varchar(20) DEFAULT NULL,
  `openid` varchar(50) DEFAULT '',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of sh_member
-- ----------------------------
INSERT INTO `sh_member` VALUES ('1', 'admin', '140817ad5c527811d9befcc9c9cbd514', '17887932352@163.com', '17887932352', '', '1529414648', '1529414648');

-- ----------------------------
-- Table structure for `sh_order`
-- ----------------------------
DROP TABLE IF EXISTS `sh_order`;
CREATE TABLE `sh_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(80) DEFAULT NULL,
  `receiver` varchar(30) DEFAULT NULL,
  `address` varchar(80) DEFAULT '',
  `tel` char(15) DEFAULT NULL,
  `zcode` varchar(6) DEFAULT NULL COMMENT '邮编',
  `total_price` decimal(10,2) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未付款 ,1-已付款',
  `send_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' 0-未发货 ， 1-已发货 ，2-已收货 ,3-退货中 4-退货成功',
  `ali_order_id` varchar(255) NOT NULL DEFAULT '' COMMENT '支付成功支付宝返回的订单号',
  `order_time` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT '',
  `number` varchar(100) DEFAULT '' COMMENT '物流公司',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of sh_order
-- ----------------------------
INSERT INTO `sh_order` VALUES ('11', '2018062215296746435b2cfb935ab2d', '曼巴mouse', '测试地址', '1 318-215-9739', '221600', '1028.00', '1', '1', '0', '2018062221001004500200460527', null, '', '', '1529674643', '1529674643');
INSERT INTO `sh_order` VALUES ('12', '2018062215296748455b2cfc5d2b960', 'Moto', '测试地址', '1 318-215-9739', '221600', '7530.00', '1', '0', '0', '', null, '', '', '1529674845', '1529674845');
INSERT INTO `sh_order` VALUES ('18', '2018062215296765505b2d03061678f', 'mbptest', '测试地址', '1 318-215-9739', '221600', '16981.00', '1', '0', '0', '', null, '', '', '1529676550', '1529676550');

-- ----------------------------
-- Table structure for `sh_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `sh_order_goods`;
CREATE TABLE `sh_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(100) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_attr_id` varchar(30) DEFAULT NULL,
  `goods_number` int(5) DEFAULT NULL,
  `goods_price` decimal(10,2) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='订单商品表';

-- ----------------------------
-- Records of sh_order_goods
-- ----------------------------
INSERT INTO `sh_order_goods` VALUES ('1', null, '10', '', '1', '0.00', '1529672318', '1529672318');
INSERT INTO `sh_order_goods` VALUES ('2', null, '9', '', '2', '0.00', '1529672318', '1529672318');
INSERT INTO `sh_order_goods` VALUES ('3', null, '8', '', '3', '0.00', '1529672318', '1529672318');
INSERT INTO `sh_order_goods` VALUES ('4', null, '7', '', '1', '0.00', '1529672318', '1529672318');
INSERT INTO `sh_order_goods` VALUES ('5', null, '11', '', '1', '0.00', '1529672318', '1529672318');
INSERT INTO `sh_order_goods` VALUES ('6', null, '13', '11,16', '1', '0.00', '1529672318', '1529672318');
INSERT INTO `sh_order_goods` VALUES ('7', null, '13', '12,16', '1', '0.00', '1529672318', '1529672318');
INSERT INTO `sh_order_goods` VALUES ('8', null, '8', '', '4', '0.00', '1529672385', '1529672385');
INSERT INTO `sh_order_goods` VALUES ('9', null, '8', '', '4', '0.00', '1529672419', '1529672419');
INSERT INTO `sh_order_goods` VALUES ('10', null, '8', '', '4', '0.00', '1529672612', '1529672612');
INSERT INTO `sh_order_goods` VALUES ('11', null, '8', '', '4', '0.00', '1529673375', '1529673375');
INSERT INTO `sh_order_goods` VALUES ('12', '2018062215296743435b2cfa670ee7a', '8', '', '11', '5489.00', null, null);
INSERT INTO `sh_order_goods` VALUES ('13', '2018062215296746435b2cfb935ab2d', '12', '8', '4', '1028.00', null, null);
INSERT INTO `sh_order_goods` VALUES ('14', '2018062215296748455b2cfc5d2b960', '10', '5', '2', '7530.00', null, null);
INSERT INTO `sh_order_goods` VALUES ('15', '2018062215296752355b2cfde3f372b', '9', '4', '1', '6648.00', '1529675236', '1529675236');
INSERT INTO `sh_order_goods` VALUES ('16', null, '9', '4', '1', '0.00', '1529675326', '1529675326');
INSERT INTO `sh_order_goods` VALUES ('17', '2018062215296757915b2d000f99395', '11', '6,7', '1', '0.00', '1529675791', '1529675791');
INSERT INTO `sh_order_goods` VALUES ('18', '2018062215296759255b2d0095a6a4a', '13', '11,16', '1', '0.00', '1529675925', '1529675925');
INSERT INTO `sh_order_goods` VALUES ('19', '2018062215296761625b2d0182d00dd', '13', '11,16', '1', '0.00', '1529676162', '1529676162');
INSERT INTO `sh_order_goods` VALUES ('20', '2018062215296765505b2d03061678f', '11', '6,7', '1', '16981.00', '1529676550', '1529676550');

-- ----------------------------
-- Table structure for `sh_role`
-- ----------------------------
DROP TABLE IF EXISTS `sh_role`;
CREATE TABLE `sh_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色表 [‘角色表role_id对应用户表role_id’]',
  `role_name` varchar(40) DEFAULT '',
  `auth_id_list` varchar(100) DEFAULT '' COMMENT '角色表auth_id_list对应权限表auth_id',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sh_role
-- ----------------------------
INSERT INTO `sh_role` VALUES ('2', '商品添加', '4,5', '1528723302', '1528723302');
INSERT INTO `sh_role` VALUES ('3', '超级管理员', '9,10', '1528897193', '1528897193');

-- ----------------------------
-- Table structure for `sh_type`
-- ----------------------------
DROP TABLE IF EXISTS `sh_type`;
CREATE TABLE `sh_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(40) DEFAULT '',
  `mark` text,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of sh_type
-- ----------------------------
INSERT INTO `sh_type` VALUES ('1', '笔记本', '                   ', '1528888386', '1528888386');
INSERT INTO `sh_type` VALUES ('2', '鼠标', '    鼠标               ', '1528983823', '1528983823');
INSERT INTO `sh_type` VALUES ('3', '手机', '                   ', '1529050685', '1529050685');

-- ----------------------------
-- Table structure for `sh_type_bk`
-- ----------------------------
DROP TABLE IF EXISTS `sh_type_bk`;
CREATE TABLE `sh_type_bk` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(40) DEFAULT '',
  `mark` text,
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sh_type_bk
-- ----------------------------
INSERT INTO `sh_type_bk` VALUES ('1', '笔记本', '                   ', '1528888386', '1528888386');
INSERT INTO `sh_type_bk` VALUES ('2', '鼠标', '    鼠标               ', '1528983823', '1528983823');
INSERT INTO `sh_type_bk` VALUES ('3', '手机', '                   ', '1529050685', '1529050685');

-- ----------------------------
-- Table structure for `sh_user`
-- ----------------------------
DROP TABLE IF EXISTS `sh_user`;
CREATE TABLE `sh_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表',
  `username` varchar(40) DEFAULT '',
  `password` char(32) DEFAULT '',
  `nickname` varchar(40) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT '1' COMMENT '0-账号禁用(封号），1-账号可用',
  `role_id` tinyint(4) DEFAULT '0' COMMENT '用户表role_id对应角色表role_id',
  `create_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of sh_user
-- ----------------------------
INSERT INTO `sh_user` VALUES ('1', 'admin', '140817ad5c527811d9befcc9c9cbd514', null, '1', '0', '1528611034', '1528611034');
INSERT INTO `sh_user` VALUES ('2', 'root', '174eb5fa3f54b7d509bdf519cd7ccf9d', null, '1', '0', '1528611035', '1528611035');
