/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2015-07-12 10:16:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `info_article`
-- ----------------------------
DROP TABLE IF EXISTS `info_article`;
CREATE TABLE `info_article` (
  `a_id` int(11) NOT NULL,
  `std_name` varchar(20) NOT NULL,
  `a_name` varchar(200) NOT NULL,
  `tutor_name` varchar(20) NOT NULL,
  `publisher
publisher
publisher
publisher` varchar(20) NOT NULL,
  `pub_date` date NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='研究生获优秀学位论文情况';

-- ----------------------------
-- Records of info_article
-- ----------------------------

-- ----------------------------
-- Table structure for `info_article_awards`
-- ----------------------------
DROP TABLE IF EXISTS `info_article_awards`;
CREATE TABLE `info_article_awards` (
  `a_id` int(11) NOT NULL,
  `win_year` year(4) NOT NULL,
  `awards` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`a_id`,`win_year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='研究生获优秀学位论文情况 的奖金';

-- ----------------------------
-- Records of info_article_awards
-- ----------------------------

-- ----------------------------
-- Table structure for `info_book`
-- ----------------------------
DROP TABLE IF EXISTS `info_book`;
CREATE TABLE `info_book` (
  `book_id` varchar(30) NOT NULL DEFAULT '',
  `book_name` varchar(50) NOT NULL,
  `p_date` date NOT NULL,
  `p_dep` varchar(200) NOT NULL,
  `publisher` varchar(20) NOT NULL,
  `pub_date` date NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出版教材，[book_id]是条码号';

-- ----------------------------
-- Records of info_book
-- ----------------------------

-- ----------------------------
-- Table structure for `info_book_writer`
-- ----------------------------
DROP TABLE IF EXISTS `info_book_writer`;
CREATE TABLE `info_book_writer` (
  `book_id` varchar(30) NOT NULL,
  `author` varchar(20) NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教材作者';

-- ----------------------------
-- Records of info_book_writer
-- ----------------------------

-- ----------------------------
-- Table structure for `info_checkup`
-- ----------------------------
DROP TABLE IF EXISTS `info_checkup`;
CREATE TABLE `info_checkup` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(50) NOT NULL,
  `c_date` date NOT NULL,
  `c_dep` varchar(50) NOT NULL,
  `c_advise` varchar(300) NOT NULL,
  `c_person` varchar(20) NOT NULL,
  `publisher` varchar(20) NOT NULL,
  `pub_date` date NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成果验收鉴定';

-- ----------------------------
-- Records of info_checkup
-- ----------------------------

-- ----------------------------
-- Table structure for `info_foreign`
-- ----------------------------
DROP TABLE IF EXISTS `info_foreign`;
CREATE TABLE `info_foreign` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(20) NOT NULL,
  `org_name` varchar(50) NOT NULL,
  `f_date` date NOT NULL,
  `content` varchar(1000) NOT NULL,
  `publisher` varchar(20) NOT NULL,
  `pub_date` date NOT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师境外进修（合作研究）情况';

-- ----------------------------
-- Records of info_foreign
-- ----------------------------

-- ----------------------------
-- Table structure for `info_group_build`
-- ----------------------------
DROP TABLE IF EXISTS `info_group_build`;
CREATE TABLE `info_group_build` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(20) NOT NULL,
  `birth` date NOT NULL,
  `degree` varchar(50) NOT NULL,
  `protech` varchar(50) NOT NULL,
  `p_id` varchar(11) NOT NULL,
  `adpost` varchar(50) NOT NULL,
  `publisher` varchar(20) NOT NULL,
  `pub_date` date NOT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团队建设';

-- ----------------------------
-- Records of info_group_build
-- ----------------------------

-- ----------------------------
-- Table structure for `info_ipr`
-- ----------------------------
DROP TABLE IF EXISTS `info_ipr`;
CREATE TABLE `info_ipr` (
  `ipr_id` int(11) NOT NULL AUTO_INCREMENT,
  `ipr_name` varchar(100) NOT NULL,
  `ipr_num` varchar(20) NOT NULL,
  `ipr_person` varchar(50) NOT NULL,
  `publisher` varchar(20) NOT NULL,
  `pub_date` date NOT NULL,
  PRIMARY KEY (`ipr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识产权';

-- ----------------------------
-- Records of info_ipr
-- ----------------------------

-- ----------------------------
-- Table structure for `info_meeting`
-- ----------------------------
DROP TABLE IF EXISTS `info_meeting`;
CREATE TABLE `info_meeting` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(50) NOT NULL,
  `m_time` datetime NOT NULL,
  `m_place` varchar(50) NOT NULL,
  `publisher` varchar(20) NOT NULL,
  `pub_date` date NOT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主办学术会议情况';

-- ----------------------------
-- Records of info_meeting
-- ----------------------------

-- ----------------------------
-- Table structure for `info_re_poj`
-- ----------------------------
DROP TABLE IF EXISTS `info_re_poj`;
CREATE TABLE `info_re_poj` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(120) NOT NULL,
  `r_serial` varchar(30) NOT NULL,
  `r_source` varchar(100) NOT NULL,
  `start_time` date NOT NULL,
  `end_time` date NOT NULL,
  `person` varchar(20) NOT NULL,
  `fee` double NOT NULL,
  `publisher` varchar(20) NOT NULL,
  `pub_date` date NOT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科研项目';

-- ----------------------------
-- Records of info_re_poj
-- ----------------------------

-- ----------------------------
-- Table structure for `info_support`
-- ----------------------------
DROP TABLE IF EXISTS `info_support`;
CREATE TABLE `info_support` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `std_name` varchar(20) NOT NULL,
  `poj_name` varchar(100) NOT NULL,
  `tutor_name` varchar(20) NOT NULL,
  `s_year` year(4) NOT NULL,
  `type` int(11) NOT NULL,
  `money` double NOT NULL,
  `publisher` varchar(20) NOT NULL,
  `pub_date` date NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='研究生获国家、江苏省科研创新计划资助情况';

-- ----------------------------
-- Records of info_support
-- ----------------------------

-- ----------------------------
-- Table structure for `info_train`
-- ----------------------------
DROP TABLE IF EXISTS `info_train`;
CREATE TABLE `info_train` (
  `year` year(4) NOT NULL,
  `role` int(11) NOT NULL,
  `rs_all` int(11) NOT NULL,
  `rs_overstd` int(11) NOT NULL,
  `degree_all` int(11) NOT NULL,
  `degree_overstd` int(11) NOT NULL,
  `publisher` varchar(20) NOT NULL,
  `pub_date` date NOT NULL,
  PRIMARY KEY (`year`,`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='研究生培养';

-- ----------------------------
-- Records of info_train
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `admin_id` varchar(20) NOT NULL,
  `admin_name` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员信息';

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('admin', '超级管理员', 'admin');

-- ----------------------------
-- Table structure for `tb_boardroom`
-- ----------------------------
DROP TABLE IF EXISTS `tb_boardroom`;
CREATE TABLE `tb_boardroom` (
  `b_id` varchar(20) NOT NULL,
  `b_size` int(11) NOT NULL,
  `media` int(2) DEFAULT '0' COMMENT '1表示有多媒体，0表示没有多媒体',
  `remarks` varchar(300) DEFAULT NULL,
  `b_address` varchar(20) DEFAULT NULL COMMENT '教室具体地址，可能与b_id相同',
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议室的信息';

-- ----------------------------
-- Records of tb_boardroom
-- ----------------------------
INSERT INTO `tb_boardroom` VALUES ('2001', '20', '1', '没有网络', '院办2001');
INSERT INTO `tb_boardroom` VALUES ('4001', '150', '1', '没有网络', '院办4001');

-- ----------------------------
-- Table structure for `tb_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `b_id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `order_date` date NOT NULL,
  `order_time` int(2) NOT NULL DEFAULT '0',
  `reason` varchar(1000) DEFAULT NULL,
  `college` varchar(50) NOT NULL,
  `approved` int(1) NOT NULL DEFAULT '0' COMMENT '是否被管理员批准',
  `state` int(1) NOT NULL DEFAULT '1',
  `back_reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`b_id`,`user_id`,`order_date`,`order_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预定会议室的订单';

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('2001', '10000', '2015-07-12', '1', '呵呵', '计算机', '1', '1', null);
INSERT INTO `tb_order` VALUES ('2001', '10000', '2015-07-12', '2', '哈哈', '计算机', '1', '1', null);

-- ----------------------------
-- Table structure for `tb_time`
-- ----------------------------
DROP TABLE IF EXISTS `tb_time`;
CREATE TABLE `tb_time` (
  `t_id` int(2) NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会议室可用时段的分段信息';

-- ----------------------------
-- Records of tb_time
-- ----------------------------
INSERT INTO `tb_time` VALUES ('1', '08:00:00', '10:00:00');
INSERT INTO `tb_time` VALUES ('2', '10:30:00', '12:00:00');
INSERT INTO `tb_time` VALUES ('3', '14:00:00', '17:00:00');
INSERT INTO `tb_time` VALUES ('4', '19:00:00', '22:00:00');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('10000', '王凡', '123456');
INSERT INTO `tb_user` VALUES ('10001', '郭肇强', '123456');
INSERT INTO `tb_user` VALUES ('10002', '董熙炎', '123456');
INSERT INTO `tb_user` VALUES ('10003', '杨守兴', '123456');
INSERT INTO `tb_user` VALUES ('10004', '李易峰', '123456');
INSERT INTO `tb_user` VALUES ('10005', '周杰伦', '123456');
INSERT INTO `tb_user` VALUES ('10006', '汪峰', '123456');
INSERT INTO `tb_user` VALUES ('10007', '刘德华', '123456');
INSERT INTO `tb_user` VALUES ('10008', '陈奕迅', '123456');
INSERT INTO `tb_user` VALUES ('10009', '那英', '123456');
INSERT INTO `tb_user` VALUES ('10010', '梁汉文', '123456');
INSERT INTO `tb_user` VALUES ('10011', '马化腾', '123456');
