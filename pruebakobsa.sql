/*
Navicat MySQL Data Transfer

Source Server         : mysql_lh
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : pruebakobsa

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-08-09 08:02:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for trabajador
-- ----------------------------
DROP TABLE IF EXISTS `trabajador`;
CREATE TABLE `trabajador` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nomtra` varchar(255) DEFAULT NULL,
  `apepattra` varchar(255) DEFAULT NULL,
  `apemattra` varchar(255) DEFAULT NULL,
  `dirtra` varchar(255) DEFAULT NULL,
  `teltra` varchar(255) DEFAULT NULL,
  `emailtra` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trabajador
-- ----------------------------
INSERT INTO `trabajador` VALUES ('1', 'juan jose', 'perez', 'rodriguez', 'av. desolacion 666', '987654321', 'correo@correo.com', 'foto.jpg');
INSERT INTO `trabajador` VALUES ('2', 'pedro', 'ramirez', 'soto', 'av. izaguirre 321', '999888777', 'correo2@correo.com', 'foto2.jpg');
INSERT INTO `trabajador` VALUES ('3', 'Julio', 'Velasco', 'Rodriguez', 'Av. Canada 333', '888888', 'correquetealcanzan@correo.com', null);

-- ----------------------------
-- Procedure structure for sp_getWorker
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_getWorker`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getWorker`(
	__id INT
)
BEGIN
	SELECT * 
	FROM trabajador
	WHERE
		id= __id
	;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_getWorkers
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_getWorkers`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getWorkers`()
BEGIN
	SELECT * 
	FROM trabajador;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_newWorker
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_newWorker`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_newWorker`(
	__nomtra VARCHAR(255)
	,__apepattra VARCHAR(255)
	,__apemattra VARCHAR(255)
	,__dirtra VARCHAR(255)
	,__teltra VARCHAR(255)
	,__emailtra VARCHAR(255)
)
BEGIN
	INSERT INTO trabajador(nomtra,apepattra,apemattra,dirtra,teltra,emailtra) 
	VALUES(__nomtra,__apepattra,__apemattra,__dirtra,__teltra,__emailtra);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_updWorker
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_updWorker`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updWorker`(
	__id INT
	,__nomtra VARCHAR(255)
	,__apepattra VARCHAR(255)
	,__apemattra VARCHAR(255)
	,__dirtra VARCHAR(255)
	,__teltra VARCHAR(255)
	,__emailtra VARCHAR(255)
)
BEGIN
	UPDATE trabajador
	SET 
		nomtra = __nomtra
		,apepattra = __apepattra
		,apemattra = __apemattra
		,dirtra = __dirtra
		,teltra = __teltra
		,emailtra = __emailtra
	WHERE
		id= __id
	;
END
;;
DELIMITER ;
